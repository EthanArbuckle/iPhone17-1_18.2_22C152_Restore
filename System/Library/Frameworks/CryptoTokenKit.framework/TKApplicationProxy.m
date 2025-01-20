@interface TKApplicationProxy
+ (id)_displayNamesCache;
- (id)_coreServicesLocalizedNameForBundleID:(id)a3;
- (id)displayNameForBundleID:(id)a3;
@end

@implementation TKApplicationProxy

- (id)displayNameForBundleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[TKApplicationProxy _displayNamesCache];
    v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      v6 = [(TKApplicationProxy *)self _coreServicesLocalizedNameForBundleID:v4];
      v7 = +[TKApplicationProxy _displayNamesCache];
      [v7 setObject:v6 forKey:v4];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_coreServicesLocalizedNameForBundleID:(id)a3
{
  id v3 = a3;
  id v17 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v17];
  id v5 = v17;
  if (!v4)
  {
    if (TK_LOG_appproxy_once != -1) {
      dispatch_once(&TK_LOG_appproxy_once, &__block_literal_global_8);
    }
    v11 = TK_LOG_appproxy_log;
    if (os_log_type_enabled((os_log_t)TK_LOG_appproxy_log, OS_LOG_TYPE_ERROR)) {
      [(TKApplicationProxy *)(uint64_t)v3 _coreServicesLocalizedNameForBundleID:v11];
    }
    id v12 = v3;
    goto LABEL_11;
  }
  v6 = [v4 applicationState];
  int v7 = [v6 isValid];

  if (!v7)
  {
    id v12 = [v4 bundleIdentifier];
LABEL_11:
    id v10 = v12;
    goto LABEL_17;
  }
  v8 = [v4 localizedName];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13 = [v4 localizedShortName];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v4 bundleIdentifier];
    }
    id v10 = v15;
  }
LABEL_17:

  return v10;
}

+ (id)_displayNamesCache
{
  if (_displayNamesCache_oncePredicate != -1) {
    dispatch_once(&_displayNamesCache_oncePredicate, &__block_literal_global_16);
  }
  v2 = (void *)_displayNamesCache_cache;

  return v2;
}

uint64_t __40__TKApplicationProxy__displayNamesCache__block_invoke()
{
  _displayNamesCache_cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

- (void)_coreServicesLocalizedNameForBundleID:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "failed to get app record for %{public}@ with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end