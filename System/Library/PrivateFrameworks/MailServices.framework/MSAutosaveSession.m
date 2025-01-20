@interface MSAutosaveSession
+ (id)log;
- (MSAutosaveSession)initWithIdentifier:(id)a3 remoteSession:(id)a4 remoteService:(id)a5;
- (MSDAutosaveProtocol)remoteService;
- (MSDAutosaveSessionProtocol)remoteSession;
- (NSString)autosaveIdentifier;
- (void)didReconnectRemoteSession:(id)a3 remoteService:(id)a4;
- (void)remoteSessionDisconnectedWithError:(id)a3;
- (void)setRemoteService:(id)a3;
- (void)setRemoteSession:(id)a3;
@end

@implementation MSAutosaveSession

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__MSAutosaveSession_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;

  return v2;
}

void __24__MSAutosaveSession_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (MSAutosaveSession)initWithIdentifier:(id)a3 remoteSession:(id)a4 remoteService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSAutosaveSession;
  v12 = [(MSAutosaveSession *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_autosaveIdentifier, a3);
    objc_storeStrong((id *)&v13->_remoteSession, a4);
    objc_storeStrong((id *)&v13->_remoteService, a5);
  }

  return v13;
}

- (void)didReconnectRemoteSession:(id)a3 remoteService:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[MSAutosaveSession log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(MSAutosaveSession *)self autosaveIdentifier];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_215471000, v8, OS_LOG_TYPE_INFO, "Reconnected to remote autosave session (autosaveID=%@)", (uint8_t *)&v10, 0xCu);
  }
  [(MSAutosaveSession *)self setRemoteSession:v6];
  [(MSAutosaveSession *)self setRemoteService:v7];
}

- (void)remoteSessionDisconnectedWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[MSAutosaveSession log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [(MSAutosaveSession *)self autosaveIdentifier];
    id v7 = objc_msgSend(v4, "ef_publicDescription");
    -[MSAutosaveSession remoteSessionDisconnectedWithError:](v6, v7, v8, v5);
  }
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (MSDAutosaveSessionProtocol)remoteSession
{
  return self->_remoteSession;
}

- (void)setRemoteSession:(id)a3
{
}

- (MSDAutosaveProtocol)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_remoteSession, 0);

  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
}

- (void)remoteSessionDisconnectedWithError:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_215471000, log, OS_LOG_TYPE_ERROR, "Reconnecting to remote autosave session (autosaveID=%@) failed with error: %{public}@", buf, 0x16u);
}

@end