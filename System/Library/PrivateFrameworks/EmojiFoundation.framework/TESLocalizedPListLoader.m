@interface TESLocalizedPListLoader
- (NSString)localeIdentifier;
- (NSString)resourceName;
- (TESLocalizedPListLoader)initWithLocaleIdentifier:(id)a3;
- (id)_loadItems;
- (id)_resolvePlistPath;
- (id)plistPath;
- (void)_loadItems;
- (void)setResourceName:(id)a3;
@end

@implementation TESLocalizedPListLoader

- (TESLocalizedPListLoader)initWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TESLocalizedPListLoader;
  v5 = [(TESLocalizedPListLoader *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    plistPath = v5->_plistPath;
    v5->_plistPath = 0;
  }
  return v5;
}

- (id)plistPath
{
  plistPath = self->_plistPath;
  if (!plistPath)
  {
    id v4 = [(TESLocalizedPListLoader *)self _resolvePlistPath];
    v5 = self->_plistPath;
    self->_plistPath = v4;

    plistPath = self->_plistPath;
  }
  return plistPath;
}

- (id)_resolvePlistPath
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(TESLocalizedPListLoader *)self localeIdentifier];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  v5 = emf_logging_get_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(TESLocalizedPListLoader *)self localeIdentifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B8C45000, v5, OS_LOG_TYPE_INFO, "Loading Text Effects plist file for locale '%{public}@'", (uint8_t *)&buf, 0xCu);
  }
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v8 = [(TESLocalizedPListLoader *)self resourceName];
  id v34 = [v7 URLForResource:v8 withExtension:@"plist" subdirectory:0 localization:v4];

  v9 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v9)
  {
    objc_super v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];
    v11 = [v10 languageIdentifier];

    if (([(__CFString *)v11 isEqualToString:@"nb-NO"] & 1) != 0
      || [(__CFString *)v11 isEqualToString:@"nn"])
    {

      v11 = @"no";
    }
    v12 = emf_logging_get_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [(TESLocalizedPListLoader *)self localeIdentifier];
      *(_DWORD *)v26 = 138543618;
      v27 = v13;
      __int16 v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_1B8C45000, v12, OS_LOG_TYPE_INFO, "No Text Effects plist file found for locale identifier '%{public}@'; attempting to load data associated with the"
        " normalized locale identifier '%{public}@'.",
        v26,
        0x16u);
    }
    v14 = [(TESLocalizedPListLoader *)self resourceName];
    uint64_t v15 = [v7 URLForResource:v14 withExtension:@"plist" subdirectory:0 localization:v11];
    v16 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v15;

    v9 = *(void **)(*((void *)&buf + 1) + 40);
    if (!v9)
    {
      v17 = emf_logging_get_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = [(TESLocalizedPListLoader *)self localeIdentifier];
        *(_DWORD *)v26 = 138543362;
        v27 = v18;
        _os_log_impl(&dword_1B8C45000, v17, OS_LOG_TYPE_INFO, "No Text Effects plist found for locale identifier '%{public}@'; attempting to load a fallback language.",
          v26,
          0xCu);
      }
      v19 = (void *)MEMORY[0x1E4F1CA20];
      v20 = [(TESLocalizedPListLoader *)self localeIdentifier];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __44__TESLocalizedPListLoader__resolvePlistPath__block_invoke;
      v23[3] = &unk_1E61A9900;
      v23[4] = self;
      p_long long buf = &buf;
      id v24 = v7;
      [v19 _enumerateLanguageFallbackGraphForLocaleIdentifier:v20 usingBlock:v23];

      v9 = *(void **)(*((void *)&buf + 1) + 40);
    }
  }
  id v21 = v9;
  _Block_object_dispose(&buf, 8);

  return v21;
}

void __44__TESLocalizedPListLoader__resolvePlistPath__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) localeIdentifier];
  char v7 = [v6 isEqualToString:v5];

  if ((v7 & 1) == 0)
  {
    v8 = emf_logging_get_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      id v15 = v5;
      _os_log_impl(&dword_1B8C45000, v8, OS_LOG_TYPE_INFO, "Loading Text Effects plist file for language fallback '%{public}@'", (uint8_t *)&v14, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    objc_super v10 = [*(id *)(a1 + 32) resourceName];
    uint64_t v11 = [v9 URLForResource:v10 withExtension:@"plist" subdirectory:0 localization:v5];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      *a3 = 1;
    }
  }
}

- (id)_loadItems
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(TESLocalizedPListLoader *)self plistPath];
  if (v3)
  {
    id v20 = 0;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v20];
    id v5 = v20;
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6 || ![v4 count])
    {
      char v7 = emf_logging_get_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [v3 absoluteString];
        v17 = [(TESLocalizedPListLoader *)self localeIdentifier];
        v18 = [v5 localizedDescription];
        *(_DWORD *)long long buf = 138543874;
        v22 = v16;
        __int16 v23 = 2114;
        id v24 = v17;
        __int16 v25 = 2114;
        uint64_t v26 = (uint64_t)v18;
        _os_log_error_impl(&dword_1B8C45000, v7, OS_LOG_TYPE_ERROR, "Text Effects plist at path '%{public}@' for locale '%{public}@' could not be read with error: '%{public}@", buf, 0x20u);
      }
      int v14 = 0;
      goto LABEL_33;
    }
    char v7 = [v4 objectForKeyedSubscript:@"metadata"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v8 = emf_logging_get_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TESLocalizedPListLoader _loadItems](v3);
      }
      int v14 = 0;
      goto LABEL_32;
    }
    v8 = [v7 objectForKeyedSubscript:@"schemaVersion"];
    if (v8
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [v8 unsignedLongValue] == 1)
    {
      v9 = [v4 objectForKeyedSubscript:@"triggers"];
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v10 = emf_logging_get_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = [v3 absoluteString];
            uint64_t v12 = [(TESLocalizedPListLoader *)self localeIdentifier];
            uint64_t v13 = [v9 count];
            *(_DWORD *)long long buf = 138543874;
            v22 = v11;
            __int16 v23 = 2114;
            id v24 = v12;
            __int16 v25 = 2048;
            uint64_t v26 = v13;
            _os_log_impl(&dword_1B8C45000, v10, OS_LOG_TYPE_INFO, "Loaded Text Effects plist '%{public}@' for locale '%{public}@' (%lu entries)", buf, 0x20u);
          }
          v9 = v9;
          int v14 = v9;
          goto LABEL_31;
        }
      }
      v19 = emf_logging_get_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[TESLocalizedPListLoader _loadItems].cold.4(v3);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v8 = &unk_1F12868C0;
      }
      v9 = emf_logging_get_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(TESLocalizedPListLoader *)v3 _loadItems];
      }
    }
    int v14 = 0;
LABEL_31:

LABEL_32:
LABEL_33:

    goto LABEL_34;
  }
  id v5 = emf_logging_get_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[TESLocalizedPListLoader _loadItems](self);
  }
  int v14 = 0;
LABEL_34:

  return v14;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
  self->_resourceName = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
}

- (void)_loadItems
{
  v1 = [a1 absoluteString];
  OUTLINED_FUNCTION_0_3(&dword_1B8C45000, v2, v3, "Text Effects plist at path '%{public}@' is malformed and lacks a 'triggers' segment.", v4, v5, v6, v7, 2u);
}

@end