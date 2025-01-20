@interface CKFetchDatabaseChangesOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchAllChanges;
- (CKFetchDatabaseChangesOperationInfo)init;
- (CKFetchDatabaseChangesOperationInfo)initWithCoder:(id)a3;
- (CKServerChangeToken)previousServerChangeToken;
- (unint64_t)resultsLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchAllChanges:(BOOL)a3;
- (void)setPreviousServerChangeToken:(id)a3;
- (void)setResultsLimit:(unint64_t)a3;
@end

@implementation CKFetchDatabaseChangesOperationInfo

- (CKFetchDatabaseChangesOperationInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchDatabaseChangesOperationInfo;
  result = [(CKOperationInfo *)&v3 init];
  if (result) {
    result->_fetchAllChanges = 1;
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
  v21.receiver = self;
  v21.super_class = (Class)CKFetchDatabaseChangesOperationInfo;
  [(CKDatabaseOperationInfo *)&v21 encodeWithCoder:v4];
  v9 = objc_msgSend_previousServerChangeToken(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"previousServerChangeToken");

  uint64_t v14 = objc_msgSend_resultsLimit(self, v11, v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v15, v14, @"resultsLimit");
  uint64_t AllChanges = objc_msgSend_fetchAllChanges(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AllChanges, @"fetchAllChanges");
}

- (CKFetchDatabaseChangesOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKFetchDatabaseChangesOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"previousServerChangeToken");
    previousServerChangeToken = v5->_previousServerChangeToken;
    v5->_previousServerChangeToken = (CKServerChangeToken *)v9;

    v5->_resultsLimit = objc_msgSend_decodeIntegerForKey_(v4, v11, @"resultsLimit", v12);
    v5->_fetchuint64_t AllChanges = objc_msgSend_decodeBoolForKey_(v4, v13, @"fetchAllChanges", v14);
  }

  return v5;
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchuint64_t AllChanges = a3;
}

- (void).cxx_destruct
{
}

@end