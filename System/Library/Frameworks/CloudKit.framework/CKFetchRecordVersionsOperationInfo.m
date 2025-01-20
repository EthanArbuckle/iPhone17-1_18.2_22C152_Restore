@interface CKFetchRecordVersionsOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldFetchAssetContent;
- (CKFetchRecordVersionsOperationInfo)init;
- (CKFetchRecordVersionsOperationInfo)initWithCoder:(id)a3;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (NSString)minimumVersionETag;
- (void)encodeWithCoder:(id)a3;
- (void)setDesiredKeys:(id)a3;
- (void)setMinimumVersionETag:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
@end

@implementation CKFetchRecordVersionsOperationInfo

- (CKFetchRecordVersionsOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordVersionsOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result) {
    result->_shouldFetchAssetContent = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v10.receiver = self;
  v10.super_class = (Class)CKFetchRecordVersionsOperationInfo;
  [(CKDatabaseOperationInfo *)&v10 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_recordIDs, @"RecordIDs");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_desiredKeys, @"DesiredKeys");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_minimumVersionETag, @"MinimumVersionETag");
  objc_msgSend_encodeBool_forKey_(v4, v9, self->_shouldFetchAssetContent, @"shouldFetchAssetContents");
}

- (CKFetchRecordVersionsOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKFetchRecordVersionsOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v32 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"RecordIDs");
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    uint64_t v23 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"DesiredKeys");
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"MinimumVersionETag");
    minimumVersionETag = v5->_minimumVersionETag;
    v5->_minimumVersionETag = (NSString *)v27;

    v5->_shouldFetchAssetContent = objc_msgSend_decodeBoolForKey_(v4, v29, @"shouldFetchAssetContents", v30);
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

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (NSString)minimumVersionETag
{
  return self->_minimumVersionETag;
}

- (void)setMinimumVersionETag:(id)a3
{
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumVersionETag, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);

  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end