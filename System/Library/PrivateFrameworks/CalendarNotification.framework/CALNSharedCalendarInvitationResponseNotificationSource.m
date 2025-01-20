@interface CALNSharedCalendarInvitationResponseNotificationSource
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNNotificationManager)notificationManager;
- (CALNSharedCalendarInvitationResponseNotificationDataSource)dataSource;
- (CALNSharedCalendarInvitationResponseNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6;
- (CALNSourceEventRepresentationProvider)sourceEventRepresentationProvider;
- (NSArray)categories;
- (NSString)sourceIdentifier;
- (id)contentForNotificationWithInfo:(id)a3;
- (id)contentForNotificationWithSourceClientIdentifier:(id)a3;
- (void)didReceiveResponse:(id)a3;
- (void)refreshNotifications:(id)a3;
@end

@implementation CALNSharedCalendarInvitationResponseNotificationSource

- (CALNSharedCalendarInvitationResponseNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNSharedCalendarInvitationResponseNotificationSource;
  v15 = [(CALNSharedCalendarInvitationResponseNotificationSource *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a3);
    objc_storeWeak((id *)&v16->_notificationManager, v12);
    objc_storeStrong((id *)&v16->_iconIdentifierProvider, a5);
    objc_storeStrong((id *)&v16->_sourceEventRepresentationProvider, a6);
  }

  return v16;
}

- (NSString)sourceIdentifier
{
  return (NSString *)@"com.apple.calendar.notifications.SharedCalendarInvitationResponse";
}

- (NSArray)categories
{
  if (categories_onceToken != -1) {
    dispatch_once(&categories_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)categories_categories;
  return (NSArray *)v2;
}

void __68__CALNSharedCalendarInvitationResponseNotificationSource_categories__block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = +[CALNBundle bundle];
  v1 = [v0 localizedStringForKey:@"notification.hiddenPreviewsBodyPlaceholder.calendar.invitationResponse" value:@"Invitation Response" table:0];
  v2 = +[CALNNotificationCategory categoryWithIdentifier:@"CALNSharedInvitationResponseCategoryIdentifier" actions:MEMORY[0x263EFFA68] hiddenPreviewsBodyPlaceholder:v1 options:0];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  v4 = (void *)categories_categories;
  categories_categories = v3;
}

- (void)refreshNotifications:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self dataSource];
  v23 = v4;
  v6 = [v5 fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:v4];

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
        id v13 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v11];
        if (v13)
        {
          id v14 = [CALNNotificationRecord alloc];
          v15 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self sourceIdentifier];
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
      v20 = "Refreshed shared calendar invitation response notifications in response to database change. Found %{public}@"
            " notifications for changed objects.";
LABEL_15:
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    }
  }
  else if (v18)
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    *(_DWORD *)buf = 138543362;
    v31 = v19;
    v20 = "Refreshed shared calendar invitation response notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  v21 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self notificationManager];
  v22 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self sourceIdentifier];
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:v21 withNotificationRecords:v25 forSourceWithIdentifier:v22 filteredBySourceClientIDs:v23];
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self dataSource];
  v6 = [v5 fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self contentForNotificationWithInfo:v6];
  }
  else
  {
    uint64_t v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNSharedCalendarInvitationResponseNotificationSource contentForNotificationWithSourceClientIdentifier:]((uint64_t)v4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)contentForNotificationWithInfo:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CALNBundle bundle];
  v6 = [v4 calendarNotification];
  uint64_t v7 = [v6 title];
  if (!v7)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"Shared Calendar Invitation" value:&stru_26D3B3198 table:0];
  }
  long long v26 = v5;
  uint64_t v8 = CUIKMessageStringForNotification();
  uint64_t v9 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.Responses"];
  v10 = objc_opt_new();
  [v10 setTitle:v7];
  [v10 setBody:v8];
  [v10 setCategoryIdentifier:@"CALNSharedInvitationResponseCategoryIdentifier"];
  [v10 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.Responses"];
  v25 = (void *)v9;
  [v10 setSound:v9];
  uint64_t v11 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self iconIdentifierProvider];
  id v12 = [MEMORY[0x263EFF910] date];
  id v13 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v14 = [v11 identifierForIconWithDate:v12 inCalendar:v13];
  [v10 setIconIdentifier:v14];

  [v10 setInterruptionLevel:1];
  v15 = [v6 calendar];
  v16 = [v15 calendarIdentifier];
  [v10 setFilterCriteria:v16];

  if ([v4 isDelegate])
  {
    v17 = [v4 sourceTitle];
    BOOL v18 = [v4 sourceIdentifier];
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:v10 forDelegateSourceWithTitle:v17 identifier:v18];
  }
  v19 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self sourceEventRepresentationProvider];
  v20 = [v19 eventRepresentationDictionaryForResponseNotificationWithTitle:v7 message:v8];

  if (v20) {
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:v20 onNotificationContent:v10];
  }
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:v6 onNotificationContent:v10];
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:v6 onNotificationContent:v10];
  v21 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v4 sourceClientIdentifier];
    *(_DWORD *)buf = 138543618;
    long long v28 = v22;
    __int16 v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation response notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
  }
  v23 = (void *)[v10 copy];

  return v23;
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
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for shared calendar invitation response %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (([v5 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    uint64_t v9 = [(CALNSharedCalendarInvitationResponseNotificationSource *)self dataSource];
    [v9 clearSharedCalendarInvitationResponseWithSourceClientIdentifier:v7];
  }
}

- (CALNSharedCalendarInvitationResponseNotificationDataSource)dataSource
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

- (void).cxx_destruct
{
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
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Failed to get content for shared calendar invitation notification with sourceClientIdentifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end