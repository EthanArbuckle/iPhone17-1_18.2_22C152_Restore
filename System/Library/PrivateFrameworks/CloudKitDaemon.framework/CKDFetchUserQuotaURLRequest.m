@interface CKDFetchUserQuotaURLRequest
- (id)generateRequestOperations;
- (id)quotaFetchedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setQuotaFetchedBlock:(id)a3;
@end

@implementation CKDFetchUserQuotaURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchUserQuotaURLRequest;
  [(CKDURLRequest *)&v3 fillOutEquivalencyPropertiesBuilder:a3];
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  objc_super v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setUserAvailableQuotaRequest_(v6, v8, (uint64_t)v7);

  v12[0] = v6;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v12, 1);

  return v10;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasUserAvailableQuotaResponse(v4, v5, v6))
  {
    v9 = objc_msgSend_userAvailableQuotaResponse(v4, v7, v8);
    uint64_t v12 = objc_msgSend_storageAvailableBytes(v9, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = objc_msgSend_quotaFetchedBlock(self, v7, v8);

  if (v13)
  {
    objc_msgSend_quotaFetchedBlock(self, v14, v15);
    v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_result(v4, v17, v18);
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v12, v19);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v13 = a3;
  uint64_t v6 = objc_msgSend_quotaFetchedBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_quotaFetchedBlock(self, v7, v8);
    v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_result(v13, v10, v11);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
  }
}

- (id)quotaFetchedBlock
{
  return self->_quotaFetchedBlock;
}

- (void)setQuotaFetchedBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end