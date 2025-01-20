@interface DKScreenSharingMonitor
@end

@implementation DKScreenSharingMonitor

void __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) outputContext];
  v3 = [v2 outputDevices];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [*(id *)(a1 + 32) currentMirroringDeviceCount];
  v6 = [MEMORY[0x263F34FB8] contextChannel];
  v7 = v6;
  if (v4 == v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke_cold_1(v4, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "currentMirroringDeviceCount"));
      v9 = [NSNumber numberWithInteger:v4];
      int v12 = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_225002000, v7, OS_LOG_TYPE_INFO, "Change in Mirroring devices count: %@ to %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = [objc_alloc(MEMORY[0x263F2A908]) initWithIsStart:v4 != 0];
    v10 = [*(id *)(a1 + 32) screenSharingStream];
    v11 = [v10 source];
    [v11 sendEvent:v7];

    [*(id *)(a1 + 32) setCurrentMirroringDeviceCount:v4];
  }
}

void __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [NSNumber numberWithInteger:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "No change in mirroring devices count: %@", (uint8_t *)&v4, 0xCu);
}

@end