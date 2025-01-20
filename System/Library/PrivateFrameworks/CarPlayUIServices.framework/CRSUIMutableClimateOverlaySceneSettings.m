@interface CRSUIMutableClimateOverlaySceneSettings
- (BOOL)hasPhysicalControlBars;
- (NSNumber)containerHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContainerHeight:(id)a3;
- (void)setHasPhysicalControlBars:(BOOL)a3;
@end

@implementation CRSUIMutableClimateOverlaySceneSettings

- (NSNumber)containerHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:141334464];

  return (NSNumber *)v3;
}

- (void)setContainerHeight:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:141334464];
}

- (BOOL)hasPhysicalControlBars
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:141334465];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasPhysicalControlBars:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  char v4 = (void *)[objc_alloc(NSNumber) initWithBool:v3];
  [v5 setObject:v4 forSetting:141334465];
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = [CRSUIClimateOverlaySceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end