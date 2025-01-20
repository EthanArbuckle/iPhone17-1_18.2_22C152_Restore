@interface NSArray
@end

@implementation NSArray

void __30__NSArray_Utilities__iam_map___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  id v5 = v4;

  [*(id *)(a1 + 32) addObject:v5];
}

uint64_t __37__NSArray_Utilities__iam_compactMap___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x270F9A758]();
}

@end