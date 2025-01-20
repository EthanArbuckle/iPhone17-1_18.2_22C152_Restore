@interface HDHealthRecordsAPIReminderRegistry
+ (void)initialize;
- (BOOL)_queue_deregisterAppWithBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_queue_isAnyReminderInFlight;
- (BOOL)_queue_shouldDropUnlimitedAuthorizationModeReminder:(id)a3;
- (BOOL)_readAuthorizationAllowedForAnyTypeInRecordsByType:(id)a3;
- (HDHealthRecordsAPIReminderRegistry)init;
- (HDHealthRecordsAPIReminderRegistry)initWithProfileExtension:(id)a3;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDProfile)profile;
- (HDXPCScheduler)triggerScheduler;
- (NSMutableDictionary)pendingReminderIDsToReminders;
- (NSNumber)_unitTesting_deferralPeriodOverride;
- (NSNumber)_unitTesting_schedulerGracePeriodOverride;
- (NSNumber)_unitTesting_throttlingIntervalOverride;
- (OS_dispatch_queue)queue;
- (_HDHealthRecordsAPIReminderRegistryEventListener)_unitTesting_testingEventListener;
- (double)_timeIntervalForDefaultsKey:(id)a3 fallbackInterval:(double)a4;
- (double)deferralPeriod;
- (double)schedulerGracePeriod;
- (double)throttlingInterval;
- (id)_criteriaForFirstUnlockActivity;
- (id)_criteriaForFirstUnlockActivityCompleted;
- (id)_eligibilityStartDateAfterPostedReminder:(id)a3;
- (id)_eligibilityStartDateForUnpostedReminder:(id)a3;
- (id)_newQueue;
- (id)_queue_firstEligibleReminderAfterDate:(id)a3;
- (id)_queue_nextEligibleFireDate;
- (int64_t)_authorizationModeForRecordsByType:(id)a3;
- (void)_applicationsUninstalledNotification:(id)a3;
- (void)_checkInForFirstUnlockActivity;
- (void)_didProcessPendingReminderID:(id)a3 transaction:(id)a4;
- (void)_displayStopAlertForPendingReminderID:(id)a3 transaction:(id)a4 title:(id)a5 body:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8;
- (void)_displayUnlimitedAuthorizationModeConfirmationForPendingReminderID:(id)a3 transaction:(id)a4 reminder:(id)a5;
- (void)_firePendingReminderIfEligible;
- (void)_handleHomescreenUnlockedNotification:(id)a3;
- (void)_handleUserNotificationResponse:(int64_t)a3 pendingReminderID:(id)a4 transaction:(id)a5;
- (void)_queue_dropReminder:(id)a3;
- (void)_queue_firePendingReminderIfEligibleUsingPendingReminderID:(id)a3 transaction:(id)a4;
- (void)_queue_handleUserNotificationResponse:(int64_t)a3 pendingReminderID:(id)a4 transaction:(id)a5;
- (void)_queue_performUserActionForReminder:(id)a3 userResponse:(int64_t)a4;
- (void)_queue_scheduleFireOnHomescreenUnlockIfEligibleWithNow:(id)a3;
- (void)_queue_scheduleNextTriggerWithNow:(id)a3;
- (void)_queue_scheduleTriggers;
- (void)_queue_startListeningForHomescreenUnlockNotifications;
- (void)_queue_stopListeningForHomescreenUnlockNotifications;
- (void)_scheduleTriggers;
- (void)_showClinicalAPISettingsForAppSource:(id)a3;
- (void)_startObservingApplicationsUninstalledNotification;
- (void)_unitTesting_setDeferralPeriodOverride:(double)a3;
- (void)_unitTesting_setSchedulerGracePeriodOverride:(double)a3;
- (void)_unitTesting_setTestingEventListener:(id)a3;
- (void)_unitTesting_setThrottlingIntervalOverride:(double)a3;
- (void)deregisterAppSourceFromUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4;
- (void)registerAppSourceForUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4;
- (void)set_unitTesting_deferralPeriodOverride:(id)a3;
- (void)set_unitTesting_schedulerGracePeriodOverride:(id)a3;
- (void)set_unitTesting_throttlingIntervalOverride:(id)a3;
@end

@implementation HDHealthRecordsAPIReminderRegistry

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    v6[0] = @"HealthRecordsAPIReminderDeferralPeriod";
    v6[1] = @"HealthRecordsAPIReminderThrottlingInterval";
    v7[0] = &off_11D820;
    v7[1] = &off_11D830;
    v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
    [v4 registerDefaults:v5];
  }
}

- (HDHealthRecordsAPIReminderRegistry)init
{
  id v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDHealthRecordsAPIReminderRegistry)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDHealthRecordsAPIReminderRegistry;
  v5 = [(HDHealthRecordsAPIReminderRegistry *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    v7 = [v4 profile];
    objc_storeWeak((id *)&v6->_profile, v7);

    v8 = [(HDHealthRecordsAPIReminderRegistry *)v6 _newQueue];
    queue = v6->_queue;
    v6->_queue = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingReminderIDsToReminders = v6->_pendingReminderIDsToReminders;
    v6->_pendingReminderIDsToReminders = v10;

    objc_initWeak(&location, v6);
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_9421C;
    v18 = &unk_1149B0;
    objc_copyWeak(&v19, &location);
    uint64_t v12 = +[HDXPCScheduler schedulerWithEventNamed:@"HDHealthRecordsAPIReminderRegistry-Trigger" runBlock:&v15];
    triggerScheduler = v6->_triggerScheduler;
    v6->_triggerScheduler = (HDXPCScheduler *)v12;

    [(HDHealthRecordsAPIReminderRegistry *)v6 _startObservingApplicationsUninstalledNotification];
    [(HDHealthRecordsAPIReminderRegistry *)v6 _checkInForFirstUnlockActivity];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_scheduleTriggers
{
  id v3 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"ScheduleTriggers"];
  v5 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_9433C;
  v7[3] = &unk_112318;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (id)_newQueue
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_eligibilityStartDateAfterPostedReminder:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && ([v5 wasPosted] & 1) == 0)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 132, @"Invalid parameter not satisfying: %@", @"postedReminder == nil || postedReminder.wasPosted == YES" object file lineNumber description];
  }
  v7 = [v6 postDate];
  [(HDHealthRecordsAPIReminderRegistry *)self throttlingInterval];
  id v8 = objc_msgSend(v7, "dateByAddingTimeInterval:");

  return v8;
}

- (id)_eligibilityStartDateForUnpostedReminder:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 wasPosted])
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 137, @"Invalid parameter not satisfying: %@", @"unpostedReminder == nil || unpostedReminder.wasPosted == NO" object file lineNumber description];
  }
  v7 = [v6 creationDate];
  [(HDHealthRecordsAPIReminderRegistry *)self deferralPeriod];
  id v8 = objc_msgSend(v7, "dateByAddingTimeInterval:");

  return v8;
}

- (void)_queue_scheduleTriggers
{
  id v3 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSDate);
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B3F6C();
  }
  [(HDHealthRecordsAPIReminderRegistry *)self _queue_scheduleNextTriggerWithNow:v4];
  [(HDHealthRecordsAPIReminderRegistry *)self _queue_scheduleFireOnHomescreenUnlockIfEligibleWithNow:v4];
}

- (void)_queue_scheduleNextTriggerWithNow:(id)a3
{
  id v11 = a3;
  id v4 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HDHealthRecordsAPIReminderRegistry *)self triggerScheduler];
  [v5 unschedule];
  id v6 = [(HDHealthRecordsAPIReminderRegistry *)self _queue_nextEligibleFireDate];
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "hk_isBeforeOrEqualToDate:", v11) & 1) == 0)
  {
    [v7 timeIntervalSinceDate:v11];
    double v9 = v8;
    [(HDHealthRecordsAPIReminderRegistry *)self schedulerGracePeriod];
    [v5 scheduleWithInterval:v9 gracePeriod:v10];
  }
}

- (void)_queue_scheduleFireOnHomescreenUnlockIfEligibleWithNow:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v5);

  [(HDHealthRecordsAPIReminderRegistry *)self _queue_stopListeningForHomescreenUnlockNotifications];
  id v6 = [(HDHealthRecordsAPIReminderRegistry *)self _queue_firstEligibleReminderAfterDate:v4];

  if (v6)
  {
    [(HDHealthRecordsAPIReminderRegistry *)self _queue_startListeningForHomescreenUnlockNotifications];
  }
}

- (id)_queue_nextEligibleFireDate
{
  id v3 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  id v17 = 0;
  id v5 = +[HDClinicalAPIReminderEntity lastPostedReminderWithProfile:v4 error:&v17];
  id v6 = v17;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {

    id v16 = 0;
    double v9 = +[HDClinicalAPIReminderEntity nextScheduledReminderWithProfile:v4 error:&v16];
    id v10 = v16;
    v7 = v10;
    if (v9 || !v10)
    {
      if (v9)
      {
        v13 = [(HDHealthRecordsAPIReminderRegistry *)self _eligibilityStartDateAfterPostedReminder:v5];
        v14 = [(HDHealthRecordsAPIReminderRegistry *)self _eligibilityStartDateForUnpostedReminder:v9];
        uint64_t v12 = HKDateMax();

LABEL_16:
        goto LABEL_17;
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B403C();
      }
    }
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
    sub_B3FD4();
  }
  uint64_t v12 = 0;
LABEL_17:

  return v12;
}

- (id)_queue_firstEligibleReminderAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  v7 = [(HDHealthRecordsAPIReminderRegistry *)self _queue_nextEligibleFireDate];
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    sub_B40A4();
    if (!v7) {
      goto LABEL_4;
    }
  }
  else if (!v7)
  {
LABEL_4:
    _HKInitializeLogging();
    BOOL v8 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Deferring any pending CHR API reminders.", buf, 2u);
    }
    id v9 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "hk_isAfterDate:", v4)) {
    goto LABEL_4;
  }
  id v14 = 0;
  id v10 = +[HDClinicalAPIReminderEntity nextScheduledReminderWithProfile:v6 error:&v14];
  id v11 = v14;
  uint64_t v12 = v11;
  if (v10 || !v11)
  {
    id v9 = v10;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B403C();
    }
    id v9 = 0;
  }

LABEL_14:

  return v9;
}

- (void)_queue_dropReminder:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  id v10 = 0;
  unsigned __int8 v7 = +[HDClinicalAPIReminderEntity deleteReminder:v4 profile:v6 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B410C();
    }
  }
  id v9 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_testingEventListener];
  [v9 droppedReminder:v4];
}

- (BOOL)_queue_isAnyReminderInFlight
{
  id v3 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HDHealthRecordsAPIReminderRegistry *)self pendingReminderIDsToReminders];
  LOBYTE(v3) = [v4 count] != 0;

  return (char)v3;
}

- (void)_firePendingReminderIfEligible
{
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B41DC();
  }
  id v3 = objc_alloc_init((Class)NSUUID);
  id v4 = [v3 UUIDString];
  id v5 = +[HDDaemonTransaction transactionWithOwner:self activityName:v4];

  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B4174();
  }
  id v6 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_94D40;
  block[3] = &unk_1122A0;
  block[4] = self;
  id v10 = v3;
  id v11 = v5;
  id v7 = v5;
  id v8 = v3;
  dispatch_async(v6, block);
}

- (void)_queue_firePendingReminderIfEligibleUsingPendingReminderID:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([(HDHealthRecordsAPIReminderRegistry *)self _queue_isAnyReminderInFlight])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B4210();
    }
    [(HDHealthRecordsAPIReminderRegistry *)self _didProcessPendingReminderID:v6 transaction:v7];
  }
  else
  {
    id v9 = objc_alloc_init((Class)NSDate);
    id v10 = [(HDHealthRecordsAPIReminderRegistry *)self _queue_firstEligibleReminderAfterDate:v9];
    if (v10)
    {
      if ([(HDHealthRecordsAPIReminderRegistry *)self _queue_shouldDropUnlimitedAuthorizationModeReminder:v10])
      {
        [(HDHealthRecordsAPIReminderRegistry *)self _queue_dropReminder:v10];
        [(HDHealthRecordsAPIReminderRegistry *)self _queue_firePendingReminderIfEligibleUsingPendingReminderID:v6 transaction:v7];
      }
      else
      {
        id v11 = [(HDHealthRecordsAPIReminderRegistry *)self pendingReminderIDsToReminders];
        [v11 setObject:v10 forKeyedSubscript:v6];

        [(HDHealthRecordsAPIReminderRegistry *)self _displayUnlimitedAuthorizationModeConfirmationForPendingReminderID:v6 transaction:v7 reminder:v10];
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_B4278();
      }
      [(HDHealthRecordsAPIReminderRegistry *)self _didProcessPendingReminderID:v6 transaction:v7];
    }
  }
}

- (void)_displayStopAlertForPendingReminderID:(id)a3 transaction:(id)a4 title:(id)a5 body:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = objc_alloc_init((Class)HDUserNotification);
  [v20 setTitle:v19];

  [v20 setMessage:v18];
  [v20 setCancelButton:v16];

  [v20 setOtherButton:v17];
  [v20 setAlertLevel:3];
  [v20 setUserNotificationOptions:32];
  v32[0] = SBUserNotificationAllowedApplicationsKey;
  v32[1] = SBUserNotificationPendInSetupIfNotAllowedKey;
  v33[0] = &off_11D6A8;
  v33[1] = &__kCFBooleanTrue;
  objc_super v21 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  [v20 setAdditionalDescriptors:v21];

  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_950FC;
  v28 = &unk_1149D8;
  v29 = self;
  id v30 = v14;
  id v31 = v15;
  id v22 = v15;
  id v23 = v14;
  [v20 presentWithResponseHandler:&v25];
  v24 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_testingEventListener];
  [v24 displayedAlertForPendingReminderID:v23];
}

- (void)_handleUserNotificationResponse:(int64_t)a3 pendingReminderID:(id)a4 transaction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  _HKInitializeLogging();
  id v10 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B42E0(v10);
  }
  id v11 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_95224;
  v14[3] = &unk_1137D8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)_queue_handleUserNotificationResponse:(int64_t)a3 pendingReminderID:(id)a4 transaction:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HDHealthRecordsAPIReminderRegistry *)self pendingReminderIDsToReminders];
  id v13 = [v12 objectForKeyedSubscript:v9];
  [v12 setObject:0 forKeyedSubscript:v9];
  if (!v13)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 351, @"No reminder for pending reminder ID %@", v9 object file lineNumber description];
  }
  id v14 = objc_alloc_init((Class)NSDate);
  id v15 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  id v19 = 0;
  id v16 = +[HDClinicalAPIReminderEntity setReminderPosted:v13 postDate:v14 profile:v15 error:&v19];
  id v17 = v19;

  if (v16)
  {
    [(HDHealthRecordsAPIReminderRegistry *)self _queue_performUserActionForReminder:v16 userResponse:a3];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B4390();
    }
  }
  [(HDHealthRecordsAPIReminderRegistry *)self _didProcessPendingReminderID:v9 transaction:v10];
}

- (void)_queue_performUserActionForReminder:(id)a3 userResponse:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1)
  {
    id v8 = [v6 source];
    [(HDHealthRecordsAPIReminderRegistry *)self _showClinicalAPISettingsForAppSource:v8];
  }
  else if (!a4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B43F8();
    }
  }
}

- (void)_showClinicalAPISettingsForAppSource:(id)a3
{
  id v5 = a3;
  if (([v5 _isApplication] & 1) == 0)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 385, @"Invalid parameter not satisfying: %@", @"[source _isApplication]" object file lineNumber description];
  }
  id v6 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

- (void)_didProcessPendingReminderID:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_958AC;
  block[3] = &unk_1122A0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  id v11 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_testingEventListener];
  [v11 didFinishProcessingPendingReminderID:v10];
}

- (void)registerAppSourceForUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 _isApplication] & 1) == 0)
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 431, @"Invalid parameter not satisfying: %@", @"[source _isApplication]" object file lineNumber description];
  }
  _HKInitializeLogging();
  id v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138412290;
    objc_super v21 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Attempting to register app source %@ for unlimited authorization mode confirmation alert", buf, 0xCu);
  }
  id v12 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_95AE4;
  block[3] = &unk_113290;
  id v17 = v7;
  id v18 = self;
  id v19 = v8;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v12, block);
}

- (void)deregisterAppSourceFromUnlimitedAuthorizationModeConfirmation:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 _isApplication] & 1) == 0)
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 449, @"Invalid parameter not satisfying: %@", @"[source _isApplication]" object file lineNumber description];
  }
  _HKInitializeLogging();
  id v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138412290;
    id v20 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Deregistering app source %@ for unlimited authorization mode confirmation alert", buf, 0xCu);
  }
  id v12 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_95D64;
  block[3] = &unk_113290;
  void block[4] = self;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v12, block);
}

- (BOOL)_queue_shouldDropUnlimitedAuthorizationModeReminder:(id)a3
{
  id v4 = [a3 source];
  id v5 = [v4 bundleIdentifier];
  id v6 = objc_alloc((Class)NSSet);
  id v7 = +[HKClinicalType allTypes];
  id v8 = [v6 initWithArray:v7];
  id v9 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  id v19 = 0;
  id v10 = +[HDAuthorizationEntity authorizationRecordsByTypeForBundleIdentifier:v5 types:v8 profile:v9 error:&v19];
  id v11 = v19;

  if (!v10)
  {
    _HKInitializeLogging();
    id v13 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B461C(v13);
    }
    goto LABEL_10;
  }
  if (![v10 count])
  {
    _HKInitializeLogging();
    id v14 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B46CC(v14);
    }
    goto LABEL_10;
  }
  if ([(HDHealthRecordsAPIReminderRegistry *)self _authorizationModeForRecordsByType:v10])
  {
    _HKInitializeLogging();
    id v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B47EC(v12);
    }
LABEL_10:
    char v15 = 1;
    goto LABEL_11;
  }
  unsigned __int8 v17 = [(HDHealthRecordsAPIReminderRegistry *)self _readAuthorizationAllowedForAnyTypeInRecordsByType:v10];
  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    id v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B475C(v18);
    }
  }
  char v15 = v17 ^ 1;
LABEL_11:

  return v15;
}

- (void)_displayUnlimitedAuthorizationModeConfirmationForPendingReminderID:(id)a3 transaction:(id)a4 reminder:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v23 = [a5 source];
  id v9 = [v23 name];
  id v10 = objc_alloc((Class)NSString);
  id v11 = HDHealthRecordsPluginBundle();
  id v12 = [v11 localizedStringForKey:@"UNLIMITED_AUTHORIZATION_REMINDER_TITLE_APP_%@" value:&stru_1152E8 table:@"HealthRecordsPlugin-Localizable"];
  id v13 = objc_msgSend(v10, "initWithFormat:", v12, v9);

  id v14 = objc_alloc((Class)NSString);
  char v15 = HDHealthRecordsPluginBundle();
  id v16 = [v15 localizedStringForKey:@"UNLIMITED_AUTHORIZATION_REMINDER_BODY_APP_%@" value:&stru_1152E8 table:@"HealthRecordsPlugin-Localizable"];
  id v17 = objc_msgSend(v14, "initWithFormat:", v16, v9);

  id v18 = HDHealthRecordsPluginBundle();
  id v19 = [v18 localizedStringForKey:@"UNLIMITED_AUTHORIZATION_REMINDER_BUTTON_KEEP" value:&stru_1152E8 table:@"HealthRecordsPlugin-Localizable"];
  id v20 = HDHealthRecordsPluginBundle();
  objc_super v21 = [v20 localizedStringForKey:@"UNLIMITED_AUTHORIZATION_REMINDER_BUTTON_MANAGE_ACCESS" value:&stru_1152E8 table:@"HealthRecordsPlugin-Localizable"];
  [(HDHealthRecordsAPIReminderRegistry *)self _displayStopAlertForPendingReminderID:v8 transaction:v7 title:v13 body:v17 defaultButtonTitle:v19 alternateButtonTitle:v21];
}

- (int64_t)_authorizationModeForRecordsByType:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 514, @"Invalid parameter not satisfying: %@", @"recordsByType.count > 0" object file lineNumber description];
  }
  memset(v11, 0, sizeof(v11));
  id v6 = v5;
  if ([v6 countByEnumeratingWithState:v11 objects:v12 count:16])
  {
    id v7 = [v6 objectForKeyedSubscript:**((void **)&v11[0] + 1)];
    id v8 = [v7 mode];
  }
  else
  {
    id v8 = 0;
  }

  return (int64_t)v8;
}

- (BOOL)_readAuthorizationAllowedForAnyTypeInRecordsByType:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 525, @"Invalid parameter not satisfying: %@", @"recordsByType.count > 0" object file lineNumber description];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v10 status];
        char v11 = HKAuthorizationStatusAllowsReading();

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_13;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v7;
}

- (void)_startObservingApplicationsUninstalledNotification
{
  id v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = HDHealthDaemonApplicationsUninstalledNotification;
  id v4 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  id v5 = [v4 daemon];
  [v6 addObserver:self selector:"_applicationsUninstalledNotification:" name:v3 object:v5];
}

- (void)_applicationsUninstalledNotification:(id)a3
{
  id v5 = [a3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:HDHealthDaemonApplicationsUninstalledBundleIdentifiersKey];

  if (!v6)
  {
    char v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 548, @"Invalid parameter not satisfying: %@", @"bundleIdentifiers != nil" object file lineNumber description];
  }
  id v7 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"ApplicationsUninstalled"];
  uint64_t v8 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_96674;
  block[3] = &unk_1122A0;
  id v13 = v6;
  long long v14 = self;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)_queue_deregisterAppWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v7);

  _HKInitializeLogging();
  uint64_t v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B487C(v8);
  }
  id v9 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  BOOL v10 = +[HDClinicalAPIReminderEntity deleteRemindersForSourceWithBundleIdentifier:v6 profile:v9 error:a4];

  return v10;
}

- (void)_queue_startListeningForHomescreenUnlockNotifications
{
  uint64_t v3 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v3);

  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B491C();
  }
  id v4 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  id v5 = [v4 daemon];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handleHomescreenUnlockedNotification:" name:HDDaemonHomescreenUnlockedNotification object:v5];

  [v5 registerForLaunchNotification:"com.apple.springboard.homescreenunlocked"];
  id v7 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_testingEventListener];
  [v7 startedListeningForHomescreenUnlockedNotifications];
}

- (void)_queue_stopListeningForHomescreenUnlockNotifications
{
  uint64_t v3 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
  dispatch_assert_queue_V2(v3);

  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B4950();
  }
  id v4 = [(HDHealthRecordsAPIReminderRegistry *)self profile];
  id v5 = [v4 daemon];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:HDDaemonHomescreenUnlockedNotification object:v5];

  [v5 unregisterForLaunchNotification:"com.apple.springboard.homescreenunlocked"];
  id v7 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_testingEventListener];
  [v7 stoppedListeningForHomescreenUnlockedNotifications];
}

- (void)_handleHomescreenUnlockedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:HDDaemonHomescreenUnlockedAtHomescreenKey];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B4984();
    }
    id v7 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_testingEventListener];
    [v7 receivedHomescreenUnlockedAtHomescreenNotification];

    uint64_t v8 = [(HDHealthRecordsAPIReminderRegistry *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_96BF4;
    block[3] = &unk_113B88;
    void block[4] = self;
    dispatch_async(v8, block);

    [(HDHealthRecordsAPIReminderRegistry *)self _firePendingReminderIfEligible];
  }
}

- (void)_checkInForFirstUnlockActivity
{
  uint64_t v3 = [(HDHealthRecordsAPIReminderRegistry *)self _criteriaForFirstUnlockActivity];
  id v4 = [(HDHealthRecordsAPIReminderRegistry *)self _criteriaForFirstUnlockActivityCompleted];
  objc_initWeak(&location, self);
  id v5 = (const char *)[@"com.apple.healthd.healthrecords.HDHealthRecordsAPIReminderRegistry-FirstUnlock" UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_96D50;
  handler[3] = &unk_114A00;
  id v9 = @"com.apple.healthd.healthrecords.HDHealthRecordsAPIReminderRegistry-FirstUnlock";
  id v6 = v3;
  id v10 = v6;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  xpc_activity_register(v5, XPC_ACTIVITY_CHECK_IN, handler);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)_criteriaForFirstUnlockActivity
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_15_MIN);

  return v2;
}

- (id)_criteriaForFirstUnlockActivityCompleted
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_DELAY, 315360000);

  return v2;
}

- (double)deferralPeriod
{
  uint64_t v3 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_deferralPeriodOverride];
  id v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [(HDHealthRecordsAPIReminderRegistry *)self _timeIntervalForDefaultsKey:@"HealthRecordsAPIReminderDeferralPeriod" fallbackInterval:604800.0];
  }
  double v6 = v5;

  return v6;
}

- (double)schedulerGracePeriod
{
  uint64_t v3 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_schedulerGracePeriodOverride];
  id v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [(HDHealthRecordsAPIReminderRegistry *)self _timeIntervalForDefaultsKey:@"HealthRecordsAPIReminderSchedulerGracePeriod" fallbackInterval:28800.0];
  }
  double v6 = v5;

  return v6;
}

- (double)throttlingInterval
{
  uint64_t v3 = [(HDHealthRecordsAPIReminderRegistry *)self _unitTesting_throttlingIntervalOverride];
  id v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [(HDHealthRecordsAPIReminderRegistry *)self _timeIntervalForDefaultsKey:@"HealthRecordsAPIReminderThrottlingInterval" fallbackInterval:86400.0];
  }
  double v6 = v5;

  return v6;
}

- (double)_timeIntervalForDefaultsKey:(id)a3 fallbackInterval:(double)a4
{
  id v5 = a3;
  double v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    objc_opt_class();
    uint64_t v8 = HKSafeObject();
    id v9 = 0;

    if (v8)
    {
      [v8 doubleValue];
      double v11 = v10;
      if (v10 > 0.0)
      {
        a4 = v10;
      }
      else
      {
        _HKInitializeLogging();
        id v12 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_B4A90((uint64_t)v5, v12, v11);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B4A28();
      }
    }
  }
  return a4;
}

- (void)_unitTesting_setDeferralPeriodOverride:(double)a3
{
  if (a3 <= 0.0)
  {
    double v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 748, @"Invalid parameter not satisfying: %@", @"deferralPeriod > 0" object file lineNumber description];
  }
  id v7 = +[NSNumber numberWithDouble:a3];
  [(HDHealthRecordsAPIReminderRegistry *)self set_unitTesting_deferralPeriodOverride:v7];
}

- (void)_unitTesting_setSchedulerGracePeriodOverride:(double)a3
{
  if (a3 <= 0.0)
  {
    double v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 753, @"Invalid parameter not satisfying: %@", @"gracePeriod > 0" object file lineNumber description];
  }
  id v7 = +[NSNumber numberWithDouble:a3];
  [(HDHealthRecordsAPIReminderRegistry *)self set_unitTesting_schedulerGracePeriodOverride:v7];
}

- (void)_unitTesting_setThrottlingIntervalOverride:(double)a3
{
  if (a3 <= 0.0)
  {
    double v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HDHealthRecordsAPIReminderRegistry.m", 758, @"Invalid parameter not satisfying: %@", @"throttlingInterval > 0" object file lineNumber description];
  }
  id v7 = +[NSNumber numberWithDouble:a3];
  [(HDHealthRecordsAPIReminderRegistry *)self set_unitTesting_throttlingIntervalOverride:v7];
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSNumber)_unitTesting_deferralPeriodOverride
{
  return self->__unitTesting_deferralPeriodOverride;
}

- (void)set_unitTesting_deferralPeriodOverride:(id)a3
{
}

- (NSNumber)_unitTesting_schedulerGracePeriodOverride
{
  return self->__unitTesting_schedulerGracePeriodOverride;
}

- (void)set_unitTesting_schedulerGracePeriodOverride:(id)a3
{
}

- (NSNumber)_unitTesting_throttlingIntervalOverride
{
  return self->__unitTesting_throttlingIntervalOverride;
}

- (void)set_unitTesting_throttlingIntervalOverride:(id)a3
{
}

- (_HDHealthRecordsAPIReminderRegistryEventListener)_unitTesting_testingEventListener
{
  return self->__unitTesting_testingEventListener;
}

- (void)_unitTesting_setTestingEventListener:(id)a3
{
}

- (NSMutableDictionary)pendingReminderIDsToReminders
{
  return self->_pendingReminderIDsToReminders;
}

- (HDXPCScheduler)triggerScheduler
{
  return self->_triggerScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerScheduler, 0);
  objc_storeStrong((id *)&self->_pendingReminderIDsToReminders, 0);
  objc_storeStrong((id *)&self->__unitTesting_testingEventListener, 0);
  objc_storeStrong((id *)&self->__unitTesting_throttlingIntervalOverride, 0);
  objc_storeStrong((id *)&self->__unitTesting_schedulerGracePeriodOverride, 0);
  objc_storeStrong((id *)&self->__unitTesting_deferralPeriodOverride, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_destroyWeak((id *)&self->_profileExtension);
}

@end