@interface CALNEventInvitationNotificationSource
+ (id)acceptActionIdentifier;
+ (id)couldBeJunkCategoryIdentifier;
+ (id)declineActionIdentifier;
+ (id)defaultCategoryIdentifier;
+ (id)maybeActionIdentifier;
+ (id)reportJunkActionIdentifier;
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNEventInvitationNotificationDataSource)dataSource;
- (CALNEventInvitationNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6;
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

@implementation CALNEventInvitationNotificationSource

- (CALNEventInvitationNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5 dateProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNEventInvitationNotificationSource;
  v15 = [(CALNEventInvitationNotificationSource *)&v18 init];
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
  return (NSString *)@"com.apple.calendar.notifications.EventInvitation";
}

- (NSArray)categories
{
  if (categories_onceToken_0 != -1) {
    dispatch_once(&categories_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)categories_categories_0;
  return (NSArray *)v2;
}

void __51__CALNEventInvitationNotificationSource_categories__block_invoke()
{
  v18[3] = *MEMORY[0x263EF8340];
  v0 = +[CALNBundle bundle];
  v1 = [v0 localizedStringForKey:@"notification.hiddenPreviewsBodyPlaceholder.event.invitation" value:@"Invitation" table:0];
  v15 = [v0 localizedStringForKey:@"EventInvitationNotificationAcceptButton" value:@"Accept" table:0];
  id v14 = [v0 localizedStringForKey:@"EventInvitationNotificationDeclineButton" value:@"Decline" table:0];
  id v13 = [v0 localizedStringForKey:@"EventInvitationNotificationMaybeButton" value:@"Maybe" table:0];
  id v12 = [v0 localizedStringForKey:@"EventInvitationNotificationReportJunkButton" value:@"Report Junk" table:0];
  v2 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationAcceptAction" title:v15 systemImageName:@"checkmark.circle"];
  v3 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationDeclineAction" title:v14 systemImageName:@"xmark.circle"];
  v4 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationMaybeAction" title:v13 systemImageName:@"questionmark.circle"];
  v5 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationReportJunkEventAction" title:v12 systemImageName:@"bin.xmark"];
  v18[0] = v2;
  v18[1] = v3;
  v18[2] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v17[0] = v5;
  v17[1] = v2;
  v17[2] = v3;
  v17[3] = v4;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  v8 = +[CALNNotificationCategory categoryWithIdentifier:@"EventInvitation.CanRespond" actions:v6 hiddenPreviewsBodyPlaceholder:v1 options:0];
  v9 = +[CALNNotificationCategory categoryWithIdentifier:@"EventInvitation.CouldBeJunk" actions:v7 hiddenPreviewsBodyPlaceholder:v1 options:0];
  v16[0] = v8;
  v16[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  id v11 = (void *)categories_categories_0;
  categories_categories_0 = v10;
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CALNEventInvitationNotificationSource *)self dataSource];
  v6 = [v5 fetchEventInvitationNotificationWithSourceClientIdentifier:v4];

  if (v6)
  {
    v7 = [(CALNEventInvitationNotificationSource *)self contentForNotificationWithInfo:v6];
  }
  else
  {
    v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNEventInvitationNotificationSource contentForNotificationWithSourceClientIdentifier:]((uint64_t)v4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)contentForNotificationWithInfo:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 eventInvitationNotification];
  v6 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 sourceClientIdentifier];
    v8 = [v5 invitedBy];
    v9 = [v5 startDate];
    uint64_t v10 = [v5 location];
    *(_DWORD *)buf = 138544642;
    v47 = v7;
    __int16 v48 = 2112;
    v49 = v8;
    __int16 v50 = 2112;
    v51 = v9;
    __int16 v52 = 2112;
    v53 = v10;
    __int16 v54 = 1024;
    int v55 = [v5 type];
    __int16 v56 = 2112;
    v57 = v5;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_INFO, "Fetching event invitation notification content with sourceClientIdentifier %{public}@. InvitedBy: %@. StartDate: %@. Location: %@. EKCalendarNotificationType: %d. EventInvitationNotification: %@", buf, 0x3Au);
  }
  id v11 = +[CALNBundle bundle];
  uint64_t v12 = [v5 title];
  if (!v12)
  {
    uint64_t v12 = [v11 localizedStringForKey:@"EventInvitationNotificationDefaultTitle" value:@"Invitation" table:0];
  }
  v40 = v11;
  v41 = (void *)v12;
  id v42 = 0;
  id v13 = [(CALNEventInvitationNotificationSource *)self _notificationBodyForNotificationInfo:v4 contactIdentifier:&v42];
  id v39 = v42;
  if ([v5 couldBeJunk]) {
    id v14 = @"EventInvitation.CouldBeJunk";
  }
  else {
    id v14 = @"EventInvitation.CanRespond";
  }
  v15 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.invitations"];
  v16 = [(CALNEventInvitationNotificationSource *)self iconIdentifierProvider];
  v17 = [v5 startDate];
  objc_super v18 = [MEMORY[0x263EFF8F0] currentCalendar];
  v19 = [v16 identifierForIconWithDate:v17 inCalendar:v18];

  v20 = v41;
  v21 = objc_opt_new();
  [v21 setTitle:v41];
  [v21 setBody:v13];
  [v21 setCategoryIdentifier:v14];
  [v21 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.invitations"];
  v22 = [v5 startDate];
  [v21 setDate:v22];

  v23 = [v4 expirationDate];
  [v21 setExpirationDate:v23];

  v24 = [v4 launchURL];
  [v21 setDefaultActionURL:v24];

  [v21 setIconIdentifier:v19];
  objc_msgSend(v21, "setShouldHideTime:", objc_msgSend(v5, "isAllDay"));
  [v21 setSound:v15];
  if (objc_msgSend(v5, "cuik_isTimeSensitive")) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 1;
  }
  [v21 setInterruptionLevel:v25];
  v26 = [v5 calendar];
  v27 = [v26 calendarIdentifier];
  [v21 setFilterCriteria:v27];

  if ([v4 isDelegate])
  {
    v28 = [v4 sourceTitle];
    v29 = [v4 sourceIdentifier];
    +[CALNNotificationSourceUtils updateSubtitleAndThreadIdentifierOnNotificationContent:v21 forDelegateSourceWithTitle:v28 identifier:v29];

    v20 = v41;
  }
  if (v39)
  {
    id v45 = v39;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
    [v21 setPeopleIdentifiers:v30];
  }
  v31 = [v4 eventURI];
  v43 = @"entityID";
  v44 = v31;
  v32 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  [v21 setUserInfo:v32];

  v33 = [v4 eventRepresentationDictionary];

  if (v33)
  {
    v34 = [v4 eventRepresentationDictionary];
    +[CALNEventRepresentationSourceUtils setEventRepresentationDictionary:v34 onNotificationContent:v21];
  }
  +[CALNNotificationFilterUtils setFilterIdentifierForEKCalendarNotification:v5 onNotificationContent:v21];
  +[CALNLegacyIdentifierUtils setLegacyIdentifierForCalendarNotification:v5 onNotificationContent:v21];
  v35 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = [v4 sourceClientIdentifier];
    *(_DWORD *)buf = 138543618;
    v47 = v36;
    __int16 v48 = 2112;
    v49 = v21;
    _os_log_impl(&dword_2216BB000, v35, OS_LOG_TYPE_DEFAULT, "Fetched event invitation notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
  }
  v37 = (void *)[v21 copy];

  return v37;
}

- (void)refreshNotifications:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNEventInvitationNotificationSource *)self dataSource];
  v23 = v4;
  v6 = [v5 fetchEventInvitationNotificationSourceClientIdentifiers:v4];

  uint64_t v25 = objc_opt_new();
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
        uint64_t v12 = (void *)MEMORY[0x223C88D10]();
        id v13 = [(CALNEventInvitationNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v11];
        if (v13)
        {
          id v14 = [CALNNotificationRecord alloc];
          v15 = [(CALNEventInvitationNotificationSource *)self sourceIdentifier];
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
      v20 = "Refreshed event invitation notifications in response to database change. Found %{public}@ notifications for "
            "changed objects.";
LABEL_15:
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    }
  }
  else if (v18)
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    *(_DWORD *)buf = 138543362;
    v31 = v19;
    v20 = "Refreshed event invitation notifications. Found %{public}@ notifications.";
    goto LABEL_15;
  }

  v21 = [(CALNEventInvitationNotificationSource *)self notificationManager];
  v22 = [(CALNEventInvitationNotificationSource *)self sourceIdentifier];
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:v21 withNotificationRecords:v25 forSourceWithIdentifier:v22 filteredBySourceClientIDs:v23];
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
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Received notification response for event invitation %{public}@ with actionIdentifier = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (([v5 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    uint64_t v9 = [(CALNEventInvitationNotificationSource *)self dataSource];
    [v9 clearEventInvitationWithSourceClientIdentifier:v7];
  }
  else if ([v5 isEqualToString:@"CALNNotificationAcceptAction"])
  {
    uint64_t v9 = [(CALNEventInvitationNotificationSource *)self dataSource];
    [v9 acceptEventInvitationWithSourceClientIdentifier:v7];
  }
  else if ([v5 isEqualToString:@"CALNNotificationDeclineAction"])
  {
    uint64_t v9 = [(CALNEventInvitationNotificationSource *)self dataSource];
    [v9 declineEventInvitationWithSourceClientIdentifier:v7];
  }
  else if ([v5 isEqualToString:@"CALNNotificationMaybeAction"])
  {
    uint64_t v9 = [(CALNEventInvitationNotificationSource *)self dataSource];
    [v9 tentativeAcceptEventInvitationWithSourceClientIdentifier:v7];
  }
  else
  {
    if (![v5 isEqualToString:@"CALNNotificationReportJunkEventAction"]) {
      goto LABEL_7;
    }
    uint64_t v9 = [(CALNEventInvitationNotificationSource *)self dataSource];
    [v9 reportEventInvitationAsJunkWithSourceClientIdentifier:v7];
  }

LABEL_7:
}

- (id)_notificationBodyForNotificationInfo:(id)a3 contactIdentifier:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  *a4 = 0;
  id v38 = v6;
  uint64_t v7 = [v6 eventInvitationNotification];
  uint64_t v8 = [v7 type];
  uint64_t v9 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110656;
    BOOL v40 = v8 == 1;
    __int16 v41 = 1024;
    int v42 = [v7 timeChanged];
    __int16 v43 = 1024;
    int v44 = [v7 dateChanged];
    __int16 v45 = 1024;
    int v46 = [v7 titleChanged];
    __int16 v47 = 1024;
    int v48 = [v7 locationChanged];
    __int16 v49 = 1024;
    int v50 = [v7 videoConferenceChanged];
    __int16 v51 = 1024;
    int v52 = [v7 recurrenceChanged];
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_INFO, "Generating Notification Body For Notification Info. isModification: %d. timeChanged: %d, dateChanged: %d, titleChanged: %d, locationChanged: %d, videoConferenceChanged: %d, recurrenceChanged: %d", buf, 0x2Cu);
  }

  int v10 = [v7 startDateForNextOccurrence];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = [v7 startDate];
  }
  uint64_t v12 = [v7 isAllDay];
  id v13 = [(CALNEventInvitationNotificationSource *)self dateProvider];
  uint64_t v14 = +[CALNDateStringUtils dateTimeStringForEventDate:v11 alwaysIncludeDate:1 allDayEvent:v12 dateProvider:v13];

  if (!v10) {
  v15 = +[CALNBundle bundle];
  }
  v16 = [MEMORY[0x263EFF980] array];
  if (v8 == 1)
  {
    if ([v7 timeChanged])
    {
      v17 = @"Time changed to %@";
LABEL_14:
      v20 = [v15 localizedStringForKey:v17 value:&stru_26D3B3198 table:0];
      v21 = objc_msgSend(NSString, "localizedStringWithFormat:", v20, v14);
      [v16 addObject:v21];
LABEL_15:

LABEL_16:
      BOOL v18 = 0;
LABEL_17:
      v22 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if ([v7 dateChanged])
    {
      v17 = @"Date changed to %@";
      goto LABEL_14;
    }
    if ([v7 titleChanged])
    {
      v20 = [v7 title];
      v21 = [v15 localizedStringForKey:@"Title changed to %@" value:&stru_26D3B3198 table:0];
      v31 = objc_msgSend(NSString, "localizedStringWithFormat:", v21, v20);
      [v16 addObject:v31];

      goto LABEL_15;
    }
    if (![v7 locationChanged])
    {
      if ([v7 videoConferenceChanged])
      {
        v35 = @"Video Call updated";
      }
      else if ([v7 recurrenceChanged])
      {
        v35 = @"Repeat frequency or end date changed";
      }
      else
      {
        v37 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[CALNEventInvitationNotificationSource _notificationBodyForNotificationInfo:contactIdentifier:](v37);
        }

        v35 = @"Invitation updated";
      }
      v20 = [v15 localizedStringForKey:v35 value:&stru_26D3B3198 table:0];
      [v16 addObject:v20];
      goto LABEL_16;
    }
    v20 = [v7 location];
    uint64_t v32 = [v20 length];
    int v33 = [v7 videoConferenceChanged];
    if (v32)
    {
      if (!v33)
      {
        v36 = [v15 localizedStringForKey:@"Location changed to %@" value:&stru_26D3B3198 table:0];
        BOOL v18 = objc_msgSend(NSString, "localizedStringWithFormat:", v36, v20);

LABEL_51:
        [v16 addObject:v18];
        goto LABEL_17;
      }
      v34 = @"Location changed and Video Call updated";
    }
    else if (v33)
    {
      v34 = @"Location removed and Video Call updated";
    }
    else
    {
      v34 = @"Location removed";
    }
    BOOL v18 = [v15 localizedStringForKey:v34 value:&stru_26D3B3198 table:0];
    goto LABEL_51;
  }
  BOOL v18 = [v7 location];
  v19 = [v15 localizedStringForKey:@"Invitation From %@" value:&stru_26D3B3198 table:0];
  if ([v7 couldBeJunk]) {
    +[CALNNotificationSourceUtils displayNameForJunkIdentity:v7];
  }
  else {
  v23 = CUIKDisplayStringForNotificationIdentity();
  }
  v22 = objc_msgSend(NSString, "localizedStringWithFormat:", v19, v23);
  [v16 addObject:v22];
  [v16 addObject:v14];
  if ([v18 length]) {
    [v16 addObject:v18];
  }

  if (v22 && [v7 couldBeJunk])
  {
    v20 = [v15 localizedStringForKey:@"Unknown Sender" value:&stru_26D3B3198 table:0];
    [v16 insertObject:v20 atIndex:0];
    goto LABEL_24;
  }
LABEL_25:
  v24 = [v38 conflictDetails];
  if (v24)
  {
    uint64_t v25 = [MEMORY[0x263F304F8] sharedGenerator];
    long long v26 = [v25 conflictStringForConflictDetails:v24 maxTitleLength:20];

    if ([v26 length]) {
      [v16 addObject:v26];
    }
  }
  long long v27 = [v16 componentsJoinedByString:@"\n"];
  long long v28 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  long long v29 = [v27 stringByTrimmingCharactersInSet:v28];

  return v29;
}

- (CALNEventInvitationNotificationDataSource)dataSource
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

+ (id)defaultCategoryIdentifier
{
  return @"EventInvitation.CanRespond";
}

+ (id)couldBeJunkCategoryIdentifier
{
  return @"EventInvitation.CouldBeJunk";
}

+ (id)acceptActionIdentifier
{
  return @"CALNNotificationAcceptAction";
}

+ (id)maybeActionIdentifier
{
  return @"CALNNotificationMaybeAction";
}

+ (id)declineActionIdentifier
{
  return @"CALNNotificationDeclineAction";
}

+ (id)reportJunkActionIdentifier
{
  return @"CALNNotificationReportJunkEventAction";
}

- (void)contentForNotificationWithSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Failed to get notification info for sourceClientIdentifier (%{public}@)", (uint8_t *)&v2, 0xCu);
}

- (void)_notificationBodyForNotificationInfo:(os_log_t)log contactIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Error: _notificationBodyForNotificationInfo could not generate a body for notification because the modification type could not be determined.", v1, 2u);
}

@end