@interface NSBundle(RPExtensions)
+ (id)_rpFrameworkBundle;
+ (id)_rpLocalizedAppNameFromBundleID:()RPExtensions;
+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:()RPExtensions;
+ (id)baseIdentifier:()RPExtensions;
+ (id)bundleWithPID:()RPExtensions;
+ (id)executablePathWithPID:()RPExtensions;
+ (id)fallbackLanguage;
+ (id)preferredLanguage;
- (id)_rpLocalizedAppName;
@end

@implementation NSBundle(RPExtensions)

+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:()RPExtensions
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] _rpFrameworkBundle];
  v6 = [a1 preferredLanguage];
  v7 = [v5 localizedStringForKey:v4 value:0 table:@"Localizable" localization:v6];

  if (!v7)
  {
    v8 = [a1 fallbackLanguage];
    v7 = [v5 localizedStringForKey:v4 value:0 table:@"Localizable" localization:v8];

    if (!v7)
    {
      v7 = [v5 localizedStringForKey:v4 value:0 table:@"Localizable"];
    }
  }

  return v7;
}

+ (id)preferredLanguage
{
  v0 = [MEMORY[0x263EFF960] preferredLanguages];
  v1 = (void *)MEMORY[0x263F086E0];
  v2 = [(id)objc_opt_class() _rpFrameworkBundle];
  v3 = [v2 localizations];
  id v4 = [v1 preferredLocalizationsFromArray:v3 forPreferences:v0];

  v5 = [v4 firstObject];

  return v5;
}

+ (id)_rpFrameworkBundle
{
  if (_rpFrameworkBundle_onceToken != -1) {
    dispatch_once(&_rpFrameworkBundle_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_rpFrameworkBundle_sFrameworkBundle;

  return v0;
}

- (id)_rpLocalizedAppName
{
  v2 = [a1 objectForInfoDictionaryKey:*MEMORY[0x263EFFA90]];
  if (v2
    || ([a1 objectForInfoDictionaryKey:*MEMORY[0x263EFFB68]],
        (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = v2;
    id v4 = v3;
  }
  else
  {
    id v3 = [a1 objectForInfoDictionaryKey:*MEMORY[0x263EFFB50]];
    id v4 = 0;
  }

  return v3;
}

+ (id)_rpLocalizedAppNameFromBundleID:()RPExtensions
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:v3];
  v5 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedName];
    v8 = v7;
    if (v7
      && ([v7 isEqualToString:&stru_26D117F38] & 1) == 0
      && ![v8 isEqualToString:@"$(PRODUCT_BUNDLE_IDENTIFIER)"])
    {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = [v4 _rpLocalizedAppName];

  v8 = (void *)v9;
  if (!v9)
  {
LABEL_10:
    id v10 = v3;

    v8 = v10;
    goto LABEL_11;
  }
LABEL_8:
  if (([v8 isEqualToString:&stru_26D117F38] & 1) != 0
    || [v8 isEqualToString:@"$(PRODUCT_BUNDLE_IDENTIFIER)"])
  {
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

+ (id)fallbackLanguage
{
  v0 = [MEMORY[0x263EFF960] preferredLanguages];
  v1 = [v0 firstObject];
  v2 = [v1 componentsSeparatedByString:@"-"];
  id v3 = [v2 firstObject];

  return v3;
}

+ (id)baseIdentifier:()RPExtensions
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeLastObject];
  v5 = [v4 componentsJoinedByString:@"."];

  return v5;
}

+ (id)executablePathWithPID:()RPExtensions
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", buffer, proc_pidpath(pid, buffer, 0x1000u), 4);

  return v3;
}

+ (id)bundleWithPID:()RPExtensions
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v0 = NSURL;
  v1 = objc_msgSend(MEMORY[0x263F086E0], "executablePathWithPID:");
  v2 = [v0 fileURLWithPath:v1];

  if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    v7 = "+[NSBundle(RPExtensions) bundleWithPID:]";
    __int16 v8 = 1024;
    int v9 = 115;
    __int16 v10 = 2112;
    v11 = v2;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  executableURL:%@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v2)
  {
    id v3 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      v7 = "+[NSBundle(RPExtensions) bundleWithPID:]";
      __int16 v8 = 1024;
      int v9 = 119;
      __int16 v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  bundleURL:%@", (uint8_t *)&v6, 0x1Cu);
    }
    if (v3)
    {
      id v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end