@interface NATreeNode
@end

@implementation NATreeNode

uint64_t __78__NATreeNode_HFAccessorySettingsAdditions__hf_sortedAccessorySettingsChildren__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 representedObject];
  v6 = [v5 sortKey];
  v7 = [v4 representedObject];

  v8 = [v7 sortKey];
  uint64_t v9 = [v6 compare:v8 options:64];

  return v9;
}

uint64_t __63__NATreeNode_HFAccessorySettingsAdditions__hf_nodeWithKeyPath___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 representedObject];
  id v4 = [v3 keyPath];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

@end