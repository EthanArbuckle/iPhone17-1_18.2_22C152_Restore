@interface HMEPersistentConnectionClient
- (BOOL)isActiveForSaving;
- (HMEPersistentConnectionClient)initWithQueue:(id)a3;
- (HMEPersistentConnectionClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5;
- (HMEPersistentConnectionClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logger:(id)a6;
- (id)forwardingTopicsForTopics:(id)a3;
- (unint64_t)willWriteToStore;
- (void)didReconnect;
- (void)finishedWritingToStore:(unint64_t)a3;
- (void)processReceivedCachedEventsFromMessage:(id)a3;
- (void)processReceivedEventsFromMessage:(id)a3;
@end

@implementation HMEPersistentConnectionClient

- (void)didReconnect
{
  v3 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMERouterClient *)self topicRouter];
  v5 = [v4 allRegisteredTopicFilters];
  v6 = [(HMEPersistentConnectionClient *)self forwardingTopicsForTopics:v5];
  v7 = [v6 allObjects];

  if ([v7 count])
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Reregistering topics on reconnect.", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    v9 = [(HMEPersistentConnectionClient *)self delegate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__HMEPersistentConnectionClient_didReconnect__block_invoke;
    v10[3] = &unk_1E5955FF8;
    objc_copyWeak(&v11, buf);
    v10[4] = self;
    [v9 sendChangeRegistrationsMessageWithAddedFilters:v7 removedFilters:MEMORY[0x1E4F1CBF0] completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (id)forwardingTopicsForTopics:(id)a3
{
  id v4 = a3;
  v5 = [(HMEPersistentConnectionClient *)self delegate];
  v6 = [v5 forwardingTopicsForTopics:v4];
  v7 = v6;
  if (!v6) {
    v6 = v4;
  }
  id v8 = v6;

  return v8;
}

- (HMEPersistentConnectionClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (OS_os_log *)os_log_create("com.apple.HomeKitEventRouter", "PersistentConnectionClient");
  logger = self->_logger;
  self->_logger = v11;

  v13 = [(HMEPersistentConnectionClient *)self initWithQueue:v10 storeReadHandle:v9 storeWriteHandle:v8 logger:v11];
  return v13;
}

- (HMEPersistentConnectionClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logger:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMEPersistentConnectionClient;
  v12 = [(HMERouterClient *)&v15 initWithQueue:a3 storeReadHandle:a4 storeWriteHandle:a5 logger:v11];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_logger, a6);
  }

  return v13;
}

- (void).cxx_destruct
{
}

- (void)finishedWritingToStore:(unint64_t)a3
{
  id v4 = [(HMEPersistentConnectionClient *)self delegate];
  [v4 finishedWritingToStore:a3];
}

- (unint64_t)willWriteToStore
{
  v2 = [(HMEPersistentConnectionClient *)self delegate];
  unint64_t v3 = [v2 willWriteToStore];

  return v3;
}

- (BOOL)isActiveForSaving
{
  v2 = [(HMEPersistentConnectionClient *)self delegate];
  char v3 = [v2 isActiveForSaving];

  return v3;
}

- (void)processReceivedCachedEventsFromMessage:(id)a3
{
  id v4 = a3;
  v5 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[HMEEventInfo eventsMapFromEventInfos:v4];

  v8.receiver = self;
  v8.super_class = (Class)HMEPersistentConnectionClient;
  id v7 = [(HMERouterClient *)&v8 processReceivedCachedEvents:v6];
}

- (void)processReceivedEventsFromMessage:(id)a3
{
  id v4 = a3;
  v5 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)HMEPersistentConnectionClient;
  [(HMERouterClient *)&v6 processReceivedEvents:v4];
}

void __45__HMEPersistentConnectionClient_didReconnect__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v6 = [WeakRetained queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__HMEPersistentConnectionClient_didReconnect__block_invoke_2;
    v9[3] = &unk_1E5955FD0;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(v6, v9);
  }
}

id __45__HMEPersistentConnectionClient_didReconnect__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)HMEPersistentConnectionClient;
  return objc_msgSendSuper2(&v3, sel_processReceivedCachedEvents_, v1);
}

- (HMEPersistentConnectionClient)initWithQueue:(id)a3
{
  return [(HMEPersistentConnectionClient *)self initWithQueue:a3 storeReadHandle:0 storeWriteHandle:0];
}

@end