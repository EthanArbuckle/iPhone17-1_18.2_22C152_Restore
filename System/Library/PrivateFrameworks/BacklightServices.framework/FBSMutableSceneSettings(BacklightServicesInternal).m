@interface FBSMutableSceneSettings(BacklightServicesInternal)
- (void)bls_setAlwaysOnEnabledForEnvironment:()BacklightServicesInternal;
- (void)bls_setBlanked:()BacklightServicesInternal;
- (void)bls_setDelegateActive:()BacklightServicesInternal;
- (void)bls_setLiveUpdating:()BacklightServicesInternal;
- (void)bls_setPresentationDate:()BacklightServicesInternal;
- (void)bls_setRenderSeed:()BacklightServicesInternal;
- (void)bls_setUnrestrictedFramerateUpdates:()BacklightServicesInternal;
- (void)bls_setVisualState:()BacklightServicesInternal;
@end

@implementation FBSMutableSceneSettings(BacklightServicesInternal)

- (void)bls_setDelegateActive:()BacklightServicesInternal
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200000];
}

- (void)bls_setBlanked:()BacklightServicesInternal
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200001];
}

- (void)bls_setVisualState:()BacklightServicesInternal
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:200002];
}

- (void)bls_setPresentationDate:()BacklightServicesInternal
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:200003];
}

- (void)bls_setAlwaysOnEnabledForEnvironment:()BacklightServicesInternal
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200004];
}

- (void)bls_setRenderSeed:()BacklightServicesInternal
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:200005];
}

- (void)bls_setLiveUpdating:()BacklightServicesInternal
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200006];
}

- (void)bls_setUnrestrictedFramerateUpdates:()BacklightServicesInternal
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:200007];
}

@end