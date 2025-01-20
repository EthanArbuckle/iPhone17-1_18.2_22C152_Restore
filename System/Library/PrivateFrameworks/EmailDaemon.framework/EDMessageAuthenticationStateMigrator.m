@interface EDMessageAuthenticationStateMigrator
+ (OS_dispatch_queue)migrationQueue;
+ (OS_os_log)log;
+ (id)queryForInboxMessagesToAuthenticate;
+ (id)queryForNonInboxMessagesToAuthenticate;
- (EDCategoryPersistence)categoryPersistence;
- (EDMessageAuthenticationStateMigrator)initWithCategoryPersistence:(id)a3 authenticator:(id)a4 messagePersistence:(id)a5;
- (EDMessageAuthenticator)authenticator;
- (EDMessagePersistence)messagePersistence;
- (void)_authenticateMessageBatch:(id)a3 cancelationToken:(id)a4;
- (void)_iteratePersistedMessagesDroppingLockForMatchingQuery:(id)a3 limit:(int64_t)a4 batchSize:(int64_t)a5 cancelationToken:(id)a6 requireProtectedData:(BOOL)a7 handler:(id)a8 completion:(id)a9;
- (void)migrateMessageAuthenticationStateForQuery:(id)a3 cancelationToken:(id)a4 completion:(id)a5;
@end

@implementation EDMessageAuthenticationStateMigrator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EDMessageAuthenticationStateMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_49 != -1) {
    dispatch_once(&log_onceToken_49, block);
  }
  v2 = (void *)log_log_49;

  return (OS_os_log *)v2;
}

void __43__EDMessageAuthenticationStateMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_49;
  log_log_49 = (uint64_t)v1;
}

- (EDMessageAuthenticationStateMigrator)initWithCategoryPersistence:(id)a3 authenticator:(id)a4 messagePersistence:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EDMessageAuthenticationStateMigrator;
  v12 = [(EDMessageAuthenticationStateMigrator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_categoryPersistence, a3);
    objc_storeStrong((id *)&v13->_messagePersistence, a5);
    objc_storeStrong((id *)&v13->_authenticator, a4);
  }

  return v13;
}

+ (OS_dispatch_queue)migrationQueue
{
  if (migrationQueue_onceToken != -1) {
    dispatch_once(&migrationQueue_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)migrationQueue_queue;

  return (OS_dispatch_queue *)v2;
}

void __54__EDMessageAuthenticationStateMigrator_migrationQueue__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.email.EDMessageAuthenticationStateMigrator", v0);
  v2 = (void *)migrationQueue_queue;
  migrationQueue_queue = (uint64_t)v1;
}

+ (id)queryForNonInboxMessagesToAuthenticate
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F60390] predicateForExcludingMessagesInMailboxesWithTypes:&unk_1F35BB450];
  id v3 = +[EDMessageListItemPredicates predicateForUnauthenticatedMessages];
  v4 = (void *)MEMORY[0x1E4F28BA0];
  v10[0] = v2;
  v10[1] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = [v4 andPredicateWithSubpredicates:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F60418]);
  v8 = (void *)[v7 initWithTargetClass:objc_opt_class() predicate:v6 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  return v8;
}

+ (id)queryForInboxMessagesToAuthenticate
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = +[EDMessageListItemPredicates predicateForUnauthenticatedMessages];
  id v3 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxWithType:7];
  v4 = (void *)MEMORY[0x1E4F28BA0];
  v10[0] = v2;
  v10[1] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v6 = [v4 andPredicateWithSubpredicates:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F60418]);
  v8 = (void *)[v7 initWithTargetClass:objc_opt_class() predicate:v6 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  return v8;
}

- (void)migrateMessageAuthenticationStateForQuery:(id)a3 cancelationToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() migrationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken_completion___block_invoke;
  v15[3] = &unk_1E6C01A40;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __110__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken_completion___block_invoke(void *a1)
{
  v2 = +[EDMessageAuthenticationStateMigrator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Querying for messages to authenticate.", buf, 2u);
  }

  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v5 = (void *)a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken_completion___block_invoke_14;
  v8[3] = &unk_1E6C01EF0;
  id v6 = v5;
  uint64_t v7 = a1[4];
  id v9 = v6;
  uint64_t v10 = v7;
  [v3 _iteratePersistedMessagesDroppingLockForMatchingQuery:v4 limit:0x7FFFFFFFFFFFFFFFLL batchSize:100 cancelationToken:v6 requireProtectedData:1 handler:v8 completion:a1[7]];
}

void __110__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[EDMessageAuthenticationStateMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(v6, "ef_publicDescription");
      __110__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken_completion___block_invoke_14_cold_1(v8, (uint8_t *)&v10, v7);
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) isCanceled])
  {
    uint64_t v7 = +[EDMessageAuthenticationStateMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      int v11 = [v5 count];
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Migration was canceled before finishing batch of %u messages. Returning early", (uint8_t *)&v10, 8u);
    }
    goto LABEL_7;
  }
  id v9 = +[EDMessageAuthenticationStateMigrator log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109120;
    int v11 = [v5 count];
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Authenticating batch of %u messages.", (uint8_t *)&v10, 8u);
  }

  [*(id *)(a1 + 40) _authenticateMessageBatch:v5 cancelationToken:*(void *)(a1 + 32)];
LABEL_8:
}

- (void)_iteratePersistedMessagesDroppingLockForMatchingQuery:(id)a3 limit:(int64_t)a4 batchSize:(int64_t)a5 cancelationToken:(id)a6 requireProtectedData:(BOOL)a7 handler:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v14 = a6;
  objc_super v15 = (void (**)(id, uint64_t, uint64_t))a8;
  v29 = (void (**)(void))a9;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__18;
  v44 = __Block_byref_object_dispose__18;
  id v45 = (id)0xAAAAAAAAAAAAAAAALL;
  id v45 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__18;
  v38 = __Block_byref_object_dispose__18;
  id v39 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __167__EDMessageAuthenticationStateMigrator__iteratePersistedMessagesDroppingLockForMatchingQuery_limit_batchSize_cancelationToken_requireProtectedData_handler_completion___block_invoke;
  aBlock[3] = &unk_1E6C01F18;
  aBlock[4] = &v46;
  aBlock[5] = &v40;
  aBlock[6] = &v34;
  v32 = _Block_copy(aBlock);
  BOOL v16 = 1;
  while (!v35[5] && v47[3] < a4 && v16)
  {
    if ([v14 isCanceled])
    {
      v25 = +[EDMessageAuthenticationStateMigrator log];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 134218240;
      uint64_t v51 = (uint64_t)v14;
      __int16 v52 = 2048;
      v53 = self;
      v26 = "MigrationToken:{%p} cancelled. Stopping EDMessageAuthenticationStateMigrator:<%p>";
      v27 = v25;
      uint32_t v28 = 22;
      goto LABEL_22;
    }
    id v17 = +[EDMessageAuthenticationStateMigrator log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v47[3];
      *(_DWORD *)buf = 134217984;
      uint64_t v51 = v18;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Iterating messages for validation_state = 0. Current processedCount:%lld", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E0190280]();
    if (a4 - v47[3] >= a5) {
      int64_t v20 = a5;
    }
    else {
      int64_t v20 = a4 - v47[3];
    }
    v21 = [(EDMessageAuthenticationStateMigrator *)self messagePersistence];
    [v21 iteratePersistedMessagesMatchingQuery:v31 limit:v20 cancelationToken:v14 requireProtectedData:v10 handler:v32];

    if ([(id)v41[5] count] || v35[5])
    {
      v22 = +[EDMessageAuthenticationStateMigrator log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [(id)v41[5] count];
        *(_DWORD *)buf = 134217984;
        uint64_t v51 = v23;
        _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Invoking _authenticateMessageBatch handler for %lu messages.", buf, 0xCu);
      }

      v15[2](v15, v41[5], v35[5]);
    }
    uint64_t v24 = [(id)v41[5] count];
    [(id)v41[5] removeAllObjects];
    BOOL v16 = v24 == v20;
  }
  if (v29) {
    v29[2]();
  }
  v25 = +[EDMessageAuthenticationStateMigrator log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v26 = "Finished authenticating messages";
    v27 = v25;
    uint32_t v28 = 2;
LABEL_22:
    _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
  }
LABEL_23:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __167__EDMessageAuthenticationStateMigrator__iteratePersistedMessagesDroppingLockForMatchingQuery_limit_batchSize_cancelationToken_requireProtectedData_handler_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  *(void *)(*(void *)(a1[4] + 8) + 24) += [v9 count];
  if ([v9 count]) {
    [*(id *)(*(void *)(a1[5] + 8) + 40) addObjectsFromArray:v9];
  }
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)_authenticateMessageBatch:(id)a3 cancelationToken:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EDMessageAuthenticationStateMigrator *)self authenticator];
  int v9 = [v8 authenticateMessages:v6 trustingServer:1 cancelationToken:v7];

  if (v9)
  {
    BOOL v10 = +[EDMessageAuthenticationStateMigrator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = [v6 count];
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Successfully authenticated a batch of messages (count:%lu)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    int v11 = +[EDMessageAuthenticationStateMigrator log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[EDMessageAuthenticationStateMigrator _authenticateMessageBatch:cancelationToken:]((uint8_t *)&v12, [v6 count], v11);
    }

    if (v7) {
      [v7 cancel];
    }
  }
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDMessageAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_categoryPersistence, 0);
}

void __110__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken_completion___block_invoke_14_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Message authentication state migrator query failed with error %{public}@", buf, 0xCu);
}

- (void)_authenticateMessageBatch:(os_log_t)log cancelationToken:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to successfully authenticate messages (count:%lu)", buf, 0xCu);
}

@end