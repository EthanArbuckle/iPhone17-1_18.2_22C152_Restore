@interface HMRoom(AbstractionAdditions)
- (id)hf_accessoryLikeObjects;
@end

@implementation HMRoom(AbstractionAdditions)

- (id)hf_accessoryLikeObjects
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 accessories];
  v3 = [v1 setWithArray:v2];
  v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_47);

  return v4;
}

@end