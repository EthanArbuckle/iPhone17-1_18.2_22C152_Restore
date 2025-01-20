@interface CRSUIClimateOverlaySceneClientSettings
- (NSArray)presentedPopoverFrames;
- (UIEdgeInsets)stepperInsets;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation CRSUIClimateOverlaySceneClientSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRSUIMutableClimateOverlaySceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (UIEdgeInsets)stepperInsets
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2075632724];

  [v3 UIEdgeInsetsValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (NSArray)presentedPopoverFrames
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2368053444];

  return (NSArray *)v3;
}

@end