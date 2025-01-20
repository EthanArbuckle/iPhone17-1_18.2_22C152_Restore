@interface ATSessionProxyConnection
- (ATSessionProxyConnection)initWithSession:(id)a3 connection:(id)a4;
- (void)session:(id)a3 didFinishSessionTask:(id)a4;
- (void)session:(id)a3 didUpdateSessionTask:(id)a4;
- (void)session:(id)a3 willBeginSessionTask:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation ATSessionProxyConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)session:(id)a3 didFinishSessionTask:(id)a4
{
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ATSessionProxyConnection_session_didFinishSessionTask___block_invoke;
  v8[3] = &unk_1E6B8C3C8;
  v8[4] = self;
  id v5 = a4;
  v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  v7 = [v5 baseClassRepresentation];

  [v6 updateSessionTask:v7];
}

void __57__ATSessionProxyConnection_session_didFinishSessionTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error %{public}@ notifying didFinishSessionTask", (uint8_t *)&v6, 0x16u);
  }
}

- (void)session:(id)a3 didUpdateSessionTask:(id)a4
{
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ATSessionProxyConnection_session_didUpdateSessionTask___block_invoke;
  v8[3] = &unk_1E6B8C3C8;
  v8[4] = self;
  id v5 = a4;
  int v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  uint64_t v7 = [v5 baseClassRepresentation];

  [v6 updateSessionTask:v7];
}

void __57__ATSessionProxyConnection_session_didUpdateSessionTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error %{public}@ notifying didUpdateSessionTask", (uint8_t *)&v6, 0x16u);
  }
}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ATSessionProxyConnection_session_willBeginSessionTask___block_invoke;
  v8[3] = &unk_1E6B8C3C8;
  v8[4] = self;
  id v5 = a4;
  int v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  uint64_t v7 = [v5 baseClassRepresentation];

  [v6 beginSessionTask:v7];
}

void __57__ATSessionProxyConnection_session_willBeginSessionTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error %{public}@ notifying willBeginSessionTask", (uint8_t *)&v6, 0x16u);
  }
}

- (void)stop
{
}

- (void)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(ATSession *)self->_session addObserver:self];
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33E36D8];
  [(NSXPCConnection *)self->_connection setExportedInterface:v3];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33EB018];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v4];

  [(NSXPCConnection *)self->_connection resume];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(ATSession *)self->_session sessionTasks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ATSessionProxyConnection *)self session:self->_session didUpdateSessionTask:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (ATSessionProxyConnection)initWithSession:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATSessionProxyConnection;
  uint64_t v9 = [(ATSessionProxyConnection *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_connection, a4);
  }

  return v10;
}

@end