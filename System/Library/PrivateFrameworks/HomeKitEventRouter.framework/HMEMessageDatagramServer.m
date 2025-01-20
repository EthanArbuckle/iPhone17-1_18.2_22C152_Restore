@interface HMEMessageDatagramServer
- (BOOL)_updateConnectionExpiryForConnection:(void *)a3 reason:;
- (BOOL)fetchCachedEventsForTopics:(id)a3 isMultiHop:(BOOL)a4 connection:(id)a5 cachedEventCollection:(id)a6 error:(id *)a7;
- (HMEMessageDatagramServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5;
- (HMEMessageDatagramServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logCategory:(const char *)a7;
- (HMEMessageDatagramServerDataSource)dataSource;
- (HMEMessageDatagramServerDelegate)delegate;
- (HMETimer)connectionDebounceTimer;
- (HMETimer)connectionExpiryTimer;
- (NSMutableArray)connectionInfoItems;
- (double)_nextDebounceInterval;
- (id)_connectionItemForConnection:(void *)a1;
- (id)_expiryItemForConnection:(void *)a1;
- (id)dumpStateDescription;
- (id)expandedTopicsForTopics:(id)a3;
- (id)upstreamTopicsForTopic:(id)a3;
- (uint64_t)_eventSize:(uint64_t)a1;
- (void)_addCachedEvents:(void *)a3 connections:;
- (void)_pruneExpiredItemsFromConnectionItems;
- (void)_removeConnection:(void *)a1;
- (void)_resetDebounceTimer;
- (void)_setupAndStartExpiryTimer;
- (void)_startDebounceTimerIfNeeded;
- (void)changeRegistrationsForConnection:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)connectWithConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5 topicFilterAdditions:(id)a6 completion:(id)a7;
- (void)disconnectConnection:(id)a3;
- (void)handleCachedEvent:(id)a3 topic:(id)a4;
- (void)handleEvent:(id)a3 topic:(id)a4;
- (void)keepAliveConnection:(id)a3 completion:(id)a4;
- (void)refreshConnection:(id)a3;
- (void)reset;
- (void)resetExistingEvents;
- (void)setConnectionDebounceTimer:(id)a3;
- (void)setConnectionExpiryTimer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMEMessageDatagramServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionDebounceTimer, 0);
  objc_storeStrong((id *)&self->_connectionExpiryTimer, 0);
  objc_storeStrong((id *)&self->_connectionInfoItems, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setConnectionDebounceTimer:(id)a3
{
}

- (HMETimer)connectionDebounceTimer
{
  return (HMETimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConnectionExpiryTimer:(id)a3
{
}

- (HMETimer)connectionExpiryTimer
{
  return (HMETimer *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableArray)connectionInfoItems
{
  return self->_connectionInfoItems;
}

- (void)setDataSource:(id)a3
{
}

- (HMEMessageDatagramServerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMEMessageDatagramServerDataSource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMEMessageDatagramServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMEMessageDatagramServerDelegate *)WeakRetained;
}

- (id)dumpStateDescription
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v22 = [MEMORY[0x1E4F28E78] string];
  [v22 appendFormat:@"\n\t{"];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = self;
  v3 = [(HMEMessageDatagramServer *)self connectionInfoItems];
  v4 = (void *)[v3 copy];

  id obj = v4;
  uint64_t v23 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (v6)
        {
          v7 = NSString;
          v8 = [*(id *)(*((void *)&v25 + 1) + 8 * i) identifier];
          v9 = [v6 expiry];
          v10 = [v6 pendingEventItems];
          v11 = [v10 eventItems];
          v12 = [v6 pendingCachedEventItems];
          v13 = [v12 eventItems];
          v14 = [v6 connection];
          v6 = [v7 stringWithFormat:@"[HMEConnectionInfoItem identifier: %@, expiry: %@, \n\t pendingItems: %@, \n\t pendingCachedEvents: %@, \n\t connection: %@]", v8, v9, v11, v13, v14];
        }
        [v22 appendFormat:@"\n\t\t%@,", v6];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v23);
  }

  [v22 appendFormat:@"\n\t}\n"];
  v15 = NSString;
  v24.receiver = v19;
  v24.super_class = (Class)HMEMessageDatagramServer;
  v16 = [(HMERouterServer *)&v24 dumpStateDescription];
  v17 = [v15 stringWithFormat:@"[HMEMessageDatagramServer connection info: %@, \n\t event router server: %@]", v22, v16];

  return v17;
}

- (void)reset
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v3);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Resetting all connections", buf, 2u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(HMEMessageDatagramServer *)self connectionInfoItems];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) connection];
        if (v11) {
          -[HMEMessageDatagramServer _removeConnection:](self, v11);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(HMEMessageDatagramServer *)self connectionInfoItems];
  [v12 removeAllObjects];

  -[HMEMessageDatagramServer _resetDebounceTimer](self);
}

- (void)_removeConnection:(void *)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 queue];
    dispatch_assert_queue_V2(v4);

    v5 = a1[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19D557000, v5, OS_LOG_TYPE_DEFAULT, "Removing connection %@", (uint8_t *)&v8, 0xCu);
    }
    v6 = -[HMEMessageDatagramServer _connectionItemForConnection:](a1, v3);
    uint64_t v7 = [a1 connectionInfoItems];
    [v7 removeObject:v6];

    [a1 didRemoveConnection:v3];
  }
}

- (void)_resetDebounceTimer
{
  if (result)
  {
    v1 = result;
    v2 = [result connectionDebounceTimer];
    [v2 suspend];

    return (void *)[v1 setConnectionDebounceTimer:0];
  }
  return result;
}

- (id)_connectionItemForConnection:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = objc_msgSend(a1, "connectionInfoItems", 0);
    v5 = (void *)[v4 copy];

    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [v9 connection];
          char v11 = [v10 isEqual:v3];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)resetExistingEvents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v3);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Resetting all events", buf, 2u);
  }
  -[HMEMessageDatagramServer _resetDebounceTimer](self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(HMEMessageDatagramServer *)self connectionInfoItems];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = [*(id *)(*((void *)&v12 + 1) + 8 * i) pendingEventItems];
        [v11 resetItems];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)fetchCachedEventsForTopics:(id)a3 isMultiHop:(BOOL)a4 connection:(id)a5 cachedEventCollection:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  long long v15 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v15);

  long long v16 = [(HMEMessageDatagramServer *)self dataSource];
  char v17 = [v16 server:self shouldProcessEventsForConnection:v13 shouldLogState:1];
  BOOL v18 = v17;
  logger = self->_logger;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v13;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Fetch not allowed in current state for connection: %@", buf, 0xCu);
      if (!a7) {
        goto LABEL_23;
      }
    }
    else if (!a7)
    {
      goto LABEL_23;
    }
    *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMEErrorDomain" code:4 userInfo:0];
    goto LABEL_23;
  }
  BOOL v33 = v10;
  v34 = v16;
  BOOL v35 = v17;
  id v36 = v13;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v12;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Returning cached events for topics:%@", buf, 0xCu);
  }
  [v14 willAddAdditionalEvents];
  v20 = [(HMERouterServer *)self cachedEventsForExpandedTopics:v12];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        long long v26 = [v20 objectForKeyedSubscript:v25];
        if (v26)
        {
          long long v27 = [[HMEEventInfo alloc] initWithEvent:v26 topic:v25];
          [v14 addEventInfo:v27];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v22);
  }
  id v13 = v36;
  BOOL v18 = v35;
  if (v33)
  {
    long long v28 = self->_logger;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      uint64_t v30 = [v12 count];
      *(_DWORD *)buf = 138412546;
      id v42 = v36;
      __int16 v43 = 2048;
      uint64_t v44 = v30;
      _os_log_impl(&dword_19D557000, v29, OS_LOG_TYPE_DEFAULT, "Processing fetch request for connection: %@ with topics: %ld ", buf, 0x16u);

      long long v28 = self->_logger;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v36;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v12;
      _os_log_debug_impl(&dword_19D557000, v28, OS_LOG_TYPE_DEBUG, "Processing fetch request for connection: %@ with topics: %@", buf, 0x16u);
    }
    v31 = [(HMERouterServer *)self topicRouter];
    [v31 fetchCachedEventsForConsumer:v36 topicFilters:v12 cachedEventCollection:v14];
  }
  [v14 didFinishAddingAdditionalEvents];

  long long v16 = v34;
LABEL_23:

  return v18;
}

- (void)keepAliveConnection:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  uint64_t v8 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  LOBYTE(v8) = -[HMEMessageDatagramServer _updateConnectionExpiryForConnection:reason:](self, v7, @"keep-alive");
  if (v8)
  {
    uint64_t v9 = 0;
    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)char v11 = 0;
    _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Did not find connection keep-alive was received for.", v11, 2u);
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMEErrorDomain" code:1 userInfo:0];
  if (v6) {
LABEL_7:
  }
    v6[2](v6, v9);
LABEL_8:
}

- (BOOL)_updateConnectionExpiryForConnection:(void *)a3 reason:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 queue];
    dispatch_assert_queue_V2(v7);

    uint64_t v8 = [a1 dataSource];
    [v8 server:a1 timeoutIntervalForConnection:v5];
    double v10 = v9;
    char v11 = [v8 serverTimerProvider:a1];
    id v12 = [v11 dateWithTimeIntervalSinceNow:v10];

    id v13 = -[HMEMessageDatagramServer _expiryItemForConnection:](a1, v5);
    BOOL v14 = v13 != 0;
    long long v15 = a1[8];
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412802;
        id v18 = v5;
        __int16 v19 = 2112;
        v20 = v12;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_19D557000, v15, OS_LOG_TYPE_DEFAULT, "Updated connection %@ expiry to %@ with reason %@", (uint8_t *)&v17, 0x20u);
      }
      [v13 setExpiry:v12];
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_19D557000, v15, OS_LOG_TYPE_ERROR, "Did not find connection", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_expiryItemForConnection:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 queue];
    dispatch_assert_queue_V2(v4);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(a1, "connectionInfoItems", 0);
    id v6 = (void *)[v5 copy];

    id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v11 = [v10 connection];

          if (v11 == v3)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)changeRegistrationsForConnection:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void (**)(id, void, void *))a6;
  long long v14 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v14);

  long long v15 = [(HMEMessageDatagramServer *)self dataSource];
  long long v16 = -[HMEMessageDatagramServer _expiryItemForConnection:](self, v10);

  if (!v16)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Did not find item for connection: %@", buf, 0xCu);
    }
    objc_super v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = 2;
    goto LABEL_18;
  }
  char v17 = [v15 server:self shouldProcessEventsForConnection:v10 shouldLogState:1];
  uint64_t v18 = self->_logger;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_error_impl(&dword_19D557000, v18, OS_LOG_TYPE_ERROR, "Change registrations not allowed in current state for connection: %@", buf, 0xCu);
    }
    objc_super v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = 4;
LABEL_18:
    long long v26 = [v24 errorWithDomain:@"HMEErrorDomain" code:v25 userInfo:0];
    v13[2](v13, MEMORY[0x1E4F1CC08], v26);
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = v18;
    *(_DWORD *)buf = 138412802;
    id v31 = v10;
    __int16 v32 = 2048;
    uint64_t v33 = [v11 count];
    __int16 v34 = 2048;
    uint64_t v35 = [v12 count];
    _os_log_impl(&dword_19D557000, v19, OS_LOG_TYPE_DEFAULT, "Processing request to change registrations for connection: %@ with addedTopics: %ld removedTopics: %ld", buf, 0x20u);

    uint64_t v18 = self->_logger;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v31 = v10;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v11;
    __int16 v34 = 2112;
    uint64_t v35 = (uint64_t)v12;
    _os_log_debug_impl(&dword_19D557000, v18, OS_LOG_TYPE_DEBUG, "Processing request to change registrations for connection: %@ with addedTopics: %@ removedTopics: %@", buf, 0x20u);
  }
  v20 = [(HMERouterServer *)self topicRouter];
  [v20 changeRegistrationsForConsumer:v10 topicFilterAdditions:v11 topicFilterRemovals:v12];

  if (!-[HMEMessageDatagramServer _updateConnectionExpiryForConnection:reason:](self, v10, @"change-registration"))
  {
    __int16 v21 = self->_logger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_error_impl(&dword_19D557000, v21, OS_LOG_TYPE_ERROR, "Update connection expiry failed for connection %@", buf, 0xCu);
      if (!v13) {
        goto LABEL_20;
      }
      goto LABEL_10;
    }
  }
  if (v13)
  {
LABEL_10:
    if ([v15 serverSupportFragmentCachedEvents:self])
    {
      id v22 = [(HMERouterServer *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __113__HMEMessageDatagramServer_changeRegistrationsForConnection_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
      block[3] = &unk_1E5955FA8;
      block[4] = self;
      id v28 = v11;
      id v29 = v10;
      dispatch_async(v22, block);

      v13[2](v13, MEMORY[0x1E4F1CC08], 0);
      goto LABEL_20;
    }
    long long v26 = [(HMERouterServer *)self cachedEventsForExpandedTopics:v11];
    ((void (**)(id, void *, void *))v13)[2](v13, v26, 0);
LABEL_19:
  }
LABEL_20:
}

void __113__HMEMessageDatagramServer_changeRegistrationsForConnection_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) cachedEventsForExpandedTopics:*(void *)(a1 + 40)];
  id v3 = *(os_log_t **)(a1 + 32);
  v5[0] = *(void *)(a1 + 48);
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  -[HMEMessageDatagramServer _addCachedEvents:connections:](v3, v2, v4);
}

- (void)_addCachedEvents:(void *)a3 connections:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v17 = a3;
  if (a1)
  {
    id v5 = [(os_log_t *)a1 queue];
    dispatch_assert_queue_V2(v5);

    id v6 = [(os_log_t *)a1 dataSource];
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v17;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          char v12 = objc_msgSend(v6, "server:shouldProcessEventsForConnection:shouldLogState:", a1, v11, 0, v17);
          long long v13 = a1[8];
          if (v12)
          {
            if (os_log_type_enabled(a1[8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v11;
              _os_log_impl(&dword_19D557000, v13, OS_LOG_TYPE_DEFAULT, "Processing connection: %@", buf, 0xCu);
            }
            long long v14 = [MEMORY[0x1E4F1CA60] dictionary];
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __57__HMEMessageDatagramServer__addCachedEvents_connections___block_invoke;
            v19[3] = &unk_1E5955F80;
            v19[4] = a1;
            v19[5] = v11;
            id v15 = v14;
            id v20 = v15;
            id v21 = v6;
            id v22 = &v27;
            [v18 enumerateKeysAndObjectsUsingBlock:v19];
            long long v16 = a1[8];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v15;
              _os_log_impl(&dword_19D557000, v16, OS_LOG_TYPE_INFO, "Added cached events: %@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(a1[8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v11;
            _os_log_debug_impl(&dword_19D557000, v13, OS_LOG_TYPE_DEBUG, "Skip processing for connection %@", buf, 0xCu);
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v8);
    }

    if (*((unsigned char *)v28 + 24)) {
      -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](a1);
    }
    _Block_object_dispose(&v27, 8);
  }
}

void __57__HMEMessageDatagramServer__addCachedEvents_connections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[HMEEventInfo alloc] initWithEvent:v6 topic:v5];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v5;
    _os_log_debug_impl(&dword_19D557000, v9, OS_LOG_TYPE_DEBUG, "Cached event topic %@", buf, 0xCu);
    uint64_t v8 = *(void **)(a1 + 32);
  }
  id v10 = [v8 delegate];
  if ([v10 shouldAllowEvent:v6 topic:v5 connection:*(void *)(a1 + 40)])
  {
    uint64_t v29 = -[HMEMessageDatagramServer _connectionItemForConnection:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      _os_log_debug_impl(&dword_19D557000, v11, OS_LOG_TYPE_DEBUG, "Adding cached event topic: %@", buf, 0xCu);
    }
    id v31 = 0;
    id v32 = 0;
    id v30 = 0;
    int v12 = HMEEventComponentsFromTopic(v5, &v32, &v31, &v30);
    id v13 = v32;
    id v14 = v31;
    id v15 = v30;
    if (v12)
    {
      long long v16 = [*(id *)(a1 + 48) objectForKeyedSubscript:v15];

      if (!v16)
      {
        id v17 = [MEMORY[0x1E4F1CA60] dictionary];
        [*(id *)(a1 + 48) setObject:v17 forKeyedSubscript:v15];
      }
      id v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:v15];
      __int16 v19 = [v18 objectForKeyedSubscript:v13];

      if (!v19)
      {
        id v20 = [MEMORY[0x1E4F1CA48] array];
        id v21 = [*(id *)(a1 + 48) objectForKeyedSubscript:v15];
        [v21 setObject:v20 forKeyedSubscript:v13];
      }
      if (v14)
      {
        id v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:v15];
        long long v23 = [v22 objectForKeyedSubscript:v13];
        [v23 addObject:v14];
      }
    }
    long long v24 = v29;
    long long v25 = [v29 pendingCachedEventItems];
    [v25 addEventInfo:v7];

    objc_msgSend(v10, "server:logMetricsForEventTopic:eventSize:isCached:", *(void *)(a1 + 32), v5, -[HMEMessageDatagramServer _eventSize:](*(void *)(a1 + 32), v6), 1);
    long long v26 = [v29 debounceStartTime];

    if (!v26)
    {
      uint64_t v27 = [*(id *)(a1 + 56) serverTimerProvider:*(void *)(a1 + 32)];
      id v28 = [v27 currentDate];
      [v29 setDebounceStartTime:v28];

      long long v24 = v29;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (void)_startDebounceTimerIfNeeded
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 connectionDebounceTimer];

    if (!v2)
    {
      id v3 = [a1 dataSource];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v4 = [a1 connectionInfoItems];
      id v5 = (void *)[v4 copy];

      uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v29 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            char v10 = [v9 hasPendingRequest];
            if (v9) {
              char v11 = v10;
            }
            else {
              char v11 = 1;
            }
            if ((v11 & 1) == 0)
            {
              int v12 = [v9 pendingEventItems];
              id v13 = [v12 eventItems];
              BOOL v14 = [v13 count] == 0;

              if (!v14) {
                goto LABEL_21;
              }
            }
            if ([v3 serverSupportFragmentCachedEvents:a1])
            {
              if (!([v9 hasPendingRequest] & 1 | (v9 == 0)))
              {
                id v15 = [v9 pendingCachedEventItems];
                long long v16 = [v15 eventItems];
                BOOL v17 = [v16 count] == 0;

                if (!v17)
                {
                  id v18 = a1[8];
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(buf[0]) = 0;
                    _os_log_impl(&dword_19D557000, v18, OS_LOG_TYPE_DEFAULT, "Has cached events to send", (uint8_t *)buf, 2u);
                  }
LABEL_21:

                  __int16 v19 = a1[8];
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(buf[0]) = 0;
                    _os_log_impl(&dword_19D557000, v19, OS_LOG_TYPE_DEFAULT, "Creating debounce timer, have events to send.", (uint8_t *)buf, 2u);
                  }
                  objc_initWeak(buf, a1);
                  id v20 = [v3 serverTimerProvider:a1];
                  id v21 = [a1 queue];
                  double Debounce = -[HMEMessageDatagramServer _nextDebounceInterval](a1);
                  v25[0] = MEMORY[0x1E4F143A8];
                  v25[1] = 3221225472;
                  v25[2] = __55__HMEMessageDatagramServer__startDebounceTimerIfNeeded__block_invoke;
                  v25[3] = &unk_1E5955F58;
                  objc_copyWeak(&v26, buf);
                  long long v23 = [v20 timerWithQueue:v21 interval:v25 timerFireHandler:Debounce];

                  [a1 setConnectionDebounceTimer:v23];
                  long long v24 = [a1 connectionDebounceTimer];
                  [v24 resume];

                  objc_destroyWeak(&v26);
                  objc_destroyWeak(buf);
                  goto LABEL_24;
                }
              }
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

LABEL_24:
    }
  }
}

- (double)_nextDebounceInterval
{
  v2 = [a1 dataSource];
  id v3 = v2;
  if (v2)
  {
    [v2 serverDebounceTimeInterval:a1];
    double v5 = v4;
  }
  else
  {
    double v5 = 5.0;
  }

  return v5;
}

void __55__HMEMessageDatagramServer__startDebounceTimerIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v62 = WeakRetained;
    v2 = [WeakRetained queue];
    dispatch_assert_queue_V2(v2);

    id v3 = v62[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Debounce timer fired", buf, 2u);
    }
    -[HMEMessageDatagramServer _pruneExpiredItemsFromConnectionItems](v62);
    -[HMEMessageDatagramServer _resetDebounceTimer](v62);
    double v4 = [v62 queue];
    dispatch_assert_queue_V2(v4);

    double v5 = [v62 dataSource];
    uint64_t v6 = [v5 serverTimerProvider:v62];
    uint64_t v7 = [v6 currentDate];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v8 = [v62 connectionInfoItems];
    uint64_t v9 = (void *)[v8 copy];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:buf count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v64;
      uint64_t v56 = *(void *)v64;
      v57 = v9;
      v58 = v7;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v64 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v63 + 1) + 8 * v13);
          if (([v14 hasPendingRequest] & 1) == 0)
          {
            id v15 = [v14 debounceStartTime];

            if (v15)
            {
              long long v16 = [v14 debounceStartTime];
              BOOL v17 = [v16 dateByAddingTimeInterval:-[HMEMessageDatagramServer _nextDebounceInterval](v62)];

              [v17 timeIntervalSinceReferenceDate];
              double v19 = v18;
              [v7 timeIntervalSinceReferenceDate];
              if (v19 < v20)
              {
                id v21 = v14;
                id v22 = [v62 queue];
                dispatch_assert_queue_V2(v22);

                long long v23 = (void *)MEMORY[0x19F3A6E70]();
                v61 = [v21 connection];
                if (v61)
                {
                  v60 = v23;
                  id v24 = v21;
                  long long v25 = v24;
                  if (v24
                    && ([v24 connection],
                        id v26 = objc_claimAutoreleasedReturnValue(),
                        v26,
                        v26))
                  {
                    uint64_t v27 = [v62 dataSource];
                    uint64_t v28 = [v27 serverFragmentEventsDataSize:v62];

                    unint64_t v73 = 0;
                    v55 = [MEMORY[0x1E4F1C978] array];
                    long long v29 = [MEMORY[0x1E4F1C978] array];
                    v59 = [v62 delegate];
                    long long v30 = [v25 pendingEventItems];
                    int v31 = [v30 hasEventItem];

                    if (v31)
                    {
                      id v32 = [v25 pendingEventItems];
                      uint64_t v33 = [v32 popEventItemsUpWithFragments:v28 != 0 toSizeInBytes:v28 usedBytes:&v73];

                      if (v28)
                      {
                        id v34 = [v25 pendingEventItems];
                        objc_msgSend(v59, "server:logMetricsForMessageDatagramFragmentation:isFragmented:", v62, 0, objc_msgSend(v34, "hasEventItem"));
                      }
                      else
                      {
                        [v59 server:v62 logMetricsForMessageDatagramFragmentation:0 isFragmented:0];
                      }
                    }
                    else
                    {
                      uint64_t v33 = v29;
                    }
                    uint64_t v36 = [v25 pendingCachedEventItems];
                    if ([v36 hasEventItem])
                    {
                      unint64_t v37 = v73;

                      if (v28 - 1 >= v37)
                      {
                        if (v28) {
                          unint64_t v39 = v28 - v73;
                        }
                        else {
                          unint64_t v39 = 0;
                        }
                        long long v40 = [v25 pendingCachedEventItems];
                        long long v38 = [v40 popEventItemsUpWithFragments:v28 != 0 toSizeInBytes:v39 usedBytes:&v73];

                        if (v28)
                        {
                          v41 = [v25 pendingCachedEventItems];
                          objc_msgSend(v59, "server:logMetricsForMessageDatagramFragmentation:isFragmented:", v62, 1, objc_msgSend(v41, "hasEventItem"));
                        }
                        else
                        {
                          [v59 server:v62 logMetricsForMessageDatagramFragmentation:1 isFragmented:0];
                        }
                      }
                      else
                      {
                        long long v38 = v55;
                      }
                    }
                    else
                    {

                      long long v38 = v55;
                    }
                    *(void *)&long long v75 = v33;
                    *((void *)&v75 + 1) = v38;
                    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:2];
                  }
                  else
                  {
                    uint64_t v35 = &unk_1EEF0C440;
                  }

                  id v42 = [v35 objectAtIndexedSubscript:0];
                  if ([v42 count])
                  {

LABEL_35:
                    id v45 = v25;
                    uint64_t v46 = v45;
                    if (v25
                      && ([v45 connection],
                          v47 = objc_claimAutoreleasedReturnValue(),
                          v47,
                          v47))
                    {
                      v48 = [v46 pendingEventItems];
                      if ([v48 hasEventItem])
                      {

                        goto LABEL_41;
                      }
                      v52 = [v46 pendingCachedEventItems];
                      char v53 = [v52 hasEventItem];

                      if (v53)
                      {
LABEL_41:
                        v49 = v62[8];
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                        {
                          LODWORD(v75) = 138412290;
                          *(void *)((char *)&v75 + 4) = v61;
                          _os_log_impl(&dword_19D557000, v49, OS_LOG_TYPE_DEFAULT, "Starting request to send events to connection %@", (uint8_t *)&v75, 0xCu);
                        }
                        v67[0] = MEMORY[0x1E4F143A8];
                        v67[1] = 3221225472;
                        v68 = __44__HMEMessageDatagramServer__performRequest___block_invoke;
                        v69 = &unk_1E5955F30;
                        v70 = v62;
                        id v71 = v61;
                        id v72 = v35;
                        id v50 = v35;
                        if (v25)
                        {
                          v51 = v67;
                          [v46 setHasPendingRequest:1];
                          *(void *)&long long v75 = MEMORY[0x1E4F143A8];
                          *((void *)&v75 + 1) = 3221225472;
                          v76 = __49__HMEConnectionInfoItem_performRequestWithBlock___block_invoke;
                          v77 = &unk_1E5955EE0;
                          v78 = v46;
                          v68(v51, &v75);
                        }
                        uint64_t v12 = v56;
                        goto LABEL_46;
                      }
                    }
                    else
                    {
                    }
                    [v46 setDebounceStartTime:0];
                    goto LABEL_41;
                  }
                  __int16 v43 = [v35 objectAtIndexedSubscript:1];
                  uint64_t v44 = [v43 count];

                  if (v44) {
                    goto LABEL_35;
                  }
LABEL_46:

                  uint64_t v9 = v57;
                  uint64_t v7 = v58;
                  long long v23 = v60;
                }
              }
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v54 = [v9 countByEnumeratingWithState:&v63 objects:buf count:16];
        uint64_t v11 = v54;
      }
      while (v54);
    }

    -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](v62);
    id WeakRetained = v62;
  }
}

- (void)_pruneExpiredItemsFromConnectionItems
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [a1 queue];
  dispatch_assert_queue_V2(v2);

  id v3 = [a1 dataSource];
  double v4 = [v3 serverTimerProvider:a1];
  double v5 = [v4 currentDate];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [a1 connectionInfoItems];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v25;
    *(void *)&long long v9 = 138412546;
    long long v23 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        BOOL v14 = objc_msgSend(v13, "connection", v23);
        if (v14)
        {
          id v15 = [v13 expiry];
          [v15 timeIntervalSinceDate:v5];
          double v17 = v16;

          if (v17 < 0.0)
          {
            double v18 = [a1 delegate];
            [v18 server:a1 connectionDidExpire:v14];

            double v19 = [a1 connectionInfoItems];
            [v19 removeObject:v13];

            double v20 = a1[8];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              long long v29 = v13;
              __int16 v30 = 2112;
              int v31 = v14;
              _os_log_impl(&dword_19D557000, v20, OS_LOG_TYPE_DEFAULT, "Removed connection item as connection has expired %@, connection: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v21 = a1[8];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v29 = v13;
            _os_log_impl(&dword_19D557000, v21, OS_LOG_TYPE_DEFAULT, "Removed connection item as connection was not found %@", buf, 0xCu);
          }
          id v22 = [a1 connectionInfoItems];
          [v22 removeObject:v13];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }
}

void __44__HMEMessageDatagramServer__performRequest___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, a1[4]);
  objc_initWeak(&from, a1[5]);
  double v4 = [a1[4] delegate];
  id v5 = a1[4];
  uint64_t v6 = [a1[6] objectAtIndexedSubscript:0];
  uint64_t v7 = [a1[6] objectAtIndexedSubscript:1];
  id v8 = a1[5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__HMEMessageDatagramServer__performRequest___block_invoke_2;
  v10[3] = &unk_1E5955F08;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  id v9 = v3;
  id v12 = v9;
  id v11 = a1[6];
  [v4 server:v5 sendEvents:v6 cachedEvents:v7 connection:v8 completion:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __44__HMEMessageDatagramServer__performRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
  uint64_t v6 = [WeakRetained queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = WeakRetained[8];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v5;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_19D557000, v7, OS_LOG_TYPE_DEFAULT, "Sent events to connection: %@ with response %@", buf, 0x16u);
    uint64_t v7 = WeakRetained[8];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v22 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    id v25 = v22;
    __int16 v26 = 2112;
    id v27 = v5;
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_debug_impl(&dword_19D557000, v7, OS_LOG_TYPE_DEBUG, "Sent events: %@ to connection: %@, response: %@", buf, 0x20u);
    if (v5) {
      goto LABEL_6;
    }
  }
  else if (v5)
  {
LABEL_6:
    id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
    id v10 = v3;
    id v11 = v8;
    id v12 = v9;
    id v13 = v5;
    id v14 = [WeakRetained queue];
    dispatch_assert_queue_V2(v14);

    uint64_t v15 = -[HMEMessageDatagramServer _connectionItemForConnection:](WeakRetained, v13);
    double v16 = (void *)v15;
    if (v10)
    {
      id v23 = v11;
      if (v15)
      {
        if ([v11 count])
        {
          double v17 = [v16 pendingEventItems];
          [v17 combinePreviousEvents:v11];
        }
        if ([v12 count])
        {
          double v18 = [v16 pendingCachedEventItems];
          [v18 combinePreviousEvents:v12];
        }
      }
      double v19 = [WeakRetained dataSource];
      int v20 = [v19 server:WeakRetained isConnectionTerminatingError:v10];

      if (v20)
      {
        id v21 = WeakRetained[8];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v10;
          _os_log_error_impl(&dword_19D557000, v21, OS_LOG_TYPE_ERROR, "Removing connection on terminal error %@", buf, 0xCu);
        }
        -[HMEMessageDatagramServer _removeConnection:](WeakRetained, v13);
      }
      id v11 = v23;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](WeakRetained);
LABEL_20:
}

- (uint64_t)_eventSize:(uint64_t)a1
{
  id v3 = a2;
  double v4 = v3;
  uint64_t v5 = 0;
  if (a1)
  {
    if (v3)
    {
      uint64_t v6 = [v3 encodedData];
      uint64_t v5 = [v6 length];

      uint64_t v7 = [v4 eventMetadata];

      if (v7)
      {
        id v8 = [v4 eventMetadata];
        id v9 = [v8 source];
        uint64_t v10 = [v9 length];

        v5 += v10 + 24;
      }
    }
  }

  return v5;
}

- (void)disconnectConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Removing connection %@ registrations on unregister", (uint8_t *)&v6, 0xCu);
  }
  [(HMERouterServer *)self didRemoveConnection:v4];
}

- (void)connectWithConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5 topicFilterAdditions:(id)a6 completion:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  double v16 = (void (**)(id, void, void *))a7;
  double v17 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v17);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = logger;
    *(_DWORD *)buf = 138412546;
    id v68 = v12;
    __int16 v69 = 2048;
    uint64_t v70 = [v15 count];
    _os_log_impl(&dword_19D557000, v19, OS_LOG_TYPE_DEFAULT, "Received connect request for connection: %@ with additions: %ld", buf, 0x16u);

    logger = self->_logger;
  }
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v68 = v12;
    __int16 v69 = 2112;
    uint64_t v70 = (uint64_t)v15;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Received connect request for connection: %@ with additions: %@", buf, 0x16u);
  }
  int v20 = [(HMEMessageDatagramServer *)self dataSource];
  id v21 = [(HMEMessageDatagramServer *)self delegate];
  v58 = v20;
  if ([v20 server:self shouldProcessEventsForConnection:v12 shouldLogState:1])
  {
    id v56 = v14;
    v57 = v16;
    v55 = v15;
    id v22 = v12;
    id v23 = [(HMERouterServer *)self queue];
    dispatch_assert_queue_V2(v23);

    long long v24 = [(HMEMessageDatagramServer *)self dataSource];
    [v24 server:self timeoutIntervalForConnection:v22];
    double v26 = v25;
    id v27 = [v24 serverTimerProvider:self];
    __int16 v28 = [v27 dateWithTimeIntervalSinceNow:v26];

    uint64_t v29 = -[HMEMessageDatagramServer _expiryItemForConnection:](self, v22);
    if (v29)
    {
      uint64_t v30 = (HMEConnectionInfoItem *)v29;
      int v31 = self->_logger;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v68 = v22;
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v28;
        _os_log_impl(&dword_19D557000, v31, OS_LOG_TYPE_DEFAULT, "Updated connection %@ expiry to %@", buf, 0x16u);
      }
      [(HMEConnectionInfoItem *)v30 setExpiry:v28];
    }
    else
    {
      uint64_t v30 = [[HMEConnectionInfoItem alloc] initWithConnection:v22 expiry:v28];
      id v34 = [(HMEMessageDatagramServer *)self connectionInfoItems];
      [v34 addObject:v30];

      uint64_t v35 = self->_logger;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v68 = v22;
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v28;
        _os_log_impl(&dword_19D557000, v35, OS_LOG_TYPE_DEFAULT, "Added connection %@ with expiry %@", buf, 0x16u);
      }
    }
    -[HMEMessageDatagramServer _setupAndStartExpiryTimer](self);

    id v14 = v56;
    [(HMERouterServer *)self didConnectConnection:v22 connectEvent:v13 unregisterEvent:v56];
    [v21 server:self connectionDidConnect:v22];
    id v15 = v55;
    double v16 = v57;
    if ([v55 count])
    {
      uint64_t v36 = self->_logger;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v37 = v36;
        uint64_t v38 = [v55 count];
        *(_DWORD *)buf = 138412546;
        id v68 = v22;
        __int16 v69 = 2048;
        uint64_t v70 = v38;
        _os_log_impl(&dword_19D557000, v37, OS_LOG_TYPE_DEFAULT, "Registering connection: %@ to topics: %ld", buf, 0x16u);

        uint64_t v36 = self->_logger;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v68 = v22;
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v55;
        _os_log_debug_impl(&dword_19D557000, v36, OS_LOG_TYPE_DEBUG, "Registering connection: %@ to topics: %@", buf, 0x16u);
      }
      unint64_t v39 = [(HMERouterServer *)self topicRouter];
      [v39 changeRegistrationsForConsumer:v22 topicFilterAdditions:v55 topicFilterRemovals:MEMORY[0x1E4F1CBF0]];
    }
    if (v57)
    {
      if ([v58 serverSupportFragmentCachedEvents:self])
      {
        long long v40 = [(HMERouterServer *)self queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __111__HMEMessageDatagramServer_connectWithConnection_connectEvent_unregisterEvent_topicFilterAdditions_completion___block_invoke;
        block[3] = &unk_1E5955FA8;
        block[4] = self;
        id v64 = v55;
        id v65 = v22;
        dispatch_async(v40, block);

        v57[2](v57, MEMORY[0x1E4F1CC08], 0);
      }
      else
      {
        v41 = [MEMORY[0x1E4F1CA60] dictionary];
        if ([v58 server:self shouldProcessEventsForConnection:v22 shouldLogState:0])
        {
          id v53 = v13;
          id v54 = v12;
          id v42 = [(HMERouterServer *)self cachedEventsForExpandedTopics:v55];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          uint64_t v43 = [v42 countByEnumeratingWithState:&v59 objects:v66 count:16];
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v60;
            do
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v60 != v45) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v47 = *(void *)(*((void *)&v59 + 1) + 8 * i);
                v48 = [v42 objectForKeyedSubscript:v47];
                int v49 = [v21 shouldAllowEvent:v48 topic:v47 connection:v22];

                if (v49)
                {
                  id v50 = [v42 objectForKeyedSubscript:v47];
                  [v41 setObject:v50 forKeyedSubscript:v47];
                }
              }
              uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v66 count:16];
            }
            while (v44);
          }

          id v13 = v53;
          id v12 = v54;
          id v15 = v55;
          id v14 = v56;
        }
        else
        {
          v51 = self->_logger;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v68 = v22;
            _os_log_error_impl(&dword_19D557000, v51, OS_LOG_TYPE_ERROR, "Will not process events for connection %@", buf, 0xCu);
          }
        }
        v52 = (void *)[v41 copy];
        ((void (**)(id, void *, void *))v57)[2](v57, v52, 0);

        double v16 = v57;
      }
    }
  }
  else
  {
    id v32 = self->_logger;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v68 = v12;
      _os_log_error_impl(&dword_19D557000, v32, OS_LOG_TYPE_ERROR, "Connect not allowed in current state for connection: %@", buf, 0xCu);
    }
    [v21 server:self connectionDidFail:v12];
    uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMEErrorDomain" code:4 userInfo:0];
    v16[2](v16, MEMORY[0x1E4F1CC08], v33);
  }
}

void __111__HMEMessageDatagramServer_connectWithConnection_connectEvent_unregisterEvent_topicFilterAdditions_completion___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) cachedEventsForExpandedTopics:*(void *)(a1 + 40)];
  id v3 = *(os_log_t **)(a1 + 32);
  v5[0] = *(void *)(a1 + 48);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  -[HMEMessageDatagramServer _addCachedEvents:connections:](v3, v2, v4);
}

- (void)_setupAndStartExpiryTimer
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v1 = [a1 connectionExpiryTimer];
  if (v1)
  {
  }
  else
  {
    v2 = [a1 connectionInfoItems];
    uint64_t v3 = [v2 count];

    if (v3)
    {
      objc_initWeak(&location, a1);
      long long v24 = [a1 dataSource];
      id v23 = [v24 serverTimerProvider:a1];
      id v4 = [a1 queue];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v5 = [a1 connectionInfoItems];
      int v6 = (void *)[v5 copy];

      id v7 = 0;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v30;
        do
        {
          uint64_t v10 = 0;
          do
          {
            id v11 = v4;
            if (*(void *)v30 != v9) {
              objc_enumerationMutation(v6);
            }
            id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
            if (v7)
            {
              id v13 = [*(id *)(*((void *)&v29 + 1) + 8 * v10) expiry];
              id v14 = [v7 expiry];
              [v13 timeIntervalSinceDate:v14];
              BOOL v16 = v15 < 0.0;

              id v4 = v11;
              if (v16)
              {
                id v17 = v12;

                id v7 = v17;
              }
            }
            else
            {
              id v7 = v12;
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v8);
      }

      double v18 = [v7 expiry];
      [v18 timeIntervalSinceNow];
      double v20 = v19;

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __53__HMEMessageDatagramServer__setupAndStartExpiryTimer__block_invoke;
      v26[3] = &unk_1E5955F58;
      objc_copyWeak(&v27, &location);
      id v21 = [v23 timerWithQueue:v4 interval:v26 timerFireHandler:v20];

      [a1 setConnectionExpiryTimer:v21];
      id v22 = [a1 connectionExpiryTimer];
      [v22 resume];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
}

void __53__HMEMessageDatagramServer__setupAndStartExpiryTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained queue];
    dispatch_assert_queue_V2(v2);

    uint64_t v3 = v4[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Connection expiry timer fired", buf, 2u);
    }
    -[HMEMessageDatagramServer _pruneExpiredItemsFromConnectionItems](v4);
    [v4 setConnectionExpiryTimer:0];
    -[HMEMessageDatagramServer _setupAndStartExpiryTimer](v4);
    id WeakRetained = v4;
  }
}

- (void)refreshConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Refresh connection: %@", buf, 0xCu);
  }
  int v6 = [(HMERouterServer *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HMEMessageDatagramServer_refreshConnection___block_invoke;
  v8[3] = &unk_1E5955FD0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __46__HMEMessageDatagramServer_refreshConnection___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) topicRouter];
  uint64_t v3 = [v2 topicsForConsumer:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) cachedEventsForExpandedTopics:v3];
  uint64_t v5 = *(os_log_t **)(a1 + 32);
  v7[0] = *(void *)(a1 + 40);
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  -[HMEMessageDatagramServer _addCachedEvents:connections:](v5, v4, v6);
}

- (id)expandedTopicsForTopics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMEMessageDatagramServer *)self dataSource];
  int v6 = [v5 server:self expandedTopicsForTopics:v4];

  return v6;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMEMessageDatagramServer *)self dataSource];
  int v6 = [v5 server:self upstreamTopicsForTopic:v4];

  return v6;
}

- (void)handleCachedEvent:(id)a3 topic:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMERouterServer *)self topicRouter];
  uint64_t v10 = [v9 consumersForTopic:v6];

  id v12 = v6;
  v13[0] = v7;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  -[HMEMessageDatagramServer _addCachedEvents:connections:]((os_log_t *)self, v11, v10);
}

- (void)handleEvent:(id)a3 topic:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v6 = a4;
  id v7 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v7);

  long long v31 = [(HMEMessageDatagramServer *)self dataSource];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v6;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Handling event for topic %@", buf, 0xCu);
  }
  long long v29 = [[HMEEventInfo alloc] initWithEvent:v30 topic:v6];
  id v9 = [(HMERouterServer *)self topicRouter];
  uint64_t v10 = [v9 consumersForTopic:v6];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    id v15 = v6;
    char v16 = 0;
    uint64_t v17 = *(void *)v33;
    *(void *)&long long v13 = 138412546;
    long long v28 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v11);
        }
        double v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v31, "server:shouldProcessEventsForConnection:shouldLogState:", self, v19, 0, v28))
        {
          double v20 = [(HMEMessageDatagramServer *)self delegate];
          if ([v20 shouldAllowEvent:v30 topic:v15 connection:v19])
          {
            id v21 = -[HMEMessageDatagramServer _connectionItemForConnection:](self, v19);
            id v22 = self->_logger;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v28;
              id v37 = v15;
              __int16 v38 = 2112;
              unint64_t v39 = v19;
              _os_log_impl(&dword_19D557000, v22, OS_LOG_TYPE_DEFAULT, "Adding pending event topic: %@ to connection: %@", buf, 0x16u);
            }
            id v23 = [v21 pendingEventItems];
            [v23 addEventInfo:v29];

            objc_msgSend(v20, "server:logMetricsForEventTopic:eventSize:isCached:", self, v15, -[HMEMessageDatagramServer _eventSize:]((uint64_t)self, v30), 0);
            long long v24 = [v21 debounceStartTime];

            if (!v24)
            {
              double v25 = [v31 serverTimerProvider:self];
              double v26 = [v25 currentDate];
              [v21 setDebounceStartTime:v26];
            }
            char v16 = 1;
          }
          else
          {
            id v27 = self->_logger;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v28;
              id v37 = v15;
              __int16 v38 = 2112;
              unint64_t v39 = v19;
              _os_log_debug_impl(&dword_19D557000, v27, OS_LOG_TYPE_DEBUG, "Delegate did not allow event %@ to %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v14);

    id v6 = v15;
    if (v16) {
      -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](self);
    }
  }
  else
  {
  }
}

- (HMEMessageDatagramServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logCategory:(const char *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  os_log_t v16 = os_log_create("com.apple.HomeKitEventRouter", a7);
  v21.receiver = self;
  v21.super_class = (Class)HMEMessageDatagramServer;
  uint64_t v17 = [(HMERouterServer *)&v21 initWithQueue:v15 provider:v14 registrationEventRouter:v13 storeReadHandle:v12 logger:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, v16);
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    connectionInfoItems = v17->_connectionInfoItems;
    v17->_connectionInfoItems = (NSMutableArray *)v18;
  }
  return v17;
}

- (HMEMessageDatagramServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5
{
  return [(HMEMessageDatagramServer *)self initWithQueue:a3 provider:a4 registrationEventRouter:a5 storeReadHandle:0 logCategory:"HMEMessageDatagramServer"];
}

@end