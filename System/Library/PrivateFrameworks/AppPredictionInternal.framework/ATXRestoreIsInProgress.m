@interface ATXRestoreIsInProgress
@end

@implementation ATXRestoreIsInProgress

uint64_t ___ATXRestoreIsInProgress_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = restoreInProgress;
  return result;
}

@end