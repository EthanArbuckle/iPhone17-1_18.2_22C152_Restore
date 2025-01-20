@interface EDBatchingMessageQueryIterator
- (BOOL)shouldCancel;
- (EDBatchingMessageQueryIterator)initWithMessagePersistence:(id)a3 query:(id)a4 batchSize:(int64_t)a5 firstBatchSize:(int64_t)a6 limit:(int64_t)a7 handler:(id)a8;
- (id)_deduplicateMessages:(id)a3;
- (void)_processMessages:(id)a3 forceFlush:(BOOL)a4;
- (void)addMessage:(id)a3 withDatabaseID:(int64_t)a4;
- (void)cancel;
- (void)flush;
@end

@implementation EDBatchingMessageQueryIterator

- (EDBatchingMessageQueryIterator)initWithMessagePersistence:(id)a3 query:(id)a4 batchSize:(int64_t)a5 firstBatchSize:(int64_t)a6 limit:(int64_t)a7 handler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v40.receiver = self;
  v40.super_class = (Class)EDBatchingMessageQueryIterator;
  v18 = [(EDBatchingMessageQueryIterator *)&v40 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messagePersistence, a3);
    v20 = (void *)MEMORY[0x1E4F60390];
    v21 = [v16 predicate];
    v22 = [v15 mailboxPersistence];
    uint64_t v23 = [v20 mailboxScopeForPredicate:v21 withMailboxTypeResolver:v22];
    mailboxScope = v19->_mailboxScope;
    v19->_mailboxScope = (EMMailboxScope *)v23;

    v25 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    cancelationToken = v19->_cancelationToken;
    v19->_cancelationToken = v25;

    v19->_remaining = a7;
    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    seenGlobalMessages = v19->_seenGlobalMessages;
    v19->_seenGlobalMessages = v27;

    v29 = _Block_copy(v17);
    id handler = v19->_handler;
    v19->_id handler = v29;

    if (a5 >= a7) {
      int64_t v31 = a7;
    }
    else {
      int64_t v31 = a5;
    }
    v19->_batchSize = v31;
    if (a6 <= 0) {
      int64_t v32 = a5;
    }
    else {
      int64_t v32 = a6;
    }
    if (v32 < a7) {
      a7 = v32;
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v33 = (void *)MEMORY[0x1E4F60E30];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __106__EDBatchingMessageQueryIterator_initWithMessagePersistence_query_batchSize_firstBatchSize_limit_handler___block_invoke;
    v37[3] = &unk_1E6BFF890;
    objc_copyWeak(&v38, &location);
    uint64_t v34 = [v33 bufferedQueueWithCapacity:a7 batchHandler:v37];
    messageQueue = v19->_messageQueue;
    v19->_messageQueue = (EFQueue *)v34;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v19;
}

void __106__EDBatchingMessageQueryIterator_initWithMessagePersistence_query_batchSize_firstBatchSize_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processMessages:v6 forceFlush:0];
  if (!WeakRetained[9])
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:WeakRetained[10]];
    v5 = (void *)WeakRetained[9];
    WeakRetained[9] = v4;
  }
}

- (void)_processMessages:(id)a3 forceFlush:(BOOL)a4
{
  id v6 = a3;
  v7 = [(EDBatchingMessageQueryIterator *)self _deduplicateMessages:v6];
  v8 = v7;
  if (self->_remaining && (unint64_t)[v7 count] > self->_remaining)
  {
    uint64_t v9 = [v8 subarrayWithRange:0];

    v8 = (void *)v9;
  }
  if ([(EFCancelationToken *)self->_cancelationToken isCanceled])
  {
    v10 = (void (**)(void, void, void))v8;
  }
  else
  {
    if ([v8 count])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__EDBatchingMessageQueryIterator__processMessages_forceFlush___block_invoke;
      v15[3] = &unk_1E6BFF8B8;
      v15[4] = self;
      objc_msgSend(v8, "ef_filter:", v15);
      v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

      self->_remaining -= [v10 count];
      batchedMessages = self->_batchedMessages;
      if (batchedMessages)
      {
        [(NSMutableArray *)batchedMessages addObjectsFromArray:v10];
        if (a4 || [(NSMutableArray *)self->_batchedMessages count] >= self->_batchSize || self->_remaining <= 0)
        {
          id handler = (void (**)(id, NSMutableArray *, void))self->_handler;
          if (handler) {
            handler[2](handler, self->_batchedMessages, 0);
          }
          [(NSMutableArray *)self->_batchedMessages removeAllObjects];
        }
      }
      else
      {
        id v14 = self->_handler;
        if (v14) {
          (*((void (**)(id, void, void))v14 + 2))(v14, v10, 0);
        }
      }
    }
    else
    {
      v10 = (void (**)(void, void, void))v8;
      if (!v8)
      {
        v10 = (void (**)(void, void, void))self->_handler;
        if (v10)
        {
          v13 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Couldn't get messages for persisted messages");
          ((void (**)(void, void, void *))v10)[2](v10, 0, v13);

          v10 = 0;
        }
      }
    }
    if (self->_remaining <= 0) {
      [(EDBatchingMessageQueryIterator *)self cancel];
    }
  }
}

uint64_t __62__EDBatchingMessageQueryIterator__processMessages_forceFlush___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  uint64_t v4 = [a2 objectID];
  v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "globalMessageID"));

  int v6 = [*(id *)(*(void *)(a1 + 32) + 56) containsObject:v5];
  if ((v6 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 56) addObject:v5];
  }

  return v6 ^ 1u;
}

- (void)flush
{
  if ([(EFCancelationToken *)self->_cancelationToken isCanceled])
  {
    id handler = self->_handler;
    self->_id handler = 0;
  }
  else
  {
    id v7 = [(EFQueue *)self->_messageQueue drain];
    if ([v7 count])
    {
      [(EDBatchingMessageQueryIterator *)self _processMessages:v7 forceFlush:1];
    }
    else
    {
      batchedMessages = self->_batchedMessages;
      if (batchedMessages)
      {
        v5 = (void (**)(void))self->_handler;
        if (v5)
        {
          v5[2]();
          batchedMessages = self->_batchedMessages;
        }
        [(NSMutableArray *)batchedMessages removeAllObjects];
      }
    }
    id v6 = self->_handler;
    self->_id handler = 0;

    id handler = v7;
  }
}

- (void)addMessage:(id)a3 withDatabaseID:(int64_t)a4
{
  id v9 = a3;
  if (([(EFCancelationToken *)self->_cancelationToken isCanceled] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F60DF0];
    id v7 = [NSNumber numberWithLongLong:a4];
    v8 = [v6 pairWithFirst:v7 second:v9];

    [(EFQueue *)self->_messageQueue enqueue:v8];
  }
}

- (id)_deduplicateMessages:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  v3 = objc_opt_new();
  v20 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v19;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = NSNumber;
        v10 = objc_msgSend(v8, "second", v19);
        v11 = [v10 objectID];
        v12 = objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v11, "globalMessageID"));

        v13 = [v3 objectForKeyedSubscript:v12];
        if (!v13)
        {
          id v14 = objc_alloc_init(_EDCombinedMessageInfo);
          [v3 setObject:v14 forKeyedSubscript:v12];
          v13 = v14;
          [v20 addObject:v14];
        }
        id v15 = [v8 second];
        id v16 = [v8 first];
        objc_msgSend(v13, "addMessage:withDatabaseID:", v15, objc_msgSend(v16, "longLongValue"));
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  id v17 = objc_msgSend(v20, "ef_compactMap:", &__block_literal_global_75);

  return v17;
}

id __55__EDBatchingMessageQueryIterator__deduplicateMessages___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 deduplicatedMessage];

  return v2;
}

- (BOOL)shouldCancel
{
  return [(EFCancelationToken *)self->_cancelationToken isCanceled];
}

- (void)cancel
{
  [(EFCancelationToken *)self->_cancelationToken cancel];
  id handler = self->_handler;
  self->_id handler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchedMessages, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_seenGlobalMessages, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);

  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end