@interface NSLayoutRuleRecursiveMoveNodes
@end

@implementation NSLayoutRuleRecursiveMoveNodes

void *___NSLayoutRuleRecursiveMoveNodes_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 removeObject:a2];
  }
  result = *(void **)(a1 + 40);
  if (result)
  {
    return (void *)[result addObject:a2];
  }
  return result;
}

@end