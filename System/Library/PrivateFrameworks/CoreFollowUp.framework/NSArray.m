@interface NSArray
@end

@implementation NSArray

uint64_t __28__NSArray_FollowUp__fl_map___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

void __33__NSArray_FollowUp__fl_multiMap___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    v5 = v4;
    if (v4)
    {
      [v4 addObject:v7];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v3];
    }
  }
}

@end