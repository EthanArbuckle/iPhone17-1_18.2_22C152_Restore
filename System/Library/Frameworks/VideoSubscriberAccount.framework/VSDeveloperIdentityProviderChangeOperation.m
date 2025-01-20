@interface VSDeveloperIdentityProviderChangeOperation
- (NSXPCConnection)connection;
- (VSDeveloperIdentityProviderChangeOperation)init;
- (VSIdentityProvider)identityProvider;
- (VSOptional)result;
- (id)_serviceWithErrorHandler:(id)a3;
- (int64_t)changeKind;
- (void)dealloc;
- (void)executionDidBegin;
- (void)setChangeKind:(int64_t)a3;
- (void)setConnection:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSDeveloperIdentityProviderChangeOperation

- (VSDeveloperIdentityProviderChangeOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSDeveloperIdentityProviderChangeOperation;
  v2 = [(VSDeveloperIdentityProviderChangeOperation *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.VideoSubscriberAccount.DeveloperService"];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    v6 = VSDeveloperServiceInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connection resume];
    v7 = objc_alloc_init(VSOptional);
    v8 = v2->_result;
    v2->_result = v7;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VSDeveloperIdentityProviderChangeOperation;
  [(VSDeveloperIdentityProviderChangeOperation *)&v3 dealloc];
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(VSDeveloperIdentityProviderChangeOperation *)self connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)executionDidBegin
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke;
  v12[3] = &unk_1E6BD28B0;
  v12[4] = self;
  objc_super v3 = [(VSDeveloperIdentityProviderChangeOperation *)self _serviceWithErrorHandler:v12];
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will change developer identity.", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_6;
  aBlock[3] = &unk_1E6BD28D8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = [(VSDeveloperIdentityProviderChangeOperation *)self identityProvider];
  int64_t v7 = [(VSDeveloperIdentityProviderChangeOperation *)self changeKind];
  switch(v7)
  {
    case 2:
      v8 = [v6 uniqueID];
      v9 = [v8 forceUnwrapObject];
      [v3 removeDeveloperIdentityProviderWithUniqueID:v9 completionHandler:v5];

      break;
    case 1:
      [v3 updateExistingDeveloperIdentityProvider:v6 completionHandler:v5];
      break;
    case 0:
      [v3 addDeveloperIdentityProvider:v6 completionHandler:v5];
      break;
  }
}

void __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_cold_1((uint64_t)v3, v4);
  }

  v5 = *(void **)(a1 + 32);
  v6 = +[VSFailable failableWithError:v3];
  int64_t v7 = +[VSOptional optionalWithObject:v6];
  [v5 setResult:v7];

  [*(id *)(a1 + 32) finishExecutionIfPossible];
}

uint64_t __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[VSOptional optionalWithObject:a2];
  [v3 setResult:v4];

  v5 = *(void **)(a1 + 32);

  return [v5 finishExecutionIfPossible];
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (int64_t)changeKind
{
  return self->_changeKind;
}

- (void)setChangeKind:(int64_t)a3
{
  self->_changeKind = a3;
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_identityProvider, 0);
}

void __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error with developer service: %@", (uint8_t *)&v2, 0xCu);
}

@end