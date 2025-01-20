@interface HKWorkout
@end

@implementation HKWorkout

BOOL __42__HKWorkout_FitnessUI__fiui_eventsOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

void __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a2);
  }
  unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v11 >= [*(id *)(a1 + 32) count])
  {
    [v7 timeIntervalSinceDate:v6];
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v12
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
  }
  unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v13 < [*(id *)(a1 + 32) count])
  {
    v61 = v63;
    while (1)
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v61);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v15 == [*(id *)(a1 + 32) count] - 1)
      {
        BOOL v16 = 1;
      }
      else
      {
        v17 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1];
        v18 = [v17 startDate];
        [v18 timeIntervalSinceReferenceDate];
        double v20 = v19;
        [v7 timeIntervalSinceReferenceDate];
        BOOL v16 = v20 > v21;
      }
      v22 = [v14 quantity];
      v23 = [MEMORY[0x263F0A830] meterUnit];
      [v22 doubleValueForUnit:v23];
      double v25 = v24;

      v26 = [v14 endDate];
      v27 = [v14 startDate];
      [v26 timeIntervalSinceDate:v27];
      double v29 = v28;

      v30 = [v14 startDate];
      uint64_t v31 = [v30 compare:*(void *)(a1 + 40)];

      if (v31 == -1)
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          _HKInitializeLogging();
          v32 = *MEMORY[0x263F09970];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
            __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_2(&v64, v65, v32);
          }
        }
        v33 = *(void **)(a1 + 40);
        v34 = [v14 endDate];
        uint64_t v35 = [v33 compare:v34];

        if (v35 == -1)
        {
          _HKInitializeLogging();
          v36 = *MEMORY[0x263F09970];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
            __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_1(&buf, v61, v36);
          }
        }
        v37 = [v14 endDate];
        [v37 timeIntervalSinceDate:*(void *)(a1 + 40)];
        double v39 = v38;
        v40 = [v14 endDate];
        v41 = [v14 startDate];
        [v40 timeIntervalSinceDate:v41];
        double v43 = v39 / v42;

        double v25 = v25 * v43;
        v44 = [v14 endDate];
        [v44 timeIntervalSinceDate:*(void *)(a1 + 40)];
        double v29 = v45;

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
      }
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v25
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                              + 24);
      if (v16) {
        break;
      }
      double v46 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      double v47 = *(double *)(a1 + 88);
      if (v46 >= v47)
      {
        double v48 = v46 - v47;
        double v49 = v29 * ((v46 - v47) / v25);
        v50 = [v14 endDate];
        [v50 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v51
                                                                    - v49
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);

        v52 = [[FIUIWorkoutSplit alloc] initWithDistance:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) - v48 duration:*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
        [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v52];
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v49;
        *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v48;
        v53 = [v14 endDate];
        uint64_t v54 = [v53 dateByAddingTimeInterval:-v49];
        uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 8);
        v56 = *(void **)(v55 + 40);
        *(void *)(v55 + 40) = v54;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

      unint64_t v57 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v57 >= [*(id *)(a1 + 32) count]) {
        goto LABEL_24;
      }
    }
    [v7 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v58
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    uint64_t v59 = *(void *)(*(void *)(a1 + 48) + 8);
    v60 = *(void **)(v59 + 40);
    *(void *)(v59 + 40) = 0;
  }
LABEL_24:
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

FIUIWorkoutSplit *__81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 metadata];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F3D148]];

  v5 = [v2 metadata];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F3D150]];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      __81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke_cold_1((uint64_t)v2, v8);
    }
    v17 = 0;
  }
  else
  {
    v9 = [FIUIWorkoutSplit alloc];
    uint64_t v10 = [MEMORY[0x263F0A830] meterUnit];
    [v6 doubleValueForUnit:v10];
    double v12 = v11;
    unint64_t v13 = [MEMORY[0x263F0A830] secondUnit];
    [v4 doubleValueForUnit:v13];
    double v15 = v14;
    BOOL v16 = [v2 dateInterval];
    v17 = [(FIUIWorkoutSplit *)v9 initWithDistance:v16 duration:v12 dateInterval:v15];
  }
  return v17;
}

FIUIWorkoutSplit *__58__HKWorkout_FIUISplitsAdditions__fiui_workoutCustomSplits__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 metadata];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F3D148]];

  v5 = [v2 metadata];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F3D150]];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      __81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke_cold_1((uint64_t)v2, v8);
    }
    v17 = 0;
  }
  else
  {
    v9 = [FIUIWorkoutSplit alloc];
    uint64_t v10 = [MEMORY[0x263F0A830] meterUnit];
    [v6 doubleValueForUnit:v10];
    double v12 = v11;
    unint64_t v13 = [MEMORY[0x263F0A830] secondUnit];
    [v4 doubleValueForUnit:v13];
    double v15 = v14;
    BOOL v16 = [v2 dateInterval];
    v17 = [(FIUIWorkoutSplit *)v9 initWithDistance:v16 duration:v12 dateInterval:v15];
  }
  return v17;
}

void __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "[FIUI] Sample cannot have end date and start date earlier than workout's start date", buf, 2u);
}

void __97__HKWorkout_FitnessUI__fiui_splitsFromDistanceSamples_distanceInMetersPerSplit_workoutStartDate___block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "[FIUI] Sample cannot have an earlier start date than workout's start date if it's not the first sample", buf, 2u);
}

void __81__HKWorkout_FIUISplitsAdditions__fiui_workoutSplitsForUserPreferredDistanceUnit___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "Skipping split event %@ because it's missing duration or distance", (uint8_t *)&v2, 0xCu);
}

@end