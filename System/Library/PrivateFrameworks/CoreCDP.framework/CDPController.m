@interface CDPController
- (CDPAuthProvider)authProvider;
- (CDPContext)context;
- (CDPController)init;
- (CDPController)initWithContext:(id)a3;
- (CDPController)initWithXpcEndpoint:(id)a3 context:(id)a4;
- (CDPDaemonConnection)daemonConn;
- (CDPStateUIProvider)uiProvider;
- (CDPStateUIProviderProxy)uiProviderProxy;
- (void)dealloc;
- (void)invalidate;
- (void)setAuthProvider:(id)a3;
- (void)setDaemonConn:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)setUiProviderProxy:(id)a3;
@end

@implementation CDPController

- (CDPController)initWithXpcEndpoint:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CDPController *)self init];
  v9 = v8;
  if (v8)
  {
    [(CDPDaemonConnection *)v8->_daemonConn setDaemonXPCEndpoint:v6];
    objc_storeStrong((id *)&v9->_context, a4);
  }

  return v9;
}

- (CDPController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPController;
  v2 = [(CDPController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CDPDaemonConnection);
    daemonConn = v2->_daemonConn;
    v2->_daemonConn = v3;
  }
  return v2;
}

- (CDPController)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(CDPController *)self init];
  if (v5)
  {
    uint64_t v6 = +[CDPContext preflightContext:v4];
    context = v5->_context;
    v5->_context = (CDPContext *)v6;
  }
  return v5;
}

- (void)invalidate
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Invalidating connection for controller %@", (uint8_t *)&v2, 0xCu);
}

- (void)dealloc
{
  daemonConn = self->_daemonConn;
  self->_daemonConn = 0;

  context = self->_context;
  self->_context = 0;

  uiProvider = self->_uiProvider;
  self->_uiProvider = 0;

  uiProviderProxy = self->_uiProviderProxy;
  self->_uiProviderProxy = 0;

  v7.receiver = self;
  v7.super_class = (Class)CDPController;
  [(CDPController *)&v7 dealloc];
}

- (CDPStateUIProviderProxy)uiProviderProxy
{
  if (self->_uiProvider)
  {
    uint64_t v3 = [[CDPStateUIProviderProxy alloc] initWithUIProvider:self->_uiProvider];
    uiProviderProxy = self->_uiProviderProxy;
    self->_uiProviderProxy = v3;
  }
  v5 = self->_uiProviderProxy;
  return v5;
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPStateUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (CDPAuthProvider)authProvider
{
  return self->_authProvider;
}

- (void)setAuthProvider:(id)a3
{
}

- (CDPDaemonConnection)daemonConn
{
  return self->_daemonConn;
}

- (void)setDaemonConn:(id)a3
{
}

- (void)setUiProviderProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProviderProxy, 0);
  objc_storeStrong((id *)&self->_daemonConn, 0);
  objc_storeStrong((id *)&self->_authProvider, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end