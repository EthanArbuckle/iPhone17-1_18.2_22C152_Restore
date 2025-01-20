@interface CALNCalendarResourceChangedNotificationSource
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNCalendarResourceChangedNotificationDataSource)dataSource;
- (CALNCalendarResourceChangedNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6 dateProvider:(id)a7;
- (CALNNotificationManager)notificationManager;
- (CALNSourceEventRepresentationProvider)sourceEventRepresentationProvider;
- (CalDateProvider)dateProvider;
- (NSArray)categories;
- (NSString)sourceIdentifier;
- (id)contentForNotificationWithInfo:(id)a3;
- (id)contentForNotificationWithSourceClientIdentifier:(id)a3;
- (void)didReceiveResponse:(id)a3;
- (void)refreshNotifications:(id)a3;
@end

@implementation CALNCalendarResourceChangedNotificationSource

- (CALNCalendarResourceChangedNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6 dateProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNCalendarResourceChangedNotificationSource;
  v18 = [(CALNCalendarResourceChangedNotificationSource *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataSource, a3);
    objc_storeWeak((id *)&v19->_notificationManager, v14);
    objc_storeStrong((id *)&v19->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v19->_sourceEventRepresentationProvider, a6);
    objc_storeStrong((id *)&v19->_dateProvider, a7);
  }

  return v19;
}

- (NSString)sourceIdentifier
{
  return (NSString *)@"com.apple.calendar.notifications.CalendarResourceChanged";
}

- (NSArray)categories
{
  if (categories_onceToken_6 != -1) {
    dispatch_once(&categories_onceToken_6, &__block_literal_global_22);
  }
  v2 = (void *)categories_categories_6;
  return (NSArray *)v2;
}

void __59__CALNCalendarResourceChangedNotificationSource_categories__block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = +[CALNBundle bundle];
  v1 = [v0 localizedStringForKey:@"notification.hiddenPreviewsBodyPlaceholder.resourceChange" value:@"Shared Event Change" table:0];
  v2 = +[CALNNotificationCategory categoryWithIdentifier:@"CALNResourceChangedCategoryIdentifier" actions:MEMORY[0x263EFFA68] hiddenPreviewsBodyPlaceholder:v1 options:0];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  v4 = (void *)categories_categories_6;
  categories_categories_6 = v3;
}

- (void)refreshNotifications:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNCalendarResourceChangedNotificationSource *)self dataSource];
  v23 = v4;
  v6 = [v5 fetchCalendarResourceChangedNotificationSourceClientIdentifiers:v4];

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
        v12 = (void *)MEMORY[0x223C88D10]();
        id v13 = [(CALNCalendarResourceChangedNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v11];
        if (v13)
        {
          id v14 = [CALNNotificationRecord alloc];
          id v15 = [(CALNCalendarResourceChangedNotificationSource *)self sourceIdentifier];
          id v16 = [(CALNNotificationRecord *)v14 initWithSourceIdentifier:v15 sourceClientIdentifier:v11 content:v13];

          [v25 addObject:v16];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }

  id v17 = +[CALNLogSubsystem calendar];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v18)
    {
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      v20 = "Refreshed calendar resource changed notifications in response to database change. Found %{public}@ notificat"
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
    v20 = "Refreshed calendar resource changed notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  objc_super v21 = [(CALNCalendarResourceChangedNotificationSource *)self notificationManager];
  v22 = [(CALNCalendarResourceChangedNotificationSource *)self sourceIdentifier];
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:v21 withNotificationRecords:v25 forSourceWithIdentifier:v22 filteredBySourceClientIDs:v23];
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CALNCalendarResourceChangedNotificationSource *)self dataSource];
  v6 = [v5 fetchCalendarResourceChangedNotificationWithSourceClientIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [(CALNCalendarResourceChangedNotificationSource *)self contentForNotificationWithInfo:v6];
  }
  else
  {
    uint64_t v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNCalendarResourceChangedNotificationSource contentForNotificationWithSourceClientIdentifier:]((uint64_t)v4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)contentForNotificationWithInfo:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CALNBundle bundle];
  v35 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.resourceChanges"];
  v6 = objc_opt_new();
  uint64_t v7 = [v4 calendarNotification];
  v37 = [v7 title];
  if (!v37)
  {
    v37 = [v5 localizedStringForKey:@"Shared Calendar Change" value:&stru_26D3B3198 table:0];
  }
  v36 = [v4 date];
  if (!v36)
  {
    v36 = [MEMORY[0x263EFF910] date];
  }
  uint64_t v8 = [v4 date];
  uint64_t v9 = [v4 allDay];
  v10 = [(CALNCalendarResourceChangedNotificationSource *)self dateProvider];
  uint64_t v11 = +[CALNDateStringUtils dateTimeStringForEventDate:v8 alwaysIncludeDate:1 allDayEvent:v9 dateProvider:v10];

  v12 = CUIKMessageStringForNotification();
  id v13 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (v11 && [v11 length]) {
    [v13 appendString:v11];
  }
  if (v12 && [v12 length])
  {
    if ([v13 length]) {
      [v13 appendString:@"\n"];
    }
    [v13 appendString:v12];
  }
  uint64_t v33 = v12;
  v34 = v5;
  [v6 setTitle:v37];
  [v6 setBody:v13];
  [v6 setCategoryIdentifier:@"CALNResourceChangedCategoryIdentifier"];
  [v6 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.resourceChanges"];
  id v14 = [v4 launchURL];
  [v6 setDefaultActionURL:v14];

  [v6 setSound:v35];
  id v15 = [(CALNCalendarResourceChangedNotificationSource *)self iconIdentifierProvider];
  id v16 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v17 = [v15 identifierForIconWithDate:v36 inCalendar:v16];
  [v6 setIconIdentifier:v17];

  [v6 setInterruptionLevel:1];
  BOOL v18 = [v7 calendar];
  v19 = [v18 calendarIdentifier];
  [v6 setFilterCriteria:v19];

  if ([v4 isDelegate])
  {
    v20 = [v4 sourceTitle];
    objc_super v21 = [v4 sourceIdentifier];
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:v6 forDelegateSourceWithTitle:v20 identifier:v21];
  }
  v22 = v11;
  if ([v4 changeType] != 3)
  {
    v23 = [v4 date];
    [v6 setDate:v23];
  }
  objc_msgSend(v6, "setShouldHideTime:", objc_msgSend(v4, "allDay"));
  v24 = [(CALNCalendarResourceChangedNotificationSource *)self sourceEventRepresentationProvider];
  v25 = [v7 startDate];
  long long v26 = [v7 endDate];
  long long v27 = [v4 timeZone];
  long long v28 = [v24 eventRepresentationDictionaryForResourceChangeNotification:v7 message:v13 date:v25 endDate:v26 timeZone:v27];

  if (v28) {
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:v28 onNotificationContent:v6];
  }
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:v7 onNotificationContent:v6];
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:v7 onNotificationContent:v6];
  if ([v4 changeType] != 3) {
    +[CALNResourceChangedLaunchUtils setResourceChangedEventURLForCalendarNotification:v7 onNotificationContent:v6];
  }
  long long v29 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [v4 sourceClientIdentifier];
    *(_DWORD *)buf = 138543618;
    v39 = v30;
    __int16 v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_2216BB000, v29, OS_LOG_TYPE_DEFAULT, "Fetched calendar resource changed notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
  }
  v31 = (void *)[v6 copy];

  return v31;
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
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for calendar resource changed %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (([v5 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    uint64_t v9 = [(CALNCalendarResourceChangedNotificationSource *)self dataSource];
    [v9 clearCalendarResourceChangedNotificationWithSourceClientIdentifier:v7];
  }
}

- (CALNCalendarResourceChangedNotificationDataSource)dataSource
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

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_sourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)contentForNotificationWithSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Failed to get content for calendar resource changed notification with sourceClientIdentifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end