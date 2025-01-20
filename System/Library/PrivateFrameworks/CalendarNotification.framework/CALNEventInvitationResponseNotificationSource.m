@interface CALNEventInvitationResponseNotificationSource
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNEventInvitationResponseNotificationDataSource)dataSource;
- (CALNEventInvitationResponseNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6;
- (CALNNotificationManager)notificationManager;
- (CalDateProvider)dateProvider;
- (NSArray)categories;
- (NSString)sourceIdentifier;
- (id)_notificationBodyForNotificationInfo:(id)a3 contactIdentifier:(id *)a4;
- (id)contentForNotificationWithInfo:(id)a3;
- (id)contentForNotificationWithSourceClientIdentifier:(id)a3;
- (void)didReceiveResponse:(id)a3;
- (void)refreshNotifications:(id)a3;
@end

@implementation CALNEventInvitationResponseNotificationSource

- (CALNEventInvitationResponseNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNEventInvitationResponseNotificationSource;
  v15 = [(CALNEventInvitationResponseNotificationSource *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a3);
    objc_storeWeak((id *)&v16->_notificationManager, v12);
    objc_storeStrong((id *)&v16->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v16->_dateProvider, a6);
  }

  return v16;
}

- (NSString)sourceIdentifier
{
  return (NSString *)@"com.apple.calendar.notifications.EventInvitationResponse";
}

- (NSArray)categories
{
  if (categories_onceToken_7 != -1) {
    dispatch_once(&categories_onceToken_7, &__block_literal_global_27);
  }
  v2 = (void *)categories_categories_7;
  return (NSArray *)v2;
}

void __59__CALNEventInvitationResponseNotificationSource_categories__block_invoke()
{
  v12[2] = *MEMORY[0x263EF8340];
  v0 = +[CALNBundle bundle];
  v1 = [v0 localizedStringForKey:@"notification.hiddenPreviewsBodyPlaceholder.event.invitationResponse" value:@"Invitation Response" table:0];
  v2 = [v0 localizedStringForKey:@"EventInvitationResponseNotificationAcceptButton" value:@"Accept" table:0];
  v3 = [v0 localizedStringForKey:@"EventInvitationResponseNotificationDeclineButton" value:@"Decline" table:0];
  v4 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationAcceptAction" title:v2 systemImageName:@"checkmark.circle"];
  v5 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationDeclineAction" title:v3 systemImageName:@"xmark.circle"];
  v12[0] = v4;
  v12[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v7 = +[CALNNotificationCategory categoryWithIdentifier:@"com.apple.calendar.notifications.EventInvitationResponse" actions:MEMORY[0x263EFFA68] hiddenPreviewsBodyPlaceholder:v1 options:0];
  v8 = +[CALNNotificationCategory categoryWithIdentifier:@"EventInvitationResponse.ProposedTime" actions:v6 hiddenPreviewsBodyPlaceholder:v1 options:0];
  v11[0] = v7;
  v11[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v10 = (void *)categories_categories_7;
  categories_categories_7 = v9;
}

- (void)refreshNotifications:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNEventInvitationResponseNotificationSource *)self dataSource];
  v23 = v4;
  v6 = [v5 fetchEventInvitationResponseNotificationSourceClientIdentifiers:v4];

  v25 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x223C88D10]();
        id v13 = [(CALNEventInvitationResponseNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v11];
        if (v13)
        {
          id v14 = [CALNNotificationRecord alloc];
          v15 = [(CALNEventInvitationResponseNotificationSource *)self sourceIdentifier];
          v16 = [(CALNNotificationRecord *)v14 initWithSourceIdentifier:v15 sourceClientIdentifier:v11 content:v13];

          [v25 addObject:v16];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }

  v17 = +[CALNLogSubsystem calendar];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v18)
    {
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      v20 = "Refreshed event invitation response notifications in response to database change. Found %{public}@ notificat"
            "ions for changed objects.";
LABEL_15:
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    }
  }
  else if (v18)
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    *(_DWORD *)buf = 138543362;
    v31 = v19;
    v20 = "Refreshed event invitation response notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  v21 = [(CALNEventInvitationResponseNotificationSource *)self notificationManager];
  v22 = [(CALNEventInvitationResponseNotificationSource *)self sourceIdentifier];
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:v21 withNotificationRecords:v25 forSourceWithIdentifier:v22 filteredBySourceClientIDs:v23];
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CALNEventInvitationResponseNotificationSource *)self dataSource];
  v6 = [v5 fetchEventInvitationResponseNotificationWithSourceClientIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [(CALNEventInvitationResponseNotificationSource *)self contentForNotificationWithInfo:v6];
  }
  else
  {
    uint64_t v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNEventInvitationNotificationSource contentForNotificationWithSourceClientIdentifier:]((uint64_t)v4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)contentForNotificationWithInfo:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CALNBundle bundle];
  v6 = [v4 eventInvitationNotification];
  uint64_t v7 = [v6 title];
  if (!v7)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"EventNotificationDefaultTitleAttendeeReply" value:@"Attendee Response" table:0];
  }
  v32 = v5;
  id v33 = 0;
  uint64_t v8 = [(CALNEventInvitationResponseNotificationSource *)self _notificationBodyForNotificationInfo:v4 contactIdentifier:&v33];
  id v31 = v33;
  uint64_t v9 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.Responses"];
  v10 = [(CALNEventInvitationResponseNotificationSource *)self iconIdentifierProvider];
  uint64_t v11 = [v6 startDate];
  id v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v13 = [v10 identifierForIconWithDate:v11 inCalendar:v12];

  id v14 = objc_opt_new();
  [v14 setTitle:v7];
  [v14 setBody:v8];
  v15 = CUIKNewTimeProposerForNotification();

  if (v15) {
    v16 = @"EventInvitationResponse.ProposedTime";
  }
  else {
    v16 = @"com.apple.calendar.notifications.EventInvitationResponse";
  }
  [v14 setCategoryIdentifier:v16];
  [v14 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.Responses"];
  v17 = [v6 startDate];
  [v14 setDate:v17];

  BOOL v18 = [v4 expirationDate];
  [v14 setExpirationDate:v18];

  v19 = [v4 launchURL];
  [v14 setDefaultActionURL:v19];

  [v14 setIconIdentifier:v13];
  objc_msgSend(v14, "setShouldHideTime:", objc_msgSend(v6, "isAllDay"));
  [v14 setSound:v9];
  if (objc_msgSend(v6, "cuik_isTimeSensitive")) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 1;
  }
  [v14 setInterruptionLevel:v20];
  v21 = [v6 calendar];
  v22 = [v21 calendarIdentifier];
  [v14 setFilterCriteria:v22];

  if ([v4 isDelegate])
  {
    v23 = [v4 sourceTitle];
    v24 = [v4 sourceIdentifier];
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:v14 forDelegateSourceWithTitle:v23 identifier:v24];
  }
  if (v31)
  {
    v38[0] = v31;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
    [v14 setPeopleIdentifiers:v25];
  }
  long long v26 = [v4 eventRepresentationDictionary];
  if (v26) {
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:v26 onNotificationContent:v14];
  }
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:v6 onNotificationContent:v14];
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:v6 onNotificationContent:v14];
  long long v27 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    long long v28 = [v4 sourceClientIdentifier];
    *(_DWORD *)buf = 138543618;
    v35 = v28;
    __int16 v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_2216BB000, v27, OS_LOG_TYPE_DEFAULT, "Fetched event invitation response notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
  }
  long long v29 = (void *)[v14 copy];

  return v29;
}

- (void)didReceiveResponse:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 actionIdentifier];
  v6 = [v4 notificationRecord];

  uint64_t v7 = [v6 sourceClientIdentifier];

  uint64_t v8 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for event invitation response %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (([v5 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    uint64_t v9 = [(CALNEventInvitationResponseNotificationSource *)self dataSource];
    [v9 clearEventInvitationResponseWithSourceClientIdentifier:v7];
  }
  else if ([v5 isEqualToString:@"CALNNotificationAcceptAction"])
  {
    uint64_t v9 = [(CALNEventInvitationResponseNotificationSource *)self dataSource];
    [v9 acceptEventInvitationResponseWithSourceClientIdentifier:v7];
  }
  else
  {
    if (![v5 isEqualToString:@"CALNNotificationDeclineAction"]) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CALNEventInvitationResponseNotificationSource *)self dataSource];
    [v9 declineEventInvitationResponseWithSourceClientIdentifier:v7];
  }

LABEL_7:
}

- (id)_notificationBodyForNotificationInfo:(id)a3 contactIdentifier:(id *)a4
{
  v5 = [a3 eventInvitationNotification];
  v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [v5 startDate];
  uint64_t v8 = [v5 isAllDay];
  uint64_t v9 = [(CALNEventInvitationResponseNotificationSource *)self dateProvider];
  int v10 = +[CALNDateStringUtils dateTimeStringForEventDate:v7 alwaysIncludeDate:1 allDayEvent:v8 dateProvider:v9];

  [v6 addObject:v10];
  uint64_t v11 = CUIKMessageStringForEventInvitationNotification();
  if (v11) {
    [v6 addObject:v11];
  }
  __int16 v12 = [v6 componentsJoinedByString:@"\n"];
  id v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

  return v14;
}

- (CALNEventInvitationResponseNotificationDataSource)dataSource
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

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end