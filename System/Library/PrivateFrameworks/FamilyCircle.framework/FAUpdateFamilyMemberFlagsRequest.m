@interface FAUpdateFamilyMemberFlagsRequest
- (FAUpdateFamilyMemberFlagsRequest)initWithFamilyMemberDSID:(id)a3 flags:(id)a4;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAUpdateFamilyMemberFlagsRequest

- (FAUpdateFamilyMemberFlagsRequest)initWithFamilyMemberDSID:(id)a3 flags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAUpdateFamilyMemberFlagsRequest;
  v9 = [(FAFamilyCircleRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dsid, a3);
    objc_storeStrong((id *)&v10->_flags, a4);
  }

  return v10;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__FAUpdateFamilyMemberFlagsRequest_startRequestWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6924B90;
  id v5 = v4;
  id v13 = v5;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v12];
  dsid = self->_dsid;
  flags = self->_flags;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__FAUpdateFamilyMemberFlagsRequest_startRequestWithCompletionHandler___block_invoke_35;
  v10[3] = &unk_1E6924CA8;
  id v11 = v5;
  id v9 = v5;
  [v6 updateFamilyMemberFlagsWithDSID:dsid flags:flags replyBlock:v10];
}

void __70__FAUpdateFamilyMemberFlagsRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FAUpdateFamilyMemberFlagsRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__FAUpdateFamilyMemberFlagsRequest_startRequestWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end