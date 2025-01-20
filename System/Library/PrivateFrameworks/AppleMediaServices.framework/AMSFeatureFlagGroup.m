@interface AMSFeatureFlagGroup
+ (BOOL)disableFlagGroupWithName:(id)a3 error:(id *)a4;
+ (BOOL)enableFlagGroupWithName:(id)a3 error:(id *)a4;
+ (BOOL)setFlagGroupWithName:(id)a3 enabled:(BOOL)a4 error:(id *)a5;
+ (id)_normalizedFlagGroupsFromFlagGroups:(id)a3;
+ (id)allFlagGroups;
+ (id)allFlagGroupsIncludingHidden:(BOOL)a3;
+ (id)allFlagGroupsIncludingHidden:(BOOL)a3 searchDirectory:(id)a4;
+ (id)fetchFlagGroupWithName:(id)a3;
+ (id)flagGroupWithName:(id)a3 includingHidden:(BOOL)a4;
+ (id)groupsFromDomainData:(id)a3 domain:(id)a4;
+ (id)groupsFromDomainData:(id)a3 domain:(id)a4 mutableFeatures:(id)a5 profileFeatures:(id)a6 includesHidden:(BOOL)a7;
+ (void)resetAllFlagGroups;
- (AMSFeatureFlagGroup)initWithName:(id)a3;
- (BOOL)isDevelopmentPhaseEnabled:(int64_t)a3;
- (BOOL)isGroupTypeEnabled:(int64_t)a3;
- (NSMutableArray)mutableFlags;
- (NSString)name;
- (id)_completedFlags;
- (id)_developmentFlags;
- (id)_groupKeyForDevelopmentPhase:(int64_t)a3;
- (id)_groupKeyForType:(int64_t)a3;
- (id)_testableFlags;
- (id)activateFlagsIfNeededForDevelopmentPhase:(int64_t)a3;
- (id)activateFlagsIfNeededForType:(int64_t)a3;
- (id)allITFEs;
- (id)fetchAllGroupKeys;
- (id)flagsForDevelopmentPhase:(int64_t)a3;
- (id)flagsForType:(int64_t)a3;
- (void)activateITFEs;
- (void)appendFlag:(id)a3;
- (void)reset;
- (void)setFlagsForDevelopmentPhase:(int64_t)a3 enabled:(BOOL)a4;
- (void)setGroupType:(int64_t)a3 enabled:(BOOL)a4;
- (void)setMutableFlags:(id)a3;
- (void)setName:(id)a3;
@end

@implementation AMSFeatureFlagGroup

- (AMSFeatureFlagGroup)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSFeatureFlagGroup;
  v5 = [(AMSFeatureFlagGroup *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AMSFeatureFlagGroup *)v5 setName:v4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(AMSFeatureFlagGroup *)v6 setMutableFlags:v7];
  }
  return v6;
}

- (void)appendFlag:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSFeatureFlagGroup *)self mutableFlags];
  [v5 addObject:v4];
}

- (void)reset
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(AMSFeatureFlagGroup *)self flags];
  id v5 = [v4 valueForKey:@"domain"];
  v6 = [v3 setWithArray:v5];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        v13 = [MEMORY[0x1E4F61890] shared];
        [v13 resetDomain:v12 error:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  v14 = [MEMORY[0x1E4F61890] shared];
  [v14 commitUpdates:0];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = [(AMSFeatureFlagGroup *)self flags];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v19++) _updateInternalEnabledState];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (id)fetchAllGroupKeys
{
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  v2 = (void *)CFPreferencesCopyAppValue(@"groupsEnabled", @"com.apple.storeservices.itfe");
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  return v2;
}

- (void)activateITFEs
{
  id v2 = [(AMSFeatureFlagGroup *)self flags];
  [v2 makeObjectsPerformSelector:sel_activateITFEs];
}

+ (id)allFlagGroups
{
  return (id)[a1 allFlagGroupsIncludingHidden:0];
}

- (id)allITFEs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(AMSFeatureFlagGroup *)self flags];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) itfes];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)allFlagGroupsIncludingHidden:(BOOL)a3
{
  return (id)[a1 allFlagGroupsIncludingHidden:0 searchDirectory:@"/System/Library/FeatureFlags/Domain"];
}

+ (id)allFlagGroupsIncludingHidden:(BOOL)a3 searchDirectory:(id)a4
{
  BOOL v33 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a4;
  uint64_t v5 = @"/System/Library/FeatureFlags/Domain";
  uint64_t v30 = v4;
  if (v4) {
    uint64_t v5 = v4;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v37 = v6;
  uint64_t v8 = [v7 contentsOfDirectoryAtPath:v6 error:0];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v35 = +[AMSFeatureFlagITFE fetchMutableFeatures];
  v34 = +[AMSFeatureFlagITFE fetchProfileFeatures];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  uint64_t v38 = v10;
  if (v10)
  {
    uint64_t v32 = *(void *)v47;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v46 + 1) + 8 * v11);
        context = (void *)MEMORY[0x192FA47D0](v10);
        uint64_t v13 = objc_msgSend(v12, "stringByDeletingPathExtension", v30);
        long long v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = [(__CFString *)v37 stringByAppendingPathComponent:v12];
        uint64_t v16 = [v14 dictionaryWithContentsOfFile:v15];

        v39 = (void *)v16;
        v40 = (void *)v13;
        uint64_t v17 = [a1 groupsFromDomainData:v16 domain:v13 mutableFeatures:v35 profileFeatures:v34 includesHidden:v33];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v43 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              long long v23 = [v17 objectForKeyedSubscript:v22];
              long long v24 = [v9 objectForKeyedSubscript:v22];
              long long v25 = v24;
              if (v24)
              {
                long long v26 = [v24 mutableFlags];
                long long v27 = [v23 mutableFlags];
                [v26 addObjectsFromArray:v27];
              }
              else
              {
                [v9 setObject:v23 forKeyedSubscript:v22];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v19);
        }

        ++v11;
      }
      while (v11 != v38);
      uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      uint64_t v38 = v10;
    }
    while (v10);
  }

  v28 = [a1 _normalizedFlagGroupsFromFlagGroups:v9];

  return v28;
}

+ (id)groupsFromDomainData:(id)a3 domain:(id)a4 mutableFeatures:(id)a5 profileFeatures:(id)a6 includesHidden:(BOOL)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    unint64_t v15 = 0x1E4F1C000uLL;
    uint64_t v30 = *(void *)v37;
    uint64_t v16 = @"AMPFlagGroup";
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v19 = [v11 objectForKeyedSubscript:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [v19 objectForKeyedSubscript:v16];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v34 isEqualToString:@"AMPFlagRemote"];
            long long v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFlagData:v19 mutableFeatures:v33 profileFeatures:v32 feature:v18 domain:v34];
            uint64_t v22 = v21;
            if (a7 || ([v21 isHidden] & 1) == 0)
            {
              unint64_t v23 = v15;
              long long v24 = v16;
              long long v25 = [v35 objectForKeyedSubscript:v20];
              long long v26 = v25;
              if (v25) {
                long long v27 = v25;
              }
              else {
                long long v27 = [[AMSFeatureFlagGroup alloc] initWithName:v20];
              }
              v28 = v27;

              [(AMSFeatureFlagGroup *)v28 appendFlag:v22];
              [v35 setObject:v28 forKeyedSubscript:v20];

              uint64_t v16 = v24;
              unint64_t v15 = v23;
              uint64_t v14 = v30;
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);
  }

  return v35;
}

+ (id)groupsFromDomainData:(id)a3 domain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[AMSFeatureFlagITFE fetchMutableFeatures];
  id v9 = +[AMSFeatureFlagITFE fetchProfileFeatures];
  id v10 = +[AMSFeatureFlagGroup groupsFromDomainData:v7 domain:v6 mutableFeatures:v8 profileFeatures:v9 includesHidden:1];

  id v11 = [a1 _normalizedFlagGroupsFromFlagGroups:v10];

  return v11;
}

+ (id)fetchFlagGroupWithName:(id)a3
{
  return (id)[a1 flagGroupWithName:a3 includingHidden:0];
}

+ (id)flagGroupWithName:(id)a3 includingHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 allFlagGroupsIncludingHidden:v4];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (id)flagsForDevelopmentPhase:(int64_t)a3
{
  BOOL v4 = [(AMSFeatureFlagGroup *)self flags];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AMSFeatureFlagGroup_flagsForDevelopmentPhase___block_invoke;
  v7[3] = &__block_descriptor_40_e24_B16__0__AMSFeatureFlag_8l;
  v7[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "ams_filterUsingTest:", v7);

  return v5;
}

BOOL __48__AMSFeatureFlagGroup_flagsForDevelopmentPhase___block_invoke(uint64_t a1, void *a2)
{
  return [a2 developmentPhase] == *(void *)(a1 + 32);
}

+ (BOOL)enableFlagGroupWithName:(id)a3 error:(id *)a4
{
  return [a1 setFlagGroupWithName:a3 enabled:1 error:a4];
}

+ (BOOL)disableFlagGroupWithName:(id)a3 error:(id *)a4
{
  return [a1 setFlagGroupWithName:a3 enabled:0 error:a4];
}

+ (BOOL)setFlagGroupWithName:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(a1, "flagGroupWithName:includingHidden:", a3, 1, a5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v6, "flags", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v11++) setUserEnabled:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return 1;
}

+ (void)resetAllFlagGroups
{
  id v2 = [a1 allFlagGroups];
  id v3 = [v2 allValues];

  [v3 makeObjectsPerformSelector:sel_reset];
}

+ (id)_normalizedFlagGroupsFromFlagGroups:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v40 = (id)[v3 mutableCopy];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EDCA7308];
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        long long v13 = v12;
        if (v12) {
          id v14 = v12;
        }
        else {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        long long v15 = v14;

        [v15 addObject:v10];
        [v4 setObject:v15 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v7);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v46;
    uint64_t v35 = *(void *)v46;
    id v36 = v16;
    do
    {
      uint64_t v20 = 0;
      uint64_t v37 = v18;
      do
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * v20);
        uint64_t v22 = objc_msgSend(v16, "objectForKeyedSubscript:", v21, v35, v36);
        unint64_t v23 = [v22 count];

        if (v23 >= 2)
        {
          uint64_t v39 = v20;
          long long v24 = [[AMSFeatureFlagGroup alloc] initWithName:v21];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v38 = v21;
          long long v25 = [v16 objectForKeyedSubscript:v21];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v42 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * j);
                v31 = [v5 objectForKeyedSubscript:v30];
                id v32 = [(AMSFeatureFlagGroup *)v24 mutableFlags];
                id v33 = [v31 mutableFlags];
                [v32 addObjectsFromArray:v33];

                [v40 removeObjectForKey:v30];
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
            }
            while (v27);
          }

          [v40 setObject:v24 forKeyedSubscript:v38];
          uint64_t v19 = v35;
          id v16 = v36;
          uint64_t v18 = v37;
          uint64_t v20 = v39;
        }
        ++v20;
      }
      while (v20 != v18);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v18);
  }

  return v40;
}

- (id)activateFlagsIfNeededForDevelopmentPhase:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (-[AMSFeatureFlagGroup isDevelopmentPhaseEnabled:](self, "isDevelopmentPhaseEnabled:"))
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSSetLogKeyIfNeeded();
      uint64_t v9 = [(AMSFeatureFlagGroup *)self name];
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      long long v25 = v8;
      __int16 v26 = 2114;
      uint64_t v27 = v9;
      __int16 v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Feature Flag Group automatically toggling flags for %{public}@ of type: %{public}@", buf, 0x2Au);
    }
    uint64_t v11 = [(AMSFeatureFlagGroup *)self flagsForDevelopmentPhase:a3];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) setUserEnabled:1];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (void)setFlagsForDevelopmentPhase:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(AMSFeatureFlagGroup *)self fetchAllGroupKeys];
  value = (void *)[v7 mutableCopy];

  uint64_t v8 = [(AMSFeatureFlagGroup *)self _groupKeyForDevelopmentPhase:a3];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [value setObject:v9 forKeyedSubscript:v8];

  CFPreferencesSetAppValue(@"groupsEnabled", value, @"com.apple.storeservices.itfe");
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
}

- (BOOL)isDevelopmentPhaseEnabled:(int64_t)a3
{
  id v5 = [(AMSFeatureFlagGroup *)self fetchAllGroupKeys];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(AMSFeatureFlagGroup *)self _groupKeyForDevelopmentPhase:a3];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  LOBYTE(v5) = [v8 BOOLValue];

  return (char)v5;
}

- (id)_groupKeyForDevelopmentPhase:(int64_t)a3
{
  BOOL v4 = NSString;
  id v5 = [(AMSFeatureFlagGroup *)self name];
  uint64_t v6 = [v4 stringWithFormat:@"%@-%ld", v5, a3];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)mutableFlags
{
  return self->_mutableFlags;
}

- (void)setMutableFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFlags, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setGroupType:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(AMSFeatureFlagGroup *)self fetchAllGroupKeys];
  value = (void *)[v7 mutableCopy];

  uint64_t v8 = [(AMSFeatureFlagGroup *)self _groupKeyForType:a3];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [value setObject:v9 forKeyedSubscript:v8];

  CFPreferencesSetAppValue(@"groupsEnabled", value, @"com.apple.storeservices.itfe");
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
}

- (BOOL)isGroupTypeEnabled:(int64_t)a3
{
  id v5 = [(AMSFeatureFlagGroup *)self fetchAllGroupKeys];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(AMSFeatureFlagGroup *)self _groupKeyForType:a3];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  LOBYTE(v5) = [v8 BOOLValue];

  return (char)v5;
}

- (id)_groupKeyForType:(int64_t)a3
{
  BOOL v4 = NSString;
  id v5 = [(AMSFeatureFlagGroup *)self name];
  uint64_t v6 = [v4 stringWithFormat:@"%@-%ld", v5, a3];

  return v6;
}

- (id)activateFlagsIfNeededForType:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (-[AMSFeatureFlagGroup isGroupTypeEnabled:](self, "isGroupTypeEnabled:"))
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSSetLogKeyIfNeeded();
      uint64_t v9 = [(AMSFeatureFlagGroup *)self name];
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      long long v25 = v8;
      __int16 v26 = 2114;
      uint64_t v27 = v9;
      __int16 v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Feature Flag Group automatically toggling flags for %{public}@ of type: %{public}@", buf, 0x2Au);
    }
    uint64_t v11 = [(AMSFeatureFlagGroup *)self flagsForType:a3];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) setUserEnabled:1];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)flagsForType:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(AMSFeatureFlagGroup *)self _completedFlags];
  }
  else if (a3 == 1)
  {
    id v3 = [(AMSFeatureFlagGroup *)self _developmentFlags];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(AMSFeatureFlagGroup *)self _testableFlags];
  }
  return v3;
}

- (id)_testableFlags
{
  id v2 = [(AMSFeatureFlagGroup *)self flags];
  id v3 = objc_msgSend(v2, "ams_filterUsingTest:", &__block_literal_global_56);

  return v3;
}

BOOL __68__AMSFeatureFlagGroup_AppleMediaServices_Deprecated___testableFlags__block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupType] == 0;
}

- (id)_developmentFlags
{
  id v2 = [(AMSFeatureFlagGroup *)self flags];
  id v3 = objc_msgSend(v2, "ams_filterUsingTest:", &__block_literal_global_119);

  return v3;
}

BOOL __71__AMSFeatureFlagGroup_AppleMediaServices_Deprecated___developmentFlags__block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupType] == 1;
}

- (id)_completedFlags
{
  id v2 = [(AMSFeatureFlagGroup *)self flags];
  id v3 = objc_msgSend(v2, "ams_filterUsingTest:", &__block_literal_global_121);

  return v3;
}

BOOL __69__AMSFeatureFlagGroup_AppleMediaServices_Deprecated___completedFlags__block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupType] == 2;
}

@end