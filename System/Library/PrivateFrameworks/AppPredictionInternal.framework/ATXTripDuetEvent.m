@interface ATXTripDuetEvent
- (ATXTripDuetEvent)initWithCurrentContextStoreValues;
- (ATXTripDuetEvent)initWithCurrentContextStoreValuesWithOriginLOI:(id)a3 ignoreBeforeDate:(id)a4;
- (ATXTripDuetEvent)initWithOrigin:(int)a3 destination:(int)a4 durationAtOrigin:(double)a5 startDate:(id)a6 endDate:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXTripDuetEvent:(id)a3;
- (double)durationAtOrigin;
- (id)convertToUpcomingCommuteEventWithWindowDuration:(double)a3;
- (id)description;
- (id)identifier;
- (int)destination;
- (int)origin;
- (int)rtLocationToBMSemanticLocation:(int64_t)a3;
@end

@implementation ATXTripDuetEvent

- (ATXTripDuetEvent)initWithOrigin:(int)a3 destination:(int)a4 durationAtOrigin:(double)a5 startDate:(id)a6 endDate:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)ATXTripDuetEvent;
  result = [(ATXDuetEvent *)&v11 initWithStartDate:a6 endDate:a7];
  if (result)
  {
    result->_origin = a3;
    result->_destination = a4;
    result->_durationAtOrigin = a5;
  }
  return result;
}

- (ATXTripDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  v4 = [MEMORY[0x1E4F935D0] sharedInstance];
  v5 = [v4 locationOfInterestAtCurrentLocation];

  v6 = [(ATXTripDuetEvent *)self initWithCurrentContextStoreValuesWithOriginLOI:v5 ignoreBeforeDate:v3];
  return v6;
}

- (ATXTripDuetEvent)initWithCurrentContextStoreValuesWithOriginLOI:(id)a3 ignoreBeforeDate:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F5B6A8] userContext];
  v9 = [MEMORY[0x1E4F5B6B8] keyPathForPredictedLocationOfInterestTransitions];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      if ([v11 count])
      {
        v12 = [v11 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v38 = v11;
          v14 = [v11 objectAtIndexedSubscript:0];
          v15 = [MEMORY[0x1E4F5B6B8] locationOfInterestTypeKey];
          v16 = [v14 objectForKeyedSubscript:v15];
          uint64_t v17 = [v16 integerValue];

          uint64_t v40 = [(ATXTripDuetEvent *)self rtLocationToBMSemanticLocation:v17];
          v18 = [MEMORY[0x1E4F5B6B8] transitionWithinTimeIntervalKey];
          v39 = v14;
          v19 = [v14 objectForKeyedSubscript:v18];
          [v19 doubleValue];
          double v21 = v20;

          v22 = [MEMORY[0x1E4F5B6B8] keyPathForPredictedLocationOfInterestTransitions];
          v23 = [v8 lastModifiedDateForContextualKeyPath:v22];

          v24 = [v23 dateByAddingTimeInterval:v21];
          if (v7
            && ([v7 laterDate:v24],
                id v25 = (id)objc_claimAutoreleasedReturnValue(),
                v25,
                v25 == v7))
          {
            v36 = __atxlog_handle_default();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v24;
              _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "Ignoring current predicted transition because expected commute date is in the past: %@", buf, 0xCu);
            }

            v29 = 0;
            id v11 = v38;
          }
          else
          {
            if (v6) {
              uint64_t v26 = -[ATXTripDuetEvent rtLocationToBMSemanticLocation:](self, "rtLocationToBMSemanticLocation:", [v6 type]);
            }
            else {
              uint64_t v26 = 0;
            }
            id v11 = v38;
            v35 = __atxlog_handle_default();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v42 = (void *)(int)v40;
              __int16 v43 = 2112;
              v44 = v24;
              _os_log_impl(&dword_1D0FA3000, v35, OS_LOG_TYPE_DEFAULT, "Current expected commute to %lu at %@", buf, 0x16u);
            }

            self = [(ATXTripDuetEvent *)self initWithOrigin:v26 destination:v40 durationAtOrigin:v24 startDate:v24 endDate:0.0];
            v29 = self;
          }

          goto LABEL_31;
        }
        v34 = __atxlog_handle_default();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:]();
        }

        v31 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v32 = *MEMORY[0x1E4F1C3B8];
        v33 = @"ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' contained no elements.";
      }
      else
      {
        v30 = __atxlog_handle_default();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:]();
        }

        v31 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v32 = *MEMORY[0x1E4F1C3B8];
        v33 = @"ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is an empty NSArray.";
      }
      [v31 raise:v32 format:v33];
      v29 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v28 = __atxlog_handle_default();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:].cold.4();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is not an NSArray."];
  }
  else
  {
    v27 = __atxlog_handle_default();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:]();
    }
  }
  v29 = 0;
LABEL_32:

  return v29;
}

- (int)rtLocationToBMSemanticLocation:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (id)convertToUpcomingCommuteEventWithWindowDuration:(double)a3
{
  double durationAtOrigin = self->_durationAtOrigin;
  if (durationAtOrigin <= a3) {
    double v5 = self->_durationAtOrigin;
  }
  else {
    double v5 = a3;
  }
  if (durationAtOrigin <= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = v5;
  }
  id v7 = [(ATXDuetEvent *)self startDate];
  v8 = [v7 dateByAddingTimeInterval:-v6];

  v9 = [ATXTripDuetEvent alloc];
  uint64_t v10 = [(ATXTripDuetEvent *)self origin];
  uint64_t v11 = [(ATXTripDuetEvent *)self destination];
  [(ATXTripDuetEvent *)self durationAtOrigin];
  double v13 = v12;
  v14 = [(ATXDuetEvent *)self startDate];
  v15 = [(ATXTripDuetEvent *)v9 initWithOrigin:v10 destination:v11 durationAtOrigin:v8 startDate:v14 endDate:v13];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXTripDuetEvent *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXTripDuetEvent *)self isEqualToATXTripDuetEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXTripDuetEvent:(id)a3
{
  id v4 = a3;
  int v5 = [(ATXTripDuetEvent *)self origin];
  if (v5 == [v4 origin]
    && (int v6 = -[ATXTripDuetEvent destination](self, "destination"), v6 == [v4 destination]))
  {
    id v7 = [(ATXDuetEvent *)self startDate];
    v8 = [v4 startDate];
    if ([v7 isEqualToDate:v8])
    {
      v9 = [(ATXDuetEvent *)self endDate];
      uint64_t v10 = [v4 endDate];
      if ([v9 isEqualToDate:v10])
      {
        [(ATXTripDuetEvent *)self durationAtOrigin];
        double v12 = v11;
        [v4 durationAtOrigin];
        BOOL v14 = v12 == v13;
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(ATXTripDuetEvent *)self origin];
  uint64_t v5 = [(ATXTripDuetEvent *)self destination];
  int v6 = [(ATXDuetEvent *)self startDate];
  id v7 = [(ATXDuetEvent *)self endDate];
  [(ATXTripDuetEvent *)self durationAtOrigin];
  v9 = (void *)[v3 initWithFormat:@"ATXTripDuetEvent origin: %lu, dest: %lu, startDate: %@, endDate: %@, durationAtOrigin: %f", v4, v5, v6, v7, v8];

  return v9;
}

- (id)identifier
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu to %lu", -[ATXTripDuetEvent origin](self, "origin"), -[ATXTripDuetEvent destination](self, "destination"));
  return v2;
}

- (int)origin
{
  return self->_origin;
}

- (int)destination
{
  return self->_destination;
}

- (double)durationAtOrigin
{
  return self->_durationAtOrigin;
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is nil.", v2, v3, v4, v5, v6);
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is an empty NSArray.", v2, v3, v4, v5, v6);
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' contained no elements.", v2, v3, v4, v5, v6);
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is not an NSArray.", v2, v3, v4, v5, v6);
}

@end