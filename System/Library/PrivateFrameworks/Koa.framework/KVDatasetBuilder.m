@interface KVDatasetBuilder
- (BOOL)_finishWithError:(id *)a3;
- (KVDatasetBuilder)init;
- (KVDatasetBuilder)initWithDatasetInfo:(id)a3 writer:(id)a4 error:(id *)a5;
- (id)addItem:(id)a3 error:(id *)a4;
@end

@implementation KVDatasetBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
}

- (BOOL)_finishWithError:(id *)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  unsigned int itemCount = self->_itemCount;
  if (itemCount == objc_msgSend_itemCount(self->_datasetInfo, a2, (uint64_t)a3, v3, v4, v5))
  {
    char v14 = objc_msgSend_finishDataset_(self->_writer, v9, (uint64_t)a3, v11, v12, v13);
    writer = self->_writer;
    self->_writer = 0;

    return v14;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v18 = NSString;
    uint64_t v19 = objc_msgSend_itemCount(self->_datasetInfo, v9, v10, v11, v12, v13);
    v24 = objc_msgSend_stringWithFormat_(v18, v20, @"Expected %u dataset items but %u were added.", v21, v22, v23, v19, self->_itemCount);
    v33[0] = v24;
    v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v33, (uint64_t)&v32, 1, v26);
    v30 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v28, @"com.apple.koa.profile", 8, (uint64_t)v27, v29);
    v31 = v30;
    if (a3)
    {
      if (v30) {
        *a3 = v30;
      }
    }

    return 0;
  }
}

- (id)addItem:(id)a3 error:(id *)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = objc_msgSend_itemType(v6, v7, v8, v9, v10, v11);
    if (v12 == objc_msgSend_itemType(self->_datasetInfo, v13, v14, v15, v16, v17))
    {
      if (objc_msgSend_addItem_error_(self->_writer, v18, (uint64_t)v6, (uint64_t)a4, v21, v22))
      {
        ++self->_itemCount;
        uint64_t v23 = self;
        goto LABEL_11;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v72 = *MEMORY[0x1E4F28568];
      v42 = NSString;
      unsigned __int16 v43 = objc_msgSend_itemType(v6, v18, v19, v20, v21, v22);
      if (v43 - 1 >= 0x1A) {
        uint64_t v47 = 0;
      }
      else {
        uint64_t v47 = v43;
      }
      v48 = objc_msgSend_stringWithCString_encoding_(NSString, v44, (uint64_t)off_1E62AD038[v47], 4, v45, v46);
      unsigned __int16 v54 = objc_msgSend_itemType(self->_datasetInfo, v49, v50, v51, v52, v53);
      if (v54 - 1 >= 0x1A) {
        uint64_t v58 = 0;
      }
      else {
        uint64_t v58 = v54;
      }
      v59 = objc_msgSend_stringWithCString_encoding_(NSString, v55, (uint64_t)off_1E62AD038[v58], 4, v56, v57);
      v64 = objc_msgSend_stringWithFormat_(v42, v60, @"Item has type %@ inconsistent with dataset itemType %@", v61, v62, v63, v48, v59);
      v73 = v64;
      v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v65, (uint64_t)&v73, (uint64_t)&v72, 1, v66);
      v70 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v68, @"com.apple.koa.profile", 7, (uint64_t)v67, v69);
      v71 = v70;
      if (a4 && v70) {
        *a4 = v70;
      }
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    v25 = NSString;
    uint64_t v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    uint64_t v32 = objc_msgSend_stringWithFormat_(v25, v28, @"Invalid item: %@ expected %@", v29, v30, v31, v6, v27);
    v75[0] = v32;
    v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v75, (uint64_t)&v74, 1, v34);
    v38 = objc_msgSend_errorWithDomain_code_userInfo_(v24, v36, @"com.apple.koa.profile", 7, (uint64_t)v35, v37);
    v39 = v38;
    if (a4 && v38) {
      *a4 = v38;
    }
  }
  uint64_t v23 = 0;
LABEL_11:

  return v23;
}

- (KVDatasetBuilder)initWithDatasetInfo:(id)a3 writer:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)KVDatasetBuilder;
  uint64_t v11 = [(KVDatasetBuilder *)&v44 init];
  uint64_t v12 = v11;
  uint64_t v13 = v11;
  if (!v11) {
    goto LABEL_7;
  }
  p_datasetInfo = &v11->_datasetInfo;
  objc_storeStrong((id *)&v11->_datasetInfo, a3);
  if (!*p_datasetInfo)
  {
    uint64_t v21 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v21 = *p_datasetInfo;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v22 = objc_msgSend_buffer(v21, v15, v19, v16, v17, v18);
  BOOL v28 = objc_msgSend_length(v22, v23, v24, v25, v26, v27) == 0;

  if (v28)
  {
    uint64_t v21 = *p_datasetInfo;
LABEL_10:
    uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v35 = objc_msgSend_stringWithFormat_(NSString, v15, @"Invalid DatasetInfo: %@", v16, v17, v18, v21);
    v46[0] = v35;
    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v46, (uint64_t)&v45, 1, v37);
    v41 = objc_msgSend_errorWithDomain_code_userInfo_(v34, v39, @"com.apple.koa.profile", 6, (uint64_t)v38, v40);
    v42 = v41;
    if (a5 && v41) {
      *a5 = v41;
    }

    goto LABEL_14;
  }
  p_writer = (id *)&v12->_writer;
  objc_storeStrong(p_writer, a4);
  if (!objc_msgSend_startDataset_error_(*p_writer, v30, (uint64_t)v9, (uint64_t)a5, v31, v32))
  {
LABEL_14:
    v33 = 0;
    goto LABEL_15;
  }
  v13->_unsigned int itemCount = 0;
LABEL_7:
  v33 = v13;
LABEL_15:

  return v33;
}

- (KVDatasetBuilder)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end