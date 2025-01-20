@interface FAHeartbeatRequest
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAHeartbeatRequest

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__FAHeartbeatRequest_startRequestWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6924B90;
  id v8 = v4;
  id v5 = v4;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v7];
  [v6 runHeartbeatWithOptions:0 replyBlock:v5];
}

void __56__FAHeartbeatRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FAFetchFollowupRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end