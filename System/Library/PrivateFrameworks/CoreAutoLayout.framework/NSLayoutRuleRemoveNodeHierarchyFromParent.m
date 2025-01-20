@interface NSLayoutRuleRemoveNodeHierarchyFromParent
@end

@implementation NSLayoutRuleRemoveNodeHierarchyFromParent

uint64_t ___NSLayoutRuleRemoveNodeHierarchyFromParent_block_invoke(uint64_t a1, uint64_t a2)
{
  return [**(id **)(a1 + 32) removeObject:a2];
}

@end