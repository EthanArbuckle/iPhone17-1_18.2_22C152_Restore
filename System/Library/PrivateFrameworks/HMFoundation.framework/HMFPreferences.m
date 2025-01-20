@interface HMFPreferences
+ (Class)preferenceClassForPreferenceKey:(id)a3;
+ (id)classRegistry;
+ (id)defaultValueForPreferenceKey:(id)a3;
+ (id)defaultValues;
+ (id)sharedPreferences;
+ (void)setDefaultValue:(id)a3 forPreferenceKey:(id)a4;
+ (void)setPreferenceClass:(Class)a3 forPreferenceKey:(id)a4;
- (Class)preferenceClassForPreferenceKey:(id)a3;
- (HMFClassRegistry)classRegistry;
- (HMFPreferences)init;
- (NSArray)preferences;
- (NSString)propertyDescription;
- (id)preferenceForKey:(id)a3;
- (void)setPreferenceClass:(Class)a3 forPreferenceKey:(id)a4;
@end

@implementation HMFPreferences

- (id)preferenceForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_preferences objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = objc_alloc([(HMFPreferences *)self preferenceClassForPreferenceKey:v4]);
    v7 = +[HMFPreferences defaultValueForPreferenceKey:v4];
    v5 = (void *)[v6 initWithKey:v4 options:0 defaultValue:v7];

    v8 = (void *)MEMORY[0x19F3A87A0]([(NSMutableDictionary *)self->_preferences setObject:v5 forKeyedSubscript:v4]);
    v9 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier(v9);
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding new preference: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  os_unfair_recursive_lock_unlock();

  return v5;
}

+ (id)sharedPreferences
{
  if (_MergedGlobals_1_1 != -1) {
    dispatch_once(&_MergedGlobals_1_1, &__block_literal_global_29);
  }
  v2 = (void *)qword_1EB4EEE88;
  return v2;
}

- (HMFPreferences)init
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)HMFPreferences;
  v2 = [(HMFPreferences *)&v46 init];
  if (v2)
  {
    v3 = objc_alloc_init(HMFClassRegistry);
    classRegistry = v2->_classRegistry;
    v2->_classRegistry = v3;

    v5 = v2;
    id v6 = [[HMFActivity alloc] initWithName:@"Load Default Preferences" parent:0 options:1];
    v44 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = (void *)MEMORY[0x19F3A87A0]();
    [(HMFActivity *)v6 markWithReason:@"Determining preference location"];
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v9 = [v8 URLForResource:@"Preferences" withExtension:@"plist"];

    v10 = v5;
    v43 = v5;
    if (v9) {
      goto LABEL_4;
    }
    v11 = [@"/" stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/HomeKitDaemon.framework"];
    v12 = [MEMORY[0x1E4F28B50] bundleWithPath:v11];
    v9 = [v12 URLForResource:@"Preferences" withExtension:@"plist"];

    v10 = v43;
    if (v9)
    {
LABEL_4:
      v40 = v7;
      v41 = v6;
      v42 = v2;
      [(HMFActivity *)v6 markWithReason:@"Parsing preferences"];
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v9];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (!v15) {
        goto LABEL_30;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v48;
      while (1)
      {
        uint64_t v18 = 0;
        uint64_t v45 = v16;
        do
        {
          if (*(void *)v48 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v47 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v14;
            v21 = [v14 objectForKeyedSubscript:v19];
            v22 = v10;
            id v23 = v21;
            id v24 = v19;
            id v25 = +[HMFPreferences defaultValueForPreferenceKey:v24];
            if (!v25)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v25 = [v23 objectForKeyedSubscript:@"Value"];
                v26 = [v23 objectForKeyedSubscript:@"Customer"];

                if (v26)
                {
                  uint64_t v27 = [v23 objectForKeyedSubscript:@"Customer"];

                  id v25 = (id)v27;
                }
                v28 = +[HMFSystemInfo systemInfo];
                uint64_t v29 = [v28 productVariant];

                if (v29 == 3)
                {
                  v30 = v23;
                  v31 = @"Internal";
                  goto LABEL_22;
                }
                if (v29 == 1)
                {
                  v30 = v23;
                  v31 = @"Developer";
LABEL_22:
                  v35 = [v30 objectForKeyedSubscript:v31];

                  if (v35)
                  {
                    uint64_t v36 = [v23 objectForKeyedSubscript:v31];

                    id v25 = (id)v36;
                  }
                }
                v10 = v43;
              }
              else
              {
                id v25 = v23;
              }
            }
            v37 = objc_msgSend(objc_alloc(-[HMFPreferences preferenceClassForPreferenceKey:](v22, "preferenceClassForPreferenceKey:", v24)), "initWithKey:options:defaultValue:", v24, 0, v25);

            if (v37) {
              [(NSMutableDictionary *)v44 setObject:v37 forKeyedSubscript:v24];
            }

            id v14 = v20;
            uint64_t v16 = v45;
            goto LABEL_28;
          }
          v32 = (void *)MEMORY[0x19F3A87A0]();
          v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = HMFGetLogIdentifier(0);
            *(_DWORD *)buf = 138543618;
            v52 = v34;
            __int16 v53 = 2112;
            v54 = v19;
            _os_log_impl(&dword_19D57B000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid preference key representation: %@", buf, 0x16u);
          }
LABEL_28:
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (!v16)
        {
LABEL_30:

          id v6 = v41;
          v2 = v42;
          v7 = v40;
          break;
        }
      }
    }
    [(HMFActivity *)v6 invalidate];

    preferences = v10->_preferences;
    v10->_preferences = v44;
  }
  return v2;
}

+ (id)defaultValueForPreferenceKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 defaultValues];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

+ (Class)preferenceClassForPreferenceKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 classRegistry];
  id v6 = [v5 classForKey:v4];

  return (Class)v6;
}

- (Class)preferenceClassForPreferenceKey:(id)a3
{
  id v4 = a3;
  v5 = [(HMFPreferences *)self classRegistry];
  id v6 = (void *)[v5 classForKey:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(id)objc_opt_class() preferenceClassForPreferenceKey:v4];
  }
  v8 = v7;

  return (Class)v8;
}

- (HMFClassRegistry)classRegistry
{
  return (HMFClassRegistry *)objc_getProperty(self, a2, 24, 1);
}

+ (id)defaultValues
{
  if (qword_1EB4EEEA0 != -1) {
    dispatch_once(&qword_1EB4EEEA0, &__block_literal_global_7);
  }
  v2 = (void *)qword_1EB4EEEA8;
  return v2;
}

+ (id)classRegistry
{
  if (qword_1EB4EEE90 != -1) {
    dispatch_once(&qword_1EB4EEE90, &__block_literal_global_3_0);
  }
  v2 = (void *)qword_1EB4EEE98;
  return v2;
}

uint64_t __31__HMFPreferences_defaultValues__block_invoke()
{
  qword_1EB4EEEA8 = objc_alloc_init(HMFMutableThreadSafeDictionary);
  return MEMORY[0x1F41817F8]();
}

uint64_t __35__HMFPreferences_sharedPreferences__block_invoke()
{
  qword_1EB4EEE88 = objc_alloc_init(HMFPreferences);
  return MEMORY[0x1F41817F8]();
}

uint64_t __31__HMFPreferences_classRegistry__block_invoke()
{
  qword_1EB4EEE98 = [[HMFClassRegistry alloc] initWithDefaultClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

+ (void)setPreferenceClass:(Class)a3 forPreferenceKey:(id)a4
{
  id v6 = a4;
  id v7 = [a1 classRegistry];
  [v7 setClass:a3 forKey:v6];
}

+ (void)setDefaultValue:(id)a3 forPreferenceKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 defaultValues];
  v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (NSString)propertyDescription
{
  v2 = NSString;
  v3 = [(HMFPreferences *)self preferences];
  id v4 = [v2 stringWithFormat:@", Preferences = \n%@", v3];

  return (NSString *)v4;
}

- (void)setPreferenceClass:(Class)a3 forPreferenceKey:(id)a4
{
  id v6 = a4;
  id v7 = [(HMFPreferences *)self classRegistry];
  [v7 setClass:a3 forKey:v6];
}

- (NSArray)preferences
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = [(NSMutableDictionary *)self->_preferences allValues];
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classRegistry, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end