@interface HDDemoDataActivityWorkoutState
@end

@implementation HDDemoDataActivityWorkoutState

void __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke(uint64_t a1, void *a2)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context = (void *)MEMORY[0x1C187C0E0]();
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke_2;
  v33[3] = &unk_1E62FEAB0;
  uint64_t v35 = *(void *)(a1 + 56);
  id v6 = v5;
  id v34 = v6;
  v28 = v3;
  [v3 enumerateObjectsUsingBlock:v33];
  v7 = (void *)MEMORY[0x1E4F2B7A0];
  v8 = [MEMORY[0x1E4F2AEF8] localDevice];
  v9 = [v7 _workoutRouteWithDevice:v8 metadata:0];

  [v9 _setCount:v4];
  v10 = [*(id *)(a1 + 32) dataManager];
  v38[0] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  uint64_t v12 = *(void *)(a1 + 40);
  id v32 = 0;
  [v10 insertDataObjects:v11 withProvenance:v12 creationDate:&v32 error:CFAbsoluteTimeGetCurrent()];
  id v13 = v32;

  v14 = [v9 UUID];
  uint64_t v15 = *(void *)(a1 + 32);
  id v31 = v13;
  +[HDLocationSeriesSampleEntity insertLocationData:v6 seriesIdentifier:v14 profile:v15 error:&v31];
  id v16 = v31;

  v17 = [v9 UUID];
  v36[0] = *MEMORY[0x1E4F2A1F0];
  v18 = [MEMORY[0x1E4F29128] UUID];
  v19 = [v18 UUIDString];
  v36[1] = *MEMORY[0x1E4F2A1F8];
  v37[0] = v19;
  v37[1] = &unk_1F17ECAE0;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  uint64_t v21 = *(void *)(a1 + 32);
  id v30 = v16;
  v22 = +[HDSeriesSampleEntity freezeSeriesWithIdentifier:v17 metadata:v20 profile:v21 error:&v30];
  id v23 = v30;

  if (v22)
  {
    uint64_t v24 = *(void *)(a1 + 48);
    v25 = objc_msgSend(v9, "UUID", context);
    if (v24) {
      objc_msgSend(*(id *)(v24 + 8), "hk_appendBytesWithUUID:", v25);
    }
  }
  else
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Cannot associate workout route due to lack of frozen identifier", buf, 2u);
    }
  }
}

void __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  [v4 doubleValue];
  CLLocationDegrees v6 = v5;
  v7 = [v3 objectAtIndexedSubscript:1];
  [v7 doubleValue];
  CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(v6, v8);

  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dateByAddingTimeInterval:1.0];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  v14 = [v3 objectAtIndexedSubscript:2];
  [v14 doubleValue];
  double v16 = v15;
  v17 = [v3 objectAtIndexedSubscript:3];
  [v17 doubleValue];
  double v19 = v18;
  v20 = [v3 objectAtIndexedSubscript:4];
  [v20 doubleValue];
  double v22 = v21;
  id v23 = [v3 objectAtIndexedSubscript:5];
  [v23 doubleValue];
  double v25 = v24;
  v26 = [v3 objectAtIndexedSubscript:6];

  [v26 doubleValue];
  id v28 = (id)objc_msgSend(v13, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9.latitude, v9.longitude, v16, v19, v22, v25, v27);

  [*(id *)(a1 + 32) addObject:v28];
}

@end