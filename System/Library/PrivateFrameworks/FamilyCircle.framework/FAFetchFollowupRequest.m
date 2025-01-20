@interface FAFetchFollowupRequest
- (FAFetchFollowupRequest)initWithAltDSID:(id)a3;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAFetchFollowupRequest

- (FAFetchFollowupRequest)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFetchFollowupRequest;
  v6 = [(FAFamilyCircleRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FAFetchFollowupRequest_startRequestWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6924B90;
  id v10 = v4;
  id v5 = v4;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v9];
  altDSID = self->_altDSID;
  v8 = [(FAFamilyCircleRequest *)self requestOptions];
  [v6 fetchFollowupsWithAltDSID:altDSID options:v8 replyBlock:v5];
}

void __60__FAFetchFollowupRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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

- (void).cxx_destruct
{
}

@end