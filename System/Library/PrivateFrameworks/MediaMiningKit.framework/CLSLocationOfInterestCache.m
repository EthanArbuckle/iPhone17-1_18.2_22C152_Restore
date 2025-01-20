@interface CLSLocationOfInterestCache
- (CLSLocationOfInterestCache)initWithLocationCache:(id)a3;
- (CLSLocationOfInterestVisit)lastLocationOfInterestVisit;
- (NSDate)earliestVisitStartDate;
- (NSMutableDictionary)transitionsCache;
- (NSMutableDictionary)visitsCache;
- (NSMutableSet)allLocationsOfInterest;
- (NSMutableSet)allLocationsOfInterestTransitionIdentifiers;
- (NSMutableSet)homeLocations;
- (NSMutableSet)workLocations;
- (id)closestLocationOfInterestVisitToLocation:(id)a3 withinDistance:(double)a4 inDateInterval:(id)a5;
- (id)locationOfInterestAtLocation:(id)a3;
- (id)locationsOfInterestOfType:(int64_t)a3;
- (id)locationsOfInterestTransitionInDateInterval:(id)a3;
- (id)locationsOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4;
- (id)locationsOfInterestVisitsInDateInterval:(id)a3;
- (unint64_t)numberOfLocationsOfInterest;
- (unint64_t)numberOfLocationsOfInterestTransitions;
- (unint64_t)numberOfLocationsOfInterestVisits;
- (void)addLocationOfInterest:(id)a3;
- (void)addLocationOfInterestTransition:(id)a3;
- (void)setAllLocationsOfInterest:(id)a3;
- (void)setAllLocationsOfInterestTransitionIdentifiers:(id)a3;
- (void)setHomeLocations:(id)a3;
- (void)setTransitionsCache:(id)a3;
- (void)setVisitsCache:(id)a3;
- (void)setWorkLocations:(id)a3;
@end

@implementation CLSLocationOfInterestCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationOfInterestVisit, 0);
  objc_storeStrong((id *)&self->_earliestVisitStartDate, 0);
  objc_storeStrong((id *)&self->_workLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_allLocationsOfInterestTransitionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_transitionsCache, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
}

- (CLSLocationOfInterestVisit)lastLocationOfInterestVisit
{
  return (CLSLocationOfInterestVisit *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)earliestVisitStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)numberOfLocationsOfInterestVisits
{
  return self->_numberOfLocationsOfInterestVisits;
}

- (void)setWorkLocations:(id)a3
{
}

- (NSMutableSet)workLocations
{
  return self->_workLocations;
}

- (void)setHomeLocations:(id)a3
{
}

- (NSMutableSet)homeLocations
{
  return self->_homeLocations;
}

- (void)setAllLocationsOfInterestTransitionIdentifiers:(id)a3
{
}

- (NSMutableSet)allLocationsOfInterestTransitionIdentifiers
{
  return self->_allLocationsOfInterestTransitionIdentifiers;
}

- (void)setAllLocationsOfInterest:(id)a3
{
}

- (NSMutableSet)allLocationsOfInterest
{
  return self->_allLocationsOfInterest;
}

- (void)setTransitionsCache:(id)a3
{
}

- (NSMutableDictionary)transitionsCache
{
  return self->_transitionsCache;
}

- (void)setVisitsCache:(id)a3
{
}

- (NSMutableDictionary)visitsCache
{
  return self->_visitsCache;
}

- (unint64_t)numberOfLocationsOfInterestTransitions
{
  v2 = [(CLSLocationOfInterestCache *)self allLocationsOfInterestTransitionIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)locationsOfInterestTransitionInDateInterval:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = v3;
  v6 = [v5 startDate];
  uint64_t v7 = +[CLSCalendar validDateForDate:v6];

  v8 = [v5 endDate];
  v9 = +[CLSCalendar validDateForDate:v8];

  v28 = (void *)v7;
  v10 = +[CLSCalendar startOfDayForDate:v7];
  v11 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 compare:v9] == -1)
  {
    do
    {
      v13 = +[CLSCalendar components:28 fromDate:v10];
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", objc_msgSend(v13, "year"), objc_msgSend(v13, "month"), objc_msgSend(v13, "day"));
      [v11 addObject:v14];
      v12 = +[CLSCalendar dateByAddingDays:1 toDate:v10];

      v10 = v12;
    }
    while ([v12 compare:v9] == -1);
  }
  else
  {
    v12 = v10;
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v11;
  uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v29)
  {
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        v16 = [(NSMutableDictionary *)self->_transitionsCache objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              v22 = [v21 transitionInterval];
              int v23 = [v22 intersectsDateInterval:v5];

              if (v23) {
                [v4 addObject:v21];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v18);
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v29);
  }

  return v4;
}

- (void)addLocationOfInterestTransition:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  v6 = self->_allLocationsOfInterestTransitionIdentifiers;
  if (([(NSMutableSet *)v6 containsObject:v5] & 1) == 0)
  {
    [(NSMutableSet *)v6 addObject:v5];
    uint64_t v7 = [v4 transitionInterval];
    [v7 duration];
    if (v8 <= 31557600.0)
    {
      uint64_t v29 = v6;
      long long v30 = v5;
      v28 = v7;
      id v11 = v7;
      v12 = [v11 startDate];
      v13 = +[CLSCalendar validDateForDate:v12];

      v27 = v11;
      v14 = [v11 endDate];
      v15 = +[CLSCalendar validDateForDate:v14];

      v16 = +[CLSCalendar startOfDayForDate:v13];
      uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
      if ([v16 compare:v15] == -1)
      {
        long long v31 = v15;
        do
        {
          uint64_t v19 = +[CLSCalendar components:28 fromDate:v16];
          v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", objc_msgSend(v19, "year"), objc_msgSend(v19, "month"), objc_msgSend(v19, "day"));
          [v17 addObject:v20];
          uint64_t v18 = +[CLSCalendar dateByAddingDays:1 toDate:v16];

          v15 = v31;
          v16 = v18;
        }
        while ([v18 compare:v31] == -1);
      }
      else
      {
        uint64_t v18 = v16;
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v10 = v17;
      uint64_t v21 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v33 != v23) {
              objc_enumerationMutation(v10);
            }
            uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v26 = [(NSMutableDictionary *)self->_transitionsCache objectForKeyedSubscript:v25];
            if (!v26)
            {
              uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
              [(NSMutableDictionary *)self->_transitionsCache setObject:v26 forKeyedSubscript:v25];
            }
            [v26 addObject:v4];
          }
          uint64_t v22 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v22);
      }

      v6 = v29;
      id v5 = v30;
      uint64_t v7 = v28;
    }
    else
    {
      v9 = +[CLSLogging sharedLogging];
      v10 = [v9 loggingConnection];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v7;
        _os_log_error_impl(&dword_1D2150000, v10, OS_LOG_TYPE_ERROR, "Duration for location of interest transition %@ is too long, aborting.", buf, 0xCu);
      }
    }
  }
}

- (unint64_t)numberOfLocationsOfInterest
{
  v2 = [(CLSLocationOfInterestCache *)self allLocationsOfInterest];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)locationsOfInterestVisitsInDateInterval:(id)a3
{
  return [(CLSLocationOfInterestCache *)self locationsOfInterestVisitsAtLocation:0 inDateInterval:a3];
}

- (id)locationsOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v41 = [MEMORY[0x1E4F1CA80] set];
  id v7 = v6;
  double v8 = [v7 startDate];
  uint64_t v9 = +[CLSCalendar validDateForDate:v8];

  v10 = [v7 endDate];
  id v11 = +[CLSCalendar validDateForDate:v10];

  uint64_t v39 = (void *)v9;
  v12 = +[CLSCalendar startOfDayForDate:v9];
  v13 = [MEMORY[0x1E4F1CA48] array];
  if ([v12 compare:v11] == -1)
  {
    do
    {
      v15 = +[CLSCalendar components:28 fromDate:v12];
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", objc_msgSend(v15, "year"), objc_msgSend(v15, "month"), objc_msgSend(v15, "day"));
      [v13 addObject:v16];
      v14 = +[CLSCalendar dateByAddingDays:1 toDate:v12];

      v12 = v14;
    }
    while ([v14 compare:v11] == -1);
  }
  else
  {
    v14 = v12;
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v13;
  uint64_t v17 = (void *)v41;
  uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v47;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v18;
        uint64_t v19 = [(NSMutableDictionary *)self->_visitsCache objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * v18)];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v25 = [v24 visitInterval];
              int v26 = [v25 intersectsDateInterval:v7];

              if (v26)
              {
                if (v5)
                {
                  v27 = [v24 locationOfInterest];
                  v28 = v27;
                  if (v27)
                  {
                    uint64_t v29 = [v27 location];
                    [v29 distanceFromLocation:v5];
                    if (v29) {
                      BOOL v31 = v30 > 2.22044605e-16;
                    }
                    else {
                      BOOL v31 = 1;
                    }
                    if (!v31
                      || ([v28 placemarkLocationDistanceFromLocation:v5 locationCache:self->_locationCache], v32 <= 2.22044605e-16))
                    {
                      [v17 addObject:v24];
                    }
                  }
                  else
                  {
                    long long v33 = +[CLSLogging sharedLogging];
                    uint64_t v29 = [v33 loggingConnection];

                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138477827;
                      v51 = v24;
                      _os_log_error_impl(&dword_1D2150000, v29, OS_LOG_TYPE_ERROR, "LOI nil for visit %{private}@", buf, 0xCu);
                    }
                    uint64_t v17 = (void *)v41;
                  }
                }
                else
                {
                  [v17 addObject:v24];
                }
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v21);
        }

        uint64_t v18 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v37);
  }

  return v17;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(CLSLocationOfInterestCache *)self allLocationsOfInterest];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = 0;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v11 location];
        [v12 distanceFromLocation:v4];
        double v14 = v13;

        if (v14 <= 2.22044605e-16)
        {
          id v15 = v11;

          double v8 = v15;
        }
        [v11 placemarkLocationDistanceFromLocation:v4 locationCache:self->_locationCache];
        if (v16 <= 2.22044605e-16)
        {
          id v17 = v11;
          if (v17)
          {
            uint64_t v18 = v17;
            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    double v8 = 0;
  }
LABEL_15:

  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v8;
  }
  id v20 = v19;

  return v20;
}

- (id)closestLocationOfInterestVisitToLocation:(id)a3 withinDistance:(double)a4 inDateInterval:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [(CLSLocationOfInterestCache *)self locationsOfInterestVisitsInDateInterval:v9];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v31 = v9;
    v12 = 0;
    id v13 = 0;
    uint64_t v14 = *(void *)v34;
    double v15 = 1.79769313e308;
    double v16 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "locationOfInterest", v31);
        id v20 = [v19 location];
        [v20 distanceFromLocation:v8];
        if (v21 < v16)
        {
          double v22 = v21;
          id v23 = v18;
          long long v24 = v13;
          id v13 = v23;

          double v16 = v22;
        }
        [v19 placemarkLocationDistanceFromLocation:v8 locationCache:self->_locationCache];
        if (v25 < v15)
        {
          double v26 = v25;
          id v27 = v18;

          double v15 = v26;
          v12 = v27;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
    id v9 = v31;
    if (v12 && (v28 = v12, v15 - a4 <= 2.22044605e-16) || (id v29 = 0, v13) && (v28 = v13, v16 - a4 <= 2.22044605e-16)) {
      id v29 = v28;
    }
  }
  else
  {
    id v13 = 0;
    v12 = 0;
    id v29 = 0;
  }

  return v29;
}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  if (a3 == 1)
  {
    unint64_t v3 = [(CLSLocationOfInterestCache *)self workLocations];
    if (v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3
    || ([(CLSLocationOfInterestCache *)self homeLocations],
        (unint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_6:
    unint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  }
LABEL_7:
  return v3;
}

- (void)addLocationOfInterest:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 visits];
  if ([(NSMutableSet *)self->_allLocationsOfInterest containsObject:v4]) {
    goto LABEL_35;
  }
  self->_numberOfLocationsOfInterestVisits += [v5 count];
  [(NSMutableSet *)self->_allLocationsOfInterest addObject:v4];
  if (![v4 type])
  {
    uint64_t v6 = 48;
    goto LABEL_6;
  }
  if ([v4 type] == 1)
  {
    uint64_t v6 = 56;
LABEL_6:
    [*(id *)((char *)&self->super.isa + v6) addObject:v4];
  }
  long long v33 = v5;
  id v34 = v4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v5;
  uint64_t v37 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v52;
    location = (id *)&self->_earliestVisitStartDate;
    uint64_t v40 = 0;
    p_lastLocationOfInterestVisit = (id *)&self->_lastLocationOfInterestVisit;
    unint64_t v7 = 0x1E690D000uLL;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v51 + 1) + 8 * v8);
        uint64_t v10 = [v9 visitInterval];
        uint64_t v11 = [v10 startDate];
        v12 = [v10 endDate];
        if (!*location || [*location compare:v11] == 1) {
          objc_storeStrong(location, v11);
        }
        long long v45 = v10;
        uint64_t v46 = v8;
        long long v44 = v11;
        if (!*p_lastLocationOfInterestVisit || [v40 compare:v12] == -1)
        {
          objc_storeStrong(p_lastLocationOfInterestVisit, v9);
          id v13 = v12;

          uint64_t v40 = v13;
        }
        long long v43 = v12;
        uint64_t v14 = [v9 visitInterval];
        double v15 = *(void **)(v7 + 3864);
        double v16 = [v14 startDate];
        uint64_t v17 = [v15 validDateForDate:v16];

        uint64_t v18 = *(void **)(v7 + 3864);
        long long v42 = v14;
        uint64_t v19 = [v14 endDate];
        id v20 = [v18 validDateForDate:v19];

        uint64_t v41 = (void *)v17;
        double v21 = [*(id *)(v7 + 3864) startOfDayForDate:v17];
        double v22 = [MEMORY[0x1E4F1CA48] array];
        if ([v21 compare:v20] == -1)
        {
          do
          {
            long long v24 = +[CLSCalendar components:28 fromDate:v21];
            double v25 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", objc_msgSend(v24, "year"), objc_msgSend(v24, "month"), objc_msgSend(v24, "day"));
            [v22 addObject:v25];
            id v23 = +[CLSCalendar dateByAddingDays:1 toDate:v21];

            double v21 = v23;
          }
          while ([v23 compare:v20] == -1);
        }
        else
        {
          id v23 = v21;
        }

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v26 = v22;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v48 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              double v32 = [(NSMutableDictionary *)self->_visitsCache objectForKeyedSubscript:v31];
              if (!v32)
              {
                double v32 = [MEMORY[0x1E4F1CA48] array];
                [(NSMutableDictionary *)self->_visitsCache setObject:v32 forKeyedSubscript:v31];
              }
              [v32 addObject:v9];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v28);
        }

        uint64_t v8 = v46 + 1;
        unint64_t v7 = 0x1E690D000;
      }
      while (v46 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v37);
  }
  else
  {
    uint64_t v40 = 0;
  }

  id v5 = v33;
  id v4 = v34;
LABEL_35:
}

- (CLSLocationOfInterestCache)initWithLocationCache:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLSLocationOfInterestCache;
  uint64_t v6 = [(CLSLocationOfInterestCache *)&v21 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationCache, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visitsCache = v7->_visitsCache;
    v7->_visitsCache = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transitionsCache = v7->_transitionsCache;
    v7->_transitionsCache = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    allLocationsOfInterest = v7->_allLocationsOfInterest;
    v7->_allLocationsOfInterest = v12;

    uint64_t v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    allLocationsOfInterestTransitionIdentifiers = v7->_allLocationsOfInterestTransitionIdentifiers;
    v7->_allLocationsOfInterestTransitionIdentifiers = v14;

    double v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    homeLocations = v7->_homeLocations;
    v7->_homeLocations = v16;

    uint64_t v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    workLocations = v7->_workLocations;
    v7->_workLocations = v18;
  }
  return v7;
}

@end