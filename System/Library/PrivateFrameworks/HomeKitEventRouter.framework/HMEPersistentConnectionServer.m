@interface HMEPersistentConnectionServer
- (HMEPersistentConnectionServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5;
- (HMEPersistentConnectionServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logCategory:(const char *)a7;
- (HMEPersistentConnectionServerDataSource)dataSource;
- (HMEPersistentConnectionServerDelegate)delegate;
- (id)expandedTopicsForTopics:(id)a3;
- (id)upstreamTopicsForTopic:(id)a3;
- (void)changeRegistrationsForConnection:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6;
- (void)connectWithConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5 completion:(id)a6;
- (void)didInvalidateConnection:(id)a3;
- (void)disconnectConnection:(id)a3;
- (void)handleCachedEvent:(id)a3 topic:(id)a4;
- (void)handleEvent:(id)a3 topic:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMEPersistentConnectionServer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setDataSource:(id)a3
{
}

- (HMEPersistentConnectionServerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMEPersistentConnectionServerDataSource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMEPersistentConnectionServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMEPersistentConnectionServerDelegate *)WeakRetained;
}

- (void)changeRegistrationsForConnection:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, void))a6;
  v14 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v14);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v16 = logger;
    int v19 = 138412802;
    id v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = [v11 count];
    __int16 v23 = 2048;
    uint64_t v24 = [v12 count];
    _os_log_impl(&dword_19D557000, v16, OS_LOG_TYPE_DEFAULT, "Processing request to change registrations for connection: %@  with addedTopics:%ld removedTopics: %ld", (uint8_t *)&v19, 0x20u);

    logger = self->_logger;
  }
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = (uint64_t)v11;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v12;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Processing request to change registrations for connection: %@  with addedTopics:%@ removedTopics: %@", (uint8_t *)&v19, 0x20u);
  }
  v17 = [(HMERouterServer *)self topicRouter];
  [v17 changeRegistrationsForConsumer:v10 topicFilterAdditions:v11 topicFilterRemovals:v12];

  if (v13)
  {
    v18 = [(HMERouterServer *)self cachedEventsForExpandedTopics:v11];
    v13[2](v13, v18, 0);
  }
}

- (void)didInvalidateConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Removing connection %@ registrations on invalidation", (uint8_t *)&v6, 0xCu);
  }
  [(HMERouterServer *)self didRemoveConnection:v4];
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

- (void)connectWithConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5 completion:(id)a6
{
  id v11 = a6;
  [(HMERouterServer *)self didConnectConnection:a3 connectEvent:a4 unregisterEvent:a5];
  id v10 = v11;
  if (v11)
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
    id v10 = v11;
  }
}

- (id)expandedTopicsForTopics:(id)a3
{
  id v4 = a3;
  v5 = [(HMEPersistentConnectionServer *)self dataSource];
  int v6 = [v5 server:self expandedTopicsForTopics:v4];

  return v6;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4 = a3;
  v5 = [(HMEPersistentConnectionServer *)self dataSource];
  int v6 = [v5 server:self upstreamTopicsForTopic:v4];

  return v6;
}

- (void)handleCachedEvent:(id)a3 topic:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMEPersistentConnectionServer *)self delegate];
  v9 = [[HMEEventInfo alloc] initWithEvent:v6 topic:v7];
  id v10 = [(HMERouterServer *)self topicRouter];
  id v11 = [v10 consumersForTopic:v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
        if (v17
          && objc_msgSend(v8, "shouldAllowEvent:topic:connection:", v6, v7, *(void *)(*((void *)&v19 + 1) + 8 * v16), (void)v19))
        {
          __int16 v23 = v9;
          v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
          [v8 sendUpdatedCachedEvents:v18 toConnection:v17];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)handleEvent:(id)a3 topic:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [[HMEEventInfo alloc] initWithEvent:v6 topic:v7];
  id v10 = [(HMERouterServer *)self topicRouter];
  id v11 = [v10 consumersForTopic:v7];

  id v12 = [(HMEPersistentConnectionServer *)self delegate];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * v17);
        if (v18
          && objc_msgSend(v12, "shouldAllowEvent:topic:connection:", v6, v7, *(void *)(*((void *)&v20 + 1) + 8 * v17), (void)v20))
        {
          uint64_t v24 = v9;
          long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
          [v12 sendUpdatedEvents:v19 toConnection:v18];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v15);
  }
}

- (HMEPersistentConnectionServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logCategory:(const char *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  os_log_t v16 = os_log_create("com.apple.HomeKitEventRouter", a7);
  v19.receiver = self;
  v19.super_class = (Class)HMEPersistentConnectionServer;
  uint64_t v17 = [(HMERouterServer *)&v19 initWithQueue:v15 provider:v14 registrationEventRouter:v13 storeReadHandle:v12 logger:v16];

  if (v17) {
    objc_storeStrong((id *)&v17->_logger, v16);
  }

  return v17;
}

- (HMEPersistentConnectionServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5
{
  return [(HMEPersistentConnectionServer *)self initWithQueue:a3 provider:a4 registrationEventRouter:a5 storeReadHandle:0 logCategory:"HMERouterServer"];
}

@end