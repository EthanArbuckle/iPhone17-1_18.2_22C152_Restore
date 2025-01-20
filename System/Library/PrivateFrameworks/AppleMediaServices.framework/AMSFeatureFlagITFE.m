@interface AMSFeatureFlagITFE
+ (BOOL)_isITFEValueCustom:(id)a3;
+ (id)_concreteITFEs;
+ (id)_customITFEs;
+ (id)_flagGroupITFEs;
+ (id)_mutableITFEs;
+ (id)_profileITFEs;
+ (id)_remoteGroupITFEs;
+ (id)fetchCustomFeatures;
+ (id)fetchMutableFeatures;
+ (id)fetchProfileFeatures;
+ (void)removeOrphanITFEValues:(id)a3;
+ (void)resetFeatures;
+ (void)setMutableFeatureName:(id)a3 toValue:(id)a4;
+ (void)verifyOrphans;
- (AMSFeatureFlagITFE)initWithValue:(id)a3 isEnabled:(BOOL)a4 isMutable:(BOOL)a5;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadonly;
- (NSString)value;
- (unint64_t)hash;
- (void)setEnabled:(BOOL)a3;
- (void)setReadonly:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)toggle:(BOOL)a3;
@end

@implementation AMSFeatureFlagITFE

- (AMSFeatureFlagITFE)initWithValue:(id)a3 isEnabled:(BOOL)a4 isMutable:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSFeatureFlagITFE;
  v9 = [(AMSFeatureFlagITFE *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(AMSFeatureFlagITFE *)v9 setValue:v8];
    [(AMSFeatureFlagITFE *)v10 setEnabled:v6];
    [(AMSFeatureFlagITFE *)v10 setReadonly:!v5];
  }

  return v10;
}

- (void)toggle:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(AMSFeatureFlagITFE *)self value];
  BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [(id)objc_opt_class() setMutableFeatureName:v6 toValue:v5];
  [(AMSFeatureFlagITFE *)self setEnabled:v3];
}

+ (id)fetchProfileFeatures
{
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  v2 = (void *)CFPreferencesCopyAppValue(@"additionalFeatures", @"com.apple.storeservices.itfe");
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  return v2;
}

+ (id)fetchMutableFeatures
{
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  v2 = (void *)CFPreferencesCopyAppValue(@"features", @"com.apple.storeservices.itfe");
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  v4 = (void *)[v2 mutableCopy];

  return v4;
}

+ (id)fetchCustomFeatures
{
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"customFeatures", @"com.apple.storeservices.itfe");
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = [a1 _customITFEs];
    objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_57);
    BOOL v5 = (const void *)objc_claimAutoreleasedReturnValue();

    CFPreferencesSetAppValue(@"customFeatures", v5, @"com.apple.storeservices.itfe");
    CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
    uint64_t v3 = (void *)v5;
  }
  id v6 = (void *)[v3 mutableCopy];

  return v6;
}

uint64_t __41__AMSFeatureFlagITFE_fetchCustomFeatures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

+ (void)setMutableFeatureName:(id)a3 toValue:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v9 = [v6 stringByTrimmingCharactersInSet:v8];
  v10 = [v9 lowercaseString];

  v11 = [a1 fetchProfileFeatures];
  if (![(__CFString *)v10 length]) {
    goto LABEL_22;
  }
  objc_super v12 = [v11 objectForKey:v10];

  if (v12) {
    goto LABEL_22;
  }
  v13 = [a1 fetchMutableFeatures];
  v14 = AMSSetLogKeyIfNeeded();
  if (v7)
  {
    [v13 setObject:v7 forKeyedSubscript:v10];
    v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v17 = objc_opt_class();
    int v18 = [v7 BOOLValue];
    v19 = @"Disabled";
    int v25 = 138544130;
    uint64_t v26 = v17;
    __int16 v27 = 2114;
    if (v18) {
      v19 = @"Enabled";
    }
    v28 = v14;
    __int16 v29 = 2114;
    v30 = v19;
    __int16 v31 = 2114;
    v32 = v10;
    v20 = "%{public}@: [%{public}@] ITFE %{public}@: %{public}@";
    v21 = v16;
    uint32_t v22 = 42;
  }
  else
  {
    [v13 removeObjectForKey:v10];
    v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v25 = 138543874;
    uint64_t v26 = objc_opt_class();
    __int16 v27 = 2114;
    v28 = v14;
    __int16 v29 = 2114;
    v30 = v10;
    v20 = "%{public}@: [%{public}@] ITFE Removed: %{public}@";
    v21 = v16;
    uint32_t v22 = 32;
  }
  _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
LABEL_15:

  if ([a1 _isITFEValueCustom:v6])
  {
    v23 = [a1 fetchCustomFeatures];
    v24 = v23;
    if (v7)
    {
      if (([v23 containsObject:v6] & 1) == 0) {
        [v24 addObject:v6];
      }
    }
    else
    {
      [v23 removeObject:v6];
    }
    CFPreferencesSetAppValue(@"customFeatures", v24, @"com.apple.storeservices.itfe");
  }
  CFPreferencesSetAppValue(@"features", v13, @"com.apple.storeservices.itfe");
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");

LABEL_22:
}

+ (void)resetFeatures
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = CFPreferencesCopyKeyList(@"com.apple.storeservices.itfe", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFArrayRef v3 = v2;
  uint64_t v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v8 + 1) + 8 * v7++), 0, @"com.apple.storeservices.itfe");
      }
      while (v5 != v7);
      uint64_t v5 = [(__CFArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
}

+ (void)verifyOrphans
{
  CFArrayRef v3 = [a1 fetchCustomFeatures];
  uint64_t v4 = [a1 _mutableITFEs];
  uint64_t v5 = [a1 _remoteGroupITFEs];
  uint64_t v6 = [a1 _flagGroupITFEs];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__AMSFeatureFlagITFE_verifyOrphans__block_invoke;
  v12[3] = &unk_1E55A2B60;
  id v13 = v5;
  id v14 = v6;
  id v15 = v3;
  id v7 = v3;
  id v8 = v6;
  id v9 = v5;
  long long v10 = objc_msgSend(v4, "ams_filterUsingTest:", v12);
  long long v11 = [v10 valueForKeyPath:@"value"];

  [a1 removeOrphanITFEValues:v11];
}

uint64_t __35__AMSFeatureFlagITFE_verifyOrphans__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || ([*(id *)(a1 + 40) containsObject:v3] & 1) != 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 48);
    uint64_t v6 = [v3 value];
    uint64_t v4 = [v5 containsObject:v6] ^ 1;
  }
  return v4;
}

+ (void)removeOrphanITFEValues:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [a1 fetchMutableFeatures];
    uint64_t v6 = objc_msgSend(v5, "ams_dictionaryRemovingKeys:", v4);

    uint64_t v17 = v6;
    CFPreferencesSetAppValue(@"features", v6, @"com.apple.storeservices.itfe");
    CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
    id v7 = AMSSetLogKeyIfNeeded();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v14 = +[AMSLogConfig sharedConfig];
          if (!v14)
          {
            id v14 = +[AMSLogConfig sharedConfig];
          }
          id v15 = [v14 OSLogObject];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            uint64_t v23 = v16;
            __int16 v24 = 2114;
            int v25 = v7;
            __int16 v26 = 2114;
            uint64_t v27 = v13;
            _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ITFE orphan removed: %{public}@", buf, 0x20u);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v10);
    }
  }
}

+ (id)_flagGroupITFEs
{
  CFArrayRef v2 = +[AMSFeatureFlagGroup allFlagGroups];
  id v3 = [v2 allValues];

  id v4 = objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_55_0);
  uint64_t v5 = [v4 valueForKeyPath:@"@unionOfArrays.self"];

  return v5;
}

id __37__AMSFeatureFlagITFE__flagGroupITFEs__block_invoke(uint64_t a1, void *a2)
{
  CFArrayRef v2 = [a2 flags];
  id v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_58);
  id v4 = [v3 valueForKeyPath:@"@unionOfArrays.self"];

  return v4;
}

uint64_t __37__AMSFeatureFlagITFE__flagGroupITFEs__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 itfes];
}

+ (id)_remoteGroupITFEs
{
  CFArrayRef v2 = +[AMSFeatureFlagTask cachedRemoteGroups];
  id v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_64);
  id v4 = [v3 valueForKeyPath:@"@unionOfArrays.self"];

  return v4;
}

id __39__AMSFeatureFlagITFE__remoteGroupITFEs__block_invoke(uint64_t a1, void *a2)
{
  CFArrayRef v2 = [a2 flags];
  id v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_66);
  id v4 = [v3 valueForKeyPath:@"@unionOfArrays.self"];

  return v4;
}

uint64_t __39__AMSFeatureFlagITFE__remoteGroupITFEs__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 itfes];
}

+ (id)_mutableITFEs
{
  CFArrayRef v2 = +[AMSFeatureFlagITFE fetchMutableFeatures];
  id v3 = objc_msgSend(v2, "ams_arrayUsingTransform:", &__block_literal_global_70_1);

  return v3;
}

AMSFeatureFlagITFE *__35__AMSFeatureFlagITFE__mutableITFEs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [AMSFeatureFlagITFE alloc];
  uint64_t v7 = [v4 BOOLValue];

  id v8 = [(AMSFeatureFlagITFE *)v6 initWithValue:v5 isEnabled:v7 isMutable:0];
  return v8;
}

+ (id)_profileITFEs
{
  CFArrayRef v2 = +[AMSFeatureFlagITFE fetchProfileFeatures];
  id v3 = objc_msgSend(v2, "ams_arrayUsingTransform:", &__block_literal_global_72_0);

  return v3;
}

AMSFeatureFlagITFE *__35__AMSFeatureFlagITFE__profileITFEs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [AMSFeatureFlagITFE alloc];
  uint64_t v7 = [v4 BOOLValue];

  id v8 = [(AMSFeatureFlagITFE *)v6 initWithValue:v5 isEnabled:v7 isMutable:0];
  return v8;
}

+ (id)_customITFEs
{
  id v3 = [a1 _mutableITFEs];
  id v4 = [a1 _remoteGroupITFEs];
  id v5 = [a1 _flagGroupITFEs];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__AMSFeatureFlagITFE__customITFEs__block_invoke;
  v10[3] = &unk_1E55A2BC8;
  id v11 = v4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v4;
  id v8 = objc_msgSend(v3, "ams_filterUsingTest:", v10);

  return v8;
}

uint64_t __34__AMSFeatureFlagITFE__customITFEs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 40) containsObject:v3] ^ 1;
  }

  return v4;
}

+ (id)_concreteITFEs
{
  id v3 = [a1 _mutableITFEs];
  uint64_t v4 = [a1 _remoteGroupITFEs];
  id v5 = [a1 _flagGroupITFEs];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  [v6 addObjectsFromArray:v3];
  [v6 addObjectsFromArray:v4];
  [v6 addObjectsFromArray:v5];

  return v6;
}

+ (BOOL)_isITFEValueCustom:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _concreteITFEs];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke;
  v16[3] = &unk_1E55A2BF0;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_msgSend(v5, "ams_firstObjectPassingTest:", v16);

  id v8 = [a1 _customITFEs];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke_2;
  v14[3] = &unk_1E55A2BF0;
  id v15 = v6;
  id v9 = v6;
  uint64_t v10 = objc_msgSend(v8, "ams_firstObjectPassingTest:", v14);

  if (v7) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = !v11;

  return v12;
}

uint64_t __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __41__AMSFeatureFlagITFE__isITFEValueCustom___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (unint64_t)hash
{
  CFArrayRef v2 = [(AMSFeatureFlagITFE *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AMSFeatureFlagITFE *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(AMSFeatureFlagITFE *)self value];
      id v6 = [(AMSFeatureFlagITFE *)v4 value];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (void).cxx_destruct
{
}

@end