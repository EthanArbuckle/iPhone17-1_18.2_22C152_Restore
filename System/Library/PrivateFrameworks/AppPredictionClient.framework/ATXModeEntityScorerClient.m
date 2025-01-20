@interface ATXModeEntityScorerClient
- (ATXModeEntityScorerClient)init;
- (void)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7 reply:(id)a8;
- (void)dealloc;
- (void)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 reply:(id)a6;
- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4;
- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4;
- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5;
@end

@implementation ATXModeEntityScorerClient

- (ATXModeEntityScorerClient)init
{
  v87[2] = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)ATXModeEntityScorerClient;
  v2 = [(ATXModeEntityScorerClient *)&v67 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ModeEntityScorer" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE03378];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v87[0] = objc_opt_class();
    v87[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
    v8 = [v6 setWithArray:v7];
    [v5 setClasses:v8 forSelector:sel_scoreContacts_mode_reply_ argumentIndex:0 ofReply:1];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v86[0] = objc_opt_class();
    v86[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
    v11 = [v9 setWithArray:v10];
    [v5 setClasses:v11 forSelector:sel_rankedContactsForMode_reply_ argumentIndex:0 ofReply:1];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v85[0] = objc_opt_class();
    v85[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
    v14 = [v12 setWithArray:v13];
    [v5 setClasses:v14 forSelector:sel_scoreContacts_mode_reply_ argumentIndex:0 ofReply:0];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v84[0] = objc_opt_class();
    v84[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
    v17 = [v15 setWithArray:v16];
    [v5 setClasses:v17 forSelector:sel_scoreApps_mode_reply_ argumentIndex:0 ofReply:1];

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v83[0] = objc_opt_class();
    v83[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    v20 = [v18 setWithArray:v19];
    [v5 setClasses:v20 forSelector:sel_rankedAppsForMode_reply_ argumentIndex:0 ofReply:1];

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v82[0] = objc_opt_class();
    v82[1] = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    v23 = [v21 setWithArray:v22];
    [v5 setClasses:v23 forSelector:sel_scoreApps_mode_reply_ argumentIndex:0 ofReply:0];

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    v26 = [v24 setWithArray:v25];
    [v5 setClasses:v26 forSelector:sel_scoreAppsForDenyList_mode_reply_ argumentIndex:0 ofReply:1];

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
    v29 = [v27 setWithArray:v28];
    [v5 setClasses:v29 forSelector:sel_rankedAppsForDenyListForMode_reply_ argumentIndex:0 ofReply:1];

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v79[0] = objc_opt_class();
    v79[1] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
    v32 = [v30 setWithArray:v31];
    [v5 setClasses:v32 forSelector:sel_scoreAppsForDenyList_mode_reply_ argumentIndex:0 ofReply:0];

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    v78[0] = objc_opt_class();
    v78[1] = objc_opt_class();
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
    v35 = [v33 setWithArray:v34];
    [v5 setClasses:v35 forSelector:sel_scoreContactsForDenyList_mode_reply_ argumentIndex:0 ofReply:1];

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    v38 = [v36 setWithArray:v37];
    [v5 setClasses:v38 forSelector:sel_rankedContactsForDenyListForMode_reply_ argumentIndex:0 ofReply:1];

    v39 = (void *)MEMORY[0x1E4F1CAD0];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
    v41 = [v39 setWithArray:v40];
    [v5 setClasses:v41 forSelector:sel_rankedContactsForDenyListForMode_options_reply_ argumentIndex:0 ofReply:1];

    v42 = (void *)MEMORY[0x1E4F1CAD0];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
    v44 = [v42 setWithArray:v43];
    [v5 setClasses:v44 forSelector:sel_scoreContactsForDenyList_mode_reply_ argumentIndex:0 ofReply:0];

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
    v47 = [v45 setWithArray:v46];
    [v5 setClasses:v47 forSelector:sel_rankedWidgetsForMode_reply_ argumentIndex:0 ofReply:1];

    v48 = (void *)MEMORY[0x1E4F1CAD0];
    v73[0] = objc_opt_class();
    v73[1] = objc_opt_class();
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
    v50 = [v48 setWithArray:v49];
    [v5 setClasses:v50 forSelector:sel_scoreNotifications_mode_reply_ argumentIndex:0 ofReply:1];

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    v53 = [v51 setWithArray:v52];
    [v5 setClasses:v53 forSelector:sel_scoreNotifications_mode_reply_ argumentIndex:0 ofReply:0];

    v54 = (void *)MEMORY[0x1E4F1CAD0];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
    v56 = [v54 setWithArray:v55];
    [v5 setClasses:v56 forSelector:sel_rankedNotificationsForMode_reply_ argumentIndex:0 ofReply:1];

    v57 = (void *)MEMORY[0x1E4F1CAD0];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    v59 = [v57 setWithArray:v58];
    [v5 setClasses:v59 forSelector:sel_rankedAppsForNotificationsForMode_reply_ argumentIndex:0 ofReply:1];

    v60 = (void *)MEMORY[0x1E4F1CAD0];
    v69[0] = objc_opt_class();
    v69[1] = objc_opt_class();
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
    v62 = [v60 setWithArray:v61];
    [v5 setClasses:v62 forSelector:sel_rankedContactsForNotificationsForMode_reply_ argumentIndex:0 ofReply:1];

    v63 = (void *)MEMORY[0x1E4F1CAD0];
    v68[0] = objc_opt_class();
    v68[1] = objc_opt_class();
    v68[2] = objc_opt_class();
    v68[3] = objc_opt_class();
    v68[4] = objc_opt_class();
    v68[5] = objc_opt_class();
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:6];
    v65 = [v63 setWithArray:v64];
    [v5 setClasses:v65 forSelector:sel_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_23];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_59];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __33__ATXModeEntityScorerClient_init__block_invoke()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __33__ATXModeEntityScorerClient_init__block_invoke_cold_1(v0);
  }
}

void __33__ATXModeEntityScorerClient_init__block_invoke_57()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_INFO, "ATXModeEntityScorer invalidation handler called", v1, 2u);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXModeEntityScorerClient;
  [(ATXModeEntityScorerClient *)&v3 dealloc];
}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke;
      v26[3] = &unk_1E5D06A88;
      v26[4] = self;
      v26[5] = a2;
      v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_72;
      v24[3] = &unk_1E5D04F78;
      id v25 = v10;
      [v12 scoreContacts:v9 mode:a4 reply:v24];
    }
    else
    {
      v19 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      v23 = (void *)[v20 initWithDomain:v21 code:1 userInfo:v22];

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v23);
    }
  }
  else
  {
    v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No reply handler provided for %@ in %@", v16, v18 format];
  }
}

void __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();
  }
}

uint64_t __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];

    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0] & 1) == 0)
  {
    v17 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F285A8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v14 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

    v7[2](v7, MEMORY[0x1E4F1CBF0], v14);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke;
  v24[3] = &unk_1E5D05770;
  SEL v26 = a2;
  void v24[4] = self;
  id v9 = v7;
  id v25 = v9;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke_74;
  v21[3] = &unk_1E5D06AB0;
  SEL v23 = a2;
  v22 = v9;
  [v10 rankedContactsForMode:a3 reply:v21];

LABEL_11:
}

void __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__ATXModeEntityScorerClient_rankedContactsForMode_reply___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with contacts:%@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke;
      v26[3] = &unk_1E5D06A88;
      v26[4] = self;
      v26[5] = a2;
      id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke_75;
      v24[3] = &unk_1E5D04F78;
      id v25 = v10;
      [v12 scoreApps:v9 mode:a4 reply:v24];
    }
    else
    {
      uint64_t v19 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      SEL v23 = (void *)[v20 initWithDomain:v21 code:1 userInfo:v22];

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v23);
    }
  }
  else
  {
    uint64_t v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No reply handler provided for %@ in %@", v16, v18 format];
  }
}

void __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();
  }
}

uint64_t __50__ATXModeEntityScorerClient_scoreApps_mode_reply___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    __int16 v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];

    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0] & 1) == 0)
  {
    v17 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F285A8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v14 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

    v7[2](v7, MEMORY[0x1E4F1CBF0], v14);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke;
  v24[3] = &unk_1E5D05770;
  SEL v26 = a2;
  void v24[4] = self;
  id v9 = v7;
  id v25 = v9;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke_76;
  v21[3] = &unk_1E5D06AB0;
  SEL v23 = a2;
  v22 = v9;
  [v10 rankedAppsForMode:a3 reply:v21];

LABEL_11:
}

void __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53__ATXModeEntityScorerClient_rankedAppsForMode_reply___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with apps:%@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    __int16 v11 = __atxlog_handle_modes();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];

    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0] & 1) == 0)
  {
    v17 = __atxlog_handle_modes();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F285A8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v14 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

    v7[2](v7, MEMORY[0x1E4F1CBF0], v14);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke;
  v24[3] = &unk_1E5D05770;
  SEL v26 = a2;
  void v24[4] = self;
  int v9 = v7;
  id v25 = v9;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke_77;
  v21[3] = &unk_1E5D06AB0;
  SEL v23 = a2;
  v22 = v9;
  [v10 rankedWidgetsForMode:a3 reply:v21];

LABEL_11:
}

void __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__ATXModeEntityScorerClient_rankedWidgetsForMode_reply___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = __atxlog_handle_modes();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with widgets:%@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke;
      v26[3] = &unk_1E5D06A88;
      v26[4] = self;
      v26[5] = a2;
      id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke_78;
      v24[3] = &unk_1E5D04F78;
      id v25 = v10;
      [v12 scoreNotifications:v9 mode:a4 reply:v24];
    }
    else
    {
      uint64_t v19 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      SEL v23 = (void *)[v20 initWithDomain:v21 code:1 userInfo:v22];

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v23);
    }
  }
  else
  {
    uint64_t v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No reply handler provided for %@ in %@", v16, v18 format];
  }
}

void __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();
  }
}

uint64_t __59__ATXModeEntityScorerClient_scoreNotifications_mode_reply___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke;
      v24[3] = &unk_1E5D05770;
      SEL v26 = a2;
      void v24[4] = self;
      id v9 = v7;
      id v25 = v9;
      id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke_79;
      v22[3] = &unk_1E5D04F78;
      id v23 = v9;
      [v10 rankedNotificationsForMode:a3 reply:v22];
    }
    else
    {
      v17 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      uint64_t v21 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

      (*((void (**)(id, void, void *))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], v21);
    }
  }
  else
  {
    __int16 v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];
  }
}

void __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __62__ATXModeEntityScorerClient_rankedNotificationsForMode_reply___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke;
      v24[3] = &unk_1E5D05770;
      SEL v26 = a2;
      void v24[4] = self;
      id v9 = v7;
      id v25 = v9;
      id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke_80;
      v22[3] = &unk_1E5D04F78;
      id v23 = v9;
      [v10 rankedAppsForNotificationsForMode:a3 reply:v22];
    }
    else
    {
      v17 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      uint64_t v21 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

      (*((void (**)(id, void, void *))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], v21);
    }
  }
  else
  {
    __int16 v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];
  }
}

void __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __69__ATXModeEntityScorerClient_rankedAppsForNotificationsForMode_reply___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke;
      v24[3] = &unk_1E5D05770;
      SEL v26 = a2;
      void v24[4] = self;
      id v9 = v7;
      id v25 = v9;
      id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke_81;
      v22[3] = &unk_1E5D04F78;
      id v23 = v9;
      [v10 rankedContactsForNotificationsForMode:a3 reply:v22];
    }
    else
    {
      v17 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring.  Not calling XPC service.";
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      uint64_t v21 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

      (*((void (**)(id, void, void *))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], v21);
    }
  }
  else
  {
    __int16 v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];
  }
}

void __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__ATXModeEntityScorerClient_rankedContactsForNotificationsForMode_reply___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke;
      v26[3] = &unk_1E5D06A88;
      v26[4] = self;
      v26[5] = a2;
      id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke_85;
      v24[3] = &unk_1E5D04F78;
      id v25 = v10;
      [v12 scoreAppsForDenyList:v9 mode:a4 reply:v24];
    }
    else
    {
      uint64_t v19 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring of apps for the deny list.  Not calling XPC service.";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      id v23 = (void *)[v20 initWithDomain:v21 code:1 userInfo:v22];

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v23);
    }
  }
  else
  {
    uint64_t v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No reply handler provided for %@ in %@", v16, v18 format];
  }
}

void __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();
  }
}

uint64_t __61__ATXModeEntityScorerClient_scoreAppsForDenyList_mode_reply___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    __int16 v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v14 = NSStringFromSelector(a2);
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v12 raise:v13, @"No reply handler provided for %@ in %@", v14, v16 format];

    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0] & 1) == 0)
  {
    v17 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F285A8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Missing entitlement for mode entity scoring of apps for the deny list.  Not calling XPC service.";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v14 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

    v7[2](v7, MEMORY[0x1E4F1CBF0], v14);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke;
  v24[3] = &unk_1E5D05770;
  SEL v26 = a2;
  void v24[4] = self;
  id v9 = v7;
  id v25 = v9;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke_86;
  v21[3] = &unk_1E5D06AB0;
  SEL v23 = a2;
  v22 = v9;
  [v10 rankedAppsForDenyListForMode:a3 reply:v21];

LABEL_11:
}

void __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__ATXModeEntityScorerClient_rankedAppsForDenyListForMode_reply___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with apps:%@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0])
    {
      xpcConnection = self->_xpcConnection;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke;
      v26[3] = &unk_1E5D06A88;
      v26[4] = self;
      v26[5] = a2;
      id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke_90;
      v24[3] = &unk_1E5D04F78;
      id v25 = v10;
      [v12 scoreContactsForDenyList:v9 mode:a4 reply:v24];
    }
    else
    {
      uint64_t v19 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
      }

      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F285A8];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Missing entitlement for mode entity scoring of contacts for the deny list.  Not calling XPC service.";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      SEL v23 = (void *)[v20 initWithDomain:v21 code:1 userInfo:v22];

      (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v23);
    }
  }
  else
  {
    uint64_t v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No reply handler provided for %@ in %@", v16, v18 format];
  }
}

void __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1();
  }
}

uint64_t __65__ATXModeEntityScorerClient_scoreContactsForDenyList_mode_reply___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = (void (**)(id, void, void *))a5;
  if (!v9)
  {
    uint64_t v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No reply handler provided for %@ in %@", v16, v18 format];

    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.ModeEntityScorer" logHandle:0] & 1) == 0)
  {
    uint64_t v19 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F285A8];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Missing entitlement for mode entity scoring of contacts for the deny list.  Not calling XPC service.";
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v16 = (void *)[v20 initWithDomain:v21 code:1 userInfo:v22];

    v9[2](v9, MEMORY[0x1E4F1CBF0], v16);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke;
  v26[3] = &unk_1E5D05770;
  SEL v28 = a2;
  v26[4] = self;
  __int16 v11 = v9;
  id v27 = v11;
  id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke_91;
  v23[3] = &unk_1E5D06AB0;
  SEL v25 = a2;
  v24 = v11;
  [v12 rankedContactsForDenyListForMode:a3 options:a4 reply:v23];

LABEL_11:
}

void __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__ATXModeEntityScorerClient_rankedContactsForDenyListForMode_options_reply___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Reached %@ reply with contacts:%@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (v13)
  {
    xpcConnection = self->_xpcConnection;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke;
    v26[3] = &unk_1E5D05770;
    SEL v28 = a2;
    v26[4] = self;
    id v16 = v13;
    id v27 = v16;
    v17 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke_92;
    v24[3] = &unk_1E5D06AD8;
    id v25 = v16;
    [v17 modeEntityScoresFromCacheForModeEntityTypeIdentifier:v11 modeIdentifier:v12 modeConfigurationType:a5 reply:v24];
  }
  else
  {
    id v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    uint64_t v21 = NSStringFromSelector(a2);
    v22 = (objc_class *)objc_opt_class();
    SEL v23 = NSStringFromClass(v22);
    [v19 raise:v20, @"No reply handler provided for %@ in %@", v21, v23 format];
  }
}

void __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __125__ATXModeEntityScorerClient_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType_reply___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7 reply:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = v17;
  if (v17)
  {
    xpcConnection = self->_xpcConnection;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke;
    v30[3] = &unk_1E5D05770;
    SEL v32 = a2;
    v30[4] = self;
    id v20 = v17;
    id v31 = v20;
    uint64_t v21 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v30];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    void v28[2] = __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke_94;
    v28[3] = &unk_1E5D06B00;
    id v29 = v20;
    [v21 assignModeEntityScores:a3 entityTypeIdentifier:v15 entityIdentifier:v16 score:a7 modeConfigurationType:v28 reply:a6];
  }
  else
  {
    v22 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXModeEntityScorerClient scoreContacts:mode:reply:]();
    }

    SEL v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3B8];
    id v25 = NSStringFromSelector(a2);
    SEL v26 = (objc_class *)objc_opt_class();
    id v27 = NSStringFromClass(v26);
    [v23 raise:v24, @"No reply handler provided for %@ in %@", v25, v27 format];
  }
}

void __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __124__ATXModeEntityScorerClient_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType_reply___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __33__ATXModeEntityScorerClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXModeEntityScorer interruption handler called", v1, 2u);
}

- (void)scoreContacts:mode:reply:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_8();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v4, v5, "No reply handler provided for %@ in %@", v6, v7, v8, v9, v10);
}

- (void)scoreContacts:mode:reply:.cold.2()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  id v3 = @"com.apple.ModeEntityScorer";
  OUTLINED_FUNCTION_6_0(&dword_1A790D000, v0, v1, "Not attempting XPC service call on connection %@ without entitlement %@", v2);
}

void __54__ATXModeEntityScorerClient_scoreContacts_mode_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  id v2 = (const char *)OUTLINED_FUNCTION_12(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  id v3 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v5, v6, "%@ in %@ xpc error:%@", v7, v8, v9, v10, v11);
}

@end