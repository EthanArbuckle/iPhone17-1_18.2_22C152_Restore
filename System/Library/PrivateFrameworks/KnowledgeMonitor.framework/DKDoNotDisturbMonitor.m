@interface DKDoNotDisturbMonitor
@end

@implementation DKDoNotDisturbMonitor

void __31___DKDoNotDisturbMonitor_start__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_225002000, v5, OS_LOG_TYPE_DEFAULT, "Success registering for DND: %u, Error=%@", (uint8_t *)v6, 0x12u);
  }
}

@end