@interface FBSMutableSceneClientSettings(BacklightServices)
- (void)bls_setHasDelegate:()BacklightServices;
- (void)bls_setOptsOutOfProcessAssertions:()BacklightServices;
- (void)bls_setSupportsAlwaysOn:()BacklightServices;
@end

@implementation FBSMutableSceneClientSettings(BacklightServices)

- (void)bls_setSupportsAlwaysOn:()BacklightServices
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200001];
}

- (void)bls_setHasDelegate:()BacklightServices
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200000];
}

- (void)bls_setOptsOutOfProcessAssertions:()BacklightServices
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200002];
}

@end