@interface UNLocalizedStringFactory
+ (id)localizedUserNotificationStringForKey:(id)a3 arguments:(id)a4;
+ (id)localizedUserNotificationStringForKey:(id)a3 arguments:(id)a4 cfBundle:(__CFBundle *)a5 defaultValue:(id)a6;
@end

@implementation UNLocalizedStringFactory

+ (id)localizedUserNotificationStringForKey:(id)a3 arguments:(id)a4 cfBundle:(__CFBundle *)a5 defaultValue:(id)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = UNFormatLocalizedStringInBundleWithDefaultValue(v10, v9, a5, a6);
  v12 = +[UNLocalizedString localizedStringForKey:v10 arguments:v9 value:v11];

  return v12;
}

+ (id)localizedUserNotificationStringForKey:(id)a3 arguments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
  v8 = objc_msgSend(v7, "un_applicationBundleURL");
  id v9 = objc_msgSend(MEMORY[0x1E4F28B50], "un_safeBundleWithURL:", v8);
  id v10 = [v9 localizedStringForKey:v5 value:&stru_1F062A810 table:0];
  v11 = v10;
  if (v6)
  {
    UNFormatLocalizedString(v10, v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v10;
  }
  v13 = v12;
  v14 = +[UNLocalizedString localizedStringForKey:v5 arguments:v6 value:v12];

  return v14;
}

@end