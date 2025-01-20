@interface UIToolbar(_UIToolbarConfiguration)
- (id)configuration;
- (void)configureTransparent;
- (void)configureWithConfiguration:()_UIToolbarConfiguration;
@end

@implementation UIToolbar(_UIToolbarConfiguration)

- (void)configureWithConfiguration:()_UIToolbarConfiguration
{
  id v11 = a3;
  if (_os_feature_enabled_impl())
  {
    [a1 setTranslucent:1];
    [a1 setBarStyle:0];
    v4 = [MEMORY[0x263F825C8] labelColor];
    [a1 setTintColor:v4];

    v5 = objc_opt_new();
    [a1 setBackgroundImage:v5 forToolbarPosition:0 barMetrics:0];

    uint64_t v6 = objc_opt_new();
  }
  else
  {
    objc_msgSend(a1, "setBarStyle:", objc_msgSend(v11, "barStyle"));
    objc_msgSend(a1, "setTranslucent:", objc_msgSend(v11, "isTranslucent"));
    v7 = [v11 barTintColor];
    [a1 setBarTintColor:v7];

    v8 = [v11 backgroundColor];
    [a1 setBackgroundColor:v8];

    v9 = [v11 backgroundImage];
    [a1 setBackgroundImage:v9 forToolbarPosition:0 barMetrics:0];

    uint64_t v6 = [v11 shadowImage];
  }
  v10 = (void *)v6;
  [a1 setShadowImage:v6 forToolbarPosition:0];
}

- (id)configuration
{
  v2 = objc_opt_new();
  objc_msgSend(v2, "setBarStyle:", objc_msgSend(a1, "barStyle"));
  objc_msgSend(v2, "setTranslucent:", objc_msgSend(a1, "isTranslucent"));
  v3 = [a1 shadowImageForToolbarPosition:0];
  [v2 setShadowImage:v3];

  v4 = [a1 barTintColor];
  [v2 setBarTintColor:v4];

  v5 = [a1 backgroundColor];
  [v2 setBackgroundColor:v5];

  uint64_t v6 = [a1 backgroundImageForToolbarPosition:0 barMetrics:0];
  [v2 setBackgroundImage:v6];

  return v2;
}

- (void)configureTransparent
{
  id v6 = (id)objc_opt_new();
  [v6 setBarStyle:0];
  [v6 setTranslucent:1];
  v2 = objc_opt_new();
  [v6 setShadowImage:v2];

  v3 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBarTintColor:v3];

  v4 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v4];

  v5 = objc_opt_new();
  [v6 setBackgroundImage:v5];

  [a1 configureWithConfiguration:v6];
}

@end