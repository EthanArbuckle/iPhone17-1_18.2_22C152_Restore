@interface FBSSceneClientSettings(BacklightServices)
- (BOOL)bls_supportsAlwaysOn;
- (uint64_t)bls_hasDelegate;
- (uint64_t)bls_optsOutOfProcessAssertions;
@end

@implementation FBSSceneClientSettings(BacklightServices)

- (uint64_t)bls_hasDelegate
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:200000];

  return v2;
}

- (BOOL)bls_supportsAlwaysOn
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 flagForSetting:200001];

  return v2 == 1 || v2 == 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)bls_optsOutOfProcessAssertions
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:200002];

  return v2;
}

@end