@interface ACOAuthSigner
- (ACOAuthSigner)initWithAccount:(id)a3;
- (ACOAuthSigner)initWithAccount:(id)a3 remoteEndpoint:(id)a4;
- (BOOL)shouldIncludeAppIdInRequest;
- (id)signedURLRequestWithURLRequest:(id)a3;
- (id)signedURLRequestWithURLRequest:(id)a3 applicationID:(id)a4 timestamp:(id)a5;
- (id)signedURLRequestWithURLRequest:(id)a3 callingPID:(id)a4 timestamp:(id)a5;
- (void)_connectToRemoteOAuthSignerUsingEndpoint:(id)a3;
- (void)dealloc;
- (void)disconnectFromRemoteOAuthSigner;
- (void)setShouldIncludeAppIdInRequest:(BOOL)a3;
@end

@implementation ACOAuthSigner

- (ACOAuthSigner)initWithAccount:(id)a3
{
  return [(ACOAuthSigner *)self initWithAccount:a3 remoteEndpoint:0];
}

- (ACOAuthSigner)initWithAccount:(id)a3 remoteEndpoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACOAuthSigner;
  v9 = [(ACOAuthSigner *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_shouldIncludeAppIdInRequest = 1;
    objc_storeStrong((id *)&v9->_account, a3);
    [(ACOAuthSigner *)v10 _connectToRemoteOAuthSignerUsingEndpoint:v8];
    v11 = [(ACAccount *)v10->_account accountStore];
    v12 = [v11 effectiveBundleID];

    if (v12) {
      [(ACDOAuthSignerProtocol *)v10->_proxyShim setClientBundleID:v12 withHandler:&__block_literal_global_4];
    }
  }
  return v10;
}

void __48__ACOAuthSigner_initWithAccount_remoteEndpoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v3 = _ACLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__ACOAuthSigner_initWithAccount_remoteEndpoint___block_invoke_cold_1(v3);
    }
  }
}

- (void)dealloc
{
  [(ACOAuthSigner *)self disconnectFromRemoteOAuthSigner];
  v3.receiver = self;
  v3.super_class = (Class)ACOAuthSigner;
  [(ACOAuthSigner *)&v3 dealloc];
}

- (id)signedURLRequestWithURLRequest:(id)a3 callingPID:(id)a4 timestamp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = [NSNumber numberWithInt:0];
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  [(ACDOAuthSignerProtocol *)self->_proxyShim setShouldIncludeAppIdInRequest:self->_shouldIncludeAppIdInRequest];
  account = self->_account;
  proxyShim = self->_proxyShim;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke;
  v17[3] = &unk_1E5BCE698;
  v19 = &v20;
  objc_super v14 = v11;
  v18 = v14;
  [(ACDOAuthSignerProtocol *)proxyShim signURLRequest:v8 withAccount:account callingPID:v9 timestamp:v10 handler:v17];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  id v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v15;
}

void __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)signedURLRequestWithURLRequest:(id)a3 applicationID:(id)a4 timestamp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  account = self->_account;
  proxyShim = self->_proxyShim;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__ACOAuthSigner_signedURLRequestWithURLRequest_applicationID_timestamp___block_invoke;
  v17[3] = &unk_1E5BCE698;
  v19 = &v20;
  objc_super v14 = v11;
  v18 = v14;
  [(ACDOAuthSignerProtocol *)proxyShim signURLRequest:v8 withAccount:account applicationID:v9 timestamp:v10 handler:v17];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  id v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v15;
}

void __72__ACOAuthSigner_signedURLRequestWithURLRequest_applicationID_timestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)signedURLRequestWithURLRequest:(id)a3
{
  return [(ACOAuthSigner *)self signedURLRequestWithURLRequest:a3 callingPID:0 timestamp:0];
}

- (void)_connectToRemoteOAuthSignerUsingEndpoint:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F29268]);
  if (v10) {
    v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v10];
  }
  else {
    v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.accountsd.oauthsigner" options:0];
  }
  connection = self->_connection;
  self->_connection = v5;

  id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA20BE0];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v7];

  [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_60];
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  proxyShim = self->_proxyShim;
  self->_proxyShim = v8;

  [(NSXPCConnection *)self->_connection resume];
}

void __58__ACOAuthSigner__connectToRemoteOAuthSignerUsingEndpoint___block_invoke()
{
  v0 = _ACLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_DEFAULT, "\"The connection to ACDOAuthSigner was interrupted.\"", v1, 2u);
  }
}

- (void)disconnectFromRemoteOAuthSigner
{
}

- (BOOL)shouldIncludeAppIdInRequest
{
  return self->_shouldIncludeAppIdInRequest;
}

- (void)setShouldIncludeAppIdInRequest:(BOOL)a3
{
  self->_shouldIncludeAppIdInRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyShim, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __48__ACOAuthSigner_initWithAccount_remoteEndpoint___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A57C5000, log, OS_LOG_TYPE_ERROR, "\"Bundle ID spoofing failed.\"", v1, 2u);
}

void __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_ERROR, "\"Error signing request: %@\"", (uint8_t *)&v2, 0xCu);
}

@end