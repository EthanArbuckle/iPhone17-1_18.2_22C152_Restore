@interface AMSUIPasswordSettingsViewProvider
+ (id)makeViewWithAccount:(id)a3;
- (AMSUIPasswordSettingsViewProvider)init;
@end

@implementation AMSUIPasswordSettingsViewProvider

+ (id)makeViewWithAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)static PasswordSettingsViewProvider.makeViewWith(account:)(v3);

  return v4;
}

- (AMSUIPasswordSettingsViewProvider)init
{
  return (AMSUIPasswordSettingsViewProvider *)PasswordSettingsViewProvider.init()();
}

@end