@interface HMHome(HFReordering)
- (id)hf_updateDateAdded:()HFReordering;
@end

@implementation HMHome(HFReordering)

- (id)hf_updateDateAdded:()HFReordering
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

@end