@interface MT
@end

@implementation MT

uint64_t __newFetchedRowsForFetchPlan_MT_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setTotalUnitCount:*(int *)(a1 + 40)];
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(int *)(a1 + 44);

  return [v2 setCompletedUnitCount:v3];
}

uint64_t __newFetchedRowsForFetchPlan_MT_block_invoke_70(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setTotalUnitCount:*(int *)(a1 + 40)];
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(int *)(a1 + 44);

  return [v2 setCompletedUnitCount:v3];
}

@end