@interface CKUploadMergeableDeltasOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKUploadMergeableDeltasOperationInfo)initWithCoder:(id)a3;
- (NSArray)deltas;
- (NSArray)replacementRequests;
- (void)encodeWithCoder:(id)a3;
- (void)setDeltas:(id)a3;
- (void)setReplacementRequests:(id)a3;
@end

@implementation CKUploadMergeableDeltasOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v18.receiver = self;
  v18.super_class = (Class)CKUploadMergeableDeltasOperationInfo;
  [(CKDatabaseOperationInfo *)&v18 encodeWithCoder:v4];
  v9 = objc_msgSend_deltas(self, v6, v7, v8);
  v10 = NSStringFromSelector(sel_deltas);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  v15 = objc_msgSend_replacementRequests(self, v12, v13, v14);
  v16 = NSStringFromSelector(sel_replacementRequests);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);
}

- (CKUploadMergeableDeltasOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKUploadMergeableDeltasOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v28 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v13 = NSStringFromSelector(sel_deltas);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    deltas = v5->_deltas;
    v5->_deltas = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v23 = NSStringFromSelector(sel_replacementRequests);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    replacementRequests = v5->_replacementRequests;
    v5->_replacementRequests = (NSArray *)v25;
  }

  return v5;
}

- (NSArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
}

- (NSArray)replacementRequests
{
  return self->_replacementRequests;
}

- (void)setReplacementRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementRequests, 0);

  objc_storeStrong((id *)&self->_deltas, 0);
}

@end