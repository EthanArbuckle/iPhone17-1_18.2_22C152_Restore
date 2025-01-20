@interface CALNSharedCalendarInvitationNotificationSource
+ (id)categoryIdentifierWithReportJunk;
+ (id)categoryIdentifierWithoutReportJunk;
+ (id)declineActionIdentifier;
+ (id)joinActionIdentifier;
+ (id)reportJunkActionIdentifier;
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNNotificationManager)notificationManager;
- (CALNSharedCalendarInvitationNotificationDataSource)dataSource;
- (CALNSharedCalendarInvitationNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6;
- (CALNSourceEventRepresentationProvider)sourceEventRepresentationProvider;
- (NSArray)categories;
- (NSString)sourceIdentifier;
- (id)contentForNotificationWithInfo:(id)a3;
- (id)contentForNotificationWithSourceClientIdentifier:(id)a3;
- (void)didReceiveResponse:(id)a3;
- (void)refreshNotifications:(id)a3;
@end

@implementation CALNSharedCalendarInvitationNotificationSource

- (CALNSharedCalendarInvitationNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 sourceEventRepresentationProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNSharedCalendarInvitationNotificationSource;
  v15 = [(CALNSharedCalendarInvitationNotificationSource *)&v18 init];
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
  return (NSString *)@"com.apple.calendar.notifications.SharedCalendarInvitation";
}

- (NSArray)categories
{
  if (categories_onceToken_1 != -1) {
    dispatch_once(&categories_onceToken_1, &__block_literal_global_3);
  }
  v2 = (void *)categories_categories_1;
  return (NSArray *)v2;
}

void __60__CALNSharedCalendarInvitationNotificationSource_categories__block_invoke()
{
  v16[2] = *MEMORY[0x263EF8340];
  v0 = +[CALNBundle bundle];
  v1 = [v0 localizedStringForKey:@"notification.hiddenPreviewsBodyPlaceholder.calendar.invitation" value:@"Invitation" table:0];
  id v13 = [v0 localizedStringForKey:@"SharedCalendarInvitationJoinButton" value:@"Join" table:0];
  id v12 = [v0 localizedStringForKey:@"SharedCalendarInvitationDeclineButton" value:@"Decline" table:0];
  id v11 = [v0 localizedStringForKey:@"SharedCalendarInvitationReportJunkButton" value:@"Report Junk" table:0];
  v2 = +[CALNNotificationAction actionWithIdentifier:@"CALNSharedCalendarInvitationJoinActionIdentifier" title:v13 systemImageName:@"checkmark.circle"];
  v3 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationDeclineAction" title:v12 systemImageName:@"xmark.circle"];
  v4 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationReportJunkCalendarAction" title:v11 systemImageName:@"bin.xmark"];
  v16[0] = v2;
  v16[1] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v6 = +[CALNNotificationCategory categoryWithIdentifier:@"CALNSharedCalendarInvitationDefaultCategory" actions:v5 hiddenPreviewsBodyPlaceholder:v1 options:0];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  v8 = +[CALNNotificationCategory categoryWithIdentifier:@"CALNSharedCalendarInvitationCouldBeJunkCategory" actions:v7 hiddenPreviewsBodyPlaceholder:v1 options:0];
  v14[0] = v8;
  v14[1] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v10 = (void *)categories_categories_1;
  categories_categories_1 = v9;
}

- (void)refreshNotifications:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNSharedCalendarInvitationNotificationSource *)self dataSource];
  v23 = v4;
  v6 = [v5 fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:v4];

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
        id v13 = [(CALNSharedCalendarInvitationNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v11];
        if (v13)
        {
          id v14 = [CALNNotificationRecord alloc];
          v15 = [(CALNSharedCalendarInvitationNotificationSource *)self sourceIdentifier];
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
      v20 = "Refreshed shared calendar invitation notifications in response to database change. Found %{public}@ notifica"
            "tions for changed objects.";
LABEL_15:
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    }
  }
  else if (v18)
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    *(_DWORD *)buf = 138543362;
    v31 = v19;
    v20 = "Refreshed shared calendar invitation notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  v21 = [(CALNSharedCalendarInvitationNotificationSource *)self notificationManager];
  v22 = [(CALNSharedCalendarInvitationNotificationSource *)self sourceIdentifier];
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:v21 withNotificationRecords:v25 forSourceWithIdentifier:v22 filteredBySourceClientIDs:v23];
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CALNSharedCalendarInvitationNotificationSource *)self dataSource];
  v6 = [v5 fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [(CALNSharedCalendarInvitationNotificationSource *)self contentForNotificationWithInfo:v6];
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
  v42[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CALNBundle bundle];
  v5 = [v3 calendarNotification];
  v37 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.invitations"];
  int v6 = [v5 couldBeJunk];
  uint64_t v7 = @"CALNSharedCalendarInvitationDefaultCategory";
  if (v6) {
    uint64_t v7 = @"CALNSharedCalendarInvitationCouldBeJunkCategory";
  }
  uint64_t v8 = v7;
  uint64_t v9 = objc_opt_new();
  v10 = [v5 title];
  if (!v10)
  {
    v10 = [v4 localizedStringForKey:@"Shared Calendar Invitation" value:&stru_26D3B3198 table:0];
  }
  uint64_t v11 = [v4 localizedStringForKey:@"Invitation to share a calendar with %@." value:&stru_26D3B3198 table:0];
  v34 = (void *)v11;
  v35 = v4;
  if ([v5 couldBeJunk])
  {
    id v12 = [v4 localizedStringForKey:@"Unknown Sender" value:&stru_26D3B3198 table:0];
    id v13 = +[CALNNotificationSourceUtils displayNameForJunkIdentity:v5];
    id v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, v13);
    v15 = [NSString localizedStringWithFormat:@"%@\n%@", v12, v14];

    id v16 = 0;
  }
  else
  {
    v17 = CUIKDisplayStringForNotificationIdentity();
    id v16 = 0;
    v15 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, v17);
  }
  [v9 setTitle:v10];
  [v9 setBody:v15];
  [v9 setCategoryIdentifier:v8];

  [v9 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.invitations"];
  BOOL v18 = CUIKLaunchURLForInbox();
  [v9 setDefaultActionURL:v18];

  [v9 setSound:v37];
  v19 = [(CALNSharedCalendarInvitationNotificationSource *)self iconIdentifierProvider];
  v20 = [MEMORY[0x263EFF910] date];
  v21 = [MEMORY[0x263EFF8F0] currentCalendar];
  v22 = [v19 identifierForIconWithDate:v20 inCalendar:v21];
  [v9 setIconIdentifier:v22];

  [v9 setInterruptionLevel:1];
  v23 = [v5 calendar];
  v24 = [v23 calendarIdentifier];
  [v9 setFilterCriteria:v24];

  if ([v3 isDelegate])
  {
    v25 = [v3 sourceTitle];
    long long v26 = [v3 sourceIdentifier];
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:v9 forDelegateSourceWithTitle:v25 identifier:v26];
  }
  if (v16)
  {
    v42[0] = v16;
    long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
    [v9 setPeopleIdentifiers:v27];
  }
  long long v28 = [(CALNSharedCalendarInvitationNotificationSource *)self sourceEventRepresentationProvider];
  long long v29 = [v28 eventRepresentationDictionaryForSharedCalendarInvitationNotificationWithTitle:v10 message:v15];

  if (v29) {
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:v29 onNotificationContent:v9];
  }
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:v5 onNotificationContent:v9];
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:v5 onNotificationContent:v9];
  v30 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v3 sourceClientIdentifier];
    *(_DWORD *)buf = 138543618;
    v39 = v31;
    __int16 v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_2216BB000, v30, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
  }
  v32 = (void *)[v9 copy];

  return v32;
}

- (void)didReceiveResponse:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 actionIdentifier];
  int v6 = [v4 notificationRecord];

  uint64_t v7 = [v6 sourceClientIdentifier];

  uint64_t v8 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for shared calendar invitation %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (([v5 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    uint64_t v9 = [(CALNSharedCalendarInvitationNotificationSource *)self dataSource];
    [v9 clearSharedCalendarInvitationWithSourceClientIdentifier:v7];
  }
  else if ([v5 isEqualToString:@"CALNSharedCalendarInvitationJoinActionIdentifier"])
  {
    uint64_t v9 = [(CALNSharedCalendarInvitationNotificationSource *)self dataSource];
    [v9 joinSharedCalendarWithSourceClientIdentifier:v7];
  }
  else if ([v5 isEqualToString:@"CALNNotificationDeclineAction"])
  {
    uint64_t v9 = [(CALNSharedCalendarInvitationNotificationSource *)self dataSource];
    [v9 declineSharedCalendarWithSourceClientIdentifier:v7];
  }
  else
  {
    if (![v5 isEqualToString:@"CALNNotificationReportJunkCalendarAction"]) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CALNSharedCalendarInvitationNotificationSource *)self dataSource];
    [v9 reportSharedCalendarAsJunkWithSourceClientIdentifier:v7];
  }

LABEL_7:
}

- (CALNSharedCalendarInvitationNotificationDataSource)dataSource
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

+ (id)joinActionIdentifier
{
  return @"CALNSharedCalendarInvitationJoinActionIdentifier";
}

+ (id)declineActionIdentifier
{
  return @"CALNNotificationDeclineAction";
}

+ (id)reportJunkActionIdentifier
{
  return @"CALNNotificationReportJunkCalendarAction";
}

+ (id)categoryIdentifierWithoutReportJunk
{
  return @"CALNSharedCalendarInvitationDefaultCategory";
}

+ (id)categoryIdentifierWithReportJunk
{
  return @"CALNSharedCalendarInvitationCouldBeJunkCategory";
}

@end