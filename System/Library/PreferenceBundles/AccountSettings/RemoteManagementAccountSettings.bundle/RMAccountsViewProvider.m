@interface RMAccountsViewProvider
- (Class)controllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForViewingAccount:(id)a3;
- (id)configurationInfoForCreatingAccountWithType:(id)a3;
- (id)configurationInfoForViewingAccount:(id)a3;
- (id)supportedAccountTypeIdentifiers;
@end

@implementation RMAccountsViewProvider

- (id)configurationInfoForCreatingAccountWithType:(id)a3
{
  return 0;
}

- (id)configurationInfoForViewingAccount:(id)a3
{
  return 0;
}

- (id)supportedAccountTypeIdentifiers
{
  uint64_t v4 = ACAccountTypeIdentifierRemoteManagement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  return (Class)_objc_opt_class(ACUIViewController, a2, a3);
}

- (Class)viewControllerClassForViewingAccount:(id)a3
{
  return (Class)_objc_opt_class(RMAccountsDataclassConfigurationViewController, a2, a3);
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3
{
  return (Class)_objc_opt_class(RMAccountsCreation, a2, a3);
}

@end