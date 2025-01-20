@interface SKClientBroker
+ (id)defaultBroker;
- (BOOL)hasTransactionListener;
- (SKClientBroker)init;
- (id)_unfinishedTransactionsNotificationName;
- (void)_cancelNotifyTokenIfValid:(int)a3;
- (void)_handleUnfinishedTransactionsNotification;
- (void)askToShowMessageWithReplyBlock:(id)a3;
- (void)dealloc;
- (void)downloadAdded:(id)a3;
- (void)downloadRemoved:(id)a3;
- (void)downloadStatusChanged:(id)a3;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)hasAnyMessageListenersWithReply:(id)a3;
- (void)pendingMessages:(id)a3;
- (void)receivedStatuses:(id)a3;
- (void)receivedTransactions:(id)a3;
- (void)registerClient:(id)a3 withIdentifier:(id)a4;
- (void)registerMessageListener:(id)a3;
- (void)registerSubscriptionStatusListener:(id)a3;
- (void)registerTransactionListener:(id)a3;
- (void)removedEntitlementsForProductIdentifiers:(id)a3;
- (void)removedTransactions:(id)a3;
- (void)unregisterClientWithIdentifier:(id)a3;
- (void)unregisterMessageListener:(id)a3;
- (void)unregisterSubscriptionStatusListener:(id)a3;
- (void)unregisterTransactionListener:(id)a3;
- (void)updatedTransactions:(id)a3;
@end

@implementation SKClientBroker

+ (id)defaultBroker
{
  if (defaultBroker_onceToken != -1) {
    dispatch_once(&defaultBroker_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultBroker_sharedClient;

  return v2;
}

- (void)registerClient:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_clients;
  objc_sync_enter(v8);
  [(NSMapTable *)self->_clients setObject:v6 forKey:v7];
  if (!notify_is_valid_token(self->_unfinishedTransactionsToken))
  {
    v9 = [(SKClientBroker *)self _unfinishedTransactionsNotificationName];
    v10 = v9;
    if (v9)
    {
      v11 = (const char *)[v9 UTF8String];
      v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __48__SKClientBroker_registerClient_withIdentifier___block_invoke;
      handler[3] = &unk_1E5FA9910;
      handler[4] = self;
      notify_register_dispatch(v11, &self->_unfinishedTransactionsToken, v12, handler);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[SKClientBroker registerClient:withIdentifier:]((uint64_t)self);
    }
  }
  objc_sync_exit(v8);
}

- (id)_unfinishedTransactionsNotificationName
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  if (v3)
  {
    v4 = SKDistributedNotificationUnfinishedTransactionsForBundleID((uint64_t)v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)unregisterClientWithIdentifier:(id)a3
{
  id v5 = a3;
  v4 = self->_clients;
  objc_sync_enter(v4);
  [(NSMapTable *)self->_clients removeObjectForKey:v5];
  if (![(NSMapTable *)self->_clients count] && notify_is_valid_token(self->_unfinishedTransactionsToken))
  {
    notify_cancel(self->_unfinishedTransactionsToken);
    self->_unfinishedTransactionsToken = -1;
  }
  objc_sync_exit(v4);
}

uint64_t __31__SKClientBroker_defaultBroker__block_invoke()
{
  defaultBroker_sharedClient = objc_alloc_init(SKClientBroker);

  return MEMORY[0x1F41817F8]();
}

- (SKClientBroker)init
{
  v12.receiver = self;
  v12.super_class = (Class)SKClientBroker;
  v2 = [(SKClientBroker *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0x10000 valueOptions:5];
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    subscriptionStatusListeners = v2->_subscriptionStatusListeners;
    v2->_subscriptionStatusListeners = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    transactionListeners = v2->_transactionListeners;
    v2->_transactionListeners = (NSHashTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    messageListeners = v2->_messageListeners;
    v2->_messageListeners = (NSHashTable *)v9;

    *(void *)&v2->_unfinishedTransactionsToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  [(SKClientBroker *)self _cancelNotifyTokenIfValid:self->_unfinishedTransactionsToken];
  v3.receiver = self;
  v3.super_class = (Class)SKClientBroker;
  [(SKClientBroker *)&v3 dealloc];
}

- (BOOL)hasTransactionListener
{
  v2 = self;
  objc_super v3 = self->_transactionListeners;
  objc_sync_enter(v3);
  LOBYTE(v2) = [(NSHashTable *)v2->_transactionListeners count] != 0;
  objc_sync_exit(v3);

  return (char)v2;
}

uint64_t __48__SKClientBroker_registerClient_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUnfinishedTransactionsNotification];
}

- (void)registerSubscriptionStatusListener:(id)a3
{
  id v5 = a3;
  v4 = self->_subscriptionStatusListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_subscriptionStatusListeners addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterSubscriptionStatusListener:(id)a3
{
  id v5 = a3;
  v4 = self->_subscriptionStatusListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_subscriptionStatusListeners removeObject:v5];
  objc_sync_exit(v4);
}

- (void)registerTransactionListener:(id)a3
{
  id v5 = a3;
  v4 = self->_transactionListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_transactionListeners addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterTransactionListener:(id)a3
{
  id v5 = a3;
  v4 = self->_transactionListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_transactionListeners removeObject:v5];
  objc_sync_exit(v4);
}

- (void)registerMessageListener:(id)a3
{
  id v5 = a3;
  v4 = self->_messageListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_messageListeners addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterMessageListener:(id)a3
{
  id v5 = a3;
  v4 = self->_messageListeners;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_messageListeners removeObject:v5];
  objc_sync_exit(v4);
}

- (void)pendingMessages:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_messageListeners;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSHashTable *)self->_messageListeners objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) pendingMessages:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)askToShowMessageWithReplyBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, uint64_t))a3;
  id v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [v10 askToShowMessageWithReplyBlock:v4];

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v4[2](v4, 0, 1);
LABEL_11:
  objc_sync_exit(v5);
}

- (void)hasAnyMessageListenersWithReply:(id)a3
{
  id v6 = (void (**)(id, BOOL))a3;
  id v4 = self->_messageListeners;
  objc_sync_enter(v4);
  BOOL v5 = [(NSHashTable *)self->_messageListeners count] != 0;
  objc_sync_exit(v4);

  v6[2](v6, v5);
}

- (void)removedEntitlementsForProductIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 removedEntitlementsForProductIdentifiers:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)updatedTransactions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 updatedTransactions:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
  long long v11 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [*(id *)(*((void *)&v26 + 1) + 8 * v15) objectForKeyedSubscript:SKServerKeyTransactionReceipt];
        if ([v16 length]) {
          [v11 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v13);
  }

  if ([v11 count])
  {
    v17 = self->_transactionListeners;
    objc_sync_enter(v17);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v18 = [(NSHashTable *)self->_transactionListeners objectEnumerator];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v21++) receivedTransactions:v11];
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }

    objc_sync_exit(v17);
  }
}

- (void)removedTransactions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 removedTransactions:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadAdded:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 downloadAdded:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadStatusChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 downloadStatusChanged:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadRemoved:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 downloadRemoved:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)receivedStatuses:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_subscriptionStatusListeners;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSHashTable *)self->_subscriptionStatusListeners objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) receivedStatuses:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)receivedTransactions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self->_transactionListeners;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSHashTable *)self->_transactionListeners objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) receivedTransactions:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v13 handleAuthenticateRequest:v6 resultHandler:v7];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v13 handleDialogRequest:v6 resultHandler:v7];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_clients objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v13 handleEngagementRequest:v6 resultHandler:v7];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_cancelNotifyTokenIfValid:(int)a3
{
  if (notify_is_valid_token(a3))
  {
    notify_cancel(a3);
  }
}

- (void)_handleUnfinishedTransactionsNotification
{
  objc_super v3 = +[SKServiceBroker defaultBroker];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke;
  v6[3] = &unk_1E5FA9938;
  v6[4] = self;
  id v4 = [v3 storeKitServiceWithErrorHandler:v6];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30;
  v5[3] = &unk_1E5FA9960;
  v5[4] = self;
  [v4 checkServerQueueForClientIfNecessary:0 forceCheck:1 reply:v5];
}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_cold_1();
  }
}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30_cold_1();
    }
  }
  else if ([v5 count])
  {
    id v7 = *(id *)(*(void *)(a1 + 32) + 8);
    objc_sync_enter(v7);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectEnumerator", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v12 updatedTransactions:v5];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListeners, 0);
  objc_storeStrong((id *)&self->_transactionListeners, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusListeners, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)registerClient:(uint64_t)a1 withIdentifier:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ Not registering for unfinished transaction notifications because no bundle ID was available", (uint8_t *)&v1, 0xCu);
}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error in remote proxy getting unfinished transactions: %{public}@", v0, 0x16u);
}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error getting unfinished transactions: %{public}@", v0, 0x16u);
}

@end