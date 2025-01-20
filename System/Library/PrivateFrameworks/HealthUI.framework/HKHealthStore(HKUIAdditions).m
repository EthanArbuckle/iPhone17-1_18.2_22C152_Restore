@interface HKHealthStore(HKUIAdditions)
+ (__CFString)localizationStringSuffixForWheelchairUser:()HKUIAdditions;
+ (id)_mostRecentEndDateSortDescriptorForQuantityType:()HKUIAdditions;
+ (id)_queryForMostRecentSampleOfType:()HKUIAdditions predicate:sortDescriptors:completion:;
+ (id)localizationStringAdditionForWheelchairUser;
+ (id)queryForMostRecentAttenuatedEAEQuantityWithHealthStore:()HKUIAdditions completion:;
+ (id)queryForMostRecentQuantityOfType:()HKUIAdditions healthStore:predicate:completion:;
+ (id)queryForMostRecentQuantityOfType:()HKUIAdditions predicate:completion:;
+ (id)queryForMostRecentSampleOfType:()HKUIAdditions predicate:completion:;
+ (uint64_t)_assignMostRecentQuantity:()HKUIAdditions dateInterval:forQuantitySample:;
+ (uint64_t)_isAudioExposureQuantityType:()HKUIAdditions;
+ (void)_processQuantitySample:()HKUIAdditions error:completion:;
+ (void)_processStatisticsCollection:()HKUIAdditions error:completion:;
+ (void)_queryForMostRecentAudioExposureQuantityOfType:()HKUIAdditions sample:healthStore:attenuated:completion:;
+ (void)localizationStringAdditionForWheelchairUser;
- (uint64_t)hk_fetchExistingDemographicInformationWithCompletion:()HKUIAdditions;
- (void)_fetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions meContact:completion:;
- (void)_nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions completion:;
- (void)_populateDemographicsWrapper:()HKUIAdditions withFirstName:lastName:meContact:;
- (void)_primaryProfileFetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions meContact:completion:;
- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:;
@end

@implementation HKHealthStore(HKUIAdditions)

+ (id)localizationStringAdditionForWheelchairUser
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
  id v11 = 0;
  v3 = [v2 wheelchairUseWithError:&v11];
  id v4 = v11;
  v5 = v4;
  if (v3)
  {
    BOOL v6 = [v3 wheelchairUse] == 2;
  }
  else
  {
    int v7 = objc_msgSend(v4, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29F28];
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[HKHealthStore(HKUIAdditions) localizationStringAdditionForWheelchairUser]();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      +[HKHealthStore(HKUIAdditions) localizationStringAdditionForWheelchairUser]();
    }
    BOOL v6 = 0;
  }
  v9 = [a1 localizationStringSuffixForWheelchairUser:v6];

  return v9;
}

+ (__CFString)localizationStringSuffixForWheelchairUser:()HKUIAdditions
{
  v3 = &stru_1F3B9CF20;
  if (a3) {
    v3 = @"_WHEELCHAIR";
  }
  id v4 = v3;
  return v4;
}

+ (id)_queryForMostRecentSampleOfType:()HKUIAdditions predicate:sortDescriptors:completion:
{
  id v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E4F2B440];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__HKHealthStore_HKUIAdditions___queryForMostRecentSampleOfType_predicate_sortDescriptors_completion___block_invoke;
  v18[3] = &unk_1E6D53520;
  id v19 = v9;
  id v15 = v9;
  v16 = (void *)[v14 initWithSampleType:v13 predicate:v12 limit:1 sortDescriptors:v11 resultsHandler:v18];

  return v16;
}

+ (id)queryForMostRecentSampleOfType:()HKUIAdditions predicate:completion:
{
  v8 = (void *)MEMORY[0x1E4F2B440];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 sortDescriptorsForMostRecentSamples];
  id v13 = [a1 _queryForMostRecentSampleOfType:v11 predicate:v10 sortDescriptors:v12 completion:v9];

  return v13;
}

+ (id)queryForMostRecentQuantityOfType:()HKUIAdditions predicate:completion:
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F2B440];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 sortDescriptorsForMostRecentSamples];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_predicate_completion___block_invoke;
  v16[3] = &unk_1E6D55710;
  id v17 = v8;
  v18 = a1;
  id v13 = v8;
  id v14 = [a1 _queryForMostRecentSampleOfType:v11 predicate:v10 sortDescriptors:v12 completion:v16];

  return v14;
}

+ (id)queryForMostRecentQuantityOfType:()HKUIAdditions healthStore:predicate:completion:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F2B440];
  id v14 = a5;
  id v15 = [v13 sortDescriptorsForMostRecentSamples];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_healthStore_predicate_completion___block_invoke;
  v21[3] = &unk_1E6D55738;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  v25 = a1;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = [a1 _queryForMostRecentSampleOfType:v18 predicate:v14 sortDescriptors:v15 completion:v21];

  return v19;
}

+ (id)queryForMostRecentAttenuatedEAEQuantityWithHealthStore:()HKUIAdditions completion:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F2B440] sortDescriptorsForMostRecentSamples];
  id v9 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7F0]];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__HKHealthStore_HKUIAdditions__queryForMostRecentAttenuatedEAEQuantityWithHealthStore_completion___block_invoke;
  v15[3] = &unk_1E6D55738;
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v19 = a1;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  id v13 = [a1 _queryForMostRecentSampleOfType:v12 predicate:0 sortDescriptors:v8 completion:v15];

  return v13;
}

+ (void)_queryForMostRecentAudioExposureQuantityOfType:()HKUIAdditions sample:healthStore:attenuated:completion:
{
  id v12 = a3;
  id v13 = a7;
  id v14 = (void *)MEMORY[0x1E4F2B3C0];
  id v15 = a5;
  id v16 = a4;
  id v17 = [v16 startDate];
  id v18 = [v14 predicateForSamplesWithStartDate:v17 endDate:0 options:1];

  if (a6
    && ([v12 identifier],
        id v19 = objc_claimAutoreleasedReturnValue(),
        v20 = (void *)*MEMORY[0x1E4F2A7F0],
        v19,
        v19 == v20))
  {
    uint64_t v21 = _HKStatisticsOptionAttenuateSamples() | 0x20;
  }
  else
  {
    uint64_t v21 = 32;
  }
  id v22 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v23 = [v16 startDate];

  id v24 = [v22 startOfDayForDate:v23];
  v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [MEMORY[0x1E4F1C9C8] date];
  }
  v27 = v26;

  id v28 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v28 setDay:1];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F2B5C8]) initWithQuantityType:v12 quantitySamplePredicate:v18 options:v21 anchorDate:v27 intervalComponents:v28];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __120__HKHealthStore_HKUIAdditions___queryForMostRecentAudioExposureQuantityOfType_sample_healthStore_attenuated_completion___block_invoke;
  v34 = &unk_1E6D55760;
  id v35 = v13;
  uint64_t v36 = a1;
  id v30 = v13;
  [v29 setInitialResultsHandler:&v31];
  objc_msgSend(v15, "executeQuery:", v29, v31, v32, v33, v34);
}

+ (void)_processQuantitySample:()HKUIAdditions error:completion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void, void))v10;
  if (!v8)
  {
    id v12 = 0;
    id v13 = 0;
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v14 = 0;
  id v15 = 0;
  [a1 _assignMostRecentQuantity:&v15 dateInterval:&v14 forQuantitySample:v8];
  id v12 = v15;
  id v13 = v14;
  if (v11) {
LABEL_3:
  }
    ((void (**)(void, id, id, id))v11)[2](v11, v12, v13, v9);
LABEL_4:
}

+ (void)_processStatisticsCollection:()HKUIAdditions error:completion:
{
  id v11 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 _mostRecentQuantityStatistics];
  id v10 = [v8 _mostRecentQuantityDateInterval];

  if (v7) {
    v7[2](v7, v9, v10, v11);
  }
}

+ (uint64_t)_isAudioExposureQuantityType:()HKUIAdditions
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F2A820];
  v10[0] = *MEMORY[0x1E4F2A7F0];
  v10[1] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v10 count:2];
  id v7 = [v5 identifier];

  uint64_t v8 = [v6 containsObject:v7];
  return v8;
}

+ (id)_mostRecentEndDateSortDescriptorForQuantityType:()HKUIAdditions
{
  [a3 dataObjectClass];
  objc_opt_class();
  objc_opt_isKindOfClass();
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9A0] ascending:0];
  return v3;
}

+ (uint64_t)_assignMostRecentQuantity:()HKUIAdditions dateInterval:forQuantitySample:
{
  id v7 = a5;
  if (a3) {
    BOOL v8 = a4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  if (!v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *a3 = [v7 mostRecentQuantity];
      *a4 = [v7 mostRecentQuantityDateInterval];
    }
    else
    {
      *a3 = [v7 quantity];
      id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v11 = [v7 startDate];
      id v12 = [v7 endDate];
      *a4 = (id)[v10 initWithStartDate:v11 endDate:v12];
    }
  }

  return v9;
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:
{
  v44[6] = *MEMORY[0x1E4F143B8];
  id v35 = a4;
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = 0;
    if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
    {
      id v7 = objc_opt_new();
      uint64_t v8 = *MEMORY[0x1E4F1AEA0];
      v44[0] = *MEMORY[0x1E4F1ADF0];
      v44[1] = v8;
      uint64_t v9 = *MEMORY[0x1E4F1AD90];
      v44[2] = *MEMORY[0x1E4F1ADE0];
      v44[3] = v9;
      uint64_t v10 = *MEMORY[0x1E4F1ADC8];
      v44[4] = *MEMORY[0x1E4F1AF10];
      v44[5] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];
      id v6 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v11, 0);
    }
  }
  id v12 = objc_alloc_init(HKDemographicsInformationWrapper);
  id v43 = 0;
  id v13 = [a1 dateOfBirthComponentsWithError:&v43];
  id v14 = v43;
  if (v14 && (_HKInitializeLogging(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)))
  {
    -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.8();
    if (v13) {
      goto LABEL_13;
    }
  }
  else if (v13)
  {
    goto LABEL_13;
  }
  if (v6)
  {
    id v15 = [v6 birthday];
    if ([v15 year] == 0x7FFFFFFFFFFFFFFFLL) {
      id v13 = 0;
    }
    else {
      id v13 = v15;
    }
  }
LABEL_13:
  v34 = v6;
  if (v13) {
    [(HKDemographicsInformationWrapper *)v12 setDateOfBirthComponents:v13];
  }
  id v42 = v14;
  uint64_t v16 = [a1 biologicalSexWithError:&v42];
  id v17 = v42;

  id v18 = (os_log_t *)MEMORY[0x1E4F29F90];
  if (v17)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.7();
    }
  }
  v33 = (void *)v16;
  [(HKDemographicsInformationWrapper *)v12 setBiologicalSexObject:v16];
  id v41 = v17;
  uint64_t v19 = [a1 _heightCharacteristicQuantityWithError:&v41];
  id v20 = v41;

  if (v20)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.6();
    }
  }
  [(HKDemographicsInformationWrapper *)v12 setHeightQuantity:v19];
  id v40 = v20;
  uint64_t v21 = [a1 _bodyMassCharacteristicQuantityWithError:&v40];
  id v22 = v40;

  if (v22)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.5();
    }
  }
  -[HKDemographicsInformationWrapper setWeightQuantity:](v12, "setWeightQuantity:", v21, v21);
  id v39 = v22;
  id v23 = [a1 fitzpatrickSkinTypeWithError:&v39];
  id v24 = v39;

  if (v24)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.4();
    }
  }
  [(HKDemographicsInformationWrapper *)v12 setFitzpatrickSkinTypeObject:v23];
  id v38 = v24;
  v25 = [a1 bloodTypeWithError:&v38];
  id v26 = v38;

  if (v26)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:]();
    }
  }
  v27 = (void *)v19;
  [(HKDemographicsInformationWrapper *)v12 setBloodTypeObject:v25];
  id v37 = v26;
  id v28 = [a1 wheelchairUseWithError:&v37];
  id v29 = v37;

  if (v29)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:]();
    }
  }
  [(HKDemographicsInformationWrapper *)v12 setWheelchairUseObject:v28];
  id v36 = v29;
  id v30 = [a1 _cardioFitnessMedicationsUseWithError:&v36];
  id v31 = v36;

  if (v31)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:]();
    }
  }
  [(HKDemographicsInformationWrapper *)v12 setCardioFitnessMedicationsUseObject:v30];
  [a1 _fetchFirstAndLastNamesForInfoWrapper:v12 meContact:v34 completion:v35];
}

- (void)_fetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions meContact:completion:
{
  id v12 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [a1 profileIdentifier];
  uint64_t v11 = [v10 type];

  if (v11 == 1) {
    [a1 _primaryProfileFetchFirstAndLastNamesForInfoWrapper:v9 meContact:v12 completion:v8];
  }
  else {
    [a1 _nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper:v9 completion:v8];
  }
}

- (void)_primaryProfileFetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions meContact:completion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F2B138] healthAppDefaultsDomainWithHealthStore:a1];
  uint64_t v12 = *MEMORY[0x1E4F2BFB0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke;
  v16[3] = &unk_1E6D557B0;
  void v16[4] = a1;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v11 propertyListValueForKey:v12 completion:v16];
}

- (void)_nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions completion:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F2B360]) initWithHealthStore:a1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke;
  v11[3] = &unk_1E6D557D8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 fetchDisplayName:v11];
}

- (uint64_t)hk_fetchExistingDemographicInformationWithCompletion:()HKUIAdditions
{
  return objc_msgSend(a1, "hk_fetchExistingDemographicInformationWithOptions:completion:", 0, a3);
}

- (void)_populateDemographicsWrapper:()HKUIAdditions withFirstName:lastName:meContact:
{
  id v17 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [v10 middleName];
  if (![v17 length])
  {
    uint64_t v13 = [v10 givenName];

    id v17 = (id)v13;
  }
  if (![v9 length])
  {
    uint64_t v14 = [v10 familyName];

    id v9 = (id)v14;
  }
  [v11 setFirstName:v17];
  [v11 setMiddleName:v12];
  [v11 setLastName:v9];
  id v15 = [v10 postalAddresses];
  [v11 setPostalAddresses:v15];

  uint64_t v16 = [v10 emailAddresses];
  [v11 setEmailAddresses:v16];
}

+ (void)localizationStringAdditionForWheelchairUser
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Failed to fetch wheelchair use: %{public}@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting cardio fitness medications use: %@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting wheelchair use: %@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting blood type: %@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.4()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting Fitzpatrick skin type: %@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.5()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting weight characteristic: %@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.6()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting height characteristic: %@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.7()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting biological sex: %@", v2, v3, v4, v5, v6);
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.8()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error getting birth date: %@", v2, v3, v4, v5, v6);
}

@end