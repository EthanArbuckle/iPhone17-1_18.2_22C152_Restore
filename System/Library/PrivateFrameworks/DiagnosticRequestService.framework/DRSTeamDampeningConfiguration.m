@interface DRSTeamDampeningConfiguration
+ (id)teamIdToTeamDampeningConfigFromPlistDirectoryPath:(id)a3 errorOut:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (DRSDampeningConfiguration)defaultConfiguration;
- (DRSTeamDampeningConfiguration)initWithDefaultConfiguration:(id)a3 issueCategoryToConfigurationDict:(id)a4;
- (DRSTeamDampeningConfiguration)initWithPlistDict:(id)a3;
- (NSDictionary)issueCategoryToConfigurationDict;
- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3 teamID:(id)a4;
- (id)_initWithTeamDampeningConfigMO_ON_MOC_QUEUE:(id)a3;
- (id)configurationForIssueCategory:(id)a3;
- (id)debugDescription;
- (id)jsonCompatibleDictRepresentation;
- (void)setDefaultConfiguration:(id)a3;
- (void)setIssueCategoryToConfigurationDict:(id)a3;
- (void)updateIssueCategoryConfig:(id)a3 newConfig:(id)a4;
@end

@implementation DRSTeamDampeningConfiguration

- (id)jsonCompatibleDictRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];

  if (v4)
  {
    v5 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];
    v6 = [v5 jsonCompatibleDictRepresentation];
    [v3 setObject:v6 forKeyedSubscript:kDRSDMDefaultConfigKey];
  }
  v7 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    v10 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__DRSTeamDampeningConfiguration_jsonCompatibleDictRepresentation__block_invoke;
    v13[3] = &unk_263FCA750;
    id v14 = v9;
    id v11 = v9;
    [v10 enumerateKeysAndObjectsUsingBlock:v13];

    [v3 setObject:v11 forKeyedSubscript:kDRSDMIssueCategoryDictKey];
  }

  return v3;
}

void __65__DRSTeamDampeningConfiguration_jsonCompatibleDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 jsonCompatibleDictRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)debugDescription
{
  id v3 = [MEMORY[0x263F089D8] string];
  v4 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];

  if (v4)
  {
    id v5 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];
    id v6 = [v5 debugDescription];
    [v3 appendFormat:@"Default config:\n%@\n%@", @"==========================", v6];
  }
  v7 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];

  if (v7)
  {
    uint64_t v8 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__DRSTeamDampeningConfiguration_debugDescription__block_invoke;
    v10[3] = &unk_263FCA750;
    id v11 = v3;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
  }

  return v3;
}

void __49__DRSTeamDampeningConfiguration_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 debugDescription];
  [v4 appendFormat:@"%@:\n%@\n%@", v5, @"==========================", v6];
}

- (DRSTeamDampeningConfiguration)initWithPlistDict:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke;
  v25[3] = &unk_263FCA778;
  v25[4] = &v26;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];
  if (!*((unsigned char *)v27 + 24))
  {
    id v5 = [v4 objectForKeyedSubscript:kDRSDMDefaultConfigKey];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        DPLogHandle_DampeningManagerError();
        v7 = (DRSDampeningConfiguration *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(&v7->super))
        {
          *(_WORD *)buf = 0;
          uint64_t v8 = "Invalid default config dictionary value";
          goto LABEL_19;
        }
LABEL_20:
        id v6 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v7 = [[DRSDampeningConfiguration alloc] initWithPlistDict:v5];
      if (!v7)
      {
        DPLogHandle_DampeningManagerError();
        v7 = (DRSDampeningConfiguration *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(&v7->super))
        {
          *(_WORD *)buf = 0;
          uint64_t v8 = "Malformed default config dictionary";
LABEL_19:
          _os_signpost_emit_with_name_impl(&dword_209E70000, &v7->super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", v8, buf, 2u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = [v4 objectForKeyedSubscript:kDRSDMIssueCategoryDictKey];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = DPLogHandle_DampeningManagerError();
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", "Invalid issue category to config dictionary value", buf, 2u);
        }

        id v14 = 0;
        goto LABEL_27;
      }
      v10 = [MEMORY[0x263EFF9A0] dictionary];
      *(void *)buf = 0;
      v22 = buf;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke_384;
      v18[3] = &unk_263FCA568;
      v20 = buf;
      id v11 = v10;
      id v19 = v11;
      [v9 enumerateKeysAndObjectsUsingBlock:v18];
      int v12 = v22[24];
      if (v22[24])
      {
        v13 = DPLogHandle_DampeningManagerError();
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)v17 = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", "Malformed issue category-to-config plist dictionary value", v17, 2u);
        }

        id v14 = 0;
      }
      else
      {
        id v14 = v11;
      }

      _Block_object_dispose(buf, 8);
      if (v12)
      {
LABEL_27:
        id v6 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      id v14 = 0;
    }
    self = [(DRSTeamDampeningConfiguration *)self initWithDefaultConfiguration:v7 issueCategoryToConfigurationDict:v14];
    id v6 = self;
    goto LABEL_29;
  }
  id v5 = DPLogHandle_DampeningManagerError();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", "Malformed team dampening plist", buf, 2u);
  }
  id v6 = 0;
LABEL_31:

  _Block_object_dispose(&v26, 8);
  return v6;
}

void __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke_384(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  uint64_t v8 = [[DRSDampeningConfiguration alloc] initWithPlistDict:v7];

  if (v8)
  {
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)teamIdToTeamDampeningConfigFromPlistDirectoryPath:(id)a3 errorOut:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  if (!v5) {
    goto LABEL_18;
  }
  char v59 = 0;
  id v7 = [MEMORY[0x263F08850] defaultManager];
  char v8 = [v7 fileExistsAtPath:v6 isDirectory:&v59];

  if ((v8 & 1) == 0)
  {
    id v9 = DPLogHandle_DampeningManager();
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v61 = (uint64_t)v6;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlistDirectoryMissing", "Plist directory %{public}@ does not exist", buf, 0xCu);
    }
    id v15 = 0;
    goto LABEL_54;
  }
  if (v59)
  {
    id v9 = [NSURL fileURLWithPath:v6];
    v10 = [MEMORY[0x263F08850] defaultManager];
    id v58 = 0;
    id v11 = [v10 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:0 error:&v58];
    id v12 = v58;

    if (v12)
    {
      v13 = DPLogHandle_DampeningManagerError();
      if (os_signpost_enabled(v13))
      {
        id v14 = [v12 localizedDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v61 = (uint64_t)v6;
        __int16 v62 = 2114;
        v63 = v14;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CouldNotEnumeratePlistDirectory", "Could not enumerate plist directory %{public}@ due to error: %{public}@", buf, 0x16u);
      }
      id v15 = 0;
      if (a4) {
        *a4 = v12;
      }
LABEL_53:

      goto LABEL_54;
    }
    v47 = a4;
    v49 = v9;
    v50 = v6;
    v17 = [MEMORY[0x263EFF9A0] dictionary];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v48 = v11;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (!v19)
    {
LABEL_38:

      id v15 = v17;
      v39 = v17;
      id v9 = v49;
      id v6 = v50;
      id v12 = 0;
      id v11 = v48;
LABEL_52:

      goto LABEL_53;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v55;
    id v51 = v18;
    v52 = v17;
LABEL_21:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v55 != v21) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void **)(*((void *)&v54 + 1) + 8 * v22);
      if ([v23 hasDirectoryPath])
      {
        char v24 = DPLogHandle_DampeningManager();
        if (os_signpost_enabled(v24))
        {
          v25 = [v23 path];
          *(_DWORD *)buf = 138543362;
          uint64_t v61 = (uint64_t)v25;
          uint64_t v26 = v24;
          v27 = "SkippingPlistSubDir";
LABEL_35:
          _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v27, "Skipping %{public}@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v28 = [v23 pathExtension];
        char v29 = [v28 isEqualToString:@"plist"];

        if (v29)
        {
          id v30 = objc_alloc(NSDictionary);
          id v53 = 0;
          v31 = (void *)[v30 initWithContentsOfURL:v23 error:&v53];
          char v24 = v53;
          if (!v31)
          {
            v40 = DPLogHandle_DampeningManagerError();
            if (os_signpost_enabled(v40))
            {
              uint64_t v41 = [v23 path];
              v42 = (void *)v41;
              v43 = @"Unknown";
              if (v24) {
                v43 = (__CFString *)v24;
              }
              *(_DWORD *)buf = 138543618;
              uint64_t v61 = v41;
              __int16 v62 = 2114;
              v63 = v43;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlistLoadingError", "Failed to load %{public}@ due to error: %{public}@", buf, 0x16u);
            }
            id v9 = v49;
            id v6 = v50;
            id v12 = 0;
            id v11 = v48;
            if (v47) {
              id *v47 = 0;
            }
            goto LABEL_51;
          }
          v32 = [[DRSTeamDampeningConfiguration alloc] initWithPlistDict:v31];
          if (!v32)
          {
            v44 = DPLogHandle_DampeningManagerError();
            id v9 = v49;
            id v6 = v50;
            id v12 = 0;
            if (os_signpost_enabled(v44))
            {
              v45 = [v23 path];
              *(_DWORD *)buf = 138543362;
              uint64_t v61 = (uint64_t)v45;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigPlistProcessingError", "Failed to intialize team dampening configuration from %{public}@", buf, 0xCu);
            }
            if (v47)
            {
              _dampeningManagerError(@"Invalid plist dictionary");
              id *v47 = (id)objc_claimAutoreleasedReturnValue();
            }

            id v11 = v48;
            id v18 = v51;
LABEL_51:

            id v15 = 0;
            v39 = v52;
            goto LABEL_52;
          }
          v33 = [v23 path];
          v34 = [v33 lastPathComponent];
          v35 = [v34 stringByDeletingPathExtension];

          v36 = DPLogHandle_DampeningManager();
          if (os_signpost_enabled(v36))
          {
            v37 = [v23 path];
            v38 = [(DRSTeamDampeningConfiguration *)v32 debugDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v61 = (uint64_t)v37;
            __int16 v62 = 2114;
            v63 = v35;
            __int16 v64 = 2114;
            v65 = v38;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IncludingPlistTeamIDConfig", "Path: %{public}@\nTeamID: %{public}@\nConfig:\n%{public}@", buf, 0x20u);
          }
          v17 = v52;
          [v52 setObject:v32 forKeyedSubscript:v35];

          id v18 = v51;
        }
        else
        {
          char v24 = DPLogHandle_DampeningManager();
          if (os_signpost_enabled(v24))
          {
            v25 = [v23 path];
            *(_DWORD *)buf = 138543362;
            uint64_t v61 = (uint64_t)v25;
            uint64_t v26 = v24;
            v27 = "SkippingNonPlistFile";
            goto LABEL_35;
          }
        }
      }

      if (v20 == ++v22)
      {
        uint64_t v20 = [v18 countByEnumeratingWithState:&v54 objects:v66 count:16];
        if (v20) {
          goto LABEL_21;
        }
        goto LABEL_38;
      }
    }
  }
  v16 = DPLogHandle_DampeningManagerError();
  if (os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v61 = (uint64_t)v6;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlistDirectoryNotDirectory", "Plist directory %{public}@ is not a directory", buf, 0xCu);
  }

  if (!a4)
  {
LABEL_18:
    id v15 = 0;
    goto LABEL_55;
  }
  id v9 = [NSString stringWithFormat:@"Plist directory path '%@' is not a directory", v6];
  _dampeningManagerError(v9);
  id v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

LABEL_55:

  return v15;
}

- (void)updateIssueCategoryConfig:(id)a3 newConfig:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
  char v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (DRSTeamDampeningConfiguration)initWithDefaultConfiguration:(id)a3 issueCategoryToConfigurationDict:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)DRSTeamDampeningConfiguration;
    id v11 = [(DRSTeamDampeningConfiguration *)&v16 init];
    id v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_defaultConfiguration, a3);
      uint64_t v13 = [(id)v8 mutableCopy];
      issueCategoryToConfigurationDict = v12->_issueCategoryToConfigurationDict;
      v12->_issueCategoryToConfigurationDict = (NSDictionary *)v13;
    }
    self = v12;
    v10 = self;
  }
  else
  {
    id v9 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigurationFailure", "Default configuration and issue category configuration dictionary cannot both be nil", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)configurationForIssueCategory:(id)a3
{
  id v4 = a3;
  id v5 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v6 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DRSTeamDampeningConfiguration *)a3;
  id v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v13 = 1;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];
      if (v7
        && (unint64_t v8 = (void *)v7,
            [(DRSTeamDampeningConfiguration *)v6 defaultConfiguration],
            id v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        v10 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];
        id v11 = [(DRSTeamDampeningConfiguration *)v6 defaultConfiguration];
        char v12 = [v10 isEqual:v11];

        if ((v12 & 1) == 0) {
          goto LABEL_18;
        }
      }
      else
      {
        id v14 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];
        if (v14) {
          goto LABEL_17;
        }
        id v15 = [(DRSTeamDampeningConfiguration *)v6 defaultConfiguration];

        if (v15) {
          goto LABEL_18;
        }
      }
      uint64_t v16 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
      if (v16)
      {
        v17 = (void *)v16;
        id v18 = [(DRSTeamDampeningConfiguration *)v6 issueCategoryToConfigurationDict];

        if (v18)
        {
          uint64_t v19 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
          uint64_t v20 = [(DRSTeamDampeningConfiguration *)v6 issueCategoryToConfigurationDict];
          char v21 = [v19 isEqualToDictionary:v20];

          if (v21) {
            goto LABEL_22;
          }
          goto LABEL_18;
        }
      }
      id v14 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
      if (!v14)
      {
        uint64_t v23 = [(DRSTeamDampeningConfiguration *)v6 issueCategoryToConfigurationDict];

        if (!v23)
        {
LABEL_22:
          BOOL v13 = 1;
          goto LABEL_19;
        }
LABEL_18:
        BOOL v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

- (id)_initWithTeamDampeningConfigMO_ON_MOC_QUEUE:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 defaultConfiguration];

  if (v5)
  {
    id v6 = [DRSDampeningConfiguration alloc];
    uint64_t v7 = [v4 defaultConfiguration];
    uint64_t v22 = [(DRSDampeningConfiguration *)v6 _initWithMO_ON_MOC_QUEUE:v7];
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [v4 categoryConfigurations];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        id v15 = [[DRSDampeningConfiguration alloc] _initWithMO_ON_MOC_QUEUE:v14];
        if (!v15)
        {
          uint64_t v20 = DPLogHandle_DampeningManagerError();
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigurationMOInitFailure", "Failed to initialize team dampening configuration from persistence", buf, 2u);
          }

          uint64_t v19 = 0;
          id v18 = (void *)v22;
          goto LABEL_18;
        }
        uint64_t v16 = v15;
        v17 = [v14 identifier];
        [v8 setObject:v16 forKeyedSubscript:v17];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (![v8 count])
  {

    id v8 = 0;
  }
  id v18 = (void *)v22;
  self = [(DRSTeamDampeningConfiguration *)self initWithDefaultConfiguration:v22 issueCategoryToConfigurationDict:v8];
  uint64_t v19 = self;
LABEL_18:

  return v19;
}

- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3 teamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[DRSTeamDampeningConfigurationMO alloc] initWithContext:v6];
  [(DRSTeamDampeningConfigurationMO *)v8 setTeamID:v7];
  id v9 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];

  if (v9)
  {
    uint64_t v10 = [(DRSTeamDampeningConfiguration *)self defaultConfiguration];
    uint64_t v11 = objc_msgSend(v10, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", v6, @"defaultConfiguration");
    [(DRSTeamDampeningConfigurationMO *)v8 setDefaultConfiguration:v11];
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v12 = [(DRSTeamDampeningConfiguration *)self issueCategoryToConfigurationDict];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__DRSTeamDampeningConfiguration__ON_MOC_QUEUE_moRepresentationInContext_teamID___block_invoke;
  v17[3] = &unk_263FCA7A0;
  id v13 = v6;
  id v18 = v13;
  uint64_t v20 = &v21;
  id v14 = v8;
  uint64_t v19 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];

  if (*((unsigned char *)v22 + 24)) {
    id v15 = 0;
  }
  else {
    id v15 = v14;
  }

  _Block_object_dispose(&v21, 8);

  return v15;
}

void __80__DRSTeamDampeningConfiguration__ON_MOC_QUEUE_moRepresentationInContext_teamID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = objc_msgSend(a3, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", *(void *)(a1 + 32), v7);
  if (v8)
  {
    [*(id *)(a1 + 40) addCategoryConfigurationsObject:v8];
  }
  else
  {
    *a4 = 1;
    id v9 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v9))
    {
      int v10 = 138543362;
      id v11 = v7;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigurationMORepresentationFailure", "Failed to get MO representation of config for issueCategory: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (DRSDampeningConfiguration)defaultConfiguration
{
  return self->_defaultConfiguration;
}

- (void)setDefaultConfiguration:(id)a3
{
}

- (NSDictionary)issueCategoryToConfigurationDict
{
  return self->_issueCategoryToConfigurationDict;
}

- (void)setIssueCategoryToConfigurationDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueCategoryToConfigurationDict, 0);

  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
}

@end