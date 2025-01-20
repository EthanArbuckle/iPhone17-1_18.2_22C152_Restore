@interface LSPluginRemove
@end

@implementation LSPluginRemove

uint64_t ___LSPluginRemove_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  return _UTTypeRemove(*(void **)(a1 + 32), a3);
}

@end