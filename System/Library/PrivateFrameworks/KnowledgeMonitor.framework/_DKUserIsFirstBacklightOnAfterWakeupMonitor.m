@interface _DKUserIsFirstBacklightOnAfterWakeupMonitor
+ (id)eventStream;
+ (id)fetchMostRecentPastEventForStream:(id)a3;
+ (id)fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked;
+ (id)prettyPrintDateAsLocalTime:(id)a3;
+ (void)fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked;
- (BOOL)FirstWakeUINotificationEnabled;
- (BOOL)SoftwareUpdateUINotificationEnabled;
- (BOOL)didQualifyingScreenLockEndInEligibilityPeriod;
- (BOOL)eligibleForFirstWakeUINotification;
- (BOOL)isFirstBacklightOn;
- (BOOL)isInternalBuild;
- (BOOL)isUINotificationEnabledForKey:(id)a3;
- (id)convertUTCToLocalTimeString:(id)a3;
- (id)firstWakeupEventWithValue:(BOOL)a3;
- (id)getNextSWUpdatePrediction;
- (void)deactivate;
- (void)dealloc;
- (void)didQualifyingScreenLockEndInEligibilityPeriod;
- (void)getNextSWUpdatePrediction;
- (void)handleBacklightTurnedOffEvent;
- (void)handleBacklightTurnedOnEvent;
- (void)handleScreenUnlockEvent;
- (void)receiveNotificationEvent:(id)a3;
- (void)recordFirstWakeup:(id)a3;
- (void)registerHandleBacklightEvents;
- (void)setFirstWakeUINotificationEnabled:(BOOL)a3;
- (void)setInternalSettingsChangedNotficationHandler;
- (void)setSoftwareUpdateUINotificationEnabled:(BOOL)a3;
- (void)setUINotificationEligibility;
- (void)setupNotificationEligiblityPeriod;
- (void)showFirstWakeupUINotification;
- (void)showSoftwareUpdateUINotification;
- (void)showUINotification:(id)a3;
- (void)start;
- (void)stop;
- (void)unregisterHandleBacklightEvents;
@end

@implementation _DKUserIsFirstBacklightOnAfterWakeupMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A629AA0]();
  if (self->_enabled)
  {
    v6 = [v4 objectForKeyedSubscript:@"Notification"];
    int v7 = [v6 isEqual:@"com.apple.springboard.lockstate"];

    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:@"_State"];
      char v9 = [v8 BOOLValue];

      if ((v9 & 1) == 0)
      {
        v10 = [(_DKMonitor *)self queue];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __72___DKUserIsFirstBacklightOnAfterWakeupMonitor_receiveNotificationEvent___block_invoke;
        v14[3] = &unk_264714788;
        v14[4] = self;
        v11 = v14;
        v12 = (void *)os_transaction_create();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
        block[3] = &unk_2647148A0;
        id v16 = v12;
        id v17 = v11;
        id v13 = v12;
        dispatch_async(v10, block);
      }
    }
  }
}

- (void)dealloc
{
  [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKUserIsFirstBacklightOnAfterWakeupMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"UserIsFirstBacklightOnAfterWakeup";
}

+ (id)prettyPrintDateAsLocalTime:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [MEMORY[0x263EFFA18] localTimeZone];
  [v4 setTimeZone:v5];

  [v4 setDateStyle:2];
  [v4 setTimeStyle:3];
  v6 = NSString;
  int v7 = [v4 stringFromDate:v3];

  v8 = [v6 stringWithFormat:@"%@", v7];

  return v8;
}

+ (id)fetchMostRecentPastEventForStream:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F08A98];
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [v4 predicateWithFormat:@"(startDate < %@)", v5];

  int v7 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:0];
  id v8 = objc_alloc_init(MEMORY[0x263F35090]);
  [v8 setPredicate:v6];
  v19[0] = v3;
  char v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  [v8 setEventStreams:v9];

  v18 = v7;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  [v8 setSortDescriptors:v10];

  [v8 setLimit:1];
  v11 = [MEMORY[0x263F350B8] knowledgeStore];
  id v17 = 0;
  v12 = [v11 executeQuery:v8 error:&v17];
  id v13 = v17;

  if (v13)
  {
    v14 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[_DKUserIsFirstBacklightOnAfterWakeupMonitor fetchMostRecentPastEventForStream:](v3);
    }

    v15 = 0;
  }
  else
  {
    v15 = [v12 firstObject];
  }

  return v15;
}

- (BOOL)isFirstBacklightOn
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x263EFF910] date];
  if ([(NSDateInterval *)self->eligibleForNotification containsDate:v4])
  {
    v5 = [(id)objc_opt_class() fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked];
    v6 = v5;
    if (v5)
    {
      int v7 = [v5 endDate];
      [v7 timeIntervalSinceNow];
      if (v8 >= -14400.0) {
        LOBYTE(v9) = 0;
      }
      else {
        BOOL v9 = ![(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self didQualifyingScreenLockEndInEligibilityPeriod];
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    v10 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(id)objc_opt_class() prettyPrintDateAsLocalTime:v4];
      eligibleForNotification = self->eligibleForNotification;
      int v14 = 138412546;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = eligibleForNotification;
      _os_log_debug_impl(&dword_225002000, v10, OS_LOG_TYPE_DEBUG, "%@ is not in \"First wakeup of the Day\" Eligible notification period %@", (uint8_t *)&v14, 0x16u);
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)firstWakeupEventWithValue:(BOOL)a3
{
  id v4 = objc_msgSend(NSNumber, "numberWithBool:");
  v5 = [MEMORY[0x263F351B8] userContext];
  v6 = [MEMORY[0x263F351D0] keyPathForFirstWakeupStatus];
  [v5 setObject:v4 forKeyedSubscript:v6];

  if (a3) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  int v7 = [MEMORY[0x263F35050] no];
  }
  double v8 = (void *)MEMORY[0x263F35088];
  BOOL v9 = [MEMORY[0x263F35148] userIsFirstBacklightOnAfterWakeup];
  v10 = [MEMORY[0x263EFF910] date];
  v11 = [MEMORY[0x263EFF910] distantFuture];
  v12 = [v8 eventWithStream:v9 startDate:v10 endDate:v11 value:v7];

  return v12;
}

- (void)setupNotificationEligiblityPeriod
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_225002000, a2, a3, "Setup eligibleForNotification = %@", (uint8_t *)&v4);
}

- (void)recordFirstWakeup:(id)a3
{
  if (a3) {
    [(_DKMonitor *)self setCurrentEvent:a3 inferHistoricalState:1];
  }
}

- (BOOL)isInternalBuild
{
  v2 = (const void *)MGCopyAnswer();
  uint64_t v3 = v2;
  int v4 = (const void *)*MEMORY[0x263EFFB40];
  if (v2) {
    CFRelease(v2);
  }
  return v4 == v3;
}

- (BOOL)isUINotificationEnabledForKey:(id)a3
{
  v22[4] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.CoreDuet"];
  [v5 synchronize];
  uint64_t v6 = [MEMORY[0x263F34FB8] instrumentationChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:].cold.5();
  }

  int v7 = [v5 objectForKey:@"DKCFirstWakeUINotification"];
  if (!v7) {
    goto LABEL_11;
  }
  double v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
  v22[0] = 0;
  id v13 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v7 error:v22];
  id v14 = v22[0];
  if (v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:]();
  }

  if (v13)
  {
    v15 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:]();
    }
  }
  else
  {
LABEL_11:
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    __int16 v16 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor isUINotificationEnabledForKey:]((uint64_t)self, v16);
    }

    if (!v13) {
      goto LABEL_16;
    }
  }
  id v17 = [v13 objectForKey:v4];
  BOOL v18 = v17 == 0;

  if (v18)
  {
LABEL_16:
    char v20 = 0;
    goto LABEL_17;
  }
  v19 = [v13 objectForKey:v4];
  char v20 = [v19 BOOLValue];

LABEL_17:
  return v20;
}

- (void)setUINotificationEligibility
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_225002000, v0, v1, "UI-Notifications for FirstBackLightAfterWakeup enabled\n", v2, v3, v4, v5, v6);
}

- (void)setInternalSettingsChangedNotficationHandler
{
  if ([(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self isInternalBuild])
  {
    objc_initWeak(&location, self);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    double v8 = __91___DKUserIsFirstBacklightOnAfterWakeupMonitor_setInternalSettingsChangedNotficationHandler__block_invoke;
    uint64_t v9 = &unk_264714940;
    objc_copyWeak(&v10, &location);
    uint64_t v3 = (void *)MEMORY[0x22A629CE0](&v6);
    uint64_t v4 = (const char *)objc_msgSend(@"com.apple.CoreDuet.UINotificationsettingsChanged", "UTF8String", v6, v7, v8, v9);
    uint64_t v5 = [(_DKMonitor *)self queue];
    notify_register_dispatch(v4, &self->internalSettingChangedNotificationToken, v5, v3);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)eligibleForFirstWakeUINotification
{
  uint64_t v2 = [(_DKMonitor *)self currentEvent];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 value];
    uint64_t v5 = [v4 integerValue];
    uint64_t v6 = [MEMORY[0x263F35050] yes];
    BOOL v7 = v5 == [v6 integerValue];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)convertUTCToLocalTimeString:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"LLL d, yyyy - HH:mm:ss"];
  uint64_t v6 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v5 setTimeZone:v6];

  BOOL v7 = [v5 stringFromDate:v4];

  return v7;
}

- (id)getNextSWUpdatePrediction
{
  id v3 = objc_alloc_init(MEMORY[0x263F34FD8]);
  id v4 = [v3 getUnlockAndSoftwareUpdateTimes];
  id v5 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)v4 getNextSWUpdatePrediction];
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v7 = [v4 objectForKey:@"su_start"];
  double v8 = [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self convertUTCToLocalTimeString:v7];
  [v6 setObject:v8 forKey:@"start_time"];

  uint64_t v9 = [v4 objectForKey:@"su_end"];
  id v10 = [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self convertUTCToLocalTimeString:v9];
  [v6 setObject:v10 forKey:@"end_time"];

  uint64_t v11 = [v4 objectForKey:@"unlock_start"];
  v12 = [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self convertUTCToLocalTimeString:v11];
  [v6 setObject:v12 forKey:@"unlock_time"];

  id v13 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)v6 getNextSWUpdatePrediction];
  }

  return v6;
}

- (void)showUINotification:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(2, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66___DKUserIsFirstBacklightOnAfterWakeupMonitor_showUINotification___block_invoke;
  v9[3] = &unk_264714788;
  id v10 = v3;
  id v5 = v9;
  id v6 = v3;
  BOOL v7 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_2647148A0;
  id v12 = v7;
  id v13 = v5;
  id v8 = v7;
  dispatch_async(v4, block);
}

- (void)showSoftwareUpdateUINotification
{
  uint64_t v9 = [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self getNextSWUpdatePrediction];
  id v3 = NSString;
  id v4 = [v9 objectForKey:@"start_time"];
  id v5 = [v9 objectForKey:@"end_time"];
  id v6 = [v9 objectForKey:@"unlock_time"];
  BOOL v7 = [v3 stringWithFormat:@"%@\n%@ - %@\n %@ - %@\n %@ - %@\n\n %@", @"Duet detected an opportunity for software update\n", @"Update Start:", v4, @"Update End:", v5, @"Last Unlock:", v6, @"Is this a good time for automatic software update to occur tonight?\n"];

  id v8 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"alert_title", v7, @"alert_msg", @"Yes", @"alert_option_one", @"No", @"alert_option_two", @"Duet - Auto Software Update Prediction", @"response_alert_title", @"Please file a radar under component Duet | all", @"response_alert_msg", 0);
  [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self showUINotification:v8];
}

- (void)showFirstWakeupUINotification
{
  id v3 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"alert_title", @"Was this your first unlock of the day after waking up?\n\n [Internal Only - provided by CoreDuet]", @"alert_msg", @"Yes", @"alert_option_one", @"No", @"alert_option_two", @"First unlock after wakeup", @"response_alert_title", @"Please file a radar under component DuetExpertCenter | Magic Moments", @"response_alert_msg", 0);
  [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self showUINotification:v3];
}

- (void)handleBacklightTurnedOffEvent
{
  id v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self firstWakeupEventWithValue:0];
  [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self recordFirstWakeup:v4];
}

- (void)handleBacklightTurnedOnEvent
{
  id v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self firstWakeupEventWithValue:[(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self isFirstBacklightOn]];
  [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self recordFirstWakeup:v4];
}

- (void)handleScreenUnlockEvent
{
  id v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self firstWakeupEventWithValue:0];
  if ([(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self eligibleForFirstWakeUINotification])
  {
    if ([(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self SoftwareUpdateUINotificationEnabled])
    {
      [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self showSoftwareUpdateUINotification];
    }
    if ([(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self FirstWakeUINotificationEnabled])
    {
      [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self showFirstWakeupUINotification];
    }
  }
  [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self recordFirstWakeup:v4];
}

- (void)registerHandleBacklightEvents
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

  id v5 = dispatch_queue_create("com.apple.coreduetd.firstBacklightHandler", v4);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76___DKUserIsFirstBacklightOnAfterWakeupMonitor_registerHandleBacklightEvents__block_invoke;
  v7[3] = &unk_2647148F0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  id v6 = (void *)MEMORY[0x22A629CE0](v7);
  notify_register_dispatch((const char *)[@"com.apple.iokit.hid.displayStatus" UTF8String], &self->displayStatusNotifyToken, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)unregisterHandleBacklightEvents
{
  int displayStatusNotifyToken = self->displayStatusNotifyToken;
  if (displayStatusNotifyToken)
  {
    notify_cancel(displayStatusNotifyToken);
    self->int displayStatusNotifyToken = 0;
  }
}

+ (id)fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked
{
  id v3 = [MEMORY[0x263F35148] deviceIsLockedStream];
  id v4 = [a1 fetchMostRecentPastEventForStream:v3];

  id v5 = [v4 value];
  uint64_t v6 = [v5 integerValue];
  BOOL v7 = [MEMORY[0x263F35050] yes];
  uint64_t v8 = [v7 integerValue];

  if (v6 == v8)
  {
    uint64_t v9 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[_DKUserIsFirstBacklightOnAfterWakeupMonitor fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked]();
    }
LABEL_8:

    id v13 = 0;
    goto LABEL_10;
  }
  if (v4)
  {
    id v10 = [v4 endDate];
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    uint64_t v12 = [v10 compare:v11];

    if (v12 == 1)
    {
      uint64_t v9 = [MEMORY[0x263F34FB8] knowledgeChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[_DKUserIsFirstBacklightOnAfterWakeupMonitor fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked]();
      }
      goto LABEL_8;
    }
  }
  id v13 = v4;
LABEL_10:

  return v13;
}

- (BOOL)didQualifyingScreenLockEndInEligibilityPeriod
{
  v36[2] = *MEMORY[0x263EF8340];
  id v3 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x263F35110];
  id v5 = [(NSDateInterval *)self->eligibleForNotification startDate];
  uint64_t v6 = [(NSDateInterval *)self->eligibleForNotification endDate];
  BOOL v7 = [v4 predicateForEventsWithEndInDateRangeFrom:v5 to:v6];

  uint64_t v8 = (void *)MEMORY[0x263F35110];
  uint64_t v9 = [MEMORY[0x263F35050] yes];
  id v10 = [v8 predicateForEventsWithCategoryValue:v9];

  id v11 = objc_alloc_init(MEMORY[0x263F35090]);
  uint64_t v12 = (void *)MEMORY[0x263F08730];
  v36[0] = v7;
  v36[1] = v10;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  id v14 = [v12 andPredicateWithSubpredicates:v13];
  [v11 setPredicate:v14];

  v15 = [MEMORY[0x263F35148] deviceIsLockedStream];
  v35 = v15;
  __int16 v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  [v11 setEventStreams:v16];

  id v17 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:1];
  v34 = v17;
  BOOL v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  [v11 setSortDescriptors:v18];

  [v11 setResultType:2];
  v19 = [MEMORY[0x263F350B8] knowledgeStore];
  id v32 = 0;
  char v20 = [v19 executeQuery:v11 error:&v32];
  id v21 = v32;

  if (v21)
  {
    v22 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_DKUserIsFirstBacklightOnAfterWakeupMonitor didQualifyingScreenLockEndInEligibilityPeriod]();
    }
    LOBYTE(v23) = 0;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "duration", (void)v28);
          if (v26 > 14400.0)
          {
            LOBYTE(v23) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
  }
LABEL_15:

  return v23;
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)_DKUserIsFirstBacklightOnAfterWakeupMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsActivation])
  {
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self setupNotificationEligiblityPeriod];
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self registerHandleBacklightEvents];
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self setInternalSettingsChangedNotficationHandler];
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self setUINotificationEligibility];
    self->_enabled = 1;
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKUserIsFirstBacklightOnAfterWakeupMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  if (self->displayStatusNotifyToken) {
    [(_DKUserIsFirstBacklightOnAfterWakeupMonitor *)self unregisterHandleBacklightEvents];
  }
  self->_enabled = 0;
}

- (BOOL)FirstWakeUINotificationEnabled
{
  return self->_FirstWakeUINotificationEnabled;
}

- (void)setFirstWakeUINotificationEnabled:(BOOL)a3
{
  self->_FirstWakeUINotificationEnabled = a3;
}

- (BOOL)SoftwareUpdateUINotificationEnabled
{
  return self->_SoftwareUpdateUINotificationEnabled;
}

- (void)setSoftwareUpdateUINotificationEnabled:(BOOL)a3
{
  self->_SoftwareUpdateUINotificationEnabled = a3;
}

- (void).cxx_destruct
{
}

+ (void)fetchMostRecentPastEventForStream:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_225002000, v2, v3, "Error querying for event in stream %@ : %@", v4, v5, v6, v7, v8);
}

- (void)isUINotificationEnabledForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225002000, a2, v5, "[%@] : no known state.", v6);
}

- (void)isUINotificationEnabledForKey:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_225002000, v2, v3, "[%@]: last state is %@", v4, v5, v6, v7, v8);
}

- (void)isUINotificationEnabledForKey:.cold.3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225002000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error unarchiving state: %@", v0, 0xCu);
}

- (void)isUINotificationEnabledForKey:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_225002000, a3, (uint64_t)a3, "Incompatible state type: %@", (uint8_t *)a2);
}

- (void)isUINotificationEnabledForKey:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_225002000, v0, v1, "isUINotificationEnabledForKey defaults did synchronize.", v2, v3, v4, v5, v6);
}

- (void)getNextSWUpdatePrediction
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225002000, a2, v4, "Software update SPI returned %@\n", v5);
}

+ (void)fetchMostRecentlyStoredScreenLockEventOnlyIfValueIsUnlocked
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225002000, v0, v1, "most recent event in the DB is in future. Skipping over event = %@", v2);
}

- (void)didQualifyingScreenLockEndInEligibilityPeriod
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225002000, v0, v1, "Error querying for lock events : %@", v2);
}

@end