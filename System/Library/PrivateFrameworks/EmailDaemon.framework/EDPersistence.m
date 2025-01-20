@interface EDPersistence
+ (OS_os_log)log;
- (EDAccountsProvider)accountsProvider;
- (EDActivityPersistence)activityPersistence;
- (EDAttachmentPersistenceManager)attachmentPersistenceManager;
- (EDBIMIManager)bimiManager;
- (EDBusinessCloudStorage)businessCloudStorage;
- (EDBusinessPersistence)businessPersistence;
- (EDCategoryPersistence)categoryPersistence;
- (EDConversationPersistence)conversationPersistence;
- (EDDataDetectionPersistence)dataDetectionPersistence;
- (EDGmailLabelPersistence)gmailLabelPersistence;
- (EDListUnsubscribeHandler)listUnsubscribeHandler;
- (EDLocalActionPersistence)localActionPersistence;
- (EDMailboxActionPersistence)mailboxActionPersistence;
- (EDMailboxPersistence)mailboxPersistence;
- (EDMessageChangeManager)messageChangeManager;
- (EDMessagePersistence)messagePersistence;
- (EDPersistence)init;
- (EDPersistenceDatabase)database;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDReadLaterPersistence)readLaterPersistence;
- (EDRemindMeNotificationController)remindMeNotificationController;
- (EDRemoteContentCacheConfiguration)remoteContentCacheConfiguration;
- (EDRemoteContentManager)remoteContentManager;
- (EDRemoteContentPersistence)remoteContentPersistence;
- (EDRichLinkPersistence)richLinkPersistence;
- (EDSearchProvider)searchProvider;
- (EDSearchableIndexDiagnosticsController)diagnosticsController;
- (EDSearchableIndexManager)searchableIndexManager;
- (EDSenderPersistence)senderPersistence;
- (EDServerMessagePersistenceFactory)serverMessagePersistenceFactory;
- (EDThreadPersistence)threadPersistence;
- (EDVIPManager)vipManager;
- (EFXPCAlarmScheduler)alarmScheduler;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMRemoteContentURLCache)remoteContentURLCache;
- (EMRemoteContentURLSession)remoteContentURLSession;
- (EMUserProfileProvider)userProfileProvider;
- (MEContentRuleListManager)contentRuleListManager;
- (id)persistenceStateWithStatistics:(id)a3;
- (id)persistenceStatistics;
- (id)searchableIndexStatistics;
- (void)dealloc;
- (void)scheduleRecurringActivity;
- (void)setAccountsProvider:(id)a3;
- (void)setListUnsubscribeHandler:(id)a3;
- (void)setRemoteContentURLCache:(id)a3;
- (void)setRemoteContentURLSession:(id)a3;
- (void)setVipManager:(id)a3;
- (void)test_tearDown;
@end

@implementation EDPersistence

- (EDPersistenceHookRegistry)hookRegistry
{
  return (EDPersistenceHookRegistry *)objc_getProperty(self, a2, 40, 1);
}

- (EDVIPManager)vipManager
{
  return (EDVIPManager *)objc_getProperty(self, a2, 72, 1);
}

- (EDListUnsubscribeHandler)listUnsubscribeHandler
{
  return self->_listUnsubscribeHandler;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EDActivityPersistence)activityPersistence
{
  return (EDActivityPersistence *)objc_getProperty(self, a2, 96, 1);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__EDPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_66 != -1) {
    dispatch_once(&log_onceToken_66, block);
  }
  v2 = (void *)log_log_66;

  return (OS_os_log *)v2;
}

void __20__EDPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_66;
  log_log_66 = (uint64_t)v1;
}

- (EDPersistence)init
{
  v16.receiver = self;
  v16.super_class = (Class)EDPersistence;
  v2 = [(EDPersistence *)&v16 init];
  if (!v2) {
    return 0;
  }
  v15.receiver = v2;
  v15.super_class = (Class)EDPersistence;
  id v3 = [(EDPersistence *)&v15 init];
  if (v3)
  {
    v4 = objc_alloc_init(EDGmailLabelPersistence);
    gmailLabelPersistence = v3->_gmailLabelPersistence;
    v3->_gmailLabelPersistence = v4;

    v6 = objc_alloc_init(EDPersistenceHookRegistry);
    hookRegistry = v3->_hookRegistry;
    v3->_hookRegistry = v6;

    v8 = [[EDActivityPersistence alloc] initWithHookResponder:v3->_hookRegistry];
    activityPersistence = v3->_activityPersistence;
    v3->_activityPersistence = v8;

    v10 = (EMBlockedSenderManager *)objc_alloc_init(MEMORY[0x1E4F60210]);
    blockedSenderManager = v3->_blockedSenderManager;
    v3->_blockedSenderManager = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F60F50]) initGlobalInstance];
    alarmScheduler = v3->_alarmScheduler;
    v3->_alarmScheduler = (EFXPCAlarmScheduler *)v12;
  }
  return v3;
}

- (void)dealloc
{
  id v3 = [(EDPersistence *)self remoteContentURLSession];
  [v3 invalidateAndCancel:1];

  v4.receiver = self;
  v4.super_class = (Class)EDPersistence;
  [(EDPersistence *)&v4 dealloc];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDPersistence.m", 68, @"%s can only be called from unit tests", "-[EDPersistence test_tearDown]");
  }
  id v4 = [(EDPersistence *)self remindMeNotificationController];
  objc_msgSend(v4, "test_tearDown");

  id v5 = [(EDPersistence *)self messageChangeManager];
  objc_msgSend(v5, "test_tearDown");

  id v6 = [(EDPersistence *)self senderPersistence];
  objc_msgSend(v6, "test_tearDown");

  id v7 = [(EDPersistence *)self blockedSenderManager];
  objc_msgSend(v7, "test_tearDown");

  id v8 = [(EDPersistence *)self remoteContentManager];
  objc_msgSend(v8, "test_tearDown");

  id v9 = [(EDPersistence *)self remoteContentPersistence];
  objc_msgSend(v9, "test_tearDown");

  id v10 = [(EDPersistence *)self searchableIndexManager];
  objc_msgSend(v10, "test_tearDown");

  id v11 = [(EDPersistence *)self mailboxPersistence];
  objc_msgSend(v11, "test_tearDown");

  id v12 = [(EDPersistence *)self messagePersistence];
  objc_msgSend(v12, "test_tearDown");

  id v13 = [(EDPersistence *)self bimiManager];
  objc_msgSend(v13, "test_tearDown");

  id v14 = [(EDPersistence *)self database];
  objc_msgSend(v14, "test_tearDown");
}

- (void)scheduleRecurringActivity
{
  id v3 = [(EDPersistence *)self database];
  [v3 scheduleRecurringActivity];

  id v4 = [(EDPersistence *)self searchableIndexManager];
  [v4 scheduleRecurringActivity];

  id v5 = [(EDPersistence *)self remoteContentManager];
  [v5 scheduleRecurringActivity];

  id v6 = [(EDPersistence *)self bimiManager];
  [v6 scheduleRecurringActivity];

  id v7 = [(EDPersistence *)self senderPersistence];
  [v7 scheduleRecurringActivity];

  id v8 = [(EDPersistence *)self readLaterPersistence];
  [v8 scheduleRecurringActivity];

  id v9 = [(EDPersistence *)self mailboxPersistence];
  [v9 scheduleRecurringActivity];

  id v10 = [(EDPersistence *)self diagnosticsController];
  [v10 scheduleRecurringActivity];
}

- (EDPersistenceDatabase)database
{
}

- (EDServerMessagePersistenceFactory)serverMessagePersistenceFactory
{
}

- (EDConversationPersistence)conversationPersistence
{
}

- (EDLocalActionPersistence)localActionPersistence
{
}

- (EDMessageChangeManager)messageChangeManager
{
}

- (EDDataDetectionPersistence)dataDetectionPersistence
{
}

- (EDReadLaterPersistence)readLaterPersistence
{
}

- (EDRichLinkPersistence)richLinkPersistence
{
}

- (EDBusinessPersistence)businessPersistence
{
}

- (EDSearchableIndexManager)searchableIndexManager
{
}

- (EDThreadPersistence)threadPersistence
{
}

- (EDRemoteContentManager)remoteContentManager
{
}

- (EDRemoteContentPersistence)remoteContentPersistence
{
}

- (EDAttachmentPersistenceManager)attachmentPersistenceManager
{
}

- (EDMailboxActionPersistence)mailboxActionPersistence
{
}

- (id)persistenceStatistics
{
}

- (id)searchableIndexStatistics
{
}

- (id)persistenceStateWithStatistics:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = *MEMORY[0x1E4F60018];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "messages"));
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E4F60008];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "messageData"));
  v11[1] = v5;
  v10[2] = *MEMORY[0x1E4F60020];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "messagesDeleted"));
  v11[2] = v6;
  v10[3] = *MEMORY[0x1E4F60010];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "messageDataDeleted"));
  v11[3] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (EDGmailLabelPersistence)gmailLabelPersistence
{
  return (EDGmailLabelPersistence *)objc_getProperty(self, a2, 8, 1);
}

- (EDSenderPersistence)senderPersistence
{
  return (EDSenderPersistence *)objc_getProperty(self, a2, 16, 1);
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDMessagePersistence)messagePersistence
{
  return (EDMessagePersistence *)objc_getProperty(self, a2, 32, 1);
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (void)setVipManager:(id)a3
{
}

- (void)setListUnsubscribeHandler:(id)a3
{
}

- (EDRemoteContentCacheConfiguration)remoteContentCacheConfiguration
{
  return self->_remoteContentCacheConfiguration;
}

- (EMRemoteContentURLCache)remoteContentURLCache
{
  return self->_remoteContentURLCache;
}

- (void)setRemoteContentURLCache:(id)a3
{
}

- (EMRemoteContentURLSession)remoteContentURLSession
{
  return self->_remoteContentURLSession;
}

- (void)setRemoteContentURLSession:(id)a3
{
}

- (MEContentRuleListManager)contentRuleListManager
{
  return self->_contentRuleListManager;
}

- (EDCategoryPersistence)categoryPersistence
{
  return (EDCategoryPersistence *)objc_getProperty(self, a2, 136, 1);
}

- (EDBusinessCloudStorage)businessCloudStorage
{
  return self->_businessCloudStorage;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EFXPCAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (EDSearchableIndexDiagnosticsController)diagnosticsController
{
  return self->_diagnosticsController;
}

- (EDBIMIManager)bimiManager
{
  return self->_bimiManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bimiManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_businessCloudStorage, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_contentRuleListManager, 0);
  objc_storeStrong((id *)&self->_remoteContentURLSession, 0);
  objc_storeStrong((id *)&self->_remoteContentURLCache, 0);
  objc_storeStrong((id *)&self->_remoteContentCacheConfiguration, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_listUnsubscribeHandler, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);

  objc_storeStrong((id *)&self->_gmailLabelPersistence, 0);
}

@end