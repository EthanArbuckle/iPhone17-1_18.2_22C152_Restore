@interface ATXHeuristicCommuteToWork
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicCommuteToWork

- (id)permanentRefreshTriggers
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v2 = (void *)getATXUpcomingCommuteToWorkAnchorClass_softClass;
  uint64_t v15 = getATXUpcomingCommuteToWorkAnchorClass_softClass;
  if (!getATXUpcomingCommuteToWorkAnchorClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getATXUpcomingCommuteToWorkAnchorClass_block_invoke;
    v11[3] = &unk_1E68A4E08;
    v11[4] = &v12;
    __getATXUpcomingCommuteToWorkAnchorClass_block_invoke((uint64_t)v11);
    v2 = (void *)v13[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v12, 8);
  if (v3)
  {
    v4 = [ATXInformationHeuristicRefreshContextChangeTrigger alloc];
    v5 = [v3 keyPathForContextStore];
    v6 = [v3 predicateForContextStoreRegistration];
    v7 = [(ATXInformationHeuristicRefreshContextChangeTrigger *)v4 initWithCDContextualKeyPath:v5 predicate:v6 registrationIdentifier:@"commuteWork"];

    v8 = (void *)MEMORY[0x1D25F43D0]();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v7, 0);
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v9;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  ATXTripDuetEventClass = (objc_class *)getATXTripDuetEventClass();
  v5 = objc_opt_new();
  v6 = v5;
  if (!ATXTripDuetEventClass)
  {
    id v13 = v5;
    goto LABEL_34;
  }
  v7 = [v3 heuristicDevice];
  v8 = [v7 locationManager];

  v9 = [v8 getCurrentLocation];
  if (!v9)
  {
    uint64_t v14 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicCommuteToWork heuristicResultWithEnvironment:]();
    }

    id v13 = v6;
    goto LABEL_33;
  }
  v10 = [v8 locationOfInterestAtCurrentLocation];
  v11 = v10;
  if (!v10)
  {
    uint64_t v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicCommuteToWork heuristicResultWithEnvironment:]();
    }
    goto LABEL_13;
  }
  if (![v10 type])
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v11 coordinate];
    double v17 = v16;
    [v11 coordinate];
    v18 = objc_msgSend(v15, "initWithLatitude:longitude:", v17);
    [v9 distanceFromLocation:v18];
    double v20 = v19;
    if (v19 >= 500.0)
    {
      v30 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v38 = v20 / 1000.0;
        _os_log_impl(&dword_1D0F43000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToWork: No longer at cached loi. Distance is %.2f km", buf, 0xCu);
      }

      id v13 = v6;
      goto LABEL_31;
    }
    v21 = (void *)[[ATXTripDuetEventClass alloc] initWithCurrentContextStoreValuesWithOriginLOI:v11 ignoreBeforeDate:0];
    v22 = v21;
    if (v21)
    {
      if ([v21 origin] == 1 || objc_msgSend(v22, "destination") == 2)
      {
        v36 = v18;
        v23 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          double v24 = [v22 startDate];
          *(_DWORD *)buf = 138412290;
          double v38 = v24;
          _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToWork: Creating suggestion for expected trip at %@", buf, 0xCu);
        }
        v25 = [v22 startDate];
        v26 = [v25 dateByAddingTimeInterval:-3600.0];

        v27 = [v22 startDate];
        v28 = [v27 dateByAddingTimeInterval:1800.0];

        v29 = [v3 heuristicDevice];
        id v13 = +[ATXHeuristicCommuteWorkUtilities heuristicResultToWorkWithValidStartDate:v26 validEndDate:v28 heuristicDevice:v29];

        v18 = v36;
        goto LABEL_30;
      }
      v31 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&double v38 = (int)[v22 origin];
        __int16 v39 = 2048;
        uint64_t v40 = (int)[v22 destination];
        v32 = "ATXHeuristicCommuteToWork: Trip not from home to work, %lu -> %lu";
        v33 = v31;
        uint32_t v34 = 22;
        goto LABEL_28;
      }
    }
    else
    {
      v31 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "ATXHeuristicCommuteToWork: No upcoming trip";
        v33 = v31;
        uint32_t v34 = 2;
LABEL_28:
        _os_log_impl(&dword_1D0F43000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
      }
    }

    id v13 = v6;
LABEL_30:

LABEL_31:
    goto LABEL_32;
  }
  uint64_t v12 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToWork: Current loi is not type Home", buf, 2u);
  }
LABEL_13:

  id v13 = v6;
LABEL_32:

LABEL_33:
LABEL_34:

  return v13;
}

- (void)heuristicResultWithEnvironment:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "ATXHeuristicCommuteToWork: No current location", v2, v3, v4, v5, v6);
}

- (void)heuristicResultWithEnvironment:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "ATXHeuristicCommuteToWork: No current loi", v2, v3, v4, v5, v6);
}

@end