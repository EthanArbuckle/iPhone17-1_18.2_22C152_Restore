@interface CKDAssetTokenRequestOperation
- (CKDAssetTokenRequest)assetTokenRequest;
- (CKDAssetTokenRequestOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (int)operationType;
- (void)main;
- (void)setAssetTokenRequest:(id)a3;
@end

@implementation CKDAssetTokenRequestOperation

- (CKDAssetTokenRequestOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDAssetTokenRequestOperation;
  v9 = [(CKDDatabaseOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_assetTokenRequest(v6, v7, v8);
    assetTokenRequest = v9->_assetTokenRequest;
    v9->_assetTokenRequest = (CKDAssetTokenRequest *)v10;
  }
  return v9;
}

- (int)operationType
{
  return 230;
}

- (void)main
{
  v3 = [CKDFetchContentAuthTokensForPutURLRequest alloc];
  id v6 = objc_msgSend_assetTokenRequest(self, v4, v5);
  v9 = objc_msgSend_protocolHeaders(CKDMMCS, v7, v8);
  v11 = objc_msgSend_initWithOperation_assetTokenRequest_headers_(v3, v10, (uint64_t)self, v6, v9);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  uint64_t v14 = objc_msgSend_useEncryption(self, v12, v13);
  objc_msgSend_setUseEncryption_(v11, v15, v14);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = sub_1C5018CDC;
  v25 = &unk_1E64F0170;
  objc_copyWeak(&v26, &location);
  objc_copyWeak(&v27, &from);
  objc_msgSend_setCompletionBlock_(v11, v16, (uint64_t)&v22);
  objc_msgSend_setRequest_(self, v17, (uint64_t)v11, v22, v23, v24, v25);
  v20 = objc_msgSend_container(self, v18, v19);
  objc_msgSend_performRequest_(v20, v21, (uint64_t)v11);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (CKDAssetTokenRequest)assetTokenRequest
{
  return self->_assetTokenRequest;
}

- (void)setAssetTokenRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end