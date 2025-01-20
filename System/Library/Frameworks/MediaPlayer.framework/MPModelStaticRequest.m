@interface MPModelStaticRequest
+ (BOOL)supportsSecureCoding;
- (MPModelStaticResponse)staticResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setStaticResponse:(id)a3;
@end

@implementation MPModelStaticRequest

- (void).cxx_destruct
{
}

- (void)setStaticResponse:(id)a3
{
}

- (MPModelStaticResponse)staticResponse
{
  return self->_staticResponse;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MPModelStaticRequest *)self staticResponse];
  v6 = (void *)MEMORY[0x1E4F28B48];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__MPModelStaticRequest_newOperationWithResponseHandler___block_invoke;
  v11[3] = &unk_1E57F9140;
  id v12 = v5;
  id v13 = v4;
  id v7 = v5;
  id v8 = v4;
  v9 = [v6 blockOperationWithBlock:v11];

  return v9;
}

uint64_t __56__MPModelStaticRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelStaticRequest;
  id v4 = [(MPModelRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 8, self->_staticResponse);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end