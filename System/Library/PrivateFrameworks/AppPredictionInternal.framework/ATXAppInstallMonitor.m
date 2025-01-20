@interface ATXAppInstallMonitor
@end

@implementation ATXAppInstallMonitor

uint64_t __76___ATXAppInstallMonitor_synchronousUpdateWithUninstallWaitTime_andBackdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) noSyncUpdateWithWaitTime:*(void *)(a1 + 40) andBackdate:*(unsigned __int8 *)(a1 + 48)];
}

void __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v5 = [*(id *)(a1 + 32) _fetchAllApps];
  }
  if ([v5 count])
  {
    [v8 minusSet:v5];
    v6 = *(void **)(a1 + 32);
    v7 = [v8 allObjects];
    [v6 handleUninstallationOfApps:v7];
  }
}

uint64_t __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

@end