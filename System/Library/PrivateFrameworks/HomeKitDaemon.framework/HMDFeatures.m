@interface HMDFeatures
+ (void)disableFeatureHomeTheaterQFAForTests;
+ (void)enableFeatureHomeTheaterQFAForTests;
+ (void)unsetFeatureHomeTheaterQFAForTests;
@end

@implementation HMDFeatures

+ (void)unsetFeatureHomeTheaterQFAForTests
{
  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = 0;
}

+ (void)disableFeatureHomeTheaterQFAForTests
{
  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x263EFFA80];
}

+ (void)enableFeatureHomeTheaterQFAForTests
{
  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x263EFFA88];
}

@end