@interface FAUpdateFamilyInviteStatusRequest
- (FAUpdateFamilyInviteStatusRequest)initWithInviteCode:(id)a3 inviteStatus:(int64_t)a4 responseFormat:(int64_t)a5 additionalRequestParameters:(id)a6;
- (NSDictionary)additionalRequestParameters;
- (NSString)inviteCode;
- (int64_t)inviteStatus;
- (int64_t)responseFormat;
- (void)startRequestWithCompletionHandler:(id)a3;
@end

@implementation FAUpdateFamilyInviteStatusRequest

- (FAUpdateFamilyInviteStatusRequest)initWithInviteCode:(id)a3 inviteStatus:(int64_t)a4 responseFormat:(int64_t)a5 additionalRequestParameters:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FAUpdateFamilyInviteStatusRequest;
  v13 = [(FAFamilyCircleRequest *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_inviteCode, a3);
    v14->_inviteStatus = a4;
    v14->_responseFormat = a5;
    objc_storeStrong((id *)&v14->_additionalRequestParameters, a6);
  }

  return v14;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E6924B90;
  id v5 = v4;
  id v16 = v5;
  v6 = [(FAFamilyCircleRequest *)self serviceRemoteObjectWithErrorHandler:v15];
  int64_t v7 = [(FAUpdateFamilyInviteStatusRequest *)self inviteStatus];
  v8 = [(FAUpdateFamilyInviteStatusRequest *)self inviteCode];
  v9 = [(FAFamilyCircleRequest *)self requestOptions];
  int64_t v10 = [(FAUpdateFamilyInviteStatusRequest *)self responseFormat];
  id v11 = [(FAUpdateFamilyInviteStatusRequest *)self additionalRequestParameters];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke_17;
  v13[3] = &unk_1E6924CA8;
  id v14 = v5;
  id v12 = v5;
  [v6 updateFamilyInviteStatusWith:v7 inviteCode:v8 options:v9 responseFormat:v10 additionalRequestParameters:v11 replyBlock:v13];
}

void __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "FAUpdateFamilyInviteStatusRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)inviteCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (NSDictionary)additionalRequestParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)responseFormat
{
  return self->_responseFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalRequestParameters, 0);
  objc_storeStrong((id *)&self->_inviteCode, 0);
}

@end