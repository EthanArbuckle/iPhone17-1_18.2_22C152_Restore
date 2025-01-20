@interface BNMutableSceneClientSettings
- (BOOL)isClippingEnabled;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isPanGestureProxySupported;
- (BOOL)isTouchOutsideDismissalEnabled;
- (CGSize)preferredContentSize;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (UIEdgeInsets)bannerContentOutsets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)setBannerContentOutsets:(UIEdgeInsets)a3;
- (void)setClippingEnabled:(BOOL)a3;
- (void)setDraggingDismissalEnabled:(BOOL)a3;
- (void)setDraggingInteractionEnabled:(BOOL)a3;
- (void)setPanGestureProxySupported:(BOOL)a3;
- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setTouchOutsideDismissalEnabled:(BOOL)a3;
@end

@implementation BNMutableSceneClientSettings

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

- (void)setPreferredContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v7 = width;
  *(CGFloat *)&v7[1] = height;
  double v6 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [v5 setObject:v6 forSetting:501];
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:502];

  return (NSSet *)v3;
}

- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:502];
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

- (void)setBannerContentOutsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  double v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  double v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIEdgeInsets=dddd}"];
  [v7 setObject:v8 forSetting:503];
}

- (BOOL)isDraggingDismissalEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:504];

  return v3;
}

- (void)setDraggingDismissalEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setFlag:v3 forSetting:504];
}

- (BOOL)isDraggingInteractionEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:505];

  return v3;
}

- (void)setDraggingInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setFlag:v3 forSetting:505];
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:506];

  return v3;
}

- (void)setTouchOutsideDismissalEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setFlag:v3 forSetting:506];
}

- (BOOL)isPanGestureProxySupported
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:507];

  return v3;
}

- (void)setPanGestureProxySupported:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setFlag:v3 forSetting:507];
}

- (BOOL)isClippingEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:508];

  return v3;
}

- (void)setClippingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setFlag:v3 forSetting:508];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BNSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 500 > 7) {
    return 0;
  }
  else {
    return off_1E63B95F8[a3 - 500];
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