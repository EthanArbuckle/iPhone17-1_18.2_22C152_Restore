@interface CKFetchWebAuthTokenOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKFetchWebAuthTokenOperationInfo)initWithCoder:(id)a3;
- (NSString)APIToken;
- (void)encodeWithCoder:(id)a3;
- (void)setAPIToken:(id)a3;
@end

@implementation CKFetchWebAuthTokenOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v11.receiver = self;
  v11.super_class = (Class)CKFetchWebAuthTokenOperationInfo;
  [(CKDatabaseOperationInfo *)&v11 encodeWithCoder:v4];
  v9 = objc_msgSend_APIToken(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"APIToken");
}

- (CKFetchWebAuthTokenOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFetchWebAuthTokenOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"APIToken");
    APIToken = v5->_APIToken;
    v5->_APIToken = (NSString *)v9;
  }

  return v5;
}

- (NSString)APIToken
{
  return self->_APIToken;
}

- (void)setAPIToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end