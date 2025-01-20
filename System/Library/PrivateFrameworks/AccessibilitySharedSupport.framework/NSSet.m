@interface NSSet
@end

@implementation NSSet

uint64_t __62__NSSet_AXSSDatabaseManager__ax_makeObjectsRespondToSelector___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = [v5 performSelector:*(void *)(a1 + 40)];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }

  return MEMORY[0x1F41817F8]();
}

@end