@interface NSMutableData(FIUIHeartRateData)
- (double)fiui_weightedAverageHeartRateWithStartDate:()FIUIHeartRateData endDate:;
- (uint64_t)fiui_appendHeartRate:()FIUIHeartRateData date:;
@end

@implementation NSMutableData(FIUIHeartRateData)

- (double)fiui_weightedAverageHeartRateWithStartDate:()FIUIHeartRateData endDate:
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 length];
  if ((v7 & 0xF) != 0)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x263F098C8];
    double v9 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      -[NSMutableData(FIUIHeartRateData) fiui_weightedAverageHeartRateWithStartDate:endDate:](v8);
    }
  }
  else
  {
    uint64_t v10 = v7;
    v38 = v6;
    unint64_t v11 = [a1 bytes];
    unint64_t v12 = v11 + v10;
    v13 = [MEMORY[0x263EFF9A0] dictionary];
    if (v11 < v11 + v10)
    {
      do
      {
        double v14 = *(double *)(v11 + 8);
        v15 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", *(double *)v11, v38);
        v16 = NSNumber;
        [v15 timeIntervalSinceDate:v39];
        v18 = [v16 numberWithDouble:floor(v17 / 60.0)];
        v19 = [v13 objectForKey:v18];
        if (!v19)
        {
          v19 = [MEMORY[0x263EFF9A0] dictionary];
        }
        objc_msgSend(v19, "fiui_incrementValueForKey:byValue:", @"totalBeats", v14);
        objc_msgSend(v19, "fiui_incrementValueForKey:byValue:", @"numberOfReadings", 1.0);
        [v13 setObject:v19 forKey:v18];

        v11 += 16;
      }
      while (v11 < v12);
    }
    id v6 = v38;
    objc_msgSend(v38, "timeIntervalSinceDate:", v39, v38);
    double v21 = v20;
    if ([v13 count])
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v22 = [v13 allValues];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v41;
        double v26 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v41 != v25) {
              objc_enumerationMutation(v22);
            }
            v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v29 = [v28 objectForKey:@"totalBeats"];
            [v29 doubleValue];
            double v31 = v30;

            v32 = [v28 objectForKey:@"numberOfReadings"];
            [v32 doubleValue];
            double v34 = v33;

            double v26 = v26 + v31 / v34;
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v24);
      }
      else
      {
        double v26 = 0.0;
      }

      double v9 = v26 / (double)(unint64_t)[v13 count];
    }
    else
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x263F098C8];
      double v9 = 0.0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        *(_DWORD *)buf = 134218240;
        uint64_t v45 = [v13 count];
        __int16 v46 = 2048;
        double v47 = v21 / 60.0;
        _os_log_impl(&dword_21E433000, v36, OS_LOG_TYPE_DEFAULT, "[WRKT] Not enough data to compute heart rate average. Received data for %lu out of %.2f minutes.", buf, 0x16u);
      }
    }
  }
  return v9;
}

- (uint64_t)fiui_appendHeartRate:()FIUIHeartRateData date:
{
  [a4 timeIntervalSinceReferenceDate];
  v8[0] = v6;
  *(double *)&v8[1] = a2;
  return [a1 appendBytes:v8 length:16];
}

- (void)fiui_weightedAverageHeartRateWithStartDate:()FIUIHeartRateData endDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "[FitnessUI] Heart rate data is in invalid format", v1, 2u);
}

@end