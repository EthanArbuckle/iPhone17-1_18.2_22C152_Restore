@interface CKDeclineSharesOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKDeclineSharesOperationInfo)initWithCoder:(id)a3;
- (NSArray)shareMetadatasToDecline;
- (int64_t)databaseScope;
- (void)encodeWithCoder:(id)a3;
- (void)setShareMetadatasToDecline:(id)a3;
@end

@implementation CKDeclineSharesOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v9 = objc_msgSend_shareMetadatasToDecline(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"ShareMetadatasToDecline");

  v11.receiver = self;
  v11.super_class = (Class)CKDeclineSharesOperationInfo;
  [(CKDatabaseOperationInfo *)&v11 encodeWithCoder:v4];
}

- (CKDeclineSharesOperationInfo)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDeclineSharesOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v18, 2);
    v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"ShareMetadatasToDecline");
    shareMetadatasToDecline = v5->_shareMetadatasToDecline;
    v5->_shareMetadatasToDecline = (NSArray *)v14;
  }

  return v5;
}

- (int64_t)databaseScope
{
  return 3;
}

- (NSArray)shareMetadatasToDecline
{
  return self->_shareMetadatasToDecline;
}

- (void)setShareMetadatasToDecline:(id)a3
{
}

- (void).cxx_destruct
{
}

@end