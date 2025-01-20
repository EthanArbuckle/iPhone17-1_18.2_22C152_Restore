@interface ASFriendListQueryServer
+ (Class)queryClass;
- (ASActivitySharingManager)activitySharingManager;
- (ASFriendListQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)_shouldListenForUpdates;
- (int64_t)managerStartAction;
- (void)_activitySharingManagerProcessingStarted;
- (void)_queue_activitySharingManagerProcessingStarted;
- (void)_queue_start;
- (void)_queue_stop;
- (void)friendListDidUpdate:(id)a3;
- (void)setActivitySharingManager:(id)a3;
- (void)setManagerStartAction:(int64_t)a3;
@end

@implementation ASFriendListQueryServer

- (ASFriendListQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASFriendListQueryServer;
  v11 = [(HDQueryServer *)&v20 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (!v11) {
    goto LABEL_4;
  }
  v12 = [v10 profile];
  v13 = [v12 profileExtensionsConformingToProtocol:&unk_26FBBC218];

  if ([v13 count])
  {
    v14 = [v13 firstObject];
    v15 = [v14 activitySharingManager];
    [(ASFriendListQueryServer *)v11 setActivitySharingManager:v15];

    [(ASFriendListQueryServer *)v11 setManagerStartAction:0];
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v11 selector:sel__activitySharingManagerProcessingStarted name:@"ActivitySharingMangerProcessingStartedNotification" object:0];

LABEL_4:
    v17 = v11;
    goto LABEL_8;
  }
  ASLoggingInitialize();
  v18 = *MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_ERROR)) {
    -[ASFriendListQueryServer initWithUUID:configuration:client:delegate:](v18);
  }

  v17 = 0;
LABEL_8:

  return v17;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  v9.receiver = self;
  v9.super_class = (Class)ASFriendListQueryServer;
  [(HDQueryServer *)&v9 _queue_start];
  v3 = [(ASFriendListQueryServer *)self activitySharingManager];
  int v4 = [v3 processingStarted];

  ASLoggingInitialize();
  v5 = *MEMORY[0x263F23AC8];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ASFriendListQueryServer: Starting.", v8, 2u);
    }
    [(ASFriendListQueryServer *)self setManagerStartAction:0];
    v7 = [(ASFriendListQueryServer *)self activitySharingManager];
    [v7 addFriendListObserver:self];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ASFriendListQueryServer: Waiting for processing to start for add", v8, 2u);
    }
    [(ASFriendListQueryServer *)self setManagerStartAction:1];
  }
}

- (void)_queue_stop
{
  v9.receiver = self;
  v9.super_class = (Class)ASFriendListQueryServer;
  [(HDQueryServer *)&v9 _queue_stop];
  v3 = [(ASFriendListQueryServer *)self activitySharingManager];
  int v4 = [v3 processingStarted];

  ASLoggingInitialize();
  v5 = *MEMORY[0x263F23AC8];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ASFriendListQueryServer: Stopping.", v8, 2u);
    }
    v7 = [(ASFriendListQueryServer *)self activitySharingManager];
    [v7 removeFriendListObserver:self];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "ASFriendListQueryServer: Waiting for processing to start for remove", v8, 2u);
    }
    [(ASFriendListQueryServer *)self setManagerStartAction:2];
  }
}

- (BOOL)_shouldListenForUpdates
{
  return 0;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)friendListDidUpdate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HDQueryServer *)self clientProxy];
  BOOL v6 = ASCodableFriendListFromFriends();
  ASLoggingInitialize();
  v7 = (void *)*MEMORY[0x263F23AC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    int v11 = 134217984;
    uint64_t v12 = [v4 count];
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "ASFriendListQueryServer calling deliverFriendList with %lu friends", (uint8_t *)&v11, 0xCu);
  }
  objc_super v9 = [v6 data];
  id v10 = [(HDQueryServer *)self queryUUID];
  objc_msgSend(v5, "client_deliverFriendList:queryUUID:", v9, v10);
}

- (void)_activitySharingManagerProcessingStarted
{
  ASLoggingInitialize();
  v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ASFriendListQueryServer: Manager processing started", buf, 2u);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__ASFriendListQueryServer__activitySharingManagerProcessingStarted__block_invoke;
  v4[3] = &unk_2652157F0;
  v4[4] = self;
  [(HDQueryServer *)self onQueue:v4];
}

uint64_t __67__ASFriendListQueryServer__activitySharingManagerProcessingStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_activitySharingManagerProcessingStarted");
}

- (void)_queue_activitySharingManagerProcessingStarted
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "ASFriendListQueryServer: Activity sharing manager posted it started, but is not reporting it's started", v1, 2u);
}

- (ASActivitySharingManager)activitySharingManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingManager);
  return (ASActivitySharingManager *)WeakRetained;
}

- (void)setActivitySharingManager:(id)a3
{
}

- (int64_t)managerStartAction
{
  return self->_managerStartAction;
}

- (void)setManagerStartAction:(int64_t)a3
{
  self->_managerStartAction = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithUUID:(os_log_t)log configuration:client:delegate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "ASFriendListQueryServer: Failed to find ASActivitySharingManagerProvider.", v1, 2u);
}

@end