@interface BluetoothManager(BluetoothManagerGKExtensions)
- (uint64_t)localDeviceSupportsService:()BluetoothManagerGKExtensions;
@end

@implementation BluetoothManager(BluetoothManagerGKExtensions)

- (uint64_t)localDeviceSupportsService:()BluetoothManagerGKExtensions
{
  if (!*(void *)(a1 + (int)*MEMORY[0x263F2B9A0]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[BluetoothManager(BluetoothManagerGKExtensions) localDeviceSupportsService:]();
      }
    }
    return -1;
  }
  if (BTLocalDeviceSupportsService())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[BluetoothManager(BluetoothManagerGKExtensions) localDeviceSupportsService:]();
      }
    }
    return -1;
  }
  return 0;
}

- (void)localDeviceSupportsService:()BluetoothManagerGKExtensions .cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d no local BT device in the BT manager.", v2, v3, v4, v5, v6);
}

- (void)localDeviceSupportsService:()BluetoothManagerGKExtensions .cold.2()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8_0();
  __int16 v4 = v0;
  uint64_t v5 = "-[BluetoothManager(BluetoothManagerGKExtensions) localDeviceSupportsService:]";
  __int16 v6 = 1024;
  int v7 = 41;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_221563000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not check bluetooth to see if service supported. %d", v3, 0x22u);
}

@end