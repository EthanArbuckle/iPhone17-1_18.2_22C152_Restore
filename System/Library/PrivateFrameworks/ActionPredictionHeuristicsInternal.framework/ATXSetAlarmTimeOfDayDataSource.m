@interface ATXSetAlarmTimeOfDayDataSource
+ (id)medianFrom:(id)a3;
+ (id)timeOfDayFromDonations:(id)a3;
- (ATXSetAlarmTimeOfDayDataSource)initWithDevice:(id)a3;
- (id)_recentIntentDonationsForBundleId:(id)a3 limit:(unint64_t)a4;
- (void)alarmTimeOfDay:(id)a3;
@end

@implementation ATXSetAlarmTimeOfDayDataSource

- (ATXSetAlarmTimeOfDayDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSetAlarmTimeOfDayDataSource;
  v6 = [(ATXSetAlarmTimeOfDayDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)_recentIntentDonationsForBundleId:(id)a3 limit:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = BiomeLibrary();
  v8 = [v7 App];
  objc_super v9 = [v8 Intent];
  v10 = objc_msgSend(v9, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke;
  v21[3] = &unk_1E68A5690;
  id v22 = v5;
  id v11 = v5;
  v12 = [v10 filterWithIsIncluded:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_6;
  v18[3] = &unk_1E68A56B8;
  id v13 = v6;
  id v19 = v13;
  unint64_t v20 = a4;
  id v14 = (id)[v12 sinkWithCompletion:&__block_literal_global_12 shouldContinue:v18];

  v15 = v19;
  id v16 = v13;

  return v16;
}

uint64_t __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  v4 = [v3 bundleID];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_2_cold_1(v2, v4);
    }
  }
}

BOOL __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = [v3 eventBody];
    [v5 addObject:v6];
  }
  BOOL v7 = [*(id *)(a1 + 32) count] != *(void *)(a1 + 40);

  return v7;
}

+ (id)timeOfDayFromDonations:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 intentClass];
        int v13 = [v12 isEqualToString:@"MTCreateAlarmIntent"];

        if (v13)
        {
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          uint64_t v17 = 0;
          id v14 = [v11 absoluteTimestamp];
          [v4 getHour:&v19 minute:&v18 second:&v17 nanosecond:0 fromDate:v14];

          v15 = [NSNumber numberWithUnsignedInteger:3600 * v19 + 60 * v18 + v17];
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)medianFrom:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = [v3 sortedArrayUsingDescriptors:v5];

    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v6, "count") >> 1);
  }
  else
  {
    uint64_t v7 = &unk_1F27274E8;
  }

  return v7;
}

- (void)alarmTimeOfDay:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  if (ATXHeuristicCanLearnFromApp(&unk_1F27273B0))
  {
    uint64_t v5 = [(ATXSetAlarmTimeOfDayDataSource *)self _recentIntentDonationsForBundleId:@"com.apple.mobiletimer" limit:20];
    id v6 = +[ATXSetAlarmTimeOfDayDataSource timeOfDayFromDonations:v5];
    uint64_t v7 = +[ATXSetAlarmTimeOfDayDataSource medianFrom:v6];
    [v7 floatValue];
    float v9 = v8;
    [v7 floatValue];
    float v11 = v10;
    v12 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218496;
      unint64_t v14 = vcvtms_u32_f32(v9 / 3600.0);
      __int16 v15 = 2048;
      unint64_t v16 = vcvtms_u32_f32((float)(v11 - (float)(3600 * v14)) / 60.0);
      __int16 v17 = 2048;
      uint64_t v18 = [v6 count];
      _os_log_debug_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_DEBUG, "Median time to set alarm: %tu:%02tu (based on %tu donations)", (uint8_t *)&v13, 0x20u);
    }

    v4[2](v4, v7, 0);
  }
  else
  {
    v4[2](v4, &unk_1F27274E8, 0);
  }
}

- (void).cxx_destruct
{
}

void __74__ATXSetAlarmTimeOfDayDataSource__recentIntentDonationsForBundleId_limit___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Could not traverse intent stream to find recent intent donations: %@", (uint8_t *)&v4, 0xCu);
}

@end