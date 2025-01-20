void sub_1D3ACC23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id OUTLINED_FUNCTION_0_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1D3ACF5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id _SampleClassificationFromRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v5 = MEMORY[0x1D943A8D0](a1, @"classification");
  v6 = HDSQLiteColumnWithNameAsDate();
  HDSQLiteColumnWithNameAsDouble();
  double v8 = v7;
  uint64_t v9 = HDSQLiteColumnWithNameAsString();
  uint64_t v10 = (void *)v9;
  if (v4 && v6 && v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F67E10]);
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 duration:v8];
    v13 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v10];
    v14 = (void *)[v11 initWithSampleUUID:v4 classification:v5 sampleDateInterval:v12 sampleTimeZone:v13];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 100, @"Unexpectedly found missing values: sampleUUID(%@) date(%@) timeZoneString(%@)", v4, v6, v9);
    v14 = 0;
  }

  return v14;
}

id HDHRSampleClassificationEntityPropertiesForModel()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"sample_uuid";
  v2[1] = @"classification";
  v2[2] = @"sample_start_date";
  v2[3] = @"sample_duration";
  v2[4] = @"sample_time_zone";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];

  return v0;
}

void sub_1D3ACFF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _LocalWatchDeviceSupportsCountryCode(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v3 = [v2 currentOSVersion];

  id v4 = v1;
  NRRawVersionFromString();
  unint64_t v5 = HKAtrialFibrillationDetectionSupportedStateForGeolocatedCountryCodeAndWatchOSVersion();

  return (v5 < 5) & (3u >> v5);
}

uint64_t _PairedWatchDeviceSupportsCountryCode(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 valueForProperty:*MEMORY[0x1E4F79E60]];
  if (v4)
  {
    id v5 = v3;
    NRRawVersionFromString();
    unint64_t v6 = HKAtrialFibrillationDetectionSupportedStateForGeolocatedCountryCodeAndWatchOSVersion();

    if (v6 <= 4) {
      uint64_t v7 = (3u >> v6) & 1;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    double v8 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      _PairedWatchDeviceSupportsCountryCode_cold_1(v8);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_6(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_1D3AD2FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id HRHeartHealthDaemonBundle()
{
  if (HRHeartHealthDaemonBundle_onceToken != -1) {
    dispatch_once(&HRHeartHealthDaemonBundle_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)HRHeartHealthDaemonBundle_bundle;

  return v0;
}

uint64_t __HRHeartHealthDaemonBundle_block_invoke()
{
  HRHeartHealthDaemonBundle_bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

id HRLocalizedStringWithKey(void *a1)
{
  id v1 = a1;
  v2 = HRHeartHealthDaemonBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_1F2B36C98 table:@"Localizable-Antimony"];

  return v3;
}

id HRLogSensitiveClassName()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v3 = [v2 showSensitiveLogItems];

  if (v3)
  {
    id v4 = v1;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
    unint64_t v6 = [v1 componentsSeparatedByCharactersInSet:v5];
    id v4 = [v6 componentsJoinedByString:&stru_1F2B36C98];
  }

  return v4;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_1D3AD6C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1D3AD6FC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id HKHRElectrocardiogramRecordingV1AllowedCountrySet()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = HKElectrocardiogramSupportedCountries();
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v3 = [v2 isAppleWatch];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
    [v4 isRunningSeedBuild];

    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
    unint64_t v6 = v5;
    if (v5)
    {
      [v5 currentOSVersionStruct];
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v0;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if ((unint64_t)HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion() <= 1) {
            objc_msgSend(v1, "addObject:", v13, (void)v16);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = [v0 allObjects];
    [v1 addObjectsFromArray:v7];
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F2AE70]) initWithSupportedCountryCodes:v1 contentVersion:1 provenance:3];

  return v14;
}

uint64_t HKHRElectrocardiogramRecordingV1LocalFeatureAttributes()
{
  return [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"1" watchDeviceIdentifier:*MEMORY[0x1E4F29AC0] phoneDeviceIdentifier:*MEMORY[0x1E4F29AB8]];
}

uint64_t HKHRElectrocardiogramRecordingV2LocalFeatureAttributes()
{
  return [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"2" watchDeviceIdentifier:@"(01)00190199649286" phoneDeviceIdentifier:@"(01)00190199649293"];
}

HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *HKHRElectrocardiogramRecordingV2FeatureAvailabilityProvider(void *a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v10 = a1;
  id v11 = a2;
  id v39 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (id)*MEMORY[0x1E4F29D30];
  if (!v11)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F65B38]);
    long long v16 = [MEMORY[0x1E4F2AE70] localAvailabilityForElectrocardiogramV2Recording];
    long long v17 = [v10 daemon];
    long long v18 = (void *)[v15 initWithFeatureIdentifier:v14 defaultCountrySet:v16 healthDaemon:v17];

    id v19 = objc_alloc(MEMORY[0x1E4F65BA8]);
    uint64_t v20 = [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"2" watchDeviceIdentifier:@"(01)00190199649286" phoneDeviceIdentifier:@"(01)00190199649293"];
    id v11 = (id)[v19 initWithFeatureIdentifier:v14 localFeatureAttributes:v20 localCountrySetAvailabilityProvider:v18];
  }
  if ([v10 profileType] == 1) {
    [v11 synchronizeLocalProperties];
  }
  uint64_t v21 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v22 = [v21 isAppleWatch];

  if (v22) {
    v23 = 0;
  }
  else {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
  }
  uint64_t v24 = [HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider alloc];
  v25 = [v10 daemon];
  v26 = [v25 nanoRegistryDeviceCapabilityProvider];
  v27 = [(HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider *)v24 initWithPairedFeatureAttributesProvider:v11 pairedDeviceCapabilityProvider:v26];

  v28 = v27;
  if (!v12)
  {
    if (a6)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F65B38]);
      v30 = [MEMORY[0x1E4F2AE70] localAvailabilityForElectrocardiogramV2Recording];
      v31 = [v10 daemon];
      id v12 = (id)[v29 initWithFeatureIdentifier:v14 defaultCountrySet:v30 healthDaemon:v31];
    }
    else
    {
      id v32 = objc_alloc(MEMORY[0x1E4F65C38]);
      id v12 = (id)[v32 initWithAllowedCountriesDataSource:v11 profile:v10 featureCapability:v23 loggingCategory:*MEMORY[0x1E4F29F50]];
    }
  }
  v33 = objc_alloc_init(HDHRElectrocardiogramV2DeviceSupportedStateProvider);
  v34 = [HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager alloc];
  v35 = [MEMORY[0x1E4F67E08] requirementSetV2];
  LOBYTE(v38) = a6;
  v36 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)v34 initWithProfile:v10 featureIdentifier:v14 onboardingVersion:4 pairedFeatureAttributesProvider:v28 disableAndExpiryProvider:v39 regionAvailabilityProvider:v12 deviceSupportedProvider:v33 availabilityRequirementSet:v35 cacheDefaults:v13 isStandalone:v38];

  return v36;
}

HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *HKHRElectrocardiogramRecordingV1FeatureAvailabilityProvider(void *a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11 = a1;
  id v12 = a2;
  id v40 = a3;
  v41 = a4;
  id v39 = a5;
  id v13 = (id)*MEMORY[0x1E4F29D28];
  if (!v12)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F65B38]);
    id v15 = HKHRElectrocardiogramRecordingV1AllowedCountrySet();
    long long v16 = [v11 daemon];
    long long v17 = (void *)[v14 initWithFeatureIdentifier:v13 defaultCountrySet:v15 healthDaemon:v16];

    id v18 = objc_alloc(MEMORY[0x1E4F65BA8]);
    id v19 = [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"1" watchDeviceIdentifier:*MEMORY[0x1E4F29AC0] phoneDeviceIdentifier:*MEMORY[0x1E4F29AB8]];
    id v12 = (id)[v18 initWithFeatureIdentifier:v13 localFeatureAttributes:v19 localCountrySetAvailabilityProvider:v17];
  }
  if ([v11 profileType] == 1) {
    [v12 synchronizeLocalProperties];
  }
  uint64_t v20 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v21 = [v20 isAppleWatch];

  int v22 = a6;
  if (v21) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
  }
  uint64_t v24 = v13;
  v25 = [v11 daemon];
  v26 = [v25 nanoRegistryDeviceCapabilityProvider];

  v27 = [[HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider alloc] initWithPairedFeatureAttributesProvider:v12 pairedDeviceCapabilityProvider:v26];
  if (!v41)
  {
    if (v22)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F65B38]);
      id v29 = HKHRElectrocardiogramRecordingV1AllowedCountrySet();
      v30 = [v11 daemon];
      v41 = (HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider *)[v28 initWithFeatureIdentifier:v24 defaultCountrySet:v29 healthDaemon:v30];
    }
    else
    {
      id v31 = objc_alloc(MEMORY[0x1E4F65C38]);
      id v29 = (void *)[v31 initWithAllowedCountriesDataSource:v12 profile:v11 featureCapability:v23 loggingCategory:*MEMORY[0x1E4F29F50]];
      v41 = [[HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider alloc] initWithRegionAvailabilityProvider:v29 pairedDeviceCapabilityProvider:v26];
    }
  }
  id v32 = objc_alloc_init(HDHRElectrocardiogramV1DeviceSupportedStateProvider);
  v33 = [HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager alloc];
  [MEMORY[0x1E4F2B028] noRequirements];
  v35 = v34 = (void *)v23;
  LOBYTE(v37) = v22;
  uint64_t v38 = [(HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *)v33 initWithProfile:v11 featureIdentifier:v24 onboardingVersion:3 pairedFeatureAttributesProvider:v27 disableAndExpiryProvider:v40 regionAvailabilityProvider:v41 deviceSupportedProvider:v32 availabilityRequirementSet:v35 cacheDefaults:v39 isStandalone:v37];

  return v38;
}

id HKHRCachedActiveECGAlgorithmVersionInUserDefaults(void *a1)
{
  id v1 = [a1 objectForKey:*MEMORY[0x1E4F29AB0]];
  v2 = v1;
  if (v1 && [v1 integerValue] >= 1)
  {
    uint64_t v3 = [v2 integerValue];
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F2AF90], "algorithmVersionForOnboardingVersion:", v3));
    id v5 = v4;
    if (v4
      && [v4 integerValue] >= 1
      && (uint64_t v6 = [v5 integerValue], v6 < *MEMORY[0x1E4F2B9D8]))
    {
      uint64_t v7 = [v5 stringValue];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t HKHRCountForSampleWithTypeSinceDate(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F65BE8];
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = HDSampleEntityPredicateForStartDate();
  id v13 = 0;
  uint64_t v10 = [v6 countOfSamplesWithType:v7 profile:v8 matchingPredicate:v9 withError:&v13];

  id v11 = v13;
  if (v11)
  {
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v10;
}

id HKHRAtrialFibrillationEventMinutesBetweenLastSampleAndDate(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)MEMORY[0x1E4F2B2C0];
  id v7 = a1;
  id v8 = [v6 atrialFibrillationEventType];
  id v18 = 0;
  uint64_t v9 = [MEMORY[0x1E4F65BE8] mostRecentSampleWithType:v8 profile:v7 encodingOptions:0 predicate:0 anchor:0 error:&v18];

  id v10 = v18;
  id v11 = v10;
  if (v9)
  {
    id v12 = [v9 endDate];
    [v5 timeIntervalSinceDate:v12];
    uint64_t v14 = (uint64_t)v13 / 60;

    id v15 = [NSNumber numberWithInteger:v14];
  }
  else
  {
    id v16 = v10;
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v15 = 0;
  }

  return v15;
}

uint64_t HKHRElectrocardiogramAnalyticsBucketForSampleCount(uint64_t a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 6;
  if ((unint64_t)a1 < 6) {
    uint64_t v2 = 3;
  }
  if ((unint64_t)a1 >= 3) {
    uint64_t v1 = v2;
  }
  if (a1 >= 1) {
    return v1;
  }
  else {
    return 0;
  }
}

void *HKHRAtrialFibrillationEventAnalyticsMinutesBucket(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 integerValue] >= 181) {
      uint64_t v3 = &unk_1F2B42118;
    }
    else {
      uint64_t v3 = &unk_1F2B42100;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

__CFString *NSStringFromHKElectPrivaterocardiogramSymptom(uint64_t a1)
{
  if (a1 > 63)
  {
    uint64_t v3 = @"ShortnessOfBreath";
    id v4 = @"SkippedHeartbeat";
    if (a1 != 512) {
      id v4 = 0;
    }
    if (a1 != 256) {
      uint64_t v3 = v4;
    }
    id v5 = @"Other";
    uint64_t v6 = @"RapidPoundingOrFlutteringHeartbeat";
    if (a1 != 128) {
      uint64_t v6 = 0;
    }
    if (a1 != 64) {
      id v5 = v6;
    }
    if (a1 <= 255) {
      return v5;
    }
    else {
      return v3;
    }
  }
  else
  {
    uint64_t v1 = a1 - 1;
    result = 0;
    switch(v1)
    {
      case 0:
        result = @"NoSymptoms";
        break;
      case 1:
        result = @"ChestTightnessOrPain";
        break;
      case 2:
      case 4:
      case 5:
      case 6:
        return result;
      case 3:
        result = @"Dizziness";
        break;
      case 7:
        result = @"Fatigue";
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

void sub_1D3ADA074(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

id OUTLINED_FUNCTION_2_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1D3AE1E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HDHRIrregularRhythmNotificationsV2LocalFeatureAttributes()
{
  return [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"2" watchDeviceIdentifier:@"(01)00194252456774" phoneDeviceIdentifier:@"(01)00194252456781"];
}

id HDHRIrregularRhythmNotificationsV2PairedFeaturePropertiesSyncManager(void *a1)
{
  uint64_t v1 = *MEMORY[0x1E4F29D70];
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F65B38];
  id v3 = a1;
  id v4 = [v2 alloc];
  id v5 = [MEMORY[0x1E4F2AE70] localAvailabilityForIrregularRhythmNotificationsV2];
  uint64_t v6 = (void *)[v4 initWithFeatureIdentifier:v1 defaultCountrySet:v5 healthDaemon:v3];

  id v7 = objc_alloc(MEMORY[0x1E4F65BA8]);
  id v8 = [MEMORY[0x1E4F2AFE8] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"2" watchDeviceIdentifier:@"(01)00194252456774" phoneDeviceIdentifier:@"(01)00194252456781"];
  uint64_t v9 = (void *)[v7 initWithFeatureIdentifier:v1 localFeatureAttributes:v8 localCountrySetAvailabilityProvider:v6];

  return v9;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1D3AE7730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3AE8A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id HDHRBackgroundHeartRateContextPredicate(void *a1)
{
  uint64_t v1 = [a1 metadataManager];
  uint64_t v2 = *MEMORY[0x1E4F2BB28];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F2B42448, 0);
  id v4 = [v1 predicateWithMetadataKey:v2 allowedValues:v3];

  return v4;
}

id HDHRAnalyticsCountOfSamples(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = HDAnalyticsCountOfSamples();
  id v4 = 0;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v6 = HKLogAnalytics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      HDHRAnalyticsCountOfSamples_cold_1((uint64_t)v2, (uint64_t)v4, v6);
    }

    id v5 = &unk_1F2B42460;
  }

  return v5;
}

void sub_1D3AEC110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HDStringFromHeartRateWidgetDataManagerReloadReason(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E69B4AA8[a1];
  }

  return v1;
}

void sub_1D3AF08D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3AF0A50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id _heartbeatSeriesDataForPulseTimes(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", 16 * objc_msgSend(v1, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "doubleValue", (void)v9);
        HKHeartbeatSeriesAppendDatum();
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t ___aFibHeartbeatSeriesData_block_invoke()
{
  _aFibHeartbeatSeriesData___aFibHeartbeatSeriesData = _heartbeatSeriesDataForPulseTimes(&unk_1F2B430B8);

  return MEMORY[0x1F41817F8]();
}

uint64_t ___nonAFibHeartbeatSeriesData_block_invoke()
{
  _nonAFibHeartbeatSeriesData___nonAFibHeartbeatSeriesData = _heartbeatSeriesDataForPulseTimes(&unk_1F2B430D0);

  return MEMORY[0x1F41817F8]();
}

void sub_1D3AF451C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1D3AF4A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_3_4(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, v4, 0xCu);
}

void sub_1D3AF6418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3AF88AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t _HDDropHeartCLogTables(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [a2 protectedDatabase];
  LODWORD(a4) = [v5 executeSQLStatements:&unk_1F2B43160 error:a4];

  return a4 ^ 1;
}

void sub_1D3AF9E98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D3AFA0BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D3AFBC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1D3AFBE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3AFFA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1D3AFFDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B00030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B01138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B017A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B02434(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_4_3(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_5_2()
{
  return objc_loadWeakRetained(v0);
}

void sub_1D3B03674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Block_object_dispose((const void *)(v32 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1D3B0425C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D3B04BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v50 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_1D3B05174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D3B055EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Block_object_dispose((const void *)(v32 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_4_4(id a1, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return a1;
}

id OUTLINED_FUNCTION_5_3(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0x16u);
}

void sub_1D3B05F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B06180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HDMigrateHeartRateNotificationsUserDefaultsIfNecessary(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 integerForKey:@"MigrationVersion"];
  _HKInitializeLogging();
  uint64_t v3 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = NSNumber;
    uint64_t v5 = v3;
    uint64_t v6 = [v4 numberWithInteger:v2];
    int v12 = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    id v15 = &unk_1F2B42CD0;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[Migration] Migrating if necessary from version %{public}@ to %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (!v2)
  {
    id v8 = v1;
    if (([v8 BOOLForKey:*MEMORY[0x1E4F2BE68]] & 1) != 0
      || [v8 BOOLForKey:*MEMORY[0x1E4F2BE78]])
    {
      HKHRSubmitNotificationsEnabledSignal();
    }
    [v8 setInteger:1 forKey:@"MigrationVersion"];
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"MigrationVersion"];

    [v7 unionSet:v9];
  }
  long long v10 = (void *)[v7 copy];

  return v10;
}

void sub_1D3B08F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B0945C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Block_object_dispose((const void *)(v32 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1D3B0A140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B0A8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Block_object_dispose((const void *)(v32 - 128), 8);
  _Unwind_Resume(a1);
}

void _PairedWatchDeviceSupportsCountryCode_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_7();
  id v4 = OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_3(&dword_1D3AC6000, v5, v6, "[%{public}@] Watch version is nil", v7, v8, v9, v10, v11);
}

void HDHRAnalyticsCountOfSamples_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "Could not get count of samples of type %{public}@ with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1F411CA28]();
}

uint64_t HDAddStateHandler()
{
  return MEMORY[0x1F411D338]();
}

uint64_t HDAnalyticsBucketedNumberOfStandAndIdleHours()
{
  return MEMORY[0x1F411D340]();
}

uint64_t HDAnalyticsCountOfSamples()
{
  return MEMORY[0x1F411D348]();
}

uint64_t HDDataEntityPredicateForDataUUID()
{
  return MEMORY[0x1F411D380]();
}

uint64_t HDDataEntityPredicateForDataUUIDs()
{
  return MEMORY[0x1F411D388]();
}

uint64_t HDDataEntityPredicateForRowID()
{
  return MEMORY[0x1F411D390]();
}

uint64_t HDDataEntityPredicateForSourceEntity()
{
  return MEMORY[0x1F411D398]();
}

uint64_t HDDemoData_timeFromDateComponents()
{
  return MEMORY[0x1F411D3A0]();
}

uint64_t HDDispatchQueueName()
{
  return MEMORY[0x1F411D3A8]();
}

uint64_t HDQueryServerSampleTypeObservationAssertionName()
{
  return MEMORY[0x1F411D420]();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return MEMORY[0x1F411D4C0]();
}

uint64_t HDSQLiteBindDoubleToProperty()
{
  return MEMORY[0x1F411D4C8]();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return MEMORY[0x1F411D4E0]();
}

uint64_t HDSQLiteBindStringToProperty()
{
  return MEMORY[0x1F411D500]();
}

uint64_t HDSQLiteBindUUIDToProperty()
{
  return MEMORY[0x1F411D518]();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return MEMORY[0x1F411D5A8]();
}

uint64_t HDSQLiteColumnWithNameAsDouble()
{
  return MEMORY[0x1F411D5B0]();
}

uint64_t HDSQLiteColumnWithNameAsInteger()
{
  return MEMORY[0x1F411D5C0]();
}

uint64_t HDSQLiteColumnWithNameAsString()
{
  return MEMORY[0x1F411D5F0]();
}

uint64_t HDSQLiteColumnWithNameAsUUID()
{
  return MEMORY[0x1F411D600]();
}

uint64_t HDSampleEntityClassForDataType()
{
  return MEMORY[0x1F411D428]();
}

uint64_t HDSampleEntityPredicateForDataType()
{
  return MEMORY[0x1F411D430]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x1F411D440]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x1F411D450]();
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge()
{
  return MEMORY[0x1F40E7A40]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x1F40E7A70]();
}

uint64_t HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString()
{
  return MEMORY[0x1F40E7A78]();
}

uint64_t HKAtrialFibrillationDetectionSupportedCountries()
{
  return MEMORY[0x1F40E7A98]();
}

uint64_t HKAtrialFibrillationDetectionSupportedStateForGeolocatedCountryCodeAndWatchOSVersion()
{
  return MEMORY[0x1F40E7AA0]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1F40E7BA0]();
}

uint64_t HKDataCollectionTypeToString()
{
  return MEMORY[0x1F40E7BC8]();
}

uint64_t HKDispatchQueueName()
{
  return MEMORY[0x1F40E7C80]();
}

uint64_t HKElectrocardiogramSupportedCountries()
{
  return MEMORY[0x1F40E7C88]();
}

uint64_t HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion()
{
  return MEMORY[0x1F40E7C90]();
}

uint64_t HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion()
{
  return MEMORY[0x1F40E7C98]();
}

uint64_t HKFeatureAvailabilityOnboardingIneligibilityReasonsForRescindedStatus()
{
  return MEMORY[0x1F40E7CC8]();
}

uint64_t HKFeatureUpdateVersionFromMajorVersionAndBuildVersion()
{
  return MEMORY[0x1F40E7D00]();
}

uint64_t HKHRAFibBurdenAnalysisPercentageOverride()
{
  return MEMORY[0x1F4121690]();
}

uint64_t HKHRAFibBurdenAnalyticsPropertyValueForVersion()
{
  return MEMORY[0x1F4121698]();
}

uint64_t HKHRAFibBurdenDayOfWeekHistogramOverride()
{
  return MEMORY[0x1F41216B0]();
}

uint64_t HKHRAFibBurdenLocalFeatureAttributes()
{
  return MEMORY[0x1F41216C0]();
}

uint64_t HKHRAFibBurdenLogForCategory()
{
  return MEMORY[0x1F41216C8]();
}

uint64_t HKHRAFibBurdenNotificationsEnabledWithFeatureStatus()
{
  return MEMORY[0x1F41216D0]();
}

uint64_t HKHRAFibBurdenPreviousWeekDayIndexRange()
{
  return MEMORY[0x1F41216D8]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponents()
{
  return MEMORY[0x1F41216E0]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults()
{
  return MEMORY[0x1F41216E8]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay()
{
  return MEMORY[0x1F41216F0]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped()
{
  return MEMORY[0x1F41216F8]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire()
{
  return MEMORY[0x1F4121700]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride()
{
  return MEMORY[0x1F4121708]();
}

uint64_t HKHRAFibBurdenTimeOfDayHistogramOverride()
{
  return MEMORY[0x1F4121710]();
}

uint64_t HKHRAnalyticsAgeBinFromAgeInYears()
{
  return MEMORY[0x1F4121718]();
}

uint64_t HKHRCardioFitnessAllowedCountrySet()
{
  return MEMORY[0x1F4121720]();
}

uint64_t HKHRCardioFitnessLocalFeatureAttributes()
{
  return MEMORY[0x1F4121738]();
}

uint64_t HKHRIrregularRhythmNotificationsRequirementsWithFeatureIdentifier()
{
  return MEMORY[0x1F4121750]();
}

uint64_t HKHRSubmitNotificationsEnabledSignal()
{
  return MEMORY[0x1F4121758]();
}

uint64_t HKHeartbeatSeriesAppendDatum()
{
  return MEMORY[0x1F40E7D48]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1F40E7D50]();
}

uint64_t HKIsHeartRateEnabled()
{
  return MEMORY[0x1F40E7D78]();
}

uint64_t HKLogAnalytics()
{
  return MEMORY[0x1F40E7DA8]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x1F40E7DD0]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1F40E7F00]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x1F40E7FD0]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x1F40E8060]();
}

uint64_t HKUDIDeviceIdentifierFromDeviceIdentifierAndBatchNumber()
{
  return MEMORY[0x1F40E8068]();
}

uint64_t NRRawVersionFromString()
{
  return MEMORY[0x1F41306E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x1F40E80E0]();
}

uint64_t NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return MEMORY[0x1F40E80E8]();
}

uint64_t NSStringFromHKFeatureAvailabilityRescindedStatus()
{
  return MEMORY[0x1F40E80F0]();
}

uint64_t NSStringFromHKHRAnalyticsAgeBin()
{
  return MEMORY[0x1F4121770]();
}

uint64_t NSStringFromHKHeartbeatSeriesFeature()
{
  return MEMORY[0x1F4121778]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HDSQLiteValueForDate()
{
  return MEMORY[0x1F411D658]();
}

uint64_t _HKCreateURLForSampleType()
{
  return MEMORY[0x1F40E8190]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1F40E81C0]();
}

uint64_t _HKLogSignpostIDGenerate()
{
  return MEMORY[0x1F40E81D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}