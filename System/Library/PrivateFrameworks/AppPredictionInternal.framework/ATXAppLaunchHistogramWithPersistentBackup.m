@interface ATXAppLaunchHistogramWithPersistentBackup
@end

@implementation ATXAppLaunchHistogramWithPersistentBackup

void __118___ATXAppLaunchHistogramWithPersistentBackup_initWithDataStore_histogramType_loadFromDataStore_saveOnBackgroundQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained flush];
}

@end