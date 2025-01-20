@interface CKPublishAssetsOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKPublishAssetsOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordIDs;
- (NSDictionary)fileNamesByAssetFieldNames;
- (unint64_t)URLOptions;
- (unint64_t)requestedTTL;
- (void)encodeWithCoder:(id)a3;
- (void)setFileNamesByAssetFieldNames:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRequestedTTL:(unint64_t)a3;
- (void)setURLOptions:(unint64_t)a3;
@end

@implementation CKPublishAssetsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v26.receiver = self;
  v26.super_class = (Class)CKPublishAssetsOperationInfo;
  [(CKDatabaseOperationInfo *)&v26 encodeWithCoder:v4];
  v9 = objc_msgSend_recordIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"recordIDs");

  v14 = objc_msgSend_fileNamesByAssetFieldNames(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"fileNamesByAssetFieldNames");

  uint64_t v19 = objc_msgSend_requestedTTL(self, v16, v17, v18);
  objc_msgSend_encodeInt64_forKey_(v4, v20, v19, @"requestedTTL");
  uint64_t v24 = objc_msgSend_URLOptions(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, @"URLOptions");
}

- (CKPublishAssetsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CKPublishAssetsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v30 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"recordIDs");
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    uint64_t v23 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"fileNamesByAssetFieldNames");
    fileNamesByAssetFieldNames = v5->_fileNamesByAssetFieldNames;
    v5->_fileNamesByAssetFieldNames = (NSDictionary *)v23;

    v5->_requestedTTL = objc_msgSend_decodeInt64ForKey_(v4, v25, @"requestedTTL", v26);
    v5->_URLOptions = objc_msgSend_decodeInt64ForKey_(v4, v27, @"URLOptions", v28);
  }

  return v5;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSDictionary)fileNamesByAssetFieldNames
{
  return self->_fileNamesByAssetFieldNames;
}

- (void)setFileNamesByAssetFieldNames:(id)a3
{
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, 0);

  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end