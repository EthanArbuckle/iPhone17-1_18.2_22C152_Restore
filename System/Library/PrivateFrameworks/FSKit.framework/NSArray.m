@interface NSArray
@end

@implementation NSArray

void __43__NSArray_FSKitAdditions__fs_mapWithIndex___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x25332B920]();
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

uint64_t __34__NSArray_FSKitAdditions__fs_map___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end