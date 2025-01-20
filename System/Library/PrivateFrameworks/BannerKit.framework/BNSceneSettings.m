@interface BNSceneSettings
- (BOOL)isUserInteractionInProgress;
- (CGSize)containerSize;
- (CGSize)presentationSize;
- (Class)clientContainerViewControllerClass;
- (NSString)revocationReason;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int)bannerAppearState;
- (int)viewControllerAppearState;
@end

@implementation BNSceneSettings

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

- (CGSize)presentationSize
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:502];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int)viewControllerAppearState
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:503];
  int v4 = [v3 integerValue];

  return v4;
}

- (int)bannerAppearState
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:504];
  int v4 = [v3 integerValue];

  return v4;
}

- (NSString)revocationReason
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:505];

  return (NSString *)v3;
}

- (BOOL)isUserInteractionInProgress
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:506];

  return v3;
}

- (Class)clientContainerViewControllerClass
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:507];
  int v4 = NSClassFromString(v3);

  return (Class)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int v4 = [BNMutableSceneSettings alloc];
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
  double v7 = v6;
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