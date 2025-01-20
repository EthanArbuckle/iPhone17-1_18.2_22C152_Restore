@interface CKAcceptSharesOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKAcceptSharesOperationInfo)initWithCoder:(id)a3;
- (NSArray)shareMetadatasToAccept;
- (int64_t)databaseScope;
- (void)encodeWithCoder:(id)a3;
- (void)setShareMetadatasToAccept:(id)a3;
@end

@implementation CKAcceptSharesOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v9 = objc_msgSend_shareMetadatasToAccept(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"ShareMetadatasToAccept");

  v11.receiver = self;
  v11.super_class = (Class)CKAcceptSharesOperationInfo;
  [(CKDatabaseOperationInfo *)&v11 encodeWithCoder:v4];
}

- (CKAcceptSharesOperationInfo)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKAcceptSharesOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v18, 2);
    v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"ShareMetadatasToAccept");
    shareMetadatasToAccept = v5->_shareMetadatasToAccept;
    v5->_shareMetadatasToAccept = (NSArray *)v14;
  }

  return v5;
}

- (int64_t)databaseScope
{
  return 3;
}

- (NSArray)shareMetadatasToAccept
{
  return self->_shareMetadatasToAccept;
}

- (void)setShareMetadatasToAccept:(id)a3
{
}

- (void).cxx_destruct
{
}

@end