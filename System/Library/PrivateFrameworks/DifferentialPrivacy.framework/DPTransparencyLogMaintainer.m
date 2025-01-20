@interface DPTransparencyLogMaintainer
@end

@implementation DPTransparencyLogMaintainer

void __69___DPTransparencyLogMaintainer_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1E019F810]();
  [*(id *)(a1 + 32) doMaintenance];
}

@end