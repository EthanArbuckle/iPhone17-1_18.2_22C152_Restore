@interface EDMailboxPersistence
+ (id)log;
- (BOOL)createMailbox:(id)a3 parentMailboxID:(id)a4;
- (BOOL)deleteMailbox:(id)a3;
- (BOOL)mailboxURLIsGmailLabel:(id)a3;
- (BOOL)moveMailbox:(id)a3 newParentMailboxID:(id)a4;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4;
- (EDMailboxPersistence)initWithMailboxProvider:(id)a3 database:(id)a4 hookRegistry:(id)a5;
- (EDMailboxPersistenceStatistics)statistics;
- (EDMailboxProvider)mailboxProvider;
- (EDMailboxRowID_s)insertDatabaseRowForMailboxURL:(id)a3;
- (EDMailboxRowID_s)mailboxDatabaseIDForMailboxURL:(id)a3;
- (EDPersistenceDatabase)database;
- (EDPersistenceHookRegistry)hookRegistry;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (NSBackgroundActivityScheduler)statisticsReportingScheduler;
- (NSMutableDictionary)changeObserversByIdentifier;
- (NSSet)allMailboxObjectIDs;
- (id)allMailboxes;
- (id)initForTesting:(BOOL)a3;
- (id)legacyMailboxForMailboxURL:(id)a3;
- (id)legacyMailboxForObjectID:(id)a3;
- (id)mailboxDatabaseIDsForMailboxObjectIDs:(id)a3 createIfNecessary:(BOOL)a4;
- (id)mailboxDatabaseIDsForMailboxURLStrings:(id)a3;
- (id)mailboxObjectIDsForMailboxType:(int64_t)a3;
- (id)mailboxURLForMailboxDatabaseID:(EDMailboxRowID_s)a3;
- (id)userCreatedMailboxObjectIDs;
- (int64_t)mailboxTypeForMailboxObjectID:(id)a3;
- (unsigned)uidNextForMailbox:(EDMailboxRowID_s)a3;
- (unsigned)uidValidityForMailbox:(EDMailboxRowID_s)a3;
- (void)_reportPersistenceStatistics:(id)a3;
- (void)_sendCoreAnalyticsForLargestMailbox:(int64_t)a3 messageCountInSecondLargestMailbox:(int64_t)a4;
- (void)_sendCoreAnalyticsForMailboxesPerAccount:(id)a3 accountTypePerAccount:(id)a4;
- (void)_sendCoreAnalyticsForMessagesPerAccount:(id)a3 accountTypePerAccount:(id)a4;
- (void)_sendCoreAnalyticsForMessagesPerInbox:(id)a3 accountTypePerAccount:(id)a4 accountPerInbox:(id)a5;
- (void)_sendEventToCoreAnalytics:(id)a3 withEventDictionary:(id)a4;
- (void)_startReportingPersistenceStatistics;
- (void)_stopReportingPersistenceStatistics;
- (void)addChangeObserver:(id)a3 withIdentifier:(id)a4;
- (void)allMailboxesWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)fetchMailboxListsWithKind:(int64_t)a3;
- (void)mailboxListInvalidated;
- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3;
- (void)removeChangeObserverWithIdentifier:(id)a3;
- (void)serverCountsForMailboxScope:(id)a3 block:(id)a4;
- (void)setChangeObserversByIdentifier:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setHookRegistry:(id)a3;
- (void)setMailboxProvider:(id)a3;
- (void)setStatisticsReportingScheduler:(id)a3;
- (void)setUidNext:(unsigned int)a3 forMailbox:(EDMailboxRowID_s)a4;
- (void)setUidValidity:(unsigned int)a3 forMailbox:(EDMailboxRowID_s)a4;
- (void)testRecordFrecencyEventsForAllMailboxes;
- (void)testResetFrecencyForAllMailboxes;
- (void)test_tearDown;
@end

@implementation EDMailboxPersistence

- (EDMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)removeChangeObserverWithIdentifier:(id)a3
{
  id v6 = a3;
  p_changeObserversByIdentifierLock = &self->_changeObserversByIdentifierLock;
  os_unfair_lock_lock(&self->_changeObserversByIdentifierLock);
  v5 = [(EDMailboxPersistence *)self changeObserversByIdentifier];
  [v5 removeObjectForKey:v6];

  os_unfair_lock_unlock(p_changeObserversByIdentifierLock);
}

- (void)addChangeObserver:(id)a3 withIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_changeObserversByIdentifierLock = &self->_changeObserversByIdentifierLock;
  os_unfair_lock_lock(&self->_changeObserversByIdentifierLock);
  v8 = [(EDMailboxPersistence *)self changeObserversByIdentifier];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [(EDMailboxPersistence *)self setChangeObserversByIdentifier:v9];
  }
  v10 = [(EDMailboxPersistence *)self changeObserversByIdentifier];
  [v10 setObject:v11 forKeyedSubscript:v6];

  os_unfair_lock_unlock(p_changeObserversByIdentifierLock);
}

- (NSMutableDictionary)changeObserversByIdentifier
{
  return self->_changeObserversByIdentifier;
}

- (id)allMailboxes
{
  v2 = [(EDMailboxPersistence *)self mailboxProvider];
  v3 = [v2 allMailboxes];

  return v3;
}

- (void)fetchMailboxListsWithKind:(int64_t)a3
{
  id v4 = [(EDMailboxPersistence *)self mailboxProvider];
  [v4 fetchMailboxesWithKind:a3];
}

- (void)allMailboxesWithCompletionHandler:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  id v4 = [(EDMailboxPersistence *)self allMailboxes];
  v5[2](v5, v4);
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDMailboxPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_44 != -1) {
    dispatch_once(&log_onceToken_44, block);
  }
  v2 = (void *)log_log_44;

  return v2;
}

void __27__EDMailboxPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_44;
  log_log_44 = (uint64_t)v1;
}

- (EDMailboxPersistence)initWithMailboxProvider:(id)a3 database:(id)a4 hookRegistry:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDMailboxPersistence;
  v12 = [(EDMailboxPersistence *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mailboxProvider, a3);
    objc_storeStrong((id *)&v13->_database, a4);
    objc_storeStrong((id *)&v13->_hookRegistry, a5);
    [v9 setDelegate:v13];
    v13->_changeObserversByIdentifierLock._os_unfair_lock_opaque = 0;
    v14 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E4F60258]);
    analyticsCollector = v13->_analyticsCollector;
    v13->_analyticsCollector = v14;
  }
  return v13;
}

- (void)dealloc
{
  [(EDMailboxPersistence *)self _stopReportingPersistenceStatistics];
  v3.receiver = self;
  v3.super_class = (Class)EDMailboxPersistence;
  [(EDMailboxPersistence *)&v3 dealloc];
}

- (id)initForTesting:(BOOL)a3
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMailboxPersistence.m", 60, @"%s can only be called from unit tests", "-[EDMailboxPersistence initForTesting:]");
  }
  v7.receiver = self;
  v7.super_class = (Class)EDMailboxPersistence;
  return [(EDMailboxPersistence *)&v7 init];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDMailboxPersistence.m", 65, @"%s can only be called from unit tests", "-[EDMailboxPersistence test_tearDown]");
  }
  id v4 = [(EDMailboxPersistence *)self mailboxProvider];
  objc_msgSend(v4, "test_tearDown");

  [(EDMailboxPersistence *)self _stopReportingPersistenceStatistics];
}

- (void)mailboxListInvalidated
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_changeObserversByIdentifierLock = &self->_changeObserversByIdentifierLock;
  os_unfair_lock_lock(&self->_changeObserversByIdentifierLock);
  id v4 = [(EDMailboxPersistence *)self changeObserversByIdentifier];
  v5 = [v4 allValues];

  os_unfair_lock_unlock(p_changeObserversByIdentifierLock);
  id v6 = [(EDMailboxPersistence *)self allMailboxes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "mailboxListChanged:", v6, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)userCreatedMailboxObjectIDs
{
  v2 = [(EDMailboxPersistence *)self allMailboxes];
  objc_super v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_33);

  return v3;
}

id __51__EDMailboxPersistence_userCreatedMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [v2 objectID];
    v5 = [v4 url];
    id v6 = [v5 path];
    char v7 = [v6 isEqualToString:@"/Notes"];

    if (v7)
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [v4 url];

      if (v3) {
        id v3 = v4;
      }
    }
  }

  return v3;
}

- (id)legacyMailboxForMailboxURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v4];
  id v6 = [(EDMailboxPersistence *)self legacyMailboxForObjectID:v5];

  return v6;
}

- (id)legacyMailboxForObjectID:(id)a3
{
  id v4 = a3;
  v5 = [(EDMailboxPersistence *)self mailboxProvider];
  id v6 = [v5 legacyMailboxForObjectID:v4];

  return v6;
}

- (id)mailboxDatabaseIDsForMailboxObjectIDs:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6 = a3;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:]", "EDMailboxPersistence.m", 122, "0");
}

- (id)mailboxDatabaseIDsForMailboxURLStrings:(id)a3
{
  id v5 = a3;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence mailboxDatabaseIDsForMailboxURLStrings:]", "EDMailboxPersistence.m", 126, "0");
}

- (EDMailboxRowID_s)mailboxDatabaseIDForMailboxURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E0190280]();
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    char v7 = [v4 absoluteString];
    uint64_t v8 = [v6 setWithObject:v7];
    uint64_t v9 = [(EDMailboxPersistence *)self mailboxDatabaseIDsForMailboxURLStrings:v8];

    uint64_t v10 = [v4 absoluteString];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    v12.var0 = [v11 unsignedLongLongValue];
  }
  else
  {
    v12.var0 = 0;
  }

  return v12;
}

- (EDMailboxRowID_s)insertDatabaseRowForMailboxURL:(id)a3
{
  id v5 = a3;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence insertDatabaseRowForMailboxURL:]", "EDMailboxPersistence.m", 143, "0");
}

- (id)mailboxURLForMailboxDatabaseID:(EDMailboxRowID_s)a3
{
}

- (void)serverCountsForMailboxScope:(id)a3 block:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v19 = 0;
  char v7 = [a3 allMailboxObjectIDsWithMailboxTypeResolver:self forExclusion:&v19];
  uint64_t v8 = v7;
  if (v19)
  {
    uint64_t v9 = [(EDMailboxPersistence *)self allMailboxObjectIDs];
    id v10 = (id)[v9 mutableCopy];

    [v10 minusSet:v8];
  }
  else
  {
    id v10 = v7;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        (*((void (**)(id, void, void, void, void))v6 + 2))(v6, *(void *)(*((void *)&v15 + 1) + 8 * i), 0, 0, 0);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (BOOL)mailboxURLIsGmailLabel:(id)a3
{
  id v5 = a3;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence mailboxURLIsGmailLabel:]", "EDMailboxPersistence.m", 171, "0");
}

- (EDMailboxPersistenceStatistics)statistics
{
}

- (void)_startReportingPersistenceStatistics
{
  id v3 = +[EDMailboxPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_INFO, "Starting to report mailbox persistence statistics.", buf, 2u);
  }

  id v4 = [(EDMailboxPersistence *)self statisticsReportingScheduler];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:@"com.apple.mail.mailboxPersistence.statisticsReportingScheduler"];
    [v4 setQualityOfService:9];
    [v4 setRepeats:1];
    [v4 setInterval:86400.0];
    [v4 setTolerance:3600.0];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__EDMailboxPersistence__startReportingPersistenceStatistics__block_invoke;
    v5[3] = &unk_1E6C019D8;
    objc_copyWeak(&v6, (id *)buf);
    [v4 scheduleWithBlock:v5];
    [(EDMailboxPersistence *)self setStatisticsReportingScheduler:v4];
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __60__EDMailboxPersistence__startReportingPersistenceStatistics__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained statistics];
    [v4 _reportPersistenceStatistics:v5];

    v6[2](v6, 1);
  }
}

- (void)_reportPersistenceStatistics:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F60D58] currentDevice];
  int v6 = [v5 isInternal];

  if (v6)
  {
    char v7 = +[EDMailboxPersistence log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v4 debugDescription];
      int v16 = 138412290;
      long long v17 = v8;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Collected mailbox persistence statistics.\n%@", (uint8_t *)&v16, 0xCu);
    }
  }
  uint64_t v9 = [v4 mailboxesPerAccount];
  id v10 = [v4 accountTypePerAccount];
  [(EDMailboxPersistence *)self _sendCoreAnalyticsForMailboxesPerAccount:v9 accountTypePerAccount:v10];

  id v11 = [v4 messagesPerAccount];
  uint64_t v12 = [v4 accountTypePerAccount];
  [(EDMailboxPersistence *)self _sendCoreAnalyticsForMessagesPerAccount:v11 accountTypePerAccount:v12];

  uint64_t v13 = [v4 messagesPerInbox];
  long long v14 = [v4 accountTypePerAccount];
  long long v15 = [v4 accountPerInbox];
  [(EDMailboxPersistence *)self _sendCoreAnalyticsForMessagesPerInbox:v13 accountTypePerAccount:v14 accountPerInbox:v15];

  -[EDMailboxPersistence _sendCoreAnalyticsForLargestMailbox:messageCountInSecondLargestMailbox:](self, "_sendCoreAnalyticsForLargestMailbox:messageCountInSecondLargestMailbox:", [v4 messagesInLargestMailbox], objc_msgSend(v4, "messagesInSecondLargestMailbox"));
}

- (void)_sendCoreAnalyticsForMailboxesPerAccount:(id)a3 accountTypePerAccount:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v13 = NSNumber;
        long long v14 = (void *)MEMORY[0x1E4F60E00];
        long long v15 = [v7 objectForKeyedSubscript:v11];
        int v16 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "roundedInteger:", objc_msgSend(v15, "count")));
        [v12 setObject:v16 forKeyedSubscript:@"mailboxesPerAccount"];

        long long v17 = [v18 objectForKeyedSubscript:v11];
        [v12 setObject:v17 forKeyedSubscript:@"accountType"];

        [(EDMailboxPersistence *)self _sendEventToCoreAnalytics:@"com.apple.mail.MailboxStatistics.mailboxesPerAccount" withEventDictionary:v12];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)_sendCoreAnalyticsForLargestMailbox:(int64_t)a3 messageCountInSecondLargestMailbox:(int64_t)a4
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:", a3));
  [v9 setObject:v7 forKeyedSubscript:@"messageCountInLargestMailbox"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F60E00], "roundedInteger:", a4));
  [v9 setObject:v8 forKeyedSubscript:@"messageCountInSecondLargestMailbox"];

  [(EDMailboxPersistence *)self _sendEventToCoreAnalytics:@"com.apple.mail.MailboxStatistics.messagesCountInLargestMailbox" withEventDictionary:v9];
}

- (void)_sendCoreAnalyticsForMessagesPerInbox:(id)a3 accountTypePerAccount:(id)a4 accountPerInbox:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v21 = a4;
  id v22 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v15 = NSNumber;
        int v16 = (void *)MEMORY[0x1E4F60E00];
        long long v17 = [v9 objectForKeyedSubscript:v13];
        id v18 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "roundedInteger:", objc_msgSend(v17, "integerValue")));
        [v14 setObject:v18 forKeyedSubscript:@"messagesPerInbox"];

        long long v19 = [v22 objectForKeyedSubscript:v13];
        long long v20 = [v21 objectForKeyedSubscript:v19];
        [v14 setObject:v20 forKeyedSubscript:@"accountType"];

        [(EDMailboxPersistence *)self _sendEventToCoreAnalytics:@"com.apple.mail.MailboxStatistics.messagesPerInbox" withEventDictionary:v14];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)_sendCoreAnalyticsForMessagesPerAccount:(id)a3 accountTypePerAccount:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v13 = NSNumber;
        id v14 = (void *)MEMORY[0x1E4F60E00];
        long long v15 = [v7 objectForKeyedSubscript:v11];
        int v16 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "roundedInteger:", objc_msgSend(v15, "integerValue")));
        [v12 setObject:v16 forKeyedSubscript:@"messagesPerAccount"];

        long long v17 = [v18 objectForKeyedSubscript:v11];
        [v12 setObject:v17 forKeyedSubscript:@"accountType"];

        [(EDMailboxPersistence *)self _sendEventToCoreAnalytics:@"com.apple.mail.MailboxStatistics.messagesPerAccount" withEventDictionary:v12];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)_sendEventToCoreAnalytics:(id)a3 withEventDictionary:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:v9 collectionData:v6];
  uint64_t v8 = [(EDMailboxPersistence *)self analyticsCollector];
  [v8 logOneTimeEvent:v7];
}

- (void)_stopReportingPersistenceStatistics
{
  id v3 = +[EDMailboxPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_INFO, "Stopping to report mailbox persistence statistics.", v4, 2u);
  }

  [(NSBackgroundActivityScheduler *)self->_statisticsReportingScheduler invalidate];
}

- (NSSet)allMailboxObjectIDs
{
  id v2 = [(EDMailboxPersistence *)self mailboxProvider];
  id v3 = [v2 allMailboxObjectIDs];

  return (NSSet *)v3;
}

- (id)mailboxObjectIDsForMailboxType:(int64_t)a3
{
  id v4 = [(EDMailboxPersistence *)self mailboxProvider];
  id v5 = [v4 mailboxObjectIDsForMailboxType:a3];

  return v5;
}

- (int64_t)mailboxTypeForMailboxObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxPersistence *)self mailboxProvider];
  int64_t v6 = [v5 mailboxTypeForMailboxObjectID:v4];

  return v6;
}

- (BOOL)createMailbox:(id)a3 parentMailboxID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence createMailbox:parentMailboxID:]", "EDMailboxPersistence.m", 304, "0");
}

- (BOOL)deleteMailbox:(id)a3
{
  id v5 = a3;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence deleteMailbox:]", "EDMailboxPersistence.m", 308, "0");
}

- (BOOL)moveMailbox:(id)a3 newParentMailboxID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence moveMailbox:newParentMailboxID:]", "EDMailboxPersistence.m", 312, "0");
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence renameMailbox:newName:]", "EDMailboxPersistence.m", 316, "0");
}

- (void)recordFrecencyEventWithMailboxesWithIDs:(id)a3
{
  id v5 = a3;
  [(EDMailboxPersistence *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EDMailboxPersistence recordFrecencyEventWithMailboxesWithIDs:]", "EDMailboxPersistence.m", 320, "0");
}

- (void)testRecordFrecencyEventsForAllMailboxes
{
}

- (void)testResetFrecencyForAllMailboxes
{
}

- (NSBackgroundActivityScheduler)statisticsReportingScheduler
{
  return self->_statisticsReportingScheduler;
}

- (void)setStatisticsReportingScheduler:(id)a3
{
}

- (void)setChangeObserversByIdentifier:(id)a3
{
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setMailboxProvider:(id)a3
{
}

- (void)setDatabase:(id)a3
{
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_changeObserversByIdentifier, 0);

  objc_storeStrong((id *)&self->_statisticsReportingScheduler, 0);
}

- (unsigned)uidValidityForMailbox:(EDMailboxRowID_s)a3
{
  id v4 = self;
  LODWORD(a3.var0) = sub_1DB5A80B8(a3.var0);

  return a3.var0;
}

- (void)setUidValidity:(unsigned int)a3 forMailbox:(EDMailboxRowID_s)a4
{
}

- (unsigned)uidNextForMailbox:(EDMailboxRowID_s)a3
{
  id v4 = self;
  LODWORD(a3.var0) = sub_1DB5A8A04(a3.var0);

  return a3.var0;
}

- (void)setUidNext:(unsigned int)a3 forMailbox:(EDMailboxRowID_s)a4
{
}

@end