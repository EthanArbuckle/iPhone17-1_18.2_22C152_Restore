@interface HDHRAFibBurdenNotificationModeDeterminer
- ($0AC6E346AE4835514AAA8AC86D8F4844)_dayIndexRangeFromSample:(id)a3;
- (BOOL)_isPreviousSampleSevenDaysBeforeCurrentSample:(id)a3 previousSample:(id)a4;
- (BOOL)_isSampleForPreviousCalendarWeek:(id)a3;
- (BOOL)_shouldShowNotificationWithEndWeekdayToFire:(int64_t)a3;
- (HDHRAFibBurdenNotificationModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4;
- (HDHRAFibBurdenNotificationModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4 dateGenerator:(id)a5;
- (id)_noDataNotificationWithFeatureStatus:(id)a3 onboardedWithinAnalysisInterval:(BOOL)a4;
- (id)_noNotification;
- (id)_notificationWithCurrentValue:(id)a3 errorOut:(id *)a4;
- (id)_previousSampleFromCurrentValue:(id)a3 error:(id *)a4;
- (id)notificationModeForCurrentValue:(id)a3 featureStatus:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 endWeekdayToFire:(int64_t)a6 error:(id *)a7;
- (id)notificationModeForCurrentValue:(id)a3 featureStatus:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 error:(id *)a6;
- (void)_extractFromSample:(id)a3 percentageValue:(id *)a4 isClamped:(id *)a5;
@end

@implementation HDHRAFibBurdenNotificationModeDeterminer

- (HDHRAFibBurdenNotificationModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4
{
  return [(HDHRAFibBurdenNotificationModeDeterminer *)self initWithProfile:a3 calendarCache:a4 dateGenerator:&__block_literal_global_14];
}

uint64_t __74__HDHRAFibBurdenNotificationModeDeterminer_initWithProfile_calendarCache___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] now];
}

- (HDHRAFibBurdenNotificationModeDeterminer)initWithProfile:(id)a3 calendarCache:(id)a4 dateGenerator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDHRAFibBurdenNotificationModeDeterminer;
  v11 = [(HDHRAFibBurdenNotificationModeDeterminer *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_calendarCache, a4);
    uint64_t v13 = MEMORY[0x1D943B130](v10);
    id dateGenerator = v12->_dateGenerator;
    v12->_id dateGenerator = (id)v13;
  }
  return v12;
}

- (id)notificationModeForCurrentValue:(id)a3 featureStatus:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(HDHRAFibBurdenNotificationModeDeterminer *)self notificationModeForCurrentValue:v11 featureStatus:v10 onboardedWithinAnalysisInterval:v7 endWeekdayToFire:HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire() error:a6];

  return v12;
}

- (id)notificationModeForCurrentValue:(id)a3 featureStatus:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5 endWeekdayToFire:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if ([(HDHRAFibBurdenNotificationModeDeterminer *)self _shouldShowNotificationWithEndWeekdayToFire:a6])
  {
    v14 = [v13 requirementsEvaluationByContext];
    v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F67CF8]];
    char v16 = [v15 areAllRequirementsSatisfied];

    if ((v16 & 1) == 0)
    {
      _HKInitializeLogging();
      v18 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[HDHRAFibBurdenNotificationModeDeterminer notificationModeForCurrentValue:featureStatus:onboardedWithinAnalysisInterval:endWeekdayToFire:error:]((uint64_t)self, v18);
      }
      goto LABEL_14;
    }
    if (HKHRAFibBurdenNotificationsEnabledWithFeatureStatus())
    {
      if (v12) {
        [(HDHRAFibBurdenNotificationModeDeterminer *)self _notificationWithCurrentValue:v12 errorOut:a7];
      }
      else {
      uint64_t v17 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _noDataNotificationWithFeatureStatus:v13 onboardedWithinAnalysisInterval:v9];
      }
      goto LABEL_15;
    }
    _HKInitializeLogging();
    v18 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      v23 = self;
      v19 = "[%{public}@] User has weekly notifications turned off, suppressing notification";
      goto LABEL_13;
    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      v23 = self;
      v19 = "[%{public}@] Not showing notification as it is after the cutoff day";
LABEL_13:
      _os_log_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 0xCu);
    }
  }
LABEL_14:

  uint64_t v17 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _noNotification];
LABEL_15:
  v20 = (void *)v17;

  return v20;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_dayIndexRangeFromSample:(id)a3
{
  calendarCache = self->_calendarCache;
  id v4 = a3;
  v5 = [v4 _timeZone];
  v6 = [(HKCalendarCache *)calendarCache calendarForTimeZone:v5];
  uint64_t v7 = objc_msgSend(v4, "hk_dayIndexRangeWithCalendar:", v6);
  uint64_t v9 = v8;

  int64_t v10 = v9 - 1;
  int64_t v11 = v7;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (BOOL)_shouldShowNotificationWithEndWeekdayToFire:(int64_t)a3
{
  v5 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  v6 = (*((void (**)(void))self->_dateGenerator + 2))();
  int64_t v7 = [v5 component:512 fromDate:v6];

  return v7 <= a3;
}

- (BOOL)_isSampleForPreviousCalendarWeek:(id)a3
{
  id dateGenerator = self->_dateGenerator;
  v5 = (void (*)(void *))dateGenerator[2];
  id v6 = a3;
  int64_t v7 = v5(dateGenerator);
  uint64_t v8 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  uint64_t v9 = HKHRAFibBurdenPreviousWeekDayIndexRange();
  uint64_t v11 = v10;

  uint64_t v12 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _dayIndexRangeFromSample:v6];
  uint64_t v14 = v13;

  return v9 == v12 && v11 == v14;
}

- (void)_extractFromSample:(id)a3 percentageValue:(id *)a4 isClamped:(id *)a5
{
  int64_t v7 = NSNumber;
  id v8 = a3;
  uint64_t v9 = [v8 quantity];
  [v9 _value];
  *a4 = [v7 numberWithDouble:v10 * 100.0];

  uint64_t v11 = NSNumber;
  id v13 = [v8 metadata];

  uint64_t v12 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2A1B8]];
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isEqual:", MEMORY[0x1E4F1CC38]));
  *a5 = (id)objc_claimAutoreleasedReturnValue();
}

- (id)_previousSampleFromCurrentValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  id v8 = [v6 startDate];
  uint64_t v9 = [v7 dateByAddingUnit:16 value:-1 toDate:v8 options:0];

  double v10 = HDSampleEntityPredicateForStartDate();
  uint64_t v11 = (void *)MEMORY[0x1E4F65BE8];
  uint64_t v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v14 = [v11 mostRecentSampleWithType:v12 profile:WeakRetained encodingOptions:0 predicate:v10 anchor:0 error:a4];

  if (v14
    && [(HDHRAFibBurdenNotificationModeDeterminer *)self _isPreviousSampleSevenDaysBeforeCurrentSample:v6 previousSample:v14])
  {
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)_isPreviousSampleSevenDaysBeforeCurrentSample:(id)a3 previousSample:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _dayIndexRangeFromSample:a3];
  uint64_t v9 = v8;
  uint64_t v10 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _dayIndexRangeFromSample:v6];
  uint64_t v12 = v11;

  return v7 - 7 == v10 && v9 == v12;
}

- (id)_noNotification
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F67DB0]) initWithType:0 shouldForwardToWatch:0 currentPercentage:0 currentValueClamped:0 currentValueDateInterval:0 currentValueUUID:0 previousPercentage:0 previousValueClamped:0 previousTimeZoneDiffersFromCurrent:0];

  return v2;
}

- (id)_noDataNotificationWithFeatureStatus:(id)a3 onboardedWithinAnalysisInterval:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    _HKInitializeLogging();
    v5 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = self;
      _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarded within analysis interval, not posting no data notification", buf, 0xCu);
    }

    id v6 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _noNotification];
  }
  else
  {
    uint64_t v7 = [a3 requirementsEvaluationByContext];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    uint64_t v9 = [v8 areAllRequirementsSatisfied];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F67DB0]) initWithType:3 shouldForwardToWatch:v9 currentPercentage:0 currentValueClamped:0 currentValueDateInterval:0 currentValueUUID:0 previousPercentage:0 previousValueClamped:0 previousTimeZoneDiffersFromCurrent:0];
  }

  return v6;
}

- (id)_notificationWithCurrentValue:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  if ([(HDHRAFibBurdenNotificationModeDeterminer *)self _isSampleForPreviousCalendarWeek:v6])
  {
    id v30 = 0;
    id v31 = 0;
    [(HDHRAFibBurdenNotificationModeDeterminer *)self _extractFromSample:v6 percentageValue:&v31 isClamped:&v30];
    id v27 = v31;
    id v26 = v30;
    uint64_t v7 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _previousSampleFromCurrentValue:v6 error:a4];
    uint64_t v24 = (void *)v7;
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v28 = 0;
      id v29 = 0;
      [(HDHRAFibBurdenNotificationModeDeterminer *)self _extractFromSample:v7 percentageValue:&v29 isClamped:&v28];
      id v9 = v29;
      id v25 = v28;
      uint64_t v10 = NSNumber;
      uint64_t v11 = [v6 _timeZone];
      uint64_t v12 = [v8 _timeZone];
      uint64_t v13 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isEqualToTimeZone:", v12) ^ 1);

      uint64_t v14 = 2;
    }
    else
    {
      id v9 = 0;
      id v25 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 1;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F67DB0]);
    id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
    v19 = [v6 startDate];
    v20 = [v6 endDate];
    v21 = (void *)[v18 initWithStartDate:v19 endDate:v20];
    int v22 = [v6 UUID];
    char v16 = (void *)[v17 initWithType:v14 shouldForwardToWatch:1 currentPercentage:v27 currentValueClamped:v26 currentValueDateInterval:v21 currentValueUUID:v22 previousPercentage:v9 previousValueClamped:v25 previousTimeZoneDiffersFromCurrent:v13];
  }
  else
  {
    _HKInitializeLogging();
    id v15 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[HDHRAFibBurdenNotificationModeDeterminer _notificationWithCurrentValue:errorOut:]((uint64_t)self, v15);
    }

    char v16 = [(HDHRAFibBurdenNotificationModeDeterminer *)self _noNotification];
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationModeForCurrentValue:(uint64_t)a1 featureStatus:(NSObject *)a2 onboardedWithinAnalysisInterval:endWeekdayToFire:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] Attempting to post notification for analysis when analysis is not allowed", (uint8_t *)&v2, 0xCu);
}

- (void)_notificationWithCurrentValue:(uint64_t)a1 errorOut:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] Notified sample created, but most recent sample is not for previous calendar week", (uint8_t *)&v2, 0xCu);
}

@end