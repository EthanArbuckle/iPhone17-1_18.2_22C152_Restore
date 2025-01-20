@interface EDMessageAuthenticationAndCategoryMigrator
+ (OS_os_log)log;
- (BOOL)_checkContentProtectionState;
- (EDCategoryMigrator)categoryMigrator;
- (EDCategoryPersistence)categoryPersistence;
- (EDMessageAuthenticationAndCategoryMigrator)initWithCategoryPersistence:(id)a3 categorizer:(id)a4 authenticator:(id)a5 messagePersistence:(id)a6 activityPersistence:(id)a7 reason:(int64_t)a8;
- (EDMessageAuthenticationStateMigrator)authenticationStateMigrator;
- (EDMessageAuthenticator)authenticator;
- (EDMessageCategorizer)categorizer;
- (EDMessagePersistence)messagePersistence;
- (NSConditionLock)contentProtectionState;
- (OS_dispatch_queue)backgroundMessageMigrationQueue;
- (OS_dispatch_queue)contentProtectionQueue;
- (id)_createToken;
- (id)_reasonString;
- (id)startMigrationIfNecessaryWithCategorizationQuery:(id)a3 completion:(id)a4;
- (id)startMigrationWithProgressHandler:(id)a3 completion:(id)a4;
- (int64_t)reason;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)setContentProtectionQueue:(id)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation EDMessageAuthenticationAndCategoryMigrator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EDMessageAuthenticationAndCategoryMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_48 != -1) {
    dispatch_once(&log_onceToken_48, block);
  }
  v2 = (void *)log_log_48;

  return (OS_os_log *)v2;
}

void __49__EDMessageAuthenticationAndCategoryMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_48;
  log_log_48 = (uint64_t)v1;
}

- (EDMessageAuthenticationAndCategoryMigrator)initWithCategoryPersistence:(id)a3 categorizer:(id)a4 authenticator:(id)a5 messagePersistence:(id)a6 activityPersistence:(id)a7 reason:(int64_t)a8
{
  id v14 = a3;
  id v34 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v35.receiver = self;
  v35.super_class = (Class)EDMessageAuthenticationAndCategoryMigrator;
  v18 = [(EDMessageAuthenticationAndCategoryMigrator *)&v35 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_categoryPersistence, a3);
    objc_storeStrong((id *)&v19->_messagePersistence, a6);
    objc_storeStrong((id *)&v19->_categorizer, a4);
    objc_storeStrong((id *)&v19->_authenticator, a5);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.email.EDMessageAuthenticationAndCategoryMigrator", v21);
    contentProtectionQueue = v19->_contentProtectionQueue;
    v19->_contentProtectionQueue = (OS_dispatch_queue *)v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.email.MessageMigrator", v25);
    backgroundMessageMigrationQueue = v19->_backgroundMessageMigrationQueue;
    v19->_backgroundMessageMigrationQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    contentProtectionState = v19->_contentProtectionState;
    v19->_contentProtectionState = (NSConditionLock *)v28;

    v30 = [[EDMessageAuthenticationStateMigrator alloc] initWithCategoryPersistence:v14 authenticator:v15 messagePersistence:v16];
    authenticationStateMigrator = v19->_authenticationStateMigrator;
    v19->_authenticationStateMigrator = v30;

    +[EDCategoryMigrator initializeIfNeededWithCategoryPersistence:v14 categorizer:v34 messagePersistence:v16 activityPersistence:v17];
    v19->_reason = a8;
  }

  return v19;
}

- (id)startMigrationWithProgressHandler:(id)a3 completion:(id)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v24 = a4;
  v6 = [(EDMessageAuthenticationAndCategoryMigrator *)self _createToken];
  v7 = [(EDMessageAuthenticationAndCategoryMigrator *)self categoryPersistence];
  uint64_t v8 = [v7 currentCategorizationVersion];

  v27 = +[EDMessageCategorizer queryForMessagesToCategorizeForVersion:v8];
  v25 = [MEMORY[0x1E4F60E18] promise];
  v9 = +[EDMessageAuthenticationAndCategoryMigrator log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Starting Inbox Category Migration.", buf, 2u);
  }

  int64_t v10 = [(EDMessageAuthenticationAndCategoryMigrator *)self reason];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __91__EDMessageAuthenticationAndCategoryMigrator_startMigrationWithProgressHandler_completion___block_invoke;
  v32[3] = &unk_1E6C01E80;
  id v11 = v25;
  id v33 = v11;
  +[EDCategoryMigrator migrateCategoryForQuery:v27 cancelationToken:v6 reason:v10 progressHandler:v26 completion:v32];
  v12 = +[EDMessageAuthenticationStateMigrator queryForInboxMessagesToAuthenticate];
  v13 = [MEMORY[0x1E4F60E18] promise];
  id v14 = +[EDMessageAuthenticationAndCategoryMigrator log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Starting Inbox AuthState Migration.", buf, 2u);
  }

  id v15 = [(EDMessageAuthenticationAndCategoryMigrator *)self authenticationStateMigrator];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __91__EDMessageAuthenticationAndCategoryMigrator_startMigrationWithProgressHandler_completion___block_invoke_21;
  v30[3] = &unk_1E6C01E80;
  id v16 = v13;
  id v31 = v16;
  [v15 migrateMessageAuthenticationStateForQuery:v12 cancelationToken:v6 completion:v30];

  id v17 = (void *)MEMORY[0x1E4F60D70];
  v18 = [v11 future];
  v35[0] = v18;
  v19 = [v16 future];
  v35[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v21 = [v17 join:v20];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__EDMessageAuthenticationAndCategoryMigrator_startMigrationWithProgressHandler_completion___block_invoke_24;
  v28[3] = &unk_1E6C009C8;
  id v22 = v24;
  id v29 = v22;
  [v21 always:v28];

  return v6;
}

void __91__EDMessageAuthenticationAndCategoryMigrator_startMigrationWithProgressHandler_completion___block_invoke(uint64_t a1)
{
  v2 = +[EDMessageAuthenticationAndCategoryMigrator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Completed Inbox Category Migration.", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x1E4F1CA98] null];
  [v3 finishWithResult:v4];
}

void __91__EDMessageAuthenticationAndCategoryMigrator_startMigrationWithProgressHandler_completion___block_invoke_21(uint64_t a1)
{
  v2 = +[EDMessageAuthenticationAndCategoryMigrator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Completed AuthState Category Migration.", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x1E4F1CA98] null];
  [v3 finishWithResult:v4];
}

uint64_t __91__EDMessageAuthenticationAndCategoryMigrator_startMigrationWithProgressHandler_completion___block_invoke_24(uint64_t a1)
{
  v2 = +[EDMessageAuthenticationAndCategoryMigrator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Completed Inbox Category & AuthState Migration.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)_reasonString
{
  int64_t v2 = [(EDMessageAuthenticationAndCategoryMigrator *)self reason];
  if ((unint64_t)(v2 - 1) > 3) {
    return @"NewMessage";
  }
  else {
    return off_1E6C01EC8[v2 - 1];
  }
}

- (id)_createToken
{
  id v3 = objc_alloc(MEMORY[0x1E4F60D40]);
  v4 = NSString;
  v5 = [(EDMessageAuthenticationAndCategoryMigrator *)self _reasonString];
  v6 = [v4 stringWithFormat:@"migrator reason:%@", v5];
  v7 = (void *)[v3 initWithLabel:v6];

  return v7;
}

- (id)startMigrationIfNecessaryWithCategorizationQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v8 = [(EDMessageAuthenticationAndCategoryMigrator *)self _createToken];
    EFRegisterContentProtectionObserver();
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    backgroundMessageMigrationQueue = self->_backgroundMessageMigrationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__EDMessageAuthenticationAndCategoryMigrator_startMigrationIfNecessaryWithCategorizationQuery_completion___block_invoke;
    block[3] = &unk_1E6C01EA8;
    objc_copyWeak(&v18, &location);
    id v15 = v6;
    id v10 = v8;
    id v16 = v10;
    id v17 = v7;
    dispatch_async(backgroundMessageMigrationQueue, block);
    id v11 = v17;
    id v12 = v10;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __106__EDMessageAuthenticationAndCategoryMigrator_startMigrationIfNecessaryWithCategorizationQuery_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _checkContentProtectionState];
    v4 = +[EDMessageAuthenticationAndCategoryMigrator log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Starting to migrate messages", buf, 2u);
    }

    do
    {
      v5 = (void *)MEMORY[0x1E0190280]();
      id v6 = [v3 contentProtectionState];
      [v6 lockWhenCondition:0];

      id v7 = [v3 contentProtectionState];
      [v7 unlock];

      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        +[EDCategoryMigrator migrateCategoryForQuery:v8 cancelationToken:*(void *)(a1 + 40) reason:3 progressHandler:0 completion:*(void *)(a1 + 48)];
      }
      if (([*(id *)(a1 + 40) isCanceled] & 1) == 0)
      {
        if (![v3 _checkContentProtectionState])
        {
          int v10 = 0;
          goto LABEL_14;
        }
        v9 = +[EDMessageAuthenticationAndCategoryMigrator log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "No messages found to recategorize.", v11, 2u);
        }
      }
      int v10 = 1;
LABEL_14:
    }
    while (!v10);
  }
}

- (BOOL)_checkContentProtectionState
{
  int64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(EDMessageAuthenticationAndCategoryMigrator *)self contentProtectionQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__EDMessageAuthenticationAndCategoryMigrator__checkContentProtectionState__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __74__EDMessageAuthenticationAndCategoryMigrator__checkContentProtectionState__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = EFProtectedDataAvailable();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int64_t v2 = [*(id *)(a1 + 32) contentProtectionState];
    [v2 lock];

    id v3 = [*(id *)(a1 + 32) contentProtectionState];
    [v3 unlockWithCondition:1];

    v4 = +[EDMessageAuthenticationAndCategoryMigrator log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Protected Index unavailable", v5, 2u);
    }
  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  uint64_t v6 = [(EDMessageAuthenticationAndCategoryMigrator *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v6);

  if (a3 == 2)
  {
    int v10 = +[EDMessageAuthenticationAndCategoryMigrator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Device about to lock", v12, 2u);
    }

    id v11 = [(EDMessageAuthenticationAndCategoryMigrator *)self contentProtectionState];
    [v11 lock];

    char v9 = [(EDMessageAuthenticationAndCategoryMigrator *)self contentProtectionState];
    [v9 unlockWithCondition:1];
  }
  else
  {
    if (a3) {
      return;
    }
    id v7 = +[EDMessageAuthenticationAndCategoryMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index became available", buf, 2u);
    }

    uint64_t v8 = [(EDMessageAuthenticationAndCategoryMigrator *)self contentProtectionState];
    [v8 lock];

    char v9 = [(EDMessageAuthenticationAndCategoryMigrator *)self contentProtectionState];
    [v9 unlockWithCondition:0];
  }
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDMessageCategorizer)categorizer
{
  return self->_categorizer;
}

- (EDMessageAuthenticator)authenticator
{
  return self->_authenticator;
}

- (EDMessageAuthenticationStateMigrator)authenticationStateMigrator
{
  return self->_authenticationStateMigrator;
}

- (EDCategoryMigrator)categoryMigrator
{
  return self->_categoryMigrator;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (OS_dispatch_queue)backgroundMessageMigrationQueue
{
  return self->_backgroundMessageMigrationQueue;
}

- (NSConditionLock)contentProtectionState
{
  return self->_contentProtectionState;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (void)setContentProtectionQueue:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_contentProtectionState, 0);
  objc_storeStrong((id *)&self->_backgroundMessageMigrationQueue, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_categoryMigrator, 0);
  objc_storeStrong((id *)&self->_authenticationStateMigrator, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_categorizer, 0);

  objc_storeStrong((id *)&self->_categoryPersistence, 0);
}

@end