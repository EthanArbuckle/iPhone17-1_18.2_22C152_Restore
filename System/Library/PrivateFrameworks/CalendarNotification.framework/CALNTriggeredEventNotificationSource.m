@interface CALNTriggeredEventNotificationSource
+ (NSString)conferenceURLUserInfoKey;
+ (NSString)mailToURLUserInfoKey;
+ (NSString)mapItemURLUserInfoKey;
+ (id)_conferenceURLForNotification:(id)a3;
+ (id)_mailtoURLForNotification:(id)a3;
+ (id)_mapItemURLForNotification:(id)a3;
+ (id)_mergeDataFromUnprotectedStore:(id)a3 withDataInProtectedStore:(id)a4;
+ (id)conferenceCallActionIdentifier;
+ (id)directionsActionIdentifier;
+ (id)mailOrganizerActionIdentifier;
+ (id)snoozeActionIdentifier;
- (BOOL)_isNotificationMetaDataExpired:(id)a3 eventID:(id)a4;
- (BOOL)_itemWithEventID:(id)a3 affectedByChangesToObjects:(id)a4;
- (BOOL)_mayCeaseRouteMonitoringForExistingNotificationData:(id)a3;
- (BOOL)_notificationWithSourceClientIdentifier:(id)a3 affectedByChangesToObjects:(id)a4;
- (BOOL)_shouldCeaseRouteMonitoringEventForSourceClientIdentifier:(id)a3;
- (BOOL)_shouldRemoveNotificationMetaData:(id)a3 eventID:(id)a4;
- (BOOL)_shouldRemoveStoredNotificationDataGivenShouldWithdrawNotification:(BOOL)a3 hasExistingTravelInformation:(BOOL)a4 mayCeaseRouteMonitoring:(BOOL)a5;
- (BOOL)_shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4;
- (BOOL)_shouldUpdateStoredNotificationDataGivenTransition:(unint64_t)a3;
- (BOOL)_sourceClientIdentifier:(id)a3 matchesEventForSourceClientIdentifier:(id)a4;
- (BOOL)migrateToStorage:(id)a3;
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNNotificationManager)notificationManager;
- (CALNSnoozeUpdateTimer)snoozeUpdateTimer;
- (CALNSourceEventRepresentationProvider)sourceEventRepresentationProvider;
- (CALNTimeToLeaveRefreshStorage)timeToLeaveRefreshStorage;
- (CALNTravelAdvisoryTimelinessAuthority)travelAdvisoryTimelinessAuthority;
- (CALNTriggeredEventNotificationBodyDescriptionProvider)bodyDescriptionProvider;
- (CALNTriggeredEventNotificationDataSource)dataSource;
- (CALNTriggeredEventNotificationDataStorage)notificationDataStorage;
- (CALNTriggeredEventNotificationMapItemURLProvider)mapItemURLProvider;
- (CALNTriggeredEventNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6 triggerHelper:(id)a7 transitionProvider:(id)a8 bodyDescriptionProvider:(id)a9 travelAdvisoryTimelinessAuthority:(id)a10 dateProvider:(id)a11 notificationDataStorage:(id)a12 urlHandler:(id)a13 mapItemURLProvider:(id)a14 timeToLeaveRefreshStorage:(id)a15 snoozeUpdateTimer:(id)a16;
- (CALNTriggeredEventNotificationTransitionProvider)transitionProvider;
- (CALNTriggeredEventNotificationTriggerHelper)triggerHelper;
- (CALNURLHandler)urlHandler;
- (CalDateProvider)dateProvider;
- (NSArray)categories;
- (NSMutableDictionary)eventURLToObjectIDMap;
- (NSString)sourceIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_contentForNotificationWithSourceClientIdentifier:(id)a3;
- (id)_contentForNotificationWithSourceClientIdentifier:(id)a3 shouldClearHypothesis:(BOOL)a4;
- (id)_eventRepresentationDictionaryWithSourceNotificationInfo:(id)a3 hypothesisMessage:(id)a4;
- (id)_existingNotificationDataMatchingEventForSourceClientIdentifier:(id)a3;
- (id)_existingRecordMatchingEventForSourceClientIdentifier:(id)a3;
- (id)_existingRecordMatchingEventForSourceClientIdentifier:(id)a3 existingRecords:(id)a4;
- (id)_launchURLForResponse:(id)a3;
- (id)_notificationDataForSourceNotificationInfo:(id)a3 existingNotificationData:(id)a4 transition:(unint64_t)a5 now:(id)a6;
- (id)_notificationResponseDataForRecord:(id)a3;
- (id)_notificationResponseDataForSourceNotificationInfo:(id)a3;
- (id)_resolvedSourceClientIdentifierForNewSourceClientIdentifier:(id)a3 oldSourceClientIdentifier:(id)a4;
- (id)_sourceNotificationInfoForSourceClientIdentifier:(id)a3 notificationInfo:(id)a4 existingNotificationData:(id)a5 hypothesis:(id)a6 shouldClearHypothesis:(BOOL)a7 isOffsetFromTravelTimeStart:(BOOL)a8 isForContentCreation:(BOOL)a9;
- (id)_sourceNotificationInfoForSourceClientIdentifier:(id)a3 shouldClearHypothesis:(BOOL)a4 isForContentCreation:(BOOL)a5;
- (id)_updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:(BOOL)a3;
- (id)_updatedNotificationDataResettingTimeToLeaveDisplayState:(id)a3;
- (id)_updatedSourceNotificationInfoForContentCreation:(id)a3;
- (id)contentForNotificationWithSourceClientIdentifier:(id)a3;
- (id)contentForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 isProtectedDataAvailable:(BOOL)a5;
- (unint64_t)_calnTravelAdvisoryTimelinessPeriodFromEKTravelAvisoryTimelinessPeriod:(unint64_t)a3;
- (unint64_t)_travelAdvisoryTimelinessPeriodForHypothesis:(id)a3;
- (void)_addEventURL:(id)a3 mappingToEventObjectID:(id)a4;
- (void)_addNotificationData:(id)a3 forSourceClientIdentifier:(id)a4;
- (void)_addNotificationDataForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 transition:(unint64_t)a6 now:(id)a7;
- (void)_addRecord:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 trigger:(unint64_t)a6 transition:(unint64_t)a7 now:(id)a8;
- (void)_clearTravelAdvisoryFromNotificationMetaDataForSourceClientIdentifier:(id)a3;
- (void)_clearTravelAdvisoryHypotheses;
- (void)_commonHandleResponse:(id)a3;
- (void)_didReceiveResponse:(id)a3;
- (void)_handleConferenceCallActionWithResponse:(id)a3;
- (void)_handleDirectionsActionWithResponse:(id)a3;
- (void)_handleMailOrganizerActionWithResponse:(id)a3;
- (void)_notificationAddedWithSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 trigger:(unint64_t)a5;
- (void)_refreshNotification:(id)a3;
- (void)_refreshNotificationMetaData:(id)a3 eventID:(id)a4;
- (void)_refreshNotificationMetaDataWithObjectIDs:(id)a3;
- (void)_refreshNotificationRecordsWithObjectIDs:(id)a3;
- (void)_refreshNotifications:(id)a3;
- (void)_refreshTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4;
- (void)_refreshTimeToLeaveRefreshTimersWithObjectIDs:(id)a3;
- (void)_removeStoredNotificationDataForEventWithEventID:(id)a3;
- (void)_resetStoredNotificationDataTimeToLeaveDisplayStateForSourceClientIdentifier:(id)a3;
- (void)_setNotificationResponseData:(id)a3 onNotificationContent:(id)a4;
- (void)_travelAdvisoryAuthorizationChanged:(BOOL)a3;
- (void)_travelEngineEventSignificantlyChangedWithSourceClientIdentifier:(id)a3;
- (void)_triggeredWithSourceClientIdentifier:(id)a3 triggerData:(id)a4;
- (void)_updateNotification:(id)a3 shouldClearHypothesis:(BOOL)a4;
- (void)_updateSnoozeOptionsForEvents:(id)a3;
- (void)_updateStoredNotificationDataForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 transition:(unint64_t)a6 now:(id)a7;
- (void)_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3;
- (void)_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3 hypothesis:(id)a4 allowsLocationAlerts:(BOOL)a5 travelAdvisoryDisabled:(BOOL)a6;
- (void)dataSource:(id)a3 travelAdvisoryAuthorizationChanged:(BOOL)a4;
- (void)dataSource:(id)a3 travelEngineEventSignificantlyChangedWithSourceClientIdentifier:(id)a4;
- (void)dataSource:(id)a3 triggeredWithSourceClientIdentifier:(id)a4 triggerData:(id)a5;
- (void)didReceiveResponse:(id)a3;
- (void)refreshNotification:(id)a3;
- (void)refreshNotifications:(id)a3;
- (void)snoozeTimerFiredForEvents:(id)a3;
- (void)updateSnoozeOptionsForPostedNotifications;
- (void)willPostNotification:(id)a3;
@end

@implementation CALNTriggeredEventNotificationSource

- (CALNTriggeredEventNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6 triggerHelper:(id)a7 transitionProvider:(id)a8 bodyDescriptionProvider:(id)a9 travelAdvisoryTimelinessAuthority:(id)a10 dateProvider:(id)a11 notificationDataStorage:(id)a12 urlHandler:(id)a13 mapItemURLProvider:(id)a14 timeToLeaveRefreshStorage:(id)a15 snoozeUpdateTimer:(id)a16
{
  id v50 = a3;
  id v21 = a4;
  id v49 = a5;
  id v48 = a6;
  id v47 = a7;
  id v46 = a8;
  id v45 = a9;
  id v44 = a10;
  id v43 = a11;
  id v42 = a12;
  id v41 = a13;
  id v40 = a14;
  id v39 = a15;
  id v22 = a16;
  v51.receiver = self;
  v51.super_class = (Class)CALNTriggeredEventNotificationSource;
  v23 = [(CALNTriggeredEventNotificationSource *)&v51 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_dataSource, a3);
    objc_storeWeak((id *)&v24->_notificationManager, v21);
    objc_storeStrong((id *)&v24->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v24->_sourceEventRepresentationProvider, a6);
    objc_storeStrong((id *)&v24->_triggerHelper, a7);
    objc_storeStrong((id *)&v24->_transitionProvider, a8);
    objc_storeStrong((id *)&v24->_bodyDescriptionProvider, a9);
    objc_storeStrong((id *)&v24->_travelAdvisoryTimelinessAuthority, a10);
    objc_storeStrong((id *)&v24->_dateProvider, a11);
    objc_storeStrong((id *)&v24->_notificationDataStorage, a12);
    objc_storeStrong((id *)&v24->_urlHandler, a13);
    objc_storeStrong((id *)&v24->_mapItemURLProvider, a14);
    objc_storeStrong((id *)&v24->_timeToLeaveRefreshStorage, a15);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v25 = v22;
    id v26 = v21;
    id v27 = objc_claimAutoreleasedReturnValue();
    v28 = (const char *)[v27 UTF8String];

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create(v28, v29);
    workQueue = v24->_workQueue;
    v24->_workQueue = (OS_dispatch_queue *)v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventURLToObjectIDMap = v24->_eventURLToObjectIDMap;
    v24->_eventURLToObjectIDMap = v32;

    objc_storeStrong((id *)&v24->_snoozeUpdateTimer, a16);
    v34 = [(CALNTriggeredEventNotificationSource *)v24 dataSource];
    [v34 setDelegate:v24];

    v35 = [(CALNTriggeredEventNotificationSource *)v24 snoozeUpdateTimer];
    [v35 setDelegate:v24];

    id v21 = v26;
    id v22 = v25;
  }

  return v24;
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__CALNTriggeredEventNotificationSource_contentForNotificationWithSourceClientIdentifier___block_invoke;
  block[3] = &unk_2645C0E10;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __89__CALNTriggeredEventNotificationSource_contentForNotificationWithSourceClientIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _contentForNotificationWithSourceClientIdentifier:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (id)contentForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 isProtectedDataAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v99 = *MEMORY[0x263EF8340];
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v86 = v8;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Getting content for source client identifier = %{public}@", buf, 0xCu);
  }

  v11 = +[CALNBundle bundle];
  uint64_t v12 = [v9 title];
  v74 = v11;
  if ([v12 length])
  {
    v81 = v12;
  }
  else
  {
    v81 = [v11 localizedStringForKey:@"Event" value:&stru_26D3B3198 table:0];

    if (v5)
    {
      v13 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CALNTriggeredEventNotificationSource contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:]();
      }
    }
  }
  uint64_t v14 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  v15 = [v9 eventID];
  v16 = [v9 alarmID];
  v80 = [v14 notificationExpirationDateForEventID:v15 alarmID:v16];

  v79 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.upcomingEvents"];
  id v17 = [(CALNTriggeredEventNotificationSource *)self iconIdentifierProvider];
  v18 = [v9 startDate];
  v19 = [MEMORY[0x263EFF8F0] currentCalendar];
  v78 = [v17 identifierForIconWithDate:v18 inCalendar:v19];

  v20 = @"com.apple.calendar.notifications.TriggeredEvent";
  uint64_t v21 = [v9 alarmID];
  id v22 = [v9 mapItemURL];
  v23 = [v9 conferenceURL];
  v24 = [v9 mapItemURL];

  v82 = [v9 mailtoURL];

  v76 = v22;
  v77 = (void *)v21;
  v75 = v23;
  v72 = v24;
  if (v21 && !v24 && !v23 && !v82)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Snooze;
LABEL_14:
    v71 = v8;
    id v26 = *v25;

LABEL_15:
    uint64_t v27 = [v9 startDate];
    v28 = [v9 endDate];
    uint64_t v29 = [v9 isAllDay];
    dispatch_queue_t v30 = [(CALNTriggeredEventNotificationSource *)self dateProvider];
    v31 = [v30 now];
    v32 = +[CALNSnoozeCategory snoozeCategoryForEventWithStartDate:v27 endDate:v28 now:v31 isAllDay:v29];

    v33 = [v32 suffix];
    v34 = [(__CFString *)v26 stringByAppendingString:v33];

    v84 = [v32 expirationDateForEventWithStartDate:v27 endDate:v28 isAllDay:v29];
    [v32 leeway];
    double v36 = v35;

    v20 = (__CFString *)v27;
    v8 = v71;
    id v22 = v76;
    uint64_t v21 = (uint64_t)v77;
    v23 = v75;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v37 = v24 == 0;
  if (v24 && !v21 && !v23 && !v82)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions;
LABEL_31:
    v34 = *v38;
    v84 = 0;
    double v36 = 0.0;
    goto LABEL_32;
  }
  BOOL v39 = v23 == 0;
  if (v23 && !v21 && !v24 && !v82)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall;
    goto LABEL_31;
  }
  BOOL v40 = v82 == 0;
  if (v82 && !v21 && !v24 && !v23)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_MailOrganizer;
    goto LABEL_31;
  }
  if (v21 != 0 && v24 != 0 && !v23 && !v82)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_Snooze;
    goto LABEL_14;
  }
  if (v21 != 0 && v23 != 0 && !v24 && !v82)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall_Snooze;
    goto LABEL_14;
  }
  if (v21 != 0 && v82 != 0 && !v24 && !v23)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  int v68 = v39 || v37;
  if (v23 != 0 && v24 != 0 && !v21 && !v82)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall;
    goto LABEL_31;
  }
  BOOL v69 = v37 || v40;
  if (!v69 && !v21 && !v23)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_MailOrganizer;
    goto LABEL_31;
  }
  BOOL v70 = v39 || v40;
  if (!v70 && !v21 && !v24)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall_MailOrganizer;
    goto LABEL_31;
  }
  if (!(v68 & 1 | (v21 == 0)) && !v82)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall_Snooze;
    goto LABEL_14;
  }
  if (!(v68 & 1 | (v82 == 0)) && !v21)
  {
    v38 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall_MailOrganizer;
    goto LABEL_31;
  }
  if (!v69 && v21 != 0 && !v23)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  if (!v70 && v21 != 0 && !v24)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_ConferenceCall_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  v71 = v8;
  if ((v68 | (v21 == 0) | v40) != 1)
  {
    id v25 = kCALNTriggeredEventNotificationCategoryIdentifier_Directions_ConferenceCall_MailOrganizer_Snooze;
    goto LABEL_14;
  }
  if (v21)
  {
    id v26 = v20;
    goto LABEL_15;
  }
  v84 = 0;
  double v36 = 0.0;
  v34 = v20;
LABEL_33:
  id v41 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    v86 = v34;
    __int16 v87 = 1024;
    BOOL v88 = v21 != 0;
    __int16 v89 = 1024;
    BOOL v90 = v72 != 0;
    __int16 v91 = 1024;
    BOOL v92 = v23 != 0;
    __int16 v93 = 1024;
    BOOL v94 = v82 != 0;
    __int16 v95 = 2112;
    v96 = v8;
    __int16 v97 = 2114;
    v98 = v84;
    _os_log_impl(&dword_2216BB000, v41, OS_LOG_TYPE_DEFAULT, "Category identifier for content = %{public}@, should include snooze action = (%{BOOL}d), should include directions action = (%{BOOL}d), should include conference call action = (%{BOOL}d), should include mail organizer action = (%{BOOL}d), source client identifier = %@, snoozeCategoryExpirationDate = %{public}@", buf, 0x38u);
  }
  v83 = v34;

  id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v43 = [v9 eventID];
  if (v43) {
    [v42 setObject:v43 forKeyedSubscript:@"entityID"];
  }
  v73 = (void *)v43;
  if (v21) {
    [v42 setObject:v21 forKeyedSubscript:@"AlarmID"];
  }
  if (v22)
  {
    id v44 = [v22 absoluteString];
    [v42 setObject:v44 forKeyedSubscript:@"MapItemURL"];
  }
  if (v23)
  {
    id v45 = [v23 absoluteString];
    [v42 setObject:v45 forKeyedSubscript:@"ConferenceURL"];
  }
  id v46 = [v9 mailtoURL];

  if (v46)
  {
    id v47 = [v9 mailtoURL];
    id v48 = [v47 absoluteString];
    [v42 setObject:v48 forKeyedSubscript:@"mailto"];
  }
  if (v84)
  {
    [v42 setObject:v84 forKeyedSubscript:@"snoozeCategoryExpirationDate"];
    id v49 = [NSNumber numberWithDouble:v36];
    [v42 setObject:v49 forKeyedSubscript:@"snoozeCategoryExpirationLeeway"];
  }
  id v50 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isAllDay"));
  [v42 setObject:v50 forKeyedSubscript:@"allDay"];

  objc_super v51 = [v9 endDate];
  [v42 setObject:v51 forKeyedSubscript:@"endDate"];

  buf[0] = 0;
  v52 = [(CALNTriggeredEventNotificationSource *)self bodyDescriptionProvider];
  v53 = [v52 bodyForSourceClientIdentifier:v8 sourceNotificationInfo:v9 bodyContainsTravelAdvice:buf];

  v54 = objc_alloc_init(CALNMutableNotificationContent);
  [(CALNMutableNotificationContent *)v54 setTitle:v81];
  [(CALNMutableNotificationContent *)v54 setBody:v53];
  [(CALNMutableNotificationContent *)v54 setCategoryIdentifier:v83];
  [(CALNMutableNotificationContent *)v54 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.upcomingEvents"];
  v55 = [v9 startDate];
  [(CALNMutableNotificationContent *)v54 setDate:v55];

  [(CALNMutableNotificationContent *)v54 setExpirationDate:v80];
  v56 = [v9 launchURL];
  [(CALNMutableNotificationContent *)v54 setDefaultActionURL:v56];

  [(CALNMutableNotificationContent *)v54 setIconIdentifier:v78];
  -[CALNMutableNotificationContent setShouldHideTime:](v54, "setShouldHideTime:", [v9 isAllDay]);
  [(CALNMutableNotificationContent *)v54 setShouldSuppressSyncDismissalWhenRemoved:0];
  [(CALNMutableNotificationContent *)v54 setSound:v79];
  [(CALNMutableNotificationContent *)v54 setThreadIdentifier:@"upcomingEventsThread"];
  [(CALNMutableNotificationContent *)v54 setUserInfo:v42];
  if ([v9 isTimeSensitive]) {
    uint64_t v57 = 2;
  }
  else {
    uint64_t v57 = 1;
  }
  [(CALNMutableNotificationContent *)v54 setInterruptionLevel:v57];
  v58 = [v9 calendarIdentifier];
  [(CALNMutableNotificationContent *)v54 setFilterCriteria:v58];

  v59 = v8;
  if (buf[0]) {
    id v60 = v53;
  }
  else {
    id v60 = 0;
  }
  v61 = self;
  v62 = [(CALNTriggeredEventNotificationSource *)self _eventRepresentationDictionaryWithSourceNotificationInfo:v9 hypothesisMessage:v60];
  if (v62) {
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:v62 onNotificationContent:v54];
  }
  v63 = [v9 legacyIdentifier];

  if (v63)
  {
    v64 = [v9 legacyIdentifier];
    +[CALNLegacyIdentifierUtils setLegacyIdentifier:v64 onNotificationContent:v54];
  }
  v65 = [(CALNTriggeredEventNotificationSource *)v61 _notificationResponseDataForSourceNotificationInfo:v9];
  [(CALNTriggeredEventNotificationSource *)v61 _setNotificationResponseData:v65 onNotificationContent:v54];
  v66 = (void *)[(CALNMutableNotificationContent *)v54 copy];

  return v66;
}

- (void)willPostNotification:(id)a3
{
  id v4 = a3;
  id v11 = [v4 sourceClientIdentifier];
  BOOL v5 = [v4 content];

  id v6 = [v5 userInfo];

  id v7 = [v6 objectForKeyedSubscript:@"AlarmID"];
  v8 = [v6 objectForKeyedSubscript:@"snoozeCategoryExpirationDate"];
  id v9 = [v6 objectForKeyedSubscript:@"snoozeCategoryExpirationLeeway"];
  if (v7)
  {
    id v10 = [(CALNTriggeredEventNotificationSource *)self snoozeUpdateTimer];
    objc_msgSend(v10, "setFireDate:leeway:forEventWithIdentifier:", v8, v11, (double)objc_msgSend(v9, "integerValue"));
  }
}

- (void)refreshNotifications:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CALNTriggeredEventNotificationSource_refreshNotifications___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __61__CALNTriggeredEventNotificationSource_refreshNotifications___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshNotifications:*(void *)(a1 + 40)];
}

- (void)didReceiveResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CALNTriggeredEventNotificationSource_didReceiveResponse___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __59__CALNTriggeredEventNotificationSource_didReceiveResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveResponse:*(void *)(a1 + 40)];
}

- (void)_didReceiveResponse:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 actionIdentifier];
  id v7 = [v4 notificationRecord];
  id v8 = [v7 sourceClientIdentifier];

  id v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    __int16 v25 = 2114;
    id v26 = v8;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Received notification response with action identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);
  }

  int v10 = [v6 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"];
  if ((v10 & 1) != 0
    || [v6 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    id v11 = [v4 notificationRecord];
    uint64_t v12 = [v11 content];
    v13 = [v12 userInfo];

    uint64_t v14 = [v13 objectForKeyedSubscript:@"IsLocation"];
    LODWORD(v12) = [v14 BOOLValue];

    v15 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v15 acknowledgeEventWithSourceClientIdentifier:v8 shouldMarkAsHavingReceivedLocation:v10 & v12];
  }
  else if ([v6 isEqualToString:@"CALNNotificationDirectionsAction"])
  {
    [(CALNTriggeredEventNotificationSource *)self _handleDirectionsActionWithResponse:v4];
  }
  else if ([v6 isEqualToString:@"CALNNotificationConferenceCallAction"])
  {
    [(CALNTriggeredEventNotificationSource *)self _handleConferenceCallActionWithResponse:v4];
  }
  else if ([v6 isEqualToString:@"Mail_identifier"])
  {
    [(CALNTriggeredEventNotificationSource *)self _handleMailOrganizerActionWithResponse:v4];
  }
  else
  {
    v21[0] = @"CALNTriggeredEventNotificationSnoozeActionIdentifier";
    v21[1] = @"CALNTriggeredEventNotificationSnooze5MinutesActionIdentifier";
    v22[0] = &unk_26D3C5E08;
    v22[1] = &unk_26D3C5E20;
    v21[2] = @"CALNTriggeredEventNotificationSnooze15MinutesActionIdentifier";
    v21[3] = @"CALNTriggeredEventNotificationSnooze30MinutesActionIdentifier";
    v22[2] = &unk_26D3C5E38;
    v22[3] = &unk_26D3C5E50;
    v21[4] = @"CALNTriggeredEventNotificationSnooze1HourActionIdentifier";
    v21[5] = @"CALNTriggeredEventNotificationSnoozeUntil30MinutesBeforeActionIdentifier";
    v22[4] = &unk_26D3C5E68;
    v22[5] = &unk_26D3C5E80;
    v21[6] = @"CALNTriggeredEventNotificationSnoozeUntil15MinutesBeforeActionIdentifier";
    v21[7] = @"CALNTriggeredEventNotificationSnoozeUntil5MinutesBeforeActionIdentifier";
    v22[6] = &unk_26D3C5E98;
    v22[7] = &unk_26D3C5EB0;
    v21[8] = @"CALNTriggeredEventNotificationSnoozeUntilStartActionIdentifier";
    v21[9] = @"CALNTriggeredEventNotificationSnoozeUntilEndActionIdentifier";
    v22[8] = &unk_26D3C5EC8;
    v22[9] = &unk_26D3C5EE0;
    v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:10];
    v19 = [v18 objectForKeyedSubscript:v6];
    if (v19)
    {
      v20 = [(CALNTriggeredEventNotificationSource *)self dataSource];
      objc_msgSend(v20, "snoozeEventWithSourceClientIdentifier:snoozeType:", v8, objc_msgSend(v19, "unsignedIntegerValue"));
    }
  }
  if ([(CALNTriggeredEventNotificationSource *)self _shouldCeaseRouteMonitoringEventForSourceClientIdentifier:v8])
  {
    v16 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v16 ceaseRouteMonitoringEventForSourceClientIdentifier:v8];

    [(CALNTriggeredEventNotificationSource *)self _clearTravelAdvisoryFromNotificationMetaDataForSourceClientIdentifier:v8];
    id v17 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v17 removeTimeToLeaveRefreshTimerForSourceClientIdentifier:v8];
  }
}

- (NSString)sourceIdentifier
{
  return (NSString *)@"com.apple.calendar.notifications.TimeTriggeredEvent";
}

- (NSArray)categories
{
  if (categories_onceToken_4 != -1) {
    dispatch_once(&categories_onceToken_4, &__block_literal_global_16);
  }
  v2 = (void *)categories_categories_4;
  return (NSArray *)v2;
}

void __50__CALNTriggeredEventNotificationSource_categories__block_invoke()
{
  v83[1] = *MEMORY[0x263EF8340];
  id v60 = +[CALNBundle bundle];
  v58 = [v60 localizedStringForKey:@"notification.hiddenPreviewsBodyPlaceholder.upcomingEvent" value:@"Upcoming Event" table:0];
  uint64_t v57 = [v60 localizedStringForKey:@"%u more upcoming events" value:&stru_26D3B3198 table:0];
  v0 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v83[0] = v0;
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:1];

  v82[0] = v59;
  v81[0] = @"com.apple.calendar.notifications.TriggeredEvent";
  v81[1] = @"com.apple.calendar.notifications.TriggeredEvent.Snooze";
  v56 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v80 = v56;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
  v82[1] = v55;
  v81[2] = @"com.apple.calendar.notifications.TriggeredEvent.Directions";
  v54 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v79 = v54;
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
  v82[2] = v53;
  v81[3] = @"com.apple.calendar.notifications.TriggeredEvent.ConferenceCall";
  v52 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v78 = v52;
  objc_super v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
  v82[3] = v51;
  v81[4] = @"com.apple.calendar.notifications.TriggeredEvent.MailOrganizer";
  id v50 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v77 = v50;
  id v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  v82[4] = v49;
  v81[5] = @"com.apple.calendar.notifications.TriggeredEvent.Directions.Snooze";
  id v48 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v76[0] = v48;
  id v47 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v76[1] = v47;
  id v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
  v82[5] = v46;
  v81[6] = @"com.apple.calendar.notifications.TriggeredEvent.ConferenceCall.Snooze";
  id v45 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v75[0] = v45;
  id v44 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v75[1] = v44;
  uint64_t v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:2];
  v82[6] = v43;
  v81[7] = @"com.apple.calendar.notifications.TriggeredEvent.MailOrganizer.Snooze";
  id v42 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v74[0] = v42;
  id v41 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v74[1] = v41;
  BOOL v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
  v82[7] = v40;
  v81[8] = @"com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall";
  BOOL v39 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v73[0] = v39;
  v38 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v73[1] = v38;
  BOOL v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
  v82[8] = v37;
  v81[9] = @"com.apple.calendar.notifications.TriggeredEvent.Directions.MailOrganizer";
  double v36 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v72[0] = v36;
  double v35 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v72[1] = v35;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
  v82[9] = v34;
  v81[10] = @"com.apple.calendar.notifications.TriggeredEvent.ConferenceCall.MailOrganizer";
  v33 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v71[0] = v33;
  v32 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v71[1] = v32;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  v82[10] = v31;
  v81[11] = @"com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall.Snooze";
  dispatch_queue_t v30 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v70[0] = v30;
  uint64_t v29 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v70[1] = v29;
  v28 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v70[2] = v28;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:3];
  v82[11] = v27;
  v81[12] = @"com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall.MailOrganizer";
  id v26 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v69[0] = v26;
  __int16 v25 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v69[1] = v25;
  v23 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v69[2] = v23;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:3];
  v82[12] = v22;
  v81[13] = @"com.apple.calendar.notifications.TriggeredEvent.Directions.MailOrganizer.Snooze";
  uint64_t v21 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v68[0] = v21;
  v20 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v68[1] = v20;
  v19 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v68[2] = v19;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:3];
  v82[13] = v1;
  v81[14] = @"com.apple.calendar.notifications.TriggeredEvent.ConferenceCall.MailOrganizer.Snooze";
  v2 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v67[0] = v2;
  v3 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v67[1] = v3;
  id v4 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v67[2] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
  v82[14] = v5;
  v81[15] = @"com.apple.calendar.notifications.TriggeredEvent.Directions.ConferenceCall.MailOrganizer.Snooze";
  id v6 = +[CALNTriggeredEventNotificationActionUtilities directionsAction];
  v66[0] = v6;
  id v7 = +[CALNTriggeredEventNotificationActionUtilities conferenceCallAction];
  v66[1] = v7;
  id v8 = +[CALNTriggeredEventNotificationActionUtilities mailOrganizerAction];
  v66[2] = v8;
  id v9 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  v66[3] = v9;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
  v82[15] = v10;
  v24 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:16];

  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v24, "count"));
  uint64_t v12 = +[CALNSnoozeCategory snoozeCategories];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __50__CALNTriggeredEventNotificationSource_categories__block_invoke_2;
  v61[3] = &unk_2645C13A0;
  id v62 = v12;
  id v63 = v58;
  id v64 = v57;
  id v65 = v11;
  id v13 = v11;
  id v14 = v57;
  id v15 = v58;
  id v16 = v12;
  [v24 enumerateKeysAndObjectsUsingBlock:v61];
  uint64_t v17 = [v13 copy];
  v18 = (void *)categories_categories_4;
  categories_categories_4 = v17;
}

void __50__CALNTriggeredEventNotificationSource_categories__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CALNTriggeredEventNotificationActionUtilities snoozeAction];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [v13 actions];
          id v15 = [v6 arrayByAddingObjectsFromArray:v14];

          id v16 = [v13 suffix];
          uint64_t v17 = [v5 stringByAppendingString:v16];

          v18 = +[CALNNotificationCategory categoryWithIdentifier:v17 actions:v15 hiddenPreviewsBodyPlaceholder:*(void *)(a1 + 40) options:2 categorySummaryFormat:*(void *)(a1 + 48)];
          [*(id *)(a1 + 56) addObject:v18];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v19 = +[CALNNotificationCategory categoryWithIdentifier:v5 actions:v6 hiddenPreviewsBodyPlaceholder:*(void *)(a1 + 40) options:2 categorySummaryFormat:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) addObject:v19];
  }
}

- (void)dataSource:(id)a3 triggeredWithSourceClientIdentifier:(id)a4 triggerData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__CALNTriggeredEventNotificationSource_dataSource_triggeredWithSourceClientIdentifier_triggerData___block_invoke;
  block[3] = &unk_2645C0E60;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, block);
}

uint64_t __99__CALNTriggeredEventNotificationSource_dataSource_triggeredWithSourceClientIdentifier_triggerData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggeredWithSourceClientIdentifier:*(void *)(a1 + 40) triggerData:*(void *)(a1 + 48)];
}

- (void)dataSource:(id)a3 travelAdvisoryAuthorizationChanged:(BOOL)a4
{
  id v6 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__CALNTriggeredEventNotificationSource_dataSource_travelAdvisoryAuthorizationChanged___block_invoke;
  v7[3] = &unk_2645C13C8;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_sync(v6, v7);
}

uint64_t __86__CALNTriggeredEventNotificationSource_dataSource_travelAdvisoryAuthorizationChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _travelAdvisoryAuthorizationChanged:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dataSource:(id)a3 travelEngineEventSignificantlyChangedWithSourceClientIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __115__CALNTriggeredEventNotificationSource_dataSource_travelEngineEventSignificantlyChangedWithSourceClientIdentifier___block_invoke;
  v8[3] = &unk_2645C0DC0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __115__CALNTriggeredEventNotificationSource_dataSource_travelEngineEventSignificantlyChangedWithSourceClientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _travelEngineEventSignificantlyChangedWithSourceClientIdentifier:*(void *)(a1 + 40)];
}

- (void)snoozeTimerFiredForEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CALNTriggeredEventNotificationSource_snoozeTimerFiredForEvents___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __66__CALNTriggeredEventNotificationSource_snoozeTimerFiredForEvents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnoozeOptionsForEvents:*(void *)(a1 + 40)];
}

- (void)_triggeredWithSourceClientIdentifier:(id)a3 triggerData:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v80 = (uint64_t)v6;
    __int16 v81 = 2114;
    id v82 = v7;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Triggered with source client identifier = %{public}@, trigger data = %{public}@", buf, 0x16u);
  }

  id v10 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  id v11 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  uint64_t v12 = objc_msgSend(v10, "fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:", v6, objc_msgSend(v11, "isProtectedDataAvailable"));

  if (v12)
  {
    id v13 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
    id v14 = [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
    id v15 = [v13 fetchRecordsWithSourceIdentifier:v14];

    id v16 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v80 = (uint64_t)v15;
      _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_INFO, "Existing records = %@.", buf, 0xCu);
    }

    uint64_t v17 = [(CALNTriggeredEventNotificationSource *)self _existingRecordMatchingEventForSourceClientIdentifier:v6 existingRecords:v15];
    v18 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v17 sourceClientIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v80 = (uint64_t)v6;
      __int16 v81 = 2114;
      id v82 = v19;
      __int16 v83 = 2112;
      v84 = v17;
      _os_log_impl(&dword_2216BB000, v18, OS_LOG_TYPE_INFO, "Existing record matching event for source client identifier = %{public}@, existing record source client identifier = %{public}@, existing record = %@", buf, 0x20u);
    }
    v20 = [(CALNTriggeredEventNotificationSource *)self _existingNotificationDataMatchingEventForSourceClientIdentifier:v6];
    long long v21 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v80 = (uint64_t)v6;
      __int16 v81 = 2112;
      id v82 = v20;
      _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Existing notification data for source client identifier = %{public}@, existing notification data = %@", buf, 0x16u);
    }

    long long v22 = [(CALNTriggeredEventNotificationSource *)self dateProvider];
    v77 = [v22 now];

    uint64_t v23 = [v7 trigger];
    uint64_t v24 = [v7 hypothesis];
    BOOL v26 = v23 == 1 && v24 == 0;
    LOBYTE(v67) = 0;
    v76 = (void *)v24;
    uint64_t v27 = -[CALNTriggeredEventNotificationSource _sourceNotificationInfoForSourceClientIdentifier:notificationInfo:existingNotificationData:hypothesis:shouldClearHypothesis:isOffsetFromTravelTimeStart:isForContentCreation:](self, "_sourceNotificationInfoForSourceClientIdentifier:notificationInfo:existingNotificationData:hypothesis:shouldClearHypothesis:isOffsetFromTravelTimeStart:isForContentCreation:", v6, v12, v20, v24, v26, [v7 isOffsetFromTravelTimeStart], v67);
    v28 = [(CALNTriggeredEventNotificationSource *)self triggerHelper];
    v78 = (void *)v27;
    uint64_t v29 = [v28 shouldTriggerForSourceClientIdentifier:v6 trigger:v23 sourceNotificationInfo:v27 oldNotificationData:v20];

    dispatch_queue_t v30 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      [NSNumber numberWithBool:v29];
      v74 = v20;
      v31 = v17;
      id v32 = v7;
      v33 = v15;
      double v35 = v34 = v12;
      *(_DWORD *)buf = 138543618;
      uint64_t v80 = (uint64_t)v35;
      __int16 v81 = 2114;
      id v82 = v6;
      _os_log_impl(&dword_2216BB000, v30, OS_LOG_TYPE_DEFAULT, "Determined that notification should trigger = %{public}@. source client identifier = %{public}@", buf, 0x16u);

      uint64_t v12 = v34;
      id v15 = v33;
      id v7 = v32;
      uint64_t v17 = v31;
      v20 = v74;
    }

    if (v29)
    {
      v73 = v17;
      uint64_t v36 = [(CALNTriggeredEventNotificationSource *)self _updatedSourceNotificationInfoForContentCreation:v78];
      BOOL v37 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
      v72 = (void *)v36;
      uint64_t v38 = -[CALNTriggeredEventNotificationSource contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:](self, "contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:", v6, v36, [v37 isProtectedDataAvailable]);

      v75 = (void *)v38;
      if (v38)
      {
        BOOL v39 = [(CALNTriggeredEventNotificationSource *)self transitionProvider];
        uint64_t v40 = [v39 transitionForSourceClientIdentifier:v6 sourceNotificationInfo:v78 oldNotificationData:v20 trigger:v23];

        uint64_t v71 = +[CALNTriggeredEventNotificationTransitionUtilities descriptionForTransition:v40];
        id v41 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v80 = v71;
          __int16 v81 = 2114;
          id v82 = v6;
          _os_log_impl(&dword_2216BB000, v41, OS_LOG_TYPE_DEFAULT, "Transition = %{public}@, source client identifier = %{public}@", buf, 0x16u);
        }

        uint64_t v17 = v73;
        switch(v40)
        {
          case 0:
            id v42 = +[CALNLogSubsystem calendar];
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              -[CALNTriggeredEventNotificationSource _triggeredWithSourceClientIdentifier:triggerData:]();
            }
            goto LABEL_39;
          case 1:
            BOOL v70 = v12;
            id v47 = [v73 sourceClientIdentifier];
            id v42 = [(CALNTriggeredEventNotificationSource *)self _resolvedSourceClientIdentifierForNewSourceClientIdentifier:v6 oldSourceClientIdentifier:v47];

            id v48 = [CALNNotificationRecord alloc];
            id v49 = [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
            id v50 = [(CALNNotificationRecord *)v48 initWithSourceIdentifier:v49 sourceClientIdentifier:v42 content:v75];

            objc_super v51 = v50;
            v52 = [(CALNNotificationRecord *)v50 sourceClientIdentifier];
            v53 = [(CALNTriggeredEventNotificationSource *)self _existingRecordMatchingEventForSourceClientIdentifier:v52 existingRecords:v15];

            if (v53)
            {
              uint64_t v54 = [v53 sourceClientIdentifier];
              if (v54)
              {
                v55 = (void *)v54;
                BOOL v69 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
                [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
                int v68 = v53;
                uint64_t v57 = v56 = v51;
                [v69 removeRecordWithSourceIdentifier:v57 sourceClientIdentifier:v55];

                objc_super v51 = v56;
                v53 = v68;
              }
            }
            -[CALNTriggeredEventNotificationSource _addRecord:sourceNotificationInfo:existingNotificationData:trigger:transition:now:](self, "_addRecord:sourceNotificationInfo:existingNotificationData:trigger:transition:now:", v51, v78, v20, [v7 trigger], 1, v77);

            uint64_t v12 = v70;
            uint64_t v17 = v73;
            goto LABEL_39;
          case 2:
            if (v73)
            {
              id v42 = [v73 mutableCopy];
              [v42 setContent:v75];
              v58 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
              id v59 = v7;
              id v60 = v15;
              v61 = v12;
              id v62 = [v42 copy];
              [v58 updateRecord:v62];

              uint64_t v12 = v61;
              id v15 = v60;
              id v7 = v59;
              uint64_t v17 = v73;
LABEL_38:
            }
            else
            {
              id v42 = +[CALNLogSubsystem calendar];
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v80 = (uint64_t)v6;
                _os_log_impl(&dword_2216BB000, v42, OS_LOG_TYPE_DEFAULT, "No existing delivered notification to perform replace transition, source client identifier = %{public}@", buf, 0xCu);
              }
            }
LABEL_39:

LABEL_40:
            if ([(CALNTriggeredEventNotificationSource *)self _shouldUpdateStoredNotificationDataGivenTransition:v40])
            {
              [(CALNTriggeredEventNotificationSource *)self _updateStoredNotificationDataForSourceClientIdentifier:v6 sourceNotificationInfo:v78 existingNotificationData:v20 transition:v40 now:v77];
            }
            id v63 = [v78 hypothesis];
            uint64_t v64 = [v78 allowsLocationAlerts];
            uint64_t v65 = [v78 travelAdvisoryDisabled];
            uint64_t v66 = v64;
            uint64_t v43 = v78;
            [(CALNTriggeredEventNotificationSource *)self _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:v6 hypothesis:v63 allowsLocationAlerts:v66 travelAdvisoryDisabled:v65];

            id v45 = v76;
            id v46 = v71;
            id v44 = v72;
            break;
          case 3:
            id v42 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
            v58 = [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
            [v42 removeRecordWithSourceIdentifier:v58 sourceClientIdentifier:v6];
            goto LABEL_38;
          default:
            goto LABEL_40;
        }
      }
      else
      {
        id v46 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v43 = v78;
          -[CALNTriggeredEventNotificationSource _triggeredWithSourceClientIdentifier:triggerData:]();
          id v45 = v76;
        }
        else
        {
          id v45 = v76;
          uint64_t v43 = v78;
        }
        id v44 = v72;
        uint64_t v17 = v73;
      }
    }
    else
    {
      uint64_t v43 = v78;
      id v44 = [v78 hypothesis];
      -[CALNTriggeredEventNotificationSource _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:](self, "_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:hypothesis:allowsLocationAlerts:travelAdvisoryDisabled:", v6, v44, [v78 allowsLocationAlerts], objc_msgSend(v78, "travelAdvisoryDisabled"));
      id v45 = v76;
    }
  }
  else
  {
    id v15 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationSource _triggeredWithSourceClientIdentifier:triggerData:]();
    }
  }
}

- (void)_travelEngineEventSignificantlyChangedWithSourceClientIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Travel engine event changed significantly. Will reset 'Time to Leave' display state for existing record if it exists. source client identifier = %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(CALNTriggeredEventNotificationSource *)self _existingRecordMatchingEventForSourceClientIdentifier:v4];
  if (v7)
  {
    [(CALNTriggeredEventNotificationSource *)self _resetStoredNotificationDataTimeToLeaveDisplayStateForSourceClientIdentifier:v4];
  }
  else
  {
    id v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationSource _travelEngineEventSignificantlyChangedWithSourceClientIdentifier:]();
    }
  }
}

- (void)_travelAdvisoryAuthorizationChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithBool:v3];
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Travel advisory authorization changed. authorized = %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (!v3) {
    [(CALNTriggeredEventNotificationSource *)self _clearTravelAdvisoryHypotheses];
  }
}

- (void)_clearTravelAdvisoryHypotheses
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Clearing travel advisory hypotheses", buf, 2u);
  }

  id v5 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  id v6 = [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
  id v7 = [v5 fetchRecordsWithSourceIdentifier:v6];

  int v8 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v22 = v7;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_INFO, "Existing records = %@.", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        -[CALNTriggeredEventNotificationSource _updateNotification:shouldClearHypothesis:](self, "_updateNotification:shouldClearHypothesis:", v14, 1, (void)v16);
        id v15 = [v14 sourceClientIdentifier];
        [(CALNTriggeredEventNotificationSource *)self _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (BOOL)_shouldCeaseRouteMonitoringEventForSourceClientIdentifier:(id)a3
{
  id v4 = [(CALNTriggeredEventNotificationSource *)self _existingNotificationDataMatchingEventForSourceClientIdentifier:a3];
  id v5 = v4;
  BOOL v7 = v4
    && ([v4 hypothesis], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6)
    && [(CALNTriggeredEventNotificationSource *)self _mayCeaseRouteMonitoringForExistingNotificationData:v5];

  return v7;
}

- (BOOL)_mayCeaseRouteMonitoringForExistingNotificationData:(id)a3
{
  id v4 = [a3 hypothesis];
  if (v4)
  {
    id v5 = [(CALNTriggeredEventNotificationSource *)self dateProvider];
    id v6 = [v5 now];

    BOOL v7 = [v4 conservativeDepartureDate];
    char v8 = [v6 CalIsBeforeOrSameAsDate:v7];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (unint64_t)_travelAdvisoryTimelinessPeriodForHypothesis:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self travelAdvisoryTimelinessAuthority];
  uint64_t v6 = [v5 periodForHypothesis:v4];

  return [(CALNTriggeredEventNotificationSource *)self _calnTravelAdvisoryTimelinessPeriodFromEKTravelAvisoryTimelinessPeriod:v6];
}

- (unint64_t)_calnTravelAdvisoryTimelinessPeriodFromEKTravelAvisoryTimelinessPeriod:(unint64_t)a3
{
  if (a3 < 3) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (void)_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = -[CALNTriggeredEventNotificationSource _existingNotificationDataMatchingEventForSourceClientIdentifier:](self, "_existingNotificationDataMatchingEventForSourceClientIdentifier:");
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 hypothesis];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(CALNTriggeredEventNotificationSource *)self _updateTimeToLeaveRefreshTimerForSourceClientIdentifier:v7 hypothesis:v6 allowsLocationAlerts:1 travelAdvisoryDisabled:0];
}

- (void)_updateTimeToLeaveRefreshTimerForSourceClientIdentifier:(id)a3 hypothesis:(id)a4 allowsLocationAlerts:(BOOL)a5 travelAdvisoryDisabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v27 = 138543362;
    *(void *)&v27[4] = v10;
    _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Updating refresh timer for source client identifier = %{public}@", v27, 0xCu);
  }

  if (!a5)
  {
    id v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v27 = 138543362;
      *(void *)&v27[4] = v10;
      id v15 = "Location alerts are not allowed. Will remove the associated refresh timer for source client identifier = %{public}@";
      goto LABEL_9;
    }
LABEL_10:

LABEL_11:
    long long v16 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v16 removeTimeToLeaveRefreshTimerForSourceClientIdentifier:v10];
    goto LABEL_12;
  }
  if (v6)
  {
    id v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v27 = 138543362;
      *(void *)&v27[4] = v10;
      id v15 = "Time to Leave alarm removed on the event. Will remove the associated refresh timer for source client identif"
            "ier = %{public}@";
LABEL_9:
      _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, v15, v27, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!v11)
  {
    id v14 = +[CALNLogSubsystem calendar];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)uint64_t v27 = 138543362;
    *(void *)&v27[4] = v10;
    id v15 = "There is no hypothesis. Will remove the associated refresh timer for source client identifier = %{public}@";
    goto LABEL_9;
  }
  if ([v11 travelState] == 5)
  {
    id v14 = +[CALNLogSubsystem calendar];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)uint64_t v27 = 138543362;
    *(void *)&v27[4] = v10;
    id v15 = "Hypothesis indicates user has arrived. Will remove associated refresh timer for source client identifier = %{public}@";
    goto LABEL_9;
  }
  unint64_t v17 = [(CALNTriggeredEventNotificationSource *)self _travelAdvisoryTimelinessPeriodForHypothesis:v11];
  if (v17 == 2)
  {
    uint64_t v23 = [(CALNTriggeredEventNotificationSource *)self travelAdvisoryTimelinessAuthority];
    long long v16 = [v23 startOfRunningLatePeriodForHypothesis:v11];

    long long v19 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v27 = 138543618;
      *(void *)&v27[4] = v16;
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v10;
      v20 = "Will refresh when the user will become late at %{public}@, source client identifier = %{public}@";
      long long v21 = v19;
      uint32_t v22 = 22;
      goto LABEL_26;
    }
  }
  else
  {
    if (v17 != 1) {
      goto LABEL_11;
    }
    long long v18 = [(CALNTriggeredEventNotificationSource *)self travelAdvisoryTimelinessAuthority];
    long long v16 = [v18 startOfLeaveNowPeriodForHypothesis:v11];

    long long v19 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v27 = 138412802;
      *(void *)&v27[4] = v16;
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v16;
      __int16 v28 = 2114;
      id v29 = v10;
      v20 = "Will refresh at date: [%@] when the user needs to 'Leave Now' at %{public}@, source client identifier = %{public}@";
      long long v21 = v19;
      uint32_t v22 = 32;
LABEL_26:
      _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, v20, v27, v22);
    }
  }

  if (!v16) {
    goto LABEL_13;
  }
  uint64_t v24 = [v16 dateBySubtractingCalSimulatedOffset];
  __int16 v25 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v27 = 138543618;
    *(void *)&v27[4] = v24;
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = v10;
    _os_log_impl(&dword_2216BB000, v25, OS_LOG_TYPE_DEFAULT, "Will set up a refresh timer with an adjusted refresh date of %{public}@. source client identifier = %{public}@", v27, 0x16u);
  }

  BOOL v26 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  [v26 setUpTimeToLeaveRefreshTimerWithTriggerDate:v24 sourceClientIdentifier:v10];

LABEL_12:
LABEL_13:
}

- (void)_updateSnoozeOptionsForEvents:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  BOOL v6 = [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
  id v7 = [v5 fetchRecordsWithSourceIdentifier:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "sourceClientIdentifier", (void)v15);
        if ([v4 containsObject:v14]) {
          [(CALNTriggeredEventNotificationSource *)self _refreshNotification:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)updateSnoozeOptionsForPostedNotifications
{
  BOOL v3 = +[CALNSnoozeCategory snoozeCategories];
  unint64_t v4 = [v3 count];

  if (v4 > 1)
  {
    BOOL v6 = [(CALNTriggeredEventNotificationSource *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__CALNTriggeredEventNotificationSource_updateSnoozeOptionsForPostedNotifications__block_invoke;
    block[3] = &unk_2645C0D98;
    block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    id v5 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_INFO, "Not updating snooze options because there's only one option", buf, 2u);
    }
  }
}

void __81__CALNTriggeredEventNotificationSource_updateSnoozeOptionsForPostedNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v60 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dateProvider];
  uint64_t v40 = [v2 now];

  BOOL v3 = [*(id *)(v1 + 32) notificationManager];
  unint64_t v4 = [*(id *)(v1 + 32) sourceIdentifier];
  id v5 = [v3 fetchRecordsWithSourceIdentifier:v4];

  unint64_t v6 = 0x2645C0000uLL;
  id v7 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = [v5 count];
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Checking snooze options for %lu posted notifications", buf, 0xCu);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v5;
  uint64_t v44 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v44)
  {
    uint64_t v9 = *(void *)v50;
    *(void *)&long long v8 = 138543874;
    long long v38 = v8;
    uint64_t v42 = *(void *)v50;
    uint64_t v39 = v1;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "content", v38);
        id v13 = [v12 userInfo];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"AlarmID"];
        long long v15 = (void *)v14;
        if (v14)
        {
          id v45 = (void *)v14;
          long long v16 = [v13 objectForKeyedSubscript:@"allDay"];
          uint64_t v17 = [v16 BOOLValue];
          long long v18 = [v12 categoryIdentifier];
          id v48 = [v12 date];
          uint64_t v19 = [v13 objectForKeyedSubscript:@"endDate"];
          id v46 = v18;
          id v47 = (void *)v19;
          if (v16) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (v20) {
            goto LABEL_25;
          }
          unsigned int v41 = v17;
          long long v21 = +[CALNSnoozeCategory snoozeCategoryForEventWithStartDate:v48 endDate:v19 now:v40 isAllDay:v17];
          uint32_t v22 = [v21 suffix];
          if (![v18 hasSuffix:v22]) {
            goto LABEL_21;
          }
          unint64_t v23 = [v18 length];
          uint64_t v24 = [@"Snooze" length];
          unint64_t v25 = [v22 length] + v24;
          if (v23 > v25)
          {
            uint64_t v26 = objc_msgSend(v46, "compare:options:range:", @"Snooze", 0, objc_msgSend(v46, "length") - v25, v24);

            uint64_t v1 = v39;
            if (!v26)
            {
              uint64_t v27 = +[CALNLogSubsystem calendar];
              uint64_t v9 = v42;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                __int16 v28 = [v11 sourceClientIdentifier];
                *(_DWORD *)buf = 138543362;
                uint64_t v54 = (uint64_t)v28;
                _os_log_impl(&dword_2216BB000, v27, OS_LOG_TYPE_INFO, "Notification %{public}@ already has the correct snooze options.", buf, 0xCu);
              }
              id v29 = [0 expirationDateForEventWithStartDate:v48 endDate:v47 isAllDay:v41];
              uint64_t v30 = [*(id *)(v39 + 32) snoozeUpdateTimer];
              [0 leeway];
              double v32 = v31;
              v33 = [v11 sourceClientIdentifier];
              [v30 setFireDate:v29 leeway:v33 forEventWithIdentifier:v32];

              unint64_t v6 = 0x2645C0000;
              goto LABEL_29;
            }
          }
          else
          {
LABEL_21:

            uint64_t v1 = v39;
          }
          unint64_t v6 = 0x2645C0000uLL;
          uint64_t v9 = v42;
          if (!v22)
          {
LABEL_25:
            double v35 = [*(id *)(v6 + 1368) calendar];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v37 = [v11 sourceClientIdentifier];
              *(_DWORD *)buf = 138543362;
              uint64_t v54 = (uint64_t)v37;
              _os_log_impl(&dword_2216BB000, v35, OS_LOG_TYPE_DEFAULT, "Refreshing notification %{public}@ because there's not enough information to determine if its snooze category is correct.", buf, 0xCu);
            }
            uint32_t v22 = 0;
          }
          else
          {
            double v35 = +[CALNLogSubsystem calendar];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v36 = [v11 sourceClientIdentifier];
              *(_DWORD *)buf = v38;
              uint64_t v54 = (uint64_t)v36;
              __int16 v55 = 2114;
              v56 = v22;
              __int16 v57 = 2114;
              v58 = v46;
              _os_log_impl(&dword_2216BB000, v35, OS_LOG_TYPE_DEFAULT, "Refreshing notification %{public}@ because it should have snooze category \"%{public}@\" but has category \"%{public}@.", buf, 0x20u);

              unint64_t v6 = 0x2645C0000;
            }
          }

          [*(id *)(v1 + 32) _refreshNotification:v11];
LABEL_29:

          long long v15 = v45;
          goto LABEL_30;
        }
        long long v16 = [*(id *)(v6 + 1368) calendar];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v34 = [v11 sourceClientIdentifier];
          *(_DWORD *)buf = 138543362;
          uint64_t v54 = (uint64_t)v34;
          _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_INFO, "Notification %{public}@ can't be snoozed so it doesn't need refreshing.", buf, 0xCu);

          uint64_t v9 = v42;
        }
LABEL_30:
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v44);
  }
}

- (void)_refreshNotifications:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(CALNTriggeredEventNotificationSource *)self _refreshNotificationMetaDataWithObjectIDs:v5];
  [(CALNTriggeredEventNotificationSource *)self _refreshTimeToLeaveRefreshTimersWithObjectIDs:v5];
  [(CALNTriggeredEventNotificationSource *)self _refreshNotificationRecordsWithObjectIDs:v5];
}

- (void)_refreshNotificationRecordsWithObjectIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  id v7 = [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
  long long v8 = [v6 fetchRecordsWithSourceIdentifier:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        long long v15 = (void *)MEMORY[0x223C88D10](v10);
        long long v16 = objc_msgSend(v14, "sourceClientIdentifier", (void)v17);
        if (!v4
          || [(CALNTriggeredEventNotificationSource *)self _notificationWithSourceClientIdentifier:v16 affectedByChangesToObjects:v4])
        {
          [(CALNTriggeredEventNotificationSource *)self _refreshNotification:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v11 = v10;
    }
    while (v10);
  }
}

- (void)_refreshNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [v4 sourceClientIdentifier];
  id v7 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    uint64_t v13 = v6;
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing notification with source client identifier = %{public}@", (uint8_t *)&v12, 0xCu);
  }

  long long v8 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  int v9 = [v8 shouldWithdrawNotificationWithSourceClientIdentifier:v6];

  if (v9)
  {
    uint64_t v10 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
    uint64_t v11 = [v4 sourceIdentifier];
    [v10 removeRecordWithSourceIdentifier:v11 sourceClientIdentifier:v6];
  }
  else
  {
    [(CALNTriggeredEventNotificationSource *)self _updateNotification:v4 shouldClearHypothesis:0];
  }
}

- (void)_refreshNotificationMetaDataWithObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(CALNTriggeredEventNotificationSource *)self notificationDataStorage];
  id v7 = [v6 notificationData];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__CALNTriggeredEventNotificationSource__refreshNotificationMetaDataWithObjectIDs___block_invoke;
  v9[3] = &unk_2645C13F0;
  id v10 = v4;
  uint64_t v11 = self;
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __82__CALNTriggeredEventNotificationSource__refreshNotificationMetaDataWithObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!*(void *)(a1 + 32)
    || objc_msgSend(*(id *)(a1 + 40), "_itemWithEventID:affectedByChangesToObjects:", v6))
  {
    [*(id *)(a1 + 40) _refreshNotificationMetaData:v5 eventID:v6];
  }
}

- (void)_refreshNotificationMetaData:(id)a3 eventID:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v8);

  LODWORD(v8) = [(CALNTriggeredEventNotificationSource *)self _shouldRemoveNotificationMetaData:v7 eventID:v6];
  if (v8)
  {
    int v9 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Removing notification meta data due to refresh for eventID = %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v10 ceaseRouteMonitoringEventWithEventID:v6];

    [(CALNTriggeredEventNotificationSource *)self _removeStoredNotificationDataForEventWithEventID:v6];
  }
}

- (BOOL)_shouldRemoveNotificationMetaData:(id)a3 eventID:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v8);

  LODWORD(v8) = [(CALNTriggeredEventNotificationSource *)self _isNotificationMetaDataExpired:v7 eventID:v6];
  if (v8)
  {
    int v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Notification meta data is expired for eventID = %{public}@. Should remove notification meta data.", (uint8_t *)&v13, 0xCu);
    }

    char v10 = 1;
  }
  else
  {
    int v11 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    char v10 = [v11 shouldRemoveNotificationMetaDataWithEventID:v6];
  }
  return v10;
}

- (BOOL)_isNotificationMetaDataExpired:(id)a3 eventID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [a3 alarmID];
  id v8 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  int v9 = [v8 notificationExpirationDateForEventID:v6 alarmID:v7];

  if (v9)
  {
    char v10 = [(CALNTriggeredEventNotificationSource *)self dateProvider];
    int v11 = [v10 now];

    [v9 timeIntervalSinceDate:v11];
    BOOL v13 = v12 <= 0.0;
  }
  else
  {
    id v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v6;
      _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Could not get an expiration date for notification meta data for eventID = %{public}@. Treating notification meta data as expired.", (uint8_t *)&v16, 0xCu);
    }

    BOOL v13 = 1;
  }

  return v13;
}

- (void)_refreshTimeToLeaveRefreshTimersWithObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CALNTriggeredEventNotificationSource *)self timeToLeaveRefreshStorage];
  id v7 = [v6 refreshDates];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__CALNTriggeredEventNotificationSource__refreshTimeToLeaveRefreshTimersWithObjectIDs___block_invoke;
  v9[3] = &unk_2645C1418;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __86__CALNTriggeredEventNotificationSource__refreshTimeToLeaveRefreshTimersWithObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!*(void *)(a1 + 32)
    || objc_msgSend(*(id *)(a1 + 40), "_itemWithEventID:affectedByChangesToObjects:", v6))
  {
    [*(id *)(a1 + 40) _refreshTimeToLeaveRefreshTimerWithRefreshDate:v5 eventID:v6];
  }
}

- (void)_refreshTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v7);

  LODWORD(v7) = [(CALNTriggeredEventNotificationSource *)self _shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:v6 eventID:v9];
  if (v7)
  {
    id v8 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v8 removeTimeToLeaveRefreshTimerForEventID:v9];
  }
}

- (BOOL)_shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:(id)a3 eventID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CALNTriggeredEventNotificationSource *)self dateProvider];
  id v10 = [v9 now];

  [v6 timeIntervalSinceDate:v10];
  if (v11 <= 0.0)
  {
    id v14 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Time to leave refresh date is expired for eventID = %{public}@. Should remove time to leave refresh timer.", (uint8_t *)&v16, 0xCu);
    }

    char v13 = 1;
  }
  else
  {
    double v12 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    char v13 = [v12 shouldRemoveTimeToLeaveRefreshTimerWithRefreshDate:v6 eventID:v7];
  }
  return v13;
}

- (BOOL)_notificationWithSourceClientIdentifier:(id)a3 affectedByChangesToObjects:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v13 = 0;
  id v14 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v14 andAlarmID:&v13 fromSourceClientIdentifier:v7];

  id v9 = v14;
  id v10 = v13;
  if (v10 && ([v6 containsObject:v10] & 1) != 0)
  {
    BOOL v11 = 1;
  }
  else if (v9)
  {
    BOOL v11 = [(CALNTriggeredEventNotificationSource *)self _itemWithEventID:v9 affectedByChangesToObjects:v6];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_itemWithEventID:(id)a3 affectedByChangesToObjects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(NSMutableDictionary *)self->_eventURLToObjectIDMap objectForKeyedSubscript:v6];
  if (!v9)
  {
    id v9 = [NSURL URLWithString:v6];
    if (!v9
      || ([(CALNTriggeredEventNotificationSource *)self dataSource],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 eventObjectIDForEventID:v9],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v11))
    {
      char v12 = 1;
      goto LABEL_7;
    }
    [(NSMutableDictionary *)self->_eventURLToObjectIDMap setObject:v11 forKeyedSubscript:v6];

    id v9 = (void *)v11;
  }
  char v12 = [v7 containsObject:v9];
LABEL_7:

  return v12;
}

- (id)_contentForNotificationWithSourceClientIdentifier:(id)a3
{
  return [(CALNTriggeredEventNotificationSource *)self _contentForNotificationWithSourceClientIdentifier:a3 shouldClearHypothesis:0];
}

- (id)_contentForNotificationWithSourceClientIdentifier:(id)a3 shouldClearHypothesis:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [NSNumber numberWithBool:v4];
    int v14 = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Getting content for notification with source client identifier = %{public}@, should clear hypothesis = %{public}@", (uint8_t *)&v14, 0x16u);
  }
  id v10 = [(CALNTriggeredEventNotificationSource *)self _sourceNotificationInfoForSourceClientIdentifier:v6 shouldClearHypothesis:v4 isForContentCreation:1];
  if (v10)
  {
    uint64_t v11 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
    char v12 = [(CALNTriggeredEventNotificationSource *)self contentForSourceClientIdentifier:v6 sourceNotificationInfo:v10 isProtectedDataAvailable:[v11 isProtectedDataAvailable]];
  }
  else
  {
    uint64_t v11 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationSource _contentForNotificationWithSourceClientIdentifier:shouldClearHypothesis:]();
    }
    char v12 = 0;
  }

  return v12;
}

- (id)_sourceNotificationInfoForSourceClientIdentifier:(id)a3 shouldClearHypothesis:(BOOL)a4 isForContentCreation:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  id v10 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  uint64_t v11 = objc_msgSend(v9, "fetchTriggeredEventNotificationInfoWithSourceClientIdentifier:isProtectedDataAvailable:", v8, objc_msgSend(v10, "isProtectedDataAvailable"));

  if (v11)
  {
    char v12 = [(CALNTriggeredEventNotificationSource *)self _existingNotificationDataMatchingEventForSourceClientIdentifier:v8];
    id v13 = v12;
    if (v12) {
      uint64_t v14 = [v12 isOffsetFromTravelTimeStart];
    }
    else {
      uint64_t v14 = 0;
    }
    LOBYTE(v18) = a5;
    __int16 v16 = [(CALNTriggeredEventNotificationSource *)self _sourceNotificationInfoForSourceClientIdentifier:v8 notificationInfo:v11 existingNotificationData:v13 hypothesis:0 shouldClearHypothesis:v6 isOffsetFromTravelTimeStart:v14 isForContentCreation:v18];
  }
  else
  {
    id v15 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationSource _sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:]();
    }

    __int16 v16 = 0;
  }

  return v16;
}

- (id)_sourceNotificationInfoForSourceClientIdentifier:(id)a3 notificationInfo:(id)a4 existingNotificationData:(id)a5 hypothesis:(id)a6 shouldClearHypothesis:(BOOL)a7 isOffsetFromTravelTimeStart:(BOOL)a8 isForContentCreation:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v64 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities alarmIDForSourceClientIdentifier:a3];
  if (v17)
  {
    id v18 = v17;
LABEL_3:
    unint64_t v19 = [(CALNTriggeredEventNotificationSource *)self _travelAdvisoryTimelinessPeriodForHypothesis:v18];
    goto LABEL_6;
  }
  if (!a7)
  {
    if (!v16)
    {
      unint64_t v38 = 0;
      id v18 = 0;
      goto LABEL_12;
    }
    id v18 = [v16 hypothesis];
    if (!v18)
    {
      unint64_t v38 = 0;
      goto LABEL_7;
    }
    goto LABEL_3;
  }
  id v18 = 0;
  unint64_t v19 = 0;
LABEL_6:
  unint64_t v38 = v19;
  if (v16)
  {
LABEL_7:
    long long v20 = [v16 lastFireTimeOfAlertOffsetFromTravelTime];
    goto LABEL_13;
  }
LABEL_12:
  long long v20 = 0;
LABEL_13:
  __int16 v55 = [v15 eventID];
  id v62 = +[CALNTriggeredEventNotificationLaunchURLProvider launchURLForOptionalEventID:hypothesis:isTravelLaunchURL:](CALNTriggeredEventNotificationLaunchURLProvider, "launchURLForOptionalEventID:hypothesis:isTravelLaunchURL:");
  uint64_t v21 = [v15 preferredLocation];
  uint64_t v22 = [(CALNTriggeredEventNotificationSource *)self mapItemURLProvider];
  uint64_t v54 = (void *)v21;
  v61 = [v22 mapItemURLForOptionalEventLocation:v21 hypothesis:v18];

  v56 = v17;
  __int16 v57 = v16;
  id v63 = v18;
  BOOL v52 = v9;
  if (a9)
  {
    uint64_t v23 = [(CALNTriggeredEventNotificationSource *)self _updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:v9];

    uint64_t v60 = (void *)v23;
  }
  else
  {
    uint64_t v60 = v20;
  }
  long long v50 = [CALNTriggeredEventNotificationSourceNotificationInfo alloc];
  id v59 = [v15 title];
  long long v51 = [v15 location];
  long long v49 = [v15 locationWithoutPrediction];
  id v48 = [v15 preferredLocation];
  id v47 = [v15 startDate];
  id v46 = [v15 endDate];
  char v45 = [v15 isAllDay];
  char v44 = [v15 isTimeSensitive];
  v58 = [v15 eventID];
  uint64_t v40 = [v15 eventObjectID];
  uint64_t v43 = [v15 calendarIdentifier];
  uint64_t v42 = [v15 eventRepresentationDictionary];
  uint64_t v39 = [v15 legacyIdentifier];
  uint64_t v24 = [v15 conferenceURL];
  char v41 = [v15 conferenceURLIsBroadcast];
  unint64_t v25 = [v15 mailtoURL];
  char v26 = [v15 hasSuggestedLocation];
  char v27 = [v15 eventHasAlarms];
  char v28 = [v15 allowsLocationAlerts];
  char v29 = [v15 forceDisplayOfNewTravelAdvisoryHypotheses];
  BYTE1(v37) = [v15 travelAdvisoryDisabled];
  LOBYTE(v37) = v29;
  LOBYTE(v36) = v28;
  LOBYTE(v35) = v52;
  BYTE1(v34) = v27;
  LOBYTE(v34) = v26;
  LOBYTE(v33) = v41;
  LOBYTE(v32) = 0;
  BYTE1(v31) = v44;
  LOBYTE(v31) = v45;
  v53 = -[CALNTriggeredEventNotificationSourceNotificationInfo initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:](v50, "initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:", v59, v51, v49, v48, v47, v46, v31, v62, v32, v58, v40, v43, v42,
          v39,
          v61,
          v24,
          v33,
          v25,
          v34,
          v64,
          v35,
          v60,
          v36,
          v63,
          v38,
          v37);

  return v53;
}

- (id)_updatedSourceNotificationInfoForContentCreation:(id)a3
{
  id v4 = a3;
  uint64_t v43 = -[CALNTriggeredEventNotificationSource _updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:](self, "_updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:", [v4 isOffsetFromTravelTimeStart]);
  uint64_t v36 = [CALNTriggeredEventNotificationSourceNotificationInfo alloc];
  uint64_t v42 = [v4 title];
  char v41 = [v4 location];
  uint64_t v40 = [v4 locationWithoutPrediction];
  uint64_t v39 = [v4 preferredLocation];
  uint64_t v35 = [v4 startDate];
  uint64_t v34 = [v4 endDate];
  char v33 = [v4 isAllDay];
  char v32 = [v4 isTimeSensitive];
  uint64_t v31 = [v4 launchURL];
  char v30 = [v4 isLocationEvent];
  char v29 = [v4 eventID];
  unint64_t v38 = [v4 eventObjectID];
  char v28 = [v4 calendarIdentifier];
  uint64_t v21 = [v4 eventRepresentationDictionary];
  char v27 = [v4 legacyIdentifier];
  char v26 = [v4 mapItemURL];
  unint64_t v25 = [v4 conferenceURL];
  char v24 = [v4 conferenceURLIsBroadcast];
  uint64_t v23 = [v4 mailtoURL];
  char v22 = [v4 hasSuggestedLocation];
  char v5 = [v4 eventHasAlarms];
  long long v20 = [v4 alarmID];
  char v6 = [v4 isOffsetFromTravelTimeStart];
  char v7 = [v4 allowsLocationAlerts];
  id v8 = [v4 hypothesis];
  uint64_t v9 = [v4 travelAdvisoryTimelinessPeriod];
  char v10 = [v4 forceDisplayOfNewTravelAdvisoryHypotheses];
  char v11 = [v4 travelAdvisoryDisabled];

  BYTE1(v19) = v11;
  LOBYTE(v19) = v10;
  LOBYTE(v18) = v7;
  LOBYTE(v17) = v6;
  BYTE1(v16) = v5;
  LOBYTE(v16) = v22;
  LOBYTE(v15) = v24;
  LOBYTE(v14) = v30;
  BYTE1(v13) = v32;
  LOBYTE(v13) = v33;
  uint64_t v37 = -[CALNTriggeredEventNotificationSourceNotificationInfo initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:](v36, "initWithTitle:location:locationWithoutPrediction:preferredLocation:startDate:endDate:isAllDay:isTimeSensitive:launchURL:isLocationEvent:eventID:eventObjectID:calendarIdentifier:eventRepresentationDictionary:legacyIdentifier:mapItemURL:conferenceURL:conferenceURLIsBroadcast:mailtoURL:hasSuggestedLocation:eventHasAlarms:alarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:allowsLocationAlerts:hypothesis:travelAdvisoryTimelinessPeriod:forceDisplayOfNewTravelAdvisoryHypotheses:travelAdvisoryDisabled:", v42, v41, v40, v39, v35, v34, v13, v31, v14, v29, v38, v28, v21,
          v27,
          v26,
          v25,
          v15,
          v23,
          v16,
          v20,
          v17,
          v43,
          v18,
          v8,
          v9,
          v19);

  return v37;
}

- (id)_existingRecordMatchingEventForSourceClientIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  char v7 = [(CALNTriggeredEventNotificationSource *)self sourceIdentifier];
  id v8 = [v6 fetchRecordsWithSourceIdentifier:v7];

  uint64_t v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v8;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_INFO, "Existing records = %@.", (uint8_t *)&v14, 0xCu);
  }

  char v10 = [(CALNTriggeredEventNotificationSource *)self _existingRecordMatchingEventForSourceClientIdentifier:v4 existingRecords:v8];
  char v11 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = [v10 sourceClientIdentifier];
    int v14 = 138543874;
    id v15 = v4;
    __int16 v16 = 2114;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_INFO, "Existing record matching event for source client identifier = %{public}@, existing record source client identifier = %{public}@, existing record = %@", (uint8_t *)&v14, 0x20u);
  }
  return v10;
}

- (id)_existingRecordMatchingEventForSourceClientIdentifier:(id)a3 existingRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  int v14 = __110__CALNTriggeredEventNotificationSource__existingRecordMatchingEventForSourceClientIdentifier_existingRecords___block_invoke;
  id v15 = &unk_2645C0E88;
  __int16 v16 = self;
  id v17 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 indexOfObjectPassingTest:&v12];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v12, v13, v14, v15, v16, v17);
  }

  return v10;
}

uint64_t __110__CALNTriggeredEventNotificationSource__existingRecordMatchingEventForSourceClientIdentifier_existingRecords___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [a2 sourceClientIdentifier];
  uint64_t v5 = [v3 _sourceClientIdentifier:v4 matchesEventForSourceClientIdentifier:*(void *)(a1 + 40)];

  return v5;
}

- (void)_addRecord:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 trigger:(unint64_t)a6 transition:(unint64_t)a7 now:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  __int16 v18 = [v16 eventID];
  uint64_t v19 = [v16 eventObjectID];
  [(CALNTriggeredEventNotificationSource *)self _addEventURL:v18 mappingToEventObjectID:v19];

  uint64_t v20 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  [v20 addRecord:v17];

  uint64_t v21 = [v17 sourceClientIdentifier];
  [(CALNTriggeredEventNotificationSource *)self _addNotificationDataForSourceClientIdentifier:v21 sourceNotificationInfo:v16 existingNotificationData:v15 transition:a7 now:v14];

  id v22 = [v17 sourceClientIdentifier];

  [(CALNTriggeredEventNotificationSource *)self _notificationAddedWithSourceClientIdentifier:v22 sourceNotificationInfo:v16 trigger:a6];
}

- (void)_notificationAddedWithSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 trigger:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = [NSNumber numberWithUnsignedInteger:a5];
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2114;
    __int16 v18 = v11;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Notification added with source client identifier = %{public}@, trigger = %{public}@", (uint8_t *)&v15, 0x16u);
  }
  if (a5 == 2)
  {
    uint64_t v12 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v12 sendFeedbackForAddedLeaveNowNotificationWithSourceClientIdentifier:v8];
    goto LABEL_7;
  }
  if (a5 == 1)
  {
    uint64_t v12 = [v9 hypothesis];
    uint64_t v13 = [v9 travelAdvisoryTimelinessPeriod];
    id v14 = [(CALNTriggeredEventNotificationSource *)self dataSource];
    [v14 sendFeedbackForAddedTravelAdvisoryNotificationWithSourceClientIdentifier:v8 hypothesis:v12 travelAdvisoryTimelinessPeriod:v13];

LABEL_7:
  }
}

- (void)_updateNotification:(id)a3 shouldClearHypothesis:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v18 = [v6 sourceClientIdentifier];
  id v8 = [(CALNTriggeredEventNotificationSource *)self _sourceNotificationInfoForSourceClientIdentifier:v18 shouldClearHypothesis:v4 isForContentCreation:0];
  id v9 = [(CALNTriggeredEventNotificationSource *)self _updatedSourceNotificationInfoForContentCreation:v8];
  char v10 = [(CALNTriggeredEventNotificationSource *)self _existingNotificationDataMatchingEventForSourceClientIdentifier:v18];
  char v11 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  uint64_t v12 = -[CALNTriggeredEventNotificationSource contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:](self, "contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:", v18, v9, [v11 isProtectedDataAvailable]);

  uint64_t v13 = (void *)[v6 mutableCopy];
  [v13 setContent:v12];
  id v14 = [(CALNTriggeredEventNotificationSource *)self dateProvider];
  int v15 = [v14 now];

  id v16 = [(CALNTriggeredEventNotificationSource *)self notificationManager];
  __int16 v17 = (void *)[v13 copy];
  [v16 updateRecord:v17];

  [(CALNTriggeredEventNotificationSource *)self _updateStoredNotificationDataForSourceClientIdentifier:v18 sourceNotificationInfo:v8 existingNotificationData:v10 transition:2 now:v15];
}

- (void)_addEventURL:(id)a3 mappingToEventObjectID:(id)a4
{
  if (a3)
  {
    if (a4) {
      [(NSMutableDictionary *)self->_eventURLToObjectIDMap setObject:a4 forKeyedSubscript:a3];
    }
  }
}

- (void)_commonHandleResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CALNTriggeredEventNotificationSource *)self _launchURLForResponse:v4];
  if (v5)
  {
    id v6 = [(CALNTriggeredEventNotificationSource *)self urlHandler];
    [v6 openURL:v5 response:v4];
  }
  else
  {
    id v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CALNTriggeredEventNotificationSource _commonHandleResponse:](v4, v6);
    }
  }
}

- (void)_handleDirectionsActionWithResponse:(id)a3
{
  id v4 = a3;
  [(CALNTriggeredEventNotificationSource *)self _commonHandleResponse:v4];
  id v10 = [v4 notificationRecord];

  uint64_t v5 = [v10 sourceClientIdentifier];
  id v6 = [(CALNTriggeredEventNotificationSource *)self _notificationResponseDataForRecord:v10];
  id v7 = [v6 hypothesis];
  id v8 = [v6 lastFireTimeOfAlertOffsetFromTravelTime];
  id v9 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  [v9 handleDirectionsActionWithSourceClientIdentifier:v5 hypothesis:v7 lastFireTimeOfAlertOffsetFromTravelTime:v8];
}

- (void)_handleConferenceCallActionWithResponse:(id)a3
{
  id v4 = a3;
  [(CALNTriggeredEventNotificationSource *)self _commonHandleResponse:v4];
  id v7 = [v4 notificationRecord];

  uint64_t v5 = [v7 sourceClientIdentifier];
  id v6 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  [v6 handleConferenceCallActionWithSourceClientIdentifier:v5];
}

- (void)_handleMailOrganizerActionWithResponse:(id)a3
{
  id v4 = a3;
  [(CALNTriggeredEventNotificationSource *)self _commonHandleResponse:v4];
  id v9 = [v4 notificationRecord];

  uint64_t v5 = [v9 sourceClientIdentifier];
  id v6 = [(CALNTriggeredEventNotificationSource *)self _notificationResponseDataForRecord:v9];
  id v7 = [v6 hypothesis];
  id v8 = [(CALNTriggeredEventNotificationSource *)self dataSource];
  [v8 handleMailOrganizerActionWithSourceClientIdentifier:v5 hypothesis:v7];
}

- (id)_existingNotificationDataMatchingEventForSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:v4];

  if (v6)
  {
    id v7 = [(CALNTriggeredEventNotificationSource *)self notificationDataStorage];
    id v8 = [v7 notificationDataWithIdentifier:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_notificationDataForSourceNotificationInfo:(id)a3 existingNotificationData:(id)a4 transition:(unint64_t)a5 now:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [v11 hasDisplayedLeaveByMessage];
  uint64_t v13 = [v11 hasDisplayedLeaveNowMessage];
  uint64_t v14 = [v11 hasDisplayedRunningLateMessage];
  id v15 = [v11 lastFireTimeOfAlertOffsetFromTravelTime];
  id v16 = [v11 lastTimeNotificationAdded];

  if (a5 - 1 <= 1)
  {
    uint64_t v17 = [v9 travelAdvisoryTimelinessPeriod];
    if (v17 == 1) {
      unsigned int v18 = 1;
    }
    else {
      unsigned int v18 = v12;
    }
    if (v17 == 2) {
      unsigned int v19 = 1;
    }
    else {
      unsigned int v19 = v13;
    }
    if (v17 == 2) {
      unsigned int v18 = v12;
    }
    if (v17 == 3) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v14;
    }
    if (v17 == 3) {
      uint64_t v13 = v13;
    }
    else {
      uint64_t v13 = v19;
    }
    if (v17 == 3) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = v18;
    }

    if ([v9 isOffsetFromTravelTimeStart]) {
      id v15 = v10;
    }
    else {
      id v15 = 0;
    }
    id v20 = v10;

    id v16 = v20;
  }
  uint64_t v21 = objc_alloc_init(CALNMutableTriggeredEventNotificationData);
  id v22 = [v9 alarmID];
  [(CALNMutableTriggeredEventNotificationData *)v21 setAlarmID:v22];

  -[CALNMutableTriggeredEventNotificationData setIsOffsetFromTravelTimeStart:](v21, "setIsOffsetFromTravelTimeStart:", [v9 isOffsetFromTravelTimeStart]);
  [(CALNMutableTriggeredEventNotificationData *)v21 setLastFireTimeOfAlertOffsetFromTravelTime:v15];
  uint64_t v23 = [v9 hypothesis];
  [(CALNMutableTriggeredEventNotificationData *)v21 setHypothesis:v23];

  [(CALNMutableTriggeredEventNotificationData *)v21 setHasDisplayedLeaveByMessage:v12];
  [(CALNMutableTriggeredEventNotificationData *)v21 setHasDisplayedLeaveNowMessage:v13];
  [(CALNMutableTriggeredEventNotificationData *)v21 setHasDisplayedRunningLateMessage:v14];
  [(CALNMutableTriggeredEventNotificationData *)v21 setLastTimeNotificationAdded:v16];
  char v24 = (void *)[(CALNMutableTriggeredEventNotificationData *)v21 copy];

  return v24;
}

- (void)_removeStoredNotificationDataForEventWithEventID:(id)a3
{
  id v5 = a3;
  id v4 = [(CALNTriggeredEventNotificationSource *)self notificationDataStorage];
  [v4 removeNotificationDataWithIdentifier:v5];

  [(NSMutableDictionary *)self->_eventURLToObjectIDMap removeObjectForKey:v5];
}

- (void)_updateStoredNotificationDataForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 transition:(unint64_t)a6 now:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v16);

  uint64_t v17 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v18 = [NSNumber numberWithUnsignedInteger:a6];
    int v21 = 138543618;
    id v22 = v12;
    __int16 v23 = 2114;
    char v24 = v18;
    _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, "Updating stored notification data for source client identifier = %{public}@, transition = %{public}@", (uint8_t *)&v21, 0x16u);
  }
  unsigned int v19 = [(CALNTriggeredEventNotificationSource *)self _notificationDataForSourceNotificationInfo:v15 existingNotificationData:v14 transition:a6 now:v13];

  if (v19)
  {
    [(CALNTriggeredEventNotificationSource *)self _addNotificationData:v19 forSourceClientIdentifier:v12];
  }
  else
  {
    id v20 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543362;
      id v22 = v12;
      _os_log_impl(&dword_2216BB000, v20, OS_LOG_TYPE_DEFAULT, "Could not get notification data for source client identifier = %{public}@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)_addNotificationDataForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 existingNotificationData:(id)a5 transition:(unint64_t)a6 now:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:a6];
    int v19 = 138543618;
    id v20 = v12;
    __int16 v21 = 2114;
    id v22 = v17;
    _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, "Adding notification data for source notification info. source client identifier = %{public}@, transition = %{public}@", (uint8_t *)&v19, 0x16u);
  }
  unsigned int v18 = [(CALNTriggeredEventNotificationSource *)self _notificationDataForSourceNotificationInfo:v15 existingNotificationData:v14 transition:a6 now:v13];

  [(CALNTriggeredEventNotificationSource *)self _addNotificationData:v18 forSourceClientIdentifier:v12];
}

- (void)_addNotificationData:(id)a3 forSourceClientIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventIDForSourceClientIdentifier:v7];
  if (v8)
  {
    id v9 = [(CALNTriggeredEventNotificationSource *)self notificationDataStorage];
    [v9 addNotificationData:v6 withIdentifier:v8];

    id v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      id v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      id v19 = v6;
      id v11 = "Added notification data, source client identifier = %{public}@, event ID = %{public}@, notification data = %@";
      id v12 = v10;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
  }
  else
  {
    id v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v7;
      id v11 = "No event ID to add notification data for source client identifier = %{public}@";
      id v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_6;
    }
  }
}

- (BOOL)_shouldRemoveStoredNotificationDataGivenShouldWithdrawNotification:(BOOL)a3 hasExistingTravelInformation:(BOOL)a4 mayCeaseRouteMonitoring:(BOOL)a5
{
  return (a5 | ~a4) & a3;
}

- (BOOL)_shouldUpdateStoredNotificationDataGivenTransition:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)_resetStoredNotificationDataTimeToLeaveDisplayStateForSourceClientIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Resetting stored notification data time to leave display state for source client identifier = %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(CALNTriggeredEventNotificationSource *)self _existingNotificationDataMatchingEventForSourceClientIdentifier:v4];
  id v8 = [(CALNTriggeredEventNotificationSource *)self _updatedNotificationDataResettingTimeToLeaveDisplayState:v7];
  [(CALNTriggeredEventNotificationSource *)self _addNotificationData:v8 forSourceClientIdentifier:v4];
}

- (void)_clearTravelAdvisoryFromNotificationMetaDataForSourceClientIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CALNTriggeredEventNotificationSource *)self _existingNotificationDataMatchingEventForSourceClientIdentifier:v4];
  id v7 = (void *)[v6 mutableCopy];
  [v7 setHypothesis:0];
  id v8 = (void *)[v7 copy];
  [(CALNTriggeredEventNotificationSource *)self _addNotificationData:v8 forSourceClientIdentifier:v4];

  int v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Cleared travel advisory from notification meta data for source client identifier = %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (id)_updatedNotificationDataResettingTimeToLeaveDisplayState:(id)a3
{
  BOOL v3 = (void *)[a3 mutableCopy];
  [v3 setHasDisplayedLeaveByMessage:0];
  [v3 setHasDisplayedLeaveNowMessage:0];
  [v3 setHasDisplayedRunningLateMessage:0];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)migrateToStorage:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CALNTriggeredEventNotificationSource_migrateToStorage___block_invoke;
  block[3] = &unk_2645C1440;
  block[4] = self;
  id v9 = v4;
  int v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __57__CALNTriggeredEventNotificationSource_migrateToStorage___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v3 == v2)
  {
    id v4 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Storage migration: new storage is the same as existing storage; no work to be done",
        buf,
        2u);
    }
  }
  else
  {
    id v4 = [v3 notificationData];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v17;
      *(void *)&long long v6 = 138412290;
      long long v15 = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v10, v15);
          uint64_t v12 = [*(id *)(a1 + 40) notificationDataWithIdentifier:v10];
          if (v12)
          {
            uint64_t v13 = [(id)objc_opt_class() _mergeDataFromUnprotectedStore:v11 withDataInProtectedStore:v12];
            [*(id *)(a1 + 40) addNotificationData:v13 withIdentifier:v10];
            char v14 = +[CALNLogSubsystem calendar];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v21 = v10;
              __int16 v22 = 2112;
              uint64_t v23 = v13;
              _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Storage migration: key %@ had existing data; adding merged data: %@",
                buf,
                0x16u);
            }
          }
          else
          {
            [*(id *)(a1 + 40) addNotificationData:v11 withIdentifier:v10];
            uint64_t v13 = +[CALNLogSubsystem calendar];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              uint64_t v21 = v10;
              _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "Storage migration: copying data for key %@", buf, 0xCu);
            }
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v7);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  }
}

+ (id)_mergeDataFromUnprotectedStore:(id)a3 withDataInProtectedStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v6 alarmID];
  [v7 setAlarmID:v8];

  id v9 = [v5 hypothesis];
  [v7 setHypothesis:v9];

  objc_msgSend(v7, "setHasDisplayedLeaveByMessage:", objc_msgSend(v5, "hasDisplayedLeaveByMessage"));
  objc_msgSend(v7, "setHasDisplayedLeaveNowMessage:", objc_msgSend(v5, "hasDisplayedLeaveNowMessage"));
  objc_msgSend(v7, "setHasDisplayedRunningLateMessage:", objc_msgSend(v5, "hasDisplayedRunningLateMessage"));
  objc_msgSend(v7, "setIsOffsetFromTravelTimeStart:", objc_msgSend(v6, "isOffsetFromTravelTimeStart"));
  uint64_t v10 = [v6 lastFireTimeOfAlertOffsetFromTravelTime];
  uint64_t v11 = [v5 lastFireTimeOfAlertOffsetFromTravelTime];
  uint64_t v12 = _laterOfTwoPossiblyNilDates(v10, v11);
  [v7 setLastFireTimeOfAlertOffsetFromTravelTime:v12];

  uint64_t v13 = [v6 lastTimeNotificationAdded];

  char v14 = [v5 lastTimeNotificationAdded];

  long long v15 = _laterOfTwoPossiblyNilDates(v13, v14);
  [v7 setLastTimeNotificationAdded:v15];

  return v7;
}

- (id)_notificationResponseDataForRecord:(id)a3
{
  id v3 = a3;
  id v4 = [v3 content];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 userInfo];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"com.apple.calendar.notification.CALNTriggeredEventNotificationResponseDataPayloadUserInfoKey"];
      if (v8)
      {
        id v9 = +[CALNTriggeredEventNotificationResponseDataPayloadMapper notificationResponseDataForPayload:v8];
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:](v3);
      }
    }
    else
    {
      uint64_t v8 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:](v3);
      }
    }
    id v9 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CALNTriggeredEventNotificationSource _notificationResponseDataForRecord:](v3);
  }
  id v9 = 0;
LABEL_15:

  return v9;
}

- (id)_notificationResponseDataForSourceNotificationInfo:(id)a3
{
  id v3 = a3;
  id v4 = [CALNTriggeredEventNotificationResponseData alloc];
  id v5 = [v3 hypothesis];
  id v6 = [v3 lastFireTimeOfAlertOffsetFromTravelTime];

  uint64_t v7 = [(CALNTriggeredEventNotificationResponseData *)v4 initWithHypothesis:v5 lastFireTimeOfAlertOffsetFromTravelTime:v6];
  return v7;
}

- (void)_setNotificationResponseData:(id)a3 onNotificationContent:(id)a4
{
  id v5 = a4;
  id v6 = +[CALNTriggeredEventNotificationResponseDataPayloadMapper payloadForNotificationResponseData:a3];
  [v5 setUserInfoValue:v6 forKey:@"com.apple.calendar.notification.CALNTriggeredEventNotificationResponseDataPayloadUserInfoKey"];
}

- (id)_eventRepresentationDictionaryWithSourceNotificationInfo:(id)a3 hypothesisMessage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 eventRepresentationDictionary];
  if (v7 && v6)
  {
    uint64_t v8 = [(CALNTriggeredEventNotificationSource *)self sourceEventRepresentationProvider];
    uint64_t v9 = [v8 updateEventRepresentationDictionary:v7 withHypothesisMessage:v6];

    uint64_t v7 = (void *)v9;
  }

  return v7;
}

- (id)_resolvedSourceClientIdentifierForNewSourceClientIdentifier:(id)a3 oldSourceClientIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v15 = 0;
    id v16 = 0;
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v16 andAlarmID:&v15 fromSourceClientIdentifier:v5];
    id v7 = v16;
    id v8 = v15;
    uint64_t v13 = 0;
    id v14 = 0;
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v14 andAlarmID:&v13 fromSourceClientIdentifier:v6];
    id v9 = v14;
    if (v13) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v5;
    }
    if (v8) {
      uint64_t v10 = v5;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (BOOL)_sourceClientIdentifier:(id)a3 matchesEventForSourceClientIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v17 = 0;
  id v18 = 0;
  +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v18 andAlarmID:&v17 fromSourceClientIdentifier:v5];
  id v7 = v18;
  id v8 = v17;
  if (v7)
  {
    id v15 = 0;
    id v16 = 0;
    +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:&v16 andAlarmID:&v15 fromSourceClientIdentifier:v6];
    id v9 = v16;
    id v10 = v15;
    if (v9)
    {
      int v11 = [v7 isEqualToString:v9];
      uint64_t v12 = +[CALNLogSubsystem calendar];
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13) {
          -[CALNTriggeredEventNotificationSource _sourceClientIdentifier:matchesEventForSourceClientIdentifier:]();
        }
      }
      else if (v13)
      {
        -[CALNTriggeredEventNotificationSource _sourceClientIdentifier:matchesEventForSourceClientIdentifier:]();
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)_launchURLForResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 notificationRecord];
  id v5 = [v3 actionIdentifier];

  if ([v5 isEqualToString:@"CALNNotificationDirectionsAction"])
  {
    uint64_t v6 = [(id)objc_opt_class() _mapItemURLForNotification:v4];
LABEL_7:
    id v7 = (void *)v6;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"CALNNotificationConferenceCallAction"])
  {
    uint64_t v6 = [(id)objc_opt_class() _conferenceURLForNotification:v4];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"Mail_identifier"])
  {
    uint64_t v6 = [(id)objc_opt_class() _mailtoURLForNotification:v4];
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)_mapItemURLForNotification:(id)a3
{
  id v3 = [a3 content];
  id v4 = [v3 userInfo];

  id v5 = [v4 objectForKeyedSubscript:@"MapItemURL"];
  if (v5)
  {
    uint64_t v6 = [NSURL URLWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)_conferenceURLForNotification:(id)a3
{
  id v3 = [a3 content];
  id v4 = [v3 userInfo];

  id v5 = [v4 objectForKeyedSubscript:@"ConferenceURL"];
  if (v5)
  {
    uint64_t v6 = [NSURL URLWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)_mailtoURLForNotification:(id)a3
{
  id v3 = [a3 content];
  id v4 = [v3 userInfo];

  id v5 = [v4 objectForKeyedSubscript:@"mailto"];
  if (v5)
  {
    uint64_t v6 = [NSURL URLWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_updatedLastFireTimeOfAlertOffsetFromTravelTimeGivenIsOffsetFromTravelTime:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(CALNTriggeredEventNotificationSource *)self dateProvider];
    id v4 = [v3 now];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (CALNTriggeredEventNotificationDataSource)dataSource
{
  return self->_dataSource;
}

- (CALNNotificationManager)notificationManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationManager);
  return (CALNNotificationManager *)WeakRetained;
}

- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider
{
  return self->_iconIdentifierProvider;
}

- (CALNSourceEventRepresentationProvider)sourceEventRepresentationProvider
{
  return self->_sourceEventRepresentationProvider;
}

- (CALNTriggeredEventNotificationTriggerHelper)triggerHelper
{
  return self->_triggerHelper;
}

- (CALNTriggeredEventNotificationTransitionProvider)transitionProvider
{
  return self->_transitionProvider;
}

- (CALNTriggeredEventNotificationBodyDescriptionProvider)bodyDescriptionProvider
{
  return self->_bodyDescriptionProvider;
}

- (CALNTravelAdvisoryTimelinessAuthority)travelAdvisoryTimelinessAuthority
{
  return self->_travelAdvisoryTimelinessAuthority;
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (CALNTriggeredEventNotificationDataStorage)notificationDataStorage
{
  return self->_notificationDataStorage;
}

- (CALNTimeToLeaveRefreshStorage)timeToLeaveRefreshStorage
{
  return self->_timeToLeaveRefreshStorage;
}

- (CALNSnoozeUpdateTimer)snoozeUpdateTimer
{
  return self->_snoozeUpdateTimer;
}

- (NSMutableDictionary)eventURLToObjectIDMap
{
  return self->_eventURLToObjectIDMap;
}

- (CALNURLHandler)urlHandler
{
  return self->_urlHandler;
}

- (CALNTriggeredEventNotificationMapItemURLProvider)mapItemURLProvider
{
  return self->_mapItemURLProvider;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mapItemURLProvider, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_eventURLToObjectIDMap, 0);
  objc_storeStrong((id *)&self->_snoozeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_timeToLeaveRefreshStorage, 0);
  objc_storeStrong((id *)&self->_notificationDataStorage, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_travelAdvisoryTimelinessAuthority, 0);
  objc_storeStrong((id *)&self->_bodyDescriptionProvider, 0);
  objc_storeStrong((id *)&self->_transitionProvider, 0);
  objc_storeStrong((id *)&self->_triggerHelper, 0);
  objc_storeStrong((id *)&self->_sourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

+ (id)snoozeActionIdentifier
{
  return @"CALNTriggeredEventNotificationSnoozeActionIdentifier";
}

+ (id)directionsActionIdentifier
{
  return @"CALNNotificationDirectionsAction";
}

+ (id)conferenceCallActionIdentifier
{
  return @"CALNNotificationConferenceCallAction";
}

+ (id)mailOrganizerActionIdentifier
{
  return @"Mail_identifier";
}

+ (NSString)mapItemURLUserInfoKey
{
  return (NSString *)@"MapItemURL";
}

+ (NSString)conferenceURLUserInfoKey
{
  return (NSString *)@"ConferenceURL";
}

+ (NSString)mailToURLUserInfoKey
{
  return (NSString *)@"mailto";
}

- (void)refreshNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNTriggeredEventNotificationSource *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__CALNTriggeredEventNotificationSource_UnitTesting__refreshNotification___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __73__CALNTriggeredEventNotificationSource_UnitTesting__refreshNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshNotification:*(void *)(a1 + 40)];
}

- (void)contentForSourceClientIdentifier:sourceNotificationInfo:isProtectedDataAvailable:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Using default title for notification content despite protected data being available, source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_triggeredWithSourceClientIdentifier:triggerData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get notification info for event (%{public}@).", v2, v3, v4, v5, v6);
}

- (void)_triggeredWithSourceClientIdentifier:triggerData:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2216BB000, v1, OS_LOG_TYPE_ERROR, "Could not get notification content. source client identifier = %{public}@, source notification info = %@", v2, 0x16u);
}

- (void)_triggeredWithSourceClientIdentifier:triggerData:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Notification that should trigger cannot because we could not compute the transition type. source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_travelEngineEventSignificantlyChangedWithSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get existing record for source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_contentForNotificationWithSourceClientIdentifier:shouldClearHypothesis:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get source notification info. source client identifier = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_sourceNotificationInfoForSourceClientIdentifier:shouldClearHypothesis:isForContentCreation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Failed to get notification info for event (%{public}@). Returning nil content", v2, v3, v4, v5, v6);
}

- (void)_commonHandleResponse:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 notificationRecord];
  uint64_t v5 = [v4 sourceClientIdentifier];
  uint8_t v6 = [a1 actionIdentifier];
  int v7 = 138543874;
  id v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Error: Could not get launch URL for action. notification identifier = %{public}@, action identifier = %{public}@, response = %@", (uint8_t *)&v7, 0x20u);
}

- (void)_notificationResponseDataForRecord:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 sourceClientIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_2216BB000, v2, v3, "No content available to get notification response data. source client identifier = %{public}@", v4, v5, v6, v7, v8);
}

- (void)_notificationResponseDataForRecord:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 sourceClientIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_2216BB000, v2, v3, "No user info available to get notification response data. source client identifier = %{public}@", v4, v5, v6, v7, v8);
}

- (void)_notificationResponseDataForRecord:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 sourceClientIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_2216BB000, v2, v3, "No notification response data payload in user info. source client identifier = %{public}@", v4, v5, v6, v7, v8);
}

- (void)_sourceClientIdentifier:matchesEventForSourceClientIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_2216BB000, v0, v1, "Source client identifiers refer to the same event. Source client identifier: %{public}@. Other source client identifier: %{public}@.");
}

- (void)_sourceClientIdentifier:matchesEventForSourceClientIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_2216BB000, v0, v1, "Source client identifiers do not refer to the same event. Source client identifier: %{public}@. Other source client identifier: %{public}@.");
}

@end