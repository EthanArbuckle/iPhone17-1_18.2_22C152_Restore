@interface MailAccountViewsProvider
+ (void)initialize;
- (Class)controllerClassForCreatingAccountWithType:(id)a3;
- (Class)controllerClassForCreatingRemoteAccountWithType:(id)a3;
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForViewingAccount:(id)a3;
- (id)configurationInfoForCreatingAccountWithType:(id)a3;
- (id)configurationInfoForViewingAccount:(id)a3;
- (id)supportedAccountTypeIdentifiers;
@end

@implementation MailAccountViewsProvider

+ (void)initialize
{
  preferencesBundle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 load];
}

- (id)supportedAccountTypeIdentifiers
{
  v4[0] = ACAccountTypeIdentifierYahoo;
  v4[1] = ACAccountTypeIdentifierGmail;
  v4[2] = ACAccountTypeIdentifierAol;
  v4[3] = ACAccountTypeIdentifierIMAP;
  v4[4] = ACAccountTypeIdentifierPOP;
  id v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  v3 = objc_opt_class();

  return (Class)v3;
}

- (Class)viewControllerClassForViewingAccount:(id)a3
{
  v3 = [a3 accountType];
  v4 = [v3 supportedDataclasses];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 2)
  {
    v6 = [v3 identifier];
    unsigned __int8 v7 = [v6 isEqualToString:ACAccountTypeIdentifierGmail];

    if ((v7 & 1) == 0)
    {
      v10 = [v3 identifier];
      unsigned __int8 v11 = [v10 isEqualToString:ACAccountTypeIdentifierYahoo];

      if ((v11 & 1) == 0)
      {
        v12 = [v3 identifier];
        [v12 isEqualToString:ACAccountTypeIdentifierAol];
      }
    }
  }
  v8 = (objc_class *)(id)objc_opt_class();

  return v8;
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:ACAccountTypeIdentifierGmail] & 1) != 0
    || ([v3 isEqualToString:ACAccountTypeIdentifierYahoo] & 1) != 0
    || [v3 isEqualToString:ACAccountTypeIdentifierAol])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (Class)controllerClassForCreatingRemoteAccountWithType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:ACAccountTypeIdentifierGmail] & 1) != 0
    || ([v3 isEqualToString:ACAccountTypeIdentifierYahoo] & 1) != 0
    || ([v3 isEqualToString:ACAccountTypeIdentifierAol] & 1) != 0
    || [v3 isEqualToString:ACAccountTypeIdentifierHotmail])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)configurationInfoForCreatingAccountWithType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:ACAccountTypeIdentifierYahoo] & 1) != 0
    || ([v3 isEqualToString:ACAccountTypeIdentifierGmail] & 1) != 0
    || ([v3 isEqualToString:ACAccountTypeIdentifierAol] & 1) != 0
    || ([v3 isEqualToString:ACAccountTypeIdentifierIMAP] & 1) != 0
    || [v3 isEqualToString:ACAccountTypeIdentifierPOP])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  id v5 = [v4 userInfoForAccountTopLevelSpecifier];

  return v5;
}

- (id)configurationInfoForViewingAccount:(id)a3
{
  return 0;
}

@end