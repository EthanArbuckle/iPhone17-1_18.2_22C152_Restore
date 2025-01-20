@interface CKDChainPCSData
+ (BOOL)supportsSecureCoding;
- (CKDChainPCSData)initWithCoder:(id)a3;
- (CKDChainPCSData)initWithPCSData:(id)a3 encryptedPrivateKey:(id)a4;
- (CKEncryptedData)encryptedChainPCSPrivateKey;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptedChainPCSPrivateKey:(id)a3;
@end

@implementation CKDChainPCSData

- (CKDChainPCSData)initWithPCSData:(id)a3 encryptedPrivateKey:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDChainPCSData;
  v8 = [(CKDPCSData *)&v11 initWithPCSData:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_encryptedChainPCSPrivateKey, a4);
  }

  return v9;
}

- (id)CKPropertiesDescription
{
  v3 = (void *)MEMORY[0x1C8789E70](self, a2);
  v16.receiver = self;
  v16.super_class = (Class)CKDChainPCSData;
  v4 = [(CKDPCSData *)&v16 CKPropertiesDescription];
  id v7 = objc_msgSend_mutableCopy(v4, v5, v6);

  v10 = objc_msgSend_encryptedChainPCSPrivateKey(self, v8, v9);

  if (v10)
  {
    v13 = objc_msgSend_encryptedChainPCSPrivateKey(self, v11, v12);
    objc_msgSend_appendFormat_(v7, v14, @", encryptedChainPCSPrivateKey=%@", v13);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKDChainPCSData;
  id v4 = [(CKDPCSData *)&v13 copyWithZone:a3];
  id v7 = objc_msgSend_encryptedChainPCSPrivateKey(self, v5, v6);
  v10 = objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setEncryptedChainPCSPrivateKey_(v4, v11, (uint64_t)v10);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C8789E70]();
  v7.receiver = self;
  v7.super_class = (Class)CKDChainPCSData;
  [(CKDPCSData *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_encryptedChainPCSPrivateKey, @"ChainPrivateKey");
}

- (CKDChainPCSData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDChainPCSData;
  v5 = [(CKDPCSData *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"ChainPrivateKey");
    encryptedChainPCSPrivateKey = v5->_encryptedChainPCSPrivateKey;
    v5->_encryptedChainPCSPrivateKey = (CKEncryptedData *)v9;
  }

  return v5;
}

- (CKEncryptedData)encryptedChainPCSPrivateKey
{
  return self->_encryptedChainPCSPrivateKey;
}

- (void)setEncryptedChainPCSPrivateKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end