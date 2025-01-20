@interface CKDMarkAssetBrokenURLRequest
- (BOOL)writeRepairRecord;
- (CKDMarkAssetBrokenURLRequest)initWithOperation:(id)a3 assetOrPackageMetadata:(id)a4 writeRepairRecord:(BOOL)a5;
- (CKUploadRequestMetadata)metadata;
- (id)assetBrokenBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setAssetBrokenBlock:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setWriteRepairRecord:(BOOL)a3;
@end

@implementation CKDMarkAssetBrokenURLRequest

- (CKDMarkAssetBrokenURLRequest)initWithOperation:(id)a3 assetOrPackageMetadata:(id)a4 writeRepairRecord:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDMarkAssetBrokenURLRequest;
  v10 = [(CKDURLRequest *)&v13 initWithOperation:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_metadata, a4);
    v11->_writeRepairRecord = a5;
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKDMarkAssetBrokenURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v9 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_metadata(self, v5, v6, v9.receiver, v9.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"metadata");
}

- (void)fillOutRequestProperties:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_metadata(self, v5, v6);
  v10 = objc_msgSend_recordID(v7, v8, v9);
  v15[0] = v10;
  v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v15, 1);
  objc_msgSend_setModifyRecordIDs_(v4, v13, (uint64_t)v12);

  v14.receiver = self;
  v14.super_class = (Class)CKDMarkAssetBrokenURLRequest;
  [(CKDURLRequest *)&v14 fillOutRequestProperties:v4];
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  v83[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  uint64_t v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setMarkAssetBrokenRequest_(v6, v8, (uint64_t)v7);

  v11 = objc_msgSend_markAssetBrokenRequest(v6, v9, v10);
  objc_super v14 = objc_msgSend_metadata(self, v12, v13);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v19 = objc_msgSend_metadata(self, v16, v17);
  if (isKindOfClass)
  {
    objc_msgSend_setIsPackage_(v11, v18, 1);
    v22 = objc_msgSend_fileSignatures(v19, v20, v21);
    v25 = objc_msgSend_mutableCopy(v22, v23, v24);
    objc_msgSend_setFileSignatures_(v11, v26, (uint64_t)v25);

    v29 = objc_msgSend_referenceSignatures(v19, v27, v28);
    uint64_t v32 = objc_msgSend_mutableCopy(v29, v30, v31);
  }
  else
  {
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) == 0) {
      goto LABEL_6;
    }
    v19 = objc_msgSend_metadata(self, v35, v36);
    uint64_t v39 = objc_msgSend_listIndex(v19, v37, v38);
    objc_msgSend_setListIndex_(v11, v40, v39);
    v41 = (void *)MEMORY[0x1E4F1CA48];
    v44 = objc_msgSend_fileSignature(v19, v42, v43);
    v46 = objc_msgSend_arrayWithObject_(v41, v45, (uint64_t)v44);
    objc_msgSend_setFileSignatures_(v11, v47, (uint64_t)v46);

    v48 = (void *)MEMORY[0x1E4F1CA48];
    v29 = objc_msgSend_referenceSignature(v19, v49, v50);
    uint64_t v32 = objc_msgSend_arrayWithObject_(v48, v51, (uint64_t)v29);
  }
  v52 = (void *)v32;
  objc_msgSend_setReferenceSignatures_(v11, v33, v32);

LABEL_6:
  v53 = objc_msgSend_translator(self, v35, v36);
  v56 = objc_msgSend_metadata(self, v54, v55);
  v59 = objc_msgSend_recordID(v56, v57, v58);
  v61 = objc_msgSend_pRecordIdentifierFromRecordID_(v53, v60, (uint64_t)v59);
  objc_msgSend_setBrokenAssetRecordID_(v11, v62, (uint64_t)v61);

  v65 = objc_msgSend_metadata(self, v63, v64);
  v68 = objc_msgSend_fieldName(v65, v66, v67);
  objc_msgSend_setFieldName_(v11, v69, (uint64_t)v68);

  v72 = objc_msgSend_metadata(self, v70, v71);
  v75 = objc_msgSend_recordType(v72, v73, v74);
  objc_msgSend_setAffectedRecordType_(v11, v76, (uint64_t)v75);

  if ((objc_msgSend_writeRepairRecord(self, v77, v78) & 1) == 0) {
    objc_msgSend_setSkipWriteMissingAssetStatusRecord_(v11, v79, 1);
  }

  v83[0] = v6;
  v81 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v80, (uint64_t)v83, 1);

  return v81;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasMarkAssetBrokenResponse(v4, v5, v6)
    && (objc_msgSend_markAssetBrokenResponse(v4, v7, v8),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int hasMissingAssetStatusRecord = objc_msgSend_hasMissingAssetStatusRecord(v9, v10, v11),
        v9,
        hasMissingAssetStatusRecord))
  {
    uint64_t v13 = objc_msgSend_translator(self, v7, v8);
    v16 = objc_msgSend_markAssetBrokenResponse(v4, v14, v15);
    v19 = objc_msgSend_missingAssetStatusRecord(v16, v17, v18);
    id v31 = 0;
    uint64_t v21 = objc_msgSend_recordIDFromPRecordIdentifier_error_(v13, v20, (uint64_t)v19, &v31);
    uint64_t v22 = (uint64_t)v31;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v21 = 0;
  }
  if (!(v22 | v21))
  {
    uint64_t v22 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19C40], 2006, @"Invalid data received from server");
  }
  v23 = objc_msgSend_assetBrokenBlock(self, v7, v8);

  if (v23)
  {
    objc_msgSend_assetBrokenBlock(self, v24, v25);
    v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_result(v4, v27, v28);
    ((void (**)(void, uint64_t, void *))v26)[2](v26, v21, v29);
  }
  return (id)v22;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v13 = a3;
  uint64_t v6 = objc_msgSend_assetBrokenBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_assetBrokenBlock(self, v7, v8);
    uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_result(v13, v10, v11);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
  }
}

- (id)assetBrokenBlock
{
  return self->_assetBrokenBlock;
}

- (void)setAssetBrokenBlock:(id)a3
{
}

- (CKUploadRequestMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)writeRepairRecord
{
  return self->_writeRepairRecord;
}

- (void)setWriteRepairRecord:(BOOL)a3
{
  self->_writeRepairRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_assetBrokenBlock, 0);
}

@end