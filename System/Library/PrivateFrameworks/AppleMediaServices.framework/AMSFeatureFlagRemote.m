@interface AMSFeatureFlagRemote
+ (id)fetchRemoteFlagState;
- (BOOL)isRemote;
- (id)_preferencesKey;
- (int64_t)_developmentPhase;
- (void)_activateFlag;
- (void)_updateDevelopmentPhase;
- (void)_updateInternalEnabledState;
@end

@implementation AMSFeatureFlagRemote

- (BOOL)isRemote
{
  return 1;
}

- (void)_updateInternalEnabledState
{
  [(AMSFeatureFlag *)self setDefaultEnabled:[(AMSFeatureFlagRemote *)self _developmentPhase] == 4];
  id v9 = +[AMSFeatureFlagRemote fetchRemoteFlagState];
  v3 = [(AMSFeatureFlagRemote *)self _preferencesKey];
  v4 = [v9 objectForKeyedSubscript:v3];
  char v5 = [v4 BOOLValue];

  v6 = [(AMSFeatureFlagRemote *)self _preferencesKey];
  v7 = [v9 objectForKeyedSubscript:v6];

  if (v5)
  {
    BOOL v8 = 1;
  }
  else if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [(AMSFeatureFlag *)self isDefaultEnabled];
  }
  [(AMSFeatureFlag *)self setEnabled:v8];
  [(AMSFeatureFlag *)self _updateUserEnabled:[(AMSFeatureFlag *)self isEnabled]];
}

- (void)_updateDevelopmentPhase
{
  int64_t v3 = [(AMSFeatureFlagRemote *)self _developmentPhase];
  [(AMSFeatureFlag *)self setDevelopmentPhase:v3];
}

- (void)_activateFlag
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v3 = AMSSetLogKeyIfNeeded();
  v4 = +[AMSFeatureFlagRemote fetchRemoteFlagState];
  BOOL v5 = [(AMSFeatureFlag *)self isUserEnabled];
  v6 = [(AMSFeatureFlagRemote *)self _preferencesKey];
  if (v5)
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v6];

    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    BOOL v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      v10 = [(AMSFeatureFlag *)self feature];
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v3;
      __int16 v17 = 2114;
      v18 = v10;
      v11 = "%{public}@: [%{public}@] Remote Feature Flag enabled: %{public}@";
LABEL_10:
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v6];

    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    BOOL v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      v10 = [(AMSFeatureFlag *)self feature];
      int v13 = 138543874;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      v16 = v3;
      __int16 v17 = 2114;
      v18 = v10;
      v11 = "%{public}@: [%{public}@] Remote Feature Flag disabled: %{public}@";
      goto LABEL_10;
    }
  }

  CFPreferencesSetAppValue(@"remoteFlagState", v4, @"com.apple.storeservices.itfe");
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
}

- (int64_t)_developmentPhase
{
  int64_t v3 = [(AMSFeatureFlag *)self flagData];
  v4 = [v3 objectForKeyedSubscript:@"DevelopmentPhase"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  if (([v4 isEqualToString:@"UnderDevelopment"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"CodeComplete"])
    {
      int64_t v5 = 2;
      goto LABEL_11;
    }
    if ([v4 isEqualToString:@"PreviewReady"])
    {
      int64_t v5 = 3;
      goto LABEL_11;
    }
    if ([v4 isEqualToString:@"FeatureComplete"])
    {
      int64_t v5 = 4;
      goto LABEL_11;
    }
LABEL_10:
    int64_t v5 = [(AMSFeatureFlag *)self _developmentPhaseFromGroupType:[(AMSFeatureFlag *)self groupType]];
    goto LABEL_11;
  }
  int64_t v5 = 1;
LABEL_11:

  return v5;
}

- (id)_preferencesKey
{
  int64_t v3 = [(AMSFeatureFlagRemote *)self _developmentPhase];
  v4 = NSString;
  int64_t v5 = [(AMSFeatureFlag *)self domain];
  v6 = [(AMSFeatureFlag *)self flagGroup];
  v7 = [(AMSFeatureFlag *)self feature];
  BOOL v8 = [v4 stringWithFormat:@"%@-%@-%@-%ld", v5, v6, v7, v3];

  return v8;
}

+ (id)fetchRemoteFlagState
{
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  v2 = (void *)CFPreferencesCopyAppValue(@"remoteFlagState", @"com.apple.storeservices.itfe");
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = objc_opt_new();

    v2 = (void *)v3;
  }
  v4 = (void *)[v2 mutableCopy];

  return v4;
}

@end