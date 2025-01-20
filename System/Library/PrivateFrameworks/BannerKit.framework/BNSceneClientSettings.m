@interface BNSceneClientSettings
- (BOOL)isClippingEnabled;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isPanGestureProxySupported;
- (BOOL)isTouchOutsideDismissalEnabled;
- (CGSize)preferredContentSize;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (UIEdgeInsets)bannerContentOutsets;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
@end

@implementation BNSceneClientSettings

- (CGSize)preferredContentSize
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

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:502];

  return (NSSet *)v3;
}

- (UIEdgeInsets)bannerContentOutsets
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:503];
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

- (BOOL)isDraggingDismissalEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:504];

  return v3;
}

- (BOOL)isDraggingInteractionEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:505];

  return v3;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:506];

  return v3;
}

- (BOOL)isPanGestureProxySupported
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:507];

  return v3;
}

- (BOOL)isClippingEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:508];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = [BNMutableSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 500 > 8) {
    return 0;
  }
  else {
    return off_1E63B95B0[a3 - 500];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  double v7 = v6;
  if (a5 - 504 < 5)
  {
    uint64_t v8 = BSSettingFlagDescription();
LABEL_5:
    double v9 = (void *)v8;
    goto LABEL_6;
  }
  if (a5 - 500 <= 3)
  {
    uint64_t v8 = [v6 description];
    goto LABEL_5;
  }
  double v9 = 0;
LABEL_6:

  return v9;
}

@end