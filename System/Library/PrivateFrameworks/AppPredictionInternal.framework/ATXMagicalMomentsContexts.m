@interface ATXMagicalMomentsContexts
+ (id)eventIdentifierPredicateForValue:(id)a3;
+ (id)getCurrentLOI;
+ (id)locationOfInterestForDate:(id)a3 dateIntervalForSearch:(id)a4;
+ (id)loiPredicateForUUIDString:(id)a3;
+ (id)partOfWeekPredicatesUsingStartDate:(BOOL)a3;
+ (id)timeOfDayPredicatesWithRequestedDurationInHours:(unint64_t)a3 shouldPredicateOnStartDate:(BOOL)a4;
+ (unint64_t)getMinTemporalDistanceFromDate:(id)a3 toVisitsToLOI:(id)a4;
+ (unint64_t)minDistanceFromDate:(id)a3 toDateRange:(_NSRange)a4;
@end

@implementation ATXMagicalMomentsContexts

+ (id)getCurrentLOI
{
  v2 = [MEMORY[0x1E4F935D0] sharedInstance];
  v3 = [v2 locationOfInterestAtCurrentLocation];

  return v3;
}

+ (unint64_t)minDistanceFromDate:(id)a3 toDateRange:(_NSRange)a4
{
  NSUInteger location = a4.location;
  NSUInteger v5 = a4.location + a4.length;
  [a3 timeIntervalSinceReferenceDate];
  unint64_t v7 = (unint64_t)v6;
  unint64_t v8 = (unint64_t)v6 - v5;
  if ((unint64_t)v6 < v5) {
    unint64_t v8 = 0;
  }
  BOOL v9 = location >= v7;
  unint64_t v10 = location - v7;
  if (v10 != 0 && v9) {
    return v10;
  }
  else {
    return v8;
  }
}

+ (unint64_t)getMinTemporalDistanceFromDate:(id)a3 toVisitsToLOI:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [a4 visits];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    unint64_t v11 = -1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) rangeValue];
        unint64_t v15 = objc_msgSend(a1, "minDistanceFromDate:toDateRange:", v6, v13, v14);
        if (v15 < v11) {
          unint64_t v11 = v15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v11 = -1;
  }

  return v11;
}

+ (id)locationOfInterestForDate:(id)a3 dateIntervalForSearch:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [MEMORY[0x1E4F935D0] sharedInstance];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__22;
  v23 = __Block_byref_object_dispose__22;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__ATXMagicalMomentsContexts_locationOfInterestForDate_dateIntervalForSearch___block_invoke;
  v15[3] = &unk_1E68ADBA0;
  id v9 = v5;
  id v16 = v9;
  long long v18 = &v19;
  uint64_t v10 = v8;
  long long v17 = v10;
  [v7 fetchLocationsOfInterestVisitedDuring:v6 handler:v15];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v10 timeoutSeconds:2.0])
  {
    unint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "LOI fetch near date timed out", (uint8_t *)&v14, 2u);
    }

    id v12 = 0;
  }
  else
  {
    id v12 = (id)v20[5];
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __77__ATXMagicalMomentsContexts_locationOfInterestForDate_dateIntervalForSearch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    unint64_t v7 = 900;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      unint64_t v10 = +[ATXMagicalMomentsContexts getMinTemporalDistanceFromDate:toVisitsToLOI:](ATXMagicalMomentsContexts, "getMinTemporalDistanceFromDate:toVisitsToLOI:", *(void *)(a1 + 32), v9, (void)v12);
      if (v10 < v7)
      {
        unint64_t v11 = v10;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v9);
        unint64_t v7 = v11;
        if (!v11) {
          break;
        }
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)timeOfDayPredicatesWithRequestedDurationInHours:(unint64_t)a3 shouldPredicateOnStartDate:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    if (a3 >= 0x18) {
      unint64_t v6 = 24;
    }
    else {
      unint64_t v6 = a3;
    }
    uint64_t v7 = 0x18 / v6;
    if ((v7 * v6) != 24)
    {
      uint64_t v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[ATXMagicalMomentsContexts timeOfDayPredicatesWithRequestedDurationInHours:shouldPredicateOnStartDate:](v8);
      }
    }
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    if (v5) {
      unint64_t v11 = @"startDateSecondsAfterMidnight";
    }
    else {
      unint64_t v11 = @"endDateSecondsAfterMidnight";
    }
    uint64_t v12 = 3600 * v6;
    uint64_t v13 = 3600 * v6;
    unint64_t v14 = v6;
    do
    {
      if (v10 % 0x18 >= v14 % 0x18) {
        objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %lu OR %K >= %lu", v11, v13 - 86400 * (v14 / 0x18), v11, v9 - 86400 * (v10 / 0x18));
      }
      else {
      long long v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %lu AND %K < %lu", v11, v9 - 86400 * (v10 / 0x18), v11, v13 - 86400 * (v14 / 0x18));
      }
      [v18 addObject:v15];

      v14 += v6;
      v13 += v12;
      v10 += v6;
      v9 += v12;
      --v7;
    }
    while (v7);
    id v16 = v18;
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v16;
}

+ (id)partOfWeekPredicatesUsingStartDate:(BOOL)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v3 = @"isStartDateOnWeekday";
  }
  else {
    id v3 = @"isEndDateOnWeekday";
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", v3);
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NO", v3);
  v8[0] = v4;
  v8[1] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

+ (id)eventIdentifierPredicateForValue:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"ATXMagicalMomentsContexts.m", 157, @"Invalid parameter not satisfying: %@", @"eventIdentifier" object file lineNumber description];
  }
  unint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier = %@", v5];

  return v6;
}

+ (id)loiPredicateForUUIDString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"ATXMagicalMomentsContexts.m", 163, @"Invalid parameter not satisfying: %@", @"uuidString" object file lineNumber description];
  }
  unint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"locationIdentifierUUIDString = %@", v5];

  return v6;
}

+ (void)timeOfDayPredicatesWithRequestedDurationInHours:(os_log_t)log shouldPredicateOnStartDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Attempted to create Time of Day predicate for number of hours that doesn't evenly split a day.", v1, 2u);
}

@end