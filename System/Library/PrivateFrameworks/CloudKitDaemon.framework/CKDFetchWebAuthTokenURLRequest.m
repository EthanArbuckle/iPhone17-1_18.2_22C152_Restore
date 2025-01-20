@interface CKDFetchWebAuthTokenURLRequest
- (NSString)APIToken;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)tokenFetchedBlock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAPIToken:(id)a3;
- (void)setTokenFetchedBlock:(id)a3;
@end

@implementation CKDFetchWebAuthTokenURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDFetchWebAuthTokenURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v9 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_APIToken(self, v5, v6, v9.receiver, v9.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"APIToken");
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  uint64_t v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setWebAuthTokenRetrieveRequest_(v6, v8, (uint64_t)v7);

  v11 = objc_msgSend_APIToken(self, v9, v10);
  uint64_t v14 = objc_msgSend_length(v11, v12, v13);

  if (v14)
  {
    v17 = objc_msgSend_APIToken(self, v15, v16);
    v20 = objc_msgSend_webAuthTokenRetrieveRequest(v6, v18, v19);
    objc_msgSend_setApiToken_(v20, v21, (uint64_t)v17);
  }
  v24[0] = v6;
  v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v24, 1);

  return v22;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasWebAuthTokenRetrieveResponse(v4, v5, v6))
  {
    objc_super v9 = objc_msgSend_webAuthTokenRetrieveResponse(v4, v7, v8);
    v12 = objc_msgSend_token(v9, v10, v11);
  }
  else
  {
    v12 = 0;
  }
  uint64_t v13 = objc_msgSend_tokenFetchedBlock(self, v7, v8);

  if (v13)
  {
    objc_msgSend_tokenFetchedBlock(self, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_result(v4, v17, v18);
    ((void (**)(void, void *, void *))v16)[2](v16, v12, v19);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v13 = a3;
  uint64_t v6 = objc_msgSend_tokenFetchedBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_tokenFetchedBlock(self, v7, v8);
    objc_super v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_result(v13, v10, v11);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
  }
}

- (NSString)APIToken
{
  return self->_APIToken;
}

- (void)setAPIToken:(id)a3
{
}

- (id)tokenFetchedBlock
{
  return self->_tokenFetchedBlock;
}

- (void)setTokenFetchedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tokenFetchedBlock, 0);
  objc_storeStrong((id *)&self->_APIToken, 0);
}

@end