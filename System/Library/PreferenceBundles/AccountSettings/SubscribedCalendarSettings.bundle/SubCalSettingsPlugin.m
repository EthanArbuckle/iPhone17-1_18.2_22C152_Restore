@interface SubCalSettingsPlugin
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForViewingAccount:(id)a3;
- (id)configurationInfoForCreatingAccountWithType:(id)a3;
- (id)configurationInfoForViewingAccount:(id)a3;
- (id)supportedAccountTypeIdentifiers;
@end

@implementation SubCalSettingsPlugin

- (id)supportedAccountTypeIdentifiers
{
  uint64_t v4 = ACAccountTypeIdentifierSubscribedCalendar;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  return (Class)objc_opt_class();
}

- (Class)viewControllerClassForViewingAccount:(id)a3
{
  return (Class)objc_opt_class();
}

- (id)configurationInfoForCreatingAccountWithType:(id)a3
{
  return 0;
}

- (id)configurationInfoForViewingAccount:(id)a3
{
  return 0;
}

@end