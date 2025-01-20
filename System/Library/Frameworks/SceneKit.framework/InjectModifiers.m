@interface InjectModifiers
@end

@implementation InjectModifiers

uint64_t ____InjectModifiers_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = __DefineForShaderModifierStandardUniformPerNode(a2);
  if (result)
  {
    uint64_t v4 = result;
    v5 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v5 setObject:&stru_26BF72F58 forKeyedSubscript:v4];
  }
  return result;
}

@end