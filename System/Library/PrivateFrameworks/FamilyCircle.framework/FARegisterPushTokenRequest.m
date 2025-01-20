@interface FARegisterPushTokenRequest
- (FARegisterPushTokenRequest)initWithPushToken:(id)a3;
- (NSData)pushToken;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FARegisterPushTokenRequest

- (FARegisterPushTokenRequest)initWithPushToken:(id)a3
{
  id v5 = a3;
  v6 = [(FAFamilyCircleRequest *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pushToken, a3);
    v8 = v7;
  }

  return v7;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6924B90;
  id v5 = v4;
  id v13 = v5;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v12];
  pushToken = self->_pushToken;
  v8 = [(FAFamilyCircleRequest *)self requestOptions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke_17;
  v10[3] = &unk_1E6924B90;
  id v11 = v5;
  id v9 = v5;
  [v6 registerPushToken:pushToken options:v8 replyBlock:v10];
}

void __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FARegisterPushTokenRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end