@interface BNMutableSceneSettings
- (BOOL)isUserInteractionInProgress;
- (CGSize)containerSize;
- (CGSize)presentationSize;
- (Class)clientContainerViewControllerClass;
- (NSString)revocationReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int)bannerAppearState;
- (int)viewControllerAppearState;
- (void)setBannerAppearState:(int)a3;
- (void)setClientContainerViewControllerClass:(Class)a3;
- (void)setContainerSize:(CGSize)a3;
- (void)setPresentationSize:(CGSize)a3;
- (void)setRevocationReason:(id)a3;
- (void)setUserInteractionInProgress:(BOOL)a3;
- (void)setViewControllerAppearState:(int)a3;
@end

@implementation BNMutableSceneSettings

- (CGSize)containerSize
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:501];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v7 = width;
  *(CGFloat *)&v7[1] = height;
  double v6 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [v5 setObject:v6 forSetting:501];
}

- (CGSize)presentationSize
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:502];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)setPresentationSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v7 = width;
  *(CGFloat *)&v7[1] = height;
  double v6 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [v5 setObject:v6 forSetting:502];
}

- (int)viewControllerAppearState
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:503];
  int v4 = [v3 integerValue];

  return v4;
}

- (void)setViewControllerAppearState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FBSSettings *)self otherSettings];
  int v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v4 forSetting:503];
}

- (int)bannerAppearState
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:504];
  int v4 = [v3 integerValue];

  return v4;
}

- (void)setBannerAppearState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FBSSettings *)self otherSettings];
  double v6 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v6 forSetting:504];

  if (v3 && v3 != 3)
  {
    [(BNMutableSceneSettings *)self setRevocationReason:0];
  }
}

- (NSString)revocationReason
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:505];

  return (NSString *)v3;
}

- (void)setRevocationReason:(id)a3
{
  id v7 = a3;
  if (v7
    && [(BNMutableSceneSettings *)self bannerAppearState] != 3
    && [(BNMutableSceneSettings *)self bannerAppearState])
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BNSceneSettings.m" lineNumber:168 description:@"Attempting to set revocation reason when appearing or appeared."];
  }
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v7 forSetting:505];
}

- (BOOL)isUserInteractionInProgress
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:506];

  return v3;
}

- (void)setUserInteractionInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setFlag:v3 forSetting:506];
}

- (Class)clientContainerViewControllerClass
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:507];
  id v4 = NSClassFromString(v3);

  return (Class)v4;
}

- (void)setClientContainerViewControllerClass:(Class)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = NSStringFromClass(a3);
  [v5 setObject:v4 forSetting:507];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BNSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 500 > 7) {
    return 0;
  }
  else {
    return off_1E63B9460[a3 - 500];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  id v7 = v6;
  switch(a5)
  {
    case 0x1F4uLL:
    case 0x1F5uLL:
    case 0x1F6uLL:
      id v8 = [v6 description];
      goto LABEL_7;
    case 0x1F7uLL:
    case 0x1F8uLL:
      BNStringForAppearState([v6 integerValue]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0x1F9uLL:
    case 0x1FBuLL:
      id v8 = v6;
      goto LABEL_7;
    case 0x1FAuLL:
      BSSettingFlagDescription();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
      double v9 = v8;
      break;
    default:
      double v9 = 0;
      break;
  }

  return v9;
}

@end