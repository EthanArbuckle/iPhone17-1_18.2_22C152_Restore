@interface HKSleepStageDayAxis
- (HKSleepStageDayAxisDelegate)delegate;
- (id)_currentOrGregorianCalendar;
- (id)stringForDate:(id)a3 somnogramDateInterval:(id)a4;
- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5;
- (void)setDelegate:(id)a3;
@end

@implementation HKSleepStageDayAxis

- (id)_currentOrGregorianCalendar
{
  v3 = [(HKDateAxis *)self currentCalendar];
  v4 = [v3 calendarIdentifier];
  uint64_t v5 = *MEMORY[0x1E4F1C318];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1C318]]) {
    [(HKDateAxis *)self currentCalendar];
  }
  else {
  v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v5];
  }

  return v6;
}

- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E4F29FA0];
  v10 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
  {
    v20 = v10;
    v21 = objc_opt_class();
    id v22 = v21;
    v23 = [v8 description];
    int v29 = 138544130;
    v30 = v21;
    __int16 v31 = 2114;
    v32 = v23;
    __int16 v33 = 2048;
    int64_t v34 = a4;
    __int16 v35 = 2048;
    int64_t v36 = a5;
    _os_log_debug_impl(&dword_1E0B26000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Determining string for date %{public}@ zoom %ld labelType %ld", (uint8_t *)&v29, 0x2Au);
  }
  v11 = 0;
  if (a4 == 6 && a5 != 2)
  {
    v12 = [(HKSleepStageDayAxis *)self delegate];
    v13 = [v12 sleepDaySummaryForDate:v8];

    v14 = objc_msgSend(v13, "hkui_somnogramChartDateInterval");
    if (!v13)
    {
      v15 = [(HKSleepStageDayAxis *)self _currentOrGregorianCalendar];
      uint64_t v16 = objc_msgSend(v8, "hk_morningIndexWithCalendar:", v15);
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_sleepDayIntervalForMorningIndex:calendar:", v16, v15);

      v14 = (void *)v17;
    }
    v11 = [(HKSleepStageDayAxis *)self stringForDate:v8 somnogramDateInterval:v14];
    _HKInitializeLogging();
    os_log_t v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v24 = v18;
      v25 = objc_opt_class();
      id v26 = v25;
      v27 = [v8 description];
      v28 = [v13 description];
      int v29 = 138544130;
      v30 = v25;
      __int16 v31 = 2114;
      v32 = v11;
      __int16 v33 = 2114;
      int64_t v34 = (int64_t)v27;
      __int16 v35 = 2114;
      int64_t v36 = (int64_t)v28;
      _os_log_debug_impl(&dword_1E0B26000, v24, OS_LOG_TYPE_DEBUG, "[%{public}@] Returning date label: %{public}@ axis date: %{public}@ summary: %{public}@", (uint8_t *)&v29, 0x2Au);
    }
  }

  return v11;
}

- (id)stringForDate:(id)a3 somnogramDateInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:6];
  v9 = [(HKDateAxis *)self axisLabelIntervalComponentsForZoomLevelConfiguration:v8];
  uint64_t v10 = [v9 hour];

  [v8 canonicalSize];
  double v12 = v11 / ((double)v10 * 3600.0);
  v13 = [(HKDateAxis *)self currentCalendar];
  uint64_t v14 = [v13 component:32 fromDate:v7];

  [v6 duration];
  double v16 = v15 / (double)(uint64_t)v12;
  uint64_t v17 = [v6 startDate];

  os_log_t v18 = [v17 dateByAddingTimeInterval:v16 * (double)(v14 / v10)];

  v19 = HKLocalizedStringForDateAndTemplate(v18, 24);

  return v19;
}

- (HKSleepStageDayAxisDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSleepStageDayAxisDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end