@interface CRSUIClimateOverlaySceneSettings
- (BOOL)hasPhysicalControlBars;
- (NSNumber)containerHeight;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation CRSUIClimateOverlaySceneSettings

- (NSNumber)containerHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:141334464];

  return (NSNumber *)v3;
}

- (BOOL)hasPhysicalControlBars
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:141334465];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  char v4 = [CRSUIMutableClimateOverlaySceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end