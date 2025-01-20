@interface EDMailboxPredictionController
+ (OS_os_log)log;
- (EDCachingMailboxPredictor)cachingPredictor;
- (EDMailboxPersistence)mailboxPersistence;
- (EDMailboxPredictionController)initWithMessagePersistence:(id)a3 mailboxPersistence:(id)a4 hookRegistry:(id)a5 userProfileProvider:(id)a6;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceHookRegistry)hookRegistry;
- (EMUserProfileProvider)userProfileProvider;
- (OS_dispatch_queue)processingQueue;
- (id)_accountsForMessages:(id)a3;
- (id)_createPredictor;
- (id)_processPredictionForMessages:(id)a3;
- (id)predictMailboxForMovingObjectIDs:(id)a3 completionHandler:(id)a4;
- (void)_invalidateCacheForAddedMessage:(id)a3;
- (void)_predictMailboxForMovingMessages:(id)a3 cancelationToken:(id)a4 completionHandler:(id)a5;
@end

@implementation EDMailboxPredictionController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EDMailboxPredictionController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_45 != -1) {
    dispatch_once(&log_onceToken_45, block);
  }
  v2 = (void *)log_log_45;

  return (OS_os_log *)v2;
}

void __36__EDMailboxPredictionController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_45;
  log_log_45 = (uint64_t)v1;
}

- (EDMailboxPredictionController)initWithMessagePersistence:(id)a3 mailboxPersistence:(id)a4 hookRegistry:(id)a5 userProfileProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EDMailboxPredictionController;
  v15 = [(EDMailboxPredictionController *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mailboxPersistence, a4);
    objc_storeStrong((id *)&v16->_messagePersistence, a3);
    objc_storeStrong((id *)&v16->_userProfileProvider, a6);
    objc_storeStrong((id *)&v16->_messagePersistence, a3);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("com.apple.mail.MailboxPrediction.processing", v17, v18);
    processingQueue = v16->_processingQueue;
    v16->_processingQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_hookRegistry, a5);
    uint64_t v21 = [(EDMailboxPredictionController *)v16 _createPredictor];
    cachingPredictor = v16->_cachingPredictor;
    v16->_cachingPredictor = (EDCachingMailboxPredictor *)v21;

    [v13 registerMessageChangeHookResponder:v16];
  }

  return v16;
}

- (id)predictMailboxForMovingObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  if ((unint64_t)[v6 count] < 4)
  {
    id v9 = v6;
  }
  else
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, 3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  id v11 = [(EDMailboxPredictionController *)self processingQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__EDMailboxPredictionController_predictMailboxForMovingObjectIDs_completionHandler___block_invoke;
  v18[3] = &unk_1E6C01A40;
  v18[4] = self;
  id v19 = v10;
  id v12 = v8;
  id v20 = v12;
  id v21 = v7;
  id v13 = v7;
  id v14 = v10;
  dispatch_async(v11, v18);

  v15 = v21;
  id v16 = v12;

  return v16;
}

void __84__EDMailboxPredictionController_predictMailboxForMovingObjectIDs_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) messagePersistence];
  id v3 = [v2 persistedMessagesForObjectIDs:*(void *)(a1 + 40) requireProtectedData:0];

  [*(id *)(a1 + 32) _predictMailboxForMovingMessages:v3 cancelationToken:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_predictMailboxForMovingMessages:(id)a3 cancelationToken:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] >= 4)
  {
    uint64_t v11 = objc_msgSend(v8, "subarrayWithRange:", 0, 3);

    id v8 = (id)v11;
  }
  id v12 = objc_msgSend(v8, "ef_map:", &__block_literal_global_35);
  id v13 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Predicting move mailbox for messages: %{public}@", buf, 0xCu);
  }

  if (([v9 isCanceled] & 1) == 0)
  {
    id v14 = [(EDMailboxPredictionController *)self _processPredictionForMessages:v8];
    if (v14)
    {
      v15 = +[EDMailboxPredictionController log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Found mailbox for moving message(s).", buf, 2u);
      }

      id v16 = [(EDMailboxPredictionController *)self mailboxPersistence];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_6;
      v18[3] = &unk_1E6C01A90;
      id v19 = v14;
      id v20 = v10;
      [v16 allMailboxesWithCompletionHandler:v18];
    }
    else
    {
      v17 = +[EDMailboxPredictionController log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[EDMailboxPredictionController _predictMailboxForMovingMessages:cancelationToken:completionHandler:](v17);
      }

      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

id __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));

  return v3;
}

void __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6C01A68;
  id v8 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "ef_firstObjectPassingTest:", v7);
  v5 = +[EDMailboxPredictionController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Found mailbox '%{public}@'.", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_processPredictionForMessages:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(EDMailboxPredictionController *)self processingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EDMailboxPredictionController *)self cachingPredictor];
  id v7 = [v6 predictMailboxIDsForMessages:v4 limit:7];
  id v8 = objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_11);

  if ([v8 count])
  {
    id v9 = [(EDMailboxPredictionController *)self _accountsForMessages:v4];
    if ([v9 count] == 1)
    {
      id v10 = [v9 anyObject];
      uint64_t v11 = [v10 identifier];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__EDMailboxPredictionController__processPredictionForMessages___block_invoke_14;
      v18[3] = &unk_1E6C01AD8;
      void v18[4] = v11;
      id v12 = objc_msgSend(v8, "ef_filter:", v18);
      id v13 = +[EDMailboxPredictionController log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v12 count];
        int v15 = [v8 count];
        *(_DWORD *)buf = 67109376;
        int v20 = v14;
        __int16 v21 = 1024;
        int v22 = v15;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Found %u mailbox(es) for moving message(s). Filtered from %u.", buf, 0xEu);
      }

      id v16 = [v12 firstObject];
    }
    else
    {
      uint64_t v11 = +[EDMailboxPredictionController log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = [v9 count];
        _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%u accounts. No prediction for moving message(s).", buf, 8u);
      }
      id v16 = 0;
    }
  }
  else
  {
    id v9 = +[EDMailboxPredictionController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Found no mailbox for moving message(s).", buf, 2u);
    }
    id v16 = 0;
  }

  return v16;
}

id __63__EDMailboxPredictionController__processPredictionForMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:a2];
  if (v2) {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t __63__EDMailboxPredictionController__processPredictionForMessages___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = [a2 url];
  id v4 = [v3 host];

  uint64_t v5 = objc_msgSend(v4, "ef_caseInsensitiveIsEqualToString:", *(void *)(a1 + 32));
  return v5;
}

- (id)_accountsForMessages:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "account", (void)v11);
        if (v9) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_invalidateCacheForAddedMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxPredictionController *)self processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__EDMailboxPredictionController__invalidateCacheForAddedMessage___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__EDMailboxPredictionController__invalidateCacheForAddedMessage___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachingPredictor];
  [v2 invalidatePredictionsAffectedByMessage:*(void *)(a1 + 40)];
}

- (id)_createPredictor
{
  id v3 = [EDHeuristicsMailboxPredictor alloc];
  id v4 = [(EDMailboxPredictionController *)self userProfileProvider];
  id v5 = [(EDMailboxPredictionController *)self messagePersistence];
  id v6 = [(EDMailboxPredictionController *)self mailboxPersistence];
  uint64_t v7 = [(EDHeuristicsMailboxPredictor *)v3 initWithUserProfileProvider:v4 messagePersistence:v5 mailboxPersistence:v6 parameters:&unk_1F35BB670];

  id v8 = [[EDCachingMailboxPredictor alloc] initWithPredictor:v7];

  return v8;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (EDCachingMailboxPredictor)cachingPredictor
{
  return self->_cachingPredictor;
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_cachingPredictor, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);

  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

- (void)_predictMailboxForMovingMessages:(os_log_t)log cancelationToken:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Did not find any mailboxes for moving message(s).", v1, 2u);
}

@end