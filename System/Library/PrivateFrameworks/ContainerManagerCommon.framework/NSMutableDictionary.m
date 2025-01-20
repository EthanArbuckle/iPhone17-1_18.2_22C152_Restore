@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

uint64_t __86__NSMutableDictionary_MCMDeeplyMutable___findKeyPathsSortedByDepthFirstOfKindOfClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 <= [v5 count])
  {
    unint64_t v8 = [v4 count];
    uint64_t v7 = v8 < [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __91__NSMutableDictionary_MCMDeeplyMutable__MCM_overlayDictionary_existingValuesTakePrecedent___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 setObject:a2 forKeyedSubscript:v4];
}

@end