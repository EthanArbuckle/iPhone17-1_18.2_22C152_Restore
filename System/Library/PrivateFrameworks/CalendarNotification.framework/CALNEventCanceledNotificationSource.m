@interface CALNEventCanceledNotificationSource
+ (id)deleteActionIdentifier;
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNEventCanceledNotificationDataSource)dataSource;
- (CALNEventCanceledNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6;
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

@implementation CALNEventCanceledNotificationSource

- (CALNEventCanceledNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNEventCanceledNotificationSource;
  v15 = [(CALNEventCanceledNotificationSource *)&v18 init];
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
  return (NSString *)@"com.apple.calendar.notifications.EventCanceled";
}

- (NSArray)categories
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CALNEventCanceledNotificationSource_categories__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  if (categories_onceToken_2 != -1) {
    dispatch_once(&categories_onceToken_2, block);
  }
  return (NSArray *)(id)categories_categories_2;
}

void __49__CALNEventCanceledNotificationSource_categories__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = +[CALNBundle bundle];
  v3 = [v2 localizedStringForKey:@"notification.hiddenPreviewsBodyPlaceholder.event.invitation" value:@"Invitation" table:0];
  v4 = [v2 localizedStringForKey:@"EventCanceledDeleteButton" value:@"Delete" table:0];
  v5 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationDeleteActionIdentifier" title:v4 systemImageName:@"trash"];
  v6 = [*(id *)(a1 + 32) _categoryIdentifier];
  v12[0] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v8 = +[CALNNotificationCategory categoryWithIdentifier:v6 actions:v7 hiddenPreviewsBodyPlaceholder:v3 options:0];

  id v11 = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v10 = (void *)categories_categories_2;
  categories_categories_2 = v9;
}

- (void)refreshNotifications:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNEventCanceledNotificationSource *)self dataSource];
  v23 = v4;
  v6 = [v5 fetchEventCanceledNotificationSourceClientIdentifiers:v4];

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
        id v13 = [(CALNEventCanceledNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v11];
        if (v13)
        {
          id v14 = [CALNNotificationRecord alloc];
          v15 = [(CALNEventCanceledNotificationSource *)self sourceIdentifier];
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
      v20 = "Refreshed event canceled notifications in response to database change. Found %{public}@ notifications for changed objects.";
LABEL_15:
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    }
  }
  else if (v18)
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    *(_DWORD *)buf = 138543362;
    v31 = v19;
    v20 = "Refreshed event canceled notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  v21 = [(CALNEventCanceledNotificationSource *)self notificationManager];
  v22 = [(CALNEventCanceledNotificationSource *)self sourceIdentifier];
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:v21 withNotificationRecords:v25 forSourceWithIdentifier:v22 filteredBySourceClientIDs:v23];
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CALNEventCanceledNotificationSource *)self dataSource];
  v6 = [v5 fetchEventCanceledNotificationWithSourceClientIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [(CALNEventCanceledNotificationSource *)self contentForNotificationWithInfo:v6];
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
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CALNBundle bundle];
  v6 = [v4 eventInvitationNotification];
  uint64_t v7 = [v6 title];
  if (!v7)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"EventInvitationNotificationDefaultTitle" value:@"Invitation" table:0];
  }
  v32 = v5;
  uint64_t v33 = (void *)v7;
  id v34 = 0;
  uint64_t v8 = [(CALNEventCanceledNotificationSource *)self _notificationBodyForNotificationInfo:v4 contactIdentifier:&v34];
  id v31 = v34;
  uint64_t v9 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.invitations"];
  v10 = [(CALNEventCanceledNotificationSource *)self iconIdentifierProvider];
  uint64_t v11 = [v6 startDate];
  id v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v13 = [v10 identifierForIconWithDate:v11 inCalendar:v12];

  id v14 = v33;
  v15 = objc_opt_new();
  [v15 setTitle:v33];
  [v15 setBody:v8];
  v16 = [(CALNEventCanceledNotificationSource *)self _categoryIdentifier];
  [v15 setCategoryIdentifier:v16];

  [v15 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.invitations"];
  v17 = [v6 startDate];
  [v15 setDate:v17];

  BOOL v18 = [v4 expirationDate];
  [v15 setExpirationDate:v18];

  v19 = [v4 launchURL];
  [v15 setDefaultActionURL:v19];

  [v15 setIconIdentifier:v13];
  objc_msgSend(v15, "setShouldHideTime:", objc_msgSend(v6, "isAllDay"));
  [v15 setSound:v9];
  if (objc_msgSend(v6, "cuik_isTimeSensitive")) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 1;
  }
  [v15 setInterruptionLevel:v20];
  v21 = [v6 calendar];
  v22 = [v21 calendarIdentifier];
  [v15 setFilterCriteria:v22];

  if ([v4 isDelegate])
  {
    v23 = [v4 sourceTitle];
    v24 = [v4 sourceIdentifier];
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:v15 forDelegateSourceWithTitle:v23 identifier:v24];

    id v14 = v33;
  }
  if (v31)
  {
    v39[0] = v31;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    [v15 setPeopleIdentifiers:v25];
  }
  long long v26 = [v4 eventRepresentationDictionary];
  if (v26) {
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:v26 onNotificationContent:v15];
  }
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:v6 onNotificationContent:v15];
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:v6 onNotificationContent:v15];
  long long v27 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    long long v28 = [v4 sourceClientIdentifier];
    *(_DWORD *)buf = 138543618;
    v36 = v28;
    __int16 v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_2216BB000, v27, OS_LOG_TYPE_DEFAULT, "Fetched event canceled notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
  }
  long long v29 = (void *)[v15 copy];

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
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for event canceled %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (([v5 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    uint64_t v9 = [(CALNEventCanceledNotificationSource *)self dataSource];
    [v9 clearCanceledEventNotificationWithSourceClientIdentifier:v7];
  }
  else
  {
    if (![v5 isEqualToString:@"CALNNotificationDeleteActionIdentifier"]) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CALNEventCanceledNotificationSource *)self dataSource];
    [v9 deleteCanceledEventWithSourceClientIdentifier:v7];
  }

LABEL_7:
}

- (id)_notificationBodyForNotificationInfo:(id)a3 contactIdentifier:(id *)a4
{
  *a4 = 0;
  v5 = [a3 eventInvitationNotification];
  v6 = [v5 startDate];
  uint64_t v7 = [v5 isAllDay];
  uint64_t v8 = [(CALNEventCanceledNotificationSource *)self dateProvider];
  uint64_t v9 = +[CALNDateStringUtils dateTimeStringForEventDate:v6 alwaysIncludeDate:1 allDayEvent:v7 dateProvider:v8];

  int v10 = +[CALNBundle bundle];
  uint64_t v11 = [v10 localizedStringForKey:@"Canceled by %@" value:&stru_26D3B3198 table:0];
  if ([v5 couldBeJunk])
  {
    __int16 v12 = [v5 owner];
    id v13 = +[CALNNotificationSourceUtils displayNameForJunkIdentity:v12];
  }
  else
  {
    id v13 = CUIKDisplayStringForNotificationIdentity();
  }
  uint64_t v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, v13);
  v15 = [MEMORY[0x263EFF980] array];
  [v15 addObject:v14];
  [v15 addObject:v9];
  if (v14 && [v5 couldBeJunk])
  {
    uint64_t v16 = [v10 localizedStringForKey:@"Unknown Sender" value:&stru_26D3B3198 table:0];

    [v15 insertObject:v16 atIndex:0];
    id v13 = (void *)v16;
  }
  v17 = [v15 componentsJoinedByString:@"\n"];
  BOOL v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v19 = [v17 stringByTrimmingCharactersInSet:v18];

  return v19;
}

- (CALNEventCanceledNotificationDataSource)dataSource
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

+ (id)deleteActionIdentifier
{
  return @"CALNNotificationDeleteActionIdentifier";
}

@end