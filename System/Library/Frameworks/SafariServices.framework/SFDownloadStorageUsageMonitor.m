@interface SFDownloadStorageUsageMonitor
@end

@implementation SFDownloadStorageUsageMonitor

uint64_t __38___SFDownloadStorageUsageMonitor_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDownloadHistory];
}

void __39___SFDownloadStorageUsageMonitor_usage__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cachedUsage];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __56___SFDownloadStorageUsageMonitor__reloadDownloadHistory__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_SFDownloadStorageUsageMonitorDidChangeUsageNotification" object:*(void *)(a1 + 32)];
}

void __54___SFDownloadStorageUsageMonitor_entryDidChangeUsage___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_SFDownloadStorageUsageMonitorDidChangeUsageNotification" object:*(void *)(a1 + 32)];
}

uint64_t __64___SFDownloadStorageUsageMonitor_downloadFileContentsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDownloadHistory];
}

@end