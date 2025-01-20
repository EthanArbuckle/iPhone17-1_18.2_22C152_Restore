@interface C3DDeformerStackEnumerateDependencyStacks
@end

@implementation C3DDeformerStackEnumerateDependencyStacks

uint64_t ____C3DDeformerStackEnumerateDependencyStacks_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = C3DNodeGetDeformerStack([a3 nodeRef]);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v5();
  }
  return result;
}

@end