@interface HKFeatureOnboardingRecordInaccessibilityCache
- (HKFeatureOnboardingRecordInaccessibilityCache)initWithCachingDefaults:(id)a3;
- (id)_cachedOnboardingRecordForFeatureIdentifier:(id)a3;
- (id)fallbackOnboardingRecordForError:(id)a3 featureIdentifier:(id)a4;
- (void)updateForRetrievedOnboardingRecord:(id)a3 featureIdentifier:(id)a4;
@end

@implementation HKFeatureOnboardingRecordInaccessibilityCache

- (HKFeatureOnboardingRecordInaccessibilityCache)initWithCachingDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureOnboardingRecordInaccessibilityCache;
  v6 = [(HKFeatureOnboardingRecordInaccessibilityCache *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cachingDefaults, a3);
  }

  return v7;
}

- (id)fallbackOnboardingRecordForError:(id)a3 featureIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && objc_msgSend(v6, "hk_isDatabaseAccessibilityError"))
  {
    v8 = [(HKFeatureOnboardingRecordInaccessibilityCache *)self _cachedOnboardingRecordForFeatureIdentifier:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_cachedOnboardingRecordForFeatureIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  cachingDefaults = self->_cachingDefaults;
  id v6 = [NSString stringWithFormat:@"%@_OnboardingRecord", v4];
  id v7 = [(NSUserDefaults *)cachingDefaults dataForKey:v6];

  if (v7)
  {
    id v15 = 0;
    v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v15];
    id v9 = v15;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      _HKInitializeLogging();
      v11 = HKLogInfrastructure();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v17 = v13;
        __int16 v18 = 2114;
        id v19 = v4;
        __int16 v20 = 2114;
        id v21 = v9;
        id v14 = v13;
        _os_log_error_impl(&dword_19C023000, v11, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to unarchive cached onboarding record for %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateForRetrievedOnboardingRecord:(id)a3 featureIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v13 = 0;
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v13];
  id v8 = v13;
  if (v7)
  {
    cachingDefaults = self->_cachingDefaults;
    id v10 = [NSString stringWithFormat:@"%@_OnboardingRecord", v6];
    [(NSUserDefaults *)cachingDefaults setObject:v7 forKey:v10];
  }
  else
  {
    _HKInitializeLogging();
    id v10 = HKLogInfrastructure();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = v8;
      id v12 = v11;
      _os_log_error_impl(&dword_19C023000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Unable to archive onboarding record for %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

- (void).cxx_destruct
{
}

@end