@interface CKAssetDownloadPreauthorization
- (BOOL)isEqual:(id)a3;
- (CKAssetDownloadPreauthorization)initWithResponseUUID:(id)a3 contentResponseHeaders:(id)a4 contentResponseBody:(id)a5;
- (NSData)contentResponseBody;
- (NSDictionary)contentResponseHeaders;
- (NSString)responseUUID;
- (unint64_t)hash;
@end

@implementation CKAssetDownloadPreauthorization

- (CKAssetDownloadPreauthorization)initWithResponseUUID:(id)a3 contentResponseHeaders:(id)a4 contentResponseBody:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v30.receiver = self;
    v30.super_class = (Class)CKAssetDownloadPreauthorization;
    v16 = [(CKAssetDownloadPreauthorization *)&v30 init];
    if (v16)
    {
      uint64_t v17 = objc_msgSend_copy(v8, v13, v14, v15);
      responseUUID = v16->_responseUUID;
      v16->_responseUUID = (NSString *)v17;

      uint64_t v22 = objc_msgSend_CKDeepCopy(v9, v19, v20, v21);
      contentResponseHeaders = v16->_contentResponseHeaders;
      v16->_contentResponseHeaders = (NSDictionary *)v22;

      uint64_t v27 = objc_msgSend_copy(v11, v24, v25, v26);
      contentResponseBody = v16->_contentResponseBody;
      v16->_contentResponseBody = (NSData *)v27;
    }
    self = v16;
    v12 = self;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKAssetDownloadPreauthorization *)a3;
  if (v4 == self)
  {
    char isEqualToString = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKAssetDownloadPreauthorization;
    if ([(CKAssetDownloadPreauthorization *)&v17 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = objc_msgSend_responseUUID(v4, v5, v6, v7);
      v12 = objc_msgSend_responseUUID(self, v9, v10, v11);
      char isEqualToString = objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12, v14);
    }
    else
    {
      char isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_responseUUID(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSString)responseUUID
{
  return self->_responseUUID;
}

- (NSDictionary)contentResponseHeaders
{
  return self->_contentResponseHeaders;
}

- (NSData)contentResponseBody
{
  return self->_contentResponseBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentResponseBody, 0);
  objc_storeStrong((id *)&self->_contentResponseHeaders, 0);

  objc_storeStrong((id *)&self->_responseUUID, 0);
}

@end