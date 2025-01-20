@interface AFRemoteRequest
- (AFRemoteRequest)initWithInfo:(id)a3;
- (AFRequestInfo)info;
- (NSString)peerIdentifier;
- (void)sendWithCompletion:(id)a3;
- (void)setPeerIdentifier:(id)a3;
@end

@implementation AFRemoteRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NSString)peerIdentifier
{
  return self->_peerIdentifier;
}

- (AFRequestInfo)info
{
  return self->_info;
}

- (void)sendWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AFSettingsConnection);
  info = self->_info;
  peerIdentifier = self->_peerIdentifier;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__AFRemoteRequest_sendWithCompletion___block_invoke;
  v10[3] = &unk_1E5929538;
  v11 = v5;
  id v12 = v4;
  v10[4] = self;
  v8 = v5;
  id v9 = v4;
  [(AFSettingsConnection *)v8 startRemoteRequest:info onPeer:peerIdentifier completion:v10];
}

uint64_t __38__AFRemoteRequest_sendWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 != 0, a2);
  }
  return result;
}

- (AFRemoteRequest)initWithInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFRemoteRequest;
  v6 = [(AFRemoteRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_info, a3);
  }

  return v7;
}

@end