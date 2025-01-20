@interface NSArray
@end

@implementation NSArray

uint64_t __43__NSArray_DEDEnumerable__ded_mapWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x270F9A758]();
}

uint64_t __44__NSArray_DEDEnumerable__ded_findWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end