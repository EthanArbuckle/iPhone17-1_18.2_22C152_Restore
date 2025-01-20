@interface HMEMessageDatagramClient
- (BOOL)dormantFetchConditionsMet;
- (BOOL)handleChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4;
- (BOOL)hasPendingRequest;
- (BOOL)hasPendingServerChangeRequest;
- (BOOL)isConnected;
- (BOOL)isWaitingForFetchConditionsWhenDormant;
- (HMEMessageDatagramClient)initWithQueue:(id)a3 timerProvider:(id)a4 keepAliveInterval:(double)a5 dormantFetchTimerInterval:(double)a6 retryIntervalProvider:(id)a7;
- (HMEMessageDatagramClient)initWithQueue:(id)a3 timerProvider:(id)a4 keepAliveInterval:(double)a5 dormantFetchTimerInterval:(double)a6 retryIntervalProvider:(id)a7 storeReadHandle:(id)a8 storeWriteHandle:(id)a9 logCategory:(const char *)a10;
- (HMEMessageDatagramClientDataSource)dataSource;
- (HMEPendingTopicsCombiner)pendingTopicsCombiner;
- (HMETimer)connectionRetryTimer;
- (HMETimer)dormantFetchTimer;
- (HMETimer)keepAliveTimer;
- (HMETimerIntervalProvider)connectionRetryIntervalProvider;
- (HMETimerProvider)timerProvider;
- (NSUUID)connectedServerIdentifier;
- (NSUUID)connectingServerIdentifier;
- (double)dormatFetchTimerInterval;
- (double)keepAliveInterval;
- (id)didReceiveFetchResponseWithCachedEvents:(id)a3;
- (id)dumpStateDescription;
- (id)forwardingTopicsForTopics:(id)a3;
- (id)upstreamTopicsForTopic:(id)a3;
- (int64_t)connectionMode;
- (uint64_t)_removeDormantFetchTimer;
- (void)_didDisconnect;
- (void)_enableKeepAliveIfNeeded;
- (void)_enableReconnectTimer;
- (void)_performDisconnectRequest;
- (void)_performNextOperation;
- (void)_performRequestWithBlock:(void *)a1;
- (void)_performSubscriptionFetchRequest;
- (void)_removeKeepAliveTimer;
- (void)_removeReconnectTimer;
- (void)_removeReconnectionTimerAndResetInterval;
- (void)connectionCapabilityDidChange;
- (void)didReceiveMessageWithCachedEvents:(id)a3 serverIdentifier:(id)a4 completion:(id)a5;
- (void)didReceiveMessageWithEvents:(id)a3 serverIdentifier:(id)a4 completion:(id)a5;
- (void)resetReconnectTimerToInitialState;
- (void)serverDidChangeWithServerIdentifier:(id)a3;
- (void)setConnectedServerIdentifier:(id)a3;
- (void)setConnectingServerIdentifier:(id)a3;
- (void)setConnectionMode:(int64_t)a3;
- (void)setConnectionRetryTimer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDormantFetchConditionsMet:(BOOL)a3;
- (void)setDormantFetchTimer:(id)a3;
- (void)setHasPendingRequest:(BOOL)a3;
- (void)setHasPendingServerChangeRequest:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsWaitingForFetchConditionsWhenDormant:(BOOL)a3;
- (void)setKeepAliveTimer:(id)a3;
- (void)updateConnectionMode:(int64_t)a3 completion:(id)a4;
- (void)updateDormantFetchCondition:(int64_t)a3 completion:(id)a4;
@end

@implementation HMEMessageDatagramClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dormantFetchTimer, 0);
  objc_storeStrong((id *)&self->_connectingServerIdentifier, 0);
  objc_storeStrong((id *)&self->_connectedServerIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionRetryTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveTimer, 0);
  objc_storeStrong((id *)&self->_pendingTopicsCombiner, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_connectionRetryIntervalProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setIsWaitingForFetchConditionsWhenDormant:(BOOL)a3
{
  self->_isWaitingForFetchConditionsWhenDormant = a3;
}

- (BOOL)isWaitingForFetchConditionsWhenDormant
{
  return self->_isWaitingForFetchConditionsWhenDormant;
}

- (void)setDormantFetchConditionsMet:(BOOL)a3
{
  self->_dormantFetchConditionsMet = a3;
}

- (BOOL)dormantFetchConditionsMet
{
  return self->_dormantFetchConditionsMet;
}

- (void)setDormantFetchTimer:(id)a3
{
}

- (HMETimer)dormantFetchTimer
{
  return self->_dormantFetchTimer;
}

- (double)dormatFetchTimerInterval
{
  return self->_dormatFetchTimerInterval;
}

- (void)setConnectionMode:(int64_t)a3
{
  self->_connectionMode = a3;
}

- (int64_t)connectionMode
{
  return self->_connectionMode;
}

- (void)setConnectingServerIdentifier:(id)a3
{
}

- (NSUUID)connectingServerIdentifier
{
  return self->_connectingServerIdentifier;
}

- (void)setConnectedServerIdentifier:(id)a3
{
}

- (NSUUID)connectedServerIdentifier
{
  return self->_connectedServerIdentifier;
}

- (void)setConnectionRetryTimer:(id)a3
{
}

- (HMETimer)connectionRetryTimer
{
  return self->_connectionRetryTimer;
}

- (void)setKeepAliveTimer:(id)a3
{
}

- (HMETimer)keepAliveTimer
{
  return self->_keepAliveTimer;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setHasPendingServerChangeRequest:(BOOL)a3
{
  self->_hasPendingServerChangeRequest = a3;
}

- (BOOL)hasPendingServerChangeRequest
{
  return self->_hasPendingServerChangeRequest;
}

- (void)setHasPendingRequest:(BOOL)a3
{
  self->_hasPendingRequest = a3;
}

- (BOOL)hasPendingRequest
{
  return self->_hasPendingRequest;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (HMEPendingTopicsCombiner)pendingTopicsCombiner
{
  return (HMEPendingTopicsCombiner *)objc_getProperty(self, a2, 96, 1);
}

- (HMETimerProvider)timerProvider
{
  return (HMETimerProvider *)objc_getProperty(self, a2, 88, 1);
}

- (HMETimerIntervalProvider)connectionRetryIntervalProvider
{
  return (HMETimerIntervalProvider *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMEMessageDatagramClientDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMEMessageDatagramClientDataSource *)WeakRetained;
}

- (id)dumpStateDescription
{
  v3 = NSString;
  int64_t v4 = [(HMEMessageDatagramClient *)self connectionMode];
  BOOL v5 = [(HMEMessageDatagramClient *)self isConnected];
  v6 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
  v7 = [(HMEMessageDatagramClient *)self connectionRetryTimer];
  [v7 timeInterval];
  uint64_t v9 = v8;
  BOOL v10 = [(HMEMessageDatagramClient *)self dormantFetchConditionsMet];
  v14.receiver = self;
  v14.super_class = (Class)HMEMessageDatagramClient;
  v11 = [(HMERouterClient *)&v14 dumpStateDescription];
  v12 = [v3 stringWithFormat:@"[HMEMessageDatagramClient connection mode: %ld, connected: %d, connected server UUID: %@, connection retry timer interval: %f, dormant fetch conditions met: %d, \n\t event router client: %@]", v4, v5, v6, v9, v10, v11];

  return v12;
}

- (id)forwardingTopicsForTopics:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMEMessageDatagramClient *)self dataSource];
  v6 = [v5 client:self forwardingTopicsForTopics:v4];
  v7 = v6;
  if (!v6) {
    v6 = v4;
  }
  id v8 = v6;

  return v8;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMEMessageDatagramClient *)self dataSource];
  v6 = [v5 client:self upstreamTopicsForTopic:v4];

  return v6;
}

- (BOOL)handleChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMERouterClient *)self topicRouter];
  uint64_t v9 = [v8 allRegisteredTopicFilters];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__HMEMessageDatagramClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
  v17[3] = &unk_1E5955E68;
  v17[4] = self;
  BOOL v10 = +[HMETopicRouter forwardingTopicsForAdditions:v7 removals:v6 current:v9 indexProvider:v17];

  v11 = [(HMEMessageDatagramClient *)self pendingTopicsCombiner];
  v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 allObjects];
  objc_super v14 = [v10 objectAtIndexedSubscript:1];
  v15 = [v14 allObjects];
  [v11 combineWithAdditions:v13 removals:v15];

  -[HMEMessageDatagramClient _performNextOperation](self);
  return 1;
}

uint64_t __87__HMEMessageDatagramClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) forwardingTopicsForTopics:a2];
}

- (void)_performNextOperation
{
  if (a1)
  {
    v2 = [a1 queue];
    dispatch_assert_queue_V2(v2);

    if ([a1 hasPendingServerChangeRequest])
    {
      v3 = a1[7];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Will disconnect due to pending server change request", buf, 2u);
      }
      -[HMEMessageDatagramClient _didDisconnect](a1);
      -[HMEMessageDatagramClient _performNextOperation](a1);
    }
    id v4 = [a1 dataSource];
    char v5 = [v4 clientIsEnabled:a1];

    if (v5)
    {
      if (([a1 hasPendingRequest] & 1) == 0)
      {
        uint64_t v6 = [a1 connectionMode];
        if (v6 == 2)
        {
          if ([a1 isConnected] && (objc_msgSend(a1, "hasPendingRequest") & 1) == 0)
          {
            v15 = a1[7];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D557000, v15, OS_LOG_TYPE_DEFAULT, "Will disconnect as connection mode is not connectionless", buf, 2u);
            }
            -[HMEMessageDatagramClient _performDisconnectRequest](a1);
          }
          v16 = [a1 queue];
          dispatch_assert_queue_V2(v16);

          if ([a1 connectionMode] == 2)
          {
            v17 = [a1 dormantFetchTimer];
            if (v17)
            {
            }
            else if (([a1 isWaitingForFetchConditionsWhenDormant] & 1) == 0)
            {
              objc_initWeak(&location, a1);
              v24 = [a1 timerProvider];
              v25 = [a1 queue];
              [a1 dormatFetchTimerInterval];
              double v27 = v26;
              *(void *)buf = MEMORY[0x1E4F143A8];
              uint64_t v38 = 3221225472;
              v39 = __60__HMEMessageDatagramClient__enableDormantFetchTimerIfNeeded__block_invoke;
              v40 = &unk_1E5955F58;
              objc_copyWeak(&v41, &location);
              v28 = [v24 timerWithQueue:v25 interval:buf timerFireHandler:v27];

              v29 = a1[7];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v36 = 0;
                _os_log_impl(&dword_19D557000, v29, OS_LOG_TYPE_DEFAULT, "Starting dormant fetch timer.", v36, 2u);
              }
              [a1 setDormantFetchTimer:v28];
              v30 = [a1 dormantFetchTimer];
              [v30 resume];

              objc_destroyWeak(&v41);
              objc_destroyWeak(&location);
            }
          }
        }
        else if (v6 == 1)
        {
          char v7 = [a1 isConnected];
          id v8 = [a1 topicRouter];
          uint64_t v9 = [v8 allRegisteredTopicFilters];
          BOOL v10 = v9;
          if (v7)
          {
            uint64_t v11 = [v9 count];

            if (!v11)
            {
              -[HMEMessageDatagramClient _performDisconnectRequest](a1);
              return;
            }
            v12 = [a1 pendingTopicsCombiner];
            v13 = [v12 topicFiltersToAdd];
            if ([v13 count])
            {

LABEL_38:
              v34 = [a1 queue];
              dispatch_assert_queue_V2(v34);

              *(void *)buf = MEMORY[0x1E4F143A8];
              uint64_t v38 = 3221225472;
              v39 = __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke;
              v40 = &unk_1E5955DA0;
              id v41 = a1;
              -[HMEMessageDatagramClient _performRequestWithBlock:](a1, buf);
              return;
            }
            v31 = [a1 pendingTopicsCombiner];
            v32 = [v31 topicFiltersToRemove];
            uint64_t v33 = [v32 count];

            if (v33) {
              goto LABEL_38;
            }
            v35 = [a1 connectionRetryTimer];

            if (!v35) {
              -[HMEMessageDatagramClient _enableKeepAliveIfNeeded](a1);
            }
          }
          else
          {

            if ([v10 count])
            {
              v18 = a1[7];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D557000, v18, OS_LOG_TYPE_DEFAULT, "Will perform connect operation", buf, 2u);
              }
              v19 = [a1 pendingTopicsCombiner];
              [v19 reset];

              v20 = [a1 pendingTopicsCombiner];
              v21 = [a1 forwardingTopicsForTopics:v10];
              v22 = [v21 allObjects];
              [v20 combineWithAdditions:v22 removals:MEMORY[0x1E4F1CBF0]];

              v23 = [a1 queue];
              dispatch_assert_queue_V2(v23);

              *(void *)buf = MEMORY[0x1E4F143A8];
              uint64_t v38 = 3221225472;
              v39 = __50__HMEMessageDatagramClient__performConnectRequest__block_invoke;
              v40 = &unk_1E5955DA0;
              id v41 = a1;
              -[HMEMessageDatagramClient _performRequestWithBlock:](a1, buf);
            }
          }
        }
      }
    }
    else if ([a1 isConnected])
    {
      objc_super v14 = a1[7];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D557000, v14, OS_LOG_TYPE_DEFAULT, "Client is not enabled disconnect silently.", buf, 2u);
      }
      -[HMEMessageDatagramClient _didDisconnect](a1);
    }
  }
}

- (void)_didDisconnect
{
  v2 = [a1 queue];
  dispatch_assert_queue_V2(v2);

  [a1 setIsConnected:0];
  [a1 setHasPendingServerChangeRequest:0];
  [a1 setConnectedServerIdentifier:0];
  -[HMEMessageDatagramClient _removeKeepAliveTimer](a1);
  id v3 = [a1 delegate];
  [v3 clientDidDisconnect:a1];
}

- (void)_performDisconnectRequest
{
  v2 = [a1 queue];
  dispatch_assert_queue_V2(v2);

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke;
  v3[3] = &unk_1E5955DA0;
  v3[4] = a1;
  -[HMEMessageDatagramClient _performRequestWithBlock:](a1, v3);
}

- (void)_enableKeepAliveIfNeeded
{
  v2 = [a1 queue];
  dispatch_assert_queue_V2(v2);

  if ([a1 isConnected])
  {
    id v3 = [a1 keepAliveTimer];
    if (v3)
    {
    }
    else
    {
      id v4 = [a1 connectionRetryTimer];

      if (!v4)
      {
        objc_initWeak(&location, a1);
        char v5 = [a1 timerProvider];
        uint64_t v6 = [a1 queue];
        [a1 keepAliveInterval];
        double v8 = v7;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __52__HMEMessageDatagramClient__enableKeepAliveIfNeeded__block_invoke;
        v13[3] = &unk_1E5955F58;
        objc_copyWeak(&v14, &location);
        uint64_t v9 = [v5 timerWithQueue:v6 interval:v13 timerFireHandler:v8];

        BOOL v10 = a1[7];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_19D557000, v10, OS_LOG_TYPE_DEFAULT, "Starting keep alive timer.", v12, 2u);
        }
        [a1 setKeepAliveTimer:v9];
        uint64_t v11 = [a1 keepAliveTimer];
        [v11 resume];

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

uint64_t __60__HMEMessageDatagramClient__enableDormantFetchTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    v2 = [WeakRetained queue];
    dispatch_assert_queue_V2(v2);

    -[HMEMessageDatagramClient _removeDormantFetchTimer](v6);
    if ([v6 connectionMode] == 2)
    {
      if ([v6 dormantFetchConditionsMet])
      {
        if (([v6 hasPendingRequest] & 1) == 0) {
          -[HMEMessageDatagramClient _performSubscriptionFetchRequest](v6);
        }
      }
      else
      {
        id v4 = v6[7];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v8 = 0;
          _os_log_impl(&dword_19D557000, v4, OS_LOG_TYPE_DEFAULT, "Conditions to fetch not met will fetch later.", v8, 2u);
        }
        [v6 setIsWaitingForFetchConditionsWhenDormant:1];
      }
    }
    else
    {
      id v3 = v6[7];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19D557000, v3, OS_LOG_TYPE_ERROR, "Unexpected connection mode.", buf, 2u);
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (uint64_t)_removeDormantFetchTimer
{
  v2 = [a1 queue];
  dispatch_assert_queue_V2(v2);

  id v3 = [a1 dormantFetchTimer];
  [v3 suspend];

  return [a1 setDormantFetchTimer:0];
}

- (void)_performSubscriptionFetchRequest
{
  v2 = [a1 queue];
  dispatch_assert_queue_V2(v2);

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke;
  v3[3] = &unk_1E5955DA0;
  v3[4] = a1;
  -[HMEMessageDatagramClient _performRequestWithBlock:](a1, v3);
}

void __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = *(os_log_t **)(a1 + 32);
  uint64_t v6 = v5[7];
  if (v4)
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D557000, v6, OS_LOG_TYPE_DEFAULT, "Sending subscription fetch request", (uint8_t *)buf, 2u);
      char v5 = *(os_log_t **)(a1 + 32);
    }
    objc_initWeak(buf, v5);
    double v7 = *(void **)(a1 + 32);
    double v8 = [v7 topicRouter];
    uint64_t v9 = [v8 allRegisteredTopicFilters];
    BOOL v10 = [v9 allObjects];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke_31;
    v11[3] = &unk_1E5955E18;
    objc_copyWeak(&v13, buf);
    v12 = v3;
    [v4 client:v7 fetchWithFilters:v10 isMultiHop:0 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_19D557000, v6, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)buf, 2u);
    }
    v3[2](v3);
  }
}

- (void)_performRequestWithBlock:(void *)a1
{
  id v3 = a2;
  id v4 = [a1 queue];
  dispatch_assert_queue_V2(v4);

  [a1 setHasPendingRequest:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__HMEMessageDatagramClient__performRequestWithBlock___block_invoke;
  v5[3] = &unk_1E5955EE0;
  v5[4] = a1;
  v3[2](v3, v5);
}

uint64_t __53__HMEMessageDatagramClient__performRequestWithBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v2);

  id v3 = *(void **)(a1 + 32);
  return [v3 setHasPendingRequest:0];
}

void __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke_31(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained queue];
    dispatch_assert_queue_V2(v3);

    [v4 setIsWaitingForFetchConditionsWhenDormant:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    -[HMEMessageDatagramClient _performNextOperation](v4);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __52__HMEMessageDatagramClient__enableKeepAliveIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    v2 = [WeakRetained queue];
    dispatch_assert_queue_V2(v2);

    id v3 = v6[7];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Keep-alive timer fired.", buf, 2u);
    }
    if ([v6 isConnected] && (objc_msgSend(v6, "hasPendingRequest") & 1) == 0)
    {
      char v5 = [v6 queue];
      dispatch_assert_queue_V2(v5);

      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      uint64_t v9 = __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke;
      BOOL v10 = &unk_1E5955DA0;
      uint64_t v11 = v6;
      -[HMEMessageDatagramClient _performRequestWithBlock:](v6, buf);
    }
    else
    {
      id v4 = v6[7];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19D557000, v4, OS_LOG_TYPE_ERROR, "Remove keep-alive, conditions to perform request not met.", buf, 2u);
      }
      -[HMEMessageDatagramClient _removeKeepAliveTimer](v6);
    }
    id WeakRetained = v6;
  }
}

- (void)_removeKeepAliveTimer
{
  if (result)
  {
    v1 = result;
    v2 = [result queue];
    dispatch_assert_queue_V2(v2);

    id v3 = [v1 keepAliveTimer];
    [v3 suspend];

    return (void *)[v1 setKeepAliveTimer:0];
  }
  return result;
}

void __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = *(os_log_t **)(a1 + 32);
  uint64_t v6 = v5[7];
  if (v4)
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D557000, v6, OS_LOG_TYPE_DEFAULT, "Sending keep-alive request", (uint8_t *)buf, 2u);
      char v5 = *(os_log_t **)(a1 + 32);
    }
    objc_initWeak(buf, v5);
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke_24;
    v8[3] = &unk_1E5955DF0;
    objc_copyWeak(&v10, buf);
    uint64_t v9 = v3;
    [v4 sendKeepAliveForClient:v7 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_19D557000, v6, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)buf, 2u);
    }
    v3[2](v3);
  }
}

void __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_14;
  }
  uint64_t v6 = [WeakRetained queue];
  dispatch_assert_queue_V2(v6);

  if (v3)
  {
    uint64_t v7 = [v5 dataSource];
    int v8 = [v7 client:v5 isConnectionTerminatingError:v3];

    if (v8)
    {
      uint64_t v9 = v5[7];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v3;
        _os_log_error_impl(&dword_19D557000, v9, OS_LOG_TYPE_ERROR, "Keep alive request responded with terminating error: %@", (uint8_t *)&v13, 0xCu);
      }
      -[HMEMessageDatagramClient _didDisconnect](v5);
      -[HMEMessageDatagramClient _enableReconnectTimer](v5);
      goto LABEL_7;
    }
  }
  id v10 = v5[7];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @" with non-terminating error: ";
    v12 = &stru_1EEF095E0;
    if (v3) {
      v12 = v3;
    }
    else {
      uint64_t v11 = &stru_1EEF095E0;
    }
    int v13 = 138412546;
    id v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19D557000, v10, OS_LOG_TYPE_DEFAULT, "Keep alive request responded%@%@", (uint8_t *)&v13, 0x16u);
  }
  -[HMEMessageDatagramClient _removeKeepAliveTimer](v5);
  -[HMEMessageDatagramClient _enableKeepAliveIfNeeded](v5);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  -[HMEMessageDatagramClient _performNextOperation](v5);
LABEL_14:
}

- (void)_enableReconnectTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [a1 queue];
  dispatch_assert_queue_V2(v2);

  id v12 = [a1 dataSource];
  if ([v12 clientIsEnabled:a1])
  {
    id v3 = [a1 connectionRetryTimer];

    if (!v3)
    {
      id v4 = [a1 connectionRetryIntervalProvider];
      [v4 nextInterval];
      uint64_t v6 = v5;

      objc_initWeak(&location, a1);
      uint64_t v7 = [a1 timerProvider];
      int v8 = [a1 queue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__HMEMessageDatagramClient__enableReconnectTimer__block_invoke;
      v13[3] = &unk_1E5955E40;
      objc_copyWeak(v14, &location);
      v14[1] = v6;
      uint64_t v9 = [v7 timerWithQueue:v8 interval:v13 timerFireHandler:*(double *)&v6];

      id v10 = a1[7];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v6;
        _os_log_impl(&dword_19D557000, v10, OS_LOG_TYPE_DEFAULT, "Starting connection retry timer with interval: %f", buf, 0xCu);
      }
      [a1 setConnectionRetryTimer:v9];
      uint64_t v11 = [a1 connectionRetryTimer];
      [v11 resume];

      objc_destroyWeak(v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __49__HMEMessageDatagramClient__enableReconnectTimer__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[7];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl(&dword_19D557000, v4, OS_LOG_TYPE_DEFAULT, "Connection retry timer fired: %f", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v6 = [v3 queue];
    dispatch_assert_queue_V2(v6);

    -[HMEMessageDatagramClient _removeReconnectTimer](v3);
    if (([v3 hasPendingRequest] & 1) == 0) {
      -[HMEMessageDatagramClient _performNextOperation](v3);
    }
  }
}

- (void)_removeReconnectTimer
{
  if (result)
  {
    v1 = result;
    v2 = [result queue];
    dispatch_assert_queue_V2(v2);

    id v3 = [v1 connectionRetryTimer];
    [v3 suspend];

    return (void *)[v1 setConnectionRetryTimer:0];
  }
  return result;
}

void __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    -[HMEMessageDatagramClient _removeReconnectTimer](v5);
    uint64_t v6 = [*(id *)(a1 + 32) pendingTopicsCombiner];
    int v7 = [v6 topicFiltersToAdd];

    uint64_t v8 = [*(id *)(a1 + 32) pendingTopicsCombiner];
    uint64_t v9 = [v8 topicFiltersToRemove];

    id v10 = [*(id *)(a1 + 32) pendingTopicsCombiner];
    [v10 reset];

    uint64_t v11 = *(void **)(a1 + 32);
    id v12 = v11[7];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = v12;
      *(_DWORD *)buf = 134218240;
      uint64_t v24 = [v7 count];
      __int16 v25 = 2048;
      uint64_t v26 = [v9 count];
      _os_log_impl(&dword_19D557000, v13, OS_LOG_TYPE_DEFAULT, "Sending change registrations request with additions: %ld removals: %ld", buf, 0x16u);

      uint64_t v11 = *(void **)(a1 + 32);
      id v12 = v11[7];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = (uint64_t)v7;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v9;
      _os_log_debug_impl(&dword_19D557000, v12, OS_LOG_TYPE_DEBUG, "Sending change registrations request with additions: %@ removals: %@", buf, 0x16u);
      uint64_t v11 = *(void **)(a1 + 32);
    }
    objc_initWeak((id *)buf, v11);
    uint64_t v14 = *(void *)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke_20;
    v18[3] = &unk_1E5955DC8;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v3;
    id v15 = v7;
    id v19 = v15;
    id v16 = v9;
    id v20 = v16;
    [v4 client:v14 sendChangeRegistrationsWithAddedFilters:v15 removedFilters:v16 completion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v17 = v5[7];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D557000, v17, OS_LOG_TYPE_ERROR, "No delegate set", buf, 2u);
    }
    v3[2](v3);
  }
}

void __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  uint64_t v9 = [WeakRetained queue];
  dispatch_assert_queue_V2(v9);

  if (v6)
  {
    id v10 = [v8 pendingTopicsCombiner];
    [v10 combineOntoPreviousAdditions:*(void *)(a1 + 32) removals:*(void *)(a1 + 40)];

    uint64_t v11 = v8[7];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v25 = 138412290;
      *(void *)&v25[4] = v6;
      _os_log_error_impl(&dword_19D557000, v11, OS_LOG_TYPE_ERROR, "Unable to process change registrations error %@", v25, 0xCu);
    }
    id v12 = [v8 dataSource];
    int v13 = [v12 client:v8 isConnectionTerminatingError:v6];

    if (v13) {
      -[HMEMessageDatagramClient _didDisconnect](v8);
    }
    -[HMEMessageDatagramClient _enableReconnectTimer](v8);
    goto LABEL_8;
  }
  uint64_t v14 = v8[7];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v25 = 0;
    _os_log_impl(&dword_19D557000, v14, OS_LOG_TYPE_DEFAULT, "Successfully processed change registrations request", v25, 2u);
    uint64_t v14 = v8[7];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)__int16 v25 = 138412546;
    *(void *)&v25[4] = v23;
    *(_WORD *)&v25[12] = 2112;
    *(void *)&v25[14] = v24;
    _os_log_debug_impl(&dword_19D557000, v14, OS_LOG_TYPE_DEBUG, "Successfully processed change registrations request with additions: %@ removals: %@", v25, 0x16u);
  }
  id v15 = v5;
  id v16 = [v8 queue];
  dispatch_assert_queue_V2(v16);

  uint64_t v17 = [v8 connectionRetryIntervalProvider];
  [v17 reset];

  uint64_t v18 = v8[7];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = NSNumber;
    id v20 = v18;
    v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    *(_DWORD *)__int16 v25 = 138412290;
    *(void *)&v25[4] = v21;
    _os_log_impl(&dword_19D557000, v20, OS_LOG_TYPE_INFO, "Received cached events on change registrations %@", v25, 0xCu);
  }
  *(void *)__int16 v25 = v8;
  *(void *)&v25[8] = HMEMessageDatagramClient;
  id v22 = objc_msgSendSuper2((objc_super *)v25, sel_processReceivedCachedEvents_, v15);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  -[HMEMessageDatagramClient _performNextOperation](v8);
LABEL_16:
}

void __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    -[HMEMessageDatagramClient _removeKeepAliveTimer](v5);
    id v6 = *(void **)(a1 + 32);
    int v7 = v6[7];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D557000, v7, OS_LOG_TYPE_DEFAULT, "Sending disconnect request", (uint8_t *)buf, 2u);
      id v6 = *(void **)(a1 + 32);
    }
    objc_initWeak(buf, v6);
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke_22;
    v10[3] = &unk_1E5955DF0;
    objc_copyWeak(&v12, buf);
    uint64_t v11 = v3;
    [v4 sendDisconnectForClient:v8 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  else
  {
    uint64_t v9 = v5[7];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_19D557000, v9, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)buf, 2u);
    }
    v3[2](v3);
  }
}

void __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    dispatch_assert_queue_V2(v6);

    int v7 = v5[7];
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_error_impl(&dword_19D557000, v7, OS_LOG_TYPE_ERROR, "Did not disconnect cleanly got error %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19D557000, v7, OS_LOG_TYPE_DEFAULT, "Did disconnect", (uint8_t *)&v8, 2u);
    }
    -[HMEMessageDatagramClient _didDisconnect](v5);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    -[HMEMessageDatagramClient _performNextOperation](v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __50__HMEMessageDatagramClient__performConnectRequest__block_invoke(uint64_t a1, void *a2)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 pendingTopicsCombiner];
    int v7 = [v6 topicFiltersToAdd];

    int v8 = [*(id *)(a1 + 32) pendingTopicsCombiner];
    [v8 reset];

    -[HMEMessageDatagramClient _removeReconnectTimer](*(void **)(a1 + 32));
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[7];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_debug_impl(&dword_19D557000, v10, OS_LOG_TYPE_DEBUG, "Sending connect request with additions %@", (uint8_t *)location, 0xCu);
      id v9 = *(void **)(a1 + 32);
    }
    objc_initWeak(location, v9);
    uint64_t v11 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__HMEMessageDatagramClient__performConnectRequest__block_invoke_17;
    v15[3] = &unk_1E5955D78;
    objc_copyWeak(&v18, location);
    uint64_t v17 = v3;
    id v12 = v7;
    id v16 = v12;
    int v13 = [v4 client:v11 sendConnectWithAddedFilters:v12 completion:v15];
    [*(id *)(a1 + 32) setConnectingServerIdentifier:v13];

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v14 = v5[7];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19D557000, v14, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)location, 2u);
    }
    v3[2](v3);
  }
}

void __50__HMEMessageDatagramClient__performConnectRequest__block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v11 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  id v12 = [WeakRetained queue];
  dispatch_assert_queue_V2(v12);

  [v11 setConnectingServerIdentifier:0];
  if (!v7 || v9)
  {
    uint64_t v24 = [v11 pendingTopicsCombiner];
    [v24 combineOntoPreviousAdditions:*(void *)(a1 + 32) removals:MEMORY[0x1E4F1CBF0]];

    __int16 v25 = v11[7];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v26 = 138412546;
      *(void *)&v26[4] = v7;
      *(_WORD *)&v26[12] = 2112;
      *(void *)&v26[14] = v9;
      _os_log_error_impl(&dword_19D557000, v25, OS_LOG_TYPE_ERROR, "Unable to connect to %@ got error %@", v26, 0x16u);
    }
    -[HMEMessageDatagramClient _didDisconnect](v11);
    -[HMEMessageDatagramClient _enableReconnectTimer](v11);
    goto LABEL_12;
  }
  int v13 = v11[7];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v26 = 138412290;
    *(void *)&v26[4] = v7;
    _os_log_impl(&dword_19D557000, v13, OS_LOG_TYPE_DEFAULT, "Successfully connected with %@.", v26, 0xCu);
  }
  id v14 = v8;
  id v15 = v7;
  id v16 = [v11 queue];
  dispatch_assert_queue_V2(v16);

  [v11 setIsConnected:1];
  [v11 setConnectedServerIdentifier:v15];
  uint64_t v17 = [v11 connectionRetryIntervalProvider];
  [v17 reset];

  -[HMEMessageDatagramClient _enableKeepAliveIfNeeded](v11);
  id v18 = [v11 delegate];
  [v18 clientDidConnect:v11 serverIdentifier:v15];

  id v19 = v11[7];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = NSNumber;
    v21 = v19;
    id v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    *(_DWORD *)uint64_t v26 = 138412290;
    *(void *)&v26[4] = v22;
    _os_log_impl(&dword_19D557000, v21, OS_LOG_TYPE_INFO, "Received cached events on connect %@", v26, 0xCu);
  }
  *(void *)uint64_t v26 = v11;
  *(void *)&v26[8] = HMEMessageDatagramClient;
  id v23 = objc_msgSendSuper2((objc_super *)v26, sel_processReceivedCachedEvents_, v14);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  -[HMEMessageDatagramClient _performNextOperation](v11);
LABEL_13:
}

- (void)resetReconnectTimerToInitialState
{
  id v3 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v3);

  -[HMEMessageDatagramClient _removeReconnectionTimerAndResetInterval](self);
  if (![(HMEMessageDatagramClient *)self hasPendingRequest])
  {
    -[HMEMessageDatagramClient _performNextOperation](self);
  }
}

- (void)_removeReconnectionTimerAndResetInterval
{
  if (a1)
  {
    v2 = [a1 queue];
    dispatch_assert_queue_V2(v2);

    id v3 = [a1 connectionRetryTimer];

    if (v3)
    {
      id v4 = a1[7];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_19D557000, v4, OS_LOG_TYPE_DEFAULT, "Removing reconnection timer", v6, 2u);
      }
      -[HMEMessageDatagramClient _removeReconnectTimer](a1);
    }
    id v5 = [a1 connectionRetryIntervalProvider];
    [v5 reset];
  }
}

- (void)updateDormantFetchCondition:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(HMERouterClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMEMessageDatagramClient_updateDormantFetchCondition_completion___block_invoke;
  block[3] = &unk_1E5955D50;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __67__HMEMessageDatagramClient_updateDormantFetchCondition_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if ((v2 == 1) != [*(id *)(a1 + 32) dormantFetchConditionsMet])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v3[7];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSNumber;
      id v6 = v4;
      id v7 = [v5 numberWithBool:v2 == 1];
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_19D557000, v6, OS_LOG_TYPE_DEFAULT, "Updating fetch allowed to %{public}@", (uint8_t *)&v11, 0xCu);

      id v3 = *(void **)(a1 + 32);
    }
    [v3 setDormantFetchConditionsMet:v2 == 1];
    id v8 = *(void **)(a1 + 32);
    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) queue];
      dispatch_assert_queue_V2(v9);

      if ([v8 connectionMode] == 2
        && [v8 isWaitingForFetchConditionsWhenDormant]
        && ([v8 hasPendingRequest] & 1) == 0)
      {
        -[HMEMessageDatagramClient _performSubscriptionFetchRequest](v8);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateConnectionMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(HMERouterClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HMEMessageDatagramClient_updateConnectionMode_completion___block_invoke;
  block[3] = &unk_1E5955D50;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __60__HMEMessageDatagramClient_updateConnectionMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) connectionMode];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2 != v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = v4[7];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"Unknown mode";
      if (v3 == 2) {
        id v6 = @"connectionless";
      }
      if (v3 == 1) {
        id v6 = @"keep-alive";
      }
      id v7 = v6;
      *(_DWORD *)id v15 = 138412290;
      *(void *)&void v15[4] = v7;
      id v8 = v5;
      _os_log_impl(&dword_19D557000, v8, OS_LOG_TYPE_DEFAULT, "Updated connection mode to %@", v15, 0xCu);

      uint64_t v3 = *(void *)(a1 + 48);
      id v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "setConnectionMode:", v3, *(_OWORD *)v15);
    uint64_t v9 = [*(id *)(a1 + 32) connectionMode];
    if (v9 == 2)
    {
      id v10 = *(void **)(a1 + 32);
      if (v10)
      {
        id v12 = [*(id *)(a1 + 32) queue];
        dispatch_assert_queue_V2(v12);

        uint64_t v13 = [v10 queue];
        dispatch_assert_queue_V2(v13);

        if ([v10 connectionMode] == 2)
        {
          if ([v10 isConnected]) {
            goto LABEL_12;
          }
        }
      }
    }
    else if (v9 == 1)
    {
      id v10 = *(void **)(a1 + 32);
      if (v10)
      {
        int64_t v11 = [*(id *)(a1 + 32) queue];
        dispatch_assert_queue_V2(v11);

        [v10 setIsWaitingForFetchConditionsWhenDormant:0];
        -[HMEMessageDatagramClient _removeDormantFetchTimer](v10);
LABEL_12:
        -[HMEMessageDatagramClient _performNextOperation](v10);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)connectionCapabilityDidChange
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Connection capability changed.", v4, 2u);
  }
  -[HMEMessageDatagramClient _performNextOperation](self);
}

- (void)serverDidChangeWithServerIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
  char v7 = [v6 isEqual:v4];

  if ((v7 & 1) == 0)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Server identifier changed and removing reconnection timer", (uint8_t *)&v16, 2u);
    }
    -[HMEMessageDatagramClient _removeReconnectionTimerAndResetInterval](self);
  }
  uint64_t v9 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];

  if (v9)
  {
    id v10 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
    char v11 = [v10 isEqual:v4];

    if (v11) {
      goto LABEL_14;
    }
    id v12 = self->_logger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v12;
      id v14 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl(&dword_19D557000, v13, OS_LOG_TYPE_DEFAULT, "Server identifier changed to %@. Currently connected to %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if ([(HMEMessageDatagramClient *)self hasPendingServerChangeRequest]) {
      goto LABEL_14;
    }
    id v15 = self->_logger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_19D557000, v15, OS_LOG_TYPE_DEFAULT, "Server identifier changed to %@. Currently disconnected.", (uint8_t *)&v16, 0xCu);
    }
  }
  [(HMEMessageDatagramClient *)self setHasPendingServerChangeRequest:1];
  if (![(HMEMessageDatagramClient *)self hasPendingRequest]) {
    -[HMEMessageDatagramClient _performNextOperation](self);
  }
LABEL_14:
}

- (id)didReceiveFetchResponseWithCachedEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v5);

  v8.receiver = self;
  v8.super_class = (Class)HMEMessageDatagramClient;
  id v6 = [(HMERouterClient *)&v8 processReceivedCachedEvents:v4];

  return v6;
}

- (void)didReceiveMessageWithCachedEvents:(id)a3 serverIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  char v11 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
  if (v12)
  {
  }
  else
  {
    uint64_t v13 = [(HMEMessageDatagramClient *)self connectingServerIdentifier];

    if (!v13)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Did not expect cached events when not connected.", buf, 2u);
      }
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = 2;
      goto LABEL_26;
    }
  }
  id v14 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
  if (![v14 isEqual:v9])
  {
    id v15 = [(HMEMessageDatagramClient *)self connectingServerIdentifier];
    char v16 = [v15 isEqual:v9];

    if (v16) {
      goto LABEL_7;
    }
    uint64_t v33 = self->_logger;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v37 = v33;
      uint64_t v38 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
      *(_DWORD *)buf = 138412546;
      id v47 = v9;
      __int16 v48 = 2112;
      v49 = v38;
      _os_log_error_impl(&dword_19D557000, v37, OS_LOG_TYPE_ERROR, "Cached event's from server %@ not from expected server %@.", buf, 0x16u);
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = 3;
LABEL_26:
    uint64_t v32 = [v34 errorWithDomain:@"HMEErrorDomain" code:v35 userInfo:0];
    id v21 = (id)v32;
    goto LABEL_27;
  }

LABEL_7:
  id v17 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
  id v39 = v9;
  if (v17)
  {
  }
  else
  {
    __int16 v18 = [(HMEMessageDatagramClient *)self connectingServerIdentifier];
    int v19 = [v18 isEqual:v9];

    if (v19)
    {
      uint64_t v20 = self->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D557000, v20, OS_LOG_TYPE_DEFAULT, "Accepting cached events from pending connection.", buf, 2u);
      }
    }
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v22 = v8;
  id v23 = v8;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v29 = [v28 event];
        v30 = [v28 topic];
        [v21 setObject:v29 forKeyedSubscript:v30];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v25);
  }

  v40.receiver = self;
  v40.super_class = (Class)HMEMessageDatagramClient;
  id v31 = [(HMERouterClient *)&v40 processReceivedCachedEvents:v21];
  uint64_t v32 = 0;
  id v8 = v22;
  id v9 = v39;
LABEL_27:
  v10[2](v10, v32);
}

- (void)didReceiveMessageWithEvents:(id)a3 serverIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  char v11 = [(HMERouterClient *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];

  if (!v12)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Did not expect events when not connected.", buf, 2u);
    }
    char v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 2;
    goto LABEL_10;
  }
  uint64_t v13 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
  char v14 = [v13 isEqual:v9];

  if ((v14 & 1) == 0)
  {
    __int16 v18 = self->_logger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v18;
      id v21 = [(HMEMessageDatagramClient *)self connectedServerIdentifier];
      *(_DWORD *)buf = 138412546;
      id v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      _os_log_error_impl(&dword_19D557000, v20, OS_LOG_TYPE_ERROR, "Event's from server %@ not from expected server %@.", buf, 0x16u);
    }
    char v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 3;
LABEL_10:
    int v19 = [v16 errorWithDomain:@"HMEErrorDomain" code:v17 userInfo:0];
    v10[2](v10, v19);

    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMEMessageDatagramClient;
  [(HMERouterClient *)&v22 processReceivedEvents:v8];
  v10[2](v10, 0);
LABEL_11:
}

- (HMEMessageDatagramClient)initWithQueue:(id)a3 timerProvider:(id)a4 keepAliveInterval:(double)a5 dormantFetchTimerInterval:(double)a6 retryIntervalProvider:(id)a7 storeReadHandle:(id)a8 storeWriteHandle:(id)a9 logCategory:(const char *)a10
{
  id v30 = a4;
  id v29 = a7;
  id v19 = a9;
  id v20 = a8;
  id v21 = a3;
  objc_super v22 = (OS_os_log *)os_log_create("com.apple.HomeKitEventRouter", a10);
  logger = self->_logger;
  self->_logger = v22;

  id v24 = v22;
  v31.receiver = self;
  v31.super_class = (Class)HMEMessageDatagramClient;
  __int16 v25 = [(HMERouterClient *)&v31 initWithQueue:v21 storeReadHandle:v20 storeWriteHandle:v19 logger:v24];

  if (v25)
  {
    objc_storeStrong((id *)&v25->_logger, v22);
    uint64_t v26 = objc_alloc_init(HMEPendingTopicsCombiner);
    pendingTopicsCombiner = v25->_pendingTopicsCombiner;
    v25->_pendingTopicsCombiner = v26;

    objc_storeStrong((id *)&v25->_timerProvider, a4);
    v25->_keepAliveInterval = a5;
    v25->_dormatFetchTimerInterval = a6;
    objc_storeStrong((id *)&v25->_connectionRetryIntervalProvider, a7);
    v25->_isConnected = 0;
    v25->_hasPendingRequest = 0;
    v25->_connectionMode = 1;
    v25->_isWaitingForFetchConditionsWhenDormant = 0;
    v25->_dormantFetchConditionsMet = 0;
  }

  return v25;
}

- (HMEMessageDatagramClient)initWithQueue:(id)a3 timerProvider:(id)a4 keepAliveInterval:(double)a5 dormantFetchTimerInterval:(double)a6 retryIntervalProvider:(id)a7
{
  return [(HMEMessageDatagramClient *)self initWithQueue:a3 timerProvider:a4 keepAliveInterval:a7 dormantFetchTimerInterval:0 retryIntervalProvider:0 storeReadHandle:"MessageDatagramClient" storeWriteHandle:a5 logCategory:a6];
}

@end