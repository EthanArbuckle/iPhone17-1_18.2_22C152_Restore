@interface AKAuthorizationAppSignInDiscovery
- (AKAuthorizationAppSignInDiscovery)init;
- (void)dealloc;
- (void)startDiscoveryWithCompletion:(id)a3;
@end

@implementation AKAuthorizationAppSignInDiscovery

- (AKAuthorizationAppSignInDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationAppSignInDiscovery;
  v2 = [(AKAuthorizationAppSignInDiscovery *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AKAuthorizationDaemonConnection);
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = v3;
  }
  return v2;
}

- (void)dealloc
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(AKCustodianDaemonConnection *)(uint64_t)self dealloc];
  }

  daemonConnection = self->_daemonConnection;
  if (daemonConnection)
  {
    self->_daemonConnection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationAppSignInDiscovery;
  [(AKAuthorizationAppSignInDiscovery *)&v5 dealloc];
}

- (void)startDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  daemonConnection = self->_daemonConnection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__AKAuthorizationAppSignInDiscovery_startDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_1E575EAC0;
  id v9 = v4;
  id v6 = v4;
  v7 = [(AKAuthorizationDaemonConnection *)daemonConnection remoteObjectProxyWithErrorHandler:v8];
  [v7 startDiscoveryWithCompletion:v6];
}

uint64_t __66__AKAuthorizationAppSignInDiscovery_startDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end