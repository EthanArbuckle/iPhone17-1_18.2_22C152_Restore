@interface HDKeyValueDomain(HKHeartRhythm)
+ (id)hdhr_aFibBurdenProtectedLocalDomainForProfile:()HKHeartRhythm;
+ (id)hdhr_aFibBurdenProtectedSyncedDomainForProfile:()HKHeartRhythm;
+ (id)hdhr_heartRhythmProtectedLocalDomainForProfile:()HKHeartRhythm;
+ (id)hdhr_heartRhythmProtectedSyncedDomainForProfile:()HKHeartRhythm;
- (id)hdhr_atrialFibrillationOnboardingCompletedDateWithError:()HKHeartRhythm;
- (id)hdhr_atrialFibrillationOnboardingCompletionVersionWithError:()HKHeartRhythm;
- (id)hdhr_atrialFibrillationOnboardingCountryCodeWithError:()HKHeartRhythm;
- (id)hdhr_irregularRhythmNotificationsOnboardingCompletionForFeatureIdentifier:()HKHeartRhythm error:;
- (uint64_t)hdhr_resetAtrialFibrillationDetectionOnboardingWithError:()HKHeartRhythm;
- (uint64_t)hdhr_setAtrialFibrillationDetectionCurrentOnboardingVersionCompletedInCountryCode:()HKHeartRhythm error:;
@end

@implementation HDKeyValueDomain(HKHeartRhythm)

+ (id)hdhr_heartRhythmProtectedSyncedDomainForProfile:()HKHeartRhythm
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v6 = (void *)[v5 initWithCategory:105 domainName:*MEMORY[0x1E4F2BE90] profile:v4];

  return v6;
}

- (id)hdhr_irregularRhythmNotificationsOnboardingCompletionForFeatureIdentifier:()HKHeartRhythm error:
{
  id v6 = a3;
  id v18 = 0;
  v7 = objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCompletionVersionWithError:", &v18);
  id v8 = v18;
  v9 = v8;
  if (v7)
  {
    if (![v7 integerValue])
    {
      v13 = 0;
      goto LABEL_18;
    }
    id v17 = v9;
    objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCompletedDateWithError:", &v17);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v17;

    if (v10)
    {
      objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCountryCodeWithError:", 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B2D8]), "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v6, objc_msgSend(v7, "integerValue"), v10, v12, 0);
LABEL_16:

      goto LABEL_17;
    }
    id v15 = v11;
    id v12 = v15;
    if (v15)
    {
      if (a4)
      {
        id v12 = v15;
        v13 = 0;
        *a4 = v12;
        goto LABEL_16;
      }
      _HKLogDroppedError();
    }
    v13 = 0;
    goto LABEL_16;
  }
  id v14 = v8;
  id v10 = v14;
  if (!v14) {
    goto LABEL_13;
  }
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_13:
    v13 = 0;
    id v11 = v10;
    goto LABEL_17;
  }
  id v10 = v14;
  v13 = 0;
  *a4 = v10;
  id v11 = v10;
LABEL_17:

  v9 = v11;
LABEL_18:

  return v13;
}

- (id)hdhr_atrialFibrillationOnboardingCompletionVersionWithError:()HKHeartRhythm
{
  if ([a1 category] != 105
    || ([a1 domainName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKHeartRhythm.m", 96, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  v9 = [a1 numberForKey:*MEMORY[0x1E4F29700] error:a3];
  if ([v9 integerValue]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)hdhr_heartRhythmProtectedLocalDomainForProfile:()HKHeartRhythm
{
  id v4 = a3;
  id v5 = [a1 alloc];
  id v6 = (void *)[v5 initWithCategory:100 domainName:*MEMORY[0x1E4F2BE90] profile:v4];

  return v6;
}

+ (id)hdhr_aFibBurdenProtectedLocalDomainForProfile:()HKHeartRhythm
{
  id v4 = a3;
  id v5 = [a1 alloc];
  id v6 = (void *)[v5 initWithCategory:100 domainName:*MEMORY[0x1E4F67D38] profile:v4];

  return v6;
}

+ (id)hdhr_aFibBurdenProtectedSyncedDomainForProfile:()HKHeartRhythm
{
  id v4 = a3;
  id v5 = [a1 alloc];
  id v6 = (void *)[v5 initWithCategory:105 domainName:*MEMORY[0x1E4F67D38] profile:v4];

  return v6;
}

- (id)hdhr_atrialFibrillationOnboardingCountryCodeWithError:()HKHeartRhythm
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a1 category] != 105
    || ([a1 domainName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKHeartRhythm.m", 47, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  uint64_t v9 = *MEMORY[0x1E4F296F8];
  id v22 = 0;
  id v10 = [a1 stringForKey:v9 error:&v22];
  id v11 = v22;
  id v12 = v11;
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  if (v13)
  {
    id v14 = objc_msgSend(v10, "hk_copyNonEmptyString");
  }
  else
  {
    int v15 = objc_msgSend(v11, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x1E4F29F50];
    id v17 = *MEMORY[0x1E4F29F50];
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v16;
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        id v20 = v19;
        _os_log_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine onboarding country code",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(HKHeartRhythm) hdhr_atrialFibrillationOnboardingCountryCodeWithError:](v16);
    }
    if (a3)
    {
      id v14 = 0;
      *a3 = v12;
    }
    else
    {
      _HKLogDroppedError();
      id v14 = 0;
    }
  }

  return v14;
}

- (id)hdhr_atrialFibrillationOnboardingCompletedDateWithError:()HKHeartRhythm
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if ([a1 category] != 105
    || ([a1 domainName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKHeartRhythm.m", 120, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  v30[0] = *MEMORY[0x1E4F29700];
  uint64_t v9 = v30[0];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v27 = 0;
  id v11 = [a1 modificationDatesForKeys:v10 error:&v27];
  id v12 = v27;
  BOOL v13 = [v11 objectForKeyedSubscript:v9];

  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v12 == 0;
  }
  if (v14)
  {
    if (v13)
    {
      id v26 = v12;
      int v15 = objc_msgSend(a1, "hdhr_atrialFibrillationOnboardingCompletionVersionWithError:", &v26);
      id v16 = v26;

      uint64_t v17 = [v15 integerValue];
      if (!v17)
      {
        id v18 = 0;
        id v12 = v16;
        goto LABEL_23;
      }
      id v12 = v16;
    }
    id v18 = v13;
    goto LABEL_23;
  }
  int v19 = objc_msgSend(v12, "hk_isDatabaseAccessibilityError");
  _HKInitializeLogging();
  id v20 = (void *)*MEMORY[0x1E4F29F50];
  v21 = *MEMORY[0x1E4F29F50];
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v20;
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v29 = v23;
      id v24 = v23;
      _os_log_impl(&dword_1D3AC6000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine onboarding completion date",
        buf,
        0xCu);

      if (!a3) {
        goto LABEL_22;
      }
LABEL_19:
      id v12 = v12;
      id v18 = 0;
      *a3 = v12;
      goto LABEL_23;
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    -[HDKeyValueDomain(HKHeartRhythm) hdhr_atrialFibrillationOnboardingCompletedDateWithError:](v20);
    if (a3) {
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  if (a3) {
    goto LABEL_19;
  }
LABEL_22:
  _HKLogDroppedError();
  id v18 = 0;
LABEL_23:

  return v18;
}

- (uint64_t)hdhr_setAtrialFibrillationDetectionCurrentOnboardingVersionCompletedInCountryCode:()HKHeartRhythm error:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([a1 category] != 105
    || ([a1 domainName],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v8,
        (v9 & 1) == 0))
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKHeartRhythm.m", 148, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  uint64_t v11 = *MEMORY[0x1E4F29700];
  v15[0] = *MEMORY[0x1E4F296F8];
  v15[1] = v11;
  v16[0] = v7;
  v16[1] = &unk_1F2B42058;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v13 = [a1 setValuesWithDictionary:v12 error:a4];

  return v13;
}

- (uint64_t)hdhr_resetAtrialFibrillationDetectionOnboardingWithError:()HKHeartRhythm
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if ([a1 category] != 105
    || ([a1 domainName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+HKHeartRhythm.m", 158, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  uint64_t v9 = *MEMORY[0x1E4F29700];
  v13[0] = *MEMORY[0x1E4F296F8];
  v13[1] = v9;
  v14[0] = &stru_1F2B36C98;
  v14[1] = &unk_1F2B42070;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v11 = [a1 setValuesWithDictionary:v10 error:a3];

  return v11;
}

- (void)hdhr_atrialFibrillationOnboardingCountryCodeWithError:()HKHeartRhythm .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Error reading onboarding country code: %{public}@", v6, v7, v8, v9, v10);
}

- (void)hdhr_atrialFibrillationOnboardingCompletedDateWithError:()HKHeartRhythm .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Error reading onboarding completion date: %{public}@", v6, v7, v8, v9, v10);
}

@end