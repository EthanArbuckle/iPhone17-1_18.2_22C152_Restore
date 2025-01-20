@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke(uint64_t result)
{
  return result;
}

__n128 __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_2(void *a1, NSRange range2)
{
  NSUInteger length = range2.length;
  NSUInteger location = range2.location;
  uint64_t v5 = *(void *)(a1[4] + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  if (!v6)
  {
    *(NSRange *)(v5 + 32) = range2;
    uint64_t v5 = *(void *)(a1[4] + 8);
    uint64_t v6 = *(void *)(v5 + 40);
  }
  v13.NSUInteger location = *(void *)(v5 + 32);
  v13.NSUInteger length = a1[7] + v6;
  v14.NSUInteger location = location;
  v14.NSUInteger length = length;
  if (NSIntersectionRange(v13, v14).length)
  {
    v15.NSUInteger location = location;
    v15.NSUInteger length = length;
    NSRange v8 = NSUnionRange(*(NSRange *)(*(void *)(a1[4] + 8) + 32), v15);
    NSUInteger location = v8.location;
    NSUInteger length = v8.length;
  }
  else
  {
    v9 = *(__n128 **)(a1[5] + 8);
    if (!v9[2].n128_u64[1])
    {
      __n128 result = *(__n128 *)(*(void *)(a1[4] + 8) + 32);
      v9[2] = result;
    }
  }
  uint64_t v10 = *(void *)(a1[4] + 8);
  *(void *)(v10 + 32) = location;
  *(void *)(v10 + 40) = length;
  v11 = *(__n128 **)(a1[6] + 8);
  v12 = *(__n128 **)(a1[4] + 8);
  if (v12[2].n128_u64[1] > v11[2].n128_u64[1])
  {
    __n128 result = v12[2];
    v11[2] = result;
  }
  return result;
}

uint64_t __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 + a3 + *(void *)(a1 + 32);
}

BOOL __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_4(uint64_t a1, unint64_t a2)
{
  return (unint64_t)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() >= *(void *)(a1 + 40)
      && a2 <= (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() - *(void *)(a1 + 40);
}

void __64__NSIndexSet_CyclicRange___allInclusiveCyclicRangeForItemCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

@end