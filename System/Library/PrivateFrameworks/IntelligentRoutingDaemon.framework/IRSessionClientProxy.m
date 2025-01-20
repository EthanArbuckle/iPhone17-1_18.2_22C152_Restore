@interface IRSessionClientProxy
- (IRSessionClientProxy)initWithConnection:(id)a3;
- (NSString)clientIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (void)_didSpotOnLocationComplete:(id)a3;
- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3;
- (void)_didUpdateContext:(id)a3;
- (void)_sessionDidFailWithError:(id)a3;
- (void)invalidateXPCConnection;
- (void)setClientIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IRSessionClientProxy

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_didUpdateContext:(id)a3
{
  id v4 = a3;
  id v6 = [(IRSessionClientProxy *)self connection];
  v5 = [v6 remoteObjectProxy];
  [v5 _didUpdateContext:v4];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (IRSessionClientProxy)initWithConnection:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IRSessionClientProxy;
  v5 = [(IRSessionClientProxy *)&v16 init];
  if (!v5) {
    goto LABEL_8;
  }
  if (v4) {
    objc_msgSend(v4, "auditToken", (unsigned __int128)0, (unsigned __int128)0);
  }
  uint64_t v6 = xpc_copy_code_signing_identity_for_token();
  if (!v6
    || (v7 = (void *)v6,
        [NSString stringWithUTF8String:v6],
        v8 = objc_claimAutoreleasedReturnValue(),
        free(v7),
        !v8))
  {
    v13 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRSessionClientProxy initWithConnection:](v13);
    }
    goto LABEL_14;
  }
  v9 = [v4 valueForEntitlement:@"com.apple.intelligentrouting.recommendationservice"];
  char v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    v14 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRSessionClientProxy initWithConnection:](v14, v5);
    }

LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  [(IRSessionClientProxy *)v5 setConnection:v4];
  v11 = [v4 _queue];
  [(IRSessionClientProxy *)v5 setQueue:v11];

  [(IRSessionClientProxy *)v5 setClientIdentifier:v8];
LABEL_8:
  v12 = v5;
LABEL_15:

  return v12;
}

- (void)invalidateXPCConnection
{
  id v2 = [(IRSessionClientProxy *)self connection];
  [v2 invalidate];
}

- (void)_sessionDidFailWithError:(id)a3
{
  id v4 = a3;
  v5 = [(IRSessionClientProxy *)self connection];
  uint64_t v6 = [v5 remoteObjectProxy];
  [v6 _sessionDidFailWithError:v4];

  [(IRSessionClientProxy *)self invalidateXPCConnection];
}

- (void)_didSpotOnLocationComplete:(id)a3
{
  id v4 = a3;
  id v6 = [(IRSessionClientProxy *)self connection];
  v5 = [v6 remoteObjectProxy];
  [v5 _didSpotOnLocationComplete:v4];
}

- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  id v4 = a3;
  id v6 = [(IRSessionClientProxy *)self connection];
  v5 = [v6 remoteObjectProxy];
  [v5 _didUpdateBundlesWithSignificantInteractionPattern:v4];
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#server-client, [ErrorId - Missing signing identity] no signing identity for connection", v1, 2u);
}

- (void)initWithConnection:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 clientIdentifier];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_25418E000, v3, OS_LOG_TYPE_ERROR, "#server-client, [ErrorId - Missing entitlement] %@ is missing required entitlement, rejecting connection.", (uint8_t *)&v5, 0xCu);
}

@end