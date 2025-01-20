@interface NSSet
@end

@implementation NSSet

uint64_t __33__NSSet_AAAFoundation__aaf_empty__block_invoke()
{
  aaf_empty__aaf_empty = [MEMORY[0x1E4F1CAD0] set];
  return MEMORY[0x1F41817F8]();
}

void __35__NSSet_AAAFoundation__aaf_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __32__NSSet_AAAFoundation__aaf_map___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__NSSet_AAAFoundation__aaf_mapStoppable___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

@end