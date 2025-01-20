@interface HMActionSet(HFReordering)
- (id)hf_updateDateAdded:()HFReordering;
@end

@implementation HMActionSet(HFReordering)

- (id)hf_updateDateAdded:()HFReordering
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

@end