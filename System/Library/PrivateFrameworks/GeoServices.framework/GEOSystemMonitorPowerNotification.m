@interface GEOSystemMonitorPowerNotification
@end

@implementation GEOSystemMonitorPowerNotification

void ___GEOSystemMonitorPowerNotification_block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  intptr_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    IOReturn v4 = IOAllowPowerChange(_rootPort, v3);
    if (!v4) {
      return;
    }
    IOReturn v5 = v4;
    v6 = GEOGetSystemMonitorLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v10 = 67240192;
    IOReturn v11 = v5;
    v7 = "IOAllowPowerChange failed: %{public}d";
    goto LABEL_8;
  }
  IOReturn v8 = IOCancelPowerChange(_rootPort, v3);
  if (!v8) {
    return;
  }
  IOReturn v9 = v8;
  v6 = GEOGetSystemMonitorLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 67240192;
    IOReturn v11 = v9;
    v7 = "IOCancelPowerChange failed: %{public}d";
LABEL_8:
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v10, 8u);
  }
LABEL_9:
}

void ___GEOSystemMonitorPowerNotification_block_invoke_122(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  IOReturn v1 = IOAllowPowerChange(_rootPort, *(void *)(a1 + 32));
  if (v1)
  {
    IOReturn v2 = v1;
    intptr_t v3 = GEOGetSystemMonitorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4[0] = 67240192;
      v4[1] = v2;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_FAULT, "IOAllowPowerChange failed: %{public}d", (uint8_t *)v4, 8u);
    }
  }
}

@end