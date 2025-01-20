@interface ASDaemonWakeCoordinator
- (ASDaemonWakeCoordinator)initWithProfile:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)dealloc;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
@end

@implementation ASDaemonWakeCoordinator

- (ASDaemonWakeCoordinator)initWithProfile:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ASDaemonWakeCoordinator;
  v5 = [(ASDaemonWakeCoordinator *)&v27 init];
  if (v5)
  {
    v6 = objc_alloc_init(ASXPCClient);
    xpcClient = v5->_xpcClient;
    v5->_xpcClient = v6;

    id v8 = objc_alloc(MEMORY[0x263F280F0]);
    uint64_t v9 = *MEMORY[0x263F280D0];
    uint64_t v10 = *MEMORY[0x263F23D88];
    v11 = dispatch_get_global_queue(0, 0);
    uint64_t v12 = [v8 initWithEnvironmentName:v9 namedDelegatePort:v10 queue:v11];
    apsConnection = v5->_apsConnection;
    v5->_apsConnection = (APSConnection *)v12;

    [(APSConnection *)v5->_apsConnection setDelegate:v5];
    v14 = v5->_apsConnection;
    ASLoggingInitialize();
    v15 = *MEMORY[0x263F23AC0];
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = v5->_apsConnection;
        *(_DWORD *)buf = 134217984;
        v30 = v17;
        _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator created APS connection %p", buf, 0xCu);
      }
      v18 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.Fitness"];
      v28 = v18;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
      [(APSConnection *)v5->_apsConnection _setEnabledTopics:v19];
    }
    else if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator couldn't create APS push connection", buf, 2u);
    }
    v20 = [v4 daemon];
    v21 = [v20 behavior];
    int v22 = [v21 isAppleWatch];

    if (v22)
    {
      v23 = [v4 currentActivitySummaryHelper];
      [v23 addObserver:v5];

      v24 = [v4 dataManager];
      v25 = [MEMORY[0x263F0A598] workoutType];
      [v24 addObserver:v5 forDataType:v25];
    }
  }

  return v5;
}

- (void)dealloc
{
  [(ASXPCClient *)self->_xpcClient invalidate];
  [(APSConnection *)self->_apsConnection _setEnabledTopics:0];
  apsConnection = self->_apsConnection;
  self->_apsConnection = 0;

  id v4 = [(HDProfile *)self->_profile daemon];
  v5 = [v4 behavior];
  int v6 = [v5 isAppleWatch];

  if (v6)
  {
    v7 = [(HDProfile *)self->_profile currentActivitySummaryHelper];
    [v7 removeObserver:self];

    id v8 = [(HDProfile *)self->_profile dataManager];
    uint64_t v9 = [MEMORY[0x263F0A598] workoutType];
    [v8 removeObserver:self forDataType:v9];
  }
  v10.receiver = self;
  v10.super_class = (Class)ASDaemonWakeCoordinator;
  [(ASDaemonWakeCoordinator *)&v10 dealloc];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  ASLoggingInitialize();
  v7 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    id v11 = v5;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator received public token \"%@\" on connection %p", (uint8_t *)&v8, 0x16u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  ASLoggingInitialize();
  v13 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2048;
    id v21 = v9;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator received per-topic push token \"%@\" for topic \"%{public}@\" identifier \"%@\" on connection %p", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 userInfo];
  v7 = [MEMORY[0x263EFD760] notificationFromRemoteNotificationDictionary:v6];
  ASLoggingInitialize();
  int v8 = (void *)*MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v5 topic];
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    int v14 = v7;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator APS push received: %@ %@", (uint8_t *)&v11, 0x16u);
  }
  [(ASXPCClient *)self->_xpcClient launch];
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7 = a3;
  int v8 = (HKActivitySummary *)a4;
  lastTodayActivitySummary = self->_lastTodayActivitySummary;
  if (lastTodayActivitySummary && !ASAllGoalsMetForSummary(lastTodayActivitySummary) && ASAllGoalsMetForSummary(v8))
  {
    ASLoggingInitialize();
    id v10 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator all goals completed for today", v12, 2u);
    }
    [(ASXPCClient *)self->_xpcClient launch];
  }
  int v11 = self->_lastTodayActivitySummary;
  self->_lastTodayActivitySummary = v8;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7 = a3;
  int v8 = (HKActivitySummary *)a4;
  lastYesterdayActivitySummary = self->_lastYesterdayActivitySummary;
  if (lastYesterdayActivitySummary
    && !ASAllGoalsMetForSummary(lastYesterdayActivitySummary)
    && ASAllGoalsMetForSummary(v8))
  {
    ASLoggingInitialize();
    id v10 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator all goals completed for yesterday", v12, 2u);
    }
    [(ASXPCClient *)self->_xpcClient launch];
  }
  int v11 = self->_lastYesterdayActivitySummary;
  self->_lastYesterdayActivitySummary = v8;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  if (objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_6, a4))
  {
    ASLoggingInitialize();
    id v5 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ASDaemonWakeCoordinator received workout sample", v6, 2u);
    }
    [(ASXPCClient *)self->_xpcClient launch];
  }
}

uint64_t __47__ASDaemonWakeCoordinator_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 sampleType];
  v3 = [MEMORY[0x263F0A598] workoutType];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastYesterdayActivitySummary, 0);
  objc_storeStrong((id *)&self->_lastTodayActivitySummary, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end