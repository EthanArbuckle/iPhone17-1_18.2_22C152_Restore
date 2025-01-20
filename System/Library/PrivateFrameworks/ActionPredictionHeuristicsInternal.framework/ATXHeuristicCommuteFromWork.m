@interface ATXHeuristicCommuteFromWork
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicCommuteFromWork

- (id)permanentRefreshTriggers
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v2 = (void *)getATXUpcomingCommuteFromWorkAnchorClass_softClass;
  uint64_t v15 = getATXUpcomingCommuteFromWorkAnchorClass_softClass;
  if (!getATXUpcomingCommuteFromWorkAnchorClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getATXUpcomingCommuteFromWorkAnchorClass_block_invoke;
    v11[3] = &unk_1E68A4E08;
    v11[4] = &v12;
    __getATXUpcomingCommuteFromWorkAnchorClass_block_invoke((uint64_t)v11);
    v2 = (void *)v13[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v12, 8);
  if (v3)
  {
    v4 = [ATXInformationHeuristicRefreshContextChangeTrigger alloc];
    v5 = [v3 keyPathForContextStore];
    v6 = [v3 predicateForContextStoreRegistration];
    v7 = [(ATXInformationHeuristicRefreshContextChangeTrigger *)v4 initWithCDContextualKeyPath:v5 predicate:v6 registrationIdentifier:@"commuteHome"];

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
    id v27 = v5;
    goto LABEL_34;
  }
  v7 = [v3 heuristicDevice];
  v8 = [v7 locationManager];

  v9 = [v8 getCurrentLocation];
  if (!v9)
  {
    v28 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicCommuteFromWork heuristicResultWithEnvironment:]();
    }

    id v27 = v6;
    goto LABEL_33;
  }
  v10 = [v8 locationOfInterestAtCurrentLocation];
  v11 = v10;
  if (v10)
  {
    if ([v10 type] == 1)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [v11 coordinate];
      double v14 = v13;
      [v11 coordinate];
      uint64_t v15 = objc_msgSend(v12, "initWithLatitude:longitude:", v14);
      [v9 distanceFromLocation:v15];
      double v17 = v16;
      if (v16 >= 500.0)
      {
        v30 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v38 = v17 / 1000.0;
          _os_log_impl(&dword_1D0F43000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToHome: No longer at cached loi. Distance is %.2f km", buf, 0xCu);
        }

        id v27 = v6;
        goto LABEL_31;
      }
      v18 = (void *)[[ATXTripDuetEventClass alloc] initWithCurrentContextStoreValuesWithOriginLOI:v11 ignoreBeforeDate:0];
      v19 = v18;
      if (v18)
      {
        if ([v18 origin] == 2 || objc_msgSend(v19, "destination") == 1)
        {
          v36 = v15;
          v20 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            double v21 = [v19 startDate];
            *(_DWORD *)buf = 138412290;
            double v38 = v21;
            _os_log_impl(&dword_1D0F43000, v20, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToHome: Creating suggestion for expected trip at %@", buf, 0xCu);
          }
          v22 = [v19 startDate];
          v23 = [v22 dateByAddingTimeInterval:-3600.0];

          v24 = [v19 startDate];
          v25 = [v24 dateByAddingTimeInterval:1800.0];

          v26 = [v3 heuristicDevice];
          id v27 = +[ATXHeuristicCommuteHomeUtilities heuristicResultToHomeWithValidStartDate:v23 validEndDate:v25 heuristicDevice:v26];

          uint64_t v15 = v36;
          goto LABEL_30;
        }
        v31 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&double v38 = (int)[v19 origin];
          __int16 v39 = 2048;
          uint64_t v40 = (int)[v19 destination];
          v32 = "ATXHeuristicCommuteToHome: Trip not from work to home, %lu -> %lu";
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
          v32 = "ATXHeuristicCommuteToHome: No upcoming trip";
          v33 = v31;
          uint32_t v34 = 2;
LABEL_28:
          _os_log_impl(&dword_1D0F43000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
        }
      }

      id v27 = v6;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    v29 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v29, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToHome: Current loi is not type Work", buf, 2u);
    }
  }
  else
  {
    v29 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicCommuteFromWork heuristicResultWithEnvironment:]();
    }
  }

  id v27 = v6;
LABEL_32:

LABEL_33:
LABEL_34:

  return v27;
}

- (void)heuristicResultWithEnvironment:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "ATXHeuristicCommuteToHome: No current location", v2, v3, v4, v5, v6);
}

- (void)heuristicResultWithEnvironment:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "ATXHeuristicCommuteToHome: No current loi", v2, v3, v4, v5, v6);
}

@end