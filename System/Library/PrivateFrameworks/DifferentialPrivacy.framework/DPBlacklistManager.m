@interface DPBlacklistManager
@end

@implementation DPBlacklistManager

void __55___DPBlacklistManager_createRuntimeBlacklistDirectory___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 32) isDirectory:1];
  createRuntimeBlacklistDirectory__created = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:0];
}

void __60___DPBlacklistManager_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = (void *)os_transaction_create();
  id v3 = (void *)MEMORY[0x1E019F810]();
  [(id)objc_opt_class() processRuntimeBlacklist];
}

@end