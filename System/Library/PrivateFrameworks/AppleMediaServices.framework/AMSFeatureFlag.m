@interface AMSFeatureFlag
+ (BOOL)disableFlagForFeature:(id)a3 domain:(id)a4 error:(id *)a5;
+ (BOOL)disableFlagGroup:(id)a3 error:(id *)a4;
+ (BOOL)enableFlagForFeature:(id)a3 domain:(id)a4 error:(id *)a5;
+ (BOOL)enableFlagGroup:(id)a3 error:(id *)a4;
+ (id)allFlagGroups;
+ (id)flagForFeature:(id)a3 domain:(id)a4;
+ (id)flagForFeature:(id)a3 domain:(id)a4 searchDirectory:(id)a5;
+ (id)flagGroupWithName:(id)a3;
- (AMSFeatureFlag)initWithFlagData:(id)a3 mutableFeatures:(id)a4 profileFeatures:(id)a5 feature:(id)a6 domain:(id)a7;
- (BOOL)hasITFEWithName:(id)a3;
- (BOOL)hasITFEs;
- (BOOL)isCodeComplete;
- (BOOL)isDefaultEnabled;
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (BOOL)isRemote;
- (BOOL)isTestable;
- (BOOL)isUserEnabled;
- (NSArray)itfes;
- (NSDictionary)flagData;
- (NSString)ITFE;
- (NSString)associatedGroup;
- (NSString)displayName;
- (NSString)domain;
- (NSString)feature;
- (NSString)featureDescription;
- (NSString)flagGroup;
- (id)itfesFromString:(id)a3 mutableFeatures:(id)a4 profileFeatures:(id)a5;
- (int64_t)_developmentPhaseFromGroupType:(int64_t)a3;
- (int64_t)developmentPhase;
- (int64_t)groupType;
- (void)_activateFlag;
- (void)_disableITFEs;
- (void)_enableITFEs;
- (void)_updateDevelopmentPhase;
- (void)_updateInternalEnabledState;
- (void)_updateUserEnabled:(BOOL)a3;
- (void)activateITFEs;
- (void)setAssociatedGroup:(id)a3;
- (void)setDefaultEnabled:(BOOL)a3;
- (void)setDevelopmentPhase:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomain:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFeature:(id)a3;
- (void)setFeatureDescription:(id)a3;
- (void)setFlagData:(id)a3;
- (void)setFlagGroup:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setITFE:(id)a3;
- (void)setItfes:(id)a3;
- (void)setUserEnabled:(BOOL)a3;
@end

@implementation AMSFeatureFlag

- (AMSFeatureFlag)initWithFlagData:(id)a3 mutableFeatures:(id)a4 profileFeatures:(id)a5 feature:(id)a6 domain:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AMSFeatureFlag;
  v17 = [(AMSFeatureFlag *)&v31 init];
  v18 = v17;
  if (v17)
  {
    [(AMSFeatureFlag *)v17 setFeature:v15];
    [(AMSFeatureFlag *)v18 setDomain:v16];
    [(AMSFeatureFlag *)v18 setFlagData:v12];
    v19 = [v12 objectForKeyedSubscript:@"Hidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[AMSFeatureFlag setHidden:](v18, "setHidden:", [v19 BOOLValue]);
    }
    v28 = v19;
    v20 = [v12 objectForKeyedSubscript:@"AMPITFE"];
    objc_opt_class();
    id v30 = v13;
    if (objc_opt_isKindOfClass()) {
      [(AMSFeatureFlag *)v18 itfesFromString:v20 mutableFeatures:v13 profileFeatures:v14];
    }
    else {
    v21 = [MEMORY[0x1E4F1C978] array];
    }
    id v29 = v14;
    [(AMSFeatureFlag *)v18 setItfes:v21];

    v22 = [v12 objectForKeyedSubscript:@"AMPAssociatedGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AMSFeatureFlag *)v18 setAssociatedGroup:v22];
    }
    v23 = [v12 objectForKeyedSubscript:@"DisplayName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AMSFeatureFlag *)v18 setDisplayName:v23];
    }
    id v24 = v15;
    v25 = [v12 objectForKeyedSubscript:@"Description"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AMSFeatureFlag *)v18 setFeatureDescription:v25];
    }
    v26 = [v12 objectForKeyedSubscript:@"AMPFlagGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AMSFeatureFlag *)v18 setFlagGroup:v26];
    }
    [(AMSFeatureFlag *)v18 _updateInternalEnabledState];
    [(AMSFeatureFlag *)v18 _updateDevelopmentPhase];

    id v14 = v29;
    id v13 = v30;
    id v15 = v24;
  }

  return v18;
}

- (BOOL)isRemote
{
  return 0;
}

+ (id)flagForFeature:(id)a3 domain:(id)a4
{
  return (id)[a1 flagForFeature:a3 domain:a4 searchDirectory:0];
}

+ (id)flagForFeature:(id)a3 domain:(id)a4 searchDirectory:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  +[AMSFeatureFlagGroup allFlagGroupsIncludingHidden:1 searchDirectory:a5];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    uint64_t v10 = *(void *)v34;
    v28 = v9;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v9);
        }
        uint64_t v27 = v11;
        id v12 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v33 + 1) + 8 * v11), v25);
        id v13 = [v12 flags];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              v20 = [v19 feature];
              if ([v20 isEqualToString:v7])
              {
                v21 = [v19 domain];
                char v22 = [v21 isEqualToString:v8];

                if (v22)
                {
                  id v23 = v19;

                  id v9 = v28;
                  goto LABEL_21;
                }
              }
              else
              {
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v16);
        }

        uint64_t v11 = v27 + 1;
        id v9 = v28;
        uint64_t v10 = v25;
      }
      while (v27 + 1 != v26);
      id v23 = 0;
      uint64_t v26 = [v28 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }
  else
  {
    id v23 = 0;
  }
LABEL_21:

  return v23;
}

+ (BOOL)enableFlagForFeature:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 flagForFeature:v8 domain:v9];
  uint64_t v16 = v10;
  if (a5) {
    BOOL v17 = v10 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  BOOL v18 = !v17;
  if (v17)
  {
    AMSErrorWithFormat(7, @"Feature Flag Doesn't Exist", @"Feature: %@, Domain: %@", v11, v12, v13, v14, v15, (uint64_t)v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [v10 setUserEnabled:1];
  }

  return v18;
}

+ (BOOL)disableFlagForFeature:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 flagForFeature:v8 domain:v9];
  uint64_t v16 = v10;
  if (a5) {
    BOOL v17 = v10 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  BOOL v18 = !v17;
  if (v17)
  {
    AMSErrorWithFormat(7, @"Feature Flag Doesn't Exist", @"Feature: %@, Domain: %@", v11, v12, v13, v14, v15, (uint64_t)v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [v10 setUserEnabled:0];
  }

  return v18;
}

- (void)setUserEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  [(AMSFeatureFlag *)obj _updateUserEnabled:v3];
  [(AMSFeatureFlag *)obj _activateFlag];
  [(AMSFeatureFlag *)obj _updateInternalEnabledState];
  [(AMSFeatureFlag *)obj activateITFEs];
  objc_sync_exit(obj);
}

- (void)_activateFlag
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v3 = AMSSetLogKeyIfNeeded();
  v4 = [MEMORY[0x1E4F61890] shared];
  v5 = [(AMSFeatureFlag *)self feature];
  v6 = [(AMSFeatureFlag *)self domain];
  id v7 = objc_msgSend(v4, "ams_safeStateForFeature:domain:level:", v5, v6, 3);

  if (self->_userEnabled)
  {
    if (v7 && [v7 value] == 1)
    {
      id v8 = +[AMSLogConfig sharedConfig];
      if (!v8)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [(AMSFeatureFlag *)self domain];
      uint64_t v12 = [(AMSFeatureFlag *)self feature];
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = v10;
      __int16 v36 = 2114;
      v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v11;
      __int16 v40 = 2114;
      v41 = v12;
      uint64_t v13 = "%{public}@: [%{public}@] Skipping Feature Flag Enable Toggle as it is already enabled: %{public}@/%{public}@";
LABEL_29:
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, v13, buf, 0x2Au);

LABEL_30:
      goto LABEL_31;
    }
    uint64_t v14 = [MEMORY[0x1E4F61890] shared];
    uint64_t v15 = [(AMSFeatureFlag *)self feature];
    uint64_t v16 = [(AMSFeatureFlag *)self domain];
    [v14 enableFeature:v15 domain:v16 level:3];

    BOOL v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      BOOL v17 = +[AMSLogConfig sharedConfig];
    }
    BOOL v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      v20 = [(AMSFeatureFlag *)self domain];
      v21 = [(AMSFeatureFlag *)self feature];
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = v19;
      __int16 v36 = 2114;
      v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v20;
      __int16 v40 = 2114;
      v41 = v21;
      char v22 = "%{public}@: [%{public}@] Feature Flag Enabled: %{public}@/%{public}@";
LABEL_18:
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, v22, buf, 0x2Au);
    }
  }
  else
  {
    if (v7 && ![v7 value])
    {
      id v8 = +[AMSLogConfig sharedConfig];
      if (!v8)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      uint64_t v32 = objc_opt_class();
      uint64_t v11 = [(AMSFeatureFlag *)self domain];
      uint64_t v12 = [(AMSFeatureFlag *)self feature];
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = v32;
      __int16 v36 = 2114;
      v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v11;
      __int16 v40 = 2114;
      v41 = v12;
      uint64_t v13 = "%{public}@: [%{public}@] Skipping Feature Flag Disable Toggle as it is already disabled: %{public}@/%{public}@";
      goto LABEL_29;
    }
    id v23 = [MEMORY[0x1E4F61890] shared];
    id v24 = [(AMSFeatureFlag *)self feature];
    uint64_t v25 = [(AMSFeatureFlag *)self domain];
    [v23 disableFeature:v24 domain:v25 level:3];

    BOOL v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      BOOL v17 = +[AMSLogConfig sharedConfig];
    }
    BOOL v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = objc_opt_class();
      v20 = [(AMSFeatureFlag *)self domain];
      v21 = [(AMSFeatureFlag *)self feature];
      *(_DWORD *)buf = 138544130;
      uint64_t v35 = v26;
      __int16 v36 = 2114;
      v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v20;
      __int16 v40 = 2114;
      v41 = v21;
      char v22 = "%{public}@: [%{public}@] Feature Flag Disabled: %{public}@/%{public}@";
      goto LABEL_18;
    }
  }

  uint64_t v27 = [MEMORY[0x1E4F61890] shared];
  id v33 = 0;
  [v27 commitUpdates:&v33];
  id v8 = v33;

  if (v8)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    v28 = [v9 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_opt_class();
      long long v30 = [(AMSFeatureFlag *)self domain];
      long long v31 = [(AMSFeatureFlag *)self feature];
      *(_DWORD *)buf = 138544386;
      uint64_t v35 = v29;
      __int16 v36 = 2114;
      v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v30;
      __int16 v40 = 2114;
      v41 = v31;
      __int16 v42 = 2114;
      id v43 = v8;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Feature Flag error occurred for flag: %{public}@/%{public}@ %{public}@", buf, 0x34u);
    }
    goto LABEL_30;
  }
LABEL_31:
}

- (void)_updateInternalEnabledState
{
  BOOL v3 = [MEMORY[0x1E4F61890] shared];
  v4 = [(AMSFeatureFlag *)self feature];
  v5 = [(AMSFeatureFlag *)self domain];
  objc_msgSend(v3, "ams_safeStateForFeature:domain:", v4, v5);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [MEMORY[0x1E4F61890] shared];
  id v7 = [(AMSFeatureFlag *)self feature];
  id v8 = [(AMSFeatureFlag *)self domain];
  id v9 = objc_msgSend(v6, "ams_safeStateForFeature:domain:level:", v7, v8, 0);

  uint64_t v10 = [MEMORY[0x1E4F61890] shared];
  uint64_t v11 = [(AMSFeatureFlag *)self feature];
  uint64_t v12 = [(AMSFeatureFlag *)self domain];
  uint64_t v13 = objc_msgSend(v10, "ams_safeStateForFeature:domain:level:", v11, v12, 3);

  -[AMSFeatureFlag setEnabled:](self, "setEnabled:", [v14 value] == 1);
  -[AMSFeatureFlag setDefaultEnabled:](self, "setDefaultEnabled:", [v9 value] == 1);
  -[AMSFeatureFlag _updateUserEnabled:](self, "_updateUserEnabled:", [v13 value] == 1);
}

- (void)_updateDevelopmentPhase
{
  id v13 = (id)[objc_alloc(MEMORY[0x1E4F618A0]) initWithName:@"UnderDevelopment" value:@"true"];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F618A0]) initWithName:@"CodeComplete" value:@"true"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F618A0]) initWithName:@"PreviewReady" value:@"true"];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F618A0]) initWithName:@"FeatureComplete" value:@"true"];
  v6 = [MEMORY[0x1E4F61890] shared];
  id v7 = [(AMSFeatureFlag *)self feature];
  id v8 = [(AMSFeatureFlag *)self domain];
  id v9 = objc_msgSend(v6, "ams_safeStateForFeature:domain:", v7, v8);

  uint64_t v10 = [v9 attributes];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"DevelopmentPhase"];

  if ([v11 matchesAgainst:v13])
  {
    int64_t v12 = 1;
  }
  else if ([v11 matchesAgainst:v3])
  {
    int64_t v12 = 2;
  }
  else if ([v11 matchesAgainst:v4])
  {
    int64_t v12 = 3;
  }
  else if ([v11 matchesAgainst:v5])
  {
    int64_t v12 = 4;
  }
  else
  {
    int64_t v12 = [(AMSFeatureFlag *)self _developmentPhaseFromGroupType:[(AMSFeatureFlag *)self groupType]];
  }
  [(AMSFeatureFlag *)self setDevelopmentPhase:v12];
}

- (int64_t)_developmentPhaseFromGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_18DDF4B80[a3];
  }
}

- (void)_updateUserEnabled:(BOOL)a3
{
  self->_userEnabled = a3;
}

- (int64_t)groupType
{
  BOOL v3 = [(AMSFeatureFlag *)self isTestable];
  if ([(AMSFeatureFlag *)self isDefaultEnabled]) {
    return 2;
  }
  else {
    return !v3;
  }
}

- (void)activateITFEs
{
  if ([(AMSFeatureFlag *)self hasITFEs])
  {
    if ([(AMSFeatureFlag *)self isEnabled])
    {
      [(AMSFeatureFlag *)self _enableITFEs];
    }
    else
    {
      [(AMSFeatureFlag *)self _disableITFEs];
    }
  }
}

- (BOOL)hasITFEs
{
  v2 = [(AMSFeatureFlag *)self itfes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasITFEWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(AMSFeatureFlag *)self itfes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) value];
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_enableITFEs
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(AMSFeatureFlag *)self itfes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) toggle:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_disableITFEs
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(AMSFeatureFlag *)self itfes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) toggle:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)itfesFromString:(id)a3 mutableFeatures:(id)a4 profileFeatures:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  id v7 = a5;
  long long v8 = [a3 componentsSeparatedByString:@","];
  long long v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    unint64_t v13 = 0x1E559B000uLL;
    id v26 = v7;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = [v7 objectForKey:v15];

        uint64_t v17 = [v7 objectForKeyedSubscript:v15];
        if ([v17 BOOLValue])
        {
          uint64_t v18 = 1;
        }
        else
        {
          [v27 objectForKeyedSubscript:v15];
          uint64_t v19 = v11;
          uint64_t v20 = v12;
          v21 = v9;
          v23 = unint64_t v22 = v13;
          uint64_t v18 = [v23 BOOLValue];

          unint64_t v13 = v22;
          long long v9 = v21;
          uint64_t v12 = v20;
          uint64_t v11 = v19;
          id v7 = v26;
        }

        id v24 = (void *)[objc_alloc(*(Class *)(v13 + 4032)) initWithValue:v15 isEnabled:v18 isMutable:v16 == 0];
        [v9 addObject:v24];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  return v9;
}

- (NSString)associatedGroup
{
  return self->_associatedGroup;
}

- (void)setAssociatedGroup:(id)a3
{
}

- (BOOL)isDefaultEnabled
{
  return self->_defaultEnabled;
}

- (void)setDefaultEnabled:(BOOL)a3
{
  self->_defaultEnabled = a3;
}

- (int64_t)developmentPhase
{
  return self->_developmentPhase;
}

- (void)setDevelopmentPhase:(int64_t)a3
{
  self->_developmentPhase = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (NSDictionary)flagData
{
  return self->_flagData;
}

- (void)setFlagData:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)featureDescription
{
  return self->_featureDescription;
}

- (void)setFeatureDescription:(id)a3
{
}

- (NSString)flagGroup
{
  return self->_flagGroup;
}

- (void)setFlagGroup:(id)a3
{
}

- (NSArray)itfes
{
  return self->_itfes;
}

- (void)setItfes:(id)a3
{
}

- (BOOL)isUserEnabled
{
  return self->_userEnabled;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itfes, 0);
  objc_storeStrong((id *)&self->_flagGroup, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_flagData, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_associatedGroup, 0);
}

- (NSString)ITFE
{
  v2 = [(AMSFeatureFlag *)self itfes];
  uint64_t v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_55);
  uint64_t v4 = [v3 componentsJoinedByString:@","];

  return (NSString *)v4;
}

uint64_t __53__AMSFeatureFlag_AppleMediaServices_Deprecated__ITFE__block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (void)setITFE:(id)a3
{
  id v4 = a3;
  id v7 = +[AMSFeatureFlagITFE fetchMutableFeatures];
  uint64_t v5 = +[AMSFeatureFlagITFE fetchProfileFeatures];
  uint64_t v6 = [(AMSFeatureFlag *)self itfesFromString:v4 mutableFeatures:v7 profileFeatures:v5];

  [(AMSFeatureFlag *)self setItfes:v6];
}

+ (id)allFlagGroups
{
  v2 = +[AMSFeatureFlagGroup allFlagGroups];
  uint64_t v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_161_0);

  return v3;
}

AMSPair *__62__AMSFeatureFlag_AppleMediaServices_Deprecated__allFlagGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [AMSPair alloc];
  id v7 = [v4 flags];

  long long v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

+ (id)flagGroupWithName:(id)a3
{
  uint64_t v3 = +[AMSFeatureFlagGroup fetchFlagGroupWithName:a3];
  id v4 = [v3 flags];

  return v4;
}

+ (BOOL)enableFlagGroup:(id)a3 error:(id *)a4
{
  return +[AMSFeatureFlagGroup enableFlagGroupWithName:a3 error:a4];
}

+ (BOOL)disableFlagGroup:(id)a3 error:(id *)a4
{
  return +[AMSFeatureFlagGroup disableFlagGroupWithName:a3 error:a4];
}

- (BOOL)isCodeComplete
{
  return [(AMSFeatureFlag *)self developmentPhase] == 2;
}

- (BOOL)isTestable
{
  uint64_t v3 = [(AMSFeatureFlag *)self flagData];
  id v4 = [v3 objectForKeyedSubscript:@"AMPTestable"];

  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (([v4 BOOLValue] & 1) != 0 || -[AMSFeatureFlag developmentPhase](self, "developmentPhase") == 2);

  return v5;
}

@end