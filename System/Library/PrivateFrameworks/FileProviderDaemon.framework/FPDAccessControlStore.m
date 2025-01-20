@interface FPDAccessControlStore
+ (id)sharedStore;
- (BOOL)lookupLRUSignature:(id)a3;
- (FPDAccessControlStore)init;
- (FPDAccessControlStore)initWithDatabaseBaseURL:(id)a3;
- (OS_dispatch_queue)syncQueue;
- (id)bookmarkForItemID:(id)a3 consumerIdentifier:(id)a4;
- (id)keyForBundleIdentifier:(id)a3 generateIfNotFound:(BOOL)a4 keyGenBlock:(id)a5;
- (id)verifyBookmark:(id)a3 auditToken:(id *)a4 consumerIdentifier:(id)a5;
- (void)addLRUSignature:(id)a3;
- (void)dealloc;
- (void)openDatabase;
- (void)performWithDBConnection:(id)a3;
- (void)reopenDatabaseAfterUnlock;
- (void)setSyncQueue:(id)a3;
- (void)validateDatabase:(id)a3;
@end

@implementation FPDAccessControlStore

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedStore_store;
  return v2;
}

uint64_t __36__FPDAccessControlStore_sharedStore__block_invoke()
{
  sharedStore_store = objc_alloc_init(FPDAccessControlStore);
  return MEMORY[0x1F41817F8]();
}

- (FPDAccessControlStore)init
{
  if (accessControlBaseURL_onceToken != -1) {
    dispatch_once(&accessControlBaseURL_onceToken, &__block_literal_global_90);
  }
  uint64_t v3 = accessControlBaseURL_url;
  return [(FPDAccessControlStore *)self initWithDatabaseBaseURL:v3];
}

- (FPDAccessControlStore)initWithDatabaseBaseURL:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FPDAccessControlStore;
  v6 = [(FPDAccessControlStore *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseBaseURL, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("FPDAccessControlStore sync queue", v8);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    dbConnection = v7->_dbConnection;
    v7->_dbConnection = (PQLConnection *)v11;

    [(PQLConnection *)v7->_dbConnection setLabel:@"access control"];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)firstUnlockNotificationCallback_0, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v14 = v7->_syncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__FPDAccessControlStore_initWithDatabaseBaseURL___block_invoke;
    block[3] = &unk_1E6A73FE8;
    v17 = v7;
    dispatch_sync(v14, block);
  }
  return v7;
}

uint64_t __49__FPDAccessControlStore_initWithDatabaseBaseURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openDatabase];
}

- (void)dealloc
{
  [(PQLConnection *)self->_dbConnection close:0];
  v3.receiver = self;
  v3.super_class = (Class)FPDAccessControlStore;
  [(FPDAccessControlStore *)&v3 dealloc];
}

- (void)performWithDBConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(FPDAccessControlStore *)self syncQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FPDAccessControlStore_performWithDBConnection___block_invoke;
  v7[3] = &unk_1E6A74AA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __49__FPDAccessControlStore_performWithDBConnection___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), 0);
}

- (void)reopenDatabaseAfterUnlock
{
  objc_super v3 = [(FPDAccessControlStore *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke;
  block[3] = &unk_1E6A73FE8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) openDatabase];
}

- (void)openDatabase
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Opened access control database", v1, 2u);
}

- (void)validateDatabase:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userVersion];
  if (!v5)
  {
    id v6 = [v4 lastError];
    v7 = [v6 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4FBA910]])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 11)
      {
        dispatch_queue_t v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          -[FPDAccessControlStore validateDatabase:]();
        }

        id v27 = v6;
        char v10 = [v4 destroyDatabaseWithError:&v27];
        id v11 = v27;

        if ((v10 & 1) == 0)
        {
          v19 = fp_current_or_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            -[FPDAccessControlStore validateDatabase:](v11, v19);
          }

          abort();
        }
        id v5 = &unk_1F2EDBC28;
        id v6 = v11;
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v5 = 0;
LABEL_10:
  }
  unint64_t v12 = [v5 unsignedIntegerValue];
  v13 = [(NSURL *)self->_databaseBaseURL URLByAppendingPathExtension:@"plist"];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  unint64_t v26 = v12;
  if (v12 <= 3)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    do
    {
      v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v24[3];
        *(_DWORD *)buf = 134218240;
        uint64_t v29 = v16;
        __int16 v30 = 2048;
        uint64_t v31 = v16 + 1;
        _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating from %lu to %lu", buf, 0x16u);
      }

      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __42__FPDAccessControlStore_validateDatabase___block_invoke;
      v20[3] = &unk_1E6A74D40;
      v22 = &v23;
      id v21 = v13;
      int v17 = [v4 performWithFlags:10 action:v20];

      if (!v17) {
        break;
      }
      unint64_t v18 = v24[3] + 1;
      v24[3] = v18;
    }
    while (v18 < 4);
  }
  _Block_object_dispose(&v23, 8);
  [v4 performWithFlags:0 action:&__block_literal_global_35];
}

uint64_t __42__FPDAccessControlStore_validateDatabase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v5 == 3)
  {
    [v3 execute:@"DROP TABLE IF EXISTS bundle_ids"];
    [v4 execute:@"DROP TABLE IF EXISTS vended_bookmarks"];
    [v4 execute:@"DROP TABLE IF EXISTS acl"];
    if (![v4 execute:@"CREATE TABLE bundle_keys(key INTEGER PRIMARY KEY, identifier TEXT UNIQUE NOT NULL, symmetric_key BLOB NOT NULL)"])goto LABEL_7; {
  }
    }
  else if (!v5)
  {
    id v6 = objc_opt_new();
    [v6 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
  if ([v4 setUserVersion:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1])
  {
    uint64_t v7 = 1;
    goto LABEL_12;
  }
LABEL_7:
  uint64_t v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_2(v4);
  }

  fp_simulate_crash();
  dispatch_queue_t v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_1();
  }

  uint64_t v7 = 0;
LABEL_12:

  return v7;
}

uint64_t __42__FPDAccessControlStore_validateDatabase___block_invoke_33(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 execute:@"DROP TABLE IF EXISTS lru_signature"];
  uint64_t v3 = [v2 execute:@"CREATE TABLE lru_signature(signature BLOB UNIQUE NOT NULL)"];

  return v3;
}

- (id)keyForBundleIdentifier:(id)a3 generateIfNotFound:(BOOL)a4 keyGenBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  uint64_t v23 = __Block_byref_object_dispose__7;
  id v24 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke;
  v14[3] = &unk_1E6A74DB0;
  id v10 = v8;
  id v15 = v10;
  BOOL v18 = a4;
  id v11 = v9;
  id v16 = v11;
  int v17 = &v19;
  [(FPDAccessControlStore *)self performWithDBConnection:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke_2;
  v6[3] = &unk_1E6A74D88;
  id v7 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 performWithFlags:16 action:v6];
}

uint64_t __79__FPDAccessControlStore_keyForBundleIdentifier_generateIfNotFound_keyGenBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 fetch:@"SELECT symmetric_key FROM bundle_keys WHERE identifier = %@", *(void *)(a1 + 32)];
  if ([v4 next]
    && ([v4 dataAtIndex:0], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
    id v8 = v5;

    uint64_t v9 = 1;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      uint64_t v9 = 0;
      goto LABEL_8;
    }
    char v10 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
    id v8 = v10;

    uint64_t v9 = [v3 execute:@"INSERT INTO bundle_keys (identifier, symmetric_key) VALUES (%@, %@)", *(void *)(a1 + 32), v8];
  }

LABEL_8:
  return v9;
}

- (id)bookmarkForItemID:(id)a3 consumerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v7 allowPlaceholder:0 error:0];
  uint64_t v9 = containingApplicationRecord(v8);

  if (v9)
  {
    if (checkBundleRecord(v9, v7))
    {
      char v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[FPDAccessControlStore bookmarkForItemID:consumerIdentifier:]((uint64_t)v6, v9, v10);
      }

      uint64_t v11 = [v9 bundleIdentifier];
      id v12 = [v9 installSessionIdentifier];
      v13 = [(FPDAccessControlStore *)self swift_bookmarkForItemID:v6 consumerIdentifier:v11 installSessionIdentifier:v12];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPDAccessControlStore bookmarkForItemID:consumerIdentifier:]();
    }

    v13 = [(FPDAccessControlStore *)self swift_bookmarkForItemID:v6 consumerIdentifier:v7 installSessionIdentifier:0];
  }

  return v13;
}

- (id)verifyBookmark:(id)a3 auditToken:(id *)a4 consumerIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = *(_OWORD *)&a4->var0[4];
  v19[0] = *(_OWORD *)a4->var0;
  v19[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:v19 error:0];
  id v12 = containingApplicationRecord(v11);

  if (v12)
  {
    if (checkBundleRecord(v12, v9))
    {
      v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[FPDAccessControlStore verifyBookmark:auditToken:consumerIdentifier:](v12, v13);
      }

      uint64_t v14 = [v12 bundleIdentifier];
      id v15 = [v12 installSessionIdentifier];
      id v16 = [(FPDAccessControlStore *)self swift_verifyBookmark:v8 consumerIdentifier:v14 installSessionIdentifier:v15];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    int v17 = fp_current_or_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[FPDAccessControlStore verifyBookmark:auditToken:consumerIdentifier:]();
    }

    id v16 = [(FPDAccessControlStore *)self swift_verifyBookmark:v8 consumerIdentifier:v9 installSessionIdentifier:0];
  }

  return v16;
}

- (BOOL)lookupLRUSignature:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__FPDAccessControlStore_lookupLRUSignature___block_invoke;
  v7[3] = &unk_1E6A74E00;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(FPDAccessControlStore *)self performWithDBConnection:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__FPDAccessControlStore_lookupLRUSignature___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__FPDAccessControlStore_lookupLRUSignature___block_invoke_2;
  v6[3] = &unk_1E6A74DD8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 performWithFlags:0 action:v6];
}

uint64_t __44__FPDAccessControlStore_lookupLRUSignature___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 fetch:@"SELECT COUNT(*) FROM lru_signature WHERE signature = %@", *(void *)(a1 + 32)];
  if ([v3 next]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)[v3 intAtIndex:0] > 0;
  }

  return 1;
}

- (void)addLRUSignature:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__FPDAccessControlStore_addLRUSignature___block_invoke;
  v6[3] = &unk_1E6A74E50;
  id v7 = v4;
  id v5 = v4;
  [(FPDAccessControlStore *)self performWithDBConnection:v6];
}

void __41__FPDAccessControlStore_addLRUSignature___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__FPDAccessControlStore_addLRUSignature___block_invoke_2;
  v3[3] = &unk_1E6A74E28;
  id v4 = *(id *)(a1 + 32);
  [a2 performWithFlags:0 action:v3];
}

uint64_t __41__FPDAccessControlStore_addLRUSignature___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 execute:@"INSERT OR IGNORE INTO lru_signature (signature) VALUES (%@)", *(void *)(a1 + 32)];
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_databaseBaseURL, 0);
  objc_storeStrong((id *)&self->_dbConnection, 0);
}

void __50__FPDAccessControlStore_reopenDatabaseAfterUnlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Retrying opening access control database after first unlock", v1, 2u);
}

- (void)validateDatabase:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1D744C000, a2, OS_LOG_TYPE_FAULT, "[CRIT] failed to destroy database after corruption: %@", v4, 0xCu);
}

- (void)validateDatabase:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_8(&dword_1D744C000, v0, v1, "[CRIT] acl database is corrupted, destroying it", v2, v3, v4, v5, v6);
}

void __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_8(&dword_1D744C000, v0, v1, "[SIMCRASH] Failed to migrate legacy database", v2, v3, v4, v5, v6);
}

void __42__FPDAccessControlStore_validateDatabase___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 lastError];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] Failed to migrate legacy database; %@", v4, v5, v6, v7, v8);
}

- (void)bookmarkForItemID:consumerIdentifier:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D744C000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] extending bookmark to %@ for %@", v2, 0x16u);
}

- (void)bookmarkForItemID:(NSObject *)a3 consumerIdentifier:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 bundleIdentifier];
  uint64_t v6 = [a2 installSessionIdentifier];
  OUTLINED_FUNCTION_3_1();
  uint64_t v10 = v5;
  __int16 v11 = v7;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] extending bookmark to %@ for %@ (%@)", v9, 0x20u);
}

- (void)verifyBookmark:auditToken:consumerIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] verifying bookmark for %@", v1, 0xCu);
}

- (void)verifyBookmark:(void *)a1 auditToken:(NSObject *)a2 consumerIdentifier:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 bundleIdentifier];
  uint64_t v5 = [a1 installSessionIdentifier];
  OUTLINED_FUNCTION_3_1();
  uint64_t v8 = v6;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] verifying bookmark for %@ (%@)", v7, 0x16u);
}

@end