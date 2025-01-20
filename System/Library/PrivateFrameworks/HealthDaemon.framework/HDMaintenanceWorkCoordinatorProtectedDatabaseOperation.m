@interface HDMaintenanceWorkCoordinatorProtectedDatabaseOperation
@end

@implementation HDMaintenanceWorkCoordinatorProtectedDatabaseOperation

void __65___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_cancel__block_invoke(uint64_t a1)
{
}

void __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;

  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = 0;

  uint64_t v6 = *(void *)(a1 + 32);

  -[HDMaintenanceOperation finish](v6);
}

uint64_t __63___HDMaintenanceWorkCoordinatorProtectedDatabaseOperation_main__block_invoke_2(uint64_t a1)
{
  return 1;
}

@end