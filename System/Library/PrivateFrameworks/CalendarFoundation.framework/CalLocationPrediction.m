@interface CalLocationPrediction
+ (id)predictedLocationOfInterestForEventTitle:(id)a3 eventLocation:(id)a4 calendarIdentifier:(id)a5 timeout:(unint64_t)a6 error:(id *)a7;
@end

@implementation CalLocationPrediction

+ (id)predictedLocationOfInterestForEventTitle:(id)a3 eventLocation:(id)a4 calendarIdentifier:(id)a5 timeout:(unint64_t)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = objc_msgSend(EKWeakLinkClass(@"RTRoutineManager", 0xAuLL), "defaultManager");
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__7;
  v43 = __Block_byref_object_dispose__7;
  id v44 = 0;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__7;
  v37 = __Block_byref_object_dispose__7;
  id v38 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke;
  v26[3] = &unk_1E56CE1C8;
  id v16 = v11;
  id v27 = v16;
  id v17 = v12;
  id v28 = v17;
  id v18 = v13;
  id v29 = v18;
  v31 = &v33;
  v32 = &v39;
  v19 = v15;
  v30 = v19;
  [v14 fetchPredictedLocationsOfInterestAssociatedToTitle:v16 location:v17 calendarIdentifier:v18 withHandler:v26];
  if (dispatch_group_wait(v19, a6))
  {
    v20 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v48 = v16;
      __int16 v49 = 2112;
      id v50 = v17;
      __int16 v51 = 2112;
      id v52 = v18;
      _os_log_error_impl(&dword_190D88000, v20, OS_LOG_TYPE_ERROR, "Error fetching locations of interest for title %@, location: %@, calendar: %@: Request timed out", buf, 0x20u);
    }

    if (a7)
    {
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v21 = [NSString stringWithFormat:@"Prediction timed out for title %@, location: %@, calendar: %@", v16, v17, v18];
      v46 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];

      *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CalLocationPredictionErrorDomain" code:0 userInfo:v22];
    }
  }
  else if (a7)
  {
    v23 = (void *)v34[5];
    if (v23) {
      *a7 = v23;
    }
  }
  id v24 = (id)v40[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v24;
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_3((void *)a1, v6, v7);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = v6;
    v10 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [v5 count];
    v10 = +[CalFoundationLogSubsystem defaultCategory];
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v12) {
        __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_2(v5, (void *)a1, v10);
      }

      uint64_t v13 = [v5 firstObject];
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
      v10 = *(NSObject **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else if (v12)
    {
      __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_1((void *)a1, v10);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "No locations of interest found for title %@, location: %@, calendar: %@", (uint8_t *)&v5, 0x20u);
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 count];
  uint64_t v6 = a2[4];
  uint64_t v7 = a2[5];
  uint64_t v8 = a2[6];
  int v9 = 134218754;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  uint64_t v16 = v8;
  _os_log_debug_impl(&dword_190D88000, a3, OS_LOG_TYPE_DEBUG, "%lu locations of interest found for title %@, location: %@, calendar: %@", (uint8_t *)&v9, 0x2Au);
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = [a2 localizedDescription];
  int v8 = 138413058;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  __int16 v15 = v7;
  _os_log_error_impl(&dword_190D88000, a3, OS_LOG_TYPE_ERROR, "Error fetching locations of interest for title %@, location: %@, calendar: %@: %@", (uint8_t *)&v8, 0x2Au);
}

@end