@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __58__NSMutableArray_ContactsFoundation___cn_addObject_count___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t __67__NSMutableArray_ContactsFoundation___cn_removeObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end