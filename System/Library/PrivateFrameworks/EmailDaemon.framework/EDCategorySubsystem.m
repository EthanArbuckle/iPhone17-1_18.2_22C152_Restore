@interface EDCategorySubsystem
+ (OS_os_log)log;
- (EDAccountsProvider)accountsProvider;
- (EDActivityPersistence)activityPersistence;
- (EDBiomeInteractionEventLog)biomeLog;
- (EDBusinessPersistence)businessPersistence;
- (EDCategoryCoreAnalyticsLogger)coreAnalyticsLogger;
- (EDCategoryPersistence)categoryPersistence;
- (EDCategorySubsystem)initWithPersistence:(id)a3 userProfileProvider:(id)a4 vipManager:(id)a5 sourceApplicationBundleIdentifier:(id)a6 categorizationAnalyticsLogger:(id)a7;
- (EDInteractionLogger)interactionLogger;
- (EDMessageAuthenticator)messageAuthenticator;
- (EDMessageCategorizer)messageCategorizer;
- (EDMessagePersistence)messagePersistence;
- (EDPETInteractionEventLog)petLog;
- (id)_majorAndMinorVersionFrom:(id)a3;
- (void)_registerBiomeETLToCALoggerTask;
- (void)_registerCoreAnalyticsLoggerTask;
- (void)_schedulePETSubmissionActivityForLog:(id)a3;
- (void)recategorizeAllMessagesIfModelVersionChangedFrom:(id)a3 to:(id)a4;
- (void)scheduleRecurringActivity;
- (void)start;
@end

@implementation EDCategorySubsystem

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EDCategorySubsystem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_19 != -1) {
    dispatch_once(&log_onceToken_19, block);
  }
  v2 = (void *)log_log_19;

  return (OS_os_log *)v2;
}

void __26__EDCategorySubsystem_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_19;
  log_log_19 = (uint64_t)v1;
}

- (EDCategorySubsystem)initWithPersistence:(id)a3 userProfileProvider:(id)a4 vipManager:(id)a5 sourceApplicationBundleIdentifier:(id)a6 categorizationAnalyticsLogger:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v57.receiver = self;
  v57.super_class = (Class)EDCategorySubsystem;
  v15 = [(EDCategorySubsystem *)&v57 init];
  if (v15)
  {
    id v54 = v14;
    v56 = [v11 hookRegistry];
    v55 = objc_msgSend(MEMORY[0x1E4F1B980], "em_authorizedContactStore");
    uint64_t v16 = [v11 messagePersistence];
    messagePersistence = v15->_messagePersistence;
    v15->_messagePersistence = (EDMessagePersistence *)v16;

    uint64_t v18 = [v11 accountsProvider];
    accountsProvider = v15->_accountsProvider;
    v15->_accountsProvider = (EDAccountsProvider *)v18;

    if (EMInteractionLoggerShouldLog())
    {
      id v53 = v13;
      v20 = objc_opt_new();
      v21 = [MEMORY[0x1E4F60410] mailDataDirectory];
      v22 = [[EDPETInteractionEventLog alloc] initWithDirectory:v21 userProfileProvider:v12 contactStore:v55 vipManager:v53];
      petLog = v15->_petLog;
      v15->_petLog = v22;

      [v20 addObject:v15->_petLog];
      uint64_t v24 = objc_opt_new();
      biomeLog = v15->_biomeLog;
      v15->_biomeLog = (EDBiomeInteractionEventLog *)v24;

      [v20 addObject:v15->_biomeLog];
      v26 = [[EDInteractionEventLogMultiplexer alloc] initWithLogs:v20];
      v27 = [EDInteractionLogger alloc];
      v28 = v15->_messagePersistence;
      v29 = [v11 mailboxPersistence];
      uint64_t v30 = [(EDInteractionLogger *)v27 initWithMessagePersistence:v28 mailboxPersistence:v29 eventLog:v26];
      interactionLogger = v15->_interactionLogger;
      v15->_interactionLogger = (EDInteractionLogger *)v30;

      [v56 registerMessageChangeHookResponder:v15->_interactionLogger];
      [v56 registerMessageDeliveryHookResponder:v15->_interactionLogger];
      [v56 registerCategoryChangeHookResponder:v15->_interactionLogger];

      id v13 = v53;
    }
    else
    {
      v26 = 0;
    }
    objc_storeStrong((id *)&v15->_coreAnalyticsLogger, a7);
    v32 = [(EDCategorySubsystem *)v15 accountsProvider];
    [(EDCategoryCoreAnalyticsLogger *)v15->_coreAnalyticsLogger setAccountsProvider:v32];

    uint64_t v33 = [v11 categoryPersistence];
    categoryPersistence = v15->_categoryPersistence;
    v15->_categoryPersistence = (EDCategoryPersistence *)v33;

    v35 = [(EDCategorySubsystem *)v15 accountsProvider];
    v36 = [(EDCategoryPersistence *)v15->_categoryPersistence analyticsLogger];
    [v36 setAccountsProvider:v35];

    uint64_t v37 = [v11 activityPersistence];
    activityPersistence = v15->_activityPersistence;
    v15->_activityPersistence = (EDActivityPersistence *)v37;

    uint64_t v39 = [v11 businessPersistence];
    businessPersistence = v15->_businessPersistence;
    v15->_businessPersistence = (EDBusinessPersistence *)v39;

    v41 = [EDMessageCategorizer alloc];
    v42 = v15->_categoryPersistence;
    v43 = [v11 senderPersistence];
    uint64_t v44 = [(EDMessageCategorizer *)v41 initWithCategoryPersistence:v42 eventLog:v26 vipManager:v13 contactStore:v55 analyticsLogger:v54 senderPersistence:v43 hookRegistry:v56];
    messageCategorizer = v15->_messageCategorizer;
    v15->_messageCategorizer = (EDMessageCategorizer *)v44;

    v46 = [[EDMessageAuthenticator alloc] initWithMessagePersistence:v15->_messagePersistence hookRegistry:v56];
    messageAuthenticator = v15->_messageAuthenticator;
    v15->_messageAuthenticator = v46;

    v48 = v15->_messageCategorizer;
    v49 = [v11 messageChangeManager];
    [v49 setMessageCategorizer:v48];

    v50 = v15->_messageAuthenticator;
    v51 = [v11 messageChangeManager];
    [v51 setMessageAuthenticator:v50];

    id v14 = v54;
  }

  return v15;
}

- (void)start
{
  [(EDCategorySubsystem *)self registerInboxMigrationTasks];
  [(EDCategorySubsystem *)self registerAuthStateMigrationTask];
  [(EDCategorySubsystem *)self registerBusinessesGroupingTask];
  [(EDCategorySubsystem *)self _registerCoreAnalyticsLoggerTask];

  [(EDCategorySubsystem *)self _registerBiomeETLToCALoggerTask];
}

- (void)_registerCoreAnalyticsLoggerTask
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "CoreAnalytics logger object is nil!", v1, 2u);
}

void __55__EDCategorySubsystem__registerCoreAnalyticsLoggerTask__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained coreAnalyticsLogger];
    [v5 processCoreAnalyticsEvents];

    [v7 setTaskCompleted];
    v6 = [v4 coreAnalyticsLogger];
    [v6 scheduleNextAnalyticsBackgroundTask];
  }
}

- (void)_registerBiomeETLToCALoggerTask
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Biome ETL to CA logger object is nil!", v1, 2u);
}

void __54__EDCategorySubsystem__registerBiomeETLToCALoggerTask__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"com.apple.mail.blackpearl.biome.etl.coreanalytics"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained coreAnalyticsLogger];
    [v6 etlFromBiomeToCA];

    [v8 setTaskCompleted];
    id v7 = [v5 coreAnalyticsLogger];
    [v7 scheduleNextBiomeETLToCAScheduleBackgroundTask];

    [v3 invalidate];
  }
}

- (void)scheduleRecurringActivity
{
  id v3 = [(EDCategorySubsystem *)self petLog];
  -[EDCategorySubsystem _schedulePETSubmissionActivityForLog:](self, "_schedulePETSubmissionActivityForLog:");
}

- (void)_schedulePETSubmissionActivityForLog:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__EDCategorySubsystem__schedulePETSubmissionActivityForLog___block_invoke_2;
  aBlock[3] = &unk_1E6C008D8;
  id v7 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);
  ef_xpc_activity_register();
}

void __60__EDCategorySubsystem__schedulePETSubmissionActivityForLog___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14338], 0);
}

void __60__EDCategorySubsystem__schedulePETSubmissionActivityForLog___block_invoke_2(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) batchedEventsForSubmission];
  if (v1)
  {
    id v3 = v1;
    v2 = [MEMORY[0x1E4F93728] sharedInstance];
    [v2 logMessage:v3];

    os_log_t v1 = v3;
  }
}

- (void)recategorizeAllMessagesIfModelVersionChangedFrom:(id)a3 to:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDCategorySubsystem *)self _majorAndMinorVersionFrom:v6];
  v9 = [(EDCategorySubsystem *)self _majorAndMinorVersionFrom:v7];
  if (([v8 isEqualToString:v9] & 1) == 0)
  {
    v10 = +[EDCategorySubsystem log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Recategorizing all messages due to model version change from %@ to %@", (uint8_t *)&v12, 0x16u);
    }

    id v11 = [(EDCategorySubsystem *)self categoryPersistence];
    [v11 incrementCategorizationVersion];
  }
}

- (id)_majorAndMinorVersionFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 componentsSeparatedByString:@"."];
  if ((unint64_t)[v4 count] > 2)
  {
    id v6 = NSString;
    id v7 = [v4 objectAtIndexedSubscript:0];
    id v8 = [v4 objectAtIndexedSubscript:1];
    id v5 = [v6 stringWithFormat:@"%@.%@", v7, v8];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDInteractionLogger)interactionLogger
{
  return self->_interactionLogger;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDBusinessPersistence)businessPersistence
{
  return self->_businessPersistence;
}

- (EDMessageCategorizer)messageCategorizer
{
  return self->_messageCategorizer;
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (EDMessageAuthenticator)messageAuthenticator
{
  return self->_messageAuthenticator;
}

- (EDPETInteractionEventLog)petLog
{
  return self->_petLog;
}

- (EDBiomeInteractionEventLog)biomeLog
{
  return self->_biomeLog;
}

- (EDCategoryCoreAnalyticsLogger)coreAnalyticsLogger
{
  return self->_coreAnalyticsLogger;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_biomeLog, 0);
  objc_storeStrong((id *)&self->_petLog, 0);
  objc_storeStrong((id *)&self->_messageAuthenticator, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_messageCategorizer, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_interactionLogger, 0);

  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end