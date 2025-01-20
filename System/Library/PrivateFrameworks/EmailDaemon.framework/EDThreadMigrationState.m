@interface EDThreadMigrationState
@end

@implementation EDThreadMigrationState

BOOL __101___EDThreadMigrationState_verifyIsMigratingGeneration_andIsInState_logIdentifier_logAction_logCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) state] == *(void *)(a1 + 40);
}

BOOL __109___EDThreadMigrationState_verifyIsMigratingGeneration_andIsInState_orState_logIdentifier_logAction_logCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) state] == *(void *)(a1 + 40)
      || [*(id *)(a1 + 32) state] == *(void *)(a1 + 48);
}

@end