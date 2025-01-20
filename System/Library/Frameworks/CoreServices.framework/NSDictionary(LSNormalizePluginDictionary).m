@interface NSDictionary(LSNormalizePluginDictionary)
- (id)_ls_normalizedPluginPlist;
- (id)ls_fixupExtensionPointIdentifierKey;
- (id)ls_insertExtensionPointVersion:()LSNormalizePluginDictionary;
@end

@implementation NSDictionary(LSNormalizePluginDictionary)

- (id)ls_fixupExtensionPointIdentifierKey
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [v1 objectForKey:@"EXAppExtensionAttributes"];
  v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 objectForKey:@"EXExtensionPointIdentifier"];
  v8 = v7;
  if (v6 && v7)
  {
    if (objc_opt_isKindOfClass())
    {
LABEL_16:
      v9 = (void *)[v1 mutableCopy];
      v10 = [v9 objectForKey:@"NSExtension"];
      v11 = (void *)[v10 mutableCopy];

      if (v11)
      {
        v12 = _LSRegistrationLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = [v1 objectForKey:*MEMORY[0x1E4F1CFF8]];
          v15 = (__CFString *)v14;
          if (v13 && v14 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v15 = 0;
          }
          int v22 = 138412546;
          v23 = (__CFString *)v8;
          __int16 v24 = 2112;
          v25 = v15;
          _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_INFO, "Overriding NSExtension->NSExtensionPointIdentifier to %@ for bundleID %@", (uint8_t *)&v22, 0x16u);
        }
      }
      else
      {
        v16 = _LSRegistrationLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = [v1 objectForKey:*MEMORY[0x1E4F1CFF8]];
          v19 = (__CFString *)v18;
          if (v17 && v18 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v19 = 0;
          }
          int v22 = 138412546;
          v23 = (__CFString *)v8;
          __int16 v24 = 2112;
          v25 = v19;
          _os_log_impl(&dword_182959000, v16, OS_LOG_TYPE_INFO, "Synthesizing NSExtension->NSExtensionPointIdentifier to %@ for bundleID %@", (uint8_t *)&v22, 0x16u);
        }
        v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      }
      [v11 setObject:v8 forKey:@"NSExtensionPointIdentifier"];
      [v9 setObject:v11 forKey:@"NSExtension"];
      uint64_t v20 = [v9 copy];

      id v1 = (id)v20;
      goto LABEL_32;
    }

    v8 = 0;
  }
  if (!v4 || v8)
  {
    if (!v8) {
      goto LABEL_33;
    }
    goto LABEL_16;
  }
  v8 = _LSRegistrationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v22 = 138412546;
    v23 = @"EXExtensionPointIdentifier";
    __int16 v24 = 2112;
    v25 = @"EXAppExtensionAttributes";
  }
LABEL_32:

LABEL_33:

  return v1;
}

- (id)ls_insertExtensionPointVersion:()LSNormalizePluginDictionary
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [a1 objectForKey:@"NSExtension"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v7 = 0;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v7 objectForKey:@"NSExtensionAttributes"];
  v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = [v11 objectForKey:@"NSExtensionVersion"];
  uint64_t v14 = (void *)v13;
  if (!v12 || !v13)
  {
    if (!v13) {
      goto LABEL_17;
    }
LABEL_16:
    id v15 = a1;
    goto LABEL_22;
  }
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }

LABEL_17:
  id v15 = (id)[a1 mutableCopy];
  v16 = [v15 objectForKey:@"NSExtension"];
  uint64_t v14 = (void *)[v16 mutableCopy];

  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  uint64_t v17 = [v14 objectForKey:@"NSExtensionAttributes"];
  uint64_t v18 = (void *)[v17 mutableCopy];

  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  [v18 setObject:v4 forKey:@"NSExtensionVersion"];
  [v14 setObject:v18 forKey:@"NSExtensionAttributes"];
  [v15 setObject:v14 forKey:@"NSExtension"];

LABEL_22:

  return v15;
}

- (id)_ls_normalizedPluginPlist
{
  id v1 = (void *)[a1 mutableCopy];
  uint64_t v2 = [v1 objectForKey:@"NSExtension"];

  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = [v1 objectForKey:*MEMORY[0x1E4F1CC70]];
    uint64_t v5 = (__CFString *)v4;
    if (v3 && v4 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v5 = 0;
    }
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = @"1";
    }
    uint64_t v7 = objc_msgSend(v1, "ls_insertExtensionPointVersion:", v6);

    id v1 = (void *)v7;
  }
  BOOL v8 = [v1 objectForKey:@"EXAppExtensionAttributes"];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v1, "ls_fixupExtensionPointIdentifierKey");

    id v1 = (void *)v9;
  }

  return v1;
}

@end