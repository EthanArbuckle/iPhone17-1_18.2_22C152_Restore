@interface CKMergeableDeltaMetadataReplacementValues
- (CKMergeableDeltaMetadata)updatedNextDeltaMetadata;
- (CKMergeableDeltaMetadataReplacementValues)init;
- (NSDictionary)replacementDeltaMetadatas;
- (NSSet)removableDeltaMetadatas;
- (id)description;
- (void)setRemovableDeltaMetadatas:(id)a3;
- (void)setReplacementDeltaMetadatas:(id)a3;
- (void)setUpdatedNextDeltaMetadata:(id)a3;
@end

@implementation CKMergeableDeltaMetadataReplacementValues

- (CKMergeableDeltaMetadataReplacementValues)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKMergeableDeltaMetadataReplacementValues;
  v2 = [(CKMergeableDeltaMetadataReplacementValues *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    replacementDeltaMetadatas = v2->_replacementDeltaMetadatas;
    v2->_replacementDeltaMetadatas = (NSDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    removableDeltaMetadatas = v2->_removableDeltaMetadatas;
    v2->_removableDeltaMetadatas = (NSSet *)v5;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_appendFormat_(v3, v6, @"<%@ %p;", v7, v5, self);

  v11 = objc_msgSend_replacementDeltaMetadatas(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_count(v11, v12, v13, v14);

  if (v15)
  {
    v19 = objc_msgSend_replacementDeltaMetadatas(self, v16, v17, v18);
    objc_msgSend_appendFormat_(v3, v20, @" replacementDeltaMetadatas=%@", v21, v19);
  }
  v22 = objc_msgSend_removableDeltaMetadatas(self, v16, v17, v18);
  uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

  if (v26)
  {
    v30 = objc_msgSend_removableDeltaMetadatas(self, v27, v28, v29);
    objc_msgSend_appendFormat_(v3, v31, @", removableDeltaMetadatas=%@", v32, v30);
  }
  v33 = objc_msgSend_updatedNextDeltaMetadata(self, v27, v28, v29);

  if (v33)
  {
    v37 = objc_msgSend_updatedNextDeltaMetadata(self, v34, v35, v36);
    objc_msgSend_appendFormat_(v3, v38, @", updatedNextDeltaMetadata=%@", v39, v37);
  }
  objc_msgSend_appendFormat_(v3, v34, @">", v36);

  return v3;
}

- (NSDictionary)replacementDeltaMetadatas
{
  return self->_replacementDeltaMetadatas;
}

- (void)setReplacementDeltaMetadatas:(id)a3
{
}

- (NSSet)removableDeltaMetadatas
{
  return self->_removableDeltaMetadatas;
}

- (void)setRemovableDeltaMetadatas:(id)a3
{
}

- (CKMergeableDeltaMetadata)updatedNextDeltaMetadata
{
  return self->_updatedNextDeltaMetadata;
}

- (void)setUpdatedNextDeltaMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedNextDeltaMetadata, 0);
  objc_storeStrong((id *)&self->_removableDeltaMetadatas, 0);

  objc_storeStrong((id *)&self->_replacementDeltaMetadatas, 0);
}

@end