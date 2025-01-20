@interface FALaunchOutOfProcessRequest
- (void)launchOutOfProcessUIWithOptions:(id)a3 completion:(id)a4;
@end

@implementation FALaunchOutOfProcessRequest

- (void)launchOutOfProcessUIWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__FALaunchOutOfProcessRequest_launchOutOfProcessUIWithOptions_completion___block_invoke;
  v10[3] = &unk_1E6924B90;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v10];
  [v9 launchOutOfProcessFamilyWithOptions:v8 completion:v7];
}

void __74__FALaunchOutOfProcessRequest_launchOutOfProcessUIWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FARegisterPushTokenRequest: Error from service - %@", (uint8_t *)&v6, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    v5 = [[FACircleStateResponse alloc] initWithLoadSuccess:0 error:v3 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end