@interface CTCategory
+ (BOOL)supportsSecureCoding;
+ (CKContextClient)client;
+ (id)_DHIDtoCategoryDisplayNameMap;
+ (id)_DHToAppStoreCategoriesMap;
+ (id)_appBundleIdentifierStringFor:(id)a3 categoryIdentifier:(id)a4;
+ (id)_bundleIdentifierForContextResponse:(id)a3;
+ (id)_equivalentBundleIDsMapping;
+ (id)_equivalentBundleIDsMappingForWatchOSBundleID:(id)a3;
+ (id)_equivalentBundleIDsWithSchemesRemovedMapping;
+ (id)_getAssociatedDomainsForHostNames:(id)a3;
+ (id)_getEquivalentBundleIdentifiers:(id)a3;
+ (id)_identifierForContextResponse:(id)a3;
+ (id)_newXpcConnection;
+ (id)_overrideEquivalentIdentifiers:(id)a3 forBundleID:(id)a4;
+ (id)_relatedItemsForContextResponse:(id)a3;
+ (id)_urlComponentsForHostName:(id)a3;
+ (id)_urlStringsForHostNames:(id)a3;
+ (id)_xpcConnection;
+ (id)bundleIDForPlatform:(id)a3 fromBundleID:(id)a4 platform:(id)a5;
+ (id)equivalentIdentifiersForBundleID:(id)a3;
+ (id)itemWith:(id)a3 platform:(id)a4 array:(id)a5;
+ (id)localizedNameForIdentifier:(id)a3;
+ (id)parentAppBundleIdentifierForAppRecord:(id)a3;
+ (id)schemeStringForPlatform:(id)a3;
+ (id)shortLocalizedNameForIdentifier:(id)a3;
+ (id)systemAppCategoryIdentifierForBundleIdentifier:(id)a3;
+ (id)systemCategoryIDWithPatternMatching:(id)a3;
+ (void)_getCategoryTypeForDomainName:(id)a3 withCompletionHandler:(id)a4;
+ (void)_lookupAppStoreUsing:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5;
+ (void)categoryForBundleID:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5;
+ (void)categoryForBundleID:(id)a3 withCompletionHandler:(id)a4;
+ (void)categoryForBundleIdentifiers:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5;
+ (void)categoryForDomainName:(id)a3 withCompletionHandler:(id)a4;
+ (void)categoryForDomainNames:(id)a3 withCompletionHandler:(id)a4;
+ (void)categoryForDomainURL:(id)a3 withCompletionHandler:(id)a4;
+ (void)categoryForDomainURLs:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCategory:(id)a3;
- (BOOL)isSystemBundleIdentifier;
- (CTCategory)initWithCoder:(id)a3;
- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6;
- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7;
- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7 canonicalBundleIdentifier:(id)a8;
- (CTCategory)initWithIdentifier:(id)a3 webDomains:(id)a4 bundleIdentifier:(id)a5;
- (CTCategory)initWithIdentifier:(id)a3 webDomains:(id)a4 bundleIdentifier:(id)a5 primaryWebDomain:(id)a6;
- (NSArray)equivalentBundleIdentifiers;
- (NSArray)webDomains;
- (NSString)bundleIdentifier;
- (NSString)canonicalBundleIdentifier;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)primaryWebDomain;
- (id)description;
- (unint64_t)hash;
- (void)_ctCategoryCommonInitWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7 canonicalBundleIdentifier:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCanonicalBundleIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrimaryWebDomain:(id)a3;
- (void)setWebDomains:(id)a3;
@end

@implementation CTCategory

void __65__CTCategory_categoryForBundleID_platform_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 objectForKey:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)systemCategoryIDWithPatternMatching:(id)a3
{
  v3 = (void *)MEMORY[0x263F08AE8];
  id v4 = a3;
  uint64_t v5 = [v3 regularExpressionWithPattern:@"com.apple.InstallAssistant.*" options:1 error:0];
  uint64_t v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  if (v6) {
    id v7 = @"DH0011";
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (void)categoryForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  v9 = @"CTOSPlatformiOS";
  id v7 = a4;
  id v8 = a3;
  [a1 categoryForBundleID:v8 platform:v9 withCompletionHandler:v7];
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_3;
  v6[3] = &unk_2641D99E8;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  [0 code];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_getEquivalentBundleIdentifiers:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9B0];
  id v4 = a3;
  id v5 = [v3 orderedSet];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__CTCategory__getEquivalentBundleIdentifiers___block_invoke;
  v8[3] = &unk_2641D9C18;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

+ (id)_getAssociatedDomainsForHostNames:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9B0];
  id v4 = a3;
  id v5 = [v3 orderedSet];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__CTCategory__getAssociatedDomainsForHostNames___block_invoke;
  v8[3] = &unk_2641D9C90;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

+ (id)_overrideEquivalentIdentifiers:(id)a3 forBundleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (_overrideEquivalentIdentifiers_forBundleID__onceToken != -1) {
    dispatch_once(&_overrideEquivalentIdentifiers_forBundleID__onceToken, &__block_literal_global_218);
  }
  long long v8 = [(id)_overrideEquivalentIdentifiers_forBundleID___equivalentBundleIDsOverrides objectForKey:v6];
  id v9 = v7;
  if (v8)
  {
    id v9 = (void *)[v7 mutableCopy];
    [v9 removeObjectsInArray:v8];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315651;
      v12 = "+[CTCategory _overrideEquivalentIdentifiers:forBundleID:]";
      __int16 v13 = 2113;
      id v14 = v7;
      __int16 v15 = 2113;
      v16 = v9;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s %{private}@ -> %{private}@", (uint8_t *)&v11, 0x20u);
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryWebDomain, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);
  objc_storeStrong((id *)&self->_equivalentBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_canonicalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)_identifierForContextResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 error], id v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = objc_msgSend(v4, "level1Topics", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          __int16 v13 = [v12 topicId];
          int v14 = [v13 hasPrefix:@"DH"];

          if (v14)
          {
            id v6 = [v12 topicId];
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v6 = 0;
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_relatedItemsForContextResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 error], id v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(v4, "level2Topics", 0);
    id v6 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          int v11 = [v10 relatedItems];
          uint64_t v12 = [v11 count];

          if (v12)
          {
            id v6 = [v10 relatedItems];
            goto LABEL_14;
          }
        }
        id v6 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)equivalentIdentifiersForBundleID:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CTCategory _equivalentBundleIDsWithSchemesRemovedMapping];
  id v5 = [v4 objectForKey:v3];
  if (v5)
  {
    long long v18 = v4;
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v17 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = [NSURL URLWithString:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        uint64_t v12 = [v11 host];
        if (([v12 isEqualToString:v3] & 1) == 0)
        {

LABEL_11:
          long long v15 = [v11 host];
          [v6 addObject:v15];

          goto LABEL_12;
        }
        __int16 v13 = [v11 scheme];
        int v14 = [v13 isEqualToString:@"ios"];

        if (v14) {
          goto LABEL_11;
        }
LABEL_12:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v8)
      {
LABEL_14:

        id v5 = v17;
        id v4 = v18;
        goto LABEL_16;
      }
    }
  }
  id v6 = 0;
LABEL_16:

  return v6;
}

+ (id)parentAppBundleIdentifierForAppRecord:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    long long v15 = 0;
    int v11 = 0;
    goto LABEL_11;
  }
  id v5 = [v3 entitlements];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v5 objectForKey:@"com.apple.developer.on-demand-install-capable" ofClass:v6 valuesOfClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v5 objectForKey:@"com.apple.developer.parent-application-identifiers" ofClass:v9 valuesOfClass:objc_opt_class()];
  int v11 = v10;
  if (!v8 || ![v10 count]) {
    goto LABEL_9;
  }
  uint64_t v12 = [v11 firstObject];
  int v13 = [v12 hasPrefix:@"com."];

  int v14 = [v11 firstObject];
  long long v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v4 bundleIdentifier];
      int v22 = 138478083;
      long long v23 = v16;
      __int16 v24 = 2113;
      uint64_t v25 = v11;
      long long v17 = &_os_log_internal;
      long long v18 = "APPSHACK CLIP app %{private}@ parentAppIDs: %{private}@";
LABEL_16:
      _os_log_impl(&dword_213B5E000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  uint64_t v19 = [v14 rangeOfString:@"."];

  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_9:
    long long v15 = 0;
    goto LABEL_10;
  }
  long long v21 = [v11 firstObject];
  long long v15 = [v21 substringFromIndex:v19 + 1];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = [v4 bundleIdentifier];
    int v22 = 138478083;
    long long v23 = v16;
    __int16 v24 = 2113;
    uint64_t v25 = v11;
    long long v17 = &_os_log_internal;
    long long v18 = "CLIP app %{private}@ parentAppIDs: %{private}@";
    goto LABEL_16;
  }
LABEL_10:

LABEL_11:
  return v15;
}

- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7 canonicalBundleIdentifier:(id)a8
{
  v21.receiver = self;
  v21.super_class = (Class)CTCategory;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [(CTCategory *)&v21 init];
  -[CTCategory _ctCategoryCommonInitWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:](v19, "_ctCategoryCommonInitWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:", v18, v17, v16, v15, v14, v13, v21.receiver, v21.super_class);

  return v19;
}

uint64_t __48__CTCategory__getAssociatedDomainsForHostNames___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v28 = a2;
  if (([v28 hasPrefix:@"app://"] & 1) == 0)
  {
    id v6 = v28;
    uint64_t v7 = objc_msgSend(v6, "rangeOfString:options:range:", @".", 2, 0, objc_msgSend(v6, "length"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v8 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = [v6 substringToIndex:v7];
      uint64_t v9 = v10;
      if (v10)
      {
        int v8 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v10, "length") + 1);
        char v11 = 0;
LABEL_8:
        uint64_t v12 = [v8 length];
        if (!v9 || !v12)
        {
          *a4 = 1;
LABEL_20:

          goto LABEL_21;
        }
        if ([v9 caseInsensitiveCompare:@"www"])
        {
          if (v11)
          {
LABEL_14:
            [*(id *)(a1 + 32) addObject:v6];
            id v13 = *(void **)(a1 + 32);
            id v14 = [NSString stringWithFormat:@"www.%@", v6];
            [v13 addObject:v14];

            id v15 = *(void **)(a1 + 32);
            id v16 = [NSString stringWithFormat:@"m.%@", v6];
            [v15 addObject:v16];

            id v17 = *(void **)(a1 + 32);
            [NSString stringWithFormat:@"mobile.%@", v6];
            int v22 = LABEL_19:;
            [v17 addObject:v22];

            goto LABEL_20;
          }
          if ([v9 caseInsensitiveCompare:@"m"])
          {
            if (![v9 caseInsensitiveCompare:@"mobile"])
            {
              [*(id *)(a1 + 32) addObject:v8];
              long long v23 = *(void **)(a1 + 32);
              __int16 v24 = [NSString stringWithFormat:@"www.%@", v8];
              [v23 addObject:v24];

              uint64_t v25 = *(void **)(a1 + 32);
              uint64_t v26 = [NSString stringWithFormat:@"m.%@", v8];
              [v25 addObject:v26];

              [*(id *)(a1 + 32) addObject:v6];
              goto LABEL_20;
            }
            goto LABEL_14;
          }
          [*(id *)(a1 + 32) addObject:v8];
          long long v20 = *(void **)(a1 + 32);
          objc_super v21 = [NSString stringWithFormat:@"www.%@", v8];
          [v20 addObject:v21];

          [*(id *)(a1 + 32) addObject:v6];
        }
        else
        {
          [*(id *)(a1 + 32) addObject:v8];
          [*(id *)(a1 + 32) addObject:v6];
          id v18 = *(void **)(a1 + 32);
          uint64_t v19 = [NSString stringWithFormat:@"m.%@", v8];
          [v18 addObject:v19];
        }
        id v17 = *(void **)(a1 + 32);
        [NSString stringWithFormat:@"mobile.%@", v8];
        goto LABEL_19;
      }
      int v8 = 0;
    }
    char v11 = 1;
    goto LABEL_8;
  }
LABEL_21:
  return MEMORY[0x270F9A758]();
}

+ (id)_appBundleIdentifierStringFor:(id)a3 categoryIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"app://%@?level1.id=%@", a3, a4];
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  id v27 = [MEMORY[0x263EFF9A0] dictionary];
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_cold_1((uint64_t)v6);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v20 = 0;
    objc_super v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy__0;
    __int16 v24 = __Block_byref_object_dispose__0;
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_202;
    v19[3] = &unk_2641D99C0;
    uint64_t v7 = *(void *)(a1 + 40);
    v19[4] = &v20;
    v19[5] = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v19];
    int v8 = [*(id *)(a1 + 40) client];
    uint64_t v9 = (void *)[v8 newRequest];

    uint64_t v10 = (void *)[(id)v21[5] copy];
    [v9 setUrls:v10];

    [v9 setIncludeHigherLevelTopics:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_2641D9A10;
    id v11 = v5;
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v11;
    id v17 = v26;
    uint64_t v18 = v13;
    id v16 = v12;
    [v9 executeCategorizationRequestWithReply:v14];

    _Block_object_dispose(&v20, 8);
  }
  _Block_object_dispose(v26, 8);
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v45 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = (void *)v6;
  int v8 = @"DH1009";
  if (v6) {
    int v8 = (__CFString *)v6;
  }
  uint64_t v9 = v8;

  v43 = [(id)objc_opt_class() _appBundleIdentifierStringFor:v45 categoryIdentifier:v9];
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v11 = [(id)objc_opt_class() _relatedItemsForContextResponse:v10];
  v42 = (void *)v10;
  uint64_t v12 = [(id)objc_opt_class() _identifierForContextResponse:v10];
  if ([(__CFString *)v12 length])
  {
    v40 = v12;
  }
  else
  {
    uint64_t v13 = v9;

    v40 = v13;
  }
  id v14 = [MEMORY[0x263EFF9B0] orderedSet];
  if ([v11 count])
  {
    id v15 = *(void **)(a1 + 48);
    id v16 = [v11 array];
    v38 = [v15 _getAssociatedDomainsForHostNames:v16];

    id v17 = *(void **)(a1 + 48);
    uint64_t v18 = [v11 array];
    uint64_t v19 = [v17 _getEquivalentBundleIdentifiers:v18];

    if ([v19 count]) {
      [v14 unionOrderedSet:v19];
    }
  }
  else
  {
    v38 = 0;
  }
  uint64_t v20 = [*(id *)(a1 + 48) equivalentIdentifiersForBundleID:v45];
  if (v20) {
    [v14 unionOrderedSet:v20];
  }
  unint64_t v21 = [v5 count];
  uint64_t v22 = (void *)MEMORY[0x263EFF9B0];
  v44 = v5;
  if (v21 > 1)
  {
    __int16 v24 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v5, "count", v20) - 1);
    id v25 = [v5 objectsAtIndexes:v24];
    long long v23 = [v22 orderedSetWithArray:v25];
  }
  else
  {
    long long v23 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSet", v20);
  }
  if ([v23 count]) {
    [v14 unionOrderedSet:v23];
  }
  uint64_t v37 = a1;
  v41 = v11;
  v39 = v9;
  if ([v14 count])
  {
    id v26 = [v14 firstObject];
    id v27 = v45;
  }
  else
  {
    id v28 = v45;
    id v27 = v45;
    id v26 = v28;
  }
  [v14 addObject:v27];
  v29 = +[CTCategory systemAppCategoryIdentifierForBundleIdentifier:v45];
  v30 = [v14 array];
  v31 = +[CTCategory _overrideEquivalentIdentifiers:v30 forBundleID:v45];

  v32 = [CTCategory alloc];
  if (v29) {
    v33 = v29;
  }
  else {
    v33 = v40;
  }
  v34 = [v38 array];
  v35 = [(CTCategory *)v32 initWithIdentifier:v33 equivalentBundleIdentifiers:v31 webDomains:v34 bundleIdentifier:v45];

  [(CTCategory *)v35 setCanonicalBundleIdentifier:v26];
  [*(id *)(*(void *)(*(void *)(v37 + 40) + 8) + 40) setObject:v35 forKeyedSubscript:v45];
}

- (void)_ctCategoryCommonInitWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7 canonicalBundleIdentifier:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v19;

  unint64_t v21 = (NSString *)[v16 copy];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v21;

  long long v23 = (NSArray *)[v18 copy];
  equivalentBundleIdentifiers = self->_equivalentBundleIdentifiers;
  self->_equivalentBundleIdentifiers = v23;

  id v25 = (NSArray *)[v17 copy];
  webDomains = self->_webDomains;
  self->_webDomains = v25;

  id v27 = (NSString *)[v15 copy];
  primaryWebDomain = self->_primaryWebDomain;
  self->_primaryWebDomain = v27;

  v29 = (NSString *)[v14 copy];
  canonicalBundleIdentifier = self->_canonicalBundleIdentifier;
  self->_canonicalBundleIdentifier = v29;
}

+ (id)systemAppCategoryIdentifierForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 systemCategoryIDWithPatternMatching:v4];
  if (!v5)
  {
    uint64_t v6 = +[CTCategories systemHiddenBundleIdentifiersForDeviceFamily:102];
    char v7 = [v6 containsObject:v4];

    if (v7)
    {
      id v5 = @"DH0011";
    }
    else
    {
      int v8 = +[CTCategories systemBlockableBundleIdentifiersForDeviceFamily:102];
      char v9 = [v8 containsObject:v4];

      if (v9)
      {
        id v5 = @"DH0012";
      }
      else
      {
        uint64_t v10 = +[CTCategories systemUnblockableBundleIdentifiersForDeviceFamily:102];
        int v11 = [v10 containsObject:v4];

        if (v11) {
          id v5 = @"DH0013";
        }
        else {
          id v5 = 0;
        }
      }
    }
  }

  return v5;
}

+ (void)categoryForBundleID:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v18[0] = v8;
  uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
  id v11 = a4;
  uint64_t v12 = [v10 arrayWithObjects:v18 count:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__CTCategory_categoryForBundleID_platform_withCompletionHandler___block_invoke;
  v15[3] = &unk_2641D9998;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [a1 categoryForBundleIdentifiers:v12 platform:v11 withCompletionHandler:v15];
}

+ (void)categoryForBundleIdentifiers:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke;
  v35[3] = &unk_2641D9A38;
  id v11 = v10;
  id v36 = v11;
  id v37 = a1;
  uint64_t v12 = (void *)MEMORY[0x216691E10](v35);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__0;
  v33[4] = __Block_byref_object_dispose__0;
  id v34 = [MEMORY[0x263EFF980] array];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__0;
  v31[4] = __Block_byref_object_dispose__0;
  id v32 = [MEMORY[0x263EFF9A0] dictionary];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__0;
  v29[4] = __Block_byref_object_dispose__0;
  id v30 = 0;
  id v13 = +[CTCategory _xpcConnection];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_206;
  v27[3] = &unk_2641D9A60;
  id v14 = v11;
  id v28 = v14;
  id v15 = [v13 remoteObjectProxyWithErrorHandler:v27];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_208;
  v19[3] = &unk_2641D9AD8;
  id v16 = v9;
  id v20 = v16;
  long long v23 = v31;
  __int16 v24 = v29;
  id v25 = v33;
  id v17 = v8;
  id v21 = v17;
  id v18 = v12;
  id v22 = v18;
  id v26 = a1;
  [v15 genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:v17 replyHandler:v19];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
}

+ (id)_xpcConnection
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)_connection;
  if (!v3)
  {
    id v3 = (id)[v2 _newXpcConnection];
    objc_storeStrong((id *)&_connection, v3);
  }
  objc_sync_exit(v2);

  return v3;
}

uint64_t __46__CTCategory__getEquivalentBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 hasPrefix:@"app://"])
  {
    id v3 = [NSURL URLWithString:v6];
    id v4 = [v3 host];

    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
  return MEMORY[0x270F9A790]();
}

- (void)setCanonicalBundleIdentifier:(id)a3
{
}

- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7
{
  return [(CTCategory *)self initWithIdentifier:a3 equivalentBundleIdentifiers:a4 webDomains:a5 bundleIdentifier:a6 primaryWebDomain:a7 canonicalBundleIdentifier:0];
}

- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6
{
  return [(CTCategory *)self initWithIdentifier:a3 equivalentBundleIdentifiers:a4 webDomains:a5 bundleIdentifier:a6 primaryWebDomain:0];
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)_equivalentBundleIDsMapping
{
  if (_equivalentBundleIDsMapping_onceToken != -1) {
    dispatch_once(&_equivalentBundleIDsMapping_onceToken, &__block_literal_global_510);
  }
  id v2 = (void *)_equivalentBundleIDsMapping__mapping;
  return v2;
}

+ (CKContextClient)client
{
  if (client_onceToken != -1) {
    dispatch_once(&client_onceToken, &__block_literal_global);
  }
  id v2 = (void *)client_client;
  return (CKContextClient *)v2;
}

uint64_t __20__CTCategory_client__block_invoke()
{
  client_client = [MEMORY[0x263F33BA8] clientWithDefaultRequestType:6];
  return MEMORY[0x270F9A758]();
}

+ (id)_newXpcConnection
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "CTCategory::_newXpcConnection", v5, 2u);
  }
  id v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.ctcategories.service"];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4A51F8];
  [v2 setRemoteObjectInterface:v3];
  [v2 resume];

  return v2;
}

- (CTCategory)initWithIdentifier:(id)a3 webDomains:(id)a4 bundleIdentifier:(id)a5
{
  return [(CTCategory *)self initWithIdentifier:a3 equivalentBundleIdentifiers:0 webDomains:a4 bundleIdentifier:a5 primaryWebDomain:0];
}

- (CTCategory)initWithIdentifier:(id)a3 webDomains:(id)a4 bundleIdentifier:(id)a5 primaryWebDomain:(id)a6
{
  return [(CTCategory *)self initWithIdentifier:a3 equivalentBundleIdentifiers:0 webDomains:a4 bundleIdentifier:a5 primaryWebDomain:a6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_identifier forKey:@"CTPrimaryIdenfier"];
  [v6 encodeObject:self->_equivalentBundleIdentifiers forKey:@"CTEquivalentBundleIdentifiers"];
  [v6 encodeObject:self->_webDomains forKey:@"CTWebdomains"];
  [v6 encodeObject:self->_bundleIdentifier forKey:@"CTBundleIdentifier"];
  [v6 encodeObject:self->_primaryWebDomain forKey:@"CTPrimayWebDomain"];
  equivalentBundleIdentifiers = self->_equivalentBundleIdentifiers;
  if (equivalentBundleIdentifiers)
  {
    id v5 = [(NSArray *)equivalentBundleIdentifiers firstObject];
    [v6 encodeObject:v5 forKey:@"CTCanonicalBundleIdentifier"];
  }
  else
  {
    [v6 encodeObject:self->_bundleIdentifier forKey:@"CTCanonicalBundleIdentifier"];
  }
}

- (CTCategory)initWithCoder:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CTPrimaryIdenfier"];
  id v10 = [v5 decodeObjectOfClasses:v8 forKey:@"CTWebdomains"];
  id v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CTBundleIdentifier"];
  uint64_t v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CTPrimayWebDomain"];
  id v13 = [v5 decodeObjectOfClasses:v8 forKey:@"CTEquivalentBundleIdentifiers"];
  id v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CTCanonicalBundleIdentifier"];

  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)CTCategory;
    id v15 = [(CTCategory *)&v18 init];
    [(CTCategory *)v15 _ctCategoryCommonInitWithIdentifier:v9 equivalentBundleIdentifiers:v13 webDomains:v10 bundleIdentifier:v11 primaryWebDomain:v12 canonicalBundleIdentifier:v14];
    self = v15;
    id v16 = self;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)localizedNameForIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  id v6 = [v4 bundleForClass:a1];
  uint64_t v7 = [a1 _DHIDtoCategoryDisplayNameMap];
  id v8 = [v7 objectForKeyedSubscript:v5];

  id v9 = [v6 localizedStringForKey:v8 value:&stru_26C4A0200 table:0];

  return v9;
}

+ (id)shortLocalizedNameForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _DHIDtoCategoryDisplayNameMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v8 = [v6 stringByAppendingString:@"_Short"];
  id v9 = [v7 localizedStringForKey:v8 value:&stru_26C4A0200 table:0];

  return v9;
}

- (NSString)localizedName
{
  id v3 = objc_opt_class();
  id v4 = [(CTCategory *)self identifier];
  id v5 = [v3 localizedNameForIdentifier:v4];

  return (NSString *)v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(CTCategory *)self identifier];
  id v5 = [(CTCategory *)self bundleIdentifier];
  id v6 = [(CTCategory *)self canonicalBundleIdentifier];
  uint64_t v7 = [(CTCategory *)self equivalentBundleIdentifiers];
  id v8 = [(CTCategory *)self primaryWebDomain];
  id v9 = [(CTCategory *)self webDomains];
  id v10 = [v3 stringWithFormat:@"%@ - { bundle identifier: %@, canonicalBundleIdentifier: %@, equivalent bundle IDs: %@ } domain info:{ primaryWebDomain: %@ <-> webDomains: %@ }", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqualToCategory:(id)a3
{
  id v4 = a3;
  id v5 = [(CTCategory *)self identifier];
  id v6 = [v4 identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(CTCategory *)self equivalentBundleIdentifiers];
    id v9 = [v4 equivalentBundleIdentifiers];
    if (v8 == v9 || [v8 isEqual:v9])
    {
      id v10 = [(CTCategory *)self webDomains];
      id v11 = [v4 webDomains];
      if (v10 == v11 || [v10 isEqual:v11])
      {
        uint64_t v12 = [(CTCategory *)self primaryWebDomain];
        id v13 = [v4 primaryWebDomain];
        if (v12 == v13 || [v12 isEqual:v13])
        {
          id v14 = [(CTCategory *)self bundleIdentifier];
          id v15 = [v4 bundleIdentifier];
          if (v14 == v15 || [v14 isEqual:v15])
          {
            id v16 = [(CTCategory *)self canonicalBundleIdentifier];
            id v17 = [v4 canonicalBundleIdentifier];
            BOOL v18 = v16 == v17 || [v16 isEqual:v17];

            id v14 = v20;
            uint64_t v12 = v21;
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CTCategory *)self isEqualToCategory:v4];

  return v5;
}

- (unint64_t)hash
{
  v17.receiver = self;
  v17.super_class = (Class)CTCategory;
  unint64_t v3 = [(CTCategory *)&v17 hash];
  id v4 = [(CTCategory *)self identifier];
  uint64_t v5 = [v4 hash];
  id v6 = [(CTCategory *)self bundleIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  id v8 = [(CTCategory *)self equivalentBundleIdentifiers];
  uint64_t v9 = v7 ^ [v8 hash];
  id v10 = [(CTCategory *)self canonicalBundleIdentifier];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = [(CTCategory *)self webDomains];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  id v14 = [(CTCategory *)self primaryWebDomain];
  unint64_t v15 = v13 ^ [v14 hash];

  return v15;
}

- (BOOL)isSystemBundleIdentifier
{
  id v2 = [(CTCategory *)self identifier];
  char v3 = [v2 hasPrefix:@"DH00"];

  return v3;
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_202(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 firstObject];
  uint64_t v7 = (void *)v6;
  id v8 = @"DH1009";
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  id v10 = v8;

  uint64_t v9 = [*(id *)(a1 + 40) _appBundleIdentifierStringFor:v5 categoryIdentifier:v10];

  if ([v9 length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v9];
  }
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_206(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_206_cold_1((uint64_t)v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_208(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412803;
    uint64_t v49 = v7;
    __int16 v50 = 2113;
    id v51 = v5;
    __int16 v52 = 2112;
    id v53 = v6;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:completionHandler: platform: %@, %{private}@ error:%@", buf, 0x20u);
  }
  if (!v6)
  {
    uint64_t v8 = [v5 mutableCopy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  uint64_t v11 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  unint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) allKeys];
  [v14 removeObjectsInArray:v15];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 138477827;
    uint64_t v49 = v16;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "notInstalledBundleIdentifiers: %{private}@", buf, 0xCu);
  }
  objc_super v17 = @"CTOSPlatformiOS";
  int v18 = [(__CFString *)v17 isEqualToString:@"CTOSPlatformwatchOS"];

  if (v18)
  {
    id v33 = v5;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v43 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          v46 = @"DH1009";
          id v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v46, 1, v33);
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v25 forKeyedSubscript:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v33;
  }
  else if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_209;
    v39[3] = &unk_2641D9A88;
    uint64_t v41 = *(void *)(a1 + 56);
    id v40 = *(id *)(a1 + 40);
    id v26 = (void *)MEMORY[0x216691E10](v39);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138477827;
      uint64_t v49 = v27;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "NotInstalledBundleIdentifiers: %{private}@ ", buf, 0xCu);
    }
    id v28 = *(void **)(a1 + 80);
    uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_211;
    v35[3] = &unk_2641D9AB0;
    id v37 = v26;
    long long v34 = *(_OWORD *)(a1 + 48);
    id v30 = (id)v34;
    long long v38 = v34;
    id v36 = *(id *)(a1 + 32);
    id v31 = v26;
    [v28 _lookupAppStoreUsing:v29 platform:@"CTOSPlatformAll" withCompletionHandler:v35];
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      uint64_t v32 = 0;
    }
    else {
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v32);
  }
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_209(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  if (v2 != [*(id *)(a1 + 32) count])
  {
    id v3 = (void *)MEMORY[0x263EFFA08];
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allKeys];
    id v5 = [v3 setWithArray:v4];

    id v6 = [MEMORY[0x263EFF9C0] setWithArray:*(void *)(a1 + 32)];
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allKeys];
    uint64_t v9 = [v7 setWithArray:v8];

    [v6 minusSet:v9];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
          long long v23 = @"DH1009";
          uint64_t v16 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v23, 1, (void)v17);
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v16 forKeyedSubscript:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v12);
    }

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v22 = v10;
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "fallbackToDefaultValueHandler - notInstalledBundleIdentifiers: %{private}@", buf, 0xCu);
    }
  }
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_211(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addEntriesFromDictionary:a3];
  if ([v5 code] == -3001)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"CTOSPlatformAll"])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int v8 = 138412546;
        id v9 = v5;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "ERROR %@ categoryForBundleIdentifiers: %@", (uint8_t *)&v8, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
}

+ (void)categoryForDomainURL:(id)a3 withCompletionHandler:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 absoluteString];
  v12[0] = v7;
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__CTCategory_categoryForDomainURL_withCompletionHandler___block_invoke;
  v10[3] = &unk_2641D9798;
  id v11 = v6;
  id v9 = v6;
  [a1 categoryForDomainNames:v8 withCompletionHandler:v10];
}

void __57__CTCategory_categoryForDomainURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v7 = [a2 allValues];
  id v6 = [v7 firstObject];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v5);
}

+ (void)categoryForDomainURLs:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[CTCategory categoryForDomainURLs:withCompletionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "START %s :%lu", buf, 0x16u);
  }
  int v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * v12) host];
        [v8 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = [MEMORY[0x263EFF9A0] dictionary];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke;
  v16[3] = &unk_2641D9B28;
  id v14 = v9;
  id v17 = v14;
  long long v19 = buf;
  id v15 = v7;
  id v18 = v15;
  [a1 categoryForDomainNames:v8 withCompletionHandler:v16];

  _Block_object_dispose(buf, 8);
}

void __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (void *)a1[4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_2641D9B00;
  uint64_t v7 = a1[6];
  id v12 = v5;
  uint64_t v13 = v7;
  id v8 = v5;
  id v9 = a3;
  [v6 enumerateObjectsUsingBlock:v11];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "+[CTCategory categoryForDomainURLs:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "DONE %s", buf, 0xCu);
  }
  (*(void (**)(void, void, id, uint64_t))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), v9, v10);
}

void __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v5 = [v3 host];
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

+ (void)categoryForDomainName:(id)a3 withCompletionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v13[0] = a3;
  id v7 = (void *)MEMORY[0x263EFF8C0];
  id v8 = a3;
  id v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__CTCategory_categoryForDomainName_withCompletionHandler___block_invoke;
  v11[3] = &unk_2641D9798;
  id v12 = v6;
  id v10 = v6;
  [a1 categoryForDomainNames:v9 withCompletionHandler:v11];
}

void __58__CTCategory_categoryForDomainName_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v7 = [a2 allValues];
  id v6 = [v7 firstObject];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v5);
}

+ (void)categoryForDomainNames:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "+[CTCategory categoryForDomainNames:withCompletionHandler:]";
      __int16 v18 = 2048;
      uint64_t v19 = [v6 count];
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "START %s :%lu", buf, 0x16u);
    }
    id v8 = [a1 _urlStringsForHostNames:v6];
    id v9 = [a1 client];
    id v10 = (void *)[v9 newRequest];

    uint64_t v11 = (void *)[v8 copy];
    [v10 setUrls:v11];

    [v10 setIncludeHigherLevelTopics:1];
    objc_initWeak((id *)buf, a1);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke;
    v12[3] = &unk_2641D9BA0;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v7;
    id v13 = v6;
    [v10 executeCategorizationRequestWithReply:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v38 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v32 = v5;
  if (!WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    goto LABEL_5;
  }
  uint64_t v31 = a1;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
LABEL_5:
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    goto LABEL_31;
  }
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__0;
  v56[4] = __Block_byref_object_dispose__0;
  id v57 = 0;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = __Block_byref_object_copy__0;
  uint64_t v54 = __Block_byref_object_dispose__0;
  id v55 = [MEMORY[0x263EFF9A0] dictionary];
  id v33 = [MEMORY[0x263EFF9A0] dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
  id v8 = WeakRetained;
  if (v7)
  {
    uint64_t v37 = *(void *)v47;
    do
    {
      uint64_t v39 = v7;
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v8, "_urlComponentsForHostName:", v10, v31, v32);
        id v12 = [v11 string];
        id v13 = [v38 objectForKeyedSubscript:v12];
        id v14 = v13;
        if (v13)
        {
          id v15 = [v13 error];
          BOOL v16 = v15 == 0;

          if (v16)
          {
            uint64_t v17 = [WeakRetained _identifierForContextResponse:v14];
            __int16 v18 = [WeakRetained _bundleIdentifierForContextResponse:v14];
            uint64_t v19 = v18;
            uint64_t v20 = @"DH1009";
            if (v17) {
              uint64_t v20 = (__CFString *)v17;
            }
            id v36 = v20;
            if ([v18 length]) {
              [v33 setObject:v19 forKeyedSubscript:v10];
            }
            if (![v19 length])
            {
              uint64_t v21 = [v11 host];
              long long v22 = (void *)v21;
              if (v21) {
                long long v23 = (void *)v21;
              }
              else {
                long long v23 = v10;
              }
              id v34 = v23;

              id v60 = v34;
              uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
              uint64_t v25 = [WeakRetained _getAssociatedDomainsForHostNames:v24];

              id v26 = [CTCategory alloc];
              id v27 = [v25 array];
              id v28 = [v25 firstObject];
              uint64_t v29 = [(CTCategory *)v26 initWithIdentifier:v36 webDomains:v27 bundleIdentifier:0 primaryWebDomain:v28];

              [(id)v51[5] setObject:v29 forKeyedSubscript:v10];
            }
          }
        }

        id v8 = WeakRetained;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
    }
    while (v7);
  }

  if ([v33 count])
  {
    id v30 = [v33 allValues];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_214;
    v41[3] = &unk_2641D9B78;
    id v42 = v33;
    long long v44 = &v50;
    long long v45 = v56;
    id v43 = *(id *)(v31 + 40);
    [WeakRetained categoryForBundleIdentifiers:v30 platform:@"CTOSPlatformAll" withCompletionHandler:v41];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "+[CTCategory categoryForDomainNames:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "DONE %s", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(v31 + 40) + 16))();
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v56, 8);

LABEL_31:
}

void __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_2641D9B50;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v16 = "+[CTCategory categoryForDomainNames:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "DONE %s", buf, 0xCu);
  }
  (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v10);
}

void __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
}

void __57__CTCategory__overrideEquivalentIdentifiers_forBundleID___block_invoke()
{
  v0 = (void *)_overrideEquivalentIdentifiers_forBundleID___equivalentBundleIDsOverrides;
  _overrideEquivalentIdentifiers_forBundleID___equivalentBundleIDsOverrides = (uint64_t)&unk_26C4A2C70;
}

+ (void)_getCategoryTypeForDomainName:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v16 = "+[CTCategory _getCategoryTypeForDomainName:withCompletionHandler:]";
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  id v8 = [(id)objc_opt_class() _urlComponentsForHostName:v6];
  id v9 = [v8 string];
  if ([v9 length])
  {
    uint64_t v10 = [a1 client];
    uint64_t v11 = (void *)[v10 newRequest];

    [v11 setIncludeHigherLevelTopics:1];
    [v11 setUrl:v9];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __66__CTCategory__getCategoryTypeForDomainName_withCompletionHandler___block_invoke;
    v12[3] = &unk_2641D9998;
    id v13 = v9;
    id v14 = v7;
    [v11 executeCategorizationRequestWithReply:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 5001, 0);
  }
}

void __66__CTCategory__getCategoryTypeForDomainName_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v6 = (void *)v5;
  if (v9 || !v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = [(id)objc_opt_class() _identifierForContextResponse:v5];
    if ([v7 length]) {
      uint64_t v8 = 5000;
    }
    else {
      uint64_t v8 = 5001;
    }
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, 0);
  }
}

+ (id)_DHIDtoCategoryDisplayNameMap
{
  if (_DHIDtoCategoryDisplayNameMap_onceToken != -1) {
    dispatch_once(&_DHIDtoCategoryDisplayNameMap_onceToken, &__block_literal_global_241);
  }
  uint64_t v2 = (void *)_DHIDtoCategoryDisplayNameMap_DHCategories;
  return v2;
}

void __43__CTCategory__DHIDtoCategoryDisplayNameMap__block_invoke()
{
  v3[15] = *MEMORY[0x263EF8340];
  v2[0] = @"DH1001";
  v2[1] = @"DH1002";
  v3[0] = @"Games";
  v3[1] = @"Social Networking";
  v2[2] = @"DH1003";
  v2[3] = @"DH1004";
  v3[2] = @"Entertainment";
  v3[3] = @"Creativity";
  v2[4] = @"DH1005";
  v2[5] = @"DH1006";
  v3[4] = @"Productivity";
  v3[5] = @"Education";
  v2[6] = @"DH1007";
  v2[7] = @"DH1008";
  v3[6] = @"Reading & Reference";
  v3[7] = @"Health & Fitness";
  v2[8] = @"DH1009";
  v2[9] = @"DH1011";
  v3[8] = @"Other";
  v3[9] = @"Utilities";
  v2[10] = @"DH1012";
  v2[11] = @"DH1013";
  v3[10] = @"Shopping & Food";
  v3[11] = @"Travel";
  v2[12] = @"DH0013";
  v2[13] = @"DH0012";
  v3[12] = @"System Unblockable Applications";
  v3[13] = @"System Blockable Applications";
  v2[14] = @"DH0011";
  v3[14] = @"System Hidden Applications";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:15];
  v1 = (void *)_DHIDtoCategoryDisplayNameMap_DHCategories;
  _DHIDtoCategoryDisplayNameMap_DHCategories = v0;
}

+ (id)schemeStringForPlatform:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"CTOSPlatformiOS"])
  {
    uint64_t v5 = @"ios";
  }
  else if ([v4 isEqualToString:@"CTOSPlatformmacOS"])
  {
    uint64_t v5 = @"macos";
  }
  else if ([v4 isEqualToString:@"CTOSPlatformwatchOS"])
  {
    uint64_t v5 = @"watchos";
  }
  else if ([v4 isEqualToString:@"CTOSPlatformtvOS"])
  {
    uint64_t v5 = @"tvos";
  }
  else if ([v4 isEqualToString:@"CTOSPlatformAll"])
  {
    uint64_t v5 = @"all";
  }
  else if ([v4 isEqualToString:@"CTOSPlatformCurrent"])
  {
    id v6 = @"CTOSPlatformiOS";
    uint64_t v5 = [a1 schemeStringForPlatform:v6];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)bundleIDForPlatform:(id)a3 fromBundleID:(id)a4 platform:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F08BA0]);
  id v12 = [a1 schemeStringForPlatform:v10];
  [v11 setScheme:v12];

  [v11 setHost:v9];
  id v13 = [v11 URL];
  id v14 = [v13 absoluteString];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__0;
  id v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  id v15 = +[CTCategory _equivalentBundleIDsMapping];
  BOOL v16 = [v15 objectForKey:v14];

  if (v16)
  {
    uint64_t v17 = [a1 schemeStringForPlatform:v8];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__CTCategory_bundleIDForPlatform_fromBundleID_platform___block_invoke;
    v21[3] = &unk_2641D9BC8;
    id v18 = v17;
    id v22 = v18;
    long long v23 = &v24;
    [v16 enumerateObjectsUsingBlock:v21];
  }
  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

void __56__CTCategory_bundleIDForPlatform_fromBundleID_platform___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v11 = [NSURL URLWithString:a2];
  id v6 = [v11 scheme];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    uint64_t v8 = [v11 host];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

+ (id)_DHToAppStoreCategoriesMap
{
  if (_DHToAppStoreCategoriesMap_onceToken != -1) {
    dispatch_once(&_DHToAppStoreCategoriesMap_onceToken, &__block_literal_global_262);
  }
  uint64_t v2 = (void *)_DHToAppStoreCategoriesMap_DHToAppStoreCategoriesMap;
  return v2;
}

void __40__CTCategory__DHToAppStoreCategoriesMap__block_invoke()
{
  v27[12] = *MEMORY[0x263EF8340];
  v25[0] = @"Games";
  v25[1] = @"Stickers";
  v26[0] = @"Games";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v27[0] = v13;
  v26[1] = @"Social Networking";
  uint64_t v24 = @"Social Networking";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v27[1] = v12;
  v26[2] = @"Entertainment";
  v23[0] = @"Entertainment";
  v23[1] = @"Music";
  v23[2] = @"Sports";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  v27[2] = v0;
  v26[3] = @"Creativity";
  v22[0] = @"Photo & Video";
  v22[1] = @"Graphics & Design";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v27[3] = v1;
  v26[4] = @"Productivity";
  v21[0] = @"Productivity";
  v21[1] = @"Business";
  v21[2] = @"Finance";
  v21[3] = @"Developer Tools";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  void v27[4] = v2;
  void v26[5] = @"Education";
  v20[0] = @"Education";
  v20[1] = @"Kids";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v27[5] = v3;
  v26[6] = @"Reading & Reference";
  v19[0] = @"Book";
  v19[1] = @"Reference";
  v19[2] = @"News";
  v19[3] = @"Weather";
  void v19[4] = @"Magazines & Newspapers";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:5];
  v27[6] = v4;
  v26[7] = @"Health & Fitness";
  v18[0] = @"Health & Fitness";
  v18[1] = @"Medical";
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v27[7] = v5;
  v26[8] = @"Other";
  uint64_t v17 = @"Miscellaneous";
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v27[8] = v6;
  v26[9] = @"Utilities";
  BOOL v16 = @"Utilities";
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v27[9] = v7;
  v26[10] = @"Shopping & Food";
  v15[0] = @"Food & Drink";
  v15[1] = @"Shopping";
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v27[10] = v8;
  v26[11] = @"Travel";
  v14[0] = @"Travel";
  v14[1] = @"Navigation";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v27[11] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:12];
  id v11 = (void *)_DHToAppStoreCategoriesMap_DHToAppStoreCategoriesMap;
  _DHToAppStoreCategoriesMap_DHToAppStoreCategoriesMap = v10;
}

+ (void)_lookupAppStoreUsing:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "_lookupAppStoreUsing %@", buf, 0xCu);
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke;
  activity_block[3] = &unk_2641D9BF0;
  id v15 = v8;
  id v16 = v9;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  _os_activity_initiate(&dword_213B5E000, "CTCategory _lookupAppStoreUsing:withCompletionHandler:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CTCategory _xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_2641D9A60;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_263;
  v6[3] = &unk_2641D9998;
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v3 lookupAppStoreForBundleIDs:v5 platform:v7 replyHandler:v6];
}

void __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "lookupAppStoreForBundleID:completionHandler: %@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_263(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412547;
    uint64_t v10 = v7;
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_INFO, "lookupAppStoreForBundleID:completionHandler: platform: %@, %{private}@", (uint8_t *)&v9, 0x16u);
  }
  if (v6) {
    id v8 = 0;
  }
  else {
    id v8 = v5;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, v8);
}

+ (id)itemWith:(id)a3 platform:(id)a4 array:(id)a5
{
  id v8 = a3;
  int v9 = (__CFString *)a4;
  id v10 = a5;
  __int16 v11 = v10;
  uint64_t v28 = 0;
  id v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__0;
  uint64_t v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  if (@"CTOSPlatformAll" == v9)
  {
    id v14 = NSURL;
    id v15 = [v10 firstObject];
    id v16 = [v14 URLWithString:v15];

    uint64_t v17 = [v16 host];
    id v18 = v29[5];
    void v29[5] = (id)v17;

    goto LABEL_14;
  }
  if (@"CTOSPlatformCurrent" == v9)
  {
    uint64_t v19 = @"CTOSPlatformiOS";

    goto LABEL_10;
  }
  if (@"CTOSPlatformiOS" == v9)
  {
LABEL_10:
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __38__CTCategory_itemWith_platform_array___block_invoke;
    v27[3] = &unk_2641D9C40;
    void v27[4] = &v28;
    [v11 enumerateObjectsUsingBlock:v27];
    int v9 = @"CTOSPlatformiOS";
    goto LABEL_14;
  }
  if (@"CTOSPlatformmacOS" == v9)
  {
    id v12 = v26;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    uint64_t v13 = __38__CTCategory_itemWith_platform_array___block_invoke_2;
  }
  else if (@"CTOSPlatformtvOS" == v9)
  {
    id v12 = v25;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    uint64_t v13 = __38__CTCategory_itemWith_platform_array___block_invoke_3;
  }
  else
  {
    if (@"CTOSPlatformwatchOS" != v9) {
      goto LABEL_14;
    }
    id v12 = &v23;
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    uint64_t v13 = __38__CTCategory_itemWith_platform_array___block_invoke_4;
  }
  void v12[2] = (uint64_t)v13;
  v12[3] = (uint64_t)&unk_2641D9C40;
  void v12[4] = (uint64_t)&v28;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23, v24);
LABEL_14:
  id v20 = v29[5];
  if (!v20)
  {
    objc_storeStrong(v29 + 5, a3);
    id v20 = v29[5];
  }
  id v21 = v20;
  _Block_object_dispose(&v28, 8);

  return v21;
}

void __38__CTCategory_itemWith_platform_array___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v11 = [NSURL URLWithString:a2];
  id v6 = [v11 scheme];
  int v7 = [v6 isEqualToString:@"ios://"];

  if (v7)
  {
    uint64_t v8 = [v11 host];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

void __38__CTCategory_itemWith_platform_array___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v12 = [NSURL URLWithString:a2];
  id v6 = [v12 scheme];
  if ([v6 isEqualToString:@"macos://"])
  {
  }
  else
  {
    int v7 = [v12 scheme];
    int v8 = [v7 isEqualToString:@"iosmac://"];

    if (!v8) {
      goto LABEL_5;
    }
  }
  uint64_t v9 = [v12 host];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *a4 = 1;
LABEL_5:
}

void __38__CTCategory_itemWith_platform_array___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v11 = [NSURL URLWithString:a2];
  id v6 = [v11 scheme];
  int v7 = [v6 isEqualToString:@"tvos://"];

  if (v7)
  {
    uint64_t v8 = [v11 host];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

void __38__CTCategory_itemWith_platform_array___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v11 = [NSURL URLWithString:a2];
  id v6 = [v11 scheme];
  int v7 = [v6 isEqualToString:@"watchos://"];

  if (v7)
  {
    uint64_t v8 = [v11 host];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

+ (id)_equivalentBundleIDsMappingForWatchOSBundleID:(id)a3
{
  id v3 = a3;
  if (_equivalentBundleIDsMappingForWatchOSBundleID__onceToken != -1) {
    dispatch_once(&_equivalentBundleIDsMappingForWatchOSBundleID__onceToken, &__block_literal_global_284);
  }
  int v4 = [(id)_equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS objectForKey:v3];
  if ([v4 count])
  {
    id v5 = (void *)MEMORY[0x263EFF9D8];
    id v6 = [(id)_equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS objectForKey:v3];
    int v7 = [v5 orderedSetWithArray:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

void __60__CTCategory__equivalentBundleIDsMappingForWatchOSBundleID___block_invoke()
{
  uint64_t v0 = (void *)_equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS;
  _equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS = (uint64_t)&unk_26C4A2C98;
}

void __41__CTCategory__equivalentBundleIDsMapping__block_invoke()
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v1 = [&unk_26C4A2C58 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v17;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(&unk_26C4A2C58);
        }
        id v5 = *(void **)(*((void *)&v16 + 1) + 8 * v4);
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v13;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v13 != v9) {
                objc_enumerationMutation(v6);
              }
              [v0 setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v10++)];
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
          }
          while (v8);
        }

        ++v4;
      }
      while (v4 != v2);
      uint64_t v2 = [&unk_26C4A2C58 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v2);
  }
  id v11 = (void *)_equivalentBundleIDsMapping__mapping;
  _equivalentBundleIDsMapping__mapping = (uint64_t)v0;
}

+ (id)_equivalentBundleIDsWithSchemesRemovedMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_equivalentBundleIDsWithSchemesRemovedMapping_onceToken != -1) {
    dispatch_once(&_equivalentBundleIDsWithSchemesRemovedMapping_onceToken, block);
  }
  uint64_t v2 = (void *)_equivalentBundleIDsWithSchemesRemovedMapping__mapping;
  return v2;
}

void __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = [*(id *)(a1 + 32) _equivalentBundleIDsMapping];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke_2;
  v7[3] = &unk_2641D9C68;
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = (void *)_equivalentBundleIDsWithSchemesRemovedMapping__mapping;
  _equivalentBundleIDsWithSchemesRemovedMapping__mapping = (uint64_t)v4;
  id v6 = v4;
}

void __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSURL;
  id v6 = a3;
  uint64_t v7 = [v5 URLWithString:a2];
  id v8 = [v7 host];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v8];
}

+ (id)_bundleIdentifierForContextResponse:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 error], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    id v8 = [a1 _relatedItemsForContextResponse:v5];
    if ([v8 count])
    {
      uint64_t v11 = 0;
      long long v12 = &v11;
      uint64_t v13 = 0x3032000000;
      long long v14 = __Block_byref_object_copy__0;
      long long v15 = __Block_byref_object_dispose__0;
      id v16 = 0;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __50__CTCategory__bundleIdentifierForContextResponse___block_invoke;
      v10[3] = &unk_2641D9CB8;
      void v10[4] = &v11;
      [v8 enumerateObjectsUsingBlock:v10];
      id v7 = (id)v12[5];
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __50__CTCategory__bundleIdentifierForContextResponse___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 hasPrefix:@"app://"])
  {
    id v6 = [NSURL URLWithString:v9];
    id v7 = [v6 host];

    if ([v7 length])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7);
      *a4 = 1;
    }
  }
  return MEMORY[0x270F9A790]();
}

+ (id)_urlStringsForHostNames:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "_urlComponentsForHostName:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        long long v12 = [v11 string];
        if ([v12 length]) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_urlComponentsForHostName:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08BA0]);
    [v4 setHost:v3];
    [v4 setScheme:@"http"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)canonicalBundleIdentifier
{
  return self->_canonicalBundleIdentifier;
}

- (NSArray)equivalentBundleIdentifiers
{
  return self->_equivalentBundleIdentifiers;
}

- (NSArray)webDomains
{
  return self->_webDomains;
}

- (void)setWebDomains:(id)a3
{
}

- (NSString)primaryWebDomain
{
  return self->_primaryWebDomain;
}

- (void)setPrimaryWebDomain:(id)a3
{
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to get category for bundle identifiers: %{public}@", (uint8_t *)&v1, 0xCu);
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_206_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_213B5E000, &_os_log_internal, OS_LOG_TYPE_ERROR, "remoteObjectProxyWithErrorHandler: %@", (uint8_t *)&v1, 0xCu);
}

@end