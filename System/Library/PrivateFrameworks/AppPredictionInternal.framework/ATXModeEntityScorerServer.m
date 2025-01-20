@interface ATXModeEntityScorerServer
+ (id)sharedInstance;
- (ATXModeEntityScorerServer)initWithContactStoreProvider:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)saveScoredEntitiesToDisk:(id)a3 mode:(id)a4 modeEntityTypeIdentifier:(id)a5 modeConfigurationType:(int64_t)a6;
- (id)dataFromFileHandle:(id)a3;
- (id)emptyModeEntityScore;
- (id)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5;
- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5;
- (id)rankedAppsForDenyListForMode:(unint64_t)a3;
- (id)rankedAppsForMode:(unint64_t)a3;
- (id)rankedContactsForDenyListForMode:(unint64_t)a3;
- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4;
- (id)rankedContactsForMode:(unint64_t)a3;
- (id)rankedContactsForMode:(unint64_t)a3 options:(unint64_t)a4;
- (id)rankedEntitiesForDenyListForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 options:(unint64_t)a5;
- (id)rankedEntitiesForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 options:(unint64_t)a6;
- (id)rankedEntitiesForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 options:(unint64_t)a5;
- (id)rankedNotificationsForMode:(unint64_t)a3;
- (id)rankedNotificationsForMode:(unint64_t)a3 options:(unint64_t)a4;
- (id)rankedWidgetsForMode:(unint64_t)a3;
- (id)scoredNotificationEntityForAppFromNotificationEntity:(id)a3 notificationScores:(id)a4;
- (id)scoredNotificationEntityForContactFromNotificationEntity:(id)a3 notificationScores:(id)a4;
- (void)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7 reply:(id)a8;
- (void)dealloc;
- (void)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 reply:(id)a6;
- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4;
- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreEntities:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5;
- (void)scoreEntities:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5 modeConfigurationType:(int64_t)a6;
- (void)scoreEntitiesForDenyList:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5;
- (void)scoreNotificationModeEntity:(id)a3 modeEntityScores:(id)a4;
- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
@end

@implementation ATXModeEntityScorerServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_23 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_23, &__block_literal_global_132);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_29;
  return v2;
}

void __43__ATXModeEntityScorerServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = [[ATXModeEntityScorerServer alloc] initWithContactStoreProvider:&__block_literal_global_13];
  v2 = (void *)sharedInstance__pasExprOnceResult_29;
  sharedInstance__pasExprOnceResult_29 = (uint64_t)v1;
}

id __43__ATXModeEntityScorerServer_sharedInstance__block_invoke_2()
{
  v0 = objc_opt_new();
  return v0;
}

- (ATXModeEntityScorerServer)initWithContactStoreProvider:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXModeEntityScorerServer;
  v5 = [(ATXModeEntityScorerServer *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.ModeEntityScorer"];
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v6;

    [(NSXPCListener *)v5->_listener setDelegate:v5];
    [(NSXPCListener *)v5->_listener resume];
    id v8 = objc_alloc(MEMORY[0x1E4F93B60]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__ATXModeEntityScorerServer_initWithContactStoreProvider___block_invoke;
    v12[3] = &unk_1E68B2A30;
    id v13 = v4;
    uint64_t v9 = [v8 initWithBlock:v12 idleTimeout:3600.0];
    lazyStableContactRepresentationDataStore = v5->_lazyStableContactRepresentationDataStore;
    v5->_lazyStableContactRepresentationDataStore = (_PASLazyPurgeableResult *)v9;
  }
  return v5;
}

ATXStableContactRepresentationDatastore *__58__ATXModeEntityScorerServer_initWithContactStoreProvider___block_invoke(uint64_t a1)
{
  v2 = [ATXStableContactRepresentationDatastore alloc];
  v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = [(ATXStableContactRepresentationDatastore *)v2 initWithContactStore:v3];

  return v4;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXModeEntityScorerServer;
  [(ATXModeEntityScorerServer *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v92[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 valueForEntitlement:@"com.apple.ModeEntityScorer"];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0 && ([v6 BOOLValue] & 1) != 0)
  {
    v71 = self;
    v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "ATXModeEntityScorerServer Established connection", buf, 2u);
    }

    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F285A930];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    v92[0] = objc_opt_class();
    v92[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
    v11 = [v9 setWithArray:v10];
    [v8 setClasses:v11 forSelector:sel_scoreContacts_mode_reply_ argumentIndex:0 ofReply:1];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
    objc_super v14 = [v12 setWithArray:v13];
    [v8 setClasses:v14 forSelector:sel_rankedContactsForMode_reply_ argumentIndex:0 ofReply:1];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    v17 = [v15 setWithArray:v16];
    [v8 setClasses:v17 forSelector:sel_scoreContacts_mode_reply_ argumentIndex:0 ofReply:0];

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
    v20 = [v18 setWithArray:v19];
    [v8 setClasses:v20 forSelector:sel_scoreApps_mode_reply_ argumentIndex:0 ofReply:1];

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v88[0] = objc_opt_class();
    v88[1] = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
    v23 = [v21 setWithArray:v22];
    [v8 setClasses:v23 forSelector:sel_rankedAppsForMode_reply_ argumentIndex:0 ofReply:1];

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v87[0] = objc_opt_class();
    v87[1] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
    v26 = [v24 setWithArray:v25];
    [v8 setClasses:v26 forSelector:sel_scoreApps_mode_reply_ argumentIndex:0 ofReply:0];

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v86[0] = objc_opt_class();
    v86[1] = objc_opt_class();
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
    v29 = [v27 setWithArray:v28];
    [v8 setClasses:v29 forSelector:sel_scoreAppsForDenyList_mode_reply_ argumentIndex:0 ofReply:1];

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v85[0] = objc_opt_class();
    v85[1] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
    v32 = [v30 setWithArray:v31];
    [v8 setClasses:v32 forSelector:sel_rankedAppsForDenyListForMode_reply_ argumentIndex:0 ofReply:1];

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    v84[0] = objc_opt_class();
    v84[1] = objc_opt_class();
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
    v35 = [v33 setWithArray:v34];
    [v8 setClasses:v35 forSelector:sel_scoreAppsForDenyList_mode_reply_ argumentIndex:0 ofReply:0];

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    v83[0] = objc_opt_class();
    v83[1] = objc_opt_class();
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    v38 = [v36 setWithArray:v37];
    [v8 setClasses:v38 forSelector:sel_scoreContactsForDenyList_mode_reply_ argumentIndex:0 ofReply:1];

    v39 = (void *)MEMORY[0x1E4F1CAD0];
    v82[0] = objc_opt_class();
    v82[1] = objc_opt_class();
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    v41 = [v39 setWithArray:v40];
    [v8 setClasses:v41 forSelector:sel_rankedContactsForDenyListForMode_reply_ argumentIndex:0 ofReply:1];

    v42 = (void *)MEMORY[0x1E4F1CAD0];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    v44 = [v42 setWithArray:v43];
    [v8 setClasses:v44 forSelector:sel_rankedContactsForDenyListForMode_options_reply_ argumentIndex:0 ofReply:1];

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
    v47 = [v45 setWithArray:v46];
    [v8 setClasses:v47 forSelector:sel_scoreContactsForDenyList_mode_reply_ argumentIndex:0 ofReply:0];

    v48 = (void *)MEMORY[0x1E4F1CAD0];
    v79[0] = objc_opt_class();
    v79[1] = objc_opt_class();
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
    v50 = [v48 setWithArray:v49];
    [v8 setClasses:v50 forSelector:sel_rankedWidgetsForMode_reply_ argumentIndex:0 ofReply:1];

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    v78[0] = objc_opt_class();
    v78[1] = objc_opt_class();
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
    v53 = [v51 setWithArray:v52];
    [v8 setClasses:v53 forSelector:sel_scoreNotifications_mode_reply_ argumentIndex:0 ofReply:1];

    v54 = (void *)MEMORY[0x1E4F1CAD0];
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    v56 = [v54 setWithArray:v55];
    [v8 setClasses:v56 forSelector:sel_scoreNotifications_mode_reply_ argumentIndex:0 ofReply:0];

    v57 = (void *)MEMORY[0x1E4F1CAD0];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
    v59 = [v57 setWithArray:v58];
    [v8 setClasses:v59 forSelector:sel_rankedNotificationsForMode_reply_ argumentIndex:0 ofReply:1];

    v60 = (void *)MEMORY[0x1E4F1CAD0];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
    v62 = [v60 setWithArray:v61];
    [v8 setClasses:v62 forSelector:sel_rankedAppsForNotificationsForMode_reply_ argumentIndex:0 ofReply:1];

    v63 = (void *)MEMORY[0x1E4F1CAD0];
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
    v65 = [v63 setWithArray:v64];
    [v8 setClasses:v65 forSelector:sel_rankedContactsForNotificationsForMode_reply_ argumentIndex:0 ofReply:1];

    v66 = (void *)MEMORY[0x1E4F1CAD0];
    v73[0] = objc_opt_class();
    v73[1] = objc_opt_class();
    v73[2] = objc_opt_class();
    v73[3] = objc_opt_class();
    BOOL v67 = 1;
    v73[4] = objc_opt_class();
    v73[5] = objc_opt_class();
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:6];
    v69 = [v66 setWithArray:v68];
    [v8 setClasses:v69 forSelector:sel_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply_ argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v8];
    [v5 setExportedObject:v71];
    [v5 setInterruptionHandler:&__block_literal_global_76_0];
    [v5 setInvalidationHandler:&__block_literal_global_79_0];
    [v5 resume];
  }
  else
  {
    id v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v8);
    }
    BOOL v67 = 0;
  }

  return v67;
}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_77()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_77_cold_1(v0);
  }
}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26 = (void (**)(id, id, void))a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      v10 = v6;
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v10);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v13 = [(_PASLazyPurgeableResult *)self->_lazyStableContactRepresentationDataStore result];
        objc_super v14 = [v12 cnContactId];
        v15 = [v12 rawIdentifier];
        v16 = [v13 stableContactRepresentationForCnContactId:v14 rawIdentifier:v15];
        v17 = [v16 stableContactIdentifier];
        [v12 setStableContactIdentifier:v17];
      }
      id v6 = v10;
      uint64_t v8 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }
  if (v26)
  {
    [(ATXModeEntityScorerServer *)self scoreEntities:v6 entityTypeIdentifier:*MEMORY[0x1E4F93680] mode:a4];
    v26[2](v26, v6, 0);
  }
  else
  {
    v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    v21 = NSStringFromSelector(a2);
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [v19 raise:v20, @"No reply handler provided for %@ in %@", v21, v23 format];
  }
}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  uint64_t v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    uint64_t v8 = [(ATXModeEntityScorerServer *)self rankedContactsForMode:a3];
    v7[2](v7, v8, 0);
  }
  else
  {
    uint64_t v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v12 = NSStringFromSelector(a2);
    id v13 = (objc_class *)objc_opt_class();
    objc_super v14 = NSStringFromClass(v13);
    [v10 raise:v11, @"No reply handler provided for %@ in %@", v12, v14 format];
  }
}

- (id)rankedContactsForMode:(unint64_t)a3
{
  return [(ATXModeEntityScorerServer *)self rankedContactsForMode:a3 options:0];
}

- (id)rankedContactsForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F93680] options:a4];
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(id, id, void))a5;
  if (v10)
  {
    [(ATXModeEntityScorerServer *)self scoreEntities:v9 entityTypeIdentifier:*MEMORY[0x1E4F93678] mode:a4];
    v10[2](v10, v9, 0);
  }
  else
  {
    uint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    objc_super v14 = NSStringFromSelector(a2);
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];
  }
}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  uint64_t v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    uint64_t v8 = [(ATXModeEntityScorerServer *)self rankedAppsForMode:a3];
    v7[2](v7, v8, 0);
  }
  else
  {
    id v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v12 = NSStringFromSelector(a2);
    uint64_t v13 = (objc_class *)objc_opt_class();
    objc_super v14 = NSStringFromClass(v13);
    [v10 raise:v11, @"No reply handler provided for %@ in %@", v12, v14 format];
  }
}

- (id)rankedAppsForMode:(unint64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  v10 = (void *)[v5 initWithArray:v9];
  uint64_t v11 = [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F93678] options:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__ATXModeEntityScorerServer_rankedAppsForMode___block_invoke;
  v15[3] = &unk_1E68B2A58;
  id v16 = v10;
  id v12 = v10;
  uint64_t v13 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", v15);

  return v13;
}

uint64_t __47__ATXModeEntityScorerServer_rankedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F4AF00];
  id v5 = [v3 bundleId];
  if ([v4 isInstalledAndNotRestrictedForBundle:v5])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 bundleId];
    uint64_t v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
  uint64_t v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    uint64_t v8 = [(ATXModeEntityScorerServer *)self rankedWidgetsForMode:a3];
    v7[2](v7, v8, 0);
  }
  else
  {
    id v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    id v12 = NSStringFromSelector(a2);
    uint64_t v13 = (objc_class *)objc_opt_class();
    objc_super v14 = NSStringFromClass(v13);
    [v10 raise:v11, @"No reply handler provided for %@ in %@", v12, v14 format];
  }
}

- (id)rankedWidgetsForMode:(unint64_t)a3
{
  id v3 = [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F936E8] options:0];
  id v4 = objc_msgSend(v3, "_pas_filteredArrayWithTest:", &__block_literal_global_88);

  return v4;
}

uint64_t __50__ATXModeEntityScorerServer_rankedWidgetsForMode___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 widget];
  id v3 = [v2 extensionIdentity];
  id v4 = [v3 containerBundleIdentifier];

  if (ATXBundleIdIsFakeContainerBundleId()) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [MEMORY[0x1E4F4AF00] isInstalledAndNotRestrictedForBundle:v4];
  }

  return v5;
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, id, void))a5;
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F936C8];
    uint64_t v11 = ATXModeToString();
    id v12 = [(ATXModeEntityScorerServer *)self modeEntityScoresFromCacheForModeEntityTypeIdentifier:v10 modeIdentifier:v11 modeConfigurationType:0];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          [(ATXModeEntityScorerServer *)self scoreNotificationModeEntity:*(void *)(*((void *)&v23 + 1) + 8 * i) modeEntityScores:v12];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    v9[2](v9, v13, 0);
  }
  else
  {
    v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    id v12 = NSStringFromSelector(a2);
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v19 raise:v20, @"No reply handler provided for %@ in %@", v12, v22 format];
  }
}

- (void)scoreNotificationModeEntity:(id)a3 modeEntityScores:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [v23 identifier];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = [v8 scoreMetadata];
LABEL_11:
    id v21 = (id)v9;
    [v23 setScoreMetadata:v9];
    goto LABEL_12;
  }
  uint64_t v10 = [v23 appEntity];

  uint64_t v11 = [v23 contactEntity];

  if (!v10 || !v11)
  {
    uint64_t v9 = [(ATXModeEntityScorerServer *)self emptyModeEntityScore];
    goto LABEL_11;
  }
  uint64_t v12 = [(ATXModeEntityScorerServer *)self scoredNotificationEntityForAppFromNotificationEntity:v23 notificationScores:v6];
  uint64_t v13 = [(ATXModeEntityScorerServer *)self scoredNotificationEntityForContactFromNotificationEntity:v23 notificationScores:v6];
  if (v12 | v13)
  {
    if (!v12) {
      goto LABEL_8;
    }
    uint64_t v14 = [(id)v12 scoreMetadata];
    [v14 score];
    double v16 = v15;
    v17 = [(id)v13 scoreMetadata];
    [v17 score];
    double v19 = v18;

    uint64_t v20 = (void *)v12;
    if (v16 < v19) {
LABEL_8:
    }
      uint64_t v20 = (void *)v13;
    id v21 = v20;
    v22 = [v21 scoreMetadata];
  }
  else
  {
    v22 = [(ATXModeEntityScorerServer *)self emptyModeEntityScore];
    id v21 = 0;
  }
  [v23 setScoreMetadata:v22];

LABEL_12:
}

- (id)emptyModeEntityScore
{
  id v2 = objc_alloc(MEMORY[0x1E4F4B170]);
  id v3 = objc_opt_new();
  id v4 = (void *)[v2 initWithScore:0 featureVector:v3 uuid:0.0];

  return v4;
}

- (id)scoredNotificationEntityForAppFromNotificationEntity:(id)a3 notificationScores:(id)a4
{
  id v5 = a4;
  id v6 = [a3 appEntity];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B1E0]) initWithAppEntity:v6];
  id v8 = [v7 identifier];
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];

  return v9;
}

- (id)scoredNotificationEntityForContactFromNotificationEntity:(id)a3 notificationScores:(id)a4
{
  id v5 = a4;
  id v6 = [a3 contactEntity];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B1E0]) initWithContactEntity:v6];
  id v8 = [v7 identifier];
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];

  return v9;
}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  uint64_t v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    id v8 = [(ATXModeEntityScorerServer *)self rankedNotificationsForMode:a3];
    v7[2](v7, v8, 0);
  }
  else
  {
    uint64_t v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    uint64_t v12 = NSStringFromSelector(a2);
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v10 raise:v11, @"No reply handler provided for %@ in %@", v12, v14 format];
  }
}

- (id)rankedNotificationsForMode:(unint64_t)a3
{
  return [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F936C8] options:0];
}

- (id)rankedNotificationsForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F936C8] options:a4];
}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  uint64_t v7 = (void (**)(id, id, void))a4;
  if (v7)
  {
    id v8 = [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F936C8] options:0];
    uint64_t v9 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_93);

    uint64_t v10 = objc_opt_new();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__ATXModeEntityScorerServer_rankedAppsForNotificationsForMode_reply___block_invoke_2;
    v16[3] = &unk_1E68B2AC0;
    id v17 = v10;
    id v11 = v10;
    [v9 enumerateObjectsUsingBlock:v16];
    v7[2](v7, v11, 0);
  }
  else
  {
    uint64_t v12 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = NSStringFromSelector(a2);
    double v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v13 raise:v14, @"No reply handler provided for %@ in %@", v9, v11 format];
  }
}

BOOL __69__ATXModeEntityScorerServer_rankedAppsForNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 contactEntity];

  return v2 == 0;
}

void __69__ATXModeEntityScorerServer_rankedAppsForNotificationsForMode_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 appEntity];
  id v4 = [v3 scoreMetadata];

  [v5 setScoreMetadata:v4];
  [*(id *)(a1 + 32) addObject:v5];
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  uint64_t v9 = (void (**)(id, id, void))a5;
  if (v9)
  {
    uint64_t v10 = [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F936C8] options:a4];
    id v11 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", &__block_literal_global_97);

    uint64_t v12 = objc_opt_new();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__ATXModeEntityScorerServer_rankedContactsForNotificationsForMode_options_reply___block_invoke_2;
    v18[3] = &unk_1E68B2AC0;
    id v19 = v12;
    id v13 = v12;
    [v11 enumerateObjectsUsingBlock:v18];
    v9[2](v9, v13, 0);
  }
  else
  {
    uint64_t v14 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    double v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    id v11 = NSStringFromSelector(a2);
    id v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v15 raise:v16, @"No reply handler provided for %@ in %@", v11, v13 format];
  }
}

BOOL __81__ATXModeEntityScorerServer_rankedContactsForNotificationsForMode_options_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 appEntity];

  return v2 == 0;
}

void __81__ATXModeEntityScorerServer_rankedContactsForNotificationsForMode_options_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 contactEntity];
  id v4 = [v3 scoreMetadata];

  [v5 setScoreMetadata:v4];
  [*(id *)(a1 + 32) addObject:v5];
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9 = a3;
  uint64_t v10 = (void (**)(id, id, void))a5;
  if (v10)
  {
    [(ATXModeEntityScorerServer *)self scoreEntitiesForDenyList:v9 entityTypeIdentifier:*MEMORY[0x1E4F93678] mode:a4];
    v10[2](v10, v9, 0);
  }
  else
  {
    id v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    uint64_t v14 = NSStringFromSelector(a2);
    double v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];
  }
}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  uint64_t v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    id v8 = [(ATXModeEntityScorerServer *)self rankedAppsForDenyListForMode:a3];
    v7[2](v7, v8, 0);
  }
  else
  {
    id v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    uint64_t v12 = NSStringFromSelector(a2);
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v10 raise:v11, @"No reply handler provided for %@ in %@", v12, v14 format];
  }
}

- (id)rankedAppsForDenyListForMode:(unint64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  uint64_t v10 = (void *)[v5 initWithArray:v9];
  uint64_t v11 = [(ATXModeEntityScorerServer *)self rankedEntitiesForDenyListForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F93678] options:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__ATXModeEntityScorerServer_rankedAppsForDenyListForMode___block_invoke;
  v15[3] = &unk_1E68B2A58;
  id v16 = v10;
  id v12 = v10;
  uint64_t v13 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", v15);

  return v13;
}

uint64_t __58__ATXModeEntityScorerServer_rankedAppsForDenyListForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F4AF00];
  id v5 = [v3 bundleId];
  if ([v4 isInstalledAndNotRestrictedForBundle:v5])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v3 bundleId];
    uint64_t v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v9 = a3;
  uint64_t v10 = (void (**)(id, id, void))a5;
  if (v10)
  {
    [(ATXModeEntityScorerServer *)self scoreEntitiesForDenyList:v9 entityTypeIdentifier:*MEMORY[0x1E4F93680] mode:a4];
    v10[2](v10, v9, 0);
  }
  else
  {
    uint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    uint64_t v14 = NSStringFromSelector(a2);
    double v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];
  }
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v9 = (void (**)(id, void *, void))a5;
  if (v9)
  {
    uint64_t v10 = [(ATXModeEntityScorerServer *)self rankedContactsForDenyListForMode:a3 options:a4];
    v9[2](v9, v10, 0);
  }
  else
  {
    uint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    uint64_t v14 = NSStringFromSelector(a2);
    double v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];
  }
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3
{
  return [(ATXModeEntityScorerServer *)self rankedContactsForDenyListForMode:a3 options:0];
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return [(ATXModeEntityScorerServer *)self rankedEntitiesForDenyListForMode:a3 entityTypeIdentifier:*MEMORY[0x1E4F93680] options:a4];
}

- (void)scoreEntities:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5 modeConfigurationType:(int64_t)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = ATXModeToString();
  id v12 = [(ATXModeEntityScorerServer *)self modeEntityScoresFromCacheForModeEntityTypeIdentifier:v10 modeIdentifier:v11 modeConfigurationType:a6];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v19 = [v18 identifier];
        uint64_t v20 = [v12 objectForKeyedSubscript:v19];

        if (v20)
        {
          id v21 = [v20 scoreMetadata];
        }
        else
        {
          id v22 = objc_alloc(MEMORY[0x1E4F4B170]);
          id v23 = objc_opt_new();
          id v21 = (void *)[v22 initWithScore:0 featureVector:v23 uuid:0.0];
        }
        [v18 setScoreMetadata:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
}

- (void)scoreEntities:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5
{
}

- (void)scoreEntitiesForDenyList:(id)a3 entityTypeIdentifier:(id)a4 mode:(unint64_t)a5
{
}

- (id)rankedEntitiesForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 options:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = ATXModeToString();
  v42 = self;
  uint64_t v11 = [(ATXModeEntityScorerServer *)self modeEntityScoresFromCacheForModeEntityTypeIdentifier:v9 modeIdentifier:v10 modeConfigurationType:a5];

  if ([v9 isEqualToString:*MEMORY[0x1E4F93680]])
  {
    if ((v6 & 1) == 0)
    {
      lazyStableContactRepresentationDataStore = self->_lazyStableContactRepresentationDataStore;
      id v13 = v11;
      uint64_t v14 = [(_PASLazyPurgeableResult *)lazyStableContactRepresentationDataStore result];
      uint64_t v11 = [v14 refreshCnContactIdsGivenContactEntities:v13];

      goto LABEL_22;
    }
    uint64_t v29 = __atxlog_handle_notification_management();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    long long v30 = "Skipping contact id refresh because option was specified for ranked contact entities.";
    goto LABEL_20;
  }
  if (![v9 isEqualToString:*MEMORY[0x1E4F936C8]]) {
    goto LABEL_22;
  }
  if (v6)
  {
    uint64_t v29 = __atxlog_handle_notification_management();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    long long v30 = "Skipping contact id refresh because option was specified for ranked notification entities.";
LABEL_20:
    _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_21;
  }
  id v40 = v9;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v39 = v11;
  id obj = [v39 allValues];
  uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v20 = [v19 contactEntity];

        if (v20)
        {
          id v21 = [(_PASLazyPurgeableResult *)v42->_lazyStableContactRepresentationDataStore result];
          id v22 = [v19 contactEntity];
          id v23 = [v22 identifier];
          v49 = v23;
          long long v24 = [v19 contactEntity];
          v50 = v24;
          long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          long long v26 = [v21 refreshCnContactIdsGivenContactEntities:v25];

          long long v27 = [v26 allValues];
          uint64_t v28 = [v27 firstObject];
          [v19 setContactEntity:v28];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v16);
  }

  uint64_t v11 = v39;
  id v9 = v40;
LABEL_22:
  long long v31 = [v11 allValues];
  v32 = (void *)[v31 mutableCopy];
  uint64_t v33 = v32;
  if (v32) {
    id v34 = v32;
  }
  else {
    id v34 = (id)objc_opt_new();
  }
  v35 = v34;

  v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"scoreMetadata.score" ascending:0];
  v48 = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  [v35 sortUsingDescriptors:v37];

  return v35;
}

- (id)rankedEntitiesForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 options:(unint64_t)a5
{
  return [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:a4 modeConfigurationType:0 options:a5];
}

- (id)rankedEntitiesForDenyListForMode:(unint64_t)a3 entityTypeIdentifier:(id)a4 options:(unint64_t)a5
{
  return [(ATXModeEntityScorerServer *)self rankedEntitiesForMode:a3 entityTypeIdentifier:a4 modeConfigurationType:1 options:a5];
}

- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F4B650];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 modeCachesRootDirectory];
  uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", v9, v8];

  id v12 = [v10 stringByAppendingPathComponent:v11];

  if (a5 == 1)
  {
    id v13 = [NSString alloc];
    uint64_t v14 = NSStringForATXModeConfigurationType();
    uint64_t v15 = [v13 initWithFormat:@"%@_%@", v12, v14];

    id v12 = (void *)v15;
  }
  return v12;
}

- (void)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 reply:(id)a6
{
  uint64_t v11 = (void (**)(id, void *, void))a6;
  if (v11)
  {
    id v12 = [(ATXModeEntityScorerServer *)self modeEntityScoresFromCacheForModeEntityTypeIdentifier:a3 modeIdentifier:a4 modeConfigurationType:a5];
    v11[2](v11, v12, 0);
  }
  else
  {
    id v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No reply handler provided for %@ in %@", v16, v18 format];
  }
}

- (id)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v11 = [(ATXModeEntityScorerServer *)self pathForModeEntityTypeIdentifier:v8 modeIdentifier:v9 modeConfigurationType:a5];
  id v40 = 0;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v11 options:1 error:&v40];
  id v13 = v40;
  uint64_t v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    long long v31 = v11;
    v32 = v10;
    id v33 = v9;
    id v34 = v8;
    uint64_t v18 = MEMORY[0x1D25F6CC0]();
    v37 = (void *)MEMORY[0x1E4F28DC0];
    v38 = (void *)v18;
    context = (void *)MEMORY[0x1D25F6CC0]();
    id v35 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    long long v27 = objc_msgSend(v35, "initWithObjects:", v19, v20, v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
    id v39 = 0;
    uint64_t v28 = [v37 unarchivedObjectOfClasses:v27 fromData:v12 error:&v39];
    uint64_t v16 = v39;

    if (!v28 || v16)
    {
      uint64_t v29 = __atxlog_handle_notification_management();
      id v9 = v33;
      id v8 = v34;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v42 = v34;
        __int16 v43 = 2112;
        id v44 = v33;
        __int16 v45 = 2112;
        long long v46 = v16;
        _os_log_error_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_ERROR, "Couldn't deserialized cached model results for EntityType: %@, Mode: %@. Error: %@", buf, 0x20u);
      }

      id v17 = 0;
    }
    else
    {
      id v17 = v28;
      id v9 = v33;
      id v8 = v34;
    }
    uint64_t v11 = v31;
    id v10 = v32;
  }
  else
  {
    uint64_t v16 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v42 = v8;
      __int16 v43 = 2112;
      id v44 = v9;
      __int16 v45 = 2112;
      long long v46 = v14;
      _os_log_error_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_ERROR, "Couldn't find any cached model results for EntityType: %@, Mode: %@. Error: %@", buf, 0x20u);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)dataFromFileHandle:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    id v3 = [a3 readDataToEndOfFileAndReturnError:&v9];
    id v4 = v9;
    id v5 = v4;
    if (!v3 || v4)
    {
      uint64_t v7 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerServer dataFromFileHandle:]((uint64_t)v5, v7);
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v3;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7 reply:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void (**)(id, BOOL, void))a8;
  if (v16)
  {
    id v17 = ATXModeToString();
    uint64_t v18 = [(ATXModeEntityScorerServer *)self modeEntityScoresFromCacheForModeEntityTypeIdentifier:v14 modeIdentifier:v17 modeConfigurationType:a7];
    uint64_t v19 = (void *)[v18 mutableCopy];
    uint64_t v20 = v19;
    if (v19) {
      id v21 = v19;
    }
    else {
      id v21 = (id)objc_opt_new();
    }
    uint64_t v25 = v21;

    uint64_t v28 = [v25 objectForKeyedSubscript:v15];

    if (v28)
    {
      uint64_t v29 = [v25 objectForKeyedSubscript:v15];
      long long v30 = [v29 scoreMetadata];
      [v30 setScore:a6];
    }
    else
    {
      long long v31 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315395;
        id v40 = "-[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigu"
              "rationType:reply:]";
        __int16 v41 = 2117;
        id v42 = v15;
        _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "%s: Entity with identifier: '%{sensitive}@' was not in the cache. Creating a new entry.", buf, 0x16u);
      }

      if ([v14 isEqual:@"apps"])
      {
        uint64_t v32 = [objc_alloc(MEMORY[0x1E4F4AED8]) initWithBundleId:v15];
      }
      else
      {
        if (![v14 isEqual:@"contacts"])
        {
          v38 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:]((uint64_t)v14, v38);
          }

          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%s: Unsupported entity type '%@'", "-[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:]", v14 format];
          goto LABEL_18;
        }
        uint64_t v32 = [objc_alloc(MEMORY[0x1E4F4AF60]) initWithDisplayName:v15 rawIdentifier:v15 cnContactId:v15];
      }
      uint64_t v29 = (void *)v32;
      id v33 = objc_alloc(MEMORY[0x1E4F4B170]);
      id v34 = [MEMORY[0x1E4F29128] UUID];
      id v35 = (void *)[v33 initWithScore:0 featureVector:v34 uuid:a6];
      [v29 setScoreMetadata:v35];

      [v25 setObject:v29 forKeyedSubscript:v15];
    }

LABEL_18:
    v36 = ATXModeToString();
    BOOL v37 = [(ATXModeEntityScorerServer *)self saveScoredEntitiesToDisk:v25 mode:v36 modeEntityTypeIdentifier:v14 modeConfigurationType:a7];

    v16[2](v16, v37, 0);
    goto LABEL_19;
  }
  uint64_t v22 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[ATXModeEntityScorerServer scoreContacts:mode:reply:]();
  }

  uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v24 = *MEMORY[0x1E4F1C3B8];
  uint64_t v25 = NSStringFromSelector(a2);
  uint64_t v26 = (objc_class *)objc_opt_class();
  long long v27 = NSStringFromClass(v26);
  [v23 raise:v24, @"No reply handler provided for %@ in %@", v25, v27 format];

LABEL_19:
}

- (BOOL)saveScoredEntitiesToDisk:(id)a3 mode:(id)a4 modeEntityTypeIdentifier:(id)a5 modeConfigurationType:(int64_t)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1D25F6CC0]();
  id v14 = [(ATXModeEntityScorerServer *)self pathForModeEntityTypeIdentifier:v12 modeIdentifier:v11 modeConfigurationType:a6];
  id v15 = (void *)MEMORY[0x1D25F6CC0]();
  id v24 = 0;
  uint64_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v24];
  id v17 = v24;
  if (v17)
  {
    uint64_t v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerServer saveScoredEntitiesToDisk:mode:modeEntityTypeIdentifier:modeConfigurationType:]((uint64_t)v17, v18);
    }
LABEL_10:
    BOOL v21 = 0;
    goto LABEL_11;
  }
  id v23 = 0;
  char v19 = [v16 writeToFile:v14 options:1073741825 error:&v23];
  id v17 = v23;
  uint64_t v20 = __atxlog_handle_notification_management();
  uint64_t v18 = v20;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = v12;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v17;
      _os_log_fault_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_FAULT, "FAILURE: Unable to write mode entity scores for mode entity type: %@ to path: %@. Error: %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v12;
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "SUCCESS: Finished writing mode entity scores for mode entity type: %@ to path: %@.", buf, 0x16u);
  }
  BOOL v21 = 1;
LABEL_11:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyStableContactRepresentationDataStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  id v5 = @"com.apple.ModeEntityScorer";
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Rejecting connection %@ without entitlement %@", (uint8_t *)&v2, 0x16u);
}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Unexpected interruption on mode entity scorer server", v1, 2u);
}

void __64__ATXModeEntityScorerServer_listener_shouldAcceptNewConnection___block_invoke_77_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Connection invalidated on mode entity scorer server. Client went away.", v1, 2u);
}

- (void)scoreContacts:mode:reply:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_2_7();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v4, v5, "No reply handler provided for %@ in %@", v6, v7, v8, v9, v10);
}

- (void)dataFromFileHandle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)assignModeEntityScores:(uint64_t)a1 entityTypeIdentifier:(NSObject *)a2 entityIdentifier:score:modeConfigurationType:reply:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[ATXModeEntityScorerServer assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Unsupported entity type '%@'", (uint8_t *)&v2, 0x16u);
}

- (void)saveScoredEntitiesToDisk:(uint64_t)a1 mode:(NSObject *)a2 modeEntityTypeIdentifier:modeConfigurationType:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not convert scoredEntities dictionary to NSData object due to err: %@", (uint8_t *)&v2, 0xCu);
}

@end