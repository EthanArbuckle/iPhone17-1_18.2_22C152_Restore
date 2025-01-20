@interface GSAddition
@end

@implementation GSAddition

void __58__GSAddition_BRConflictLosers___br_markResolvedWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v3 = [v8 allValues];
    v7 = [v3 objectAtIndexedSubscript:0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
  if (!v6)
  {
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __57__GSAddition_BRConflictLosers__br_markResolvedWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObjResult:0 error:a2];
}

@end