@interface HKHealthStore
@end

@implementation HKHealthStore

void __58__HKHealthStore_HKMedicalIDAdditions__createMedicalIDData__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __101__HKHealthStore_HKUIAdditions___queryForMostRecentSampleOfType_predicate_sortDescriptors_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = a4;
    id v7 = [a3 lastObject];
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
  }
}

uint64_t __86__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_predicate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) _processQuantitySample:a2 error:a3 completion:*(void *)(a1 + 32)];
}

void __98__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_healthStore_predicate_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v10 = a3;
  v5 = (void *)a1[7];
  uint64_t v6 = a1[4];
  id v7 = a2;
  int v8 = [v5 _isAudioExposureQuantityType:v6];
  v9 = (void *)a1[7];
  if (v8) {
    [v9 _queryForMostRecentAudioExposureQuantityOfType:a1[4] sample:v7 healthStore:a1[5] attenuated:0 completion:a1[6]];
  }
  else {
    [v9 _processQuantitySample:v7 error:v10 completion:a1[6]];
  }
}

uint64_t __98__HKHealthStore_HKUIAdditions__queryForMostRecentAttenuatedEAEQuantityWithHealthStore_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 56) _queryForMostRecentAudioExposureQuantityOfType:*(void *)(a1 + 32) sample:a2 healthStore:*(void *)(a1 + 40) attenuated:1 completion:*(void *)(a1 + 48)];
}

uint64_t __120__HKHealthStore_HKUIAdditions___queryForMostRecentAudioExposureQuantityOfType_sample_healthStore_attenuated_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 40) _processStatisticsCollection:a3 error:a4 completion:*(void *)(a1 + 32)];
}

void __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_cold_1();
    }
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BF98]];
  int v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_1F3B9CF20;
  }
  id v10 = v9;

  uint64_t v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2BFA0]];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1F3B9CF20;
  }
  v14 = v13;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_377;
  v18[3] = &unk_1E6D55788;
  v15 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v15;
  v20 = v10;
  v21 = v14;
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  v16 = v14;
  v17 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

uint64_t __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_377(uint64_t a1)
{
  [*(id *)(a1 + 32) _populateDemographicsWrapper:*(void *)(a1 + 40) withFirstName:*(void *)(a1 + 48) lastName:*(void *)(a1 + 56) meContact:*(void *)(a1 + 64)];
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_cold_1();
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_381;
  v12[3] = &unk_1E6D518B0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v7;
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_381(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(__CFString **)(v4 + 8);
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &stru_1F3B9CF20;
  }
  [v2 setFirstName:v5];
  if (*(void *)(a1 + 48)) {
    id v6 = *(__CFString **)(a1 + 48);
  }
  else {
    id v6 = &stru_1F3B9CF20;
  }
  [*(id *)(a1 + 32) setLastName:v6];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error fetching user name: %{public}@", v2, v3, v4, v5, v6);
}

void __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_1E0B26000, v0, v1, "Error fetching user name from profile store: %{public}@", v2, v3, v4, v5, v6);
}

@end