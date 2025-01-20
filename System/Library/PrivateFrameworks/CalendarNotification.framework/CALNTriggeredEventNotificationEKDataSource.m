@interface CALNTriggeredEventNotificationEKDataSource
+ (double)snoozeInterval;
+ (id)_alarmDateForAlarm:(id)a3 eventStartDate:(id)a4;
+ (id)_alarmForEvent:(id)a3 withAlarmID:(id)a4;
+ (id)_sourceClientIdentifierForAlertInfo:(id)a3;
- (BOOL)_shouldTriggerForAlertInfo:(id)a3;
- (BOOL)_shouldWithdrawNotificationWithSourceClientIdentifier:(id)a3 event:(id)a4 alarmID:(id)a5;
- (BOOL)shouldRemoveNotificationMetaDataWithEventID:(id)a3;
- (BOOL)shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4;
- (BOOL)shouldWithdrawNotificationWithSourceClientIdentifier:(id)a3;
- (CALNAlarmEngineMonitor)alarmEngineMonitor;
- (CALNCalendarCoreLocationManager)coreLocationManager;
- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider;
- (CALNDebugPreferences)debugPreferences;
- (CALNFoundInAppsEventTracker)foundInAppsEventTracker;
- (CALNRemoteMutator)remoteMutator;
- (CALNRouteHypothesizerProvider)routeHypothesizerProvider;
- (CALNSuggestionsServiceLogger)suggestionsServiceLogger;
- (CALNTTLEventTracker)ttlEventTracker;
- (CALNTimeToLeaveRefreshMonitor)timeToLeaveRefreshMonitor;
- (CALNTravelEngine)travelEngine;
- (CALNTriggeredEventNotificationDataSourceDelegate)delegate;
- (CALNTriggeredEventNotificationEKDataSource)initWithEventStoreProvider:(id)a3 remoteMutator:(id)a4 dataSourceEventRepresentationProvider:(id)a5 coreLocationProvider:(id)a6 ttlEventTracker:(id)a7 alarmEngineMonitor:(id)a8 travelEngine:(id)a9 foundInAppsEventTracker:(id)a10 suggestionsServiceLogger:(id)a11 routeHypothesizerProvider:(id)a12 timeToLeaveRefreshMonitor:(id)a13 debugPreferences:(id)a14 mailtoURLProvider:(id)a15;
- (CALNTriggeredEventNotificationMailtoURLProvider)mailtoURLProvider;
- (EKEventStoreProvider)eventStoreProvider;
- (double)_requestHypothesisRefreshInterval;
- (id)_eventForEventID:(id)a3;
- (id)_eventForSourceClientIdentifier:(id)a3;
- (id)_filterAlerts:(id)a3;
- (id)_notificationExpirationDateForAlarmDate:(id)a3 eventEndDate:(id)a4;
- (id)_notificationExpirationDateForNullableAlarmDate:(id)a3 eventEndDate:(id)a4;
- (id)eventObjectIDForEventID:(id)a3;
- (id)fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:(id)a3 isProtectedDataAvailable:(BOOL)a4;
- (id)notificationExpirationDateForEventID:(id)a3 alarmID:(id)a4;
- (void)_alertFiredForAlertInfo:(id)a3;
- (void)_alertsFired:(id)a3;
- (void)_didSetUpTimeToLeaveRefreshTimerForEventID:(id)a3 triggerDate:(id)a4;
- (void)_handleNotificationActionForSourceClientIdentifier:(id)a3 acknowledgeAlarm:(BOOL)a4 eventActions:(id)a5;
- (void)acknowledgeEventWithSourceClientIdentifier:(id)a3 shouldMarkAsHavingReceivedLocation:(BOOL)a4;
- (void)ceaseRouteMonitoringEventForSourceClientIdentifier:(id)a3;
- (void)ceaseRouteMonitoringEventWithEventID:(id)a3;
- (void)didDismissUINotification:(unint64_t)a3 forPlannedDestination:(id)a4 dismissalType:(unint64_t)a5;
- (void)handleDirectionsActionWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4 lastFireTimeOfAlertOffsetFromTravelTime:(id)a5;
- (void)handleMailOrganizerActionWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4;
- (void)removeTimeToLeaveRefreshTimerForEventID:(id)a3;
- (void)removeTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3;
- (void)sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:(id)a3;
- (void)sendFeedbackForAddedTravelAdvisoryNotificationWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4 travelAdvisoryTimelinessPeriod:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:(id)a3 eventID:(id)a4;
- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:(id)a3 sourceClientIdentifier:(id)a4;
- (void)snoozeEventWithSourceClientIdentifier:(id)a3 snoozeType:(unint64_t)a4;
- (void)timeToLeaveRefreshMonitor:(id)a3 refreshTimerFiredForEventExternalURL:(id)a4;
- (void)travelEngine:(id)a3 authorizationChanged:(BOOL)a4;
- (void)travelEngine:(id)a3 eventSignificantlyChangedWithEventExternalURL:(id)a4;
- (void)travelEngine:(id)a3 receivedHypothesis:(id)a4 eventExternalURL:(id)a5;
@end

@implementation CALNTriggeredEventNotificationEKDataSource

- (CALNTriggeredEventNotificationEKDataSource)initWithEventStoreProvider:(id)a3 remoteMutator:(id)a4 dataSourceEventRepresentationProvider:(id)a5 coreLocationProvider:(id)a6 ttlEventTracker:(id)a7 alarmEngineMonitor:(id)a8 travelEngine:(id)a9 foundInAppsEventTracker:(id)a10 suggestionsServiceLogger:(id)a11 routeHypothesizerProvider:(id)a12 timeToLeaveRefreshMonitor:(id)a13 debugPreferences:(id)a14 mailtoURLProvider:(id)a15
{
  id v45 = a3;
  id v32 = a4;
  id v44 = a4;
  id v33 = a5;
  id v43 = a5;
  id v20 = a6;
  id v42 = a7;
  id v34 = a8;
  id v41 = a8;
  id v40 = a9;
  id v39 = a10;
  id v38 = a11;
  id v37 = a12;
  id v36 = a13;
  id v21 = a14;
  id v22 = a15;
  v46.receiver = self;
  v46.super_class = (Class)CALNTriggeredEventNotificationEKDataSource;
  v23 = [(CALNTriggeredEventNotificationEKDataSource *)&v46 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v24->_remoteMutator, v32);
    objc_storeStrong((id *)&v24->_dataSourceEventRepresentationProvider, v33);
    v25 = [[CALNCalendarCoreLocationManager alloc] initWithCoreLocationProvider:v20];
    coreLocationManager = v24->_coreLocationManager;
    v24->_coreLocationManager = v25;

    objc_storeStrong((id *)&v24->_ttlEventTracker, a7);
    objc_storeStrong((id *)&v24->_alarmEngineMonitor, v34);
    objc_storeStrong((id *)&v24->_travelEngine, a9);
    objc_storeStrong((id *)&v24->_foundInAppsEventTracker, a10);
    objc_storeStrong((id *)&v24->_suggestionsServiceLogger, a11);
    objc_storeStrong((id *)&v24->_routeHypothesizerProvider, a12);
    objc_storeStrong((id *)&v24->_timeToLeaveRefreshMonitor, a13);
    objc_storeStrong((id *)&v24->_debugPreferences, a14);
    objc_storeStrong((id *)&v24->_mailtoURLProvider, a15);
    v27 = [(CALNTriggeredEventNotificationEKDataSource *)v24 alarmEngineMonitor];
    [v27 addAlarmsFiredObserver:v24 selector:sel__alertsFired_];

    v28 = [(CALNTriggeredEventNotificationEKDataSource *)v24 travelEngine];
    [v28 setDelegate:v24];

    v29 = [(CALNTriggeredEventNotificationEKDataSource *)v24 timeToLeaveRefreshMonitor];
    [v29 setDelegate:v24];
  }
  return v24;
}

- (id)fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:(id)a3 isProtectedDataAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v70 = 0;
  id v71 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v71 andAlarmID:&v70 fromSourceClientIdentifier:v6];
  id v7 = v71;
  id v8 = v70;
  v9 = [(CALNTriggeredEventNotificationEKDataSource *)self eventStoreProvider];
  v10 = [v9 eventStore];

  v69 = v7;
  if (v7 && ([NSURL URLWithString:v7], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    v13 = [v10 _eventOccurrenceWithURI:v11];
    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
    v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:]();
    }

    v12 = 0;
    v13 = 0;
  }
  if (!v4)
  {
LABEL_12:
    id v61 = v8;
    id v62 = v6;
    v59 = v12;
    v60 = v10;
    if (v13)
    {
      uint64_t v17 = [v13 title];
      uint64_t v18 = [v13 location];
      v19 = [v13 locationsWithoutPrediction];
      v56 = [v19 firstObject];

      v63 = [v13 startDate];
      uint64_t v20 = [v13 endDate];
      unsigned int v55 = [v13 isAllDay];
      v67 = (void *)v20;
      if ([v13 isAllDay] & 1) != 0 || (objc_msgSend(v13, "isBirthday"))
      {
        LOBYTE(v54) = 0;
      }
      else
      {
        id v22 = [v13 calendar];
        int v54 = [v22 isSubscribed] ^ 1;
      }
      v57 = (void *)v18;
      v58 = v17;
      v23 = [(CALNTriggeredEventNotificationEKDataSource *)self dataSourceEventRepresentationProvider];
      v24 = [v10 timeZone];
      v66 = [v23 eventRepresentationDictionaryForUpcomingEvent:v13 date:v63 displayTimeZone:v24];

      char v52 = [v13 hasPredictedLocation];
      v65 = [v13 preferredLocation];
      v25 = [v13 virtualConference];
      v26 = [v25 urlWithAllowedScheme];

      if (v26)
      {
        id v68 = v26;
        v27 = [v13 virtualConference];
        v28 = [v27 joinMethods];
        v29 = [v28 firstObject];
        char v30 = [v29 isBroadcast];
      }
      else
      {
        id v68 = [v13 conferenceURLForDisplay];
        char v30 = 0;
      }
      char v48 = v30;
      v31 = [(CALNTriggeredEventNotificationEKDataSource *)self mailtoURLProvider];
      v64 = [v31 mailtoURLForEvent:v13];

      BYTE4(v49) = [v13 hasAlarms];
      v51 = [v13 eventOccurrenceID];
      LOBYTE(v49) = [v13 travelAdvisoryBehavior] == 2;

      id v21 = v68;
    }
    else
    {
      v57 = 0;
      v58 = 0;
      v56 = 0;
      v63 = 0;
      v67 = 0;
      unsigned int v55 = 0;
      v66 = 0;
      char v52 = 0;
      v65 = 0;
      id v21 = 0;
      char v48 = 0;
      v64 = 0;
      uint64_t v49 = 0;
      v51 = 0;
      LOBYTE(v54) = 1;
    }
    uint64_t v32 = [NSString stringWithFormat:@"x-apple-eventkit-alert-%@", v69];
    id v33 = [(CALNTriggeredEventNotificationEKDataSource *)self coreLocationManager];
    char v34 = [v33 allowsLocationAlerts];

    v35 = [(CALNTriggeredEventNotificationEKDataSource *)self debugPreferences];
    char v36 = [v35 forceDisplayOfNewTravelAdvisoryHypotheses];

    id v37 = [CALNTriggeredEventNotificationInfo alloc];
    id v38 = [v13 objectID];
    id v39 = [v38 stringRepresentation];
    v50 = v13;
    id v40 = [v13 calendar];
    id v41 = [v40 calendarIdentifier];
    BYTE4(v47) = v49;
    BYTE3(v47) = v36;
    BYTE2(v47) = v34;
    BYTE1(v47) = BYTE4(v49);
    LOBYTE(v47) = v52;
    LOBYTE(v46) = v48;
    uint64_t v45 = v32;
    v53 = (void *)v32;
    LOBYTE(v44) = v54;
    v15 = v58;
    v16 = -[CALNTriggeredEventNotificationInfo initWithTitle:location:locationWithoutPrediction:startDate:endDate:isAllDay:isTimeSensitive:eventID:eventOccurrenceID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:preferredLocation:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:allowsLocationAlerts:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:](v37, "initWithTitle:location:locationWithoutPrediction:startDate:endDate:isAllDay:isTimeSensitive:eventID:eventOccurrenceID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:preferredLocation:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:allowsLocationAlerts:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:", v58, v57, v56, v63, v67, v55, v44, v69, v51, v39, v41, v66, v45, v65,
            v21,
            v46,
            v64,
            v47);

    id v42 = +[CALNLogSubsystem calendar];
    id v6 = v62;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v73 = v62;
      __int16 v74 = 2112;
      v75 = v16;
      _os_log_impl(&dword_2216BB000, v42, OS_LOG_TYPE_DEFAULT, "Fetched triggered event notification info with source client identifier: %{public}@. Triggered notification info: %@.", buf, 0x16u);
    }

    v10 = v60;
    id v8 = v61;
    v12 = v59;
    v13 = v50;
    goto LABEL_25;
  }
  v15 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CALNTriggeredEventNotificationEKDataSource fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:]();
  }
  v16 = 0;
LABEL_25:

  return v16;
}

- (BOOL)shouldWithdrawNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v13 = 0;
  id v14 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v14 andAlarmID:&v13 fromSourceClientIdentifier:v4];
  id v5 = v14;
  id v6 = v13;
  if (v5)
  {
    id v7 = [NSURL URLWithString:v5];
    if (v7)
    {
      id v8 = [(CALNTriggeredEventNotificationEKDataSource *)self eventStoreProvider];
      v9 = [v8 eventStore];

      v10 = [v9 _eventOccurrenceWithURI:v7];

      if (v10)
      {
        BOOL v11 = [(CALNTriggeredEventNotificationEKDataSource *)self _shouldWithdrawNotificationWithSourceClientIdentifier:v4 event:v10 alarmID:v6];
        goto LABEL_9;
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  v10 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Failed to find event occurrence for sourceClientIdentifier %{public}@. Withdrawing notification.", buf, 0xCu);
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)shouldRemoveNotificationMetaDataWithEventID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationEKDataSource *)self _eventForEventID:v4];
  if (!v5)
  {
    id v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Failed to find event occurrence for eventID = %{public}@. Should remove notification meta data.", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5 == 0;
}

- (BOOL)shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CALNTriggeredEventNotificationEKDataSource *)self _eventForEventID:v7];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 endDate];
    if (v10)
    {
      BOOL v11 = [v6 laterDate:v10];
      char v12 = [v11 isEqualToDate:v6];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    id v13 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Failed to find event occurrence for eventID = %{public}@. Should remove time to leave refresh timer.", (uint8_t *)&v15, 0xCu);
    }

    char v12 = 1;
  }

  return v12;
}

- (id)notificationExpirationDateForEventID:(id)a3 alarmID:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CALNTriggeredEventNotificationEKDataSource *)self _eventForEventID:v6];
  if (v8)
  {
    id v9 = [(id)objc_opt_class() _alarmForEvent:v8 withAlarmID:v7];
    uint64_t v10 = [v8 startDate];
    BOOL v11 = [(id)objc_opt_class() _alarmDateForAlarm:v9 eventStartDate:v10];
    char v12 = [v8 endDate];
    id v13 = [(CALNTriggeredEventNotificationEKDataSource *)self _notificationExpirationDateForNullableAlarmDate:v11 eventEndDate:v12];
    id v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v9 absoluteDate];
      int v15 = [v9 isAbsolute];
      id v16 = @"NO";
      if (v15) {
        id v16 = @"YES";
      }
      uint64_t v20 = v16;
      uint64_t v17 = NSNumber;
      [v9 relativeOffset];
      uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
      *(_DWORD *)buf = 138545410;
      id v23 = v6;
      __int16 v24 = 2114;
      v25 = v13;
      __int16 v26 = 2114;
      v27 = v10;
      __int16 v28 = 2114;
      v29 = v12;
      __int16 v30 = 2114;
      id v31 = v7;
      __int16 v32 = 2114;
      id v33 = v11;
      __int16 v34 = 2114;
      v35 = v21;
      __int16 v36 = 2114;
      id v37 = v20;
      __int16 v38 = 2114;
      id v39 = v18;
      _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Computed notification expiration date for event id = %{public}@, expiration date = %{public}@, event start date = %{public}@, event end date = %{public}@, alarm id = %{public}@, alarm date = %{public}@, alarm absolute date = %{public}@, is alarm absolute = %{public}@, alarm relative offset %{public}@", buf, 0x5Cu);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_alarmDateForAlarm:(id)a3 eventStartDate:(id)a4
{
  id v5 = a4;
  if (!a3)
  {
    char v12 = 0;
    goto LABEL_10;
  }
  id v6 = a3;
  id v7 = [v6 absoluteDate];
  [v6 relativeOffset];
  double v9 = v8;
  int v10 = [v6 isAbsolute];

  if (v10)
  {
    id v11 = v7;
  }
  else
  {
    if (!v5)
    {
      char v12 = 0;
      goto LABEL_9;
    }
    id v11 = [v5 dateByAddingTimeInterval:v9];
  }
  char v12 = v11;
LABEL_9:

LABEL_10:
  return v12;
}

- (id)_notificationExpirationDateForNullableAlarmDate:(id)a3 eventEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if (v6)
    {
      uint64_t v10 = [(CALNTriggeredEventNotificationEKDataSource *)self _notificationExpirationDateForAlarmDate:v6 eventEndDate:v9];

      id v9 = (id)v10;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_notificationExpirationDateForAlarmDate:(id)a3 eventEndDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 timeIntervalSinceDate:v6];
  if (v7 >= 0.0)
  {
    id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v8 = [v5 dateByAddingDays:1 inCalendar:v9];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6 = a3;
  double v7 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:a4];
  if (v7)
  {
    [(CALNTriggeredEventNotificationEKDataSource *)self setUpTimeToLeaveRefreshTimerWithTriggerDate:v6 eventID:v7];
  }
  else
  {
    id v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource setUpTimeToLeaveRefreshTimerWithTriggerDate:sourceClientIdentifier:]();
    }
  }
}

- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:(id)a3 eventID:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  double v7 = [(CALNTriggeredEventNotificationEKDataSource *)self timeToLeaveRefreshMonitor];
  [v7 setUpRefreshTimerWithTriggerDate:v8 eventExternalURL:v6];

  [(CALNTriggeredEventNotificationEKDataSource *)self _didSetUpTimeToLeaveRefreshTimerForEventID:v6 triggerDate:v8];
}

- (void)removeTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:v4];
  if (v5)
  {
    [(CALNTriggeredEventNotificationEKDataSource *)self removeTimeToLeaveRefreshTimerForEventID:v5];
  }
  else
  {
    id v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "No event ID available to remove time to leave refresh timer. source client identifier = %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)removeTimeToLeaveRefreshTimerForEventID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationEKDataSource *)self timeToLeaveRefreshMonitor];
  [v5 removeRefreshTimerForEventExternalURL:v4];

  id v6 = [(CALNTriggeredEventNotificationEKDataSource *)self travelEngine];
  [v6 cancelHypothesisRefreshRequestForEventWithExternalURL:v4];

  int v7 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Cancelled hypothesis refresh request for event ID = %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_didSetUpTimeToLeaveRefreshTimerForEventID:(id)a3 triggerDate:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(CALNTriggeredEventNotificationEKDataSource *)self _requestHypothesisRefreshInterval];
  id v9 = [v7 dateByAddingTimeInterval:-v8];

  uint64_t v10 = [(CALNTriggeredEventNotificationEKDataSource *)self travelEngine];
  [v10 requestHypothesisRefreshAtDate:v9 forEventWithExternalURL:v6];

  id v11 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v9;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Requested hypothesis refresh date for event ID = %{public}@, requested hypothesis refresh date = %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (double)_requestHypothesisRefreshInterval
{
  return 60.0;
}

- (void)ceaseRouteMonitoringEventForSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:v4];
  if (v5)
  {
    [(CALNTriggeredEventNotificationEKDataSource *)self ceaseRouteMonitoringEventWithEventID:v5];
  }
  else
  {
    id v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource ceaseRouteMonitoringEventForSourceClientIdentifier:]();
    }
  }
}

- (void)ceaseRouteMonitoringEventWithEventID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationEKDataSource *)self travelEngine];
  [v5 ceaseMonitoringForEventWithExternalURL:v4];

  id v6 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Ceased route monitoring for event ID = %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)acknowledgeEventWithSourceClientIdentifier:(id)a3 shouldMarkAsHavingReceivedLocation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithBool:v4];
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v8;
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Acknowledging event with source client identifier: %{public}@, shouldMarkAsHavingReceivedLocation = %{public}@", (uint8_t *)&v12, 0x16u);
  }
  [(CALNTriggeredEventNotificationEKDataSource *)self _handleNotificationActionForSourceClientIdentifier:v6 acknowledgeAlarm:1 eventActions:0];
  if (v4)
  {
    uint64_t v9 = [(CALNTriggeredEventNotificationEKDataSource *)self coreLocationManager];
    char v10 = [v9 allowsLocationAlerts];

    if (v10)
    {
      id v11 = [(CALNTriggeredEventNotificationEKDataSource *)self coreLocationManager];
      [v11 markAsHavingReceivedLocation];
    }
    else
    {
      id v11 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CALNTriggeredEventNotificationEKDataSource acknowledgeEventWithSourceClientIdentifier:shouldMarkAsHavingReceivedLocation:]();
      }
    }
  }
}

- (void)snoozeEventWithSourceClientIdentifier:(id)a3 snoozeType:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__CALNTriggeredEventNotificationEKDataSource_snoozeEventWithSourceClientIdentifier_snoozeType___block_invoke;
  v8[3] = &unk_2645C0D48;
  char v10 = self;
  unint64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  [(CALNTriggeredEventNotificationEKDataSource *)self _handleNotificationActionForSourceClientIdentifier:v7 acknowledgeAlarm:0 eventActions:v8];
}

void __95__CALNTriggeredEventNotificationEKDataSource_snoozeEventWithSourceClientIdentifier_snoozeType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 48);
  switch(v7)
  {
    case 0:
      double v8 = 540.0;
      goto LABEL_8;
    case 1:
      double v8 = 300.0;
      goto LABEL_8;
    case 2:
      double v8 = 900.0;
      goto LABEL_8;
    case 3:
      double v8 = 1800.0;
      goto LABEL_8;
    case 4:
      double v8 = 3600.0;
      goto LABEL_8;
    case 5:
      char v10 = [v5 startDate];
      unint64_t v11 = v10;
      double v12 = -1800.0;
      goto LABEL_12;
    case 6:
      char v10 = [v5 startDate];
      unint64_t v11 = v10;
      double v12 = -900.0;
      goto LABEL_12;
    case 7:
      char v10 = [v5 startDate];
      unint64_t v11 = v10;
      double v12 = -300.0;
LABEL_12:
      id v13 = [v10 dateByAddingTimeInterval:v12];

      goto LABEL_16;
    case 8:
      uint64_t v14 = [v5 startDate];
      goto LABEL_15;
    case 9:
      uint64_t v14 = [v5 endDate];
LABEL_15:
      id v13 = (void *)v14;
LABEL_16:
      uint64_t v15 = *(void *)(a1 + 48);
      BOOL v9 = v15 == 0;
      if (v13)
      {
        [v5 snoozeAlarm:v6 untilTargetDate:v13 pinsTriggerToStartDate:v15 == 0];
        uint64_t v16 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v20 = 138543618;
          uint64_t v21 = v17;
          __int16 v22 = 2114;
          double v23 = *(double *)&v13;
          _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, "Snoozed event: %{public}@ until: %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }
      else
      {
        double v8 = 0.0;
LABEL_21:
        [v5 snoozeAlarm:v6 withTimeIntervalFromNow:v9 pinsTriggerToStartDate:v8];
        uint64_t v18 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          int v20 = 138543618;
          uint64_t v21 = v19;
          __int16 v22 = 2048;
          double v23 = v8;
          _os_log_impl(&dword_2216BB000, v18, OS_LOG_TYPE_DEFAULT, "Snoozed event: %{public}@ duration: %f", (uint8_t *)&v20, 0x16u);
        }

        id v13 = [*(id *)(a1 + 40) remoteMutator];
        [v13 setSnoozeTimeInterval:v6 alarm:v5 calendarItem:v8];
      }

      return;
    default:
      double v8 = 0.0;
LABEL_8:
      BOOL v9 = v7 == 0;
      goto LABEL_21;
  }
}

- (void)handleDirectionsActionWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4 lastFireTimeOfAlertOffsetFromTravelTime:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    id v20 = v7;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Handling directions action with source client identifier (%{public}@)", (uint8_t *)&v19, 0xCu);
  }

  if (v8)
  {
    char v10 = [(CALNTriggeredEventNotificationEKDataSource *)self eventStoreProvider];
    unint64_t v11 = [v10 eventStore];

    double v12 = [NSURL URLWithString:v7];
    id v13 = [v11 _eventOccurrenceWithURI:v12];
    uint64_t v14 = [v13 preferredLocation];
    uint64_t v15 = [v14 isPrediction];

    uint64_t v16 = [v13 calendar];
    BOOL v17 = [v16 sharingStatus] != 0;

    uint64_t v18 = [(CALNTriggeredEventNotificationEKDataSource *)self ttlEventTracker];
    +[CALNTimeToLeaveEventTrackerUtilities trackDirectionsEngagedForNotificationUsingTTLEventTracker:v18 hypothesis:v8 hasSuggestedLocation:v15 isOnSharedCalendar:v17];
  }
}

- (void)handleMailOrganizerActionWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Handling mail organizer action with source client identifier (%{public}@)", (uint8_t *)&v18, 0xCu);
  }

  if (v7)
  {
    BOOL v9 = [(CALNTriggeredEventNotificationEKDataSource *)self eventStoreProvider];
    char v10 = [v9 eventStore];

    unint64_t v11 = [NSURL URLWithString:v6];
    double v12 = [v10 _eventOccurrenceWithURI:v11];
    id v13 = [v12 preferredLocation];
    uint64_t v14 = [v13 isPrediction];

    uint64_t v15 = [v12 calendar];
    BOOL v16 = [v15 sharingStatus] != 0;

    BOOL v17 = [(CALNTriggeredEventNotificationEKDataSource *)self ttlEventTracker];
    +[CALNTimeToLeaveEventTrackerUtilities trackEmailEngagedForNotificationUsingTTLEventTracker:v17 hypothesis:v7 hasSuggestedLocation:v14 isOnSharedCalendar:v16];
  }
}

- (void)travelEngine:(id)a3 receivedHypothesis:(id)a4 eventExternalURL:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(CALNTriggeredEventNotificationEKDataSource *)self _eventForEventID:v8];
  if (v9)
  {
    char v10 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:v8 alarmID:0];
    unint64_t v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Lastest hypothesis has been emitted to be trigged as a notification. source client identifier = %{public}@, event external url = %{public}@, hypothesis = %@", (uint8_t *)&v14, 0x20u);
    }

    double v12 = [(CALNTriggeredEventNotificationEKDataSource *)self delegate];
    if (v12)
    {
      id v13 = [[CALNTriggeredEventNotificationTriggerData alloc] initWithTrigger:1 alarmID:0 isOffsetFromTravelTimeStart:0 hypothesis:v7];
      [v12 dataSource:self triggeredWithSourceClientIdentifier:v10 triggerData:v13];
    }
    else
    {
      id v13 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
        -[CALNTriggeredEventNotificationEKDataSource travelEngine:receivedHypothesis:eventExternalURL:]();
      }
    }
  }
  else
  {
    char v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource travelEngine:receivedHypothesis:eventExternalURL:]();
    }
  }
}

- (void)travelEngine:(id)a3 eventSignificantlyChangedWithEventExternalURL:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:v5 alarmID:0];
  id v7 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    unint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Travel engine event changed significantly. source client identifier = %{public}@, event external url = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v8 = [(CALNTriggeredEventNotificationEKDataSource *)self delegate];
  if (v8)
  {
    BOOL v9 = [(CALNTriggeredEventNotificationEKDataSource *)self delegate];
    [v9 dataSource:self travelEngineEventSignificantlyChangedWithSourceClientIdentifier:v6];
  }
  else
  {
    BOOL v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource travelEngine:eventSignificantlyChangedWithEventExternalURL:]();
    }
  }
}

- (void)travelEngine:(id)a3 authorizationChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CALNTriggeredEventNotificationEKDataSource *)self delegate];
  id v7 = v6;
  if (v6)
  {
    [v6 dataSource:self travelAdvisoryAuthorizationChanged:v4];
  }
  else
  {
    id v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource travelEngine:authorizationChanged:](v4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)timeToLeaveRefreshMonitor:(id)a3 refreshTimerFiredForEventExternalURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(CALNTriggeredEventNotificationEKDataSource *)self _eventForEventID:v5];
  if (v6)
  {
    id v7 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:v5 alarmID:0];
    id v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Leave now refresh timer fired for source client identifier = %{public}@, event external url = %{public}@", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v9 = [(CALNTriggeredEventNotificationEKDataSource *)self delegate];
    if (v9)
    {
      uint64_t v10 = [[CALNTriggeredEventNotificationTriggerData alloc] initWithTrigger:2 alarmID:0 isOffsetFromTravelTimeStart:0 hypothesis:0];
      [v9 dataSource:self triggeredWithSourceClientIdentifier:v7 triggerData:v10];
    }
    else
    {
      uint64_t v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
        -[CALNTriggeredEventNotificationEKDataSource timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:]();
      }
    }
  }
  else
  {
    id v7 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:]();
    }
  }
}

- (void)sendFeedbackForAddedTravelAdvisoryNotificationWithSourceClientIdentifier:(id)a3 hypothesis:(id)a4 travelAdvisoryTimelinessPeriod:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to send feedback for added notification with source client identifier = %{public}@", buf, 0xCu);
  }

  int v11 = [(CALNTriggeredEventNotificationEKDataSource *)self _eventForSourceClientIdentifier:v8];
  uint64_t v12 = [(CALNTriggeredEventNotificationEKDataSource *)self foundInAppsEventTracker];
  __int16 v13 = [(CALNTriggeredEventNotificationEKDataSource *)self suggestionsServiceLogger];
  id v14 = [(CALNTriggeredEventNotificationEKDataSource *)self ttlEventTracker];
  +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:v8 event:v11 hypothesis:v9 travelAdvisoryTimelinessPeriod:a5 foundInAppsEventTracker:v12 suggestionsServiceLogger:v13 ttlEventTracker:v14];

  uint64_t v15 = [(CALNTriggeredEventNotificationEKDataSource *)self travelEngine];
  +[CALNTriggeredEventNotificationFeedbackHelper sendFeedbackForPostingNotificationWithTravelAdvisoryTimelinessPeriod:a5 sourceClientIdentifier:v8 travelEngine:v15];
}

- (void)sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:v4];
  if (v5)
  {
    id v6 = [(CALNTriggeredEventNotificationEKDataSource *)self travelEngine];
    [v6 sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:v5];
  }
  else
  {
    id v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:]();
    }
  }
}

- (void)didDismissUINotification:(unint64_t)a3 forPlannedDestination:(id)a4 dismissalType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(CALNTriggeredEventNotificationEKDataSource *)self routeHypothesizerProvider];
  [v9 didDismissUINotification:a3 forPlannedDestination:v8 dismissalType:a5];
}

- (void)_alertsFired:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"EKAlarmEngineAlarmOccurrencesKey"];
  uint64_t v8 = [v7 count];
  id v9 = +[CALNLogSubsystem calendar];
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      int v26 = [v7 count];
      _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Received alarm engine notification with %{public}d fired alerts", buf, 8u);
    }

    int v11 = [(CALNTriggeredEventNotificationEKDataSource *)self _filterAlerts:v7];
    uint64_t v12 = [v11 count];
    if (v12 != [v7 count])
    {
      __int16 v13 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v7 count];
        int v15 = [v11 count];
        *(_DWORD *)buf = 67240192;
        int v26 = v14 - v15;
        _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Filtered out %{public}d fired alerts that referenced the same event as other alerts firing at the same time", buf, 8u);
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = v11;
    uint64_t v16 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v10);
          }
          -[CALNTriggeredEventNotificationEKDataSource _alertFiredForAlertInfo:](self, "_alertFiredForAlertInfo:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[CALNTriggeredEventNotificationEKDataSource _alertsFired:](v10);
  }
}

- (void)_alertFiredForAlertInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CALNTriggeredEventNotificationEKDataSource *)self _shouldTriggerForAlertInfo:v4])
  {
    id v5 = [(id)objc_opt_class() _sourceClientIdentifierForAlertInfo:v4];
    id v6 = [(CALNTriggeredEventNotificationEKDataSource *)self delegate];
    if (v6)
    {
      id v7 = [v4 alarmID];
      uint64_t v8 = -[CALNTriggeredEventNotificationTriggerData initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:]([CALNTriggeredEventNotificationTriggerData alloc], "initWithTrigger:alarmID:isOffsetFromTravelTimeStart:hypothesis:", 0, v7, [v4 isOffsetFromTravelTimeStart], 0);
      id v9 = [(CALNTriggeredEventNotificationEKDataSource *)self delegate];
      [v9 dataSource:self triggeredWithSourceClientIdentifier:v5 triggerData:v8];
    }
    else
    {
      uint64_t v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CALNTriggeredEventNotificationEKDataSource _alertFiredForAlertInfo:]();
      }
    }
    goto LABEL_9;
  }
  id v5 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 entityID];
    int v11 = 138543362;
    uint64_t v12 = v6;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Should not trigger for fired alert. entity ID = %{public}@", (uint8_t *)&v11, 0xCu);
LABEL_9:
  }
}

- (BOOL)_shouldTriggerForAlertInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 entityID];
  id v5 = [v4 scheme];

  if (!v5)
  {
    uint64_t v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource _shouldTriggerForAlertInfo:](v3, v10);
    }
    goto LABEL_12;
  }
  if (([v5 isEqualToString:*MEMORY[0x263F04C28]] & 1) == 0)
  {
    uint64_t v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource _shouldTriggerForAlertInfo:]();
    }
LABEL_12:

    char v9 = 0;
    goto LABEL_13;
  }
  int v6 = [v3 acknowledged];
  if (v6)
  {
    id v7 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v3 entityID];
      int v12 = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Should not trigger for acknowledged alert info. entity ID = %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  char v9 = v6 ^ 1;
LABEL_13:

  return v9;
}

- (id)_filterAlerts:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v28 = [v3 count];
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v28];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v10 = [v9 entityID];
        if (v10)
        {
          int v11 = v9;
          int v12 = [v4 objectForKeyedSubscript:v10];
          uint64_t v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 alarmID];
            int v15 = [v11 alarmID];
            uint64_t v16 = [v14 compare:v15];

            if (v16 == -1)
            {
              uint64_t v17 = v13;

              int v11 = v17;
            }
          }
          [v4 setObject:v11 forKeyedSubscript:v10];
        }
        else
        {
          int v11 = +[CALNLogSubsystem calendar];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = v9;
            _os_log_error_impl(&dword_2216BB000, v11, OS_LOG_TYPE_ERROR, "Received a fired alert, but the alert info has no entity ID: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v6);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = obj;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        uint64_t v24 = [v23 entityID];
        if (v24 && [v23 triggerType] && objc_msgSend(v23, "triggerType") != 1) {
          [v4 removeObjectForKey:v24];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v20);
  }

  if ([v4 count] == v28)
  {
    id v25 = v18;
  }
  else
  {
    id v25 = [v4 allValues];
  }
  int v26 = v25;

  return v26;
}

+ (id)_alarmForEvent:(id)a3 withAlarmID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = objc_msgSend(v5, "allAlarms", 0);
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v12 = [v11 externalID];
          char v13 = [v6 isEqualToString:v12];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldWithdrawNotificationWithSourceClientIdentifier:(id)a3 event:(id)a4 alarmID:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [(id)objc_opt_class() _alarmForEvent:v8 withAlarmID:v9];
    int v11 = v10;
    if (!v10)
    {
      int v12 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543362;
        id v29 = v7;
        _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "Failed to find alarm for sourceClientIdentifier %{public}@. Withdrawing notification.", (uint8_t *)&v28, 0xCu);
      }
      BOOL v17 = 1;
      goto LABEL_24;
    }
    int v12 = [v10 absoluteDate];
    if (v12
      && ([MEMORY[0x263EFF910] CalSimulatedDateForNow],
          char v13 = objc_claimAutoreleasedReturnValue(),
          [v12 timeIntervalSinceDate:v13],
          double v15 = v14,
          v13,
          v15 > 0.0))
    {
      long long v16 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543362;
        id v29 = v7;
        _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, "Withdrawing notification for event (%{public}@) whose alarm is now in the future.", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      long long v18 = [v11 acknowledgedDate];

      if (!v18)
      {
        BOOL v17 = 0;
LABEL_24:

        goto LABEL_25;
      }
      long long v16 = [v11 absoluteDate];
      if (!v16)
      {
        uint64_t v19 = [v8 startDate];
        uint64_t v20 = (void *)MEMORY[0x263EFF910];
        [v11 relativeOffset];
        long long v16 = objc_msgSend(v20, "dateWithTimeInterval:sinceDate:", v19);
      }
      uint64_t v21 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v22 = [v11 acknowledgedDate];
        int v28 = 138543874;
        id v29 = v7;
        __int16 v30 = 2114;
        long long v31 = v16;
        __int16 v32 = 2114;
        long long v33 = v22;
        _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Computed fire date for event (%{public}@): %{public}@. Inspecting item's alarm acknowledged date to determine whether or not to withdraw notification. Events's alarm acknowledged date: %{public}@.", (uint8_t *)&v28, 0x20u);
      }
      long long v23 = [v11 acknowledgedDate];
      [v23 timeIntervalSinceDate:v16];
      double v25 = v24;

      if (v25 < 0.0)
      {
        BOOL v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
      int v26 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543362;
        id v29 = v7;
        _os_log_impl(&dword_2216BB000, v26, OS_LOG_TYPE_DEFAULT, "Withdrawing notification for event (%{public}@) whose alarm has been acknowledged (probably on another device).", (uint8_t *)&v28, 0xCu);
      }
    }
    BOOL v17 = 1;
    goto LABEL_23;
  }
  BOOL v17 = [v8 travelAdvisoryBehavior] == 2;
LABEL_25:

  return v17;
}

- (void)_handleNotificationActionForSourceClientIdentifier:(id)a3 acknowledgeAlarm:(BOOL)a4 eventActions:(id)a5
{
  BOOL v5 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, void *))a5;
  id v21 = 0;
  id v22 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v22 andAlarmID:&v21 fromSourceClientIdentifier:a3];
  id v9 = v22;
  id v10 = v21;
  int v11 = [NSURL URLWithString:v9];
  int v12 = [(CALNTriggeredEventNotificationEKDataSource *)self eventStoreProvider];
  char v13 = [v12 eventStore];

  double v14 = [v13 _eventOccurrenceWithURI:v11];
  double v15 = [(id)objc_opt_class() _alarmForEvent:v14 withAlarmID:v10];
  if (v15)
  {
    if (v5)
    {
      long long v16 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
      [v15 setAcknowledgedDate:v16];
    }
    if (v8) {
      v8[2](v8, v14, v15);
    }
    id v20 = 0;
    char v17 = [v13 saveEvent:v14 span:2 error:&v20];
    id v18 = v20;
    if ((v17 & 1) == 0)
    {
      uint64_t v19 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v24 = v10;
        __int16 v25 = 2114;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v18;
        _os_log_error_impl(&dword_2216BB000, v19, OS_LOG_TYPE_ERROR, "Error acknowledging alarm (%{public}@) for event (%{public}@): %@", buf, 0x20u);
      }
    }
  }
}

- (id)_eventForSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:v4];
  if (v5)
  {
    id v6 = [(CALNTriggeredEventNotificationEKDataSource *)self _eventForEventID:v5];
  }
  else
  {
    id v7 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:]();
    }

    id v6 = 0;
  }

  return v6;
}

- (id)_eventForEventID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [NSURL URLWithString:v4];
  if (v5)
  {
    id v6 = [(CALNTriggeredEventNotificationEKDataSource *)self eventStoreProvider];
    id v7 = [v6 eventStore];

    id v8 = [v7 _eventOccurrenceWithURI:v5];
  }
  else
  {
    id v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationEKDataSource _eventForEventID:]();
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)_sourceClientIdentifierForAlertInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 entityID];
  BOOL v5 = [v4 absoluteString];

  id v6 = [v3 externalID];

  id v7 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities sourceClientIdentifierForEventID:v5 alarmID:v6];

  return v7;
}

- (id)eventObjectIDForEventID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNTriggeredEventNotificationEKDataSource *)self eventStoreProvider];
  id v6 = [v5 eventStore];

  id v7 = [v6 _eventOccurrenceWithURI:v4];

  id v8 = [v7 objectID];
  id v9 = [v8 stringRepresentation];

  return v9;
}

- (CALNTriggeredEventNotificationDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNTriggeredEventNotificationDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EKEventStoreProvider)eventStoreProvider
{
  return self->_eventStoreProvider;
}

- (CALNRemoteMutator)remoteMutator
{
  return self->_remoteMutator;
}

- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider
{
  return self->_dataSourceEventRepresentationProvider;
}

- (CALNCalendarCoreLocationManager)coreLocationManager
{
  return self->_coreLocationManager;
}

- (CALNTTLEventTracker)ttlEventTracker
{
  return self->_ttlEventTracker;
}

- (CALNAlarmEngineMonitor)alarmEngineMonitor
{
  return self->_alarmEngineMonitor;
}

- (CALNTravelEngine)travelEngine
{
  return self->_travelEngine;
}

- (CALNFoundInAppsEventTracker)foundInAppsEventTracker
{
  return self->_foundInAppsEventTracker;
}

- (CALNSuggestionsServiceLogger)suggestionsServiceLogger
{
  return self->_suggestionsServiceLogger;
}

- (CALNRouteHypothesizerProvider)routeHypothesizerProvider
{
  return self->_routeHypothesizerProvider;
}

- (CALNTimeToLeaveRefreshMonitor)timeToLeaveRefreshMonitor
{
  return self->_timeToLeaveRefreshMonitor;
}

- (CALNDebugPreferences)debugPreferences
{
  return self->_debugPreferences;
}

- (CALNTriggeredEventNotificationMailtoURLProvider)mailtoURLProvider
{
  return self->_mailtoURLProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailtoURLProvider, 0);
  objc_storeStrong((id *)&self->_debugPreferences, 0);
  objc_storeStrong((id *)&self->_timeToLeaveRefreshMonitor, 0);
  objc_storeStrong((id *)&self->_routeHypothesizerProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsServiceLogger, 0);
  objc_storeStrong((id *)&self->_foundInAppsEventTracker, 0);
  objc_storeStrong((id *)&self->_travelEngine, 0);
  objc_storeStrong((id *)&self->_alarmEngineMonitor, 0);
  objc_storeStrong((id *)&self->_ttlEventTracker, 0);
  objc_storeStrong((id *)&self->_coreLocationManager, 0);
  objc_storeStrong((id *)&self->_dataSourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_remoteMutator, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (double)snoozeInterval
{
  return 540.0;
}

- (void)fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Could not get event for source client identifier with protected data available. source client identifier = %{public}@, event ID = %{public}@. Could not get notification info as a result.");
}

- (void)fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Could not get event ID url to use for fetching triggered event notification info. source client identifier = %{public}@, event ID = %{public}@");
}

- (void)setUpTimeToLeaveRefreshTimerWithTriggerDate:sourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "No event ID available to set up time to leave refresh timer. source client identifier = @{public}@, trigger date = %{public}@", v2, v3, v4, v5, v6);
}

- (void)ceaseRouteMonitoringEventForSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get event ID to cease route monitoring event for source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)acknowledgeEventWithSourceClientIdentifier:shouldMarkAsHavingReceivedLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Cannot mark as having received location because location alerts are not allowed, source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)travelEngine:receivedHypothesis:eventExternalURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Could not fetch event for event id = %{public}@. Suppressing received hypothesis trigger as a result, hypothesis = %@");
}

- (void)travelEngine:receivedHypothesis:eventExternalURL:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "No delegate to send travel advice received message. event external url = %{public}@", v2, v3, v4, v5, v6);
}

- (void)travelEngine:eventSignificantlyChangedWithEventExternalURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "No delegate to send travel engine event significantly changed. event external url = %{public}@", v2, v3, v4, v5, v6);
}

- (void)travelEngine:(uint64_t)a3 authorizationChanged:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, a2, a3, "No delegate to send travel engine authorization changed message. authorized = %{public}@", a5, a6, a7, a8, 2u);
}

- (void)timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not fetch event for event id = %{public}@. Suppressing time to leave refresh timer trigger as a result.", v2, v3, v4, v5, v6);
}

- (void)timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "No delegate to send time to leave refresh timer fired message. event external url = %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get event ID for source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_alertsFired:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Received alarm engine notification without any fired alarms", v1, 2u);
}

- (void)_alertFiredForAlertInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "No delegate available to send alert fired message. source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_shouldTriggerForAlertInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 entityID];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Should not trigger for fired alert info without scheme. entity ID = %{public}@", v4, 0xCu);
}

- (void)_shouldTriggerForAlertInfo:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Should not trigger for fired alert with entity ID scheme = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_eventForEventID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get event ID url for event ID = %{public}@", v2, v3, v4, v5, v6);
}

@end