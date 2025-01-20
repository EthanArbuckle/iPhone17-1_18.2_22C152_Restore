@interface CKAssetReuploadExpectedProperties
+ (BOOL)supportsSecureCoding;
- (CKAssetReuploadExpectedProperties)initWithCoder:(id)a3;
- (CKAssetReuploadExpectedProperties)initWithFileSignature:(id)a3 referenceSignature:(id)a4 assetKey:(id)a5;
- (NSData)assetKey;
- (NSData)fileSignature;
- (NSData)referenceSignature;
- (id)CKPropertiesDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKAssetReuploadExpectedProperties

- (CKAssetReuploadExpectedProperties)initWithFileSignature:(id)a3 referenceSignature:(id)a4 assetKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKAssetReuploadExpectedProperties;
  v14 = [(CKAssetReuploadExpectedProperties *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    fileSignature = v14->_fileSignature;
    v14->_fileSignature = (NSData *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    referenceSignature = v14->_referenceSignature;
    v14->_referenceSignature = (NSData *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    assetKey = v14->_assetKey;
    v14->_assetKey = (NSData *)v25;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  id v8 = objc_msgSend_fileSignature(self, v5, v6, v7);
  id v9 = NSStringFromSelector(sel_fileSignature);
  objc_msgSend_encodeObject_forKey_(v23, v10, (uint64_t)v8, (uint64_t)v9);

  v14 = objc_msgSend_referenceSignature(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_referenceSignature);
  objc_msgSend_encodeObject_forKey_(v23, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_assetKey(self, v17, v18, v19);
  v21 = NSStringFromSelector(sel_assetKey);
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v20, (uint64_t)v21);
}

- (CKAssetReuploadExpectedProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKAssetReuploadExpectedProperties;
  v5 = [(CKAssetReuploadExpectedProperties *)&v23 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(sel_fileSignature);
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    fileSignature = v5->_fileSignature;
    v5->_fileSignature = (NSData *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(sel_referenceSignature);
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    referenceSignature = v5->_referenceSignature;
    v5->_referenceSignature = (NSData *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = NSStringFromSelector(sel_assetKey);
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    assetKey = v5->_assetKey;
    v5->_assetKey = (NSData *)v20;
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  id v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 2, v2);
  v5 = NSString;
  id v9 = objc_msgSend_fileSignature(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_CKHexString(v9, v10, v11, v12);
  v16 = objc_msgSend_stringWithFormat_(v5, v14, @"fileSignature=%@", v15, v13);
  objc_msgSend_addObject_(v4, v17, (uint64_t)v16, v18);

  uint64_t v19 = NSString;
  objc_super v23 = objc_msgSend_referenceSignature(self, v20, v21, v22);
  v27 = objc_msgSend_CKHexString(v23, v24, v25, v26);
  v30 = objc_msgSend_stringWithFormat_(v19, v28, @"referenceSignature=%@", v29, v27);
  objc_msgSend_addObject_(v4, v31, (uint64_t)v30, v32);

  v36 = objc_msgSend_assetKey(self, v33, v34, v35);

  if (v36) {
    objc_msgSend_addObject_(v4, v37, @"hasAssetKey", v38);
  }
  v39 = objc_msgSend_componentsJoinedByString_(v4, v37, @", ", v38);

  return v39;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetReuploadExpectedProperties *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (NSData)assetKey
{
  return self->_assetKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);

  objc_storeStrong((id *)&self->_fileSignature, 0);
}

@end