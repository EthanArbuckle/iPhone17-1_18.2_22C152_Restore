@interface InjectAllModifiersIfNeeded
@end

@implementation InjectAllModifiersIfNeeded

uint64_t ____InjectAllModifiersIfNeeded_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) appendFormat:@"%@ %@;\n", a3, a2];
}

uint64_t ____InjectAllModifiersIfNeeded_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:a2];
}

uint64_t ____InjectAllModifiersIfNeeded_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = __DefineForShaderModifierStandardUniformPerNode(a2);
  if (result)
  {
    uint64_t v4 = result;
    v5 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v5 addObject:v4];
  }
  return result;
}

@end