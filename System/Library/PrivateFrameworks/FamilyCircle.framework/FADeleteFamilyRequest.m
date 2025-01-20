@interface FADeleteFamilyRequest
- (FADeleteFamilyRequest)init;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FADeleteFamilyRequest

- (FADeleteFamilyRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FADeleteFamilyRequest;
  v2 = [(FAFamilyCircleRequest *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6924B90;
  id v5 = v4;
  id v11 = v5;
  objc_super v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke_1;
  v8[3] = &unk_1E6924CA8;
  id v9 = v5;
  id v7 = v5;
  [v6 removeFamilyWithReplyBlock:v8];
}

void __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FARemoveFamilyMemberRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end