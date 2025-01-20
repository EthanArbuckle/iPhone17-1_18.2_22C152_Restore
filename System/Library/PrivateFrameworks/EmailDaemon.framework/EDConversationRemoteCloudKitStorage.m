@interface EDConversationRemoteCloudKitStorage
+ (OS_os_log)log;
+ (id)cloudKitAPSTopics;
- (BOOL)isInitialized;
- (BOOL)isMigratedFromKVSStorage;
- (BOOL)synchronize;
- (EDCloudMirroringPersistentStore)mirroringPersistentStore;
- (EDConversationRemoteCloudKitStorage)initWithDelegate:(id)a3;
- (EDConversationRemoteStorageDelegate)delegate;
- (EDTransactionService)exportTransaction;
- (EDTransactionService)importTransaction;
- (NSFetchedResultsController)fetchedResultsController;
- (NSPersistentHistoryToken)historyToken;
- (id)_controlInManagedObjectContext:(id)a3;
- (id)_conversationInfoWithObjectId:(id)a3 managedObjectContext:(id)a4;
- (id)_conversationInfoWithUUID:(id)a3 managedObjectContext:(id)a4;
- (id)_conversationInfosWithUUID:(id)a3 managedObjectContext:(id)a4;
- (id)_transactionHistorySinceToken:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (id)allConversationInfosInManagedObjectContext:(id)a3;
- (id)dictionaryForConversationInfo:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryRepresentation;
- (id)entityForConversationDictionary:(id)a3 key:(id)a4 managedObjectContext:(id)a5;
- (id)enumerateChangeHistorySinceToken:(id)a3 managedObjectContext:(id)a4 usingBlock:(id)a5;
- (id)storageName;
- (void)_addOrUpdateConversationInfo:(id)a3 managedObjectContext:(id)a4;
- (void)_handleDidResetSyncDataNotification:(id)a3;
- (void)_handleDuplicationsForConversationUUIDs:(id)a3 managedObjectContext:(id)a4;
- (void)_handlePushNotification:(id)a3;
- (void)_handleWillResetSyncDataNotification:(id)a3;
- (void)_initialSetup;
- (void)_recoverHistoryToken;
- (void)_removeConversationInfoWithId:(id)a3 managedObjectContext:(id)a4;
- (void)_removeConversationInfoWithObjectId:(id)a3 save:(BOOL)a4 managedObjectContext:(id)a5;
- (void)_requestExportWithManagedObjectContext:(id)a3;
- (void)_requestFirstSyncWithManagedObjectContext:(id)a3;
- (void)_requestImportWithManagedObjectContext:(id)a3;
- (void)_retrieveChangesSinceLastRequestInManagedObjectContext:(id)a3;
- (void)_updateConversationInfo:(id)a3 withAnotherConversationInfo:(id)a4;
- (void)persistHistoryToken;
- (void)refresh;
- (void)removeDictionaryForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictionary:(id)a3 forKey:(id)a4;
- (void)setExportTransaction:(id)a3;
- (void)setHistoryToken:(id)a3;
- (void)setImportTransaction:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setMigratedFromKVSStorage:(BOOL)a3;
@end

@implementation EDConversationRemoteCloudKitStorage

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EDConversationRemoteCloudKitStorage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_29 != -1) {
    dispatch_once(&log_onceToken_29, block);
  }
  v2 = (void *)log_log_29;

  return (OS_os_log *)v2;
}

void __42__EDConversationRemoteCloudKitStorage_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_29;
  log_log_29 = (uint64_t)v1;
}

- (EDConversationRemoteCloudKitStorage)initWithDelegate:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EDConversationRemoteCloudKitStorage;
  v5 = [(EDConversationRemoteCloudKitStorage *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Initializing Conversation CloudKit Storage", buf, 2u);
    }

    v8 = [EDTransactionService alloc];
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v9 stringWithFormat:@"%@-Export", v11];
    v13 = [(EDTransactionService *)v8 initWithServiceName:v12];
    [(EDConversationRemoteCloudKitStorage *)v6 setExportTransaction:v13];

    v14 = [EDTransactionService alloc];
    v15 = NSString;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [v15 stringWithFormat:@"%@-Import", v17];
    v19 = [(EDTransactionService *)v14 initWithServiceName:v18];
    [(EDConversationRemoteCloudKitStorage *)v6 setImportTransaction:v19];

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v6 selector:sel__handleWillResetSyncDataNotification_ name:*MEMORY[0x1E4F1BDA8] object:0];
    [v20 addObserver:v6 selector:sel__handleDidResetSyncDataNotification_ name:*MEMORY[0x1E4F1BD98] object:0];
    [v20 addObserver:v6 selector:sel__handlePushNotification_ name:@"EDConversationRemoteCloudKitStoragePushNotificationName" object:0];
    v21 = objc_alloc_init(EDCloudMirroringPersistentStore);
    mirroringPersistentStore = v6->_mirroringPersistentStore;
    v6->_mirroringPersistentStore = v21;

    [(EDConversationRemoteCloudKitStorage *)v6 _initialSetup];
  }

  return v6;
}

- (void)_initialSetup
{
  id v3 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke;
  v4[3] = &unk_1E6C00BE0;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

void __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) exportTransaction];
  int v5 = [v4 hasPendingTransactions];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) exportTransaction];
    [v6 resetPendingTransactions];

    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_2(v7);
    }

    v8 = [*(id *)(a1 + 32) mirroringPersistentStore];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_36;
    v25[3] = &unk_1E6C00BE0;
    v25[4] = *(void *)(a1 + 32);
    [v8 performBlock:v25];
  }
  v9 = [*(id *)(a1 + 32) importTransaction];
  int v10 = [v9 hasPendingTransactions];

  if (v10)
  {
    v11 = [*(id *)(a1 + 32) importTransaction];
    [v11 resetPendingTransactions];

    v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_1(v12);
    }

    v13 = [*(id *)(a1 + 32) mirroringPersistentStore];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_38;
    v24[3] = &unk_1E6C00BE0;
    v24[4] = *(void *)(a1 + 32);
    [v13 performBlock:v24];
  }
  v14 = [*(id *)(a1 + 32) _controlInManagedObjectContext:v3];
  int v15 = [v14 migratedFromKVSStorage];

  v16 = *(void **)(a1 + 32);
  if (v15)
  {
    [v16 setInitialized:1];
    v17 = [*(id *)(a1 + 32) delegate];
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_14;
    }
    v19 = [*(id *)(a1 + 32) delegate];
    [v19 conversationRemoteStorageDidInitialize:*(void *)(a1 + 32)];
  }
  else
  {
    v19 = [v16 mirroringPersistentStore];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_2;
    v23[3] = &unk_1E6C00BE0;
    v23[4] = *(void *)(a1 + 32);
    [v19 performBlock:v23];
  }

LABEL_14:
  [*(id *)(a1 + 32) _recoverHistoryToken];
  v20 = [*(id *)(a1 + 32) historyToken];

  if (!v20)
  {
    v21 = [*(id *)(a1 + 32) mirroringPersistentStore];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_3;
    v22[3] = &unk_1E6C00BE0;
    v22[4] = *(void *)(a1 + 32);
    [v21 performBlock:v22];
  }
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_36(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestExportWithManagedObjectContext:a2];
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_38(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestImportWithManagedObjectContext:a2];
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestFirstSyncWithManagedObjectContext:a2];
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestImportWithManagedObjectContext:a2];
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__EDConversationRemoteCloudKitStorage_setDictionary_forKey___block_invoke;
  v11[3] = &unk_1E6C00C08;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 performBlockAndWait:v11];
}

void __60__EDConversationRemoteCloudKitStorage_setDictionary_forKey___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) entityForConversationDictionary:*(void *)(a1 + 40) key:*(void *)(a1 + 48) managedObjectContext:v3];
  int v5 = *(void **)(a1 + 32);
  id v6 = [v4 conversationUUID];
  v8[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 _handleDuplicationsForConversationUUIDs:v7 managedObjectContext:v3];

  [*(id *)(a1 + 32) _addOrUpdateConversationInfo:v4 managedObjectContext:v3];
}

- (void)removeDictionaryForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__EDConversationRemoteCloudKitStorage_removeDictionaryForKey___block_invoke;
  v7[3] = &unk_1E6C00C30;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlockAndWait:v7];
}

uint64_t __62__EDConversationRemoteCloudKitStorage_removeDictionaryForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeConversationInfoWithId:*(void *)(a1 + 40) managedObjectContext:a2];
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  int v5 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__EDConversationRemoteCloudKitStorage_dictionaryForKey___block_invoke;
  v9[3] = &unk_1E6C00C58;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__EDConversationRemoteCloudKitStorage_dictionaryForKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_conversationInfoWithUUID:managedObjectContext:", *(void *)(a1 + 40));
  uint64_t v4 = [*(id *)(a1 + 32) dictionaryForConversationInfo:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)dictionaryRepresentation
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  id v3 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__EDConversationRemoteCloudKitStorage_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E6C00C80;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __63__EDConversationRemoteCloudKitStorage_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allConversationInfosInManagedObjectContext:v3];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_msgSend(*(id *)(a1 + 32), "dictionaryForConversationInfo:", v12, (void)v17);
        uint64_t v14 = [v12 conversationUUID];
        int v15 = (void *)v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (BOOL)synchronize
{
  id v3 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__EDConversationRemoteCloudKitStorage_synchronize__block_invoke;
  v5[3] = &unk_1E6C00BE0;
  v5[4] = self;
  [v3 performBlockAndWait:v5];

  return 1;
}

uint64_t __50__EDConversationRemoteCloudKitStorage_synchronize__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestExportWithManagedObjectContext:a2];
}

- (void)refresh
{
  id v3 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__EDConversationRemoteCloudKitStorage_refresh__block_invoke;
  v4[3] = &unk_1E6C00BE0;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

uint64_t __46__EDConversationRemoteCloudKitStorage_refresh__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestImportWithManagedObjectContext:a2];
}

- (void)_requestExportWithManagedObjectContext:(id)a3
{
  id v4 = [(EDConversationRemoteCloudKitStorage *)self exportTransaction];
  uint64_t v5 = [v4 startTransaction];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v6 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __78__EDConversationRemoteCloudKitStorage__requestExportWithManagedObjectContext___block_invoke;
  v8[3] = &unk_1E6C00CA8;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 requestExportWithCompletionBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __78__EDConversationRemoteCloudKitStorage__requestExportWithManagedObjectContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained exportTransaction];
  [v2 endTransaction:*(void *)(a1 + 32)];
}

- (void)_requestImportWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  if ([(EDConversationRemoteCloudKitStorage *)self isInitialized])
  {
    uint64_t v5 = [(EDConversationRemoteCloudKitStorage *)self importTransaction];
    uint64_t v6 = [v5 startTransaction];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v7 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke;
    v9[3] = &unk_1E6C00CA8;
    objc_copyWeak(&v11, &location);
    id v8 = v6;
    id v10 = v8;
    [v7 requestImportWithCompletionBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(EDConversationRemoteCloudKitStorage *)self _requestFirstSyncWithManagedObjectContext:v4];
  }
}

void __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained mirroringPersistentStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke_2;
  v6[3] = &unk_1E6C00CD0;
  v6[4] = WeakRetained;
  id v7 = *(id *)(a1 + 32);
  char v8 = a2;
  [v5 performBlock:v6];
}

void __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) importTransaction];
  [v3 endTransaction:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _retrieveChangesSinceLastRequestInManagedObjectContext:v4];
  }
}

- (void)_requestFirstSyncWithManagedObjectContext:(id)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = [(EDConversationRemoteCloudKitStorage *)self importTransaction];
  uint64_t v5 = [v4 startTransaction];

  uint64_t v6 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke;
  v8[3] = &unk_1E6C00CA8;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 requestImportWithCompletionBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained importTransaction];
  [v5 endTransaction:*(void *)(a1 + 32)];

  uint64_t v6 = [WeakRetained mirroringPersistentStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke_2;
  v7[3] = &unk_1E6C00CF8;
  v7[4] = WeakRetained;
  char v8 = a2;
  [v6 performBlock:v7];
}

void __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    int v9 = 134217984;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "First request import arrived. Success: %lu", (uint8_t *)&v9, 0xCu);
  }

  if (*(unsigned char *)(a1 + 40) && ([*(id *)(a1 + 32) isInitialized] & 1) == 0)
  {
    [*(id *)(a1 + 32) setInitialized:1];
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [*(id *)(a1 + 32) delegate];
      [v8 conversationRemoteStorageDidInitialize:*(void *)(a1 + 32)];
    }
    [*(id *)(a1 + 32) _retrieveChangesSinceLastRequestInManagedObjectContext:v3];
  }
}

- (void)_handlePushNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__EDConversationRemoteCloudKitStorage__handlePushNotification___block_invoke;
  v7[3] = &unk_1E6C00C30;
  id v6 = v4;
  id v8 = v6;
  int v9 = self;
  [v5 performBlock:v7];
}

void __63__EDConversationRemoteCloudKitStorage__handlePushNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1A1D0];
  uint64_t v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v4 notificationFromRemoteNotificationDictionary:v5];

  char v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "APS Push received - %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 40) _requestImportWithManagedObjectContext:v3];
}

- (id)storageName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)isMigratedFromKVSStorage
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__EDConversationRemoteCloudKitStorage_isMigratedFromKVSStorage__block_invoke;
  v5[3] = &unk_1E6C00D20;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v3) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

void __63__EDConversationRemoteCloudKitStorage_isMigratedFromKVSStorage__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_controlInManagedObjectContext:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 migratedFromKVSStorage];
}

- (void)setMigratedFromKVSStorage:(BOOL)a3
{
  uint64_t v5 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke;
  v6[3] = &unk_1E6C00CF8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performBlockAndWait:v6];
}

void __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke(uint64_t a1, void *a2)
{
  void v8[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _controlInManagedObjectContext:v3];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"CloudKitControl" inManagedObjectContext:v3];
  }
  [v4 setMigratedFromKVSStorage:*(unsigned __int8 *)(a1 + 40)];
  v8[0] = 0;
  char v5 = [v3 save:v8];
  id v6 = v8[0];
  if ((v5 & 1) == 0)
  {
    BOOL v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke_cold_1();
    }
  }
}

+ (id)cloudKitAPSTopics
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)cloudKitAPSTopics_cloudKitAPSTopics;
  if (!cloudKitAPSTopics_cloudKitAPSTopics)
  {
    v6[0] = @"com.apple.icloud-container.com.apple.mobilemail";
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    id v4 = (void *)cloudKitAPSTopics_cloudKitAPSTopics;
    cloudKitAPSTopics_cloudKitAPSTopics = v3;

    v2 = (void *)cloudKitAPSTopics_cloudKitAPSTopics;
  }

  return v2;
}

- (id)entityForConversationDictionary:(id)a3 key:(id)a4 managedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(EDConversationRemoteCloudKitStorage *)self _conversationInfoWithUUID:v9 managedObjectContext:v10];
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"ConversationInfo" inManagedObjectContext:v10];
  }
  [v11 setConversationUUID:v9];
  id v12 = [v8 objectForKeyedSubscript:@"flags"];
  unint64_t v13 = [v12 unsignedLongLongValue];

  [v11 setNotifyMe:v13 & 1];
  [v11 setMuted:(v13 >> 2) & 1];
  uint64_t v14 = [v8 objectForKeyedSubscript:@"message-ids"];
  [v11 setMessageIds:v14];

  int v15 = (void *)MEMORY[0x1E4F1C9C8];
  BOOL v16 = [v8 objectForKeyedSubscript:@"last-modified"];
  [v16 doubleValue];
  long long v17 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
  [v11 setLastModified:v17];

  return v11;
}

- (id)dictionaryForConversationInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v3 muted]) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = [v3 notifyMe];
    }
    id v6 = [NSNumber numberWithUnsignedLongLong:v5];
    [v4 setObject:v6 forKeyedSubscript:@"flags"];

    BOOL v7 = [v3 messageIds];
    [v4 setObject:v7 forKeyedSubscript:@"message-ids"];

    id v8 = NSNumber;
    id v9 = [v3 lastModified];
    [v9 timeIntervalSince1970];
    id v10 = objc_msgSend(v8, "numberWithDouble:");
    [v4 setObject:v10 forKeyedSubscript:@"last-modified"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)persistHistoryToken
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to archive history token - Error: %{public}@", v5);
}

- (void)_recoverHistoryToken
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to unarchive history token - Error: %{public}@", v5);
}

- (void)_handleDuplicationsForConversationUUIDs:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v6;
  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v9)
  {
LABEL_24:

    goto LABEL_25;
  }
  char v10 = 0;
  uint64_t v23 = *(void *)v33;
  uint64_t v24 = v9;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v33 != v23) {
        objc_enumerationMutation(obj);
      }
      objc_super v25 = [(EDConversationRemoteCloudKitStorage *)self _conversationInfosWithUUID:*(void *)(*((void *)&v32 + 1) + 8 * i) managedObjectContext:v7];
      if ((unint64_t)[v25 count] >= 2)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v11 = objc_msgSend(v25, "subarrayWithRange:", 1, objc_msgSend(v25, "count") - 1);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v29;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v11);
              }
              int v15 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
              BOOL v16 = [(id)objc_opt_class() log];
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                long long v18 = [v15 conversationUUID];
                long long v19 = [v15 objectID];
                *(_DWORD *)buf = 138543618;
                v37 = v18;
                __int16 v38 = 2114;
                v39 = v19;
                _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "Deleting duplicated object. %{public}@, %{public}@", buf, 0x16u);
              }
              long long v17 = [v15 objectID];
              [(EDConversationRemoteCloudKitStorage *)self _removeConversationInfoWithObjectId:v17 save:0 managedObjectContext:v7];

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v12);
        }

        char v10 = 1;
      }
    }
    uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  }
  while (v24);

  if (v10)
  {
    id v27 = 0;
    char v20 = [v7 save:&v27];
    id v8 = v27;
    if ((v20 & 1) == 0)
    {
      v21 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDConversationRemoteCloudKitStorage _handleDuplicationsForConversationUUIDs:managedObjectContext:]();
      }
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (id)_conversationInfoWithUUID:(id)a3 managedObjectContext:(id)a4
{
  os_log_t v4 = [(EDConversationRemoteCloudKitStorage *)self _conversationInfosWithUUID:a3 managedObjectContext:a4];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)_conversationInfosWithUUID:(id)a3 managedObjectContext:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[EDConversationInfo fetchRequest];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"conversationUUID == %@", v5];
  [v7 setPredicate:v8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"lastModified" ascending:0];
  v16[0] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v7 setSortDescriptors:v10];

  id v15 = 0;
  uint64_t v11 = [v6 executeFetchRequest:v7 error:&v15];
  id v12 = v15;
  if (v12)
  {
    uint64_t v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _conversationInfosWithUUID:managedObjectContext:]();
    }
  }

  return v11;
}

- (void)_addOrUpdateConversationInfo:(id)a3 managedObjectContext:(id)a4
{
  void v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9[0] = 0;
  char v6 = [a4 save:v9];
  id v7 = v9[0];
  if ((v6 & 1) == 0)
  {
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v5 conversationUUID];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _addOrUpdateConversationInfo:managedObjectContext:]();
    }
  }
}

- (void)_updateConversationInfo:(id)a3 withAnotherConversationInfo:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  objc_msgSend(v8, "setNotifyMe:", objc_msgSend(v5, "notifyMe"));
  objc_msgSend(v8, "setMuted:", objc_msgSend(v5, "muted"));
  char v6 = [v5 messageIds];
  [v8 setMessageIds:v6];

  id v7 = [v5 lastModified];
  [v8 setLastModified:v7];
}

- (void)_removeConversationInfoWithId:(id)a3 managedObjectContext:(id)a4
{
  v12[4] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDConversationRemoteCloudKitStorage *)self _conversationInfoWithUUID:v6 managedObjectContext:v7];
  if (v8)
  {
    [v7 deleteObject:v8];
    v12[0] = 0;
    char v9 = [v7 save:v12];
    id v10 = v12[0];
    if ((v9 & 1) == 0)
    {
      uint64_t v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDConversationRemoteCloudKitStorage _removeConversationInfoWithId:managedObjectContext:]();
      }
    }
  }
}

- (void)_removeConversationInfoWithObjectId:(id)a3 save:(BOOL)a4 managedObjectContext:(id)a5
{
  BOOL v6 = a4;
  v16[8] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v16[0] = 0;
  char v9 = [v8 existingObjectWithID:v7 error:v16];
  id v10 = v16[0];
  if (v10)
  {
    uint64_t v11 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _removeConversationInfoWithObjectId:save:managedObjectContext:]();
    }
  }
  if (v9)
  {
    [v8 deleteObject:v9];
    if (v6)
    {
      id v15 = 0;
      char v12 = [v8 save:&v15];
      id v13 = v15;
      if ((v12 & 1) == 0)
      {
        uint64_t v14 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[EDConversationRemoteCloudKitStorage _removeConversationInfoWithId:managedObjectContext:]();
        }
      }
    }
  }
}

- (id)allConversationInfosInManagedObjectContext:(id)a3
{
  void v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  os_log_t v4 = +[EDConversationInfo fetchRequest];
  v9[0] = 0;
  id v5 = [v3 executeFetchRequest:v4 error:v9];
  id v6 = v9[0];
  if (v6)
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage allConversationInfosInManagedObjectContext:]();
    }
  }

  return v5;
}

- (id)_controlInManagedObjectContext:(id)a3
{
  v10[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  os_log_t v4 = +[EDCloudKitControl fetchRequest];
  v10[0] = 0;
  id v5 = [v3 executeFetchRequest:v4 error:v10];
  id v6 = v10[0];
  id v7 = [v5 firstObject];
  if (!v5)
  {
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _controlInManagedObjectContext:]();
    }
  }

  return v7;
}

- (void)_handleWillResetSyncDataNotification:(id)a3
{
  os_log_t v4 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__EDConversationRemoteCloudKitStorage__handleWillResetSyncDataNotification___block_invoke;
  v5[3] = &unk_1E6C00BE0;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __76__EDConversationRemoteCloudKitStorage__handleWillResetSyncDataNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "CoreData will reset sync couldKit data", v6, 2u);
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 conversationRemoteStorageWillResetData:*(void *)(a1 + 32)];
  }
}

- (void)_handleDidResetSyncDataNotification:(id)a3
{
  char v4 = [(EDConversationRemoteCloudKitStorage *)self mirroringPersistentStore];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__EDConversationRemoteCloudKitStorage__handleDidResetSyncDataNotification___block_invoke;
  v5[3] = &unk_1E6C00BE0;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __75__EDConversationRemoteCloudKitStorage__handleDidResetSyncDataNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "CoreData did reset sync couldKit data", v6, 2u);
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 conversationRemoteStorageDidResetData:*(void *)(a1 + 32)];
  }
}

- (void)_retrieveChangesSinceLastRequestInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [(EDConversationRemoteCloudKitStorage *)self historyToken];

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  id v23 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [(EDConversationRemoteCloudKitStorage *)self historyToken];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke;
  v14[3] = &unk_1E6C00D48;
  id v8 = v4;
  id v15 = v8;
  BOOL v16 = self;
  long long v17 = &v18;
  char v9 = [(EDConversationRemoteCloudKitStorage *)self enumerateChangeHistorySinceToken:v7 managedObjectContext:v8 usingBlock:v14];
  [(EDConversationRemoteCloudKitStorage *)self setHistoryToken:v9];

  if ([(id)v19[5] count])
  {
    id v10 = [(id)v19[5] allKeys];
    [(EDConversationRemoteCloudKitStorage *)self _handleDuplicationsForConversationUUIDs:v10 managedObjectContext:v8];

    uint64_t v11 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_INFO, "Finished handling core data changes", v13, 2u);
    }

    char v12 = [(EDConversationRemoteCloudKitStorage *)self delegate];
    [v12 conversationRemoteStorage:self didChangeEntries:v19[5] reason:v6];
  }
  [(EDConversationRemoteCloudKitStorage *)self persistHistoryToken];

  _Block_object_dispose(&v18, 8);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v3 = [v27 author];
  uint64_t v4 = [v3 componentsSeparatedByString:@"."];

  v26 = (void *)v4;
  id v5 = [(id)v4 firstObject];
  uint64_t v6 = [*(id *)(a1 + 32) transactionAuthor];
  LOBYTE(v4) = [v5 isEqualToString:v6];

  if ((v4 & 1) == 0)
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Started handling core data changes", buf, 2u);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = [v27 changes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v8);
          }
          char v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
          id v13 = (void *)MEMORY[0x1E0190280]();
          uint64_t v14 = [v12 changeType];
          if (!v14)
          {
            uint64_t v24 = *(void **)(a1 + 40);
            objc_super v25 = [v12 changedObjectID];
            long long v17 = [v24 _conversationInfoWithObjectId:v25 managedObjectContext:*(void *)(a1 + 32)];

            if (!v17)
            {
              uint64_t v18 = [(id)objc_opt_class() log];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_1(&v32, v33);
              }
              goto LABEL_30;
            }
            v21 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v39 = v17;
              _os_log_debug_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEBUG, "EDConversationInfo added. %{public}@", buf, 0xCu);
            }
LABEL_19:

            uint64_t v18 = [*(id *)(a1 + 40) dictionaryForConversationInfo:v17];
            uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            id v23 = [v17 conversationUUID];
            [v22 setObject:v18 forKeyedSubscript:v23];

            goto LABEL_30;
          }
          if (v14 == 1)
          {
            long long v19 = *(void **)(a1 + 40);
            uint64_t v20 = [v12 changedObjectID];
            long long v17 = [v19 _conversationInfoWithObjectId:v20 managedObjectContext:*(void *)(a1 + 32)];

            if (!v17)
            {
              uint64_t v18 = [(id)objc_opt_class() log];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_2(&v30, v31);
              }
              goto LABEL_30;
            }
            v21 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v39 = v17;
              _os_log_debug_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEBUG, "EDConversationInfo updated/inserted. %{public}@", buf, 0xCu);
            }
            goto LABEL_19;
          }
          if (v14 != 2) {
            goto LABEL_31;
          }
          id v15 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            [v12 changedObjectID];
            objc_claimAutoreleasedReturnValue();
            __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_4();
          }

          BOOL v16 = [v12 tombstone];
          long long v17 = [v16 objectForKeyedSubscript:@"conversationUUID"];

          if (v17)
          {
            uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v18 forKeyedSubscript:v17];
          }
          else
          {
            uint64_t v18 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_3(&v28, v29);
            }
          }
LABEL_30:

LABEL_31:
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v9);
    }
  }
}

- (id)enumerateChangeHistorySinceToken:(id)a3 managedObjectContext:(id)a4 usingBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, unsigned char *))a5;
  id v10 = v8;
  id v28 = 0;
  uint64_t v11 = [(EDConversationRemoteCloudKitStorage *)self _transactionHistorySinceToken:v10 managedObjectContext:a4 error:&v28];
  id v12 = v28;
  id v13 = v10;
  if (v11)
  {
    id v13 = v10;
    if ([v11 count])
    {
      id v22 = v12;
      char v27 = 0;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
      id v13 = v10;
      if (v15)
      {
        uint64_t v16 = *(void *)v24;
        id v13 = v10;
LABEL_5:
        uint64_t v17 = 0;
        uint64_t v18 = v13;
        while (1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
          v9[2](v9, v19, &v27);
          id v13 = [v19 token];

          if (v27) {
            break;
          }
          ++v17;
          uint64_t v18 = v13;
          if (v15 == v17)
          {
            uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
            if (v15) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      id v12 = v22;
    }
  }
  if (v12 && [v12 code] == 134301) {
    id v20 = 0;
  }
  else {
    id v20 = v13;
  }

  return v20;
}

- (id)_transactionHistorySinceToken:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  v16[4] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F1C160] fetchHistoryAfterToken:v7];
  [v9 setResultType:5];
  v16[0] = 0;
  id v10 = [v8 executeRequest:v9 error:v16];
  id v11 = v16[0];
  id v12 = v11;
  if (a5) {
    *a5 = v11;
  }
  if (v10 && [v10 resultType] == 5)
  {
    id v13 = [v10 result];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_12;
    }
    id v14 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[EDConversationRemoteCloudKitStorage _transactionHistorySinceToken:managedObjectContext:error:]((uint64_t)v13, v14);
    }
  }
  else
  {
    id v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _transactionHistorySinceToken:managedObjectContext:error:]();
    }
  }

  id v13 = 0;
LABEL_12:

  return v13;
}

- (id)_conversationInfoWithObjectId:(id)a3 managedObjectContext:(id)a4
{
  void v14[4] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14[0] = 0;
  uint64_t v6 = [a4 existingObjectWithID:v5 error:v14];
  id v7 = v14[0];
  if (v7)
  {
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _conversationInfoWithObjectId:managedObjectContext:]();
    }
  }
  if (v6
    && ([v6 entity],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 name],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqualToString:@"ConversationInfo"],
        v10,
        v9,
        v11))
  {
    id v12 = v6;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (EDCloudMirroringPersistentStore)mirroringPersistentStore
{
  return self->_mirroringPersistentStore;
}

- (EDConversationRemoteStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDConversationRemoteStorageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (void)setHistoryToken:(id)a3
{
}

- (EDTransactionService)exportTransaction
{
  return self->_exportTransaction;
}

- (void)setExportTransaction:(id)a3
{
}

- (EDTransactionService)importTransaction
{
  return self->_importTransaction;
}

- (void)setImportTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importTransaction, 0);
  objc_storeStrong((id *)&self->_exportTransaction, 0);
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mirroringPersistentStore, 0);
}

void __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Found pending import transaction. Retrying request import", v1, 2u);
}

void __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Found pending export transaction. Retrying request export", v1, 2u);
}

void __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to save Control - Error: %{public}@", v5);
}

- (void)_handleDuplicationsForConversationUUIDs:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to save _handleDuplicationsForConversationUUIDs - Error: %{public}@", v5);
}

- (void)_conversationInfosWithUUID:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to fetching EDConversationInfo with ID: %{public}@ - Error: %{public}@", v4, v5);
}

- (void)_addOrUpdateConversationInfo:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = (void *)v1;
  OUTLINED_FUNCTION_1_2(v1, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to save EDConversationInfo %{public}@ - Error: %{public}@", v5, v6);
}

- (void)_removeConversationInfoWithId:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed to delete EDConversationInfo %{public}@ - Error: %{public}@", v4, v5);
}

- (void)_removeConversationInfoWithObjectId:save:managedObjectContext:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed fetching EDConversationInfo to remove. ObjectId: %{public}@ - Error: %{public}@", v4, v5);
}

- (void)allConversationInfosInManagedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to fetching allConversationInfos- Error: %{public}@", v5);
}

- (void)_controlInManagedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to fetching cloudKitControl: %{public}@", v5);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6_0(a1, a2);
  _os_log_debug_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEBUG, "Ignoring insert because object does not exist.", v3, 2u);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6_0(a1, a2);
  _os_log_debug_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEBUG, "Ignoring update because objecvt does not exist.", v3, 2u);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6_0(a1, a2);
  _os_log_error_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_ERROR, "Deletion operation does not have ConversationUUID.", v3, 2u);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5();
  *uint64_t v1 = 138543362;
  *int v3 = v2;
  _os_log_debug_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEBUG, "EDConversationInfo deleted. %{public}@", v4, 0xCu);
}

- (void)_transactionHistorySinceToken:managedObjectContext:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to fetch change history (%{public}@.)", v5);
}

- (void)_transactionHistorySinceToken:(uint64_t)a1 managedObjectContext:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "persistentHistoryResult.result is not an array. Ignoring it %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_conversationInfoWithObjectId:managedObjectContext:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1DB39C000, "Failed fetching EDConversationInfo. ObjectId: %{public}@ - Error: %{public}@", v4, v5);
}

@end