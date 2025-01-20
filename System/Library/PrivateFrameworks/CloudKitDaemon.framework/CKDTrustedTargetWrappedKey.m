@interface CKDTrustedTargetWrappedKey
- (CKDTrustedTargetWrappedKey)initWithWrappedKey:(id)a3 publicKey:(id)a4;
- (CKPublicKey)publicKey;
- (NSData)wrappedKey;
@end

@implementation CKDTrustedTargetWrappedKey

- (CKDTrustedTargetWrappedKey)initWithWrappedKey:(id)a3 publicKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKDTrustedTargetWrappedKey;
  v10 = [(CKDTrustedTargetWrappedKey *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    wrappedKey = v10->_wrappedKey;
    v10->_wrappedKey = (NSData *)v11;

    objc_storeStrong((id *)&v10->_publicKey, a4);
  }

  return v10;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (CKPublicKey)publicKey
{
  return self->_publicKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
}

@end