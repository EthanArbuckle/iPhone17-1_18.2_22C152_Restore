@interface EKTravelEngineUtilities
+ (BOOL)date:(id)a3 representsApproachingDepartureDateForHypothesis:(id)a4;
+ (BOOL)date:(id)a3 representsImmediateDepartureForHypothesis:(id)a4;
+ (BOOL)date:(id)a3 representsLatenessForHypothesis:(id)a4;
+ (BOOL)travelStateIndicatesTravelingTowardDestination:(int64_t)a3;
+ (double)maximumAllowableTravelTime;
+ (double)minimumAllowableTravelTime;
+ (id)authorizationStatusAsString:(int)a3;
+ (id)cadRouteHypothesisForEKTravelEngineHypothesis:(id)a3;
+ (id)formattedLocationCoordinates:(id)a3;
+ (id)geoTrafficDensityAsString:(unint64_t)a3;
+ (id)geoTransportTypeAsString:(int)a3;
+ (int)geoTransportTypeForCalLocationRoutingMode:(int64_t)a3;
+ (int)geoTransportTypeForString:(id)a3;
+ (int64_t)geoRouteHypothesisTravelStateForString:(id)a3;
+ (unint64_t)geoTrafficDensityForString:(id)a3;
@end

@implementation EKTravelEngineUtilities

+ (BOOL)travelStateIndicatesTravelingTowardDestination:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)formattedLocationCoordinates:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  [v4 coordinate];
  uint64_t v6 = v5;
  [v4 coordinate];
  uint64_t v8 = v7;

  return (id)[v3 stringWithFormat:@"(%.4f, %.4f)", v6, v8];
}

+ (int64_t)geoRouteHypothesisTravelStateForString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKTravelEngineUtilities geoRouteHypothesisTravelStateForString:]();
    }
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"NotTraveling"])
  {
LABEL_7:
    int64_t v5 = 0;
    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"Traveling"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"TravelingToDestination"])
    {
      int64_t v5 = 2;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:@"TravelingTowardsDestination"])
    {
      int64_t v5 = 3;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:@"TravelingAwayFromDestination"])
    {
      int64_t v5 = 4;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:@"Arrived"])
    {
      int64_t v5 = 5;
      goto LABEL_8;
    }
    uint64_t v7 = EKTravelEngineLogHandle;
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Unknown travel state given: [%@].  Will not find a corresponding travel state.", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_7;
  }
  int64_t v5 = 1;
LABEL_8:

  return v5;
}

+ (id)geoTransportTypeAsString:(int)a3
{
  switch(a3)
  {
    case 0:
      id result = @"AUTOMOBILE";
      break;
    case 1:
      id result = @"TRANSIT";
      break;
    case 2:
      id result = @"WALKING";
      break;
    case 3:
      id result = @"BICYCLE";
      break;
    case 4:
      id result = @"UNKNOWN_TRANSPORT_TYPE";
      break;
    case 5:
      id result = @"FERRY";
      break;
    case 6:
      if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKTravelEngineUtilities geoTransportTypeAsString:]();
      }
      id result = 0;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

+ (int)geoTransportTypeForString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKTravelEngineUtilities geoTransportTypeForString:]();
    }
LABEL_6:
    int v5 = 4;
    goto LABEL_13;
  }
  if (([v3 isEqualToString:@"AUTOMOBILE"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"TRANSIT"])
    {
      int v5 = 1;
      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"WALKING"])
    {
      int v5 = 2;
      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"BICYCLE"])
    {
      int v5 = 3;
      goto LABEL_13;
    }
    if (([v4 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"FERRY"])
      {
        int v5 = 5;
        goto LABEL_13;
      }
      uint64_t v7 = EKTravelEngineLogHandle;
      if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Unknown transport type given: [%@].  Will not find a corresponding transport type.", (uint8_t *)&v8, 0xCu);
      }
    }
    goto LABEL_6;
  }
  int v5 = 0;
LABEL_13:

  return v5;
}

+ (id)geoTrafficDensityAsString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5B988F0[a3];
  }
}

+ (unint64_t)geoTrafficDensityForString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKTravelEngineUtilities geoTrafficDensityForString:]();
    }
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Light"])
  {
LABEL_7:
    unint64_t v5 = 0;
    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"Medium"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"Heavy"])
    {
      unint64_t v5 = 2;
      goto LABEL_8;
    }
    if ([v4 isEqualToString:@"ExtremelyHeavy"])
    {
      unint64_t v5 = 3;
      goto LABEL_8;
    }
    uint64_t v7 = EKTravelEngineLogHandle;
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Unknown traffic density given: [%@].  Will not find a corresponding traffic density.", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_7;
  }
  unint64_t v5 = 1;
LABEL_8:

  return v5;
}

+ (id)authorizationStatusAsString:(int)a3
{
  if (a3 > 4) {
    return @"Unknown status";
  }
  else {
    return off_1E5B98910[a3];
  }
}

+ (int)geoTransportTypeForCalLocationRoutingMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 4;
  }
  else {
    return dword_1A4F8FFB0[a3 - 1];
  }
}

+ (BOOL)date:(id)a3 representsApproachingDepartureDateForHypothesis:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 suggestedDepartureDate];
  [v6 timeIntervalSinceDate:v5];
  double v8 = v7;

  return v8 > 120.0;
}

+ (BOOL)date:(id)a3 representsLatenessForHypothesis:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 aggressiveDepartureDate];
  char v7 = [v5 CalIsAfterDate:v6];

  return v7;
}

+ (BOOL)date:(id)a3 representsImmediateDepartureForHypothesis:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [a1 date:v7 representsApproachingDepartureDateForHypothesis:v6];
  LOBYTE(a1) = [a1 date:v7 representsLatenessForHypothesis:v6];

  return (v8 | a1) ^ 1;
}

+ (double)maximumAllowableTravelTime
{
  return 12600.0;
}

+ (double)minimumAllowableTravelTime
{
  return 240.0;
}

+ (id)cadRouteHypothesisForEKTravelEngineHypothesis:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F569E8];
  id v4 = a3;
  id v22 = [v3 alloc];
  uint64_t v5 = [v4 transportType];
  id v6 = [v4 conservativeDepartureDate];
  [v4 conservativeTravelTime];
  double v8 = v7;
  v9 = [v4 suggestedDepartureDate];
  [v4 estimatedTravelTime];
  double v11 = v10;
  v12 = [v4 aggressiveDepartureDate];
  [v4 aggressiveTravelTime];
  double v14 = v13;
  v15 = [v4 routeName];
  uint64_t v16 = [v4 supportsLiveTraffic];
  uint64_t v17 = [v4 currentTrafficDensity];
  v18 = [v4 trafficDensityDescription];
  uint64_t v19 = [v4 travelState];

  v20 = (void *)[v22 initWithTransportType:v5 conservativeDepartureDate:v6 conservativeTravelTime:v9 suggestedDepartureDate:v12 estimatedTravelTime:v15 aggressiveDepartureDate:v16 aggressiveTravelTime:v8 routeName:v11 supportsLiveTraffic:v14 currentTrafficDensity:v17 trafficDensityDescription:v18 travelState:v19];

  return v20;
}

+ (void)geoRouteHypothesisTravelStateForString:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "nil 'string' given.  Will not find a corresponding travel state.", v2, v3, v4, v5, v6);
}

+ (void)geoTransportTypeAsString:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_ERROR, "RIDESHARE is unsupported in geoTransportTypeAsString. Returning nil.", v1, 2u);
}

+ (void)geoTransportTypeForString:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "nil 'string' given.  Will not find a corresponding transport type.", v2, v3, v4, v5, v6);
}

+ (void)geoTrafficDensityForString:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "nil 'string' given.  Will not find a corresponding traffic density.", v2, v3, v4, v5, v6);
}

@end