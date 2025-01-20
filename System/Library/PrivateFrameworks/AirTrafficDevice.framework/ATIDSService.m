@interface ATIDSService
+ (int64_t)openSocketPriorityFromATPendingChangePriority:(int)a3;
- (ATIDSService)initWithServiceName:(id)a3;
- (BOOL)hasPairedDevice;
- (BOOL)start;
- (id)_messageTypeToString:(int)a3;
- (id)deviceForId:(id)a3;
- (id)pairedDevice;
- (void)_cancelPendingConnectionRequests;
- (void)_connect;
- (void)_handleReconnectEvent:(id)a3;
- (void)_initiateReconnectIfNeeded;
- (void)_scheduleConnectWithPriority:(int64_t)a3;
- (void)_scheduleReconnect;
- (void)_sendWakeup;
- (void)addListener:(id)a3;
- (void)removeListener:(id)a3;
- (void)requestConnectionToPairedDeviceWithPriority:(int64_t)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setPreferWifi:(BOOL)a3;
- (void)socket:(id)a3 hasDataAvailable:(const char *)a4 length:(int64_t)a5;
- (void)socketDidClose:(id)a3;
- (void)stop;
@end

@implementation ATIDSService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_cancelPendingConnectionRequests
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connectionInfo)
  {
    v3 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(ATIDSConnectionInfo *)self->_connectionInfo device];
      v5 = [v4 uniqueID];
      int v10 = 138543618;
      v11 = self;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling pending connection request to %{public}@", (uint8_t *)&v10, 0x16u);
    }
    v6 = [(ATIDSConnectionInfo *)self->_connectionInfo socket];
    v7 = v6;
    if (v6)
    {
      [v6 removeDelegate:self];
      if ([v7 isOpen]) {
        [v7 close];
      }
    }
    connectionInfo = self->_connectionInfo;
    self->_connectionInfo = 0;

    v9 = [MEMORY[0x1E4F478B8] sharedInstance];
    [v9 removeEvent:@"com.apple.atc.ATIDSService.reconnect"];
  }
}

- (void)_sendWakeup
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo && ![(ATIDSConnectionInfo *)connectionInfo connectionState])
  {
    [(ATIDSConnectionInfo *)self->_connectionInfo setConnectionState:1];
    v4 = [(ATIDSConnectionInfo *)self->_connectionInfo device];
    v5 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v4 uniqueID];
      *(_DWORD *)buf = 138543618;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sending wakeup to device %{public}@", buf, 0x16u);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F6AB78]);
    v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"wakeup" length:6];
    v9 = (void *)[v7 initWithProtobufData:v8 type:0 isResponse:0];

    int v10 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6A878]];
    uint64_t v11 = *MEMORY[0x1E4F6AA28];
    v22[0] = *MEMORY[0x1E4F6AA10];
    v22[1] = v11;
    v23[0] = &unk_1F33DCA40;
    v23[1] = MEMORY[0x1E4F1CC38];
    v22[2] = *MEMORY[0x1E4F6A9B0];
    v23[2] = MEMORY[0x1E4F1CC38];
    __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    v13 = self->_connectionInfo;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[ATIDSConnectionInfo setWakeupTimestamp:](v13, "setWakeupTimestamp:");
    ATReportEventIncrementingScalarKey();
    service = self->_service;
    id v20 = 0;
    id v21 = 0;
    char v15 = [(IDSService *)service sendProtobuf:v9 toDestinations:v10 priority:100 options:v12 identifier:&v21 error:&v20];
    id v16 = v21;
    id v17 = v20;
    v18 = _ATLogCategoryFramework();
    v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v25 = self;
        __int16 v26 = 2114;
        id v27 = v16;
        _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ wakeup message sent. id=%{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = self;
        __int16 v26 = 2114;
        id v27 = v17;
        _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_ERROR, "%{public}@ failed to send wakeup message. err=%{public}@", buf, 0x16u);
      }

      ATReportEventIncrementingScalarKey();
      [(ATIDSConnectionInfo *)self->_connectionInfo setFailureCount:[(ATIDSConnectionInfo *)self->_connectionInfo failureCount] + 1];
      [(ATIDSService *)self _scheduleReconnect];
    }
  }
}

- (void)_connect
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo && [(ATIDSConnectionInfo *)connectionInfo connectionState] <= 1)
  {
    v4 = [(ATIDSConnectionInfo *)self->_connectionInfo device];
    [(ATIDSConnectionInfo *)self->_connectionInfo setConnectionState:2];
    v5 = [(ATIDSConnectionInfo *)self->_connectionInfo socket];
    v6 = v5;
    if (v5)
    {
      [v5 removeDelegate:self];
      if ([v6 isOpen]) {
        [v6 close];
      }
      [(ATIDSConnectionInfo *)self->_connectionInfo setSocket:0];
    }
    id v7 = [[ATIDSSocket alloc] initWithDevice:v4 service:self priority:[(ATIDSConnectionInfo *)self->_connectionInfo priority]];
    [(ATSocket *)v7 addDelegate:self];
    [(ATIDSConnectionInfo *)self->_connectionInfo setSocket:v7];
    v8 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 uniqueID];
      *(_DWORD *)buf = 138543874;
      char v15 = self;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to connect to %{public}@ using socket %{public}@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __24__ATIDSService__connect__block_invoke;
    v11[3] = &unk_1E6B87958;
    objc_copyWeak(&v13, (id *)buf);
    v11[4] = self;
    id v10 = v4;
    id v12 = v10;
    [(ATIDSSocket *)v7 connectWithCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __24__ATIDSService__connect__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __24__ATIDSService__connect__block_invoke_2;
    v7[3] = &unk_1E6B88308;
    v7[4] = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    id v10 = WeakRetained;
    dispatch_async(v6, v7);
  }
}

void __24__ATIDSService__connect__block_invoke_2(id *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*((id *)a1[4] + 4) socket];
  id v3 = a1[5];
  v4 = _ATLogCategoryFramework();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = a1[4];
      id v7 = [a1[6] uniqueID];
      id v8 = a1[7];
      if (v2) {
        id v9 = v2;
      }
      else {
        id v9 = @"nil";
      }
      id v10 = objc_msgSend(a1[5], "msv_description");
      *(_DWORD *)__int16 v18 = 138544386;
      *(void *)&v18[4] = v6;
      __int16 v19 = 2114;
      uint64_t v20 = (uint64_t)v7;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      v24 = v9;
      __int16 v25 = 2114;
      __int16 v26 = v10;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ connection to %{public}@ completed for socket %{public}@. connectionSocket=%{public}@ error=%{public}@", v18, 0x34u);

LABEL_11:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = a1[4];
    uint64_t v12 = [a1[6] uniqueID];
    id v7 = (void *)v12;
    id v13 = a1[7];
    uint64_t v14 = @"nil";
    *(_DWORD *)__int16 v18 = 138544130;
    if (v2) {
      uint64_t v14 = v2;
    }
    *(void *)&v18[4] = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    id v22 = v13;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ connection to %{public}@ completed for socket %{public}@. connectionSocket=%{public}@", v18, 0x2Au);
    goto LABEL_11;
  }

  char v15 = a1[4];
  if (!a1[5] && v15[4] && v2 == a1[7])
  {
    __int16 v16 = [[ATDeviceMessageLink alloc] initWithSocket:v2];
    id v17 = [a1[4] delegate];
    [v17 listener:a1[4] didReceiveMessageLinkRequest:v16];
  }
  else
  {
    objc_msgSend(a1[7], "removeDelegate:", v15, *(void *)v18);
    if ([a1[7] isOpen]) {
      [a1[7] close];
    }
    if (v2 == a1[7])
    {
      [*((id *)a1[4] + 4) setSocket:0];
      objc_msgSend(*((id *)a1[4] + 4), "setFailureCount:", objc_msgSend(*((id *)a1[4] + 4), "failureCount") + 1);
      [a1[4] _scheduleReconnect];
    }
  }
}

- (void)_initiateReconnectIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo && [(ATIDSConnectionInfo *)connectionInfo connectionState] <= 2)
  {
    v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(ATIDSConnectionInfo *)self->_connectionInfo device];
      id v6 = [v5 uniqueID];
      int v10 = 138543618;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Initiating reconnect to %{public}@", (uint8_t *)&v10, 0x16u);
    }
    [(ATIDSService *)self _sendWakeup];
  }
  else
  {
    id v7 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(ATIDSConnectionInfo *)self->_connectionInfo device];
      id v9 = [v8 uniqueID];
      int v10 = 138543618;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Not initiating reconnect to %{public}@ because we are already connected", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_scheduleReconnect
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo)
  {
    [(ATIDSConnectionInfo *)connectionInfo setConnectionState:0];
    unsigned int v4 = 60 * (([(ATIDSConnectionInfo *)self->_connectionInfo failureCount] + 1) >> 1);
    if (v4 >= 0x12C) {
      uint64_t v5 = 300;
    }
    else {
      uint64_t v5 = v4;
    }
    if (v5)
    {
      id v6 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(ATIDSConnectionInfo *)self->_connectionInfo device];
        id v8 = [v7 uniqueID];
        unsigned int v9 = [(ATIDSConnectionInfo *)self->_connectionInfo failureCount];
        int v13 = 138544130;
        uint64_t v14 = self;
        __int16 v15 = 2114;
        __int16 v16 = v8;
        __int16 v17 = 2048;
        uint64_t v18 = v5;
        __int16 v19 = 1024;
        unsigned int v20 = v9;
        _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling reconnect to %{public}@ in %llu seconds. failureCount=%d", (uint8_t *)&v13, 0x26u);
      }
      int v10 = [MEMORY[0x1E4F478B8] sharedInstance];
      [v10 scheduleEvent:@"com.apple.atc.ATIDSService.reconnect" afterDelay:0 withUserData:(double)v5];
    }
    else
    {
      __int16 v12 = [MEMORY[0x1E4F478B8] sharedInstance];
      [v12 removeEvent:@"com.apple.atc.ATIDSService.reconnect"];

      [(ATIDSService *)self _initiateReconnectIfNeeded];
    }
  }
  else
  {
    id v11 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      uint64_t v14 = self;
      _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Not attempting to reconnect as connectionInfo is nil", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_scheduleConnectWithPriority:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_running)
  {
    uint64_t v5 = [(ATIDSService *)self pairedDevice];
    if (v5)
    {
      connectionInfo = self->_connectionInfo;
      if (!connectionInfo
        || [(ATIDSConnectionInfo *)connectionInfo connectionState] <= 2
        && [(ATIDSConnectionInfo *)self->_connectionInfo priority] < a3)
      {
        id v7 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [v5 uniqueID];
          int v11 = 138543874;
          __int16 v12 = self;
          __int16 v13 = 1024;
          int v14 = a3;
          __int16 v15 = 2114;
          __int16 v16 = v8;
          _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting new IDS connection with priority %d to device %{public}@", (uint8_t *)&v11, 0x1Cu);
        }
        [(ATIDSService *)self _cancelPendingConnectionRequests];
        unsigned int v9 = objc_alloc_init(ATIDSConnectionInfo);
        [(ATIDSConnectionInfo *)v9 setDevice:v5];
        [(ATIDSConnectionInfo *)v9 setPriority:a3];
        int v10 = self->_connectionInfo;
        self->_connectionInfo = v9;

        [(ATIDSService *)self _scheduleReconnect];
      }
    }
  }
  else
  {
    uint64_t v5 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      __int16 v12 = self;
      __int16 v13 = 1024;
      int v14 = a3;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Not requesting connection to IDS with priority %d as the service is not started", (uint8_t *)&v11, 0x12u);
    }
  }
}

- (id)_messageTypeToString:(int)a3
{
  if (a3) {
    return @"unknown";
  }
  else {
    return @"wakeup";
  }
}

- (void)_handleReconnectEvent:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ATIDSService__handleReconnectEvent___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__ATIDSService__handleReconnectEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initiateReconnectIfNeeded];
}

- (void)socket:(id)a3 hasDataAvailable:(const char *)a4 length:(int64_t)a5
{
  id v6 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ATIDSService_socket_hasDataAvailable_length___block_invoke;
  v9[3] = &unk_1E6B88B68;
  id v10 = v6;
  int v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

void __47__ATIDSService_socket_hasDataAvailable_length___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 32);
  if (v3 && ([v3 socket], id v4 = (id)objc_claimAutoreleasedReturnValue(), v4, v4 == v2))
  {
    [*(id *)(*(void *)(a1 + 40) + 32) setConnectionState:4];
    [*(id *)(*(void *)(a1 + 40) + 32) setFailureCount:0];
  }
  else
  {
    uint64_t v5 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ ignoring socket hasDataAvailable notification for %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)socketDidClose:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 description];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ATIDSService_socketDidClose___block_invoke;
  block[3] = &unk_1E6B88BB8;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

void __31__ATIDSService_socketDidClose___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2
    && (id v3 = *(void **)(a1 + 40),
        [v2 socket],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3 == v4))
  {
    id v8 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ socket %{public}@ was closed", (uint8_t *)&v16, 0x16u);
    }

    [*(id *)(a1 + 40) removeDelegate:*(void *)(a1 + 32)];
    if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) connectionState] > 3)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      __int16 v15 = *(void **)(v14 + 32);
      *(void *)(v14 + 32) = 0;
    }
    else
    {
      id v11 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        int v16 = 138543618;
        uint64_t v17 = v12;
        __int16 v18 = 2114;
        uint64_t v19 = v13;
        _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ socket %{public}@ was closed before any data was received - treating as connection failure", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setFailureCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "failureCount") + 1);
      [*(id *)(*(void *)(a1 + 32) + 32) setSocket:0];
      [*(id *)(a1 + 32) _scheduleReconnect];
    }
    [*(id *)(a1 + 32) setPreferWifi:0];
  }
  else
  {
    uint64_t v5 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 48);
      int v16 = 138543618;
      uint64_t v17 = v6;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ ignoring socket closed notification for %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ ids message delivered. id=%{public}@", buf, 0x16u);
  }

  [(ATIDSConnectionInfo *)self->_connectionInfo wakeupTimestamp];
  if (v9 != 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    [(ATIDSConnectionInfo *)self->_connectionInfo wakeupTimestamp];
    ATReportEventAddDoubleToScalarKey();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

unint64_t __71__ATIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  if (v2[4])
  {
    unint64_t result = [v2[4] connectionState];
    if (result > 1) {
      return result;
    }
    id v2 = *(id **)(a1 + 32);
  }

  return [v2 _connect];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v9 = a5;
  id v10 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ATIDSService_service_account_identifier_didSendWithSuccess_error___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v15 = v10;
  uint64_t v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, block);
}

void __68__ATIDSService_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _ATLogCategoryFramework();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138543874;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to send ids message. id=%{public}@, error=%{public}@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "setFailureCount:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "failureCount") + 1);
    [*(id *)(a1 + 32) code];
    ATReportEventIncrementingScalarKey();
    [*(id *)(a1 + 40) _scheduleReconnect];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ids message sent. id=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  uint64_t v5 = [(ATIDSService *)self pairedDevice];
  if ([v5 isConnected])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__ATIDSService_service_connectedDevicesChanged___block_invoke;
    block[3] = &unk_1E6B88B40;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void *__48__ATIDSService_service_connectedDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t result = *(void **)(*(void *)(a1 + 32) + 32);
  if (result)
  {
    unint64_t result = (void *)[result connectionState];
    if (!result)
    {
      id v3 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        int v5 = 138543362;
        uint64_t v6 = v4;
        _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ paired device is connected - schedule a reconnect now", (uint8_t *)&v5, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 32) setFailureCount:0];
      return (void *)[*(id *)(a1 + 32) _scheduleReconnect];
    }
  }
  return result;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  int v5 = [(ATIDSService *)self pairedDevice];
  if ([v5 isNearby])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__ATIDSService_service_nearbyDevicesChanged___block_invoke;
    block[3] = &unk_1E6B88B40;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void *__45__ATIDSService_service_nearbyDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t result = *(void **)(*(void *)(a1 + 32) + 32);
  if (result)
  {
    unint64_t result = (void *)[result connectionState];
    if (!result)
    {
      id v3 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        int v5 = 138543362;
        uint64_t v6 = v4;
        _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ paired device is nearby - schedule a reconnect now", (uint8_t *)&v5, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 32) setFailureCount:0];
      return (void *)[*(id *)(a1 + 32) _scheduleReconnect];
    }
  }
  return result;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = [(ATIDSService *)self pairedDevice];
  uint64_t v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ids devices have changed. pairedDevice=%{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__ATIDSService_service_devicesChanged___block_invoke;
  v9[3] = &unk_1E6B88B68;
  id v10 = v5;
  uint64_t v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __39__ATIDSService_service_devicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) _cancelPendingConnectionRequests];
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 40) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "idsServiceDevicesDidChange:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ATIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
  block[3] = &unk_1E6B88BB8;
  void block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, block);
}

void __73__ATIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) type];
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_messageTypeToString:", objc_msgSend(*(id *)(a1 + 40), "type"));
    uint64_t v6 = *(void *)(a1 + 48);
    int v16 = 138544130;
    uint64_t v17 = v3;
    __int16 v18 = 1024;
    int v19 = v4;
    __int16 v20 = 2114;
    uint64_t v21 = v5;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ received ids message %d:'%{public}@' from id %{public}@", (uint8_t *)&v16, 0x26u);
  }
  if ([*(id *)(a1 + 40) type])
  {
    long long v7 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = [*(id *)(a1 + 40) type];
      id v10 = objc_msgSend(*(id *)(a1 + 32), "_messageTypeToString:", objc_msgSend(*(id *)(a1 + 40), "type"));
      uint64_t v11 = *(void *)(a1 + 48);
      int v16 = 138544130;
      uint64_t v17 = v8;
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_INFO, "%{public}@ received ids message of unknown type %d:'%{public}@' from id %{public}@", (uint8_t *)&v16, 0x26u);
    }
  }
  else
  {
    long long v7 = [*(id *)(a1 + 32) pairedDevice];
    if (v7)
    {
      id v12 = *(id **)(a1 + 32);
      if (v12[4])
      {
        if ((unint64_t)[v12[4] connectionState] > 1)
        {
          id v13 = _ATLogCategoryFramework();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = *(void *)(a1 + 32);
            int v15 = [*(id *)(v14 + 32) connectionState];
            int v16 = 138543618;
            uint64_t v17 = v14;
            __int16 v18 = 1024;
            int v19 = v15;
            _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring wakeup. connectionState=%d", (uint8_t *)&v16, 0x12u);
          }
        }
        else
        {
          [*(id *)(a1 + 32) _connect];
        }
      }
      else
      {
        [v12 _scheduleConnectWithPriority:200];
      }
    }
  }
}

- (void)setPreferWifi:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ setting IDSService setPreferInfraWiFi to %d", buf, 0x12u);
  }

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowIDSToPreferWifi", @"com.apple.atc", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat || AppBooleanValue)
  {
    [(IDSService *)self->_service setPreferInfraWiFi:v3];
  }
  else
  {
    long long v7 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = self;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ IDSService setPreferInfraWiFi is currently disabled!", buf, 0xCu);
    }
  }
}

- (void)requestConnectionToPairedDeviceWithPriority:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__ATIDSService_requestConnectionToPairedDeviceWithPriority___block_invoke;
  v4[3] = &unk_1E6B88780;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __60__ATIDSService_requestConnectionToPairedDeviceWithPriority___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleConnectWithPriority:*(void *)(a1 + 40)];
}

- (id)deviceForId:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(IDSService *)self->_service devices];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 uniqueID];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)pairedDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(IDSService *)self->_service devices];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasPairedDevice
{
  id v2 = [(ATIDSService *)self pairedDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__ATIDSService_removeListener___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __31__ATIDSService_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__ATIDSService_addListener___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __28__ATIDSService_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping ids service", buf, 0xCu);
  }

  [(IDSService *)self->_service removeDelegate:self];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__ATIDSService_stop__block_invoke;
  block[3] = &unk_1E6B88B40;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __20__ATIDSService_stop__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelPendingConnectionRequests];
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  return result;
}

- (BOOL)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSService *)self->_service accounts];
    uint64_t v5 = [(IDSService *)self->_service devices];
    int v7 = 138543874;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    long long v10 = v4;
    __int16 v11 = 2114;
    BOOL v12 = v5;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ids service. accounts=%{public}@, devices=%{public}@", (uint8_t *)&v7, 0x20u);
  }
  [(IDSService *)self->_service addDelegate:self queue:self->_queue];
  self->_running = 1;
  return 1;
}

- (ATIDSService)initWithServiceName:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATIDSService;
  uint64_t v5 = [(ATIDSService *)&v16 init];
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:v4];
    service = v5->_service;
    v5->_service = (IDSService *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    listeners = v5->_listeners;
    v5->_listeners = (NSMutableArray *)v12;

    long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v5 selector:sel__handleReconnectEvent_ name:@"com.apple.atc.ATIDSService.reconnect" object:0];
  }
  return v5;
}

+ (int64_t)openSocketPriorityFromATPendingChangePriority:(int)a3
{
  int64_t v3 = 300;
  if (a3 == 1) {
    int64_t v3 = 200;
  }
  if (a3 == 2) {
    return 100;
  }
  else {
    return v3;
  }
}

@end