@interface ATXPrivacyPreservingDates
- (double)convertDate:(id)a3 toDeltaFromSkyUpdateDate:(id)a4;
- (id)_reduceGranularityToDayOfYear:(id)a3;
- (id)reduceGranularityToWeekOfYear:(id)a3;
@end

@implementation ATXPrivacyPreservingDates

- (double)convertDate:(id)a3 toDeltaFromSkyUpdateDate:(id)a4
{
  id v6 = a4;
  v7 = [(ATXPrivacyPreservingDates *)self _reduceGranularityToDayOfYear:a3];
  v8 = [(ATXPrivacyPreservingDates *)self _reduceGranularityToDayOfYear:v6];

  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  return v10;
}

- (id)reduceGranularityToWeekOfYear:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v6 = [v5 components:540 fromDate:v4];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    objc_msgSend(v7, "setDay:", -objc_msgSend(v6, "weekday"));
    v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v9 = [v8 dateByAddingComponents:v7 toDate:v4 options:0];

    double v10 = [(ATXPrivacyPreservingDates *)self _reduceGranularityToDayOfYear:v9];
  }
  else
  {
    v11 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "ATXPrivacyPreservingDates: nil date passed into reduceGranularityToWeekOfYear", v13, 2u);
    }

    double v10 = 0;
  }

  return v10;
}

- (id)_reduceGranularityToDayOfYear:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  id v6 = [v5 components:28 fromDate:v4];

  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v8 = [v7 dateFromComponents:v6];

  return v8;
}

@end