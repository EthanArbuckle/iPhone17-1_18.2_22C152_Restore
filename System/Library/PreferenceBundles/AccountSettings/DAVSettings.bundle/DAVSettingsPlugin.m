@interface DAVSettingsPlugin
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForViewingAccount:(id)a3;
- (id)configurationInfoForCreatingAccountWithType:(id)a3;
- (id)configurationInfoForViewingAccount:(id)a3;
- (id)supportedAccountTypeIdentifiers;
@end

@implementation DAVSettingsPlugin

- (id)supportedAccountTypeIdentifiers
{
  v4[0] = ACAccountTypeIdentifierCalDAV;
  v4[1] = ACAccountTypeIdentifierCardDAV;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:ACAccountTypeIdentifierCalDAV] & 1) != 0
    || [v3 isEqualToString:ACAccountTypeIdentifierCardDAV])
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
  unsigned __int8 v6 = [v5 isEqualToString:ACAccountTypeIdentifierCalDAV];

  if ((v6 & 1) != 0
    || ([v3 accountType],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 identifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isEqualToString:ACAccountTypeIdentifierCardDAV],
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

- (id)configurationInfoForCreatingAccountWithType:(id)a3
{
  return 0;
}

- (id)configurationInfoForViewingAccount:(id)a3
{
  return 0;
}

@end