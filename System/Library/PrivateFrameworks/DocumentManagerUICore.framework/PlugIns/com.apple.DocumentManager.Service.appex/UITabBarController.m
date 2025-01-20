@interface UITabBarController
- (BOOL)usingVariableBlurBottomBar;
- (void)detatchVariableBlurView;
- (void)setUsingVariableBlurBottomBar:(BOOL)a3;
@end

@implementation UITabBarController

- (BOOL)usingVariableBlurBottomBar
{
  v3 = (void *)swift_dynamicCastObjCProtocolUnconditional();
  v4 = self;
  id v5 = [v3 tabBar];
  v6 = (UITabBarController *)[v5 _backgroundView];

  if (v6)
  {
    type metadata accessor for DOCTabBarVariableBlurBackgroundView();
    BOOL v7 = swift_dynamicCastClass() != 0;

    v4 = v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setUsingVariableBlurBottomBar:(BOOL)a3
{
  v4 = self;
  UITabBarController.usingVariableBlurBottomBar.setter(a3);
}

- (void)detatchVariableBlurView
{
  v2 = self;
  sub_1001FCD00();
}

@end