@interface HDHRAFibBurdenNotificationAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDHRAFibBurdenNotificationAnalyticsEvent)initWithNotificationMode:(id)a3 featureStatus:(id)a4 focusModeDeterminer:(id)a5 notificationsAuthorizedProvider:(id)a6;
- (HDHRAFibBurdenNotificationAnalyticsEvent)initWithNotificationMode:(id)a3 featureStatus:(id)a4 profile:(id)a5;
- (NSString)eventName;
- (id)_notificationTypeStringForType:(int64_t)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HDHRAFibBurdenNotificationAnalyticsEvent

- (HDHRAFibBurdenNotificationAnalyticsEvent)initWithNotificationMode:(id)a3 featureStatus:(id)a4 profile:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(HDHRAFibBurdenBiomeFocusModeDeterminer);
  v12 = [v8 notificationManager];

  v13 = [(HDHRAFibBurdenNotificationAnalyticsEvent *)self initWithNotificationMode:v10 featureStatus:v9 focusModeDeterminer:v11 notificationsAuthorizedProvider:v12];
  return v13;
}

- (HDHRAFibBurdenNotificationAnalyticsEvent)initWithNotificationMode:(id)a3 featureStatus:(id)a4 focusModeDeterminer:(id)a5 notificationsAuthorizedProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDHRAFibBurdenNotificationAnalyticsEvent;
  v15 = [(HDHRAFibBurdenNotificationAnalyticsEvent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationMode, a3);
    objc_storeStrong((id *)&v16->_featureStatus, a4);
    objc_storeStrong((id *)&v16->_focusModeDeterminer, a5);
    objc_storeStrong((id *)&v16->_notificationsAuthorizedProvider, a6);
  }

  return v16;
}

- (NSString)eventName
{
  return (NSString *)(id)*MEMORY[0x1E4F67D28];
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [v5 healthDataSource];
  id v48 = 0;
  id v8 = [v7 biologicalSexWithError:&v48];
  id v9 = v48;

  if (v9)
  {
    _HKInitializeLogging();
    id v10 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    id v11 = *MEMORY[0x1E4F296C8];
    uint64_t v12 = *MEMORY[0x1E4F29698];
    id v13 = v6;
    goto LABEL_7;
  }
  if (v8)
  {
    id v9 = HKAnalyticsPropertyValueForBiologicalSex();
    uint64_t v12 = *MEMORY[0x1E4F29698];
    id v13 = v6;
    id v11 = v9;
LABEL_7:
    [v13 setObject:v11 forKeyedSubscript:v12];
    goto LABEL_8;
  }
  _HKInitializeLogging();
  id v9 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[HDHRAFibBurdenNotificationAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]((uint64_t)self, v9, v41, v42, v43, v44, v45, v46);
  }
LABEL_8:

  id v14 = [v5 healthDataSource];
  v15 = [v5 environmentDataSource];
  v16 = [v15 currentDate];
  id v47 = 0;
  v17 = [v14 ageWithCurrentDate:v16 error:&v47];
  id v18 = v47;

  if (v18)
  {
    _HKInitializeLogging();
    v19 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenDailyAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]();
    }

    v20 = (void *)*MEMORY[0x1E4F29668];
  }
  else
  {
    v21 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BC88]];
    v20 = HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge();

    id v18 = v20;
    if (!v17) {
      goto LABEL_14;
    }
  }
  [v6 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F29688]];
  v20 = v18;
LABEL_14:

  v22 = [(HKFeatureStatus *)self->_featureStatus onboardingRecord];
  v23 = [v22 onboardingCompletion];

  if (v23)
  {
    [v23 version];
    v24 = HKHRAFibBurdenAnalyticsPropertyValueForVersion();
    [v6 setObject:v24 forKeyedSubscript:@"featureVersion"];
  }
  else
  {
    _HKInitializeLogging();
    v25 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[HDHRAFibBurdenNotificationAnalyticsEvent makeIHAGatedEventPayloadWithDataSource:error:]((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);
    }

    [v6 setObject:*MEMORY[0x1E4F296C8] forKeyedSubscript:@"featureVersion"];
  }
  v32 = [(HDHRAFibBurdenNotificationAnalyticsEvent *)self _notificationTypeStringForType:[(HKHRAFibBurdenNotificationMode *)self->_notificationMode type]];
  [v6 setObject:v32 forKeyedSubscript:@"notificationType"];

  v33 = [(HKHRAFibBurdenNotificationMode *)self->_notificationMode currentValueClamped];

  if (v33)
  {
    v34 = [(HKHRAFibBurdenNotificationMode *)self->_notificationMode currentValueClamped];
    [v6 setObject:v34 forKeyedSubscript:@"wasDataClamped"];
  }
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[HKHRAFibBurdenNotificationMode shouldForwardToWatch](self->_notificationMode, "shouldForwardToWatch"));
  [v6 setObject:v35 forKeyedSubscript:@"wasForwardedToWatch"];

  v36 = [(HKHRAFibBurdenNotificationMode *)self->_notificationMode previousTimeZoneDiffersFromCurrent];

  if (v36)
  {
    v37 = [(HKHRAFibBurdenNotificationMode *)self->_notificationMode previousTimeZoneDiffersFromCurrent];
    [v6 setObject:v37 forKeyedSubscript:@"wasPreviousValueInDifferentTimeZone"];
  }
  v38 = [(HDHRAFibBurdenNotificationAnalyticsEventFocusModeDeterminer *)self->_focusModeDeterminer isFocusModeOn];
  if (v38) {
    [v6 setObject:v38 forKeyedSubscript:@"isFocusModeOn"];
  }
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[HDHRAFibBurdenAnalyticsEventHealthAppNotificationsAuthorizedProvider areHealthNotificationsAuthorized](self->_notificationsAuthorizedProvider, "areHealthNotificationsAuthorized"));
  [v6 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F29690]];

  return v6;
}

- (id)_notificationTypeStringForType:(int64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v12 = @"insufficientData";
  }
  else if (a3 == 2)
  {
    uint64_t v12 = @"burdenPercentageWithPreviousValue";
  }
  else if (a3)
  {
    uint64_t v12 = @"burdenPercentageWithoutPreviousValue";
  }
  else
  {
    _HKInitializeLogging();
    id v5 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[HDHRAFibBurdenNotificationAnalyticsEvent _notificationTypeStringForType:]((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = (__CFString *)(id)*MEMORY[0x1E4F296C8];
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsAuthorizedProvider, 0);
  objc_storeStrong((id *)&self->_focusModeDeterminer, 0);
  objc_storeStrong((id *)&self->_featureStatus, 0);

  objc_storeStrong((id *)&self->_notificationMode, 0);
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makeIHAGatedEventPayloadWithDataSource:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_notificationTypeStringForType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end