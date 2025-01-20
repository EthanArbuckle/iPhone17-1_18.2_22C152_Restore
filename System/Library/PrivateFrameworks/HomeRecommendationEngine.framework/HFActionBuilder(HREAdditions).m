@interface HFActionBuilder(HREAdditions)
+ (uint64_t)hre_sortActionBuilders:()HREAdditions;
- (id)recommendableObjectsInvolved;
@end

@implementation HFActionBuilder(HREAdditions)

- (id)recommendableObjectsInvolved
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 containedAccessoryRepresentables];
  v3 = [v1 setWithArray:v2];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_12);

  return v4;
}

+ (uint64_t)hre_sortActionBuilders:()HREAdditions
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_72_0];
}

@end