@interface FAClearFamilyCircleCacheRequest
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAClearFamilyCircleCacheRequest

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__FAClearFamilyCircleCacheRequest_startRequestWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6924B90;
  id v5 = v4;
  id v11 = v5;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__FAClearFamilyCircleCacheRequest_startRequestWithCompletionHandler___block_invoke_17;
  v8[3] = &unk_1E6924B90;
  id v9 = v5;
  id v7 = v5;
  [v6 clearFamilyCircleCacheWithReplyBlock:v8];
}

void __69__FAClearFamilyCircleCacheRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FAClearFamilyCircleCacheRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__FAClearFamilyCircleCacheRequest_startRequestWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "Cleared cache with error: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

@end