@interface KMLaunchServicesBridge
+ (id)allInstalledAppBundleIdentifiers;
- (BOOL)_checkAppValidity:(id)a3;
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMLaunchServicesBridge)init;
- (KMLaunchServicesBridge)initWithLanguageCode:(id)a3;
- (id)_appEnumerator;
- (id)_getOverrideByInfoPlist:(id)a3;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation KMLaunchServicesBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFields, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

- (id)_appEnumerator
{
  return (id)[MEMORY[0x263F01878] enumeratorWithOptions:0];
}

- (id)_getOverrideByInfoPlist:(id)a3
{
  v3 = [a3 infoDictionary];
  v4 = [v3 objectForKey:@"SBIconVisibilitySetByAppPreference" ofClass:objc_opt_class()];
  if ([v4 BOOLValue])
  {
    v5 = [v3 objectForKey:@"SBIconVisibilityDefaultVisible" ofClass:objc_opt_class()];
    char v6 = [v5 BOOLValue];

    if (v6)
    {
      v7 = (void *)MEMORY[0x263EFFA88];
    }
    else
    {
      v8 = [v3 objectForKey:@"SBIconVisibilityDefaultVisibleInstallTypes" ofClass:objc_opt_class()];
      if ([v8 count]
        && AFIsInternalInstall()
        && ([v8 containsObject:@"internal"] & 1) != 0)
      {
        v7 = (void *)MEMORY[0x263EFFA88];
      }
      else
      {
        v9 = [v3 objectForKey:@"SBIconVisibilityDefaultVisiblePlatforms" ofClass:objc_opt_class()];
        if ([v9 count]
          && (v10 = (void *)MGGetStringAnswer(),
              char v11 = [v9 containsObject:v10],
              v10,
              (v11 & 1) != 0))
        {
          v7 = (void *)MEMORY[0x263EFFA88];
        }
        else
        {
          v7 = (void *)MEMORY[0x263EFFA80];
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_checkAppValidity:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  char v6 = [&unk_26D79B798 containsObject:v5];

  if (v6)
  {
    char v7 = 1;
  }
  else if ([v4 isLaunchProhibited])
  {
    char v7 = 0;
  }
  else
  {
    v8 = [(KMLaunchServicesBridge *)self _getOverrideByInfoPlist:v4];
    v9 = v8;
    if (v8)
    {
      char v7 = [v8 BOOLValue];
    }
    else
    {
      v10 = [v4 typeForInstallMachinery];
      char v11 = [v10 lowercaseString];

      if (([v11 isEqualToString:@"hidden"] & 1) != 0
        || ([v11 isEqualToString:@"internal"] & 1) != 0)
      {
        char v7 = 0;
      }
      else if ([v4 developerType] == 1)
      {
        v13 = [v4 appTags];
        char v14 = [v13 containsObject:@"hidden"];

        char v7 = v14 ^ 1;
      }
      else
      {
        char v7 = 1;
      }
    }
  }

  return v7;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v5 = (uint64_t (**)(id, void *))a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = [(KMLaunchServicesBridge *)self _appEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (!v7)
  {
    BOOL v26 = 1;
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v32;
  char v11 = v6;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v32 != v10) {
      objc_enumerationMutation(v11);
    }
    v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
    char v14 = (void *)MEMORY[0x22A6168F0]();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    uint64_t v21 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[KMLaunchServicesBridge enumerateItemsWithError:usingBlock:]";
      __int16 v37 = 2112;
      v38 = v13;
      v22 = v21;
      v23 = "%s bundle record: %@ is not a LSApplicationRecord";
LABEL_18:
      _os_log_error_impl(&dword_22475B000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    }
LABEL_15:
    if (v8 == ++v12)
    {
      uint64_t v25 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
      uint64_t v8 = v25;
      if (!v25)
      {

        BOOL v26 = 1;
        id v6 = v9;
        goto LABEL_26;
      }
      goto LABEL_3;
    }
  }
  v15 = [v13 bundleIdentifier];

  if (!v15)
  {
    uint64_t v24 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[KMLaunchServicesBridge enumerateItemsWithError:usingBlock:]";
      __int16 v37 = 2112;
      v38 = v13;
      v22 = v24;
      v23 = "%s bundle record: %@ has nil bundle identifier";
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (![(KMLaunchServicesBridge *)self _checkAppValidity:v13]) {
    goto LABEL_15;
  }
  itemMapper = self->_itemMapper;
  additionalFields = self->_additionalFields;
  id v30 = v9;
  v18 = [(KVItemMapper *)itemMapper mapObject:v13 additionalFields:additionalFields error:&v30];
  id v6 = v30;

  if ([v18 count] == 1)
  {
    v9 = v6;
    v19 = v11;
    v20 = [v18 firstObject];
    char v29 = v5[2](v5, v20);

    if ((v29 & 1) == 0)
    {

      BOOL v26 = 0;
      id v6 = v9;
      goto LABEL_26;
    }
    char v11 = v19;
    goto LABEL_15;
  }
  v27 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[KMLaunchServicesBridge enumerateItemsWithError:usingBlock:]";
    __int16 v37 = 2112;
    v38 = v18;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_error_impl(&dword_22475B000, v27, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
  }

  KVSetError();
  BOOL v26 = 0;
LABEL_26:

  return v26;
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51048];
}

- (unsigned)cascadeItemType
{
  return -29102;
}

- (KMLaunchServicesBridge)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (KMLaunchServicesBridge)initWithLanguageCode:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)KMLaunchServicesBridge;
  v5 = [(KMLaunchServicesBridge *)&v20 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v19 = 0;
  uint64_t v6 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v19];
  id v7 = v19;
  itemMapper = v5->_itemMapper;
  v5->_itemMapper = (KVItemMapper *)v6;

  if (!v5->_itemMapper)
  {
    uint64_t v13 = KMLogContextCore;
    if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      uint64_t v12 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = "-[KMLaunchServicesBridge initWithLanguageCode:]";
    __int16 v25 = 2112;
    id v26 = v7;
    char v14 = "%s %@";
    v15 = v13;
    uint32_t v16 = 22;
LABEL_12:
    _os_log_error_impl(&dword_22475B000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_9;
  }
  if (!v4)
  {
    uint64_t v17 = KMLogContextCore;
    if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[KMLaunchServicesBridge initWithLanguageCode:]";
    char v14 = "%s Must pass a valid language code";
    v15 = v17;
    uint32_t v16 = 12;
    goto LABEL_12;
  }
  v9 = KVAdditionalFieldTypeToNumber();
  uint64_t v21 = v9;
  id v22 = v4;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  additionalFields = v5->_additionalFields;
  v5->_additionalFields = (NSDictionary *)v10;

LABEL_5:
  uint64_t v12 = v5;
LABEL_10:

  return v12;
}

+ (id)allInstalledAppBundleIdentifiers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v13 = (id)objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x22A6168F0]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v7 bundleIdentifier];
          if (v9)
          {
            [v13 addObject:v9];
          }
          else
          {
            char v11 = KMLogContextCore;
            if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v19 = "+[KMLaunchServicesBridge allInstalledAppBundleIdentifiers]";
              __int16 v20 = 2112;
              uint64_t v21 = v7;
              _os_log_error_impl(&dword_22475B000, v11, OS_LOG_TYPE_ERROR, "%s bundle record: %@ has nil bundle identifier", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v10 = KMLogContextCore;
          if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v19 = "+[KMLaunchServicesBridge allInstalledAppBundleIdentifiers]";
            __int16 v20 = 2112;
            uint64_t v21 = v7;
            _os_log_error_impl(&dword_22475B000, v10, OS_LOG_TYPE_ERROR, "%s bundle record: %@ is not a LSApplicationRecord", buf, 0x16u);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v4);
  }

  return v13;
}

@end