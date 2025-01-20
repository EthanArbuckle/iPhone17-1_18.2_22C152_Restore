@interface LPLinkSnapshotGenerator
- (LPLinkSnapshotGenerator)init;
- (void)dealloc;
- (void)snapshotForMetadata:(id)a3 configurations:(id)a4 completionHandler:(id)a5;
@end

@implementation LPLinkSnapshotGenerator

- (LPLinkSnapshotGenerator)init
{
  v17.receiver = self;
  v17.super_class = (Class)LPLinkSnapshotGenerator;
  v2 = [(LPLinkSnapshotGenerator *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.LinkPresentation.LinkSnapshotGeneratorService"];
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF7299B0];
    [(NSXPCConnection *)v2->_connectionToService setRemoteObjectInterface:v5];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __31__LPLinkSnapshotGenerator_init__block_invoke;
    v15[3] = &unk_1E5B04DF0;
    v6 = v2;
    v16 = v6;
    [(NSXPCConnection *)v2->_connectionToService setInvalidationHandler:v15];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __31__LPLinkSnapshotGenerator_init__block_invoke_5;
    v13 = &unk_1E5B04DF0;
    v7 = v6;
    v14 = v7;
    [(NSXPCConnection *)v2->_connectionToService setInterruptionHandler:&v10];
    [(NSXPCConnection *)v2->_connectionToService resume];
    v7->_active = 1;
    v8 = v7;
  }
  return v2;
}

void __31__LPLinkSnapshotGenerator_init__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  v1 = LPLogChannelSnapshotGenerator();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __31__LPLinkSnapshotGenerator_init__block_invoke_cold_1(v1);
  }
}

void __31__LPLinkSnapshotGenerator_init__block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  v1 = LPLogChannelSnapshotGenerator();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __31__LPLinkSnapshotGenerator_init__block_invoke_5_cold_1(v1);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connectionToService invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LPLinkSnapshotGenerator;
  [(LPLinkSnapshotGenerator *)&v3 dealloc];
}

- (void)snapshotForMetadata:(id)a3 configurations:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  if (self->_active)
  {
    if (+[LPSettings showDebugIndicators])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14++), "setShowDebugIndicators:", 1, (void)v17);
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
    v15 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxy];
    [v15 snapshotForMetadata:v8 configurations:v9 completionHandler:v10];
  }
  else
  {
    v16 = makeLPError(1, 0);
    v10[2](v10, v16, 0);
  }
}

- (void).cxx_destruct
{
}

void __31__LPLinkSnapshotGenerator_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "Link Snapshot Generator Service: connection invalidated", v1, 2u);
}

void __31__LPLinkSnapshotGenerator_init__block_invoke_5_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "Link Snapshot Generator Service: connection interrupted", v1, 2u);
}

@end