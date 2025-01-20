@interface CRSUIMutableClimateOverlaySceneClientSettings
- (NSArray)presentedPopoverFrames;
- (UIEdgeInsets)stepperInsets;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPresentedPopoverFrames:(id)a3;
- (void)setStepperInsets:(UIEdgeInsets)a3;
@end

@implementation CRSUIMutableClimateOverlaySceneClientSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRSUIClimateOverlaySceneClientSettings alloc];
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

- (void)setStepperInsets:(UIEdgeInsets)a3
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:2075632724];
}

- (NSArray)presentedPopoverFrames
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2368053444];

  return (NSArray *)v3;
}

- (void)setPresentedPopoverFrames:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:2368053444];
}

@end