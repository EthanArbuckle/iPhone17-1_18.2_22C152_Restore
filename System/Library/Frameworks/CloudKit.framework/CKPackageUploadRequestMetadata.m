@interface CKPackageUploadRequestMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKPackageUploadRequestMetadata)initWithCoder:(id)a3;
- (CKPackageUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7;
- (CKPackageUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignatures:(id)a8 referenceSignatures:(id)a9;
- (NSArray)fileSignatures;
- (NSArray)referenceSignatures;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKPackageUploadRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKPackageUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7
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

- (CKPackageUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7 fileSignatures:(id)a8 referenceSignatures:(id)a9
{
  id v15 = a8;
  id v16 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CKPackageUploadRequestMetadata;
  v20 = [(CKUploadRequestMetadata *)&v29 initWithRepairZoneRecordID:a3 databaseScope:a4 recordID:a5 recordType:a6 fieldName:a7];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_CKDeepCopy(v15, v17, v18, v19);
    fileSignatures = v20->_fileSignatures;
    v20->_fileSignatures = (NSArray *)v21;

    uint64_t v26 = objc_msgSend_CKDeepCopy(v16, v23, v24, v25);
    referenceSignatures = v20->_referenceSignatures;
    v20->_referenceSignatures = (NSArray *)v26;
  }
  return v20;
}

- (CKPackageUploadRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKPackageUploadRequestMetadata;
  v5 = [(CKUploadRequestMetadata *)&v28 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    id v13 = NSStringFromSelector(sel_fileSignatures);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    fileSignatures = v5->_fileSignatures;
    v5->_fileSignatures = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v23 = NSStringFromSelector(sel_referenceSignatures);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    referenceSignatures = v5->_referenceSignatures;
    v5->_referenceSignatures = (NSArray *)v25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v18.receiver = self;
  v18.super_class = (Class)CKPackageUploadRequestMetadata;
  [(CKUploadRequestMetadata *)&v18 encodeWithCoder:v4];
  uint64_t v9 = objc_msgSend_fileSignatures(self, v6, v7, v8);
  v10 = NSStringFromSelector(sel_fileSignatures);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  uint64_t v15 = objc_msgSend_referenceSignatures(self, v12, v13, v14);
  id v16 = NSStringFromSelector(sel_referenceSignatures);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);
}

- (unint64_t)hash
{
  v21.receiver = self;
  v21.super_class = (Class)CKPackageUploadRequestMetadata;
  unint64_t v3 = [(CKUploadRequestMetadata *)&v21 hash];
  uint64_t v7 = objc_msgSend_fileSignatures(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_hash(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_referenceSignatures(self, v12, v13, v14);
  unint64_t v19 = v11 ^ objc_msgSend_hash(v15, v16, v17, v18) ^ v3;

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKPackageUploadRequestMetadata;
  if ([(CKUploadRequestMetadata *)&v29 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_fileSignatures(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_fileSignatures(v5, v10, v11, v12);
    int isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);

    if (isEqual)
    {
      v20 = objc_msgSend_referenceSignatures(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_referenceSignatures(v5, v21, v22, v23);
      char v27 = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);
    }
    else
    {
      char v27 = 0;
    }
  }
  else
  {
    char v27 = 0;
  }

  return v27;
}

- (NSArray)fileSignatures
{
  return self->_fileSignatures;
}

- (NSArray)referenceSignatures
{
  return self->_referenceSignatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignatures, 0);

  objc_storeStrong((id *)&self->_fileSignatures, 0);
}

@end