@interface GCController(BluetoothSettings)
@end

@implementation GCController(BluetoothSettings)

+ (void)_settingsSupportedForBTClassicDevice:()BluetoothSettings settingsStore:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_220998000, a2, OS_LOG_TYPE_ERROR, "-[GCController doesBTDeviceSupportGamepadSettings:] received invalid BT address data: %@", (uint8_t *)&v2, 0xCu);
}

@end