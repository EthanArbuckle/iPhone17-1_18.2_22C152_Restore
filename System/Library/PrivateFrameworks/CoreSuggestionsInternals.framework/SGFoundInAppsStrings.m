@interface SGFoundInAppsStrings
+ (id)foundInAppsStringCompactVersionWithContactName:(id)a3;
+ (id)foundInAppsStringForCheckInAction:(id)a3;
+ (id)foundInAppsStringLongVersionForAppName:(id)a3 contactName:(id)a4;
+ (id)foundInAppsStringWithoutContactForAppName:(id)a3;
+ (id)localizedStringForKey:(id)a3 preferredLocalization:(id)a4;
+ (id)resourceBundle;
@end

@implementation SGFoundInAppsStrings

+ (id)foundInAppsStringForCheckInAction:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SGFoundInAppsStrings_foundInAppsStringForCheckInAction___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = foundInAppsStringForCheckInAction___pasOnceToken8;
  id v10 = a3;
  if (v3 != -1) {
    dispatch_once(&foundInAppsStringForCheckInAction___pasOnceToken8, block);
  }
  v11 = _PASValidatedFormat_37767((void *)foundInAppsStringForCheckInAction___pasExprOnceResult, @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v10);

  return v11;
}

void __58__SGFoundInAppsStrings_foundInAppsStringForCheckInAction___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = [*(id *)(a1 + 32) localizedStringForKey:@"Checkin Action %@" preferredLocalization:0];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) resourceBundle];
    uint64_t v3 = [v4 localizedStringForKey:@"Checkin Action %@" value:&stru_1F24EEF20 table:*MEMORY[0x1E4F5DF48]];
  }
  uint64_t v5 = (void *)foundInAppsStringForCheckInAction___pasExprOnceResult;
  foundInAppsStringForCheckInAction___pasExprOnceResult = v3;
}

+ (id)foundInAppsStringWithoutContactForAppName:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SGFoundInAppsStrings_foundInAppsStringWithoutContactForAppName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = foundInAppsStringWithoutContactForAppName___pasOnceToken7;
  id v10 = a3;
  if (v3 != -1) {
    dispatch_once(&foundInAppsStringWithoutContactForAppName___pasOnceToken7, block);
  }
  v11 = _PASValidatedFormat_37767((void *)foundInAppsStringWithoutContactForAppName___pasExprOnceResult, @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v10);

  return v11;
}

void __66__SGFoundInAppsStrings_foundInAppsStringWithoutContactForAppName___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = [*(id *)(a1 + 32) localizedStringForKey:@"Found in %@" preferredLocalization:0];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) resourceBundle];
    uint64_t v3 = [v4 localizedStringForKey:@"Found in %@" value:&stru_1F24EEF20 table:*MEMORY[0x1E4F5DF48]];
  }
  uint64_t v5 = (void *)foundInAppsStringWithoutContactForAppName___pasExprOnceResult;
  foundInAppsStringWithoutContactForAppName___pasExprOnceResult = v3;
}

+ (id)foundInAppsStringCompactVersionWithContactName:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SGFoundInAppsStrings_foundInAppsStringCompactVersionWithContactName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = foundInAppsStringCompactVersionWithContactName___pasOnceToken6;
  id v10 = a3;
  if (v3 != -1) {
    dispatch_once(&foundInAppsStringCompactVersionWithContactName___pasOnceToken6, block);
  }
  v11 = _PASValidatedFormat_37767((void *)foundInAppsStringCompactVersionWithContactName___pasExprOnceResult, @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v10);

  return v11;
}

void __71__SGFoundInAppsStrings_foundInAppsStringCompactVersionWithContactName___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = [*(id *)(a1 + 32) localizedStringForKey:@"Chatting with %@" preferredLocalization:0];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) resourceBundle];
    uint64_t v3 = [v4 localizedStringForKey:@"Chatting with %@" value:&stru_1F24EEF20 table:*MEMORY[0x1E4F5DF48]];
  }
  uint64_t v5 = (void *)foundInAppsStringCompactVersionWithContactName___pasExprOnceResult;
  foundInAppsStringCompactVersionWithContactName___pasExprOnceResult = v3;
}

+ (id)foundInAppsStringLongVersionForAppName:(id)a3 contactName:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SGFoundInAppsStrings_foundInAppsStringLongVersionForAppName_contactName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v5 = foundInAppsStringLongVersionForAppName_contactName___pasOnceToken5;
  id v6 = a4;
  id v13 = a3;
  if (v5 != -1) {
    dispatch_once(&foundInAppsStringLongVersionForAppName_contactName___pasOnceToken5, block);
  }
  v14 = _PASValidatedFormat_37767((void *)foundInAppsStringLongVersionForAppName_contactName___pasExprOnceResult, @"%@%@", v7, v8, v9, v10, v11, v12, (uint64_t)v13);

  return v14;
}

void __75__SGFoundInAppsStrings_foundInAppsStringLongVersionForAppName_contactName___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = [*(id *)(a1 + 32) localizedStringForKey:@"Found in %@ with %@" preferredLocalization:0];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) resourceBundle];
    uint64_t v3 = [v4 localizedStringForKey:@"Found in %@ with %@" value:&stru_1F24EEF20 table:*MEMORY[0x1E4F5DF48]];
  }
  uint64_t v5 = (void *)foundInAppsStringLongVersionForAppName_contactName___pasExprOnceResult;
  foundInAppsStringLongVersionForAppName_contactName___pasExprOnceResult = v3;
}

+ (id)localizedStringForKey:(id)a3 preferredLocalization:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 resourceBundle];
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v11 = [v8 localizations];
    uint64_t v12 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    id v13 = [v10 preferredLocalizationsFromArray:v11 forPreferences:v12];

    if (![v13 count])
    {

      v20 = 0;
      goto LABEL_19;
    }
    id v7 = [v13 firstObject];
  }
  v14 = [v9 pathForResource:*MEMORY[0x1E4F5DF48] ofType:*MEMORY[0x1E4F5DF40] inDirectory:@"." forLocalization:v7];
  if (v14)
  {
    id v23 = 0;
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v14 options:2 error:&v23];
    v16 = v23;
    if (v15)
    {
      id v22 = 0;
      v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v15 options:0 format:0 error:&v22];
      v18 = v22;

      if (!v17)
      {
        v19 = sgLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v25 = v14;
          __int16 v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "Could not parse localized strings from %@: %@", buf, 0x16u);
        }
      }
      v20 = [v17 objectForKeyedSubscript:v6];
    }
    else
    {
      v17 = sgLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v14;
        __int16 v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "Could not load localized strings from %@: %@", buf, 0x16u);
      }
      v20 = 0;
      v18 = v16;
    }
  }
  else
  {
    v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "Could not get localized string path for localization '%@", buf, 0xCu);
    }
    v20 = 0;
  }

LABEL_19:
  return v20;
}

+ (id)resourceBundle
{
  return (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:*MEMORY[0x1E4F5DEE0]];
}

@end