@interface EXExtensionPointEnumerator
+ (id)translateAppexptDictionary:(id)a3 definitionURL:(id)a4 isCatalyst:(BOOL)a5;
+ (void)enumerateExtensionPointsInDirectoryAtURL:(id)a3 block:(id)a4;
- (BOOL)validateExtensionPointIdentifier:(id)a3 sdkDictionary:(id)a4;
- (BOOL)validateExtensionPoints;
- (EXEnumeratorConfig)config;
- (EXExtensionPointEnumerator)initWithCacheURLs:(id)a3 config:(id)a4;
- (EXExtensionPointEnumerator)initWithSDKDictionary:(id)a3 config:(id)a4;
- (EXExtensionPointEnumerator)initWithSDKDictionary:(id)a3 urls:(id)a4 config:(id)a5;
- (NSDictionary)extensionPoints;
- (NSEnumerator)extensionPointsKeyEnumerator;
- (NSMutableDictionary)currentSDKDictionaryForPlatform;
- (NSString)currentIdentifier;
- (_EXExtensionPoint)currentExtensionPoint;
- (id)flattenEXExtensionPointConfigurationInDictionary:(id)a3 identifier:(id)a4;
- (id)nextObject;
- (id)synthesizeNSExtensionKeysInDictionary:(id)a3 identifier:(id)a4;
- (id)translateXPCCacheDictionary:(id)a3;
- (void)nextObject;
@end

@implementation EXExtensionPointEnumerator

+ (void)enumerateExtensionPointsInDirectoryAtURL:(id)a3 block:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = [v5 path];
  unsigned int v34 = [v7 containsString:@"/System/iOSSupport/"];

  uint64_t v8 = *MEMORY[0x1E4F1C670];
  v46[0] = *MEMORY[0x1E4F1C628];
  v46[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v28 = (void *)v9;
  v29 = v5;
  v11 = [v10 enumeratorAtURL:v5 includingPropertiesForKeys:v9 options:1 errorHandler:0];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v41;
    uint64_t v30 = *(void *)v41;
    do
    {
      uint64_t v15 = 0;
      uint64_t v31 = v13;
      do
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v40 + 1) + 8 * v15);
        v17 = [v16 pathExtension];
        uint64_t v18 = [v17 caseInsensitiveCompare:@"appexpt"];

        if (!v18)
        {
          uint64_t v33 = v15;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v16];
          v20 = v19;
          if (v19)
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v37;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v37 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                  v26 = objc_msgSend(v20, "_EX_dictionaryForKey:", v25);
                  v27 = [a1 translateAppexptDictionary:v26 definitionURL:v16 isCatalyst:v34];

                  v6[2](v6, v25, v27);
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v22);
            }
          }

          uint64_t v14 = v30;
          uint64_t v13 = v31;
          uint64_t v15 = v33;
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v13);
  }
}

- (EXExtensionPointEnumerator)initWithCacheURLs:(id)a3 config:(id)a4
{
  return [(EXExtensionPointEnumerator *)self initWithSDKDictionary:MEMORY[0x1E4F1CC08] urls:a3 config:a4];
}

- (EXExtensionPointEnumerator)initWithSDKDictionary:(id)a3 config:(id)a4
{
  result = [(EXExtensionPointEnumerator *)self initWithSDKDictionary:a3 urls:MEMORY[0x1E4F1CBF0] config:a4];
  if (result) {
    result->_validateExtensionPoints = 1;
  }
  return result;
}

- (EXExtensionPointEnumerator)initWithSDKDictionary:(id)a3 urls:(id)a4 config:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v82.receiver = self;
  v82.super_class = (Class)EXExtensionPointEnumerator;
  v11 = [(EXExtensionPointEnumerator *)&v82 init];
  if (v11)
  {
    id obj = a5;
    id v57 = v10;
    id v59 = v9;
    uint64_t v12 = (NSDictionary *)objc_opt_new();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v58 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v78 objects:v89 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v66 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v79 != v66) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v13, "_EX_dictionaryForKey:", v17, obj);
          v19 = [(id)objc_opt_class() translateAppexptDictionary:v18 definitionURL:0 isCatalyst:0];

          if ([v19 count])
          {
            uint64_t v20 = [(NSDictionary *)v12 _EX_dictionaryForKey:v17];
            uint64_t v21 = (void *)v20;
            uint64_t v22 = (void *)MEMORY[0x1E4F1CC08];
            if (v20) {
              uint64_t v22 = (void *)v20;
            }
            id v23 = v22;

            v24 = objc_msgSend(v23, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v19);

            [(NSDictionary *)v12 setObject:v24 forKey:v17];
          }
          else
          {
            v24 = _EXDefaultLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v84 = v17;
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v78 objects:v89 count:16];
      }
      while (v15);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v25 = v9;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v75;
      uint64_t v60 = *(void *)v75;
      id v61 = v25;
      do
      {
        uint64_t v29 = 0;
        uint64_t v63 = v27;
        do
        {
          if (*(void *)v75 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v65 = v29;
          uint64_t v30 = *(void **)(*((void *)&v74 + 1) + 8 * v29);
          if (objc_msgSend(v30, "_EX_isDirectory", obj))
          {
            v72[0] = MEMORY[0x1E4F143A8];
            v72[1] = 3221225472;
            v72[2] = __64__EXExtensionPointEnumerator_initWithSDKDictionary_urls_config___block_invoke;
            v72[3] = &unk_1E573D838;
            v73 = v12;
            +[EXExtensionPointEnumerator enumerateExtensionPointsInDirectoryAtURL:v30 block:v72];
            uint64_t v31 = v73;
            goto LABEL_45;
          }
          v32 = +[_EXDefaults sharedInstance];
          if ([v32 enforceXPCCacheCodeSigning])
          {
            uint64_t v33 = [v30 path];
            int v34 = [v33 hasSuffix:@"System/Library/xpc/extensions.plist"];

            if (v34)
            {
              id v71 = 0;
              v35 = objc_msgSend(MEMORY[0x1E4F1C9E8], "_EX_dictionaryWithSignedURL:error:", v30, &v71);
              v64 = (NSDictionary *)v71;
              if (v35) {
                goto LABEL_29;
              }
              goto LABEL_25;
            }
          }
          else
          {
          }
          v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v30];
          v64 = 0;
          if (v35)
          {
LABEL_29:
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v36 = v35;
            uint64_t v37 = [v36 countByEnumeratingWithState:&v67 objects:v87 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              v62 = v35;
              uint64_t v39 = *(void *)v68;
              do
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v68 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  long long v41 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                  long long v42 = [v36 _EX_dictionaryForKey:v41];
                  long long v43 = [(EXExtensionPointEnumerator *)v11 translateXPCCacheDictionary:v42];

                  if ([v43 count])
                  {
                    uint64_t v44 = [(NSDictionary *)v12 _EX_dictionaryForKey:v41];
                    v45 = (void *)v44;
                    v46 = (void *)MEMORY[0x1E4F1CC08];
                    if (v44) {
                      v46 = (void *)v44;
                    }
                    id v47 = v46;

                    v48 = objc_msgSend(v47, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v43);

                    [(NSDictionary *)v12 setObject:v48 forKey:v41];
                  }
                  else
                  {
                    v48 = _EXDefaultLog();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v84 = v41;
                    }
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v67 objects:v87 count:16];
              }
              while (v38);
              uint64_t v28 = v60;
              id v25 = v61;
              v35 = v62;
            }
LABEL_43:
            uint64_t v31 = v64;
            goto LABEL_44;
          }
LABEL_25:
          long long v36 = _EXDefaultLog();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            goto LABEL_43;
          }
          *(_DWORD *)buf = 138543618;
          v84 = v30;
          __int16 v85 = 2114;
          uint64_t v31 = v64;
          v86 = v64;
LABEL_44:

          uint64_t v27 = v63;
LABEL_45:

          uint64_t v29 = v65 + 1;
        }
        while (v65 + 1 != v27);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v74 objects:v88 count:16];
      }
      while (v27);
    }

    objc_storeStrong((id *)&v11->_config, obj);
    extensionPoints = v11->_extensionPoints;
    v11->_extensionPoints = v12;
    v50 = v12;

    uint64_t v51 = [(NSDictionary *)v11->_extensionPoints keyEnumerator];
    extensionPointsKeyEnumerator = v11->_extensionPointsKeyEnumerator;
    v11->_extensionPointsKeyEnumerator = (NSEnumerator *)v51;

    uint64_t v53 = objc_opt_new();
    currentExtensionPoint = v11->_currentExtensionPoint;
    v11->_currentExtensionPoint = (_EXExtensionPoint *)v53;

    v11->_validateExtensionPoints = 1;
    id v8 = v58;
    id v9 = v59;
    id v10 = v57;
  }

  return v11;
}

void __64__EXExtensionPointEnumerator_initWithSDKDictionary_urls_config___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_EX_dictionaryForKey:", v5);
    id v8 = (void *)v7;
    id v9 = (void *)MEMORY[0x1E4F1CC08];
    if (v7) {
      id v9 = (void *)v7;
    }
    id v10 = v9;

    v11 = objc_msgSend(v10, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v6);

    [*(id *)(a1 + 32) setObject:v11 forKey:v5];
  }
  else
  {
    uint64_t v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v5;
    }
  }
}

+ (id)translateAppexptDictionary:(id)a3 definitionURL:(id)a4 isCatalyst:(BOOL)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if (v7)
  {
    id v10 = [v7 absoluteURL];
    v11 = [v10 path];
    id v9 = objc_msgSend(v8, "_EX_dictionaryBySettingObject:forKey:", v11, @"EXExtensionPointDefinitionPath");
  }
  id v12 = v9;
  int v13 = v12;
  if (v12)
  {
    v16 = @"EXNativeSDKVariant";
    v17[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v14;
}

- (id)translateXPCCacheDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _EXRegistrationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[EXExtensionPointEnumerator translateXPCCacheDictionary:]();
  }

  id v5 = [v3 allKeys];
  id v6 = [v5 firstObject];
  if ([v6 hasPrefix:@"/System/"])
  {

    goto LABEL_7;
  }
  id v7 = +[_EXDefaults sharedInstance];
  if (([v7 appleInternal] & 1) == 0)
  {

    goto LABEL_19;
  }
  id v8 = [v5 firstObject];
  int v9 = [v8 hasPrefix:@"/AppleInternal/System"];

  if (v9)
  {
LABEL_7:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v5;
    uint64_t v10 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v20 = v5;
      uint64_t v12 = *(void *)v22;
      int v13 = (void *)MEMORY[0x1E4F1CC08];
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v6);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v16 = objc_msgSend(v3, "_EX_objectForKey:ofClass:", v15, objc_opt_class());
          uint64_t v17 = objc_msgSend(v16, "_EX_dictionaryBySettingObject:forKey:", v15, @"EXExtensionPointDefinitionPath");

          if (v17)
          {

            id v25 = @"EXNativeSDKVariant";
            uint64_t v26 = v17;
            int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
            id v6 = (id)v17;
            goto LABEL_17;
          }
        }
        uint64_t v11 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_17:
      id v5 = v20;
      goto LABEL_20;
    }
LABEL_19:
    int v13 = (void *)MEMORY[0x1E4F1CC08];
LABEL_20:

    goto LABEL_21;
  }
  int v13 = (void *)MEMORY[0x1E4F1CC08];
LABEL_21:
  uint64_t v18 = _EXRegistrationLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[EXExtensionPointEnumerator translateXPCCacheDictionary:]();
  }

  return v13;
}

- (id)synthesizeNSExtensionKeysInDictionary:(id)a3 identifier:(id)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "_EX_objectForKey:ofClass:", @"NSExtension", objc_opt_class());
  if (v7)
  {

LABEL_4:
    int v9 = v5;
    goto LABEL_5;
  }
  id v8 = objc_msgSend(v5, "_EX_objectForKey:ofClass:", @"XPCService", objc_opt_class());

  if (v8) {
    goto LABEL_4;
  }
  v25[0] = @"NSExtensionPointIdentifier";
  v25[1] = @"NSExtensionPrincipalClassProhibited";
  v26[0] = v6;
  v26[1] = MEMORY[0x1E4F1CC38];
  v25[2] = @"NSExtensionAttributes";
  v23[0] = @"NSExtensionPointName";
  v23[1] = @"NSExtensionPointVersion";
  v24[0] = v6;
  v24[1] = @"1.0";
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

  v21[0] = @"NSExtension";
  v21[1] = @"EXRequiresLegacyInfrastructure";
  v22[0] = v12;
  v22[1] = MEMORY[0x1E4F1CC28];
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  int v9 = objc_msgSend(v5, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v13);

  id v14 = _EXRegistrationLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_debug_impl(&dword_191F29000, v14, OS_LOG_TYPE_DEBUG, "Extension point '%{public}@' - Synthesized NSExtension dictionary: %{public}@ -> %{public}@", (uint8_t *)&v15, 0x20u);
  }

LABEL_5:

  return v9;
}

- (id)flattenEXExtensionPointConfigurationInDictionary:(id)a3 identifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "_EX_objectForKey:ofClass:", @"EXExtensionPointConfiguration", objc_opt_class());
  id v8 = objc_msgSend(v5, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v7);
  int v9 = _EXRegistrationLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543874;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_debug_impl(&dword_191F29000, v9, OS_LOG_TYPE_DEBUG, "Extension point '%{public}@' - flattened EXExtensionPointConfiguration dictionary: %{public}@ -> %{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v8;
}

- (BOOL)validateExtensionPointIdentifier:(id)a3 sdkDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_validateExtensionPoints)
  {
    id v8 = [(EXExtensionPointEnumerator *)self config];
    int v9 = [v8 legacyExtensionPointAllowList];

    if (v9)
    {
      uint64_t v10 = [v7 objectForKey:@"EXExtensionPointConfiguration"];
      if (v10)
      {

        goto LABEL_9;
      }
      id v14 = [v7 objectForKey:@"NSExtension"];

      if (!v14) {
        goto LABEL_9;
      }
      char v15 = objc_msgSend(v9, "_EX_BOOLForKey:", v6);
      id v16 = +[_EXDefaults sharedInstance];
      if ([v16 appleInternal])
      {
        uint64_t v17 = objc_msgSend(v7, "_EX_stringForKey:", @"EXExtensionPointDefinitionPath");
        int v18 = [v17 hasPrefix:@"/AppleInternal/"];
      }
      else
      {
        int v18 = 0;
      }

      __int16 v19 = _EXRegistrationLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:]();
      }

      char v20 = v18 ? 1 : v15;
      if (v20) {
        goto LABEL_9;
      }
      long long v21 = +[_EXDefaults sharedInstance];
      int v22 = [v21 enforceLegacyExtensionPointAllowList];

      if (v22)
      {
        long long v23 = _EXRegistrationLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:]();
        }

        BOOL v11 = 0;
        goto LABEL_10;
      }
      long long v24 = +[_EXDefaults sharedInstance];
      int v25 = [v24 enforceLegacyExtensionPointAllowList];

      if (v25)
      {
LABEL_9:
        BOOL v11 = 1;
LABEL_10:

        goto LABEL_11;
      }
      id v12 = _EXRegistrationLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:]();
      }
    }
    else
    {
      id v12 = _EXRegistrationLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl(&dword_191F29000, v12, OS_LOG_TYPE_DEFAULT, "NO list of legacy extension points found. All extension points are considered valid... for now.", v26, 2u);
      }
    }

    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (id)nextObject
{
  v2 = self;
  v85[2] = *MEMORY[0x1E4F143B8];
  ++nextObject_count;
  uint64_t v3 = 56;
  if ([(NSMutableDictionary *)self->_currentSDKDictionaryForPlatform count]) {
    goto LABEL_55;
  }
  uint64_t v4 = 32;
  id v5 = [(NSEnumerator *)v2->_extensionPointsKeyEnumerator nextObject];
  id v6 = 0;
  unint64_t v7 = 0x1E92FC000uLL;
  unint64_t v8 = 0x1E4F1C000uLL;
  while (2)
  {
    int v9 = v6;
    while (1)
    {
      if (!v5)
      {
        uint64_t v10 = v6;
        goto LABEL_54;
      }
      uint64_t v10 = objc_msgSend(*(id *)((char *)&v2->super.super.isa + *(int *)(v7 + 964)), "_EX_dictionaryForKey:", v5);

      if (!v10) {
        goto LABEL_52;
      }
      if ([v10 count]) {
        break;
      }
      int v9 = v10;
      if (![v10 count]) {
        goto LABEL_52;
      }
    }
    id v11 = objc_alloc_init(*(Class *)(v8 + 2656));
    id v12 = objc_msgSend(v10, "_EX_dictionaryForKey:", @"EXNativeSDKVariant");
    if (![(EXExtensionPointEnumerator *)v2 validateExtensionPointIdentifier:v5 sdkDictionary:v12])
    {

      id v12 = 0;
    }
    __int16 v13 = [v12 objectForKey:@"EXSupportedPlatforms"];
    if (!v13)
    {
      v85[0] = @"EXSupportedPlatforms";
      v85[1] = @"EXSupportedPlatformsKey";
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
      __int16 v13 = objc_msgSend(v12, "_EX_dictionaryForKeys:", v14);
    }
    objc_opt_class();
    uint64_t v67 = v4;
    if (objc_opt_isKindOfClass())
    {
      long long v69 = v5;
      uint64_t v15 = v3;
      id v16 = [*(id *)(v8 + 2656) dictionary];

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v66 = v13;
        uint64_t v20 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v76 != v20) {
              objc_enumerationMutation(v17);
            }
            int v22 = [&unk_1EE2E1080 objectForKey:*(void *)(*((void *)&v75 + 1) + 8 * i)];
            if (v22) {
              [v16 setObject:v12 forKey:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v75 objects:v84 count:16];
        }
        while (v19);
        id v11 = v16;
        uint64_t v3 = v15;
LABEL_42:
        id v5 = v69;
        __int16 v13 = v66;
        goto LABEL_50;
      }
      id v11 = v16;
      uint64_t v3 = v15;
      id v5 = v69;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [*(id *)(v8 + 2656) dictionary];

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v17 = v13;
        uint64_t v24 = [v17 countByEnumeratingWithState:&v71 objects:v83 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          long long v68 = (void *)v23;
          long long v69 = v5;
          uint64_t v65 = v3;
          uint64_t v66 = v13;
          uint64_t v26 = v2;
          uint64_t v27 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v72 != v27) {
                objc_enumerationMutation(v17);
              }
              uint64_t v29 = *(void *)(*((void *)&v71 + 1) + 8 * j);
              uint64_t v30 = [&unk_1EE2E10A8 objectForKey:v29];
              uint64_t v31 = [v17 objectForKey:v29];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v32 = [v17 objectForKey:v29];
                if (v32
                  && [(EXExtensionPointEnumerator *)v26 validateExtensionPointIdentifier:v69 sdkDictionary:v32])
                {
                  [v68 setObject:v32 forKey:v30];
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v33 = [v31 BOOLValue];
                  if (v12)
                  {
                    if (v33) {
                      [v68 setObject:v12 forKey:v30];
                    }
                  }
                }
              }
            }
            uint64_t v25 = [v17 countByEnumeratingWithState:&v71 objects:v83 count:16];
          }
          while (v25);
          id v11 = v68;
          v2 = v26;
          uint64_t v3 = v65;
          goto LABEL_42;
        }
        id v11 = (id)v23;
      }
      else
      {
        if (v12)
        {
          int v34 = [NSNumber numberWithUnsignedInt:dyld_get_active_platform()];
          [v11 setObject:v12 forKey:v34];
        }
        objc_msgSend(v10, "_EX_dictionaryForKey:", @"EXCatalystSDKVariant");
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17
          && [(EXExtensionPointEnumerator *)v2 validateExtensionPointIdentifier:v5 sdkDictionary:v17])
        {
          [v11 setObject:v17 forKey:&unk_1EE2E1148];
        }
      }
    }
LABEL_50:

    if (![v11 count])
    {

      uint64_t v10 = 0;
      uint64_t v4 = v67;
      unint64_t v7 = 0x1E92FC000;
      unint64_t v8 = 0x1E4F1C000;
LABEL_52:
      uint64_t v35 = [*(id *)((char *)&v2->super.super.isa + v4) nextObject];

      id v5 = (void *)v35;
      id v6 = v10;
      continue;
    }
    break;
  }
  objc_storeStrong((id *)&v2->_currentIdentifier, v5);
  v64 = *(Class *)((char *)&v2->super.super.isa + v3);
  *(Class *)((char *)&v2->super.super.isa + v3) = (Class)v11;

LABEL_54:
LABEL_55:
  dyld_get_active_platform();
  unint64_t v36 = 0x1E92FC000uLL;
  if (![*(id *)((char *)&v2->super.super.isa + v3) count]) {
    goto LABEL_59;
  }
  uint64_t v37 = [*(id *)((char *)&v2->super.super.isa + v3) allKeys];
  uint64_t v38 = [v37 firstObject];

  uint64_t v39 = [*(id *)((char *)&v2->super.super.isa + v3) objectForKey:v38];
  unsigned int v40 = [v38 intValue];
  [*(id *)((char *)&v2->super.super.isa + v3) removeObjectForKey:v38];

  if (!v39)
  {
LABEL_59:
    uint64_t v44 = 0;
LABEL_60:
    [*(id *)((char *)&v2->super.super.isa + *(int *)(v36 + 972)) reset];
    v45 = 0;
    goto LABEL_81;
  }
  long long v41 = objc_msgSend(v39, "_EX_stringForKey:", @"EXExtensionPointDefinitionPath");
  unsigned int v70 = v40;
  long long v42 = v2;
  if (v41)
  {
    long long v43 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v41 isDirectory:0];
  }
  else
  {
    long long v43 = 0;
  }
  v46 = objc_msgSend(v39, "_EX_dictionaryByRemovingObjectForKey:", @"EXExtensionPointDefinitionPath");

  id v47 = objc_msgSend(v46, "_EX_objectForKey:ofClass:", @"XPCService", objc_opt_class());
  if (v47)
  {
    v48 = objc_msgSend(v46, "_EX_dictionaryForKey:", @"EXExtensionPointConfiguration");
    if (v48)
    {
      BOOL v49 = 0;
    }
    else
    {
      v50 = [v46 objectForKey:@"EXSupportsNSExtensionPlistKeys"];
      BOOL v49 = v50 == 0;
    }
  }
  else
  {
    BOOL v49 = 0;
  }

  uint64_t v51 = [(EXExtensionPointEnumerator *)v2 synthesizeNSExtensionKeysInDictionary:v46 identifier:v2->_currentIdentifier];

  v52 = [(EXExtensionPointEnumerator *)v2 flattenEXExtensionPointConfigurationInDictionary:v51 identifier:v2->_currentIdentifier];

  if (sdkDictionaryAdditions_onceToken != -1) {
    dispatch_once(&sdkDictionaryAdditions_onceToken, &__block_literal_global_427);
  }
  uint64_t v53 = [(id)sdkDictionaryAdditions_sdkDictionaryAdditions objectForKeyedSubscript:v2->_currentIdentifier];
  if (v53)
  {
    uint64_t v54 = objc_msgSend(v52, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v53);

    v52 = (void *)v54;
  }
  v55 = [v52 objectForKeyedSubscript:@"EXExtensionIconPersonality"];

  if (v55)
  {
    if (v49)
    {
LABEL_74:
      uint64_t v44 = objc_msgSend(v52, "_EX_dictionaryBySettingObject:forKey:", MEMORY[0x1E4F1CC38], @"EXRequiresLegacyInfrastructure");
      uint64_t v56 = 0;
      goto LABEL_77;
    }
  }
  else
  {
    long long v81 = @"EXExtensionIconPersonality";
    objc_super v82 = @"container";
    id v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    id v58 = (id)objc_msgSend(v52, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v57);

    if (v49) {
      goto LABEL_74;
    }
  }
  v79[0] = @"EXRequiresLegacyInfrastructure";
  v79[1] = @"EXExtensionPointConfiguration";
  v80[0] = MEMORY[0x1E4F1CC28];
  v80[1] = MEMORY[0x1E4F1CC08];
  uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
  uint64_t v44 = objc_msgSend(v52, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v59);

  uint64_t v56 = 1;
  v52 = (void *)v59;
LABEL_77:

  [(_EXExtensionPoint *)v42->_currentExtensionPoint setVariant:v56];
  uint64_t v60 = objc_msgSend(v44, "_EX_stringForKey:", @"EXExtensionPointDomain");
  if (v60) {
    id v61 = v42->_currentIdentifier;
  }
  else {
    id v61 = 0;
  }
  [(_EXExtensionPoint *)v42->_currentExtensionPoint setIdentifier:v42->_currentIdentifier];
  [(_EXExtensionPoint *)v42->_currentExtensionPoint setSDKDictionary:v44];
  [(_EXExtensionPoint *)v42->_currentExtensionPoint setUrl:v43];
  [(_EXExtensionPoint *)v42->_currentExtensionPoint setPlatform:v70];
  [(_EXExtensionPoint *)v42->_currentExtensionPoint setDomain:v60];
  [(_EXExtensionPoint *)v42->_currentExtensionPoint setName:v61];
  v45 = v42->_currentExtensionPoint;

  v2 = v42;
  unint64_t v36 = 0x1E92FC000;
  if (!v45) {
    goto LABEL_60;
  }
LABEL_81:
  v62 = _EXRegistrationLog();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
    [(EXExtensionPointEnumerator *)(uint64_t)v45 nextObject];
  }

  return v45;
}

- (BOOL)validateExtensionPoints
{
  return self->_validateExtensionPoints;
}

- (EXEnumeratorConfig)config
{
  return (EXEnumeratorConfig *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)extensionPoints
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSEnumerator)extensionPointsKeyEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 32, 1);
}

- (_EXExtensionPoint)currentExtensionPoint
{
  return (_EXExtensionPoint *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)currentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)currentSDKDictionaryForPlatform
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSDKDictionaryForPlatform, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_storeStrong((id *)&self->_currentExtensionPoint, 0);
  objc_storeStrong((id *)&self->_extensionPointsKeyEnumerator, 0);
  objc_storeStrong((id *)&self->_extensionPoints, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (void)translateXPCCacheDictionary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Translated SDK Dictionary: %{public}@", v2, v3, v4, v5, v6);
}

- (void)translateXPCCacheDictionary:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Translating SDK Dictionary: %{public}@", v2, v3, v4, v5, v6);
}

- (void)validateExtensionPointIdentifier:sdkDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
}

- (void)validateExtensionPointIdentifier:sdkDictionary:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
}

- (void)validateExtensionPointIdentifier:sdkDictionary:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "NSExtension Extension Point identifier: %{public}@ is legacy: %{public}s");
}

- (void)nextObject
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = nextObject_count;
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_debug_impl(&dword_191F29000, a2, OS_LOG_TYPE_DEBUG, "[%d] Enumerator returning: '%{public}@'", (uint8_t *)v2, 0x12u);
}

@end