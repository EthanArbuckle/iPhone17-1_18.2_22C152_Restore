@interface ASSettingsPlugin
- (Class)controllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForViewingAccount:(id)a3;
- (id)configurationInfoForCreatingAccountWithType:(id)a3;
- (id)configurationInfoForViewingAccount:(id)a3;
- (id)supportedAccountTypeIdentifiers;
@end

@implementation ASSettingsPlugin

- (id)supportedAccountTypeIdentifiers
{
  v4[0] = ACAccountTypeIdentifierExchange;
  v4[1] = ACAccountTypeIdentifierHotmail;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:ACAccountTypeIdentifierExchange] & 1) != 0
    || [v3 isEqualToString:ACAccountTypeIdentifierHotmail])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (Class)viewControllerClassForViewingAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 accountType];
  v5 = [v4 identifier];
  unsigned __int8 v6 = [v5 isEqualToString:ACAccountTypeIdentifierExchange];

  if ((v6 & 1) != 0
    || ([v3 accountType],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 identifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isEqualToString:ACAccountTypeIdentifierHotmail],
        v8,
        v7,
        v9))
  {
    v10 = objc_opt_class();
  }
  else
  {
    v10 = 0;
  }

  return (Class)v10;
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3
{
  if ([a3 isEqualToString:ACAccountTypeIdentifierHotmail]) {
    id v3 = objc_opt_class();
  }
  else {
    id v3 = 0;
  }

  return (Class)v3;
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