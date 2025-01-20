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
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x1E4F1CC28];
}

+ (void)enableFeatureHomeTheaterQFAForTests
{
  v2 = (void *)isFeatureHomeTheaterQFAEnabledForTests;
  isFeatureHomeTheaterQFAEnabledForTests = MEMORY[0x1E4F1CC38];
}

@end