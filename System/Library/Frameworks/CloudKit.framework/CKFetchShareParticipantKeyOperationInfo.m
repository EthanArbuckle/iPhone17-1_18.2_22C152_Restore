@interface CKFetchShareParticipantKeyOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKFetchShareParticipantKeyOperationInfo)initWithCoder:(id)a3;
- (NSArray)shareIDs;
- (NSDictionary)baseTokensByShareID;
- (NSDictionary)childRecordIDsByShareID;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseTokensByShareID:(id)a3;
- (void)setChildRecordIDsByShareID:(id)a3;
- (void)setShareIDs:(id)a3;
@end

@implementation CKFetchShareParticipantKeyOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v21.receiver = self;
  v21.super_class = (Class)CKFetchShareParticipantKeyOperationInfo;
  [(CKDatabaseOperationInfo *)&v21 encodeWithCoder:v4];
  v9 = objc_msgSend_shareIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"ShareIDs");

  v14 = objc_msgSend_baseTokensByShareID(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"BaseTokensByShareID");

  v19 = objc_msgSend_childRecordIDsByShareID(self, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"ChildRecordIDsByShareID");
}

- (CKFetchShareParticipantKeyOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKFetchShareParticipantKeyOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v36 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"ShareIDs");
    shareIDs = v5->_shareIDs;
    v5->_shareIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v16, v20, v17, v21, v18, v19, 0);
    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"BaseTokensByShareID");
    baseTokensByShareID = v5->_baseTokensByShareID;
    v5->_baseTokensByShareID = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v31 = objc_msgSend_setWithObjects_(v26, v29, v27, v30, v28, 0);
    uint64_t v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, @"ChildRecordIDsByShareID");
    childRecordIDsByShareID = v5->_childRecordIDsByShareID;
    v5->_childRecordIDsByShareID = (NSDictionary *)v33;
  }

  return v5;
}

- (NSDictionary)baseTokensByShareID
{
  return self->_baseTokensByShareID;
}

- (void)setBaseTokensByShareID:(id)a3
{
}

- (NSDictionary)childRecordIDsByShareID
{
  return self->_childRecordIDsByShareID;
}

- (void)setChildRecordIDsByShareID:(id)a3
{
}

- (NSArray)shareIDs
{
  return self->_shareIDs;
}

- (void)setShareIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIDs, 0);
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, 0);

  objc_storeStrong((id *)&self->_baseTokensByShareID, 0);
}

@end