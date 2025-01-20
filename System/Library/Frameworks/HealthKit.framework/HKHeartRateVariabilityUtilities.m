@interface HKHeartRateVariabilityUtilities
+ (id)_hrvType;
+ (id)_sequenceType;
+ (id)instantaneousBPMsForHeartbeatSeriesSample:(id)a3;
+ (void)deleteHRVSample:(id)a3 healthStore:(id)a4 predicate:(id)a5 options:(unint64_t)a6 completion:(id)a7;
+ (void)deleteHRVSamplesFromStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 options:(unint64_t)a6 healthStore:(id)a7 completion:(id)a8;
+ (void)queryForParentSequenceOfHRV:(id)a3 healthStore:(id)a4 completion:(id)a5;
@end

@implementation HKHeartRateVariabilityUtilities

+ (id)_hrvType
{
  return +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierHeartRateVariabilitySDNN"];
}

+ (id)_sequenceType
{
  return +[HKSeriesType heartbeatSeriesType];
}

+ (void)queryForParentSequenceOfHRV:(id)a3 healthStore:(id)a4 completion:(id)a5
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 quantityType];
  v13 = [a1 _hrvType];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:a1 file:@"HKHeartRateVariabilityUtilities.m" lineNumber:52 description:@"Should only query for parents sequence for HRV samples"];
  }
  v15 = [v9 sourceRevision];
  v16 = [v15 source];
  char v17 = [v16 _isAppleWatch];

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F28F60];
    v19 = [v9 startDate];
    v20 = [v18 predicateWithFormat:@"startDate >= %@", v19];

    v21 = (void *)MEMORY[0x1E4F28F60];
    v22 = [v9 endDate];
    v23 = [v21 predicateWithFormat:@"endDate <= %@", v22];

    v24 = [v9 sourceRevision];
    v25 = [v24 source];
    v26 = +[HKQuery predicateForObjectsFromSource:v25];

    v27 = (void *)MEMORY[0x1E4F28BA0];
    v36[0] = v20;
    v36[1] = v23;
    v36[2] = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    v29 = [v27 andPredicateWithSubpredicates:v28];

    v30 = +[HKSeriesType heartbeatSeriesType];
    v31 = [HKSampleQuery alloc];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __86__HKHeartRateVariabilityUtilities_queryForParentSequenceOfHRV_healthStore_completion___block_invoke;
    v34[3] = &unk_1E58C97F0;
    id v35 = v11;
    v32 = [(HKSampleQuery *)v31 initWithSampleType:v30 predicate:v29 limit:1 sortDescriptors:0 resultsHandler:v34];
    [v10 executeQuery:v32];
  }
  else
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

void __86__HKHeartRateVariabilityUtilities_queryForParentSequenceOfHRV_healthStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = [a3 firstObject];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)deleteHRVSample:(id)a3 healthStore:(id)a4 predicate:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke;
  aBlock[3] = &unk_1E58C9840;
  id v14 = v12;
  id v28 = v14;
  id v29 = v11;
  unint64_t v31 = a6;
  id v32 = a1;
  id v15 = v13;
  id v30 = v15;
  id v16 = v11;
  char v17 = _Block_copy(aBlock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_37;
  v21[3] = &unk_1E58C9890;
  id v22 = v14;
  id v23 = v17;
  unint64_t v25 = a6;
  id v26 = a1;
  id v24 = v15;
  id v18 = v15;
  id v19 = v17;
  id v20 = v14;
  [a1 queryForParentSequenceOfHRV:v16 healthStore:v20 completion:v21];
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2;
  v4[3] = &unk_1E58C9818;
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  [v1 deleteObject:v2 options:v3 withCompletion:v4];
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_cold_1();
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_37(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_38;
    v9[3] = &unk_1E58C9868;
    id v5 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = *(id *)(a1 + 48);
    [v5 deleteObject:a2 options:v4 withCompletion:v9];
  }
  else
  {
    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_38(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_38_cold_1();
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
  }
}

+ (void)deleteHRVSamplesFromStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 options:(unint64_t)a6 healthStore:(id)a7 completion:(id)a8
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = +[HKQuery predicateForSamplesWithStartDate:a3 endDate:a4 options:0];
  id v18 = (void *)v17;
  if (v14)
  {
    id v19 = (void *)MEMORY[0x1E4F28BA0];
    v34[0] = v14;
    v34[1] = v17;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    uint64_t v21 = [v19 andPredicateWithSubpredicates:v20];

    id v18 = (void *)v21;
  }
  id v22 = [a1 _sequenceType];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke;
  v27[3] = &unk_1E58C98E0;
  id v28 = v15;
  id v29 = v18;
  id v32 = a1;
  unint64_t v33 = a6;
  id v30 = v14;
  id v31 = v16;
  id v23 = v14;
  id v24 = v18;
  id v25 = v15;
  id v26 = v16;
  [v25 deleteObjectsOfType:v22 predicate:v24 options:a6 withCompletion:v27];
}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8 = [*(id *)(a1 + 64) _hrvType];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_40;
    v12[3] = &unk_1E58C98B8;
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [v7 deleteObjectsOfType:v8 predicate:v10 options:v9 withCompletion:v12];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_cold_1();
    }
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
    }
  }
}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_40(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogHeartRate;
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_40_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v6);
  }
}

+ (id)instantaneousBPMsForHeartbeatSeriesSample:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 startDate];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__HKHeartRateVariabilityUtilities_instantaneousBPMsForHeartbeatSeriesSample___block_invoke;
  v10[3] = &unk_1E58C9908;
  uint64_t v12 = v15;
  id v13 = v17;
  uint64_t v14 = v7;
  id v8 = v4;
  id v11 = v8;
  [v3 _enumerateHeartbeatDataWithBlock:v10];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

  return v8;
}

uint64_t __77__HKHeartRateVariabilityUtilities_instantaneousBPMsForHeartbeatSeriesSample___block_invoke(uint64_t a1, char a2, double a3)
{
  if ((a2 & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = [[HKBeatToBeatInstantaneousBPM alloc] initWithBPM:1.0 / ((a3 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) / 60.0) time:*(double *)(a1 + 56) + a3];
    [*(id *)(a1 + 32) addObject:v5];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  return 1;
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%@: Error deleting HRV: %@");
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_38_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%@: Error deleting heartbeat sequence, cannot delete corresponding HRV: %@");
}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%@: Error deleting heartbeat sequences, cannot delete corresponding HRV: %@");
}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_40_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "%@: Error deleting HRV samples with predicate %@: %@", (uint8_t *)&v5, 0x20u);
}

@end