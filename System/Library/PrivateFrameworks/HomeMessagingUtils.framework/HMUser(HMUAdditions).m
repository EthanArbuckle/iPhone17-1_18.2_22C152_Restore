@interface HMUser(HMUAdditions)
+ (uint64_t)hmu_uniqueIdentifiersFromUsers:()HMUAdditions;
@end

@implementation HMUser(HMUAdditions)

+ (uint64_t)hmu_uniqueIdentifiersFromUsers:()HMUAdditions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_3);
}

@end