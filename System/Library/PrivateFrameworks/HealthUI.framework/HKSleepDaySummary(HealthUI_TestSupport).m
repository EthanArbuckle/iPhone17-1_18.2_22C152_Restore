@interface HKSleepDaySummary(HealthUI_TestSupport)
- (id)firstStartDateMatchingSleepValues:()HealthUI_TestSupport;
- (id)hkui_somnogramChartDateInterval;
- (id)lastEndDateMatchingSleepValues:()HealthUI_TestSupport;
- (void)hkui_durationForSleepCategoryValue:()HealthUI_TestSupport;
@end

@implementation HKSleepDaySummary(HealthUI_TestSupport)

- (void)hkui_durationForSleepCategoryValue:()HealthUI_TestSupport
{
  switch(a3)
  {
    case 0:
      a1 = (void *)[a1 inBedDuration];
      break;
    case 1:
      a1 = (void *)[a1 unspecifiedSleepDuration];
      break;
    case 2:
      a1 = (void *)[a1 awakeDuration];
      break;
    case 3:
      a1 = (void *)[a1 coreSleepDuration];
      break;
    case 4:
      a1 = (void *)[a1 deepSleepDuration];
      break;
    case 5:
      a1 = (void *)[a1 remSleepDuration];
      break;
    default:
      return a1;
  }
  return a1;
}

- (id)hkui_somnogramChartDateInterval
{
  [a1 sleepDuration];
  if (v2 == 0.0 && ([a1 inBedDuration], v3 == 0.0))
  {
    v4 = [a1 dateInterval];
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F3C1F4F8];
    if (([a1 hasSleepStageData] & 1) == 0) {
      [v5 addObject:&unk_1F3C21E68];
    }
    v6 = [a1 firstStartDateMatchingSleepValues:v5];
    v7 = [v6 dateByAddingTimeInterval:-300.0];

    v8 = [a1 lastEndDateMatchingSleepValues:v5];
    v9 = [v8 dateByAddingTimeInterval:300.0];

    v10 = [a1 calendar];
    v11 = objc_msgSend(v10, "hk_startOfHourForDate:addingHours:", v7, 0);

    id v12 = v9;
    v13 = [a1 calendar];
    uint64_t v14 = [v13 component:64 fromDate:v12];

    v15 = v12;
    if (v14 >= 1)
    {
      v16 = [a1 calendar];
      v15 = objc_msgSend(v16, "hk_startOfHourForDate:addingHours:", v12, 1);
    }
    if (v11 && v15)
    {
      [v15 timeIntervalSinceDate:v11];
      double v18 = v17 / 3600.0;
      if ((uint64_t)v18 <= 0) {
        uint64_t v19 = -(-(uint64_t)v18 & 3);
      }
      else {
        uint64_t v19 = (uint64_t)v18 & 3;
      }
      if (v19 >= 1)
      {
        uint64_t v20 = 4 - v19;
        double v21 = (double)(4 - v19) * 0.5;
        unint64_t v22 = vcvtmd_s64_f64(v21);
        uint64_t v23 = [v11 dateByAddingTimeInterval:(double)(uint64_t)floor(v21) * -3600.0];

        uint64_t v24 = [v15 dateByAddingTimeInterval:(double)(uint64_t)(v20 - v22) * 3600.0];

        v11 = (void *)v23;
        v15 = (void *)v24;
      }
      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v15];
    }
    else
    {
      uint64_t v25 = [a1 dateInterval];
    }
    v4 = (void *)v25;
  }
  return v4;
}

- (id)firstStartDateMatchingSleepValues:()HealthUI_TestSupport
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = [a1 periods];
  uint64_t v21 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v6 = *(void *)v28;
    unint64_t v22 = v5;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v5);
        }
        v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v9 = [v8 segments];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "category"));
              char v16 = [v4 containsObject:v15];

              if (v16)
              {
                double v18 = [v14 dateInterval];
                double v17 = [v18 startDate];

                v5 = v22;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        v5 = v22;
        uint64_t v6 = v20;
      }
      double v17 = 0;
      uint64_t v21 = [v22 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
  else
  {
    double v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)lastEndDateMatchingSleepValues:()HealthUI_TestSupport
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [a1 periods];
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  id v5 = 0;
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    unint64_t v6 = 0x1E4F28000uLL;
    id v29 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v30 = [v8 segments];
        uint64_t v9 = [v30 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v30);
              }
              v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v14 = objc_msgSend(*(id *)(v6 + 3792), "numberWithInteger:", objc_msgSend(v13, "category"));
              if (![v4 containsObject:v14]) {
                goto LABEL_17;
              }
              if (!v5)
              {

LABEL_16:
                uint64_t v14 = v5;
                id v5 = v13;
LABEL_17:

                continue;
              }
              v15 = [v13 dateInterval];
              char v16 = [v15 endDate];
              [v5 dateInterval];
              v18 = id v17 = v5;
              [v18 endDate];
              v20 = uint64_t v19 = v11;
              int v31 = objc_msgSend(v16, "hk_isAfterDate:", v20);

              uint64_t v11 = v19;
              id v5 = v17;

              id v4 = v29;
              unint64_t v6 = 0x1E4F28000;

              if (v31) {
                goto LABEL_16;
              }
            }
            uint64_t v10 = [v30 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }

  uint64_t v21 = [v5 dateInterval];
  [v21 endDate];
  v23 = unint64_t v22 = v5;

  return v23;
}

@end