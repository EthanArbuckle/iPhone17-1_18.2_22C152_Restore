@interface HMERouterServer
- (HMEEventForwarder)localEventForwarder;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMERouterServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5;
- (HMERouterServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logger:(id)a7;
- (HMESynchronousSubscriptionProviding)subscriptionProvider;
- (HMETopicRouter)topicRouter;
- (NSMapTable)unregisterEvents;
- (OS_dispatch_queue)queue;
- (id)cachedEventsForExpandedTopics:(id)a3;
- (id)dumpStateDescription;
- (id)expandedTopicsForTopics:(id)a3;
- (id)upstreamTopicsForTopic:(id)a3;
- (void)cachedEventsForTopicFilters:(id)a3 cachedEventCollection:(id)a4;
- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4;
- (void)didConnectConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)didRemoveConnection:(id)a3;
- (void)handleCachedEvent:(id)a3 topic:(id)a4;
- (void)handleEvent:(id)a3 topic:(id)a4;
@end

@implementation HMERouterServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_localEventForwarder, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_unregisterEvents, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMETopicRouter)topicRouter
{
  return (HMETopicRouter *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 40, 1);
}

- (HMEEventForwarder)localEventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 32, 1);
}

- (HMESynchronousSubscriptionProviding)subscriptionProvider
{
  return (HMESynchronousSubscriptionProviding *)objc_getProperty(self, a2, 24, 1);
}

- (NSMapTable)unregisterEvents
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (id)upstreamTopicsForTopic:(id)a3
{
  return 0;
}

- (id)expandedTopicsForTopics:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)cachedEventsForTopicFilters:(id)a3 cachedEventCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMERouterServer *)self subscriptionProvider];
  [v8 cachedEventsForTopicFilters:v7 cachedEventCollection:v6];
}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEBUG, "Will change registrations with subscription provider additions:%@, removals:%@", buf, 0x16u);
  }
  v9 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v9);

  v10 = [(HMERouterServer *)self subscriptionProvider];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__HMERouterServer_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
  v13[3] = &unk_1E5955EB8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 changeRegistrationsSyncForConsumer:self topicFilterAdditions:v12 topicFilterRemovals:v11 completion:v13];
}

void __75__HMERouterServer_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  id v8 = *(NSObject **)(v7 + 8);
  if (v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(v7 + 8), OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_19D557000, v8, OS_LOG_TYPE_ERROR, "Error changing subscriptions with local subscription provider %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v7 + 8), OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)a1[5];
    uint64_t v10 = a1[6];
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_19D557000, v8, OS_LOG_TYPE_DEFAULT, "Successfully changed subscriptions by adding:%@ removing: %@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)handleCachedEvent:(id)a3 topic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Subclass Must implement" userInfo:0];
  objc_exception_throw(v7);
}

- (void)handleEvent:(id)a3 topic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Subclass Must implement" userInfo:0];
  objc_exception_throw(v7);
}

- (id)cachedEventsForExpandedTopics:(id)a3
{
  id v4 = a3;
  id v5 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMERouterServer *)self eventStoreReadHandle];

  if (v6)
  {
    id v7 = [(HMERouterServer *)self expandedTopicsForTopics:v4];
    id v8 = [(HMERouterServer *)self eventStoreReadHandle];
    v9 = [v8 eventsForTopicFilters:v7];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

- (void)didRemoveConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMERouterServer *)self topicRouter];
  [v6 unregisterConsumer:v4];

  id v7 = [(HMERouterServer *)self unregisterEvents];
  id v8 = [v7 objectForKey:v4];

  if (v8)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = logger;
      int v11 = [v8 event];
      *(_DWORD *)buf = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_19D557000, v10, OS_LOG_TYPE_DEFAULT, "Posting unregister event %@ on connection %@ unregister", buf, 0x16u);
    }
    id v12 = [(HMERouterServer *)self localEventForwarder];
    __int16 v13 = [v8 event];
    uint64_t v14 = [v8 topic];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__HMERouterServer_didRemoveConnection___block_invoke;
    v15[3] = &unk_1E5955E90;
    v15[4] = self;
    [v12 forwardEvent:v13 topic:v14 completion:v15];
  }
}

void __39__HMERouterServer_didRemoveConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19D557000, v4, OS_LOG_TYPE_INFO, "Posted unregister event with result %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)didConnectConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = logger;
      __int16 v13 = [v9 event];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_19D557000, v12, OS_LOG_TYPE_DEFAULT, "Posting connect event %@ on connection %@ register", buf, 0x16u);
    }
    uint64_t v14 = [(HMERouterServer *)self localEventForwarder];
    uint64_t v15 = [v9 event];
    v16 = [v9 topic];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__HMERouterServer_didConnectConnection_connectEvent_unregisterEvent___block_invoke;
    v18[3] = &unk_1E5955E90;
    v18[4] = self;
    [v14 forwardEvent:v15 topic:v16 completion:v18];
  }
  if (v10)
  {
    id v17 = [(HMERouterServer *)self unregisterEvents];
    [v17 setObject:v10 forKey:v8];
  }
}

void __69__HMERouterServer_didConnectConnection_connectEvent_unregisterEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19D557000, v4, OS_LOG_TYPE_INFO, "Posted connect event with result %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v10);

  LOBYTE(v10) = [v9 isCachedEventSourceCurrentProcess];
  if ((v10 & 1) == 0) {
    [(HMERouterServer *)self handleCachedEvent:v11 topic:v8];
  }
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  uint64_t v7 = [(HMERouterServer *)self queue];
  dispatch_assert_queue_V2(v7);

  [(HMERouterServer *)self handleEvent:v8 topic:v6];
}

- (id)dumpStateDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = [(HMERouterServer *)self topicRouter];
  uint64_t v7 = [v6 dumpStateDescription];
  id v8 = [v3 stringWithFormat:@"[%@ topicRouter: %@]", v5, v7];

  return v8;
}

- (HMERouterServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logger:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMERouterServer;
  id v17 = [(HMERouterServer *)&v25 init];
  __int16 v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, a7);
    objc_storeStrong((id *)&v18->_queue, a3);
    id v19 = [[HMETopicRouter alloc] initWithDelegate:v18 logger:v16];
    topicRouter = v18->_topicRouter;
    v18->_topicRouter = v19;

    uint64_t v21 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    unregisterEvents = v18->_unregisterEvents;
    v18->_unregisterEvents = (NSMapTable *)v21;

    objc_storeStrong((id *)&v18->_subscriptionProvider, a4);
    objc_storeStrong((id *)&v18->_localEventForwarder, a5);
    objc_storeStrong((id *)&v18->_eventStoreReadHandle, a6);
  }

  return v18;
}

- (HMERouterServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  os_log_t v11 = os_log_create("com.apple.HomeKitEventRouter", "HMERouterServer");
  id v12 = [(HMERouterServer *)self initWithQueue:v10 provider:v9 registrationEventRouter:v8 storeReadHandle:0 logger:v11];

  return v12;
}

@end