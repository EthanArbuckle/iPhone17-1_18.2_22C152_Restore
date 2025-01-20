@interface HUDefaultStatusBarVisiblityHandler
- (BOOL)isStatusBarHidden;
- (id)_statusBarAnimationParametersForAnimationSettings:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3 withAnimationSettings:(id)a4;
@end

@implementation HUDefaultStatusBarVisiblityHandler

- (BOOL)isStatusBarHidden
{
  v2 = [(id)*MEMORY[0x1E4F43630] statusBar];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setStatusBarHidden:(BOOL)a3 withAnimationSettings:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  v6 = [(id)*MEMORY[0x1E4F43630] statusBar];
  v7 = v6;
  if (v9)
  {
    v8 = [(HUDefaultStatusBarVisiblityHandler *)self _statusBarAnimationParametersForAnimationSettings:v9];
    [v7 setHidden:v4 animationParameters:v8];
  }
  else
  {
    [v6 setHidden:v4];
  }
}

- (id)_statusBarAnimationParametersForAnimationSettings:(id)a3
{
  if (a3)
  {
    char v3 = (objc_class *)MEMORY[0x1E4F42E38];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithDefaultParameters];
    [v4 duration];
    objc_msgSend(v5, "setDuration:");
    [v5 setAnimationFactory:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end