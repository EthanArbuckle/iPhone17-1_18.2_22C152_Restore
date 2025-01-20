@interface CKPackageSection
- (CKPackageSection)initWithIndex:(int64_t)a3 signature:(id)a4 size:(unint64_t)a5 paddedSize:(unint64_t)a6 verificationKey:(id)a7;
- (NSData)signature;
- (NSData)verificationKey;
- (id)CKPropertiesDescription;
- (id)description;
- (int64_t)index;
- (unint64_t)paddedSize;
- (unint64_t)size;
@end

@implementation CKPackageSection

- (CKPackageSection)initWithIndex:(int64_t)a3 signature:(id)a4 size:(unint64_t)a5 paddedSize:(unint64_t)a6 verificationKey:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CKPackageSection;
  v14 = [(CKPackageSection *)&v27 init];
  v18 = v14;
  if (v14)
  {
    v14->_index = a3;
    uint64_t v19 = objc_msgSend_copy(v12, v15, v16, v17);
    signature = v18->_signature;
    v18->_signature = (NSData *)v19;

    uint64_t v24 = objc_msgSend_copy(v13, v21, v22, v23);
    verificationKey = v18->_verificationKey;
    v18->_verificationKey = (NSData *)v24;

    v18->_size = a5;
    v18->_paddedSize = a6;
  }

  return v18;
}

- (id)CKPropertiesDescription
{
  v5 = NSString;
  uint64_t v6 = objc_msgSend_index(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_size(self, v7, v8, v9);
  v14 = objc_msgSend_signature(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_paddedSize(self, v15, v16, v17);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"index=%ld, size=%llu, signature=%@, paddedSize=%llu", v20, v6, v10, v14, v18);

  return v21;
}

- (id)description
{
  return (id)((uint64_t (*)(CKPackageSection *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (int64_t)index
{
  return self->_index;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)paddedSize
{
  return self->_paddedSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationKey, 0);

  objc_storeStrong((id *)&self->_signature, 0);
}

@end