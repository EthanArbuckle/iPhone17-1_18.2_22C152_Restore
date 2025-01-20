@interface CKDWrappingContext
- (CKDWrappingContext)initWithRecordID:(id)a3 fieldName:(id)a4;
- (CKDWrappingContext)initWithRecordID:(id)a3 fieldName:(id)a4 mergeableDeltaID:(id)a5 fileSignature:(id)a6 referenceSignature:(id)a7;
- (CKMergeableDeltaID)mergeableDeltaID;
- (CKRecordID)recordID;
- (NSData)fileSignature;
- (NSData)referenceSignature;
- (NSString)fieldName;
- (id)assetContextString;
- (id)encryptedDataContextString;
- (void)setFieldName:(id)a3;
- (void)setFileSignature:(id)a3;
- (void)setMergeableDeltaID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setReferenceSignature:(id)a3;
@end

@implementation CKDWrappingContext

- (CKDWrappingContext)initWithRecordID:(id)a3 fieldName:(id)a4
{
  return (CKDWrappingContext *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(self, a2, (uint64_t)a3, a4, 0, 0, 0);
}

- (CKDWrappingContext)initWithRecordID:(id)a3 fieldName:(id)a4 mergeableDeltaID:(id)a5 fileSignature:(id)a6 referenceSignature:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v27 = a7;
  if (v13 && v14)
  {
    v28.receiver = self;
    v28.super_class = (Class)CKDWrappingContext;
    v17 = [(CKDWrappingContext *)&v28 init];
    if (v17)
    {
      id v18 = (id)CKProcessIndexedArrayKey();
      id v19 = 0;
      v20 = v19;
      if (v19)
      {
        id v26 = v16;
        id v21 = v15;
        id v22 = v19;

        id v14 = v22;
        id v15 = v21;
        id v16 = v26;
      }
      objc_storeStrong((id *)&v17->_recordID, a3);
      objc_storeStrong((id *)&v17->_fieldName, v14);
      objc_storeStrong((id *)&v17->_mergeableDeltaID, a5);
      objc_storeStrong((id *)&v17->_fileSignature, a6);
      objc_storeStrong((id *)&v17->_referenceSignature, a7);
    }
    self = v17;
    v23 = self;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v24 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v13;
      __int16 v31 = 2114;
      id v32 = v14;
      _os_log_fault_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_FAULT, "Wrapping context requires a non-nil recordID and field. RecordID: %@, field: %{public}@", buf, 0x16u);
    }
    v23 = 0;
  }

  return v23;
}

- (id)assetContextString
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_fileSignature(self, a2, v2);
  if (!v4
    || (v7 = (void *)v4,
        objc_msgSend_referenceSignature(self, v5, v6),
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v11 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_FAULT))
    {
      v60 = v11;
      v63 = objc_msgSend_fileSignature(self, v61, v62);
      v66 = objc_msgSend_referenceSignature(self, v64, v65);
      *(_DWORD *)buf = 138412546;
      v68 = v63;
      __int16 v69 = 2112;
      v70 = v66;
      _os_log_fault_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_FAULT, "Invalid wrapping context for generating asset context string. File signature: %@. Reference signature: %@.", buf, 0x16u);
    }
  }
  v12 = (void *)MEMORY[0x1E4F28E78];
  id v13 = objc_msgSend_recordID(self, v9, v10);
  id v16 = objc_msgSend_zoneID(v13, v14, v15);
  id v19 = objc_msgSend_zoneName(v16, v17, v18);
  id v22 = objc_msgSend_recordID(self, v20, v21);
  v25 = objc_msgSend_recordName(v22, v23, v24);
  objc_super v28 = objc_msgSend_fieldName(self, v26, v27);
  id v30 = objc_msgSend_stringWithFormat_(v12, v29, @"%@-%@-%@", v19, v25, v28);

  uint64_t v33 = objc_msgSend_mergeableDeltaID(self, v31, v32);

  if (v33)
  {
    v36 = objc_msgSend_mergeableDeltaID(self, v34, v35);
    v39 = objc_msgSend_valueID(v36, v37, v38);
    v42 = objc_msgSend_name(v39, v40, v41);
    v45 = objc_msgSend_mergeableDeltaID(self, v43, v44);
    v48 = objc_msgSend_deltaIdentifier(v45, v46, v47);
    objc_msgSend_appendFormat_(v30, v49, @"-%@-%@", v42, v48);
  }
  v50 = objc_msgSend_fileSignature(self, v34, v35);
  v52 = objc_msgSend_base64EncodedStringWithOptions_(v50, v51, 0);
  v55 = objc_msgSend_referenceSignature(self, v53, v54);
  v57 = objc_msgSend_base64EncodedStringWithOptions_(v55, v56, 0);
  objc_msgSend_appendFormat_(v30, v58, @"-%@-%@", v52, v57);

  return v30;
}

- (id)encryptedDataContextString
{
  uint64_t v4 = NSString;
  v5 = objc_msgSend_recordID(self, a2, v2);
  v8 = objc_msgSend_zoneID(v5, v6, v7);
  v11 = objc_msgSend_zoneName(v8, v9, v10);
  id v14 = objc_msgSend_recordID(self, v12, v13);
  v17 = objc_msgSend_recordName(v14, v15, v16);
  v20 = objc_msgSend_fieldName(self, v18, v19);
  id v22 = objc_msgSend_stringWithFormat_(v4, v21, @"%@-%@-%@", v11, v17, v20);

  return v22;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (CKMergeableDeltaID)mergeableDeltaID
{
  return self->_mergeableDeltaID;
}

- (void)setMergeableDeltaID:(id)a3
{
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (void)setFileSignature:(id)a3
{
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void)setReferenceSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaID, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end