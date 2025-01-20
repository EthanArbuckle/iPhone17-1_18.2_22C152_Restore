@interface NSBundle(InternationalSupportExtensions)
- (id)localizedStringInDeviceLanguageForKey:()InternationalSupportExtensions;
@end

@implementation NSBundle(InternationalSupportExtensions)

- (id)localizedStringInDeviceLanguageForKey:()InternationalSupportExtensions
{
  id v4 = a3;
  if (localizedStringInDeviceLanguageForKey__onceToken != -1) {
    dispatch_once(&localizedStringInDeviceLanguageForKey__onceToken, &__block_literal_global);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&localizedStringInDeviceLanguageForKey__lock);
  v5 = [(id)localizedStringInDeviceLanguageForKey____sharedPreferredLocalizationCache objectForKey:a1];
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA20] _globalPreferredLanguages];
    v7 = (void *)MEMORY[0x1E4F28B50];
    v8 = [a1 localizations];
    v9 = [v7 preferredLocalizationsFromArray:v8 forPreferences:v6];
    v5 = [v9 firstObject];

    [(id)localizedStringInDeviceLanguageForKey____sharedPreferredLocalizationCache setObject:v5 forKey:a1];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&localizedStringInDeviceLanguageForKey__lock);
  v10 = [a1 localizedStringForKey:v4 value:0 table:0 localization:v5];

  return v10;
}

@end