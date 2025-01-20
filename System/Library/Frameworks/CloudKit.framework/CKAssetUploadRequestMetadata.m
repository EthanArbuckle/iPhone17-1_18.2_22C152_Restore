@interface CKAssetUploadRequestMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKAssetUploadRequestMetadata)initWithCoder:(id)a3;
- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7;
- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignature:(id)a8 referenceSignature:(id)a9;
- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignature:(id)a8 referenceSignature:(id)a9 listIndex:(int64_t)a10;
- (NSData)fileSignature;
- (NSData)referenceSignature;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (int64_t)listIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKAssetUploadRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [CKException alloc];
  uint64_t v16 = *MEMORY[0x1E4F1C3C8];
  v17 = NSStringFromSelector(a2);
  id v19 = (id)objc_msgSend_initWithName_format_(v15, v18, v16, @"%@ is unavailable", v17);

  objc_exception_throw(v19);
}

- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignature:(id)a8 referenceSignature:(id)a9
{
  return (CKAssetUploadRequestMetadata *)objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9, -1);
}

- (CKAssetUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignature:(id)a8 referenceSignature:(id)a9 listIndex:(int64_t)a10
{
  id v16 = a8;
  id v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)CKAssetUploadRequestMetadata;
  v21 = [(CKUploadRequestMetadata *)&v30 initWithRepairZoneRecordID:a3 databaseScope:a4 recordID:a5 recordType:a6 fieldName:a7];
  if (v21)
  {
    uint64_t v22 = objc_msgSend_copy(v16, v18, v19, v20);
    fileSignature = v21->_fileSignature;
    v21->_fileSignature = (NSData *)v22;

    uint64_t v27 = objc_msgSend_copy(v17, v24, v25, v26);
    referenceSignature = v21->_referenceSignature;
    v21->_referenceSignature = (NSData *)v27;

    v21->_listIndex = a10;
  }

  return v21;
}

- (CKAssetUploadRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKAssetUploadRequestMetadata;
  v5 = [(CKUploadRequestMetadata *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    v7 = NSStringFromSelector(sel_listIndex);
    v5->_listIndex = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)v7, v9);

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_fileSignature);
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11);
    fileSignature = v5->_fileSignature;
    v5->_fileSignature = (NSData *)v13;

    uint64_t v15 = objc_opt_class();
    id v16 = NSStringFromSelector(sel_referenceSignature);
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    referenceSignature = v5->_referenceSignature;
    v5->_referenceSignature = (NSData *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v24.receiver = self;
  v24.super_class = (Class)CKAssetUploadRequestMetadata;
  [(CKUploadRequestMetadata *)&v24 encodeWithCoder:v4];
  uint64_t v9 = objc_msgSend_listIndex(self, v6, v7, v8);
  uint64_t v10 = NSStringFromSelector(sel_listIndex);
  objc_msgSend_encodeInteger_forKey_(v4, v11, v9, (uint64_t)v10);

  uint64_t v15 = objc_msgSend_fileSignature(self, v12, v13, v14);
  id v16 = NSStringFromSelector(sel_fileSignature);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  objc_super v21 = objc_msgSend_referenceSignature(self, v18, v19, v20);
  uint64_t v22 = NSStringFromSelector(sel_referenceSignature);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v21, (uint64_t)v22);
}

- (unint64_t)hash
{
  v25.receiver = self;
  v25.super_class = (Class)CKAssetUploadRequestMetadata;
  unint64_t v3 = [(CKUploadRequestMetadata *)&v25 hash];
  uint64_t v7 = objc_msgSend_listIndex(self, v4, v5, v6);
  id v11 = objc_msgSend_fileSignature(self, v8, v9, v10);
  uint64_t v15 = v7 ^ objc_msgSend_hash(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_referenceSignature(self, v16, v17, v18);
  unint64_t v23 = v15 ^ objc_msgSend_hash(v19, v20, v21, v22) ^ v3;

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKAssetUploadRequestMetadata;
  if ([(CKUploadRequestMetadata *)&v36 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_listIndex(self, v6, v7, v8);
    if (v9 == objc_msgSend_listIndex(v5, v10, v11, v12)
      && (objc_msgSend_fileSignature(self, v13, v14, v15),
          id v16 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_fileSignature(v5, v17, v18, v19),
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          int v23 = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22),
          v20,
          v16,
          v23))
    {
      uint64_t v27 = objc_msgSend_referenceSignature(self, v24, v25, v26);
      v31 = objc_msgSend_referenceSignature(v5, v28, v29, v30);
      char isEqual = objc_msgSend_isEqual_(v27, v32, (uint64_t)v31, v33);
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CKAssetUploadRequestMetadata;
  uint64_t v7 = [(CKUploadRequestMetadata *)&v25 CKDescriptionPropertiesWithPublic:a3 private:a4 shouldExpand:a5];
  uint64_t v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);

  if (v5 && objc_msgSend_listIndex(self, v12, v13, v14) != -1)
  {
    uint64_t v18 = NSNumber;
    uint64_t v19 = objc_msgSend_listIndex(self, v15, v16, v17);
    uint64_t v22 = objc_msgSend_numberWithInteger_(v18, v20, v19, v21);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v23, @"listIndex", (uint64_t)v22);
  }

  return v11;
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignature, 0);

  objc_storeStrong((id *)&self->_fileSignature, 0);
}

@end