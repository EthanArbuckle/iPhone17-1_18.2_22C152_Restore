@interface HMMTRFeatures
+ (void)disableFeatureMatterLocalFabricConfigEnabledForTests;
+ (void)disableFeatureiPhoneOnlyPairingControlForTests;
+ (void)enableFeatureMatterLocalFabricConfigEnabledForTests;
+ (void)enableFeatureiPhoneOnlyPairingControlForTests;
+ (void)unsetFeatureMatterLocalFabricConfigEnabledForTests;
+ (void)unsetFeatureiPhoneOnlyPairingControlForTests;
@end

@implementation HMMTRFeatures

+ (void)disableFeatureMatterLocalFabricConfigEnabledForTests
{
  v2 = (void *)isFeatureMatterLocalFabricConfigEnabledForTests;
  isFeatureMatterLocalFabricConfigEnabledForTests = MEMORY[0x263EFFA80];
}

+ (void)unsetFeatureMatterLocalFabricConfigEnabledForTests
{
  v2 = (void *)isFeatureMatterLocalFabricConfigEnabledForTests;
  isFeatureMatterLocalFabricConfigEnabledForTests = 0;
}

+ (void)enableFeatureMatterLocalFabricConfigEnabledForTests
{
  v2 = (void *)isFeatureMatterLocalFabricConfigEnabledForTests;
  isFeatureMatterLocalFabricConfigEnabledForTests = MEMORY[0x263EFFA88];
}

+ (void)disableFeatureiPhoneOnlyPairingControlForTests
{
  v2 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  isFeatureMatteriPhoneOnlyPairingControlEnabledForTests = MEMORY[0x263EFFA80];
}

+ (void)unsetFeatureiPhoneOnlyPairingControlForTests
{
  v2 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  isFeatureMatteriPhoneOnlyPairingControlEnabledForTests = 0;
}

+ (void)enableFeatureiPhoneOnlyPairingControlForTests
{
  v2 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  isFeatureMatteriPhoneOnlyPairingControlEnabledForTests = MEMORY[0x263EFFA88];
}

@end