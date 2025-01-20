@interface AAUIAppleIDSignInConfigForSkippingBackup
- (AAUIAppleIDSignInConfigForSkippingBackup)initWithNavController:(id)a3;
- (id)_serviceContextWithNavController:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation AAUIAppleIDSignInConfigForSkippingBackup

- (AAUIAppleIDSignInConfigForSkippingBackup)initWithNavController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAppleIDSignInConfigForSkippingBackup;
  v5 = [(AAUIAppleIDSignInConfiguration *)&v12 initWithNavController:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(AAUIAppleIDSignInConfiguration *)v5 signInConfiguration];
    [v7 setAllowSkip:1];

    v8 = [(AAUIAppleIDSignInConfiguration *)v6 signInConfiguration];
    [v8 setNewSignInReauth:1];

    v9 = [(AAUIAppleIDSignInConfigForSkippingBackup *)v6 _serviceContextWithNavController:v4];
    v10 = [(AAUIAppleIDSignInConfiguration *)v6 signInConfiguration];
    [v10 setServiceContext:v9];
  }
  return v6;
}

- (id)_serviceContextWithNavController:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F26D78];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [[AAUISignInFlowControllerDelegate alloc] initWithPresentingViewController:v4];

  [(AAUISignInFlowControllerDelegate *)v6 setNewSignInReauth:1];
  uint64_t v9 = *MEMORY[0x263F26D28];
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 setSignInContexts:v7];

  return v5;
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIAppleIDSignInConfiguration *)self signInConfiguration];
  [v5 setUsername:v4];

  id v6 = [(AAUIAppleIDSignInConfiguration *)self signInConfiguration];
  [v6 setCanEditUsername:0];
}

@end