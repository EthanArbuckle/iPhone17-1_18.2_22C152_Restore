@interface GCSonyDualShockControllerProfile
@end

@implementation GCSonyDualShockControllerProfile

void __50___GCSonyDualShockControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  v6 = [[_GCDevicePIDVIDMatchingFilter alloc] initWithVendorID:&unk_26D286858 productIDs:&unk_26D2879F8];
  v2 = [_GCDefaultDeviceManager alloc];
  v3 = NSStringFromClass(*(Class *)(a1 + 32));
  uint64_t v4 = [(_GCDefaultDeviceManager *)v2 initWithIdentifier:v3 matchingFilter:v6 probeScore:GCPhysicalDeviceProbeScoreHighPriority];
  v5 = (void *)deviceManager_deviceManager_3;
  deviceManager_deviceManager_3 = v4;

  [(id)deviceManager_deviceManager_3 setDelegate:*(void *)(a1 + 32)];
}

void __70___GCSonyDualShockControllerProfile_physicalDevice_getLightWithReply___block_invoke(uint64_t a1, float a2, float a3, float a4)
{
  v8 = [GCDeviceLight alloc];
  v9 = [GCColor alloc];
  *(float *)&double v10 = a2;
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a4;
  v13 = [(GCColor *)v9 initWithRed:v10 green:v11 blue:v12];
  v14 = [(GCDeviceLight *)v8 initWithColor:v13];

  if (gc_isInternalBuild())
  {
    v15 = getGCLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "physicalDevice:%@ getLight ...withReply(%@)", (uint8_t *)&v17, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79___GCSonyDualShockControllerProfile_physicalDevice_getSensorsEnabledWithReply___block_invoke(uint64_t a1, int a2)
{
  if (gc_isInternalBuild())
  {
    v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "physicalDevice:%@ getSensorsActive ...withReply(%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72___GCSonyDualShockControllerProfile_physicalDevice_getBatteryWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [[GCDeviceBattery alloc] initWithLevel:a2 isCharging:a3];
  if (gc_isInternalBuild())
  {
    v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      int v10 = v4;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "physicalDevice:%@ getBattery ...withReply(%@)", (uint8_t *)&v7, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end