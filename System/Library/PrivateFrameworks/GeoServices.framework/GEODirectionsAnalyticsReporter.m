@interface GEODirectionsAnalyticsReporter
+ (void)reportDirectionsAnalyticsForRequest:(uint64_t)a1;
@end

@implementation GEODirectionsAnalyticsReporter

+ (void)reportDirectionsAnalyticsForRequest:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (+[GEOPlatform isRunningInGeod])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: ! GEOPlatform.isRunningInGeod", v23, 2u);
    }
  }
  else
  {
    v3 = [v2 routeAttributes];
    char v4 = [v3 hasAutomobileOptions];

    if (v4)
    {
      uint64_t v5 = 37;
    }
    else
    {
      v6 = [v2 routeAttributes];
      char v7 = [v6 hasTransitOptions];

      if (v7)
      {
        uint64_t v5 = 40;
      }
      else
      {
        v8 = [v2 routeAttributes];
        char v9 = [v8 hasWalkingOptions];

        if (v9)
        {
          uint64_t v5 = 41;
        }
        else
        {
          v10 = [v2 routeAttributes];
          int v11 = [v10 hasCyclingOptions];

          if (v11)
          {
            v12 = [v2 routeAttributes];
            v13 = [v12 cyclingOptions];
            v14 = [v13 cyclingVehicleSpecifications];
            int v15 = [v14 isEbike];

            if (v15) {
              uint64_t v5 = 38;
            }
            else {
              uint64_t v5 = 36;
            }
          }
          else
          {
            uint64_t v5 = 0;
          }
        }
      }
    }
    v16 = [v2 originalWaypointRoute];
    int v17 = [v16 purpose];

    if (v17 == 12)
    {
      v18 = [v2 originalWaypointRoute];
      int v19 = [v18 creationMethod];

      if (v19 == 1)
      {
        uint64_t v5 = 219;
LABEL_19:
        v22 = [getGEOAPServiceManagerClass() sharedManager];
        [v22 reportDailyUsageCountType:v5];

        goto LABEL_20;
      }
      v20 = [v2 originalWaypointRoute];
      int v21 = [v20 creationMethod];

      if (v21 == 2)
      {
        uint64_t v5 = 218;
        goto LABEL_19;
      }
    }
    if (v5) {
      goto LABEL_19;
    }
  }
LABEL_20:
}

@end