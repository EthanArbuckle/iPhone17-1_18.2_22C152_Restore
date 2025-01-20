@interface GAX_UIStatusBarActionOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)performWithStatusBar:(id)a3 completionHandler:(id)a4;
@end

@implementation GAX_UIStatusBarActionOverride

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarAction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)performWithStatusBar:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = +[GAXClient sharedInstance];
  unsigned int v9 = [v8 isActive];

  if (v9)
  {
    v10 = GAXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Guided Access active. disallowing status bar actions", buf, 2u);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GAX_UIStatusBarActionOverride;
    [(GAX_UIStatusBarActionOverride *)&v11 performWithStatusBar:v6 completionHandler:v7];
  }
}

@end