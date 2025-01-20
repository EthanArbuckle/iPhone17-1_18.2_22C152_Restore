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

- (SKClientBroker)init
{
  v12.receiver = self;
  v12.super_class = (Class)SKClientBroker;
  v2 = [(SKClientBroker *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable mapTableWithKeyOptions:0x10000 valueOptions:5];
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    subscriptionStatusListeners = v2->_subscriptionStatusListeners;
    v2->_subscriptionStatusListeners = (NSHashTable *)v5;

    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    transactionListeners = v2->_transactionListeners;
    v2->_transactionListeners = (NSHashTable *)v7;

    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
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

+ (id)defaultBroker
{
  if (qword_1000127D8 != -1) {
    dispatch_once(&qword_1000127D8, &stru_10000C538);
  }
  v2 = (void *)qword_1000127D0;

  return v2;
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

- (void)registerClient:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_clients;
  objc_sync_enter(v8);
  [(NSMapTable *)self->_clients setObject:v6 forKey:v7];
  if (!notify_is_valid_token(self->_unfinishedTransactionsToken))
  {
    uint64_t v9 = [(SKClientBroker *)self _unfinishedTransactionsNotificationName];
    v10 = v9;
    if (v9)
    {
      v11 = (const char *)[v9 UTF8String];
      id v12 = &_dispatch_main_q;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000045BC;
      handler[3] = &unk_10000C560;
      handler[4] = self;
      notify_register_dispatch(v11, &self->_unfinishedTransactionsToken, (dispatch_queue_t)&_dispatch_main_q, handler);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000078DC((uint64_t)self);
    }
  }
  objc_sync_exit(v8);
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
  id v4 = a3;
  id v5 = self->_messageListeners;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSHashTable *)self->_messageListeners objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) pendingMessages:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)askToShowMessageWithReplyBlock:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  id v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          [v10 askToShowMessageWithReplyBlock:v4];

          goto LABEL_11;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 removedEntitlementsForProductIdentifiers:v4];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)updatedTransactions:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
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
        long long v10 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 updatedTransactions:v4];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
  long long v11 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v15) objectForKeyedSubscript:off_100011EC8];
        if ([v16 length]) {
          [v11 addObject:v16];
        }

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
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
    id v19 = [v18 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)v21) receivedTransactions:v11];
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v18 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }

    objc_sync_exit(v17);
  }
}

- (void)removedTransactions:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 removedTransactions:v4];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadAdded:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 downloadAdded:v4];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadStatusChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 downloadStatusChanged:v4];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadRemoved:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_clients;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMapTable *)self->_clients objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 downloadRemoved:v4];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)receivedStatuses:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_subscriptionStatusListeners;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSHashTable *)self->_subscriptionStatusListeners objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) receivedStatuses:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)receivedTransactions:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_transactionListeners;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSHashTable *)self->_transactionListeners objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) receivedTransactions:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_clients objectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
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
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_clients objectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
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
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_clients objectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
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
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_unfinishedTransactionsNotificationName
{
  v2 = +[NSBundle mainBundle];
  objc_super v3 = [v2 bundleIdentifier];

  if (v3)
  {
    id v4 = sub_10000419C((uint64_t)v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
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
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005F44;
  v6[3] = &unk_10000C588;
  v6[4] = self;
  id v4 = [v3 storeKitServiceWithErrorHandler:v6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005F8C;
  v5[3] = &unk_10000C5B0;
  v5[4] = self;
  [v4 checkServerQueueForClientIfNecessary:0 forceCheck:1 reply:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListeners, 0);
  objc_storeStrong((id *)&self->_transactionListeners, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusListeners, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end