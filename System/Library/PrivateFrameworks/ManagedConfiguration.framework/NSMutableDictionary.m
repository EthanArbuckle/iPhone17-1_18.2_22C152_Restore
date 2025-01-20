@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

void __67__NSMutableDictionary_MCUtilities__MCFilterRestrictionPayloadKeys___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    v7 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
    [v7 intersectSet:v6];
    v8 = [v7 allObjects];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

@end