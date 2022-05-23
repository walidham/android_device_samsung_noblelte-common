# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/noblelte-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Common Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/noblelte-common/overlay

ifneq (,$(wildcard lineage-sdk/ ))
DEVICE_PACKAGE_OVERLAYS += device/samsung/noblelte-common/overlay-lineage
else
DEVICE_PACKAGE_OVERLAYS += device/samsung/noblelte-common/overlay-aosp
endif

# This device is 560dpi.  However the platform doesn't
# currently contain all of the bitmaps at 640dpi density so
# we do this little trick to fall back to the xxhdpi version
# if the 560dpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.ecg.xml:system/etc/permissions/android.hardware.sensor.heartrate.ecg.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:system/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:system/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    device/samsung/noblelte-common/configs/permissions/com.samsung.permission.HRM_EXT.xml:system/etc/permissions/com.samsung.permission.HRM_EXT.xml \
    device/samsung/noblelte-common/configs/permissions/com.samsung.permission.SSENSOR.xml:system/etc/permissions/com.samsung.permission.SSENSOR.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/vendor/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:system/vendor/etc/mixer_paths_0.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0-audience.xml:system/vendor/etc/mixer_paths_0-audience.xml

PRODUCT_PACKAGES += \
    audio.primary.universal7420 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    tinymix \
    libtinycompress \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/vendor/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/mixer_paths_0.xml:system/vendor/etc/mixer_paths_0.xml \
    $(LOCAL_PATH)/configs/mixer_paths_0-audience.xml:system/vendor/etc/mixer_paths_0-audience.xml

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.bluetooth@1.0-impl \
	android.hardware.bluetooth@1.0-service \
	libbt-vendor

# Camera
PRODUCT_PACKAGES += \
    camera.exynos5 \
    libexynoscamera_shim \
    android.hardware.camera.provider@2.4-impl.zero \
    android.hardware.camera.provider@2.4-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/external_camera_config.xml:system/vendor/etc/external_camera_config.xml

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-impl \
    android.hardware.configstore@1.0-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# DTB
PRODUCT_PACKAGES += \
	dtbhtoolExynos

# Doze
PRODUCT_PACKAGES += \
    ZeroDoze

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/gps.xml:system/etc/gps.xml \
    $(LOCAL_PATH)/configs/sensors/lhd.conf:system/etc/lhd.conf

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprint.exynos5 \
    libbauthtzcommon_shim \
    android.hardware.biometrics.fingerprint@2.1-impl \
    android.hardware.biometrics.fingerprint@2.1-service

# Skeletons
PRODUCT_PACKAGES += \
	android.hidl.base@1.0

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl.zero \
	android.hardware.gnss@1.0-service

# Graphics
PRODUCT_PACKAGES += \
    gralloc.exynos5 \
    libhwc2on1adapter \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Init
PRORUCT_PACKAGES += \
    libinit_sec

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

#
# IRQs
#
PRODUCT_PACKAGES += \
	irqbalance

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/hardware/irqbalance/irqbalance.conf:system/vendor/etc/irqbalance.conf

#
# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    $(LOCAL_PATH)/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
    $(LOCAL_PATH)/idc/ft5x06_ts.idc:system/usr/idc/ft5x06_ts.idc \
    $(LOCAL_PATH)/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Keymaster
PRODUCT_PACKAGES += \
	keystore.exynos5 \
	android.hardware.keymaster@3.0-impl \
	android.hardware.keymaster@3.0-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.samsung

# Livedisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service.zero

# Memory
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:system/vendor/etc/media_profiles_V1_0.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf:system/vendor/etc/libnfc-sec-hal.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec.conf:system/vendor/etc/libnfc-sec.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/vendor/etc/libnfc-nci.conf

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

#
# Power
#
#PRODUCT_PACKAGES += \
#	android.hardware.power@1.0-service.zero

#PRODUCT_COPY_FILES += \
#	device/samsung/noblelte-common/hardware/power/profiles.xml:system/etc/power_profiles.xml

# OpenMAX-shims
PRODUCT_PACKAGES += \
    libui_shim \
    libExynosOMX_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/android.hardware.media.omx@1.0-service.rc:system/vendor/etc/init/android.hardware.media.omx@1.0-service.rc

# Radio
PRODUCT_PACKAGES += \
	libxml2 \
	libprotobuf-cpp-full \
	libreference-ril \
	libril \
	libsecril-client \
	libsecril-client-sap \
    libsecnativefeature \
	android.hardware.radio@1.0 \
	android.hardware.radio.deprecated@1.0 \
	modemloader


# Properties
TARGET_SYSTEM_PROP += device/samsung/noblelte-common/system.prop

# APN Definitions - override incomplete/broken lineageos version with Samsung version
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/telephony/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/configs/telephony/spn-conf.xml:system/etc/spn-conf.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.samsungexynos7420 \
    init.baseband.rc \
    init.battery.rc \
    init.gps.rc \
    init.power.rc \
    init.samsungexynos7420.rc \
    init.samsungexynos7420.usb.rc \
    init.wifi.rc \
    ueventd.samsungexynos7420.rc \
    init.rilchip.rc \
    init.rilchip.sh \
    init.rilchip.prop

# Remove AudioFX
PRODUCT_PACKAGES += \
    RemovePackages

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Filesystem tools for resizing system partition filesystem
PRODUCT_PACKAGES += \
	e2fsck_static \
	resize2fs_static

# S Pen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/ft5x06_ts.idc:/system/usr/idc/ft5x06_ts.idc \
    $(LOCAL_PATH)/configs/idc/sec_e-pen.idc:/system/usr/idc/sec_e-pen.idc

# Samsung
PRODUCT_PACKAGES += \
    SamsungServiceMode

# seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

# Sensorhub
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/android.hardware.sensors@1.0-service.rc:system/vendor/etc/init/android.hardware.sensors@1.0-service.rc

# Stagefright-shims
PRODUCT_PACKAGES += \
	libstagefright_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/mediaserver.rc:system/etc/init/mediaserver.rc

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

ifneq (,$(wildcard lineage-sdk/ ))
#
# Touch
#
PRODUCT_PACKAGES += \
	vendor.lineage.touch@1.0-service.samsung
endif

# Tools
PRODUCT_PACKAGES += \
	resetprop.zero   # Required for setting ro.*-properties for dual-SIM support

ifneq (,$(wildcard lineage-sdk/ ))
# Trust
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service
endif

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-impl \
    android.hardware.usb@1.0-service.basic

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2018-08-01

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.zero

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    libnetcmdiface \
    libwpa_client \
    macloader \
    wificond \
    wifiloader \
    wifilogd \
    wlutil \
    wpa_supplicant \
    wpa_supplicant.conf \
    android.hardware.wifi@1.0-impl \
    android.hardware.wifi@1.0-service
	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/filter_ie:system/vendor/etc/wifi/filter_ie
	

# Ubuntu Overlay Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/halium/70-noblelte.rules:system/halium/lib/udev/rules.d/70-android.rules \
    $(LOCAL_PATH)/halium/70-noblelte.rules:system/halium/usr/lib/lxc-android-config/70-android.rules \
    $(LOCAL_PATH)/halium/70-noblelte.rules:system/halium/etc/udev/rules.d/70-android.rules \
    $(LOCAL_PATH)/halium/display.conf:system/halium/etc/ubuntu-touch-session.d/android.conf \
    $(LOCAL_PATH)/halium/config:system/halium/var/lib/lxc/android/config \
    $(LOCAL_PATH)/ramdisk/fstab.samsungexynos7420:/system/vendor/etc/fstab.samsungexynos7420 \
    $(LOCAL_PATH)/halium/etc/init/device-hacks.conf:system/halium/etc/init/device-hacks.conf \
    $(LOCAL_PATH)/seccomp/crash_dump.arm.policy:system/etc/seccomp_policy/crash_dump.arm.policy \
    $(LOCAL_PATH)/halium/etc/pulse/touch-android9.pa:system/halium/etc/pulse/touch-android9.pa \
    $(LOCAL_PATH)/halium/fingerprint/init.fingerprint.rc:system/etc/init/init.fingerprint.rc \

# Misc
PRODUCT_PACKAGES += \
    libandroid \
    libandroid_runtime \
    android.hardware.media.omx@1.0-service \
    android.hardware.contexthub@1.0 \
    libnetutils \
    power.default \
    libdrmframework_jni \
    libmediadrmmetrics_lite \
    libfwdlockengine \
    drmserver \

PRODUCT_PACKAGES += \
    android.hardware.audio.common@2.0 \
    android.hardware.audio.common@2.0-util \
    android.hardware.tv.cec@1.0 \
    android.hardware.vibrator@1.1 \
    android.hardware.vibrator@1.2 \
    android.hardware.bluetooth.a2dp@1.0 \
    android.hardware.soundtrigger@2.1 \
    android.hardware.soundtrigger@2.0 \
    android.hardware.camera.device@3.4 \
    android.hardware.audio.effect@2.0 \
    android.hardware.audio@2.0 \
    android.hardware.broadcastradio@1.0 \
    android.hardware.broadcastradio@1.1 \
    android.hardware.neuralnetworks@1.0 \
    android.hardware.neuralnetworks@1.1 \
    android.hardware.vr@1.0 \
    android.hardware.tetheroffload.config@1.0 \
    android.hardware.confirmationui@1.0 \
    android.frameworks.displayservice@1.0
    
PRODUCT_PACKAGES += \
    audio.primary.default \
    local_time.default \
    vibrator.default \
    libstagefright_omx \
    libstagefright_amrnb_common \
    libstagefright_soft_flacdec \
    libstagefright_enc_common \
    libstagefright_http_support \
    libstagefright_soft_opusdec \
    libstagefright_soft_hevcdec \
    libstagefright_soft_mpeg2dec \
    libstagefright_soft_avcenc \
    libstagefright_soft_aacenc \
    libstagefright_soft_avcdec \
    libstagefright_soft_amrdec \
    libstagefright_soft_amrwbenc \
    libstagefright_soft_flacenc \
    libstagefright_soft_mpeg4enc \
    libstagefright_soft_g711dec \
    libstagefright_soft_aacdec \
    libstagefright_soft_vpxenc \
    libstagefright_soft_mp3dec \
    libstagefright_soft_mpeg4dec \
    libstagefright_soft_amrnbenc \
    libstagefright_soft_rawdec \
    libstagefright_soft_vpxdec \
    libstagefright_soft_gsmdec \
    libstagefright_soft_vorbisdec \
    libstagefright_hdcp

PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0 \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.1
    
    
# Ubuntu
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/halium/fingerprints/system/lib/vendor.samsung.hardware.biometrics.fingerprint@2.1.so:system/vendor/lib/vendor.samsung.hardware.biometrics.fingerprint@2.1.so \
    $(LOCAL_PATH)/halium/fingerprints/system/lib64/vendor.samsung.hardware.biometrics.fingerprint@2.1.so:system/vendor/lib64/vendor.samsung.hardware.biometrics.fingerprint@2.1.so \
    $(LOCAL_PATH)/halium/fingerprints/system/vendor/bin/hw/vendor.samsung.hardware.biometrics.fingerprint@2.1-service:system/vendor/bin/hw/vendor.samsung.hardware.biometrics.fingerprint@2.1-service \
    $(LOCAL_PATH)/halium/fingerprints/system/vendor/etc/init/vendor.samsung.hardware.biometrics.fingerprint@2.1-service.rc:system/vendor/etc/init/vendor.samsung.hardware.biometrics.fingerprint@2.1-service.rc

PRODUCT_PACKAGES += \
    libsf_compat_layer \
    minimediaservice \
    minisfservice \
    miniafservice \
    mediadrmserver \
    libdrm \
    libui_compat_layer

# call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi-cm/exynos7420/exynos7420.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/noblelte-common/noblelte-common-vendor.mk)
