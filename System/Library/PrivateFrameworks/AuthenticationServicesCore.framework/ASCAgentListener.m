@interface ASCAgentListener
- (ASCAgentListener)initWithPublicKeyCredentialManager:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector)signInEventCollector;
- (void)setSignInEventCollector:(id)a3;
@end

@implementation ASCAgentListener

- (ASCAgentListener)initWithPublicKeyCredentialManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCAgentListener;
  v6 = [(ASCAgentListener *)&v15 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F08D88]);
    v8 = ASCAgentServiceName();
    uint64_t v9 = [v7 initWithMachServiceName:v8];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v9;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    objc_storeStrong((id *)&v6->_publicKeyCredentialManager, a3);
    v11 = objc_alloc_init(_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector);
    signInEventCollector = v6->_signInEventCollector;
    v6->_signInEventCollector = v11;

    [(NSXPCListener *)v6->_listener resume];
    v13 = v6;
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[ASCAgentInterface xpcInterface];
  [v7 setExportedInterface:v8];

  uint64_t v9 = [ASCAgent alloc];
  v10 = +[ASCAuthorizationTrafficController sharedInstance];
  v11 = [(ASCAgent *)v9 initWithTrafficController:v10 connection:v7 publicKeyCredentialManager:self->_publicKeyCredentialManager signInEventCollector:self->_signInEventCollector];

  [v7 setExportedObject:v11];
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  v12 = WBSApplicationIdentifierFromAuditToken();
  v13 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v12;
    _os_log_impl(&dword_219326000, v13, OS_LOG_TYPE_DEFAULT, "Received connection from %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v11);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __55__ASCAgentListener_listener_shouldAcceptNewConnection___block_invoke;
  v19 = &unk_26439F1E8;
  id v14 = v12;
  id v20 = v14;
  objc_copyWeak(&v21, (id *)buf);
  [v7 setInvalidationHandler:&v16];
  objc_msgSend(v7, "resume", v16, v17, v18, v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
  return 1;
}

void __55__ASCAgentListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ disconnected.", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancelCurrentRequest];
}

- (_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector)signInEventCollector
{
  return self->_signInEventCollector;
}

- (void)setSignInEventCollector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInEventCollector, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialManager, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end