@interface CALNSuggestedEventNotificationSource
+ (id)_bundle;
+ (id)coalescedSuggestedEventCategoryIdentifier;
+ (id)confirmActionIdentifier;
+ (id)defaultSuggestedEventCategoryIdentifier;
+ (id)deleteActionIdentifier;
+ (id)ignoreActionIdentifier;
+ (id)suggestedEventCanceledCategoryIdentifier;
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNNotificationManager)notificationManager;
- (CALNSuggestedEventNotificationDataSource)dataSource;
- (CALNSuggestedEventNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5;
- (NSArray)categories;
- (NSString)sourceIdentifier;
- (id)_sourceClientIdentifiersForObjectIDs:(id)a3;
- (id)contentForNotificationWithSourceClientIdentifier:(id)a3;
- (void)didReceiveResponse:(id)a3;
- (void)refreshNotifications:(id)a3;
@end

@implementation CALNSuggestedEventNotificationSource

- (CALNSuggestedEventNotificationSource)initWithDataSource:(id)a3 notificationManager:(id)a4 iconIdentifierProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CALNSuggestedEventNotificationSource;
  v12 = [(CALNSuggestedEventNotificationSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeWeak((id *)&v13->_notificationManager, v10);
    objc_storeStrong((id *)&v13->_iconIdentifierProvider, a5);
  }

  return v13;
}

- (NSString)sourceIdentifier
{
  return (NSString *)@"com.apple.calendar.notifications.SuggestedEvent";
}

- (NSArray)categories
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CALNSuggestedEventNotificationSource_categories__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  if (categories_onceToken_3 != -1) {
    dispatch_once(&categories_onceToken_3, block);
  }
  return (NSArray *)(id)categories_categories_3;
}

void __50__CALNSuggestedEventNotificationSource_categories__block_invoke()
{
  v19[2] = *MEMORY[0x263EF8340];
  v0 = [(id)objc_opt_class() _bundle];
  v16 = [v0 localizedStringForKey:@"Add to calendar button for a suggested event" value:@"Add to Calendar" table:0];

  v1 = [(id)objc_opt_class() _bundle];
  objc_super v15 = [v1 localizedStringForKey:@"Ignore button for a suggested event" value:@"Ignore" table:0];

  v2 = [(id)objc_opt_class() _bundle];
  v14 = [v2 localizedStringForKey:@"Delete button for a canceled suggested event" value:@"Delete" table:0];

  v3 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationConfirmAction" title:v16 systemImageName:@"checkmark.circle"];
  v4 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationIgnoreAction" title:v15 systemImageName:@"xmark.circle"];
  v5 = +[CALNNotificationAction actionWithIdentifier:@"CALNNotificationDeleteAction" title:v14 systemImageName:@"trash"];
  v19[0] = v3;
  v19[1] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v7 = [MEMORY[0x263F30520] brandedOriginDescriptionStringWithAppName:0];
  v8 = +[CALNNotificationCategory categoryWithIdentifier:@"SuggestedEvent.Default" actions:v6 hiddenPreviewsBodyPlaceholder:v7 options:0];
  id v9 = +[CALNNotificationCategory categoryWithIdentifier:@"SuggestedEvent.Coalesced" actions:MEMORY[0x263EFFA68] hiddenPreviewsBodyPlaceholder:v7 options:0];
  v18 = v5;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  id v11 = +[CALNNotificationCategory categoryWithIdentifier:@"SuggestedEvent.Canceled" actions:v10 hiddenPreviewsBodyPlaceholder:v7 options:0];

  v17[0] = v8;
  v17[1] = v9;
  v17[2] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v13 = (void *)categories_categories_3;
  categories_categories_3 = v12;
}

+ (id)_bundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CALNSuggestedEventNotificationSource__bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundle_onceToken != -1) {
    dispatch_once(&_bundle_onceToken, block);
  }
  v2 = (void *)_bundle_bundle;
  return v2;
}

uint64_t __47__CALNSuggestedEventNotificationSource__bundle__block_invoke()
{
  _bundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CALNSuggestedEventNotificationSource *)self dataSource];
  v6 = [v5 fetchSuggestedEventNotificationsWithSourceClientIdentifier:v4];

  if ([v6 count])
  {
    id v44 = v4;
    if ((unint64_t)[v6 count] < 2)
    {
      if ([v6 count] == 1)
      {
        v25 = [v6 objectAtIndexedSubscript:0];
        v26 = [v25 suggestionNotification];
        v20 = [v26 title];
        v27 = [v26 allDescriptionStringsWithOptions:1];
        v49 = [v27 componentsJoinedByString:@"\n"];

        v48 = [v25 launchURL];
        uint64_t v28 = [v26 type];
        v29 = 0;
        if ((unint64_t)(v28 - 12) <= 2) {
          v29 = off_2645C10C8[v28 - 12];
        }
        v43 = v29;
        v23 = [v26 startDate];
        v46 = [v25 expirationDate];
        v47 = [v26 originAppName];
        v30 = [v26 calendar];
        v45 = [v30 calendarIdentifier];
      }
      else
      {
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v48 = 0;
        v43 = 0;
        v23 = 0;
        v49 = 0;
        v20 = 0;
      }
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v51 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            objc_super v15 = [v14 suggestionNotification];
            [v7 addObject:v15];
            v16 = [v14 expirationDate];
            [v8 addObject:v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v11);
      }

      [v8 sortUsingSelector:sel_compare_];
      v17 = (void *)MEMORY[0x263F30520];
      v18 = (void *)[v7 copy];
      v19 = [v17 coalescedInfoForSuggestionNotifications:v18];

      v20 = [v19 title];
      v49 = [v19 descriptionText];
      v48 = CUIKLaunchURLForInbox();
      v21 = [v7 objectAtIndexedSubscript:0];
      v47 = [v21 originAppName];
      v22 = [v21 calendar];
      v45 = [v22 calendarIdentifier];

      v46 = [v8 lastObject];

      v23 = 0;
      v43 = @"SuggestedEvent.Coalesced";
    }
    v31 = +[CALNNotificationSound soundWithAlertType:10 alertTopic:@"com.apple.mobilecal.bulletin-subsection.suggestions"];
    id v32 = v23;
    v33 = v32;
    if (!v32)
    {
      v33 = [MEMORY[0x263EFF910] date];
    }
    v34 = [(CALNSuggestedEventNotificationSource *)self iconIdentifierProvider];
    v35 = [MEMORY[0x263EFF8F0] currentCalendar];
    v36 = [v34 identifierForIconWithDate:v33 inCalendar:v35];

    v37 = NSString;
    v38 = [(CALNSuggestedEventNotificationSource *)self sourceIdentifier];
    v39 = [v37 stringWithFormat:@"%@.%@", v38, v47];

    v40 = objc_opt_new();
    [v40 setTitle:v20];
    [v40 setBody:v49];
    [v40 setCategoryIdentifier:v43];
    [v40 setSectionIdentifier:@"com.apple.mobilecal.bulletin-subsection.suggestions"];
    [v40 setDate:v32];
    [v40 setExpirationDate:v46];
    [v40 setDefaultActionURL:v48];
    [v40 setIconIdentifier:v36];
    [v40 setSound:v31];
    [v40 setThreadIdentifier:v39];
    [v40 setInterruptionLevel:1];
    [v40 setFilterCriteria:v45];
    v41 = +[CALNLogSubsystem calendar];
    id v4 = v44;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v55 = v44;
      __int16 v56 = 2112;
      v57 = v40;
      _os_log_impl(&dword_2216BB000, v41, OS_LOG_TYPE_DEFAULT, "Fetched suggested event notification with sourceClientIdentifier %{public}@. Content: %@", buf, 0x16u);
    }

    v24 = (void *)[v40 copy];
  }
  else
  {
    v20 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CALNSuggestedEventNotificationSource contentForNotificationWithSourceClientIdentifier:]((uint64_t)v4, v20);
    }
    v24 = 0;
  }

  return v24;
}

- (void)refreshNotifications:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v4 = [(CALNSuggestedEventNotificationSource *)self dataSource];
  uint64_t v5 = [v4 fetchSuggestedEventNotificationObjectIDs];

  v27 = objc_opt_new();
  v24 = (void *)v5;
  [(CALNSuggestedEventNotificationSource *)self _sourceClientIdentifiersForObjectIDs:v5];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x223C88D10]();
        uint64_t v12 = [(CALNSuggestedEventNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v10];
        if (v12)
        {
          v13 = [CALNNotificationRecord alloc];
          v14 = [(CALNSuggestedEventNotificationSource *)self sourceIdentifier];
          objc_super v15 = [(CALNNotificationRecord *)v13 initWithSourceIdentifier:v14 sourceClientIdentifier:v10 content:v12];

          [v27 addObject:v15];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  v16 = +[CALNLogSubsystem calendar];
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (!v17) {
      goto LABEL_16;
    }
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    *(_DWORD *)buf = 138543362;
    v33 = v18;
    v19 = "Refreshed suggested event notifications in response to database change. Found %{public}@ notifications for changed objects.";
  }
  else
  {
    if (!v17) {
      goto LABEL_16;
    }
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    *(_DWORD *)buf = 138543362;
    v33 = v18;
    v19 = "Refreshed suggested event notifications. Found %{public}@ notifications.";
  }
  _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

LABEL_16:
  v20 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    *(_DWORD *)buf = 138543362;
    v33 = v21;
    _os_log_impl(&dword_2216BB000, v20, OS_LOG_TYPE_DEFAULT, "Refreshed suggested event notifications. Found %{public}@ notifications.", buf, 0xCu);
  }
  v22 = [(CALNSuggestedEventNotificationSource *)self notificationManager];
  v23 = [(CALNSuggestedEventNotificationSource *)self sourceIdentifier];
  +[CALNNotificationRecordsDiffApplier refreshNotificationManager:v22 withNotificationRecords:v27 forSourceWithIdentifier:v23 filteredBySourceClientIDs:0];
}

- (id)_sourceClientIdentifiersForObjectIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(CALNSuggestedEventNotificationSource *)self dataSource];
        v13 = [v12 fetchSuggestedEventNotificationWithObjectID:v11];

        if (v13)
        {
          v14 = [v13 sourceClientIdentifier];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  objc_super v15 = [v5 allObjects];

  return v15;
}

- (void)didReceiveResponse:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 notificationRecord];
  id v6 = [v5 content];
  uint64_t v7 = [v6 categoryIdentifier];

  uint64_t v8 = [v4 actionIdentifier];
  uint64_t v9 = [v4 notificationRecord];

  uint64_t v10 = [v9 sourceClientIdentifier];

  uint64_t v11 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "Received notification response for suggested event notification with source client identifier = %{public}@, actionIdentifier = %{public}@", (uint8_t *)&v13, 0x16u);
  }

  if (([v8 isEqualToString:@"com.apple.CALNNotificationDefaultActionIdentifier"] & 1) != 0
    || [v8 isEqualToString:@"com.apple.CALNNotificationDismissActionIdentifier"])
  {
    uint64_t v12 = [(CALNSuggestedEventNotificationSource *)self dataSource];
    [v12 clearSuggestedEventNotificationWithSourceClientIdentifier:v10];
LABEL_6:

    goto LABEL_7;
  }
  if ([v7 isEqualToString:@"SuggestedEvent.Default"])
  {
    if ([v8 isEqualToString:@"CALNNotificationConfirmAction"])
    {
      uint64_t v12 = [(CALNSuggestedEventNotificationSource *)self dataSource];
      [v12 confirmSuggestedEventWithSourceClientIdentifier:v10];
    }
    else
    {
      if (![v8 isEqualToString:@"CALNNotificationIgnoreAction"]) {
        goto LABEL_7;
      }
      uint64_t v12 = [(CALNSuggestedEventNotificationSource *)self dataSource];
      [v12 ignoreSuggestedEventWithSourceClientIdentifier:v10];
    }
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"SuggestedEvent.Canceled"]
    && [v8 isEqualToString:@"CALNNotificationDeleteAction"])
  {
    uint64_t v12 = [(CALNSuggestedEventNotificationSource *)self dataSource];
    [v12 deleteCanceledSuggestedEventWithSourceClientIdentifier:v10];
    goto LABEL_6;
  }
LABEL_7:
}

- (CALNSuggestedEventNotificationDataSource)dataSource
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_destroyWeak((id *)&self->_notificationManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

+ (id)defaultSuggestedEventCategoryIdentifier
{
  return @"SuggestedEvent.Default";
}

+ (id)coalescedSuggestedEventCategoryIdentifier
{
  return @"SuggestedEvent.Coalesced";
}

+ (id)suggestedEventCanceledCategoryIdentifier
{
  return @"SuggestedEvent.Canceled";
}

+ (id)confirmActionIdentifier
{
  return @"CALNNotificationConfirmAction";
}

+ (id)ignoreActionIdentifier
{
  return @"CALNNotificationIgnoreAction";
}

+ (id)deleteActionIdentifier
{
  return @"CALNNotificationDeleteAction";
}

- (void)contentForNotificationWithSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Failed to get notification infos for sourceClientIdentifier (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end