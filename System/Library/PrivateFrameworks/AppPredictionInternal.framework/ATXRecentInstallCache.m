@interface ATXRecentInstallCache
@end

@implementation ATXRecentInstallCache

void __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _notifiedOfInstalls:v3];
}

void __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _notifiedOfUninstalls:v3];
}

@end