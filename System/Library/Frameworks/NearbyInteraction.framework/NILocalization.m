@interface NILocalization
+ (id)_niFrameworkBundle;
+ (id)_niLocalizedStringFromBundle:(id)a3 withKey:(id)a4;
+ (id)_niLocalizedStringFromFrameworkBundleWithKey:(id)a3;
+ (id)fallbackBundle;
+ (id)fallbackBundleWithBundle:(id)a3;
+ (id)localizedBundle;
+ (id)localizedBundleWithBundle:(id)a3;
@end

@implementation NILocalization

+ (id)_niFrameworkBundle
{
  if (_niFrameworkBundle_onceToken != -1) {
    dispatch_once(&_niFrameworkBundle_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_niFrameworkBundle_sFrameworkBundle;

  return v2;
}

void __36__NILocalization__niFrameworkBundle__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/Frameworks/NearbyInteraction.framework"];
  uint64_t v1 = [v0 bundleWithURL:v3];
  v2 = (void *)_niFrameworkBundle_sFrameworkBundle;
  _niFrameworkBundle_sFrameworkBundle = v1;
}

+ (id)_niLocalizedStringFromFrameworkBundleWithKey:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() localizedBundle];
  v5 = [v4 localizedStringForKey:v3 value:0 table:0];

  if (!v5)
  {
    v6 = [(id)objc_opt_class() fallbackBundle];
    v5 = [v6 localizedStringForKey:v3 value:0 table:0];

    if (!v5)
    {
      v7 = [(id)objc_opt_class() _niFrameworkBundle];
      v5 = [v7 localizedStringForKey:v3 value:0 table:0];
    }
  }

  return v5;
}

+ (id)fallbackBundle
{
  v2 = objc_opt_class();
  id v3 = [(id)objc_opt_class() _niFrameworkBundle];
  v4 = [v2 fallbackBundleWithBundle:v3];

  return v4;
}

+ (id)localizedBundle
{
  v2 = objc_opt_class();
  id v3 = [(id)objc_opt_class() _niFrameworkBundle];
  v4 = [v2 localizedBundleWithBundle:v3];

  return v4;
}

+ (id)_niLocalizedStringFromBundle:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() localizedBundleWithBundle:v5];
  v8 = [v7 localizedStringForKey:v6 value:0 table:0];

  if (!v8)
  {
    v9 = [(id)objc_opt_class() fallbackBundleWithBundle:v5];
    v8 = [v9 localizedStringForKey:v6 value:0 table:0];

    if (!v8)
    {
      v8 = [v5 localizedStringForKey:v6 value:0 table:0];
    }
  }

  return v8;
}

+ (id)fallbackBundleWithBundle:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  id v5 = [v3 preferredLanguages];
  id v6 = [v5 firstObject];
  v7 = [v6 componentsSeparatedByString:@"-"];
  v8 = [v7 firstObject];

  v9 = [v4 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v8];

  v10 = (void *)MEMORY[0x1E4F28B50];
  v11 = [v9 stringByDeletingLastPathComponent];
  v12 = [v10 bundleWithPath:v11];

  return v12;
}

+ (id)localizedBundleWithBundle:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  id v5 = [v3 preferredLanguages];
  id v6 = (void *)MEMORY[0x1E4F28B50];
  v7 = [(id)objc_opt_class() _niFrameworkBundle];
  v8 = [v7 localizations];
  v9 = [v6 preferredLocalizationsFromArray:v8 forPreferences:v5];

  v10 = [v4 resourcePath];

  v11 = NSString;
  v12 = [v9 firstObject];
  v13 = [v11 stringWithFormat:@"%@.lproj", v12];

  v14 = (void *)MEMORY[0x1E4F28B50];
  v15 = [v10 stringByAppendingPathComponent:v13];
  v16 = [v14 bundleWithPath:v15];

  return v16;
}

@end