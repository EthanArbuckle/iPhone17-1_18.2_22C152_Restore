@interface MCAppEnforcedRestrictionUtilities
+ (id)appUnavailableInRegionRestrictionForBundleID:(id)a3;
+ (id)clientUUIDForBundleID:(id)a3;
+ (id)currentCountryCodes;
+ (id)enforcedRestrictionsForBundleID:(id)a3 restrictionPlistURL:(id)a4 countryCodes:(id)a5;
@end

@implementation MCAppEnforcedRestrictionUtilities

+ (id)enforcedRestrictionsForBundleID:(id)a3 restrictionPlistURL:(id)a4 countryCodes:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  if (!v9)
  {
    id v9 = +[MCAppEnforcedRestrictionUtilities currentCountryCodes];
  }
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v8];
  if (!v11)
  {
    uint64_t v21 = _MCLogObjects;
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138543362;
    id v35 = v7;
    v22 = "Couldn't find restriction plist for app “%{public}@”";
    v23 = v21;
    uint32_t v24 = 12;
LABEL_23:
    _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    goto LABEL_24;
  }
  v12 = [MEMORY[0x1E4F1CA80] set];
  v13 = [v11 objectForKey:@"MCWhitelistedLocales"];
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_21:

    uint64_t v25 = _MCLogObjects;
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v22 = "Restriction plist is malformatted";
    v23 = v25;
    uint32_t v24 = 2;
    goto LABEL_23;
  }
  id v28 = v9;
  id v29 = v7;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v7 = v29;
          id v9 = v28;
          goto LABEL_21;
        }
        [v12 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v7 = v29;
  id v9 = v28;
  if ([v12 count] && (objc_msgSend(v12, "intersectsSet:", v28) & 1) == 0)
  {
    v20 = +[MCAppEnforcedRestrictionUtilities appUnavailableInRegionRestrictionForBundleID:v29];
    [v10 addEntriesFromDictionary:v20];
  }
LABEL_24:
  if ([v10 count]) {
    v26 = (void *)[v10 copy];
  }
  else {
    v26 = 0;
  }

  return v26;
}

+ (id)clientUUIDForBundleID:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.profiled.appenforced", a3];
}

+ (id)currentCountryCodes
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 countryCode];
  v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = v4;
  if (v3)
  {
    [v4 addObject:v3];
  }
  else
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve a valid country code from NSLocale! Attempting fallback.", buf, 2u);
    }
    id v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          v13 = [v12 countryCode];

          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v9);
    }
    id v14 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v5;
      __int16 v26 = 2114;
      v27 = v7;
      _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_INFO, "Got country codes %{public}@ from languages %{public}@", buf, 0x16u);
    }
  }
  uint64_t v15 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    uint64_t v17 = [v2 localeIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v3;
    __int16 v26 = 2114;
    v27 = v17;
    __int16 v28 = 2114;
    id v29 = v2;
    _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_DEFAULT, "Reevaluating country code %{public}@ from locale identifier %{public}@ of currentLocale %{public}@", buf, 0x20u);
  }
  v18 = (void *)[v5 copy];

  return v18;
}

+ (id)appUnavailableInRegionRestrictionForBundleID:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = [v3 dictionary];
  v8[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [v5 MCSetUnionRestriction:@"blockedAppBundleIDs" values:v6];
  return v5;
}

@end