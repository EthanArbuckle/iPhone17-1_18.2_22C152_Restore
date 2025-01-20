@interface DMTSharingDevice
+ (BOOL)deviceIsPairedAccordingToFlags:(unsigned int)a3;
+ (unint64_t)devicePairingStateFromSFPairState:(unsigned int)a3;
- (DMTSharingDevice)initWithDevice:(id)a3;
- (SFDevice)sharingDevice;
@end

@implementation DMTSharingDevice

- (DMTSharingDevice)initWithDevice:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  v7 = [v5 model];
  v8 = [v5 bleDevice];
  uint64_t v9 = [v8 rssi];
  BOOL v10 = +[DMTSharingDevice deviceIsPairedAccordingToFlags:](DMTSharingDevice, "deviceIsPairedAccordingToFlags:", [v5 deviceFlags]);
  unint64_t v11 = +[DMTSharingDevice devicePairingStateFromSFPairState:](DMTSharingDevice, "devicePairingStateFromSFPairState:", [v5 systemPairState]);
  v12 = [MEMORY[0x263EFF910] now];
  v15.receiver = self;
  v15.super_class = (Class)DMTSharingDevice;
  v13 = [(CATSharingDevice *)&v15 initWithIdentifier:v6 modelIdentifier:v7 RSSI:v9 paired:v10 pairingState:v11 detectionTime:v12];

  if (v13) {
    objc_storeStrong((id *)&v13->_sharingDevice, a3);
  }

  return v13;
}

+ (BOOL)deviceIsPairedAccordingToFlags:(unsigned int)a3
{
  v4 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]5(a3);
  }

  id v5 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]4();
  }

  v6 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]3();
  }

  v7 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]2();
  }

  v8 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]1();
  }

  uint64_t v9 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]0();
  }

  BOOL v10 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.9();
  }

  unint64_t v11 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.8();
  }

  v12 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.7();
  }

  v13 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.6();
  }

  v14 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.5();
  }

  objc_super v15 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.4();
  }

  v16 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]();
  }

  v17 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]();
  }

  v18 = _DMTLogGeneral_7();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:]();
  }

  return (a3 >> 10) & 1;
}

+ (unint64_t)devicePairingStateFromSFPairState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((int)a3 <= 19)
  {
    if (!a3)
    {
      v4 = _DMTLogGeneral_7();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        +[DMTSharingDevice devicePairingStateFromSFPairState:]();
      }
      goto LABEL_18;
    }
    if (a3 == 10)
    {
      v4 = _DMTLogGeneral_7();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        +[DMTSharingDevice devicePairingStateFromSFPairState:]();
      }
      unint64_t v5 = 1;
      goto LABEL_19;
    }
LABEL_16:
    v4 = _DMTLogGeneral_7();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[DMTSharingDevice devicePairingStateFromSFPairState:](v3);
    }
LABEL_18:
    unint64_t v5 = 0;
    goto LABEL_19;
  }
  if (a3 == 20)
  {
    v4 = _DMTLogGeneral_7();
    unint64_t v5 = 2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      +[DMTSharingDevice devicePairingStateFromSFPairState:].cold.4();
      unint64_t v5 = 2;
    }
  }
  else
  {
    if (a3 != 30) {
      goto LABEL_16;
    }
    v4 = _DMTLogGeneral_7();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[DMTSharingDevice devicePairingStateFromSFPairState:].cold.5();
    }
    unint64_t v5 = 3;
  }
LABEL_19:

  return v5;
}

- (SFDevice)sharingDevice
{
  return self->_sharingDevice;
}

- (void).cxx_destruct
{
}

+ (void)deviceIsPairedAccordingToFlags:.cold.1()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsEveryoneMode: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.2()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsTempPaired: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.3()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsShareAudio: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.4()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsPaired: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.5()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsDeviceClose: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.6()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsResume: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.7()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsAirDropUsable: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.8()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsSharedHome: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.9()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsRangingCapable: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.10()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsPeerMe: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.11()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsMyiCloud: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.12()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsFriend: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.13()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsFamily: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.14()
{
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v1, v2, "SFDeviceFlagsMyMe: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)deviceIsPairedAccordingToFlags:(int)a1 .cold.15(int a1)
{
  uint64_t v1 = [NSNumber numberWithBool:a1 == 0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v2, v3, "SFDeviceFlagsNone: %{public}@", v4, v5, v6, v7, v8);
}

+ (void)devicePairingStateFromSFPairState:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInt:a1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22D3D6000, v2, v3, "Unknown pair state: %{public}@, Sharing has either violated their API contract or added new states.", v4, v5, v6, v7, v8);
}

+ (void)devicePairingStateFromSFPairState:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D3D6000, v0, v1, "SFPairStateUnknown", v2, v3, v4, v5, v6);
}

+ (void)devicePairingStateFromSFPairState:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D3D6000, v0, v1, "SFPairStateNotPaired", v2, v3, v4, v5, v6);
}

+ (void)devicePairingStateFromSFPairState:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D3D6000, v0, v1, "SFPairStateConjectured", v2, v3, v4, v5, v6);
}

+ (void)devicePairingStateFromSFPairState:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22D3D6000, v0, v1, "SFPairStateVerified", v2, v3, v4, v5, v6);
}

@end