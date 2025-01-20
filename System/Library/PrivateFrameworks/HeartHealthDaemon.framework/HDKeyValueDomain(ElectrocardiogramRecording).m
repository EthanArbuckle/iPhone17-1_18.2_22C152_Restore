@interface HDKeyValueDomain(ElectrocardiogramRecording)
- (id)hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording;
- (id)hdhr_electrocardiogramRecordingOnboardingCompletionVersionWithError:()ElectrocardiogramRecording;
- (id)hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:()ElectrocardiogramRecording;
- (id)hdhr_electrocardiogramRecordingOnboardingHistoryWithError:()ElectrocardiogramRecording;
- (uint64_t)hdhr_electrocardiogramRecordingCountryCodeProvenanceWithError:()ElectrocardiogramRecording;
- (uint64_t)hdhr_resetElectrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording;
- (uint64_t)hdhr_setElectrocardiogramRecordingFirstOnboardingCompletedDate:()ElectrocardiogramRecording error:;
@end

@implementation HDKeyValueDomain(ElectrocardiogramRecording)

- (id)hdhr_electrocardiogramRecordingOnboardingHistoryWithError:()ElectrocardiogramRecording
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F29AA8];
  id v17 = 0;
  v5 = [a1 propertyListValueForKey:v4 error:&v17];
  id v6 = v17;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    id v9 = v5;
  }
  else
  {
    int v10 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E4F29F50];
    v12 = *MEMORY[0x1E4F29F50];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v11;
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        id v15 = v14;
        _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine ECG onboarding history",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(ElectrocardiogramRecording) hdhr_electrocardiogramRecordingOnboardingHistoryWithError:](v11);
    }
    if (a3)
    {
      id v9 = 0;
      *a3 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v9 = 0;
    }
  }

  return v9;
}

- (id)hdhr_electrocardiogramRecordingOnboardingCompletionVersionWithError:()ElectrocardiogramRecording
{
  if ([a1 category] != 105
    || ([a1 domainName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v6,
        (v7 & 1) == 0))
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+ElectrocardiogramRecording.m", 61, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  id v9 = [a1 numberForKey:*MEMORY[0x1E4F29AB0] error:a3];
  if ([v9 integerValue]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F29A90];
  id v17 = 0;
  v5 = [a1 dateForKey:v4 error:&v17];
  id v6 = v17;
  char v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    id v9 = v5;
  }
  else
  {
    int v10 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E4F29F50];
    v12 = *MEMORY[0x1E4F29F50];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v11;
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        id v15 = v14;
        _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine first ECG onboarding completion date",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(ElectrocardiogramRecording) hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:](v11);
    }
    if (a3)
    {
      id v9 = 0;
      *a3 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v9 = 0;
    }
  }

  return v9;
}

- (uint64_t)hdhr_setElectrocardiogramRecordingFirstOnboardingCompletedDate:()ElectrocardiogramRecording error:
{
  id v7 = a3;
  if ([a1 category] != 105
    || ([a1 domainName],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v8,
        (v9 & 1) == 0))
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+ElectrocardiogramRecording.m", 54, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  uint64_t v11 = [a1 setDate:v7 forKey:*MEMORY[0x1E4F29A90] error:a4];

  return v11;
}

- (id)hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:()ElectrocardiogramRecording
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a1 category] != 105
    || ([a1 domainName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v6,
        (v7 & 1) == 0))
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+ElectrocardiogramRecording.m", 85, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  uint64_t v9 = *MEMORY[0x1E4F29AA0];
  id v22 = 0;
  int v10 = [a1 stringForKey:v9 error:&v22];
  id v11 = v22;
  v12 = v11;
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  if (v13)
  {
    v14 = objc_msgSend(v10, "hk_copyNonEmptyString");
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
        v18 = v16;
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        id v20 = v19;
        _os_log_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine ECG onboarding country code",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[HDKeyValueDomain(ElectrocardiogramRecording) hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:](v16);
    }
    if (a3)
    {
      v14 = 0;
      *a3 = v12;
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }

  return v14;
}

- (uint64_t)hdhr_resetElectrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording
{
  if ([a1 category] != 105
    || ([a1 domainName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]],
        v6,
        (v7 & 1) == 0))
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+ElectrocardiogramRecording.m", 106, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults && [self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F29A90]];
  uint64_t v10 = [a1 removeValuesForKeys:v9 error:a3];

  return v10;
}

- (uint64_t)hdhr_electrocardiogramRecordingCountryCodeProvenanceWithError:()ElectrocardiogramRecording
{
  if ([a1 category] != 105)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+ElectrocardiogramRecording.m", 113, @"Invalid parameter not satisfying: %@", @"self.category == HDKeyValueEntityCategoryProtectedNanoUserDefaults" object file lineNumber description];
  }
  id v6 = [a1 domainName];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F2BE90]];

  if ((v7 & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDKeyValueDomain+ElectrocardiogramRecording.m", 114, @"Invalid parameter not satisfying: %@", @"[self.domainName isEqualToString:kHKHeartRhythmDefaultsDomain]" object file lineNumber description];
  }

  return [a1 numberForKey:@"HKElectrocardiogramOnboardingCountryCodeProvenance" error:a3];
}

- (void)hdhr_electrocardiogramRecordingOnboardingHistoryWithError:()ElectrocardiogramRecording .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Error reading ECG onboarding history: %{public}@", v6, v7, v8, v9, v10);
}

- (void)hdhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:()ElectrocardiogramRecording .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Error reading first ECG onboarding completion date: %{public}@", v6, v7, v8, v9, v10);
}

- (void)hdhr_electrocardiogramRecordingOnboardingCountryCodeWithError:()ElectrocardiogramRecording .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Error reading ECG onboarding country code: %{public}@", v6, v7, v8, v9, v10);
}

@end