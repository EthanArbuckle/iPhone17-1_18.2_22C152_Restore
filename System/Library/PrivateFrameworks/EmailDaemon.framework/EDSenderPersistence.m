@interface EDSenderPersistence
+ (EFSQLTableSchema)senderAddressesTableSchema;
+ (EFSQLTableSchema)sendersTableSchema;
+ (NSString)senderAddressesAddressColumnName;
+ (NSString)senderAddressesSenderColumnName;
+ (NSString)senderAddressesTableName;
+ (NSString)sendersBucketColumnName;
+ (NSString)sendersCategoryColumnName;
+ (NSString)sendersTableName;
+ (id)addJoinsForSenderBucketToSelectStatement:(id)a3 withSourceAddressColumn:(id)a4;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)_addAddressesWithDatabaseIDs:(id)a3 toSenderWithDatabaseID:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)_addNewSender:(id)a3 toCategoryType:(unint64_t)a4 connection:(id)a5;
- (BOOL)_addNewSenderWithAddressIDs:(id)a3 contactIdentifier:(id)a4 toBucket:(int64_t)a5 categoryType:(unint64_t)a6 connection:(id)a7 senderDatabaseID:(int64_t *)a8;
- (BOOL)_addNewSenderWithAddressIDs:(id)a3 contactIdentifier:(id)a4 toBucket:(int64_t)a5 connection:(id)a6 senderDatabaseID:(int64_t *)a7;
- (BOOL)_addNewSendersForEmailAddresses:(id)a3 toBucket:(int64_t)a4 categoryType:(unint64_t)a5 connection:(id)a6 newSenders:(id *)a7;
- (BOOL)_addNewSendersForEmailAddresses:(id)a3 toBucket:(int64_t)a4 connection:(id)a5 newSenders:(id *)a6;
- (BOOL)_moveSenderWithDatabaseID:(int64_t)a3 toBucket:(int64_t)a4 connection:(id)a5;
- (BOOL)_moveSenderWithDatabaseID:(int64_t)a3 toCategoryType:(unint64_t)a4 connection:(id)a5;
- (BOOL)bucketForSenderAddress:(id)a3 bucket:(int64_t *)a4;
- (BOOL)bucketsForSenderAddresses:(id)a3 buckets:(id *)a4;
- (CNContactStore)contactStore;
- (EDPersistenceDatabase)database;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDSenderPersistence)initWithDatabase:(id)a3 blockedSenderManager:(id)a4 hookRegistry:(id)a5 contactStore:(id)a6;
- (EFLazyCache)databaseIDToEmailAddressCache;
- (EFLazyCache)emailAddressToBucketCache;
- (EMBlockedSenderManager)blockedSenderManager;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)sentToAddressesQueue;
- (_EDSentToFilter)sentToAddressesFilter;
- (id)_addressIDsForAddresses:(id)a3 connection:(id)a4;
- (id)_addressIDsGroupedByContactsForAddressesByContact:(id)a3 withConnection:(id)a4 addressesByID:(id *)a5;
- (id)_addressesGroupedByContactForAddresses:(id)a3 unmatchedAddresses:(id *)a4 otherAddressesByContact:(id *)a5;
- (id)_addressesGroupedBySimpleAddressForAddresses:(id)a3;
- (id)_addressesToDatabaseIDsForSelect:(id)a3 addressColumns:(id)a4 connection:(id)a5 error:(id *)a6;
- (id)_addressesToDatabaseIDsForSimpleAddresses:(id)a3 connection:(id)a4;
- (id)_bucketForSenderAddress:(id)a3;
- (id)_combineDictionary:(id)a3 withDictionary:(id)a4;
- (id)_contactIdentifierForSenderWithDatabaseID:(int64_t)a3 connection:(id)a4;
- (id)_emailAddressForDatabaseID:(id)a3 connection:(id)a4;
- (id)_moveSenderWithSimpleEmailAddresses:(id)a3 toBucket:(int64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6 transactionGeneration:(int64_t *)a7;
- (id)_moveSendersWithSimpleEmailAddresses:(id)a3 toCategoryType:(unint64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6 transactionGeneration:(int64_t *)a7;
- (id)_newlyBlockedAddressesForBlockedAddressDatabaseIDs:(id)a3 connection:(id)a4;
- (id)_newlyUnblockedAddressesForBlockedAddressDatabaseIDs:(id)a3 connection:(id)a4;
- (id)_simpleAddressesForAddresses:(id)a3;
- (id)_simpleAddressesInBucket:(int64_t)a3 connection:(id)a4;
- (id)_simpleAddressesNotInBucket:(int64_t)a3 withMessagesNewerThan:(id)a4 connection:(id)a5;
- (id)relevantSendersForSearch;
- (int64_t)_bucketForSenderWithDatabaseID:(int64_t)a3 connection:(id)a4;
- (unint64_t)handleReconciliationMergeErrorForTable:(id)a3 columnName:(id)a4 statement:(id)a5 journalRowID:(id)a6 protectedRowID:(id)a7 connection:(id)a8 rowsUpdated:(unint64_t *)a9 error:(id *)a10;
- (unint64_t)userHasSentToSenderAddress:(id)a3;
- (void)_invalidateCaches;
- (void)_invalidateCachesForAddresses:(id)a3;
- (void)_loadSentToFilterFromDisk;
- (void)_moveAddressesFromSentMessagesToPrimaryForMessages:(id)a3;
- (void)_moveSenderWithEmailAddresses:(id)a3 toBucket:(int64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6;
- (void)_persistenceDidAddMessages:(id)a3;
- (void)_reloadBlockedSendersWithAddresses:(id)a3;
- (void)_setIsBlocked:(BOOL)a3 forAddresses:(id)a4;
- (void)_updateBlockedSendersWithBlockedSenderAddresses:(id)a3 newlyBlockedAddresses:(id)a4 newlyUnblockedAddresses:(id)a5;
- (void)_updateSentToFilter;
- (void)addAddresses:(id)a3 toSender:(id)a4;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)moveSender:(id)a3 toCategory:(unint64_t)a4;
- (void)moveSenderWithEmailAddresses:(id)a3 toBucket:(int64_t)a4;
- (void)moveSendersWithEmailAddresses:(id)a3 toCategoryType:(unint64_t)a4;
- (void)removeAddresses:(id)a3 fromSender:(id)a4;
- (void)scheduleRecurringActivity;
- (void)setContactStore:(id)a3;
- (void)test_tearDown;
@end

@implementation EDSenderPersistence

+ (NSString)sendersTableName
{
  return (NSString *)@"senders";
}

+ (NSString)sendersCategoryColumnName
{
  return (NSString *)@"category";
}

+ (NSString)sendersBucketColumnName
{
  return (NSString *)@"bucket";
}

+ (NSString)senderAddressesTableName
{
  return (NSString *)@"sender_addresses";
}

+ (NSString)senderAddressesSenderColumnName
{
  return (NSString *)@"sender";
}

+ (NSString)senderAddressesAddressColumnName
{
  return (NSString *)@"address";
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v7 = [a1 sendersTableSchema];
  v8 = [a1 senderAddressesTableSchema];
  v9 = [v8 columnForName:@"sender"];
  [v9 setAsForeignKeyForTable:v7 onDelete:2 onUpdate:0];

  v10 = [EDPersistenceAssociationPlaceholder alloc];
  v11 = [v8 columnForName:@"address"];
  v12 = +[EDMessagePersistence addressesTableName];
  v13 = [(EDPersistenceAssociationPlaceholder *)v10 initWithColumn:v11 tableName:v12];

  *a3 = (id)MEMORY[0x1E4F1CBF0];
  v17[0] = v13;
  *a4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v16[0] = v7;
  v16[1] = v8;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  return v14;
}

+ (EFSQLTableSchema)sendersTableSchema
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F60E80] textColumnWithName:@"contact_identifier" collation:1 nullable:1];
  v16[0] = v2;
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"bucket" nullable:0 defaultValue:&unk_1F35BAFD0];
  v16[1] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"user_initiated" nullable:0 defaultValue:MEMORY[0x1E4F1CC38]];
  void v16[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];

  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"category" nullable:1];
  v7 = [v5 arrayByAddingObject:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F08]) initWithName:@"senders" rowIDType:2 columns:v7];
  v15 = @"contact_identifier";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v8 addUniquenessConstraintForColumns:v9 conflictResolution:1];

  v14 = @"category";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v8 addIndexForColumns:v10];

  v13 = @"bucket";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v8 addIndexForColumns:v11];

  return (EFSQLTableSchema *)v8;
}

+ (EFSQLTableSchema)senderAddressesTableSchema
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sender" nullable:0];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v5 = (void *)[v2 initWithName:@"sender_addresses" rowIDType:1 rowIDAlias:@"address" columns:v4];

  v8 = @"sender";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  [v5 addIndexForColumns:v6];

  return (EFSQLTableSchema *)v5;
}

+ (id)addJoinsForSenderBucketToSelectStatement:(id)a3 withSourceAddressColumn:(id)a4
{
  id v5 = a3;
  v6 = [v5 leftOuterJoin:@"sender_addresses" sourceColumn:a4 targetColumn:@"address"];
  id v7 = (id)[v6 leftOuterJoin:@"senders" sourceColumn:@"sender" targetColumn:*MEMORY[0x1E4F60D08]];
  v8 = (void *)MEMORY[0x1E4F60EA8];
  v9 = [MEMORY[0x1E4F60E78] table:@"senders" column:@"bucket"];
  v10 = [v8 ifNull:v9 second:&unk_1F35BAFD0];
  [v5 addResult:v10 alias:@"bucket"];

  return @"bucket";
}

- (EDSenderPersistence)initWithDatabase:(id)a3 blockedSenderManager:(id)a4 hookRegistry:(id)a5 contactStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)EDSenderPersistence;
  v15 = [(EDSenderPersistence *)&v33 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeStrong((id *)&v16->_blockedSenderManager, a4);
    objc_storeStrong((id *)&v16->_hookRegistry, a5);
    objc_storeStrong((id *)&v16->_contactStore, a6);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:1000];
    emailAddressToBucketCache = v16->_emailAddressToBucketCache;
    v16->_emailAddressToBucketCache = (EFLazyCache *)v17;

    v19 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    databaseIDToEmailAddressCache = v16->_databaseIDToEmailAddressCache;
    v16->_databaseIDToEmailAddressCache = v19;

    v21 = [(EDPersistenceDatabase *)v16->_database protectedDatabasePersistence];
    [v21 registerMergeHandler:v16 forTable:@"sender_addresses"];

    v16->_contactStoreLock._os_unfair_lock_opaque = 0;
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.email.EDSenderPersistence", v23);
    processingQueue = v16->_processingQueue;
    v16->_processingQueue = (OS_dispatch_queue *)v24;

    v26 = objc_alloc_init(_EDSentToFilter);
    sentToAddressesFilter = v16->_sentToAddressesFilter;
    v16->_sentToAddressesFilter = v26;

    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.email.EDSenderPersistence.sentToAddressesQueue", v29);
    sentToAddressesQueue = v16->_sentToAddressesQueue;
    v16->_sentToAddressesQueue = (OS_dispatch_queue *)v30;

    [(EDSenderPersistence *)v16 _loadSentToFilterFromDisk];
    EFRegisterContentProtectionObserver();
    [v13 registerMessageChangeHookResponder:v16];
  }

  return v16;
}

- (CNContactStore)contactStore
{
  p_contactStoreLock = &self->_contactStoreLock;
  os_unfair_lock_lock(&self->_contactStoreLock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v5 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  id v7 = contactStore;
  os_unfair_lock_unlock(p_contactStoreLock);

  return v7;
}

- (void)scheduleRecurringActivity
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__blockedSendersDidChange_ name:*MEMORY[0x1E4F5FC78] object:0];

  id v5 = [(EDSenderPersistence *)self blockedSenderManager];
  v3 = [v5 blockedSenderEmailAddresses];
  [(EDSenderPersistence *)self _reloadBlockedSendersWithAddresses:v3];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDSenderPersistence.m", 245, @"%s can only be called from unit tests", "-[EDSenderPersistence test_tearDown]");
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  processingQueue = self->_processingQueue;

  dispatch_barrier_sync(processingQueue, &__block_literal_global_77);
}

- (id)relevantSendersForSearch
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = EDSenderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_INFO, "Gathering relevant senders for search", buf, 2u);
  }

  *(void *)buf = 0;
  id v12 = buf;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__36;
  v15 = __Block_byref_object_dispose__36;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(EDSenderPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDSenderPersistence relevantSendersForSearch]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__EDSenderPersistence_relevantSendersForSearch__block_invoke;
  v10[3] = &unk_1E6BFFFB8;
  v10[4] = buf;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v10);

  v6 = EDSenderLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*((id *)v12 + 5) count];
    *(_DWORD *)uint64_t v17 = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "Found %lu relevant senders for search", v17, 0xCu);
  }

  id v8 = *((id *)v12 + 5);
  _Block_object_dispose(buf, 8);

  return v8;
}

uint64_t __47__EDSenderPersistence_relevantSendersForSearch__block_invoke(uint64_t a1, void *a2)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [v2 dateByAddingTimeInterval:-1209600.0];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v7 = +[EDMessagePersistence messagesTableName];
  id v8 = (void *)[v6 initWithTable:v7];

  v9 = (void *)MEMORY[0x1E4F60E40];
  v10 = (void *)MEMORY[0x1E4F60E78];
  id v11 = +[EDMessagePersistence messagesDisplayDateColumnName];
  id v12 = [v10 column:v11];
  v35 = [v9 max:v12];

  [v8 addResultColumn:@"address" fromTable:@"addresses"];
  [v8 addResult:v35 alias:@"maxDate"];
  uint64_t v13 = *MEMORY[0x1E4F60D08];
  dispatch_queue_t v30 = [v8 leftOuterJoin:@"recipients" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"message"];
  v31 = [v30 leftOuterJoin:@"addresses" sourceColumn:@"address" targetColumn:v13];
  v32 = [v31 leftOuterJoin:@"sender_addresses" sourceColumn:v13 targetColumn:@"address"];
  id v14 = (id)[v32 leftOuterJoin:@"senders" sourceColumn:@"sender" targetColumn:v13];
  v15 = (void *)MEMORY[0x1E4F60E48];
  id v16 = [MEMORY[0x1E4F60E78] table:@"senders" column:@"bucket"];
  uint64_t v17 = [v16 equalTo:&unk_1F35BAFE8];
  v38[0] = v17;
  uint64_t v18 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v19 = +[EDMessagePersistence messagesTableName];
  v20 = +[EDMessagePersistence messagesDisplayDateColumnName];
  v21 = [v18 table:v19 column:v20];
  v22 = [NSNumber numberWithDouble:v5];
  v23 = [v21 greaterThanEqualTo:v22];
  v38[1] = v23;
  dispatch_queue_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v25 = [v15 combined:v24];
  [v8 setWhere:v25];

  [v8 groupByColumn:@"address" fromTable:@"addresses"];
  [v8 orderBy:v35 ascending:0];
  [v8 setLimit:500];
  id v36 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_78;
  v37[3] = &unk_1E6BFF4C8;
  v37[4] = *(void *)(a1 + 32);
  uint64_t v26 = [v34 executeSelectStatement:v8 withBlock:v37 error:&v36];
  id v27 = v36;
  if (v27)
  {
    v28 = EDSenderLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v27, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_cold_1();
    }
  }
  return v26;
}

void __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_78(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 objectAtIndexedSubscript:0];
  v3 = [v4 stringValue];
  [v2 addObject:v3];
}

- (void)_invalidateCachesForAddresses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        v9 = [(EDSenderPersistence *)self emailAddressToBucketCache];
        v10 = [v8 emailAddressValue];
        [v9 removeObjectForKey:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v11 = [(EDSenderPersistence *)self databaseIDToEmailAddressCache];
  [v11 removeAllObjects];
}

- (void)_invalidateCaches
{
  id v3 = [(EDSenderPersistence *)self emailAddressToBucketCache];
  [v3 removeAllObjects];

  id v4 = [(EDSenderPersistence *)self databaseIDToEmailAddressCache];
  [v4 removeAllObjects];
}

- (BOOL)bucketForSenderAddress:(id)a3 bucket:(int64_t *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 emailAddressValue];
  if (v7)
  {
    id v8 = [(EDSenderPersistence *)self emailAddressToBucketCache];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __53__EDSenderPersistence_bucketForSenderAddress_bucket___block_invoke;
    uint64_t v17 = &unk_1E6C045C0;
    uint64_t v18 = self;
    id v9 = v6;
    id v19 = v9;
    v10 = [v8 objectForKey:v7 generator:&v14];

    id v11 = EDSenderLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_INFO, "EmailAddress:%@ bucket is %@", buf, 0x16u);
    }

    BOOL v12 = v10 != 0;
    if (a4 && v10) {
      *a4 = objc_msgSend(v10, "integerValue", v14, v15, v16, v17, v18);
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    BOOL v12 = 1;
  }

  return v12;
}

uint64_t __53__EDSenderPersistence_bucketForSenderAddress_bucket___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bucketForSenderAddress:*(void *)(a1 + 40)];
}

- (id)_bucketForSenderAddress:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 1;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__36;
  uint64_t v18 = __Block_byref_object_dispose__36;
  id v19 = 0;
  uint64_t v5 = [(EDSenderPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDSenderPersistence _bucketForSenderAddress:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__EDSenderPersistence__bucketForSenderAddress___block_invoke;
  v10[3] = &unk_1E6C05B38;
  id v7 = v4;
  id v11 = v7;
  BOOL v12 = v20;
  long long v13 = &v14;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);

  return v8;
}

BOOL __47__EDSenderPersistence__bucketForSenderAddress___block_invoke(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 protectedDatabaseAttached])
  {
    uint64_t v4 = +[EDMessagePersistence databaseIDForEmailAddress:*(void *)(a1 + 32) connection:v3];
    uint64_t v5 = *MEMORY[0x1E4F5FCC8];
    if (v4 == *MEMORY[0x1E4F5FCC8])
    {
      v23 = [*(id *)(a1 + 32) emailAddressValue];
      id v6 = [v23 simpleAddress];
      id v7 = v6;
      if (!v6)
      {
        id v7 = [*(id *)(a1 + 32) stringValue];
      }
      v30[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      id v9 = +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:v8 connection:v3];
      v10 = [v9 firstObject];

      if (!v6) {
      if (v10)
      }
        uint64_t v4 = [v10 longLongValue];
    }
    if (v4 == v5)
    {
      id v11 = 0;
    }
    else
    {
      long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"bucket" table:@"senders"];
      id v14 = (id)[v13 join:@"sender_addresses" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"sender"];
      uint64_t v15 = [MEMORY[0x1E4F60E78] table:@"sender_addresses" column:@"address"];
      uint64_t v16 = [NSNumber numberWithLongLong:v4];
      uint64_t v17 = [v15 equalTo:v16];
      [v13 setWhere:v17];

      id v24 = 0;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__EDSenderPersistence__bucketForSenderAddress___block_invoke_2;
      v25[3] = &unk_1E6BFF4C8;
      v25[4] = *(void *)(a1 + 48);
      LOBYTE(v15) = [v3 executeSelectStatement:v13 withBlock:v25 error:&v24];
      id v11 = v24;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v15;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      if (!*(void *)(v18 + 40))
      {
        *(void *)(v18 + 40) = &unk_1F35BAFD0;
      }
    }
    id v19 = EDSenderLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_INFO, "DB result for senders.bucket for EmailAddress:%@ is %@.", buf, 0x16u);
    }

    BOOL v12 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

void __47__EDSenderPersistence__bucketForSenderAddress___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectForKeyedSubscript:@"bucket"];
  uint64_t v4 = [v3 numberValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)bucketsForSenderAddresses:(id)a3 buckets:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v16;
  uint64_t v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v16);
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v19 = 0;
        if (![(EDSenderPersistence *)self bucketForSenderAddress:v9 bucket:&v19])
        {
          if (a4) {
            *a4 = 0;
          }

          BOOL v14 = 0;
          goto LABEL_17;
        }
        v10 = [NSNumber numberWithInteger:v19];
        id v11 = [v5 objectForKey:v10];

        if (!v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
          long long v13 = [NSNumber numberWithInteger:v19];
          [v5 setObject:v12 forKey:v13];

          id v11 = (void *)v12;
        }
        [v11 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (a4) {
    *a4 = v5;
  }
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (void)moveSender:(id)a3 toCategory:(unint64_t)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(EDSenderPersistence *)self hookRegistry];
  v25[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v7 persistenceWillChangeSenders:v8];

  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v9 = [(EDSenderPersistence *)self database];
  v10 = [NSString stringWithUTF8String:"-[EDSenderPersistence moveSender:toCategory:]"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__EDSenderPersistence_moveSender_toCategory___block_invoke;
  v15[3] = &unk_1E6C00008;
  uint64_t v18 = &v20;
  id v11 = v6;
  id v16 = v11;
  uint64_t v17 = self;
  unint64_t v19 = a4;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  uint64_t v12 = [v11 addresses];
  [(EDSenderPersistence *)self _invalidateCachesForAddresses:v12];

  long long v13 = [(EDSenderPersistence *)self hookRegistry];
  id v24 = v11;
  BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v13 persistenceDidChangeSenders:v14 generation:v21[3]];

  _Block_object_dispose(&v20, 8);
}

uint64_t __45__EDSenderPersistence_moveSender_toCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 transactionGeneration];
  uint64_t v4 = [*(id *)(a1 + 32) databaseID];
  if (v4 == *MEMORY[0x1E4F5FCC8]) {
    uint64_t v5 = [*(id *)(a1 + 40) _addNewSender:*(void *)(a1 + 32) toCategoryType:*(void *)(a1 + 56) connection:v3];
  }
  else {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "_moveSenderWithDatabaseID:toCategoryType:connection:", objc_msgSend(*(id *)(a1 + 32), "databaseID"), *(void *)(a1 + 56), v3);
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)moveSendersWithEmailAddresses:(id)a3 toCategoryType:(unint64_t)a4
{
  v9[4] = a4;
  uint64_t v10 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke;
  v9[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  uint64_t v6 = objc_msgSend(a3, "ef_compactMap:", v9);
  uint64_t v7 = [(EDSenderPersistence *)self _moveSendersWithSimpleEmailAddresses:v6 toCategoryType:a4 sync:1 userInitiated:1 transactionGeneration:&v10];
  [(EDSenderPersistence *)self _invalidateCaches];
  id v8 = [(EDSenderPersistence *)self hookRegistry];
  [v8 persistenceDidChangeSenders:v7 generation:v10];
}

id __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke(uint64_t a1, void *a2)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 emailAddressValue];
  uint64_t v5 = [v4 simpleAddress];

  if (!v5)
  {
    uint64_t v6 = EDSenderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v3];
      __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke_cold_1(v7, a1, (uint64_t)v9, v6);
    }
  }

  return v5;
}

- (void)moveSenderWithEmailAddresses:(id)a3 toBucket:(int64_t)a4
{
}

- (void)_moveSenderWithEmailAddresses:(id)a3 toBucket:(int64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  void v15[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(EDSenderPersistence *)self _simpleAddressesForAddresses:v10];
  v15[0] = 0;
  uint64_t v12 = [(EDSenderPersistence *)self _moveSenderWithSimpleEmailAddresses:v11 toBucket:a4 sync:v7 userInitiated:v6 transactionGeneration:v15];
  if (!v12)
  {
    long long v13 = EDSenderLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_map:", &__block_literal_global_88);
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _moveSenderWithEmailAddresses:toBucket:sync:userInitiated:]();
    }
  }
  [(EDSenderPersistence *)self _invalidateCaches];
  [(EDSenderPersistence *)self _setIsBlocked:a4 == 50 forAddresses:v10];
  BOOL v14 = [(EDSenderPersistence *)self hookRegistry];
  [v14 persistenceDidChangeSenders:v12 generation:v15[0]];
}

id __81__EDSenderPersistence__moveSenderWithEmailAddresses_toBucket_sync_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v2, "ef_publicDescription");
  }
  else {
  id v3 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v2];
  }

  return v3;
}

- (id)_moveSendersWithSimpleEmailAddresses:(id)a3 toCategoryType:(unint64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6 transactionGeneration:(int64_t *)a7
{
  id v10 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = [(EDSenderPersistence *)self database];
  long long v13 = [NSString stringWithUTF8String:"-[EDSenderPersistence _moveSendersWithSimpleEmailAddresses:toCategoryType:sync:userInitiated:transactionGeneration:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke;
  void v20[3] = &unk_1E6C03128;
  id v24 = &v26;
  id v14 = v10;
  id v21 = v14;
  uint64_t v22 = self;
  unint64_t v25 = a4;
  id v15 = v11;
  id v23 = v15;
  int v16 = objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v20);

  if (a7) {
    *a7 = v27[3];
  }
  if (v16) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);

  return v18;
}

BOOL __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke(void *a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  *(void *)(*(void *)(a1[7] + 8) + 24) = [v34 transactionGeneration];
  v39 = +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:a1[4] connection:v34];
  id v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v39];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"sender" table:@"sender_addresses"];
  [v35 addResultColumn:@"address"];
  id v3 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v4 = [v3 in:v39];
  [v35 setWhere:v4];

  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2;
  v61[3] = &unk_1E6C01720;
  uint64_t v5 = a1;
  v61[4] = a1[5];
  id v6 = v34;
  id v62 = v6;
  id v38 = v33;
  id v63 = v38;
  id v43 = v37;
  id v64 = v43;
  id v7 = v36;
  id v65 = v7;
  [v6 executeSelectStatement:v35 withBlock:v61 error:0];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v12 = [(id)v5[5] _emailAddressForDatabaseID:v11 connection:v6];
        long long v13 = [v12 emailAddressValue];
        id v14 = [v13 simpleAddress];
        id v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [v12 stringValue];
        }
        uint64_t v17 = v16;

        id v18 = [v43 objectForKeyedSubscript:v17];
        if (v18)
        {
          unint64_t v19 = [v42 objectForKeyedSubscript:v18];
          uint64_t v20 = v19;
          if (v19)
          {
            [v19 addObject:v11];
          }
          else
          {
            uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
            [v42 setObject:v20 forKeyedSubscript:v18];
          }
        }
        else
        {
          uint64_t v20 = [v12 stringValue];
          [v40 setObject:v11 forKeyedSubscript:v20];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v8);
  }

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 1;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_94;
  v50[3] = &unk_1E6C05FD0;
  uint64_t v21 = v5[5];
  v52 = &v53;
  v50[4] = v21;
  id v22 = v6;
  id v51 = v22;
  [v42 enumerateKeysAndObjectsUsingBlock:v50];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_96;
  v45[3] = &unk_1E6C05FF8;
  v45[4] = v5[5];
  id v23 = v22;
  id v46 = v23;
  uint64_t v24 = v5[8];
  v48 = &v53;
  uint64_t v49 = v24;
  id v47 = (id)v5[6];
  [v38 enumerateKeysAndObjectsUsingBlock:v45];
  if (*((unsigned char *)v54 + 24))
  {
    unint64_t v25 = [(id)v5[5] hookRegistry];
    uint64_t v26 = [v40 allKeys];
    [v25 persistenceWillChangeSendersForAddresses:v26];

    uint64_t v27 = (void *)v5[5];
    uint64_t v28 = v5[8];
    id v44 = 0;
    char v29 = [v27 _addNewSendersForEmailAddresses:v40 toBucket:0 categoryType:v28 connection:v23 newSenders:&v44];
    id v30 = v44;
    *((unsigned char *)v54 + 24) = v29;
    [(id)v5[6] addObjectsFromArray:v30];

    BOOL v31 = *((unsigned char *)v54 + 24) != 0;
  }
  else
  {
    BOOL v31 = 0;
  }

  _Block_object_dispose(&v53, 8);
  return v31;
}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 numberValue];

  id v6 = [v3 objectAtIndexedSubscript:1];
  id v7 = [v6 numberValue];

  uint64_t v8 = [*(id *)(a1 + 32) _emailAddressForDatabaseID:v7 connection:*(void *)(a1 + 40)];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
    id v10 = v9;
    if (v9)
    {
      [v9 addObject:v8];
    }
    else
    {
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
    }
    uint64_t v11 = [v8 emailAddressValue];
    uint64_t v12 = [v11 simpleAddress];
    if (v12)
    {
    }
    else
    {
      uint64_t v12 = [v8 stringValue];

      if (!v12)
      {
        long long v13 = EDSenderLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v15 = [v7 unsignedLongLongValue];
          __int16 v16 = 2048;
          uint64_t v17 = [v5 unsignedLongLongValue];
          __int16 v18 = 2114;
          unint64_t v19 = v8;
          _os_log_error_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_ERROR, "Address with ID %llu (sender ID %llu) has no string representation: %{public}@", buf, 0x20u);
        }

        uint64_t v12 = 0;
        goto LABEL_11;
      }
    }
    [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v12];
LABEL_11:

    goto LABEL_12;
  }
  id v10 = EDSenderLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_cold_1((uint64_t)buf, [v7 unsignedLongLongValue], objc_msgSend(v5, "unsignedLongLongValue"));
  }
LABEL_12:

  [*(id *)(a1 + 64) removeObject:v7];
}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_94(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _addAddressesWithDatabaseIDs:v7 toSenderWithDatabaseID:v8 connection:*(void *)(a1 + 40) error:0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_96(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 longLongValue];
  uint64_t v10 = [*(id *)(a1 + 32) _bucketForSenderWithDatabaseID:v9 connection:*(void *)(a1 + 40)];
  uint64_t v11 = [*(id *)(a1 + 32) _contactIdentifierForSenderWithDatabaseID:v9 connection:*(void *)(a1 + 40)];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F604A8]) initWithDatabaseID:v9 addresses:v8 contactIdentifier:v11 bucket:v10];
  long long v13 = [*(id *)(a1 + 32) hookRegistry];
  v15[0] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v13 persistenceWillChangeSenders:v14];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _moveSenderWithDatabaseID:v9 toCategoryType:*(void *)(a1 + 64) connection:*(void *)(a1 + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    [*(id *)(a1 + 48) addObject:v12];
  }
  else {
    *a4 = 1;
  }
}

- (id)_moveSenderWithSimpleEmailAddresses:(id)a3 toBucket:(int64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6 transactionGeneration:(int64_t *)a7
{
  id v10 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = [(EDSenderPersistence *)self database];
  long long v13 = [NSString stringWithUTF8String:"-[EDSenderPersistence _moveSenderWithSimpleEmailAddresses:toBucket:sync:userInitiated:transactionGeneration:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke;
  void v20[3] = &unk_1E6C03128;
  uint64_t v24 = &v26;
  id v14 = v10;
  id v21 = v14;
  id v22 = self;
  int64_t v25 = a4;
  id v15 = v11;
  id v23 = v15;
  int v16 = objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v20);

  if (a7) {
    *a7 = v27[3];
  }
  if (v16) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);

  return v18;
}

BOOL __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke(void *a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  *(void *)(*(void *)(a1[7] + 8) + 24) = [v34 transactionGeneration];
  v39 = +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:a1[4] connection:v34];
  id v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v39];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"sender" table:@"sender_addresses"];
  [v35 addResultColumn:@"address"];
  id v3 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v4 = [v3 in:v39];
  [v35 setWhere:v4];

  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2;
  v61[3] = &unk_1E6C01720;
  uint64_t v5 = a1;
  v61[4] = a1[5];
  id v6 = v34;
  id v62 = v6;
  id v38 = v33;
  id v63 = v38;
  id v43 = v37;
  id v64 = v43;
  id v7 = v36;
  id v65 = v7;
  [v6 executeSelectStatement:v35 withBlock:v61 error:0];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v12 = [(id)v5[5] _emailAddressForDatabaseID:v11 connection:v6];
        long long v13 = [v12 emailAddressValue];
        id v14 = [v13 simpleAddress];
        id v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [v12 stringValue];
        }
        uint64_t v17 = v16;

        id v18 = [v43 objectForKeyedSubscript:v17];
        if (v18)
        {
          unint64_t v19 = [v42 objectForKeyedSubscript:v18];
          uint64_t v20 = v19;
          if (v19)
          {
            [v19 addObject:v11];
          }
          else
          {
            uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
            [v42 setObject:v20 forKeyedSubscript:v18];
          }
        }
        else
        {
          uint64_t v20 = [v12 stringValue];
          [v40 setObject:v11 forKeyedSubscript:v20];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v8);
  }

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 1;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_98;
  v50[3] = &unk_1E6C05FD0;
  uint64_t v21 = v5[5];
  v52 = &v53;
  v50[4] = v21;
  id v22 = v6;
  id v51 = v22;
  [v42 enumerateKeysAndObjectsUsingBlock:v50];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2_99;
  v45[3] = &unk_1E6C05FF8;
  v45[4] = v5[5];
  id v23 = v22;
  id v46 = v23;
  uint64_t v24 = v5[8];
  v48 = &v53;
  uint64_t v49 = v24;
  id v47 = (id)v5[6];
  [v38 enumerateKeysAndObjectsUsingBlock:v45];
  if (*((unsigned char *)v54 + 24))
  {
    int64_t v25 = [(id)v5[5] hookRegistry];
    uint64_t v26 = [v40 allKeys];
    [v25 persistenceWillChangeSendersForAddresses:v26];

    uint64_t v27 = (void *)v5[5];
    uint64_t v28 = v5[8];
    id v44 = 0;
    char v29 = [v27 _addNewSendersForEmailAddresses:v40 toBucket:v28 connection:v23 newSenders:&v44];
    id v30 = v44;
    *((unsigned char *)v54 + 24) = v29;
    [(id)v5[6] addObjectsFromArray:v30];

    BOOL v31 = *((unsigned char *)v54 + 24) != 0;
  }
  else
  {
    BOOL v31 = 0;
  }

  _Block_object_dispose(&v53, 8);
  return v31;
}

void __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 numberValue];

  id v6 = [v3 objectAtIndexedSubscript:1];
  id v7 = [v6 numberValue];

  uint64_t v8 = [*(id *)(a1 + 32) _emailAddressForDatabaseID:v7 connection:*(void *)(a1 + 40)];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
    id v10 = v9;
    if (v9)
    {
      [v9 addObject:v8];
    }
    else
    {
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
    }
    uint64_t v11 = [v8 emailAddressValue];
    uint64_t v12 = [v11 simpleAddress];
    if (v12)
    {
    }
    else
    {
      uint64_t v12 = [v8 stringValue];

      if (!v12)
      {
        long long v13 = EDSenderLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v15 = [v7 unsignedLongLongValue];
          __int16 v16 = 2048;
          uint64_t v17 = [v5 unsignedLongLongValue];
          __int16 v18 = 2114;
          unint64_t v19 = v8;
          _os_log_error_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_ERROR, "Address with ID %llu (sender ID %llu) has no string representation: %{public}@", buf, 0x20u);
        }

        uint64_t v12 = 0;
        goto LABEL_11;
      }
    }
    [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v12];
LABEL_11:

    goto LABEL_12;
  }
  id v10 = EDSenderLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_cold_1((uint64_t)buf, [v7 unsignedLongLongValue], objc_msgSend(v5, "unsignedLongLongValue"));
  }
LABEL_12:

  [*(id *)(a1 + 64) removeObject:v7];
}

void __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_98(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _addAddressesWithDatabaseIDs:v7 toSenderWithDatabaseID:v8 connection:*(void *)(a1 + 40) error:0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

void __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2_99(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 longLongValue];
  uint64_t v10 = [*(id *)(a1 + 32) _bucketForSenderWithDatabaseID:v9 connection:*(void *)(a1 + 40)];
  uint64_t v11 = [*(id *)(a1 + 32) _contactIdentifierForSenderWithDatabaseID:v9 connection:*(void *)(a1 + 40)];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F604A8]) initWithDatabaseID:v9 addresses:v8 contactIdentifier:v11 bucket:v10];
  long long v13 = [*(id *)(a1 + 32) hookRegistry];
  v15[0] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v13 persistenceWillChangeSenders:v14];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _moveSenderWithDatabaseID:v9 toBucket:*(void *)(a1 + 64) connection:*(void *)(a1 + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [v12 setBucket:*(void *)(a1 + 64)];
    [*(id *)(a1 + 48) addObject:v12];
  }
  else
  {
    *a4 = 1;
  }
}

- (void)addAddresses:(id)a3 toSender:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 databaseID];
  if (v9 == *MEMORY[0x1E4F5FCC8])
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"EDSenderPersistence.m" lineNumber:696 description:@"Sender must have valid database ID"];
  }
  uint64_t v10 = [(EDSenderPersistence *)self hookRegistry];
  [v10 persistenceWillAddAddresses:v7 toSender:v8];

  uint64_t v11 = [v8 bucket];
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v12 = [(EDSenderPersistence *)self database];
  long long v13 = [NSString stringWithUTF8String:"-[EDSenderPersistence addAddresses:toSender:]"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __45__EDSenderPersistence_addAddresses_toSender___block_invoke;
  v26[3] = &unk_1E6C00008;
  uint64_t v28 = &v30;
  v26[4] = self;
  id v14 = v7;
  id v27 = v14;
  uint64_t v29 = v9;
  int v15 = objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v26);

  if (v15)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v8, "addAddress:", *(void *)(*((void *)&v22 + 1) + 8 * v19++), (void)v22);
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v17);
    }
  }
  [(EDSenderPersistence *)self _setIsBlocked:v11 == 50 forAddresses:v14];
  [(EDSenderPersistence *)self _invalidateCaches];
  uint64_t v20 = [(EDSenderPersistence *)self hookRegistry];
  [v20 persistenceDidAddAddresses:v14 toSender:v8 generation:v31[3]];

  _Block_object_dispose(&v30, 8);
}

uint64_t __45__EDSenderPersistence_addAddresses_toSender___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 transactionGeneration];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"sender_addresses"];
  [*(id *)(a1 + 32) _addressIDsForAddresses:*(void *)(a1 + 40) connection:v12];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        id v8 = [v3 addValue];
        [v8 setObject:v7 forKeyedSubscript:@"address"];
        uint64_t v9 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
        [v8 setObject:v9 forKeyedSubscript:@"sender"];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [v12 executeInsertStatement:v3 error:0];
  return v10;
}

- (void)removeAddresses:(id)a3 fromSender:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 databaseID];
  if (v9 == *MEMORY[0x1E4F5FCC8])
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"EDSenderPersistence.m" lineNumber:731 description:@"Sender must have valid database ID"];
  }
  uint64_t v10 = [(EDSenderPersistence *)self hookRegistry];
  [v10 persistenceWillRemoveAddresses:v7 fromSender:v8];

  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v11 = [(EDSenderPersistence *)self database];
  id v12 = [NSString stringWithUTF8String:"-[EDSenderPersistence removeAddresses:fromSender:]"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __50__EDSenderPersistence_removeAddresses_fromSender___block_invoke;
  v25[3] = &unk_1E6C000A8;
  id v27 = &v28;
  v25[4] = self;
  id v13 = v8;
  id v26 = v13;
  int v14 = objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v25);

  if (v14)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(v13, "removeAddress:", *(void *)(*((void *)&v21 + 1) + 8 * v18++), (void)v21);
        }
        while (v16 != v18);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
      }
      while (v16);
    }
  }
  -[EDSenderPersistence _setIsBlocked:forAddresses:](self, "_setIsBlocked:forAddresses:", 0, v7, (void)v21);
  [(EDSenderPersistence *)self _invalidateCaches];
  uint64_t v19 = [(EDSenderPersistence *)self hookRegistry];
  [v19 persistenceDidRemoveAddresses:v7 fromSender:v13 generation:v29[3]];

  _Block_object_dispose(&v28, 8);
}

uint64_t __50__EDSenderPersistence_removeAddresses_fromSender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 transactionGeneration];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) addresses];
  uint64_t v6 = [v4 _addressIDsForAddresses:v5 connection:v3];

  id v7 = objc_alloc(MEMORY[0x1E4F60E98]);
  id v8 = [MEMORY[0x1E4F60E78] column:@"address"];
  uint64_t v9 = [v8 in:v6];
  uint64_t v10 = (void *)[v7 initWithTable:@"sender_addresses" where:v9];

  uint64_t v11 = [v3 executeDeleteStatement:v10 error:0];
  return v11;
}

- (unint64_t)userHasSentToSenderAddress:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
  {
    unint64_t v5 = 1;
    goto LABEL_24;
  }
  uint64_t v21 = 0;
  if (![(EDSenderPersistence *)self bucketForSenderAddress:v4 bucket:&v21])
  {
    *(void *)buf = 0;
    *(void *)&long long v23 = buf;
    *((void *)&v23 + 1) = 0x2020000000;
    uint64_t v24 = 0;
    id v7 = [(EDSenderPersistence *)self sentToAddressesQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __50__EDSenderPersistence_userHasSentToSenderAddress___block_invoke;
    uint64_t v17 = &unk_1E6C00A40;
    uint64_t v20 = buf;
    uint64_t v18 = self;
    id v8 = v4;
    id v19 = v8;
    dispatch_sync(v7, &v14);

    uint64_t v9 = *(void *)(v23 + 24);
    if (v9)
    {
      if (v9 == 1)
      {
        uint64_t v10 = EDSenderLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "emailAddressValue", v14, v15, v16, v17, v18);
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[EDSenderPersistence userHasSentToSenderAddress:]();
        }
        unint64_t v5 = 1;
        goto LABEL_21;
      }
      if (v9 != 2)
      {
        unint64_t v5 = 0;
        goto LABEL_23;
      }
      uint64_t v10 = EDSenderLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "emailAddressValue", v14, v15, v16, v17, v18);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSenderPersistence userHasSentToSenderAddress:]();
      }
    }
    else
    {
      uint64_t v10 = EDSenderLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "emailAddressValue", v14, v15, v16, v17, v18);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSenderPersistence userHasSentToSenderAddress:]();
      }
    }
    unint64_t v5 = 0;
LABEL_21:

LABEL_23:
    _Block_object_dispose(buf, 8);
    goto LABEL_24;
  }
  if (v21 == 200) {
    unint64_t v5 = 2;
  }
  else {
    unint64_t v5 = 1;
  }
  uint64_t v6 = EDSenderLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v4 emailAddressValue];
    id v13 = objc_msgSend(v12, "ef_publicDescription");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v5;
    LOWORD(v23) = 2114;
    *(void *)((char *)&v23 + 2) = v13;
    _os_log_debug_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEBUG, "Returning 'sentTo' result %u from protected database for address: %{public}@", buf, 0x12u);
  }
LABEL_24:

  return v5;
}

void __50__EDSenderPersistence_userHasSentToSenderAddress___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) sentToAddressesFilter];
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  id v7 = v6;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 mayHaveSentToSimpleAddress:v7];
}

- (void)_loadSentToFilterFromDisk
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [(EDSenderPersistence *)self sentToAddressesQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__EDSenderPersistence__loadSentToFilterFromDisk__block_invoke;
  v4[3] = &unk_1E6C00E78;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__EDSenderPersistence__loadSentToFilterFromDisk__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained sentToAddressesFilter];
    [v2 loadFromDisk];

    id WeakRetained = v3;
  }
}

- (void)_updateSentToFilter
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to request protected database background processing: %{public}@", v5);
}

uint64_t __42__EDSenderPersistence__updateSentToFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 protectedDatabaseAttached])
  {
    uint64_t v4 = [*(id *)(a1 + 32) _simpleAddressesInBucket:200 connection:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 168);
    uint64_t v9 = [v7 _simpleAddressesNotInBucket:200 withMessagesNewerThan:v8 connection:v3];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  return 1;
}

void __42__EDSenderPersistence__updateSentToFilter__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained sentToAddressesFilter];
    [v2 updateWithSentToSimpleAddresses:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) recentNotSentToSimpleAddresses:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    [*(id *)(a1 + 32) invalidate];
  }
}

- (BOOL)_addNewSender:(id)a3 toCategoryType:(unint64_t)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 addresses];
  uint64_t v11 = [(EDSenderPersistence *)self _addressIDsForAddresses:v10 connection:v9];

  uint64_t v14 = *MEMORY[0x1E4F5FCC8];
  id v12 = [v8 contactIdentifier];
  LOBYTE(a4) = [(EDSenderPersistence *)self _addNewSenderWithAddressIDs:v11 contactIdentifier:v12 toBucket:0 categoryType:a4 connection:v9 senderDatabaseID:&v14];

  [v8 setDatabaseID:v14];
  return a4;
}

- (id)_addressIDsForAddresses:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = [(EDSenderPersistence *)self _simpleAddressesForAddresses:a3];
  id v8 = +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:v7 connection:v6];

  return v8;
}

- (BOOL)_addNewSenderWithAddressIDs:(id)a3 contactIdentifier:(id)a4 toBucket:(int64_t)a5 connection:(id)a6 senderDatabaseID:(int64_t *)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"senders"];
  uint64_t v14 = v11;
  if (!v11)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  [v13 setObject:v14 forKeyedSubscript:@"contact_identifier"];
  if (!v11) {

  }
  uint64_t v15 = [NSNumber numberWithInteger:a5];
  [v13 setObject:v15 forKeyedSubscript:@"bucket"];

  [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"user_initiated"];
  id v61 = 0;
  LODWORD(v15) = [v12 executeInsertStatement:v13 error:&v61];
  id v16 = v61;
  id v17 = v16;
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v18 = *MEMORY[0x1E4F5FCC8];
  uint64_t v60 = *MEMORY[0x1E4F5FCC8];
  if (v15)
  {
    v50 = self;
    uint64_t v19 = [v12 lastInsertedDatabaseID];
    v58[3] = v19;
    goto LABEL_7;
  }
  if (!v11) {
    goto LABEL_29;
  }
  v50 = self;
  uint64_t v29 = [v16 domain];
  if (![v29 isEqualToString:*MEMORY[0x1E4F60D10]] || objc_msgSend(v17, "code") != 19)
  {
    id v22 = v17;
    goto LABEL_26;
  }
  uint64_t v30 = [v17 userInfo];
  uint64_t v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F60D18]];
  BOOL v32 = [v31 integerValue] == 2067;

  if (!v32) {
    goto LABEL_29;
  }
  id v33 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v34 = *MEMORY[0x1E4F60D08];
  uint64_t v49 = (void *)[v33 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"senders"];
  uint64_t v35 = [MEMORY[0x1E4F60E78] column:@"contact_identifier"];
  id v36 = [v35 equalTo:v11];
  [v49 setWhere:v36];

  id v55 = v17;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __106__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_connection_senderDatabaseID___block_invoke;
  v56[3] = &unk_1E6BFF4C8;
  v56[4] = &v57;
  LODWORD(v36) = [v12 executeSelectStatement:v49 withBlock:v56 error:&v55];
  id v22 = v55;

  if (!v36)
  {
LABEL_24:
    uint64_t v29 = v49;
LABEL_26:

    goto LABEL_30;
  }
  if (v58[3] == v18)
  {
    id v37 = EDSenderLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[EDSenderPersistence _addNewSenderWithAddressIDs:contactIdentifier:toBucket:connection:senderDatabaseID:]((uint64_t)v11, v37);
    }

    goto LABEL_24;
  }
  id v38 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"senders"];
  v39 = [NSNumber numberWithInteger:a5];
  [v38 setObject:v39 forKeyedSubscript:@"bucket"];

  [v38 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"user_initiated"];
  id v40 = [MEMORY[0x1E4F60E78] column:v34];
  v41 = [NSNumber numberWithLongLong:v58[3]];
  id v42 = [v40 equalTo:v41];
  [v38 setWhereClause:v42];

  id v54 = v22;
  int v43 = [v12 executeUpdateStatement:v38 error:&v54];
  id v17 = v54;

  if (!v43)
  {
LABEL_29:
    id v22 = v17;
    goto LABEL_30;
  }
  uint64_t v19 = v58[3];
LABEL_7:
  uint64_t v20 = [NSNumber numberWithLongLong:v19];
  id v53 = v17;
  BOOL v21 = [(EDSenderPersistence *)v50 _addAddressesWithDatabaseIDs:v52 toSenderWithDatabaseID:v20 connection:v12 error:&v53];
  id v22 = v53;

  if (v21)
  {
    long long v23 = EDSenderLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (__CFString *)v58[3];
      uint64_t v25 = @"default";
      if (a5 == 200) {
        uint64_t v25 = @"sentTo";
      }
      if (a5 == 50) {
        uint64_t v25 = @"blocked";
      }
      id v26 = v25;
      uint64_t v27 = [v52 count];
      *(_DWORD *)buf = 134219010;
      id v63 = v24;
      __int16 v64 = 2114;
      id v65 = v26;
      __int16 v66 = 2048;
      uint64_t v67 = v27;
      __int16 v68 = 2114;
      id v69 = v52;
      __int16 v70 = 2114;
      id v71 = v11;
      _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Added new sender (%lld) to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@", buf, 0x34u);
    }
    BOOL v28 = 1;
    goto LABEL_32;
  }
LABEL_30:
  long long v23 = EDSenderLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v45 = @"default";
    if (a5 == 200) {
      v45 = @"sentTo";
    }
    if (a5 == 50) {
      v45 = @"blocked";
    }
    id v46 = v45;
    uint64_t v47 = [v52 count];
    v48 = objc_msgSend(v22, "ef_publicDescription");
    *(_DWORD *)buf = 138544386;
    id v63 = v46;
    __int16 v64 = 2048;
    id v65 = (__CFString *)v47;
    __int16 v66 = 2114;
    uint64_t v67 = (uint64_t)v52;
    __int16 v68 = 2114;
    id v69 = v11;
    __int16 v70 = 2114;
    id v71 = v48;
    _os_log_error_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_ERROR, "Failed to add new sender to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@, error: %{public}@", buf, 0x34u);
  }
  BOOL v28 = 0;
LABEL_32:

  if (a7) {
    *a7 = v58[3];
  }
  _Block_object_dispose(&v57, 8);

  return v28;
}

void __106__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_connection_senderDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (BOOL)_addNewSenderWithAddressIDs:(id)a3 contactIdentifier:(id)a4 toBucket:(int64_t)a5 categoryType:(unint64_t)a6 connection:(id)a7 senderDatabaseID:(int64_t *)a8
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v13 = a4;
  id v56 = a7;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"senders"];
  uint64_t v15 = v13;
  if (!v13)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  [v14 setObject:v15 forKeyedSubscript:@"contact_identifier"];
  if (!v13) {

  }
  id v16 = [NSNumber numberWithInteger:a5];
  [v14 setObject:v16 forKeyedSubscript:@"bucket"];

  id v17 = [NSNumber numberWithUnsignedInteger:a6];
  [v14 setObject:v17 forKeyedSubscript:@"category"];

  [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"user_initiated"];
  id v53 = self;
  id v65 = 0;
  LODWORD(v17) = [v56 executeInsertStatement:v14 error:&v65];
  id v18 = v65;
  id v19 = v18;
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v20 = *MEMORY[0x1E4F5FCC8];
  uint64_t v64 = *MEMORY[0x1E4F5FCC8];
  id v21 = v55;
  if (v17)
  {
    uint64_t v22 = [v56 lastInsertedDatabaseID];
    v62[3] = v22;
    goto LABEL_7;
  }
  if (!v13) {
    goto LABEL_29;
  }
  BOOL v32 = [v18 domain];
  if (![v32 isEqualToString:*MEMORY[0x1E4F60D10]] || objc_msgSend(v19, "code") != 19)
  {
    id v25 = v19;
    goto LABEL_26;
  }
  id v51 = [v19 userInfo];
  id v33 = [v51 objectForKeyedSubscript:*MEMORY[0x1E4F60D18]];
  BOOL v34 = [v33 integerValue] == 2067;

  if (!v34) {
    goto LABEL_29;
  }
  id v35 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v50 = *MEMORY[0x1E4F60D08];
  id v52 = objc_msgSend(v35, "initWithResultColumn:table:");
  id v36 = [MEMORY[0x1E4F60E78] column:@"contact_identifier"];
  id v37 = [v36 equalTo:v13];
  [v52 setWhere:v37];

  id v59 = v19;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __119__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_categoryType_connection_senderDatabaseID___block_invoke;
  v60[3] = &unk_1E6BFF4C8;
  v60[4] = &v61;
  LODWORD(v37) = [v56 executeSelectStatement:v52 withBlock:v60 error:&v59];
  id v25 = v59;

  if (!v37)
  {
LABEL_24:
    BOOL v32 = v52;
LABEL_26:

    goto LABEL_30;
  }
  if (v62[3] == v20)
  {
    id v38 = EDSenderLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[EDSenderPersistence _addNewSenderWithAddressIDs:contactIdentifier:toBucket:connection:senderDatabaseID:]((uint64_t)v13, v38);
    }

    goto LABEL_24;
  }
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"senders"];
  id v40 = [NSNumber numberWithInteger:a5];
  [v39 setObject:v40 forKeyedSubscript:@"bucket"];

  v41 = [NSNumber numberWithUnsignedInteger:a6];
  [v39 setObject:v41 forKeyedSubscript:@"category"];

  [v39 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"user_initiated"];
  id v42 = [MEMORY[0x1E4F60E78] column:v50];
  int v43 = [NSNumber numberWithLongLong:v62[3]];
  id v44 = [v42 equalTo:v43];
  [v39 setWhereClause:v44];

  id v58 = v25;
  LODWORD(v42) = [v56 executeUpdateStatement:v39 error:&v58];
  id v19 = v58;

  if (!v42)
  {
LABEL_29:
    id v25 = v19;
    goto LABEL_30;
  }
  uint64_t v22 = v62[3];
  id v21 = v55;
LABEL_7:
  long long v23 = [NSNumber numberWithLongLong:v22];
  id v57 = v19;
  BOOL v24 = [(EDSenderPersistence *)v53 _addAddressesWithDatabaseIDs:v21 toSenderWithDatabaseID:v23 connection:v56 error:&v57];
  id v25 = v57;

  if (v24)
  {
    id v26 = EDSenderLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = (__CFString *)v62[3];
      BOOL v28 = @"default";
      if (a5 == 200) {
        BOOL v28 = @"sentTo";
      }
      if (a5 == 50) {
        BOOL v28 = @"blocked";
      }
      uint64_t v29 = v28;
      uint64_t v30 = [v55 count];
      *(_DWORD *)buf = 134219010;
      uint64_t v67 = v27;
      __int16 v68 = 2114;
      id v69 = v29;
      __int16 v70 = 2048;
      uint64_t v71 = v30;
      __int16 v72 = 2114;
      id v73 = v55;
      __int16 v74 = 2114;
      id v75 = v13;
      _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Added new sender (%lld) to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@", buf, 0x34u);
    }
    BOOL v31 = 1;
    goto LABEL_32;
  }
LABEL_30:
  id v26 = EDSenderLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    id v46 = @"default";
    if (a5 == 200) {
      id v46 = @"sentTo";
    }
    if (a5 == 50) {
      id v46 = @"blocked";
    }
    uint64_t v47 = v46;
    uint64_t v48 = [v55 count];
    uint64_t v49 = objc_msgSend(v25, "ef_publicDescription");
    *(_DWORD *)buf = 138544386;
    uint64_t v67 = v47;
    __int16 v68 = 2048;
    id v69 = (__CFString *)v48;
    __int16 v70 = 2114;
    uint64_t v71 = (uint64_t)v55;
    __int16 v72 = 2114;
    id v73 = v13;
    __int16 v74 = 2114;
    id v75 = v49;
    _os_log_error_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_ERROR, "Failed to add new sender to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@, error: %{public}@", buf, 0x34u);
  }
  BOOL v31 = 0;
LABEL_32:

  if (a8) {
    *a8 = v62[3];
  }
  _Block_object_dispose(&v61, 8);

  return v31;
}

void __119__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_categoryType_connection_senderDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

- (BOOL)_addAddressesWithDatabaseIDs:(id)a3 toSenderWithDatabaseID:(id)a4 connection:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v20 = a5;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"sender_addresses" conflictResolution:4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        id v16 = [v10 addValue];
        [v16 setObject:v15 forKeyedSubscript:@"address"];
        [v16 setObject:v9 forKeyedSubscript:@"sender"];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  char v17 = [v20 executeInsertStatement:v10 error:a6];
  return v17;
}

- (BOOL)_moveSenderWithDatabaseID:(int64_t)a3 toCategoryType:(unint64_t)a4 connection:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"senders"];
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  [v8 setObject:v9 forKeyedSubscript:@"category"];

  uint64_t v10 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v11 = [NSNumber numberWithLongLong:a3];
  uint64_t v12 = [v10 equalTo:v11];
  [v8 setWhereClause:v12];

  id v20 = 0;
  int v13 = [v7 executeUpdateStatement:v8 error:&v20];
  id v14 = v20;
  if (v13)
  {
    uint64_t v15 = EDSenderLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 - 1 > 2) {
        id v16 = @"default";
      }
      else {
        id v16 = off_1E6C06330[a4 - 1];
      }
      *(_DWORD *)buf = 134218242;
      int64_t v22 = a3;
      __int16 v23 = 2114;
      long long v24 = v16;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Moved sender (%lld) to category %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = EDSenderLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (a4 - 1 > 2) {
        char v17 = @"default";
      }
      else {
        char v17 = off_1E6C06330[a4 - 1];
      }
      id v19 = objc_msgSend(v14, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      int64_t v22 = a3;
      __int16 v23 = 2114;
      long long v24 = v17;
      __int16 v25 = 2114;
      uint64_t v26 = v19;
      _os_log_error_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_ERROR, "Failed to move sender (%lld) to category %{public}@, error: %{public}@", buf, 0x20u);
    }
  }

  return v13;
}

- (BOOL)_moveSenderWithDatabaseID:(int64_t)a3 toBucket:(int64_t)a4 connection:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"senders"];
  id v9 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v9 forKeyedSubscript:@"bucket"];

  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"user_initiated"];
  uint64_t v10 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v11 = [NSNumber numberWithLongLong:a3];
  uint64_t v12 = [v10 equalTo:v11];
  [v8 setWhereClause:v12];

  id v22 = 0;
  int v13 = [v7 executeUpdateStatement:v8 error:&v22];
  id v14 = v22;
  if (v13)
  {
    uint64_t v15 = EDSenderLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = @"default";
      if (a4 == 200) {
        id v16 = @"sentTo";
      }
      if (a4 == 50) {
        id v16 = @"blocked";
      }
      *(_DWORD *)buf = 134218242;
      int64_t v24 = a3;
      __int16 v25 = 2114;
      uint64_t v26 = v16;
      char v17 = v16;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Moved sender (%lld) to bucket %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = EDSenderLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v19 = @"default";
      if (a4 == 200) {
        id v19 = @"sentTo";
      }
      if (a4 == 50) {
        id v19 = @"blocked";
      }
      id v20 = v19;
      long long v21 = objc_msgSend(v14, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      int64_t v24 = a3;
      __int16 v25 = 2114;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      BOOL v28 = v21;
      _os_log_error_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_ERROR, "Failed to move sender (%lld) to bucket %{public}@, error: %{public}@", buf, 0x20u);
    }
  }

  return v13;
}

- (BOOL)_addNewSendersForEmailAddresses:(id)a3 toBucket:(int64_t)a4 connection:(id)a5 newSenders:(id *)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v38 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke;
  aBlock[3] = &unk_1E6C06070;
  id v40 = v8;
  id v73 = v40;
  BOOL v32 = _Block_copy(aBlock);
  id v9 = [v40 allKeys];
  id v70 = 0;
  id v71 = 0;
  uint64_t v10 = [(EDSenderPersistence *)self _addressesGroupedByContactForAddresses:v9 unmatchedAddresses:&v71 otherAddressesByContact:&v70];
  id v35 = v71;
  id v37 = v70;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2;
  v68[3] = &unk_1E6C06098;
  id v34 = v32;
  id v69 = v34;
  id v11 = objc_msgSend(v10, "ef_mapValues:", v68);

  id v67 = 0;
  uint64_t v12 = [(EDSenderPersistence *)self _addressIDsGroupedByContactsForAddressesByContact:v37 withConnection:v38 addressesByID:&v67];
  id v39 = v67;
  BOOL v31 = (void *)v12;
  id v36 = [(EDSenderPersistence *)self _combineDictionary:v11 withDictionary:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend(v39, "count", v13)) {
    [v13 addEntriesFromDictionary:v39];
  }
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_3;
  v65[3] = &unk_1E6C060C0;
  id v14 = v13;
  id v66 = v14;
  [v40 enumerateKeysAndObjectsUsingBlock:v65];
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 1;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_4;
  v54[3] = &unk_1E6C060E8;
  id v59 = &v61;
  int64_t v60 = a4;
  v54[4] = self;
  id v42 = v38;
  id v55 = v42;
  id v30 = v37;
  id v56 = v30;
  id v16 = v14;
  id v57 = v16;
  id v43 = v15;
  id v58 = v43;
  [v36 enumerateKeysAndObjectsUsingBlock:v54];
  if (*((unsigned char *)v62 + 24))
  {
    char v17 = [(EDSenderPersistence *)self _addressesGroupedBySimpleAddressForAddresses:v35];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_115;
    v52[3] = &unk_1E6C06110;
    id v53 = v34;
    id v18 = objc_msgSend(v17, "ef_compactMap:", v52);

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v74 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v49;
      uint64_t v21 = *MEMORY[0x1E4F5FCC8];
LABEL_6:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(obj);
        }
        __int16 v23 = *(void **)(*((void *)&v48 + 1) + 8 * v22);
        uint64_t v47 = v21;
        BOOL v24 = [(EDSenderPersistence *)self _addNewSenderWithAddressIDs:v23 contactIdentifier:0 toBucket:a4 connection:v42 senderDatabaseID:&v47];
        *((unsigned char *)v62 + 24) = v24;
        if (!v24) {
          break;
        }
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2_117;
        v45[3] = &unk_1E6C06138;
        id v46 = v16;
        __int16 v25 = objc_msgSend(v23, "ef_compactMap:", v45);
        id v26 = objc_alloc(MEMORY[0x1E4F604A8]);
        __int16 v27 = (void *)[v26 initWithDatabaseID:v47 addresses:v25 contactIdentifier:0 bucket:a4];
        [v43 addObject:v27];

        if (v19 == ++v22)
        {
          uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v74 count:16];
          if (v19) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  if (a6)
  {
    objc_msgSend(v43, "ef_notEmpty");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v28 = *((unsigned char *)v62 + 24) != 0;

  _Block_object_dispose(&v61, 8);
  return v28;
}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringValue];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ef_compactMap:", *(void *)(a1 + 32));

  return v2;
}

uint64_t __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

void __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v31 = *MEMORY[0x1E4F5FCC8];
  id v9 = *(void **)(a1 + 32);
  __int16 v25 = v8;
  id v26 = v7;
  uint64_t v10 = [v7 identifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v9 _addNewSenderWithAddressIDs:v8 contactIdentifier:v10 toBucket:*(void *)(a1 + 80) connection:*(void *)(a1 + 40) senderDatabaseID:&v31];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    uint64_t v12 = (void *)[v11 mutableCopy];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          char v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v18 = [*(id *)(a1 + 56) objectForKeyedSubscript:v17];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = EDSenderLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = [v17 unsignedLongLongValue];
              *(_DWORD *)buf = 134218240;
              uint64_t v33 = v20;
              __int16 v34 = 2048;
              uint64_t v35 = v31;
              _os_log_error_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_ERROR, "<nil> address for ID %llu (sender ID %llu)", buf, 0x16u);
            }
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v14);
    }

    if ([v12 count])
    {
      id v21 = objc_alloc(MEMORY[0x1E4F604A8]);
      uint64_t v22 = v31;
      __int16 v23 = [v26 identifier];
      BOOL v24 = (void *)[v21 initWithDatabaseID:v22 addresses:v12 contactIdentifier:v23 bucket:*(void *)(a1 + 80)];

      [*(id *)(a1 + 64) addObject:v24];
    }
  }
  else
  {
    *a4 = 1;
  }
}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ef_compactMap:", *(void *)(a1 + 32));
  id v3 = objc_msgSend(v2, "ef_notEmpty");

  return v3;
}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2_117(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  return v2;
}

- (BOOL)_addNewSendersForEmailAddresses:(id)a3 toBucket:(int64_t)a4 categoryType:(unint64_t)a5 connection:(id)a6 newSenders:(id *)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v39 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke;
  aBlock[3] = &unk_1E6C06070;
  id v41 = v9;
  id v76 = v41;
  uint64_t v33 = _Block_copy(aBlock);
  uint64_t v10 = [v41 allKeys];
  id v74 = 0;
  id v73 = 0;
  id v11 = [(EDSenderPersistence *)self _addressesGroupedByContactForAddresses:v10 unmatchedAddresses:&v74 otherAddressesByContact:&v73];
  id v36 = v74;
  id v38 = v73;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2;
  v71[3] = &unk_1E6C06098;
  id v35 = v33;
  id v72 = v35;
  uint64_t v12 = objc_msgSend(v11, "ef_mapValues:", v71);

  id v70 = 0;
  uint64_t v13 = [(EDSenderPersistence *)self _addressIDsGroupedByContactsForAddressesByContact:v38 withConnection:v39 addressesByID:&v70];
  id v40 = v70;
  BOOL v32 = (void *)v13;
  uint64_t v37 = [(EDSenderPersistence *)self _combineDictionary:v12 withDictionary:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v40 count]) {
    [v14 addEntriesFromDictionary:v40];
  }
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_3;
  v68[3] = &unk_1E6C060C0;
  id v15 = v14;
  id v69 = v15;
  [v41 enumerateKeysAndObjectsUsingBlock:v68];
  uint64_t v64 = 0;
  id v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 1;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_4;
  v56[3] = &unk_1E6C06160;
  uint64_t v61 = &v64;
  int64_t v62 = a4;
  v56[4] = self;
  unint64_t v63 = a5;
  id v43 = v39;
  id v57 = v43;
  id v31 = v38;
  id v58 = v31;
  id v17 = v15;
  id v59 = v17;
  id v45 = v16;
  id v60 = v45;
  [v37 enumerateKeysAndObjectsUsingBlock:v56];
  if (*((unsigned char *)v65 + 24))
  {
    id v18 = [(EDSenderPersistence *)self _addressesGroupedBySimpleAddressForAddresses:v36];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_119;
    v54[3] = &unk_1E6C06110;
    id v55 = v35;
    uint64_t v19 = objc_msgSend(v18, "ef_compactMap:", v54);

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v19;
    uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v77 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v51;
      uint64_t v22 = *MEMORY[0x1E4F5FCC8];
LABEL_6:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(obj);
        }
        BOOL v24 = *(void **)(*((void *)&v50 + 1) + 8 * v23);
        uint64_t v49 = v22;
        BOOL v25 = [(EDSenderPersistence *)self _addNewSenderWithAddressIDs:v24 contactIdentifier:0 toBucket:a4 categoryType:a5 connection:v43 senderDatabaseID:&v49];
        *((unsigned char *)v65 + 24) = v25;
        if (!v25) {
          break;
        }
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2_120;
        v47[3] = &unk_1E6C06138;
        id v48 = v17;
        id v26 = objc_msgSend(v24, "ef_compactMap:", v47);
        id v27 = objc_alloc(MEMORY[0x1E4F604A8]);
        long long v28 = (void *)[v27 initWithDatabaseID:v49 addresses:v26 contactIdentifier:0 bucket:a4];
        [v45 addObject:v28];

        if (v20 == ++v23)
        {
          uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v77 count:16];
          if (v20) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  if (a7)
  {
    objc_msgSend(v45, "ef_notEmpty");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v29 = *((unsigned char *)v65 + 24) != 0;

  _Block_object_dispose(&v64, 8);
  return v29;
}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringValue];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ef_compactMap:", *(void *)(a1 + 32));

  return v2;
}

uint64_t __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

void __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v31 = *MEMORY[0x1E4F5FCC8];
  id v9 = *(void **)(a1 + 32);
  BOOL v25 = v8;
  id v26 = v7;
  uint64_t v10 = [v7 identifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v9 _addNewSenderWithAddressIDs:v8 contactIdentifier:v10 toBucket:*(void *)(a1 + 80) categoryType:*(void *)(a1 + 88) connection:*(void *)(a1 + 40) senderDatabaseID:&v31];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    uint64_t v12 = (void *)[v11 mutableCopy];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v18 = [*(id *)(a1 + 56) objectForKeyedSubscript:v17];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = EDSenderLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = [v17 unsignedLongLongValue];
              *(_DWORD *)buf = 134218240;
              uint64_t v33 = v20;
              __int16 v34 = 2048;
              uint64_t v35 = v31;
              _os_log_error_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_ERROR, "<nil> address for ID %llu (sender ID %llu)", buf, 0x16u);
            }
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v14);
    }

    if ([v12 count])
    {
      id v21 = objc_alloc(MEMORY[0x1E4F604A8]);
      uint64_t v22 = v31;
      uint64_t v23 = [v26 identifier];
      BOOL v24 = (void *)[v21 initWithDatabaseID:v22 addresses:v12 contactIdentifier:v23 bucket:*(void *)(a1 + 80)];

      [*(id *)(a1 + 64) addObject:v24];
    }
  }
  else
  {
    *a4 = 1;
  }
}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ef_compactMap:", *(void *)(a1 + 32));
  id v3 = objc_msgSend(v2, "ef_notEmpty");

  return v3;
}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2_120(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  return v2;
}

- (id)_contactIdentifierForSenderWithDatabaseID:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"contact_identifier" table:@"senders"];
  id v7 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v8 = [NSNumber numberWithLongLong:a3];
  id v9 = [v7 equalTo:v8];
  [v6 setWhere:v9];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__36;
  id v17 = __Block_byref_object_dispose__36;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__EDSenderPersistence__contactIdentifierForSenderWithDatabaseID_connection___block_invoke;
  v12[3] = &unk_1E6BFF4C8;
  v12[4] = &v13;
  [v5 executeSelectStatement:v6 withBlock:v12 error:0];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __76__EDSenderPersistence__contactIdentifierForSenderWithDatabaseID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 stringValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (int64_t)_bucketForSenderWithDatabaseID:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"bucket" table:@"senders"];
  id v7 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v8 = [NSNumber numberWithLongLong:a3];
  id v9 = [v7 equalTo:v8];
  [v6 setWhere:v9];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__EDSenderPersistence__bucketForSenderWithDatabaseID_connection___block_invoke;
  v12[3] = &unk_1E6BFF4C8;
  v12[4] = &v13;
  [v5 executeSelectStatement:v6 withBlock:v12 error:0];
  int64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__EDSenderPersistence__bucketForSenderWithDatabaseID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
}

- (id)_emailAddressForDatabaseID:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDSenderPersistence *)self databaseIDToEmailAddressCache];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke;
  v13[3] = &unk_1E6C061B0;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  id v11 = [v8 objectForKey:v9 generator:v13];

  return v11;
}

id __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke(uint64_t a1)
{
  id v39 = 0;
  uint64_t v2 = +[EDMessagePersistence selectAddressesStatementWithResultColumns:&v39];
  id v3 = v39;
  id v4 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v5 = [v4 equalTo:*(void *)(a1 + 32)];
  [v2 setWhere:v5];

  uint64_t v33 = 0;
  __int16 v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__36;
  uint64_t v37 = __Block_byref_object_dispose__36;
  id v38 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__36;
  uint64_t v31 = __Block_byref_object_dispose__36;
  id v32 = 0;
  id v6 = *(void **)(a1 + 40);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke_2;
  uint64_t v23 = &unk_1E6C06188;
  BOOL v25 = &v33;
  id v7 = v3;
  id v24 = v7;
  id v26 = &v27;
  [v6 executeSelectStatement:v2 withBlock:&v20 error:0];
  id v8 = (void *)v34[5];
  id v9 = (id)v28[5];
  id v10 = v8;
  id v11 = objc_alloc(MEMORY[0x1E4F60800]);
  uint64_t v12 = objc_msgSend(v11, "initWithString:", v9, v20, v21, v22, v23);
  [v12 setDisplayName:v10];
  uint64_t v13 = [v12 emailAddressValue];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    uint64_t v16 = [v12 stringValue];
    id v17 = (void *)v16;
    if (v16) {
      id v18 = (void *)v16;
    }
    else {
      id v18 = v9;
    }
    id v15 = v18;
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);

  return v15;
}

void __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) first];
  id v4 = [v13 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 stringValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1 + 32) second];
  id v9 = [v13 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 stringValue];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)_simpleAddressesInBucket:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  id v23 = 0;
  uint64_t v6 = +[EDMessagePersistence selectAddressesStatementWithResultColumns:&v23];
  id v7 = v23;
  uint64_t v8 = *MEMORY[0x1E4F60D08];
  id v9 = [v6 join:@"sender_addresses" sourceColumn:*MEMORY[0x1E4F60D08] targetColumn:@"address"];
  id v10 = (id)[v9 join:@"senders" sourceColumn:@"sender" targetColumn:v8];
  uint64_t v11 = [MEMORY[0x1E4F60E78] table:@"senders" column:@"bucket"];
  uint64_t v12 = [NSNumber numberWithInteger:a3];
  id v13 = [v11 equalTo:v12];
  [v6 setWhere:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__EDSenderPersistence__simpleAddressesInBucket_connection___block_invoke;
  void v20[3] = &unk_1E6C001E8;
  id v15 = v7;
  id v21 = v15;
  id v22 = v14;
  id v16 = v14;
  if ([v5 executeSelectStatement:v6 withBlock:v20 error:0]) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  return v18;
}

void __59__EDSenderPersistence__simpleAddressesInBucket_connection___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) second];
  id v4 = [v6 objectForKeyedSubscript:v3];
  id v5 = [v4 stringValue];

  [*(id *)(a1 + 40) addObject:v5];
}

- (id)_simpleAddressesNotInBucket:(int64_t)a3 withMessagesNewerThan:(id)a4 connection:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v9 = +[EDMessagePersistence messagesSenderColumnName];
  id v10 = +[EDMessagePersistence messagesTableName];
  uint64_t v11 = (void *)[v8 initWithResultColumn:v9 table:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F60E78];
  id v13 = +[EDMessagePersistence messagesDateReceivedColumnName];
  id v14 = [v12 column:v13];
  id v15 = [v14 greaterThan:v6];
  [v11 setWhere:v15];

  id v29 = 0;
  id v16 = +[EDMessagePersistence selectAddressesStatementWithResultColumns:&v29];
  id v17 = v29;
  id v18 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  uint64_t v19 = [v18 in:v11];
  [v16 setWhere:v19];

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__EDSenderPersistence__simpleAddressesNotInBucket_withMessagesNewerThan_connection___block_invoke;
  v26[3] = &unk_1E6C001E8;
  id v21 = v17;
  id v27 = v21;
  id v28 = v20;
  id v22 = v20;
  if ([v7 executeSelectStatement:v16 withBlock:v26 error:0]) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;

  return v24;
}

void __84__EDSenderPersistence__simpleAddressesNotInBucket_withMessagesNewerThan_connection___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) second];
  id v4 = [v6 objectForKeyedSubscript:v3];
  id v5 = [v4 stringValue];

  [*(id *)(a1 + 40) addObject:v5];
}

- (void)_setIsBlocked:(BOOL)a3 forAddresses:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = EDSenderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    id v9 = @"Unblocking";
    if (v4) {
      id v9 = @"Blocking";
    }
    *(_DWORD *)buf = 138543618;
    id v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %lu addresses", buf, 0x16u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "emailAddressValue", (void)v17);
        if (v14)
        {
          id v15 = [(EDSenderPersistence *)self blockedSenderManager];
          id v16 = [v14 simpleAddress];
          if (v4) {
            [v15 blockEmailAddress:v16];
          }
          else {
            [v15 unblockEmailAddress:v16];
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

id __48__EDSenderPersistence__blockedSendersDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F5FC70]];
  id v7 = [v5 _addressesToDatabaseIDsForSimpleAddresses:v6 connection:v4];

  return v7;
}

id __48__EDSenderPersistence__blockedSendersDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F5FC88]];
  id v7 = [v5 _addressesToDatabaseIDsForSimpleAddresses:v6 connection:v4];

  return v7;
}

- (id)_addressesToDatabaseIDsForSimpleAddresses:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:a3 connection:v6];
  id v15 = 0;
  uint64_t v8 = +[EDMessagePersistence selectAddressesStatementWithResultColumns:&v15];
  id v9 = v15;
  uint64_t v10 = *MEMORY[0x1E4F60D08];
  [v8 addResultColumn:*MEMORY[0x1E4F60D08] alias:@"address_id"];
  uint64_t v11 = [MEMORY[0x1E4F60E78] column:v10];
  uint64_t v12 = [v11 in:v7];
  [v8 setWhere:v12];

  uint64_t v13 = [(EDSenderPersistence *)self _addressesToDatabaseIDsForSelect:v8 addressColumns:v9 connection:v6 error:0];

  return v13;
}

- (void)_reloadBlockedSendersWithAddresses:(id)a3
{
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke;
  v4[3] = &unk_1E6C06200;
  void v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke_2;
  v3[3] = &unk_1E6C06200;
  [(EDSenderPersistence *)self _updateBlockedSendersWithBlockedSenderAddresses:a3 newlyBlockedAddresses:v4 newlyUnblockedAddresses:v3];
}

id __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [*(id *)(a1 + 32) _newlyBlockedAddressesForBlockedAddressDatabaseIDs:a2 connection:a3];

  return v3;
}

id __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [*(id *)(a1 + 32) _newlyUnblockedAddressesForBlockedAddressDatabaseIDs:a2 connection:a3];

  return v3;
}

- (void)_updateBlockedSendersWithBlockedSenderAddresses:(id)a3 newlyBlockedAddresses:(id)a4 newlyUnblockedAddresses:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__36;
  id v36 = __Block_byref_object_dispose__36;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__36;
  long long v30 = __Block_byref_object_dispose__36;
  id v31 = 0;
  uint64_t v11 = [(EDSenderPersistence *)self database];
  uint64_t v12 = [NSString stringWithUTF8String:"-[EDSenderPersistence _updateBlockedSendersWithBlockedSenderAddresses:newlyBlockedAddresses:newlyUnblockedAddresses:]"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __117__EDSenderPersistence__updateBlockedSendersWithBlockedSenderAddresses_newlyBlockedAddresses_newlyUnblockedAddresses___block_invoke;
  long long v19 = &unk_1E6C06228;
  id v13 = v8;
  id v20 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v10;
  id v21 = self;
  id v23 = v15;
  __int16 v24 = &v32;
  uint64_t v25 = &v26;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, &v16);

  if (objc_msgSend((id)v33[5], "count", v16, v17, v18, v19)) {
    [(EDSenderPersistence *)self _setIsBlocked:1 forAddresses:v33[5]];
  }
  if ([(id)v27[5] count]) {
    [(EDSenderPersistence *)self _setIsBlocked:0 forAddresses:v27[5]];
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

uint64_t __117__EDSenderPersistence__updateBlockedSendersWithBlockedSenderAddresses_newlyBlockedAddresses_newlyUnblockedAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allObjects];
  id v5 = +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:v4 connection:v3];

  id v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v7 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([v6 count]
    && (id v8 = *(void **)(a1 + 40),
        uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8),
        id obj = *(id *)(v9 + 40),
        int v10 = [v8 _blockOrUnblockSendersForAddresses:v6 block:1 blockedAddressDatabaseIDs:v5 connection:v3 addressesToUpdate:&obj], objc_storeStrong((id *)(v9 + 40), obj), !v10))
  {
    uint64_t v13 = 0;
  }
  else if ([v7 count])
  {
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    id v15 = *(id *)(v12 + 40);
    uint64_t v13 = [v11 _blockOrUnblockSendersForAddresses:v7 block:0 blockedAddressDatabaseIDs:v5 connection:v3 addressesToUpdate:&v15];
    objc_storeStrong((id *)(v12 + 40), v15);
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

- (id)_newlyBlockedAddressesForBlockedAddressDatabaseIDs:(id)a3 connection:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v25 = 0;
  id v8 = +[EDMessagePersistence selectAddressesStatementWithResultColumns:&v25];
  id v9 = v25;
  uint64_t v10 = *MEMORY[0x1E4F60D08];
  [v8 addResultColumn:*MEMORY[0x1E4F60D08] alias:@"address_id"];
  uint64_t v11 = [v8 leftOuterJoin:@"sender_addresses" sourceColumn:v10 targetColumn:@"address"];
  id v12 = (id)[v11 leftOuterJoin:@"senders" sourceColumn:@"sender" targetColumn:v10];
  uint64_t v13 = [MEMORY[0x1E4F60E78] column:@"address_id"];
  id v14 = [v13 in:v6];

  id v15 = [MEMORY[0x1E4F60E78] table:@"senders" column:@"bucket"];
  uint64_t v16 = [v15 isNot:&unk_1F35BB000];

  uint64_t v17 = (void *)MEMORY[0x1E4F60E48];
  v26[0] = v14;
  v26[1] = v16;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  long long v19 = [v17 combined:v18];
  [v8 setWhere:v19];

  id v24 = 0;
  id v20 = [(EDSenderPersistence *)self _addressesToDatabaseIDsForSelect:v8 addressColumns:v9 connection:v7 error:&v24];
  id v21 = v24;
  if (!v20)
  {
    id v22 = EDSenderLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _newlyBlockedAddressesForBlockedAddressDatabaseIDs:connection:]();
    }
  }

  return v20;
}

- (id)_newlyUnblockedAddressesForBlockedAddressDatabaseIDs:(id)a3 connection:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v25 = 0;
  id v8 = +[EDMessagePersistence selectAddressesStatementWithResultColumns:&v25];
  id v9 = v25;
  uint64_t v10 = *MEMORY[0x1E4F60D08];
  [v8 addResultColumn:*MEMORY[0x1E4F60D08] alias:@"address_id"];
  uint64_t v11 = [v8 join:@"sender_addresses" sourceColumn:v10 targetColumn:@"address"];
  id v12 = (id)[v11 join:@"senders" sourceColumn:@"sender" targetColumn:v10];
  uint64_t v13 = [MEMORY[0x1E4F60E78] table:@"senders" column:@"bucket"];
  id v14 = [v13 is:&unk_1F35BB000];

  id v15 = [MEMORY[0x1E4F60E78] column:@"address_id"];
  uint64_t v16 = [v15 notIn:v6];

  uint64_t v17 = (void *)MEMORY[0x1E4F60E48];
  v26[0] = v14;
  v26[1] = v16;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  long long v19 = [v17 combined:v18];
  [v8 setWhere:v19];

  id v24 = 0;
  id v20 = [(EDSenderPersistence *)self _addressesToDatabaseIDsForSelect:v8 addressColumns:v9 connection:v7 error:&v24];
  id v21 = v24;
  if (!v20)
  {
    id v22 = EDSenderLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _newlyUnblockedAddressesForBlockedAddressDatabaseIDs:connection:]();
    }
  }

  return v20;
}

- (id)_addressesToDatabaseIDsForSelect:(id)a3 addressColumns:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__EDSenderPersistence__addressesToDatabaseIDsForSelect_addressColumns_connection_error___block_invoke;
  v18[3] = &unk_1E6C001E8;
  id v13 = v10;
  id v19 = v13;
  id v20 = v12;
  id v14 = v12;
  if ([v11 executeSelectStatement:v9 withBlock:v18 error:a6]) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  return v16;
}

void __88__EDSenderPersistence__addressesToDatabaseIDsForSelect_addressColumns_connection_error___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  id v3 = [v22 objectForKeyedSubscript:@"address_id"];
  id v4 = [v3 numberValue];

  id v5 = [*(id *)(a1 + 32) first];
  id v6 = [v22 objectForKeyedSubscript:v5];
  id v7 = [v6 stringValue];

  id v8 = [*(id *)(a1 + 32) second];
  id v9 = [v22 objectForKeyedSubscript:v8];
  id v10 = [v9 stringValue];

  id v11 = v10;
  id v12 = v7;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v11];
  [v13 setDisplayName:v12];
  id v14 = [v13 emailAddressValue];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    uint64_t v17 = [v13 stringValue];
    long long v18 = (void *)v17;
    if (v17) {
      id v19 = (void *)v17;
    }
    else {
      id v19 = v11;
    }
    id v16 = v19;
  }
  id v20 = *(void **)(a1 + 40);
  id v21 = [v16 stringValue];
  [v20 setObject:v4 forKeyedSubscript:v21];
}

void __119__EDSenderPersistence__blockOrUnblockSendersForAddresses_block_blockedAddressDatabaseIDs_connection_addressesToUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  id v3 = [v24 objectForKeyedSubscript:@"sender"];
  id v4 = [v3 numberValue];

  id v5 = [v24 objectForKeyedSubscript:@"address_id"];
  id v6 = [v5 numberValue];

  id v7 = [*(id *)(a1 + 32) first];
  id v8 = [v24 objectForKeyedSubscript:v7];
  id v9 = [v8 stringValue];

  id v10 = [*(id *)(a1 + 32) second];
  id v11 = [v24 objectForKeyedSubscript:v10];
  id v12 = [v11 stringValue];

  id v13 = v12;
  id v14 = v9;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v13];
  [v15 setDisplayName:v14];
  id v16 = [v15 emailAddressValue];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    uint64_t v19 = [v15 stringValue];
    id v20 = (void *)v19;
    if (v19) {
      id v21 = (void *)v19;
    }
    else {
      id v21 = v13;
    }
    id v18 = v21;
  }
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v22 = *(void **)(a1 + 48);
    id v23 = [v18 stringValue];
    [v22 setObject:v6 forKeyedSubscript:v23];
  }
}

void __119__EDSenderPersistence__blockOrUnblockSendersForAddresses_block_blockedAddressDatabaseIDs_connection_addressesToUpdate___block_invoke_140(uint64_t a1, void *a2)
{
  id v22 = a2;
  id v3 = [v22 objectAtIndexedSubscript:0];
  id v4 = [v3 numberValue];

  LODWORD(v3) = *(unsigned __int8 *)(a1 + 56);
  if (v3 != [*(id *)(a1 + 32) containsObject:v4])
  {
    id v5 = [*(id *)(a1 + 40) first];
    id v6 = [v22 objectForKeyedSubscript:v5];
    id v7 = [v6 stringValue];

    id v8 = [*(id *)(a1 + 40) second];
    id v9 = [v22 objectForKeyedSubscript:v8];
    id v10 = [v9 stringValue];

    id v11 = v10;
    id v12 = v7;
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v11];
    [v13 setDisplayName:v12];
    id v14 = [v13 emailAddressValue];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      uint64_t v17 = [v13 stringValue];
      id v18 = (void *)v17;
      if (v17) {
        uint64_t v19 = (void *)v17;
      }
      else {
        uint64_t v19 = v11;
      }
      id v16 = v19;
    }
    if (v16)
    {
      id v20 = *(void **)(a1 + 48);
      id v21 = [v16 stringValue];
      [v20 addObject:v21];
    }
  }
}

- (id)_simpleAddressesForAddresses:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "emailAddressValue", (void)v17);
        id v11 = [v10 simpleAddress];
        id v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [v9 stringValue];
        }
        id v14 = v13;

        objc_msgSend(v4, "ef_addOptionalObject:", v14);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  id v15 = [v4 allObjects];

  return v15;
}

- (id)_addressesGroupedBySimpleAddressForAddresses:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_groupBy:", &__block_literal_global_142);
  id v4 = [v3 allValues];

  return v4;
}

id __68__EDSenderPersistence__addressesGroupedBySimpleAddressForAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_combineDictionary:(id)a3 withDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if ([v6 count])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke;
      v18[3] = &unk_1E6C04898;
      id v8 = v6;
      id v19 = v8;
      id v9 = v7;
      id v20 = v9;
      [v5 enumerateKeysAndObjectsUsingBlock:v18];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke_2;
      v15[3] = &unk_1E6C04898;
      id v16 = v5;
      id v10 = v9;
      id v17 = v10;
      [v8 enumerateKeysAndObjectsUsingBlock:v15];
      id v11 = v17;
      id v12 = v10;

      goto LABEL_7;
    }
    id v13 = v5;
  }
  else
  {
    id v13 = v6;
  }
  id v12 = v13;
LABEL_7:

  return v12;
}

void __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = (void *)v7;
  if (v7)
  {
    v11[0] = v6;
    v11[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v10 = objc_msgSend(v9, "ef_flatten");
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v5];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

void __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
  }
}

- (id)_addressesGroupedByContactForAddresses:(id)a3 unmatchedAddresses:(id *)a4 otherAddressesByContact:(id *)a5
{
  v111[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F1ADE0];
  v111[0] = *MEMORY[0x1E4F1ADF0];
  v111[1] = v7;
  v111[2] = *MEMORY[0x1E4F1ADC8];
  id v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:3];
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v99 objects:v110 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v100 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        id v12 = [v11 emailAddressValue];
        if (v12)
        {
          [v81 addObject:v12];
          id v13 = [v12 simpleAddress];
          objc_msgSend(v80, "ef_addOptionalObject:", v13);
        }
        else
        {
          id v13 = [v11 stringValue];
          [v80 addObject:v13];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v99 objects:v110 count:16];
    }
    while (v8);
  }

  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v72 = [(EDSenderPersistence *)self contactStore];
  if ((unint64_t)[obj count] < 0x3E9) {
    goto LABEL_38;
  }
  id v98 = 0;
  id v15 = [v72 unifiedContactCountWithError:&v98];
  id v16 = v98;
  id v76 = v15;
  if (!v15)
  {
    id v36 = EDSenderLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:]();
    }

    goto LABEL_37;
  }
  id v17 = EDSenderLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [obj count];
    *(_DWORD *)buf = 138412546;
    v107 = v15;
    __int16 v108 = 2048;
    uint64_t v109 = v18;
    _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Contacts count: %@, addresses count: %lu", buf, 0x16u);
  }

  unint64_t v19 = [obj count];
  if (v19 <= 5 * [v15 unsignedIntegerValue])
  {
LABEL_37:

LABEL_38:
    id v78 = [obj sortedArrayUsingComparator:&__block_literal_global_146];
    goto LABEL_39;
  }
  id v97 = v16;
  id v73 = [v72 allContactEmailAddressesWithError:&v97];
  id v69 = v97;

  if (v73)
  {
    id v20 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v73];
    id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v21 = obj;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v93 objects:v105 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v94 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = *(void **)(*((void *)&v93 + 1) + 8 * j);
          uint64_t v26 = [v25 emailAddressValue];
          id v27 = [v26 simpleAddress];
          uint64_t v28 = v27;
          if (v27)
          {
            id v29 = v27;
          }
          else
          {
            id v29 = [v25 stringValue];
          }
          long long v30 = v29;

          if ([v20 containsObject:v30])
          {
            [v78 addObject:v25];
          }
          else
          {
            id v31 = v25;
            uint64_t v32 = [v31 emailAddressValue];
            uint64_t v33 = v32;
            if (v32)
            {
              id v34 = v32;
            }
            else
            {
              id v34 = [v31 stringValue];
            }
            uint64_t v35 = v34;

            [v67 addObject:v35];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v93 objects:v105 count:16];
      }
      while (v22);
    }

    [v78 sortUsingComparator:&__block_literal_global_146];
  }
  else
  {
    id v20 = EDSenderLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v69, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:]();
    }
    id v78 = 0;
  }

  if (!v78) {
    goto LABEL_38;
  }
LABEL_39:
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v66 = v78;
  uint64_t v74 = [v66 countByEnumeratingWithState:&v89 objects:v104 count:16];
  if (v74)
  {
    uint64_t v70 = *(void *)v90;
    do
    {
      for (uint64_t k = 0; k != v74; ++k)
      {
        if (*(void *)v90 != v70) {
          objc_enumerationMutation(v66);
        }
        id v37 = *(void **)(*((void *)&v89 + 1) + 8 * k);
        id v38 = objc_msgSend(v72, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v37, v71, 0);
        if (v38)
        {
          id v39 = [v68 objectForKeyedSubscript:v38];
          if (v39)
          {
            id v77 = v39;
            [v39 addObject:v37];
          }
          else
          {
            id v77 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v37, 0);
            [v68 setObject:v77 forKeyedSubscript:v38];
          }
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v43 = [v38 emailAddresses];
          id v44 = objc_msgSend(v43, "ef_compactMapSelector:", sel_value);

          uint64_t v45 = [v44 countByEnumeratingWithState:&v85 objects:v103 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v86;
            do
            {
              for (uint64_t m = 0; m != v45; ++m)
              {
                if (*(void *)v86 != v46) {
                  objc_enumerationMutation(v44);
                }
                id v48 = *(void **)(*((void *)&v85 + 1) + 8 * m);
                uint64_t v49 = [v48 emailAddressValue];
                long long v50 = [v49 displayName];

                if (v50)
                {
                  if ([v81 containsObject:v49]) {
                    goto LABEL_69;
                  }
LABEL_62:
                  if (v49) {
                    id v56 = v49;
                  }
                  else {
                    id v56 = v48;
                  }
                  id v57 = v56;
                  id v58 = [v14 objectForKeyedSubscript:v57];
                  id v59 = v58;
                  if (v58)
                  {
                    objc_msgSend(v58, "ef_addObjectIfAbsent:", v38);
                  }
                  else
                  {
                    id v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v38, 0);
                    [v14 setObject:v59 forKeyedSubscript:v57];
                  }

                  goto LABEL_69;
                }
                uint64_t v51 = [v49 simpleAddress];
                long long v52 = (void *)v51;
                if (v51) {
                  long long v53 = (void *)v51;
                }
                else {
                  long long v53 = v48;
                }
                id v54 = v53;

                char v55 = [v80 containsObject:v54];
                if ((v55 & 1) == 0) {
                  goto LABEL_62;
                }
LABEL_69:
              }
              uint64_t v45 = [v44 countByEnumeratingWithState:&v85 objects:v103 count:16];
            }
            while (v45);
          }
        }
        else
        {
          id v40 = v37;
          id v41 = [v40 emailAddressValue];
          id v42 = v41;
          if (v41)
          {
            id v77 = v41;
          }
          else
          {
            id v77 = [v40 stringValue];
          }

          [v67 addObject:v77];
        }
      }
      uint64_t v74 = [v66 countByEnumeratingWithState:&v89 objects:v104 count:16];
    }
    while (v74);
  }

  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __105__EDSenderPersistence__addressesGroupedByContactForAddresses_unmatchedAddresses_otherAddressesByContact___block_invoke_150;
  v82[3] = &unk_1E6C06298;
  id v61 = v71;
  id v83 = v61;
  id v62 = v60;
  id v84 = v62;
  [v14 enumerateKeysAndObjectsUsingBlock:v82];
  if (a4) {
    *a4 = v67;
  }
  if (a5) {
    *a5 = v62;
  }

  return v68;
}

uint64_t __105__EDSenderPersistence__addressesGroupedByContactForAddresses_unmatchedAddresses_otherAddressesByContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 emailAddressValue];
  uint64_t v7 = [v6 simpleAddress];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v4 stringValue];
  }
  id v10 = v9;

  id v11 = [v5 emailAddressValue];
  id v12 = [v11 simpleAddress];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v5 stringValue];
  }
  id v15 = v14;

  uint64_t v16 = [v10 compare:v15];
  return v16;
}

void __105__EDSenderPersistence__addressesGroupedByContactForAddresses_unmatchedAddresses_otherAddressesByContact___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [v11 emailAddressValue];
  uint64_t v7 = [v6 displayName];

  if (v7) {
    objc_msgSend(MEMORY[0x1E4F1B8F8], "em_bestMatchForName:fromContacts:keysToCheck:", v7, v5, *(void *)(a1 + 32));
  }
  else {
  uint64_t v8 = [v5 firstObject];
  }
  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    id v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "ef_addObjectIfAbsent:", v11);
    }
    else
    {
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
    }
  }
}

- (id)_addressIDsGroupedByContactsForAddressesByContact:(id)a3 withConnection:(id)a4 addressesByID:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v11 = [MEMORY[0x1E4F60E78] allColumns];
  id v12 = (void *)[v10 initWithResult:v11 table:@"addresses"];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke;
  v18[3] = &unk_1E6C062C0;
  id v19 = v12;
  id v13 = v8;
  id v20 = v13;
  id v14 = v9;
  id v21 = v14;
  id v15 = v12;
  uint64_t v16 = objc_msgSend(v7, "ef_mapValues:", v18);
  if (a5) {
    *a5 = v14;
  }

  return v16;
}

id __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v22;
  uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16, v22);
  if (v4)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v7 = [MEMORY[0x1E4F60E78] column:@"address"];
        id v8 = [v6 emailAddressValue];
        id v9 = [v8 simpleAddress];
        id v10 = v9;
        if (!v9)
        {
          id v2 = [v6 stringValue];
          id v10 = v2;
        }
        id v11 = [v7 equalTo:v10];
        if (!v9) {

        }
        id v12 = [v6 emailAddressValue];
        id v13 = [v12 displayName];

        if (v13)
        {
          id v14 = [MEMORY[0x1E4F60E78] column:@"comment"];
          id v15 = [v14 equalTo:v13];

          id v16 = objc_alloc(MEMORY[0x1E4F60E48]);
          v33[0] = v11;
          v33[1] = v15;
          id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
          uint64_t v18 = (void *)[v16 initWithExpressions:v17];
          [*(id *)(a1 + 32) setWhere:v18];
        }
        else
        {
          [*(id *)(a1 + 32) setWhere:v11];
        }
        uint64_t v20 = *(void *)(a1 + 32);
        id v19 = *(void **)(a1 + 40);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke_2;
        void v26[3] = &unk_1E6C01860;
        void v26[4] = v6;
        id v27 = v25;
        id v28 = *(id *)(a1 + 48);
        [v19 executeSelectStatement:v20 withBlock:v26 error:0];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }

  return v25;
}

void __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke_2(id *a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 numberValue];

  id v5 = [v13 objectAtIndexedSubscript:2];
  id v6 = [v5 stringValue];

  id v7 = objc_alloc(MEMORY[0x1E4F60800]);
  id v8 = [a1[4] stringValue];
  id v9 = (void *)[v7 initWithString:v8];

  [v9 setDisplayName:v6];
  [a1[5] addObject:v4];
  id v10 = objc_alloc(MEMORY[0x1E4F607F8]);
  id v11 = [v9 stringValue];
  id v12 = (void *)[v10 initWithString:v11];

  [a1[6] setObject:v12 forKeyedSubscript:v4];
}

- (void)_persistenceDidAddMessages:(id)a3
{
  objc_msgSend(a3, "ef_filter:", &__block_literal_global_160);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v4 count]) {
    [(EDSenderPersistence *)self _moveAddressesFromSentMessagesToPrimaryForMessages:v4];
  }
}

BOOL __50__EDSenderPersistence__persistenceDidAddMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mailbox];
  BOOL v3 = [v2 type] == 4;

  return v3;
}

- (void)_moveAddressesFromSentMessagesToPrimaryForMessages:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(processingQueue, v7);
}

void __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [v7 to];
        [v2 addObjectsFromArray:v8];

        id v9 = [v7 cc];
        [v2 addObjectsFromArray:v9];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke_2;
  v15[3] = &unk_1E6C062E8;
  void v15[4] = *(void *)(a1 + 40);
  id v10 = objc_msgSend(v2, "ef_filter:", v15);
  if ([v10 count])
  {
    id v11 = EDSenderLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Updating %ld addresses based on sent messages .", buf, 0xCu);
    }

    id v13 = *(void **)(a1 + 40);
    id v14 = [v10 allObjects];
    [v13 moveSenderWithEmailAddresses:v14 toBucket:200];
  }
}

BOOL __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  [*(id *)(a1 + 32) bucketForSenderAddress:a2 bucket:&v3];
  return v3 == 0;
}

- (unint64_t)handleReconciliationMergeErrorForTable:(id)a3 columnName:(id)a4 statement:(id)a5 journalRowID:(id)a6 protectedRowID:(id)a7 connection:(id)a8 rowsUpdated:(unint64_t *)a9 error:(id *)a10
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v14 = (__CFString *)a3;
  id v15 = (__CFString *)a4;
  id v71 = a6;
  id v70 = a7;
  id v72 = a8;
  id v68 = v14;
  id v69 = v15;
  if (v14 == @"sender_addresses" && v15 == @"address")
  {
    long long v16 = EDSenderLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = @"sender_addresses";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"address";
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Handling merge conflict for %{public}@.%{public}@", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v17 = *MEMORY[0x1E4F5FCC8];
    uint64_t v101 = *MEMORY[0x1E4F5FCC8];
    uint64_t v89 = 0;
    long long v90 = &v89;
    uint64_t v91 = 0x2020000000;
    uint64_t v92 = 0;
    uint64_t v85 = 0;
    long long v86 = &v85;
    uint64_t v87 = 0x2020000000;
    char v88 = 0;
    id v18 = objc_alloc(MEMORY[0x1E4F60EF8]);
    uint64_t v19 = *MEMORY[0x1E4F60D08];
    uint64_t v20 = (void *)[v18 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"senders"];
    [v20 addResultColumn:@"bucket"];
    [v20 addResultColumn:@"user_initiated"];
    id v21 = (id)[v20 join:@"sender_addresses" sourceColumn:v19 targetColumn:@"sender"];
    id v22 = [MEMORY[0x1E4F60E78] table:@"sender_addresses" column:@"address"];
    uint64_t v23 = [v22 equalTo:v71];
    [v20 setWhere:v23];

    id v83 = 0;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke;
    v84[3] = &unk_1E6C06310;
    v84[4] = buf;
    v84[5] = &v89;
    v84[6] = &v85;
    [v72 executeSelectStatement:v20 withBlock:v84 error:&v83];
    id v24 = v83;
    id v25 = EDSenderLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(*(void *)&buf[8] + 24);
      uint64_t v27 = v90[3];
      *(_DWORD *)id v98 = 134218240;
      *(void *)&v98[4] = v26;
      *(_WORD *)&v98[12] = 2048;
      *(void *)&v98[14] = v27;
      _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "Merge Conflict:Duplicate Sender: %ld : bucket %ld", v98, 0x16u);
    }

    *(void *)id v98 = 0;
    *(void *)&v98[8] = v98;
    *(void *)&v98[16] = 0x2020000000;
    uint64_t v99 = v17;
    uint64_t v79 = 0;
    id v80 = &v79;
    uint64_t v81 = 0x2020000000;
    uint64_t v82 = 0;
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:v19 table:@"senders"];
    [v28 addResultColumn:@"bucket"];
    [v28 addResultColumn:@"user_initiated"];
    id v29 = (id)[v28 join:@"sender_addresses" sourceColumn:v19 targetColumn:@"sender"];
    long long v30 = [MEMORY[0x1E4F60E78] table:@"sender_addresses" column:@"address"];
    long long v31 = [v30 equalTo:v70];
    [v28 setWhere:v31];

    id v77 = v24;
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_162;
    v78[3] = &unk_1E6C04FF0;
    v78[4] = v98;
    v78[5] = &v79;
    [v72 executeSelectStatement:v28 withBlock:v78 error:&v77];
    id v32 = v77;

    uint64_t v33 = EDSenderLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = *(void *)(*(void *)&v98[8] + 24);
      uint64_t v35 = v80[3];
      *(_DWORD *)long long v95 = 134218240;
      *(void *)&v95[4] = v34;
      *(_WORD *)&v95[12] = 2048;
      *(void *)&v95[14] = v35;
      _os_log_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Existing Sender Sender %ld : Bucket %ld", v95, 0x16u);
    }

    if (*(void *)(*(void *)&buf[8] + 24) != v17 && *(void *)(*(void *)&v98[8] + 24) != v17)
    {
      uint64_t v36 = v90[3];
      if (v36 && v36 != v80[3])
      {
        id v40 = EDSenderLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = v90[3];
          *(_DWORD *)long long v95 = 134217984;
          *(void *)&v95[4] = v41;
          _os_log_impl(&dword_1DB39C000, v40, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Updating sender bucket to %ld", v95, 0xCu);
        }

        id v42 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"senders"];
        id v43 = [NSNumber numberWithInteger:v90[3]];
        [v42 setObject:v43 forKeyedSubscript:@"bucket"];

        id v44 = [NSNumber numberWithBool:*((unsigned __int8 *)v86 + 24)];
        [v42 setObject:v44 forKeyedSubscript:@"user_initiated"];

        uint64_t v45 = [MEMORY[0x1E4F60E78] column:v19];
        uint64_t v46 = [NSNumber numberWithLongLong:*(void *)(*(void *)&v98[8] + 24)];
        uint64_t v47 = [v45 equalTo:v46];
        [v42 setWhereClause:v47];

        id v76 = v32;
        [v72 executeUpdateStatement:v42 error:&v76];
        id v37 = v76;
      }
      else
      {
        id v37 = v32;
      }
      id v48 = objc_alloc(MEMORY[0x1E4F60E48]);
      id v65 = [MEMORY[0x1E4F60E78] column:@"address"];
      uint64_t v49 = [v65 equalTo:v71];
      v97[0] = v49;
      long long v50 = [MEMORY[0x1E4F60E78] column:@"sender"];
      uint64_t v51 = [NSNumber numberWithLongLong:*(void *)(*(void *)&buf[8] + 24)];
      long long v52 = [v50 equalTo:v51];
      v97[1] = v52;
      long long v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
      id v67 = (void *)[v48 initWithExpressions:v53];

      id v54 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"sender_addresses" where:v67];
      [v72 executeDeleteStatement:v54 error:0];
      if (a9) {
        *a9 = sqlite3_changes((sqlite3 *)[v72 sqlDB]);
      }
      *(void *)long long v95 = 0;
      *(void *)&v95[8] = v95;
      *(void *)&v95[16] = 0x2020000000;
      uint64_t v96 = 0;
      id v66 = [v72 preparedStatementForQueryString:@"SELECT count(*) AS associations FROM sender_addresses WHERE sender = :duplicate_sender"];
      long long v93 = @":duplicate_sender";
      char v55 = [NSNumber numberWithLongLong:*(void *)(*(void *)&buf[8] + 24)];
      long long v94 = v55;
      id v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      id v74 = v37;
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_170;
      v75[3] = &unk_1E6BFF4C8;
      v75[4] = v95;
      [v66 executeWithNamedBindings:v56 usingBlock:v75 error:&v74];
      id v32 = v74;

      if (!*(void *)(*(void *)&v95[8] + 24))
      {
        id v57 = EDSenderLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v73 = 0;
          _os_log_impl(&dword_1DB39C000, v57, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Deleting duplicate sender", v73, 2u);
        }

        id v58 = objc_alloc(MEMORY[0x1E4F60E98]);
        id v59 = [MEMORY[0x1E4F60E78] column:v19];
        id v60 = [NSNumber numberWithLongLong:*(void *)(*(void *)&buf[8] + 24)];
        id v61 = [v59 equalTo:v60];
        id v62 = (void *)[v58 initWithTable:@"sender_addresses" where:v61];

        [v72 executeDeleteStatement:v62 error:0];
      }

      _Block_object_dispose(v95, 8);
    }
    if (v32)
    {
      unint64_t v63 = EDSenderLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v32, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSenderPersistence handleReconciliationMergeErrorForTable:columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:]();
      }
      unint64_t v39 = 2;
    }
    else
    {
      unint64_t v63 = EDSenderLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v95 = 0;
        _os_log_impl(&dword_1DB39C000, v63, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Successfully resolved conflict", v95, 2u);
      }
      unint64_t v39 = 0;
    }

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(v98, 8);

    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(buf, 8);
    if (a10 && v32)
    {
      id v32 = v32;
      *a10 = v32;
    }
  }
  else
  {
    id v38 = EDSenderLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[EDSenderPersistence handleReconciliationMergeErrorForTable:columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:]((uint64_t)v14, (uint64_t)v15, v38);
    }

    id v32 = 0;
    unint64_t v39 = 2;
  }

  return v39;
}

void __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  *(void *)(*(void *)(a1[4] + 8) + 24) = [v3 integerValue];

  uint64_t v4 = [v6 objectForKeyedSubscript:@"bucket"];
  *(void *)(*(void *)(a1[5] + 8) + 24) = [v4 integerValue];

  uint64_t v5 = [v6 objectForKeyedSubscript:@"user_initiated"];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v5 BOOLValue];
}

void __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_162(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];

  uint64_t v4 = [v5 objectForKeyedSubscript:@"bucket"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 integerValue];
}

void __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_170(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 objectForKeyedSubscript:@"associations"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if (a3 == 2) {
    [(EDSenderPersistence *)self _updateSentToFilter];
  }
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setContactStore:(id)a3
{
}

- (EFLazyCache)emailAddressToBucketCache
{
  return self->_emailAddressToBucketCache;
}

- (EFLazyCache)databaseIDToEmailAddressCache
{
  return self->_databaseIDToEmailAddressCache;
}

- (_EDSentToFilter)sentToAddressesFilter
{
  return self->_sentToAddressesFilter;
}

- (OS_dispatch_queue)sentToAddressesQueue
{
  return self->_sentToAddressesQueue;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_sentToAddressesQueue, 0);
  objc_storeStrong((id *)&self->_sentToAddressesFilter, 0);
  objc_storeStrong((id *)&self->_databaseIDToEmailAddressCache, 0);
  objc_storeStrong((id *)&self->_emailAddressToBucketCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

void __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Error occurred when searching for relavant senders: %{public}@", v5);
}

void __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5 = *(void *)(a2 + 32);
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(void *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Attempting to move sender with invalid email address %@ to category %lu", (uint8_t *)a3, a4);
}

- (void)_moveSenderWithEmailAddresses:toBucket:sync:userInitiated:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to move addresses: %{public}@", v5);
}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_10_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "<nil> address for ID %llu (sender ID %llu)", v3, v4);
}

- (void)userHasSentToSenderAddress:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  void *v2 = 67109378;
  OUTLINED_FUNCTION_8_0(v3, (uint64_t)v2);
  OUTLINED_FUNCTION_7_1(&dword_1DB39C000, v4, v5, "Returning 'sentTo' result %u from bloom filter for address: %{public}@", v6);
}

- (void)userHasSentToSenderAddress:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  _DWORD *v2 = 67109378;
  v2[1] = 1;
  OUTLINED_FUNCTION_8_0(v3, (uint64_t)v2);
  OUTLINED_FUNCTION_7_1(&dword_1DB39C000, v4, v5, "Returning 'sentTo' result %u from bloom filter for address: %{public}@", v6);
}

- (void)userHasSentToSenderAddress:.cold.3()
{
  OUTLINED_FUNCTION_9_0();
  void *v2 = 67109378;
  OUTLINED_FUNCTION_8_0(v3, (uint64_t)v2);
  OUTLINED_FUNCTION_7_1(&dword_1DB39C000, v4, v5, "Returning default 'sentTo' result %u for address: %{public}@", v6);
}

- (void)_addNewSenderWithAddressIDs:(uint64_t)a1 contactIdentifier:(NSObject *)a2 toBucket:connection:senderDatabaseID:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Unable to find sender for contact identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_newlyBlockedAddressesForBlockedAddressDatabaseIDs:connection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to determine newly blocked addresses, error: %{public}@", v5);
}

- (void)_newlyUnblockedAddressesForBlockedAddressDatabaseIDs:connection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to determine newly unblocked addresses, error: %{public}@", v5);
}

- (void)_addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to get contacts count: %{public}@", v5);
}

- (void)_addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to get contact email addresses: %{public}@", v5);
}

- (void)handleReconciliationMergeErrorForTable:columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Merge Conflict: Error occured during merge: %{public}@", v5);
}

- (void)handleReconciliationMergeErrorForTable:(os_log_t)log columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Merge Conflict: Unsupported merge conflict for %{public}@.%{public}@", (uint8_t *)&v3, 0x16u);
}

@end