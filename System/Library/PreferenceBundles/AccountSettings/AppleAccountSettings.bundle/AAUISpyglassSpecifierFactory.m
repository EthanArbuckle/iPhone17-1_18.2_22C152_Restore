@interface AAUISpyglassSpecifierFactory
+ (id)currentSpecifierForPaymentAndShipping;
+ (id)currentSpecifierForPersonalInformation:(BOOL)a3;
+ (id)currentSpecifierForSignInAndSecurity;
+ (id)specifierForPaymentAndShipping:(id)a3 isPaymentSpecifierProviderNil:(BOOL)a4;
+ (id)specifierForPersonalInformationWithAppleIDType:(BOOL)a3;
+ (id)specifierForSignInAndSecurity;
+ (id)specifierForSubscriptions:(id)a3;
@end

@implementation AAUISpyglassSpecifierFactory

+ (id)specifierForPersonalInformationWithAppleIDType:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[AAPreferences isSpyglass2023Enabled])
  {
    id v5 = [objc_alloc((Class)AAUISpyglassSpecifierRowModel) initForSpecifierType:1];
    v6 = [v5 title];
    v7 = [v5 iconName];
    v8 = +[UIImage systemImageNamed:v7];
    v9 = +[UIColor systemWhiteColor];
    v10 = [v8 imageWithTintColor:v9 renderingMode:1];

    v11 = +[UIColor systemGrayColor];
    v12 = +[UIImage addBackgroundForImage:v10 withBackgroundColor:v11];

    v13 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:0 cell:1 edit:0];
    [v13 setProperty:v12 forKey:PSIconImageKey];
    [v13 setIdentifier:@"APPLE_ACCOUNT_CONTACT"];
  }
  else
  {
    v13 = [a1 currentSpecifierForPersonalInformation:v3];
  }

  return v13;
}

+ (id)currentSpecifierForPersonalInformation:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"APPLEID_CONTACT_CELL_TITLE_MAID";
  }
  else {
    CFStringRef v3 = @"APPLEID_CONTACT_CELL_TITLE";
  }
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:v3 value:&stru_76890 table:@"Localizable"];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  [v6 setIdentifier:@"APPLE_ACCOUNT_CONTACT"];

  return v6;
}

+ (id)specifierForSignInAndSecurity
{
  if (+[AAPreferences isSpyglass2023Enabled])
  {
    id v3 = [objc_alloc((Class)AAUISpyglassSpecifierRowModel) initForSpecifierType:2];
    v4 = [v3 title];
    id v5 = +[UIImageSymbolConfiguration configurationWithScale:3];
    v6 = [v3 iconName];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = +[UIImage imageNamed:v6 inBundle:v7 withConfiguration:v5];
    v9 = +[UIColor systemWhiteColor];
    v10 = [v8 imageWithTintColor:v9 renderingMode:1];

    v11 = +[UIColor systemGrayColor];
    v12 = +[UIImage addBackgroundForImage:v10 withBackgroundColor:v11];

    v13 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:1 edit:0];
    [v13 setIdentifier:@"PASSWORD_AND_SECURITY"];
    [v13 setProperty:v12 forKey:PSIconImageKey];
  }
  else
  {
    v13 = [a1 currentSpecifierForSignInAndSecurity];
  }

  return v13;
}

+ (id)currentSpecifierForSignInAndSecurity
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"APPLEID_SECURITY_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  [v4 setIdentifier:@"PASSWORD_AND_SECURITY"];

  return v4;
}

+ (id)specifierForPaymentAndShipping:(id)a3 isPaymentSpecifierProviderNil:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (+[AAPreferences isSpyglass2023Enabled])
  {
    id v7 = [objc_alloc((Class)AAUISpyglassSpecifierRowModel) initForSpecifierType:3];
    v8 = v7;
    if (!v6)
    {
      v9 = [v7 title];
      id v6 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:2 edit:0];
      [v6 setIdentifier:@"PAYMENT_AND_SHIPPING"];
    }
    v10 = [v8 iconName];
    v11 = +[UIImage systemImageNamed:v10];
    v12 = +[UIColor systemWhiteColor];
    v13 = [v11 imageWithTintColor:v12 renderingMode:1];

    v14 = +[UIColor systemGrayColor];
    v15 = +[UIImage addBackgroundForImage:v13 withBackgroundColor:v14];

    [v6 setProperty:v15 forKey:PSIconImageKey];
  }
  else if (v4)
  {
    id v16 = [a1 currentSpecifierForPaymentAndShipping];
    goto LABEL_8;
  }
  id v16 = v6;
  id v6 = v16;
LABEL_8:
  v17 = v16;

  return v17;
}

+ (id)currentSpecifierForPaymentAndShipping
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"APPLEID_PAYMENT_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  BOOL v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:2 edit:0];

  [v4 setIdentifier:@"PAYMENT_AND_SHIPPING"];

  return v4;
}

+ (id)specifierForSubscriptions:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:v3];
  if (+[AAPreferences isSpyglass2023Enabled])
  {
    id v5 = [objc_alloc((Class)AAUISpyglassSpecifierRowModel) initForSpecifierType:4];
    id v6 = +[UIImageSymbolConfiguration configurationWithWeight:6];
    v20 = v5;
    id v7 = [v5 iconName];
    v8 = +[UIImage systemImageNamed:v7 withConfiguration:v6];
    v9 = +[UIColor systemWhiteColor];
    v10 = [v8 imageWithTintColor:v9 renderingMode:1];

    v11 = +[UIColor systemGrayColor];
    v12 = +[UIImage addBackgroundForImage:v10 withBackgroundColor:v11];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      uint64_t v17 = PSIconImageKey;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) setProperty:v12 forKey:v17];
        }
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }

  return v4;
}

@end