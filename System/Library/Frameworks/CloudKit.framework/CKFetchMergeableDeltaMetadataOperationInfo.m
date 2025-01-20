@interface CKFetchMergeableDeltaMetadataOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKFetchMergeableDeltaMetadataOperationInfo)initWithCoder:(id)a3;
- (NSArray)mergeableValueIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setMergeableValueIDs:(id)a3;
@end

@implementation CKFetchMergeableDeltaMetadataOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v12.receiver = self;
  v12.super_class = (Class)CKFetchMergeableDeltaMetadataOperationInfo;
  [(CKDatabaseOperationInfo *)&v12 encodeWithCoder:v4];
  v9 = objc_msgSend_mergeableValueIDs(self, v6, v7, v8);
  v10 = NSStringFromSelector(sel_mergeableValueIDs);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);
}

- (CKFetchMergeableDeltaMetadataOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKFetchMergeableDeltaMetadataOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    objc_super v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v13 = NSStringFromSelector(sel_mergeableValueIDs);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    mergeableValueIDs = v5->_mergeableValueIDs;
    v5->_mergeableValueIDs = (NSArray *)v15;
  }

  return v5;
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end