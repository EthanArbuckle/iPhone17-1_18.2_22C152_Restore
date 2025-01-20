@interface CKDPushToken
- (BOOL)isEqual:(id)a3;
- (CKDPushToken)initWithAPSEnvironmentString:(id)a3 apsToken:(id)a4;
- (NSData)apsToken;
- (NSString)apsEnvironmentString;
- (unint64_t)hash;
@end

@implementation CKDPushToken

- (CKDPushToken)initWithAPSEnvironmentString:(id)a3 apsToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDPushToken;
  v10 = [(CKDPushToken *)&v18 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    apsEnvironmentString = v10->_apsEnvironmentString;
    v10->_apsEnvironmentString = (NSString *)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    apsToken = v10->_apsToken;
    v10->_apsToken = (NSData *)v15;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDPushToken *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v8 = objc_msgSend_apsToken(self, v6, v7);
      uint64_t v11 = objc_msgSend_apsToken(v5, v9, v10);
      int v12 = CKObjectsAreBothNilOrEqual();

      if (v12)
      {
        uint64_t v15 = objc_msgSend_apsEnvironmentString(self, v13, v14);
        objc_super v18 = objc_msgSend_apsEnvironmentString(v5, v16, v17);
        char v19 = CKObjectsAreBothNilOrEqual();
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_apsToken(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  uint64_t v10 = objc_msgSend_apsEnvironmentString(self, v8, v9);
  unint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  return v13;
}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (NSData)apsToken
{
  return self->_apsToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsToken, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
}

@end