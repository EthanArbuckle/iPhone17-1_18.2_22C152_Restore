@interface HKSleepDaySummary(AggregationUtilities)
- (double)hui_durationOfSleep;
- (double)hui_startOfSleepOffset;
- (id)hui_endOfSleep;
- (id)hui_startOfSleep;
@end

@implementation HKSleepDaySummary(AggregationUtilities)

- (id)hui_startOfSleep
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [a1 periods];
  uint64_t v1 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    v3 = 0;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v6 = [v5 segments];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if ((unint64_t)([v11 category] - 1) <= 4)
              {
                v12 = [v11 dateInterval];
                v13 = [v12 startDate];
                uint64_t v14 = HKDateMin();

                v3 = (void *)v14;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)hui_endOfSleep
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v1 = [a1 periods];
  uint64_t v2 = [v1 reverseObjectEnumerator];
  v3 = [v2 allObjects];

  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v9 = [v8 segments];
        v10 = [v9 reverseObjectEnumerator];
        v11 = [v10 allObjects];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              if ((unint64_t)([v16 category] - 1) <= 4)
              {
                uint64_t v17 = [v16 dateInterval];
                long long v18 = [v17 endDate];
                uint64_t v19 = HKDateMax();

                v6 = (void *)v19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v13);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)hui_durationOfSleep
{
  uint64_t v2 = objc_msgSend(a1, "hui_startOfSleep");
  v3 = objc_msgSend(a1, "hui_endOfSleep");
  uint64_t v4 = v3;
  double v5 = 0.0;
  if (v2 && v3)
  {
    [v3 timeIntervalSinceDate:v2];
    double v5 = v6;
  }

  return v5;
}

- (double)hui_startOfSleepOffset
{
  uint64_t v2 = [a1 dateInterval];
  v3 = [v2 startDate];

  uint64_t v4 = objc_msgSend(a1, "hui_startOfSleep");
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;

  return v6;
}

@end