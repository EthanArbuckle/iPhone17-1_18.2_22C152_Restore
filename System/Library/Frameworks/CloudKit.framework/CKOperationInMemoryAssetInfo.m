@interface CKOperationInMemoryAssetInfo
- (BOOL)isContiguous;
- (CKOperationInMemoryAssetInfo)init;
- (NSMutableData)assetContent;
- (NSMutableIndexSet)byteRanges;
- (id)assetContentWithExpectedSignature:(id)a3 verificationKey:(id)a4 error:(id *)a5;
- (void)setAssetContent:(id)a3;
- (void)setByteRanges:(id)a3;
- (void)writeData:(id)a3 atOffset:(unint64_t)a4;
@end

@implementation CKOperationInMemoryAssetInfo

- (CKOperationInMemoryAssetInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKOperationInMemoryAssetInfo;
  v2 = [(CKOperationInMemoryAssetInfo *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    assetContent = v2->_assetContent;
    v2->_assetContent = (NSMutableData *)v3;

    uint64_t v5 = objc_opt_new();
    byteRanges = v2->_byteRanges;
    v2->_byteRanges = (NSMutableIndexSet *)v5;
  }
  return v2;
}

- (void)writeData:(id)a3 atOffset:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10 = v6;
  if (v6)
  {
    uint64_t v11 = objc_msgSend_length(v6, v7, v8, v9);
    if (objc_msgSend_containsIndexesInRange_(self->_byteRanges, v12, a4, v11))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v14 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v35 = v14;
        v40.location = a4;
        v40.length = v11;
        v36 = NSStringFromRange(v40);
        int v37 = 138543362;
        v38 = v36;
        _os_log_error_impl(&dword_18AF10000, v35, OS_LOG_TYPE_ERROR, "range %{public}@ overlaps with previous range", (uint8_t *)&v37, 0xCu);
      }
    }
    objc_msgSend_addIndexesInRange_(self->_byteRanges, v13, a4, v11);
    unint64_t v18 = objc_msgSend_length(v10, v15, v16, v17) + a4;
    if (objc_msgSend_length(self->_assetContent, v19, v20, v21) < v18) {
      objc_msgSend_setLength_(self->_assetContent, v22, v18, v23);
    }
    assetContent = self->_assetContent;
    id v25 = v10;
    uint64_t v29 = objc_msgSend_bytes(v25, v26, v27, v28);
    uint64_t v33 = objc_msgSend_length(v25, v30, v31, v32);
    objc_msgSend_replaceBytesInRange_withBytes_length_(assetContent, v34, a4, v11, v29, v33);
  }
}

- (BOOL)isContiguous
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  byteRanges = self->_byteRanges;
  uint64_t v5 = objc_msgSend_length(self->_assetContent, a2, v2, v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B1A14A0;
  v7[3] = &unk_1E5466168;
  v7[4] = &v8;
  CKNSIndexSet_enumerateInverseRangesInRange_options_usingBlock(byteRanges, 0, v5, 0, v7);
  LOBYTE(byteRanges) = *((unsigned char *)v9 + 24) == 0;
  _Block_object_dispose(&v8, 8);
  return (char)byteRanges;
}

- (id)assetContentWithExpectedSignature:(id)a3 verificationKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((objc_msgSend_isContiguous(self, v10, v11, v12) & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v22 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AF10000, v22, OS_LOG_TYPE_ERROR, "assetContent did not consist of contiguous bytes ranges", buf, 2u);
      if (!a5) {
        goto LABEL_27;
      }
    }
    else if (!a5)
    {
      goto LABEL_27;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v23, @"CKInternalErrorDomain", 3006, @"assetContent did not consist of contiguous bytes ranges");
LABEL_10:
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (v8)
  {
    if (v9)
    {
      uint64_t v16 = [CKSignatureGenerator alloc];
      v19 = (CKSignatureGenerator *)objc_msgSend_initWithVerificationKey_(v16, v17, (uint64_t)v9, v18);
    }
    else
    {
      v19 = objc_alloc_init(CKSignatureGenerator);
    }
    uint64_t v27 = v19;
    objc_msgSend_updateWithData_(v19, v20, (uint64_t)self->_assetContent, v21);
    uint64_t v31 = objc_msgSend_dataByFinishingSignature(v27, v28, v29, v30);
    if (objc_msgSend_isEqual_(v31, v32, (uint64_t)v8, v33))
    {

      goto LABEL_20;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v34 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v38 = 0;
      _os_log_error_impl(&dword_18AF10000, v34, OS_LOG_TYPE_ERROR, "assetContent did not match expected signature", v38, 2u);
      if (!a5) {
        goto LABEL_26;
      }
    }
    else if (!a5)
    {
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v35, @"CKInternalErrorDomain", 3006, @"assetContent did not match expected signature");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (objc_msgSend_length(self->_assetContent, v13, v14, v15))
  {
LABEL_20:
    v24 = self->_assetContent;
    goto LABEL_28;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v25 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v37 = 0;
    _os_log_error_impl(&dword_18AF10000, v25, OS_LOG_TYPE_ERROR, "assetContent length 0", v37, 2u);
    if (!a5) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  if (a5)
  {
LABEL_16:
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKInternalErrorDomain", 3006, @"assetContent length 0");
    goto LABEL_10;
  }
LABEL_27:
  v24 = 0;
LABEL_28:

  return v24;
}

- (NSMutableData)assetContent
{
  return self->_assetContent;
}

- (void)setAssetContent:(id)a3
{
}

- (NSMutableIndexSet)byteRanges
{
  return self->_byteRanges;
}

- (void)setByteRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteRanges, 0);

  objc_storeStrong((id *)&self->_assetContent, 0);
}

@end