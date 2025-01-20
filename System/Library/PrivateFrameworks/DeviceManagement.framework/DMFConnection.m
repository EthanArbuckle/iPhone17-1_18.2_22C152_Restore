@interface DMFConnection
+ (BOOL)isFactoryBuild;
+ (DMFConnection)currentUserConnection;
+ (DMFConnection)sharedConnection;
+ (DMFConnection)systemConnection;
+ (id)connectionForAppleID:(id)a3;
+ (id)connectionForUID:(unsigned int)a3;
- (BOOL)isSystemConnection;
- (CATOperationQueue)operationQueue;
- (CATTaskClient)taskClient;
- (DMFConnection)initWithTransportProvider:(id)a3 userInfo:(id)a4;
- (DMFConnection)initWithUserInfo:(id)a3;
- (DMFTransportProvider)transportProvider;
- (id)batchOperationToPerformOperations:(id)a3;
- (id)makeNewTransport;
- (id)prepareOperationForRequest:(id)a3;
- (unint64_t)connectionState;
- (void)_operationDidFinish:(id)a3 completion:(id)a4;
- (void)_reconnectTaskClient;
- (void)client:(id)a3 didInterruptWithError:(id)a4;
- (void)clientDidConnect:(id)a3;
- (void)clientDidDisconnect:(id)a3;
- (void)clientDidInvalidate:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performRequest:(id)a3 completion:(id)a4;
- (void)setConnectionState:(unint64_t)a3;
- (void)setIsSystemConnection:(BOOL)a3;
@end

@implementation DMFConnection

+ (DMFConnection)sharedConnection
{
  return +[DMFConnection systemConnection];
}

+ (DMFConnection)systemConnection
{
  return (DMFConnection *)[a1 connectionForUID:0];
}

+ (DMFConnection)currentUserConnection
{
  uint64_t v3 = getuid();
  return (DMFConnection *)[a1 connectionForUID:v3];
}

+ (id)connectionForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (connectionForUID__onceToken != -1) {
    dispatch_once(&connectionForUID__onceToken, &__block_literal_global_4);
  }
  v5 = (void *)connectionForUID__connectionByUID;
  v6 = [NSNumber numberWithUnsignedInt:v3];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    id v8 = objc_alloc((Class)a1);
    v14 = @"DMFConnectionTargetUIDKey";
    v9 = [NSNumber numberWithUnsignedInt:v3];
    v15[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v7 = (void *)[v8 initWithUserInfo:v10];

    if (!v3) {
      [v7 setIsSystemConnection:1];
    }
    v11 = (void *)connectionForUID__connectionByUID;
    v12 = [NSNumber numberWithUnsignedInt:v3];
    [v11 setObject:v7 forKey:v12];
  }
  return v7;
}

uint64_t __34__DMFConnection_connectionForUID___block_invoke()
{
  connectionForUID__connectionByUID = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  return MEMORY[0x1F41817F8]();
}

+ (id)connectionForAppleID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"DMFConnection.m", 90, @"Invalid parameter not satisfying: %@", @"appleID" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)a1);
  v11 = @"DMFConnectionAppleIDKey";
  v12[0] = v5;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v8 = (void *)[v6 initWithUserInfo:v7];

  return v8;
}

- (DMFConnection)initWithUserInfo:(id)a3
{
  return [(DMFConnection *)self initWithTransportProvider:self userInfo:a3];
}

- (DMFConnection)initWithTransportProvider:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"DMFConnection.m", 100, @"Invalid parameter not satisfying: %@", @"transportProvider" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)DMFConnection;
  v9 = [(DMFConnection *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_connectionState = 0;
    uint64_t v11 = objc_opt_new();
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = (CATOperationQueue *)v11;

    [(CATOperationQueue *)v10->_operationQueue setMaxConcurrentOperationCount:0x7FFFFFFFFFFFFFFFLL];
    objc_storeWeak((id *)&v10->_transportProvider, v7);
    uint64_t v13 = objc_opt_new();
    taskClient = v10->_taskClient;
    v10->_taskClient = (CATTaskClient *)v13;

    [(CATTaskClient *)v10->_taskClient setDelegate:v10];
    v15 = (void *)[v8 copy];
    [(CATTaskClient *)v10->_taskClient setUserInfo:v15];

    [(DMFConnection *)v10 _reconnectTaskClient];
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = [(DMFConnection *)self taskClient];
  [v3 setDelegate:0];

  v4 = [(DMFConnection *)self taskClient];
  [v4 disconnect];

  id v5 = [(DMFConnection *)self taskClient];
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)DMFConnection;
  [(DMFConnection *)&v6 dealloc];
}

+ (BOOL)isFactoryBuild
{
  return MEMORY[0x1F40CD640]("com.apple.DeviceManagement", a2);
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"DMFConnection.m", 135, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v9 = [(DMFConnection *)self prepareOperationForRequest:v7];
  if (v9 && !+[DMFConnection isFactoryBuild])
  {
    if (v8)
    {
      uint64_t v13 = (void *)MEMORY[0x1C188B2F0](v8);
      v14 = dispatch_get_global_queue(25, 0);
      [v9 addTarget:self selector:sel__operationDidFinish_completion_ forOperationEvents:6 userInfo:v13 delegateQueue:v14];
    }
    id v12 = [(DMFConnection *)self operationQueue];
    [v12 addOperation:v9];
  }
  else
  {
    v10 = DMFErrorWithCodeAndUserInfo(7, 0);
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__DMFConnection_performRequest_completion___block_invoke;
    block[3] = &unk_1E6372460;
    id v17 = v10;
    id v18 = v8;
    id v12 = v10;
    dispatch_async(v11, block);
  }
}

uint64_t __43__DMFConnection_performRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (id)prepareOperationForRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"DMFConnection.m", 161, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  if (+[DMFConnection isFactoryBuild])
  {
    objc_super v6 = DMFErrorWithCodeAndUserInfo(7, 0);
    id v7 = [(DMFConnection *)self taskClient];
    [v7 invalidateWithError:v6];

    id v8 = 0;
  }
  else
  {
    if (![(DMFConnection *)self connectionState]) {
      [(DMFConnection *)self _reconnectTaskClient];
    }
    objc_super v6 = [(DMFConnection *)self taskClient];
    id v8 = [v6 prepareTaskOperationForRequest:v5];
  }

  return v8;
}

- (id)batchOperationToPerformOperations:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_super v6 = [(DMFConnection *)self prepareOperationForRequest:v5];
  id v7 = [[DMFBatchRequestOperation alloc] initWithActivityTransactionOperation:v6 subOperations:v4];

  return v7;
}

- (void)invalidate
{
  id v2 = [(DMFConnection *)self taskClient];
  [v2 invalidate];
}

- (id)makeNewTransport
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.dmd" options:4096];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F57FF8]) initWithXPCConnection:v2];

  return v3;
}

- (void)clientDidConnect:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a3;
    _os_log_impl(&dword_1BE0E2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Client did connect: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(DMFConnection *)self setConnectionState:2];
}

- (void)clientDidDisconnect:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a3;
    _os_log_impl(&dword_1BE0E2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Client did disconnect: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(DMFConnection *)self setConnectionState:0];
}

- (void)clientDidInvalidate:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a3;
    _os_log_impl(&dword_1BE0E2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Client did invalidate: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(DMFConnection *)self setConnectionState:0];
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[DMFConnection client:didInterruptWithError:]((uint64_t)v6, (uint64_t)v7);
  }
  [(DMFConnection *)self setConnectionState:0];
  id v8 = [(DMFConnection *)self operationQueue];
  v9 = [v8 operations];
  uint64_t v10 = [v9 count];

  if (v10) {
    [(DMFConnection *)self _reconnectTaskClient];
  }
}

- (void)_operationDidFinish:(id)a3 completion:(id)a4
{
  id v8 = a3;
  int v5 = (void (**)(id, void *, void *))a4;
  id v6 = [v8 error];
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v8 resultObject];
  }
  v5[2](v5, v7, v6);
}

- (void)_reconnectTaskClient
{
  [(DMFConnection *)self setConnectionState:1];
  id v5 = [(DMFConnection *)self taskClient];
  uint64_t v3 = [(DMFConnection *)self transportProvider];
  id v4 = [v3 makeNewTransport];
  [v5 connectWithTransport:v4];
}

- (DMFTransportProvider)transportProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transportProvider);
  return (DMFTransportProvider *)WeakRetained;
}

- (CATTaskClient)taskClient
{
  return self->_taskClient;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unint64_t)a3
{
  self->_connectionState = a3;
}

- (BOOL)isSystemConnection
{
  return self->_isSystemConnection;
}

- (void)setIsSystemConnection:(BOOL)a3
{
  self->_isSystemConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_taskClient, 0);
  objc_destroyWeak((id *)&self->_transportProvider);
}

- (void)client:(uint64_t)a1 didInterruptWithError:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1BE0E2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Client did interrupt: %{public}@, error: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end