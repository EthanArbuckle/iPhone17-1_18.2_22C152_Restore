@interface HKElectrocardiogramActiveAlgorithmVersion
+ (id)_maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:(id)a3;
+ (id)knownAlgorithmVersionFromOnboardedVersion:(id)a3 keyValueDomain:(id)a4;
+ (id)versionWithHealthStore:(id)a3 error:(id *)a4;
+ (int64_t)algorithmVersionForOnboardingVersion:(int64_t)a3;
+ (unint64_t)onboardingVersionForKnownAlgorithmVersion:(int64_t)a3;
@end

@implementation HKElectrocardiogramActiveAlgorithmVersion

+ (id)versionWithHealthStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = @"HKElectrocardiogramOnboardingCompleted";
  v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  v9 = [v8 objectForKey:v7];

  if (v9 && [v9 integerValue])
  {
    uint64_t v10 = [v9 integerValue];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "algorithmVersionForOnboardingVersion:", v10));
    goto LABEL_14;
  }
  v12 = +[HKKeyValueDomain heartRhythmDefaultsDomainWithHealthStore:v6];
  id v17 = 0;
  v13 = [v12 numberForKey:v7 error:&v17];
  id v14 = v17;
  if (!v13 || ![v13 integerValue])
  {
    if (v14)
    {
      _HKInitializeLogging();
      v15 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      {
        +[HKElectrocardiogramActiveAlgorithmVersion versionWithHealthStore:error:]((uint64_t)v7, (uint64_t)v14, v15);
        if (a4) {
          goto LABEL_10;
        }
      }
      else if (a4)
      {
LABEL_10:
        v11 = 0;
        *a4 = v14;
        goto LABEL_13;
      }
    }
    v11 = 0;
    goto LABEL_13;
  }
  v11 = [a1 knownAlgorithmVersionFromOnboardedVersion:v13 keyValueDomain:v12];
LABEL_13:

LABEL_14:

  return v11;
}

+ (id)knownAlgorithmVersionFromOnboardedVersion:(id)a3 keyValueDomain:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = +[HKElectrocardiogramActiveAlgorithmVersion algorithmVersionForOnboardingVersion:](HKElectrocardiogramActiveAlgorithmVersion, "algorithmVersionForOnboardingVersion:", [a3 integerValue]);
  v8 = [a1 _maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:v6];

  uint64_t v9 = [v8 integerValue];
  if (v9)
  {
    if (v7 == 0x7FFFFFFF)
    {
      _HKInitializeLogging();
      uint64_t v10 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136446210;
        v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
        _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Sync'd alg version is greater than max previously onboarded and known to build.", (uint8_t *)&v20, 0xCu);
      }
      id v11 = v8;
    }
    else
    {
      int64_t v14 = v9;
      _HKInitializeLogging();
      v15 = HKLogHeartRhythm;
      BOOL v16 = os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT);
      if (v7 >= v14)
      {
        if (v16)
        {
          int v20 = 136446210;
          v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
          _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Sync'd alg version is known to this build and not smaller than any version previously onboarded.", (uint8_t *)&v20, 0xCu);
        }
        id v17 = NSNumber;
        int64_t v18 = v7;
      }
      else
      {
        if (v16)
        {
          int v20 = 136446210;
          v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
          _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Sync'd alg version is less than max previously onboarded and known to build.", (uint8_t *)&v20, 0xCu);
        }
        id v17 = NSNumber;
        int64_t v18 = v14;
      }
      id v11 = [v17 numberWithInteger:v18];
    }
    v13 = v11;
  }
  else
  {
    _HKInitializeLogging();
    v12 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136446210;
      v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Known onboarding history is empty.", (uint8_t *)&v20, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)_maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:(id)a3
{
  v3 = +[HKHeartRhythmAvailability electrocardiogramOnboardingHistoryMaxKnownWithKeyValueDomain:a3];
  if ([v3 count] == 1)
  {
    v4 = [v3 allKeys];
    v5 = [v4 firstObject];
    uint64_t v6 = [v5 integerValue];

    int64_t v7 = +[HKElectrocardiogramActiveAlgorithmVersion algorithmVersionForOnboardingVersion:v6];
    v8 = [NSNumber numberWithInteger:v7];
  }
  else
  {
    if ((unint64_t)[v3 count] >= 2)
    {
      _HKInitializeLogging();
      uint64_t v9 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
        +[HKElectrocardiogramActiveAlgorithmVersion _maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:](v9);
      }
    }
    v8 = 0;
  }

  return v8;
}

+ (int64_t)algorithmVersionForOnboardingVersion:(int64_t)a3
{
  if (!a3)
  {
    v3 = &_HKAppleECGAlgorithmVersionUnknown;
    return *v3;
  }
  if ((unint64_t)a3 >= 5)
  {
    v3 = &_HKAppleECGAlgorithmVersionGreaterThanMax;
    return *v3;
  }
  if (a3 == 4) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (unint64_t)onboardingVersionForKnownAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1) {
    return 3;
  }
  else {
    return 4 * (a3 == 2);
  }
}

+ (void)versionWithHealthStore:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Couldn't read heart rhythm onboarding completion state for key [%@]: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)_maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "+[HKElectrocardiogramActiveAlgorithmVersion _maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:]";
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "[%{pulic}s] More than one max alg version previously onboarded and known to the build.", (uint8_t *)&v1, 0xCu);
}

@end