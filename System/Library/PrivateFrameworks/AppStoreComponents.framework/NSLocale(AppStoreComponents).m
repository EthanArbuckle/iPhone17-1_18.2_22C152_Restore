@interface NSLocale(AppStoreComponents)
+ (id)asc_storefrontLocale;
- (BOOL)asc_prefersRightToLeftLayout;
@end

@implementation NSLocale(AppStoreComponents)

+ (id)asc_storefrontLocale
{
  v0 = +[ASCDefaults daemonDefaults];
  v1 = [v0 storefrontLocaleID];

  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v1];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "No storefront locale specified, falling back to device locale", v5, 2u);
    }
    uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  v3 = (void *)v2;

  return v3;
}

- (BOOL)asc_prefersRightToLeftLayout
{
  uint64_t v2 = +[ASCDefaults daemonDefaults];
  char v3 = [v2 forceRightToLeftLayout];

  if (v3) {
    return 1;
  }
  v5 = (void *)MEMORY[0x1E4FB1380];
  v6 = [a1 localeIdentifier];
  uint64_t v7 = [v5 defaultWritingDirectionForLanguage:v6];

  return v7 == 1;
}

@end