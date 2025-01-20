@interface KVStreamDatasetReader
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KVStreamDatasetReader)initWithData:(id)a3 error:(id *)a4;
- (NSString)description;
- (id)datasetInfo;
- (unint64_t)offset;
@end

@implementation KVStreamDatasetReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (NSString)description
{
  v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"dataset format: %@ info: %@", v2, v3, v4, @"Binary Stream", self->_datasetInfo);

  return (NSString *)v5;
}

- (id)datasetInfo
{
  return self->_datasetInfo;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  v5 = (uint64_t (**)(id, void *))a4;
  v11 = objc_msgSend_buffer(self->_datasetInfo, v6, v7, v8, v9, v10);
  self->_uint64_t offset = objc_msgSend_length(v11, v12, v13, v14, v15, v16) + 4;

  unsigned int v22 = objc_msgSend_itemCount(self->_datasetInfo, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_bytes(self->_data, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_length(self->_data, v29, v30, v31, v32, v33);
  if (!v22)
  {
    BOOL v41 = 1;
    goto LABEL_21;
  }
  uint64_t v39 = v34;
  int v40 = 0;
  BOOL v41 = 0;
  while (1)
  {
    uint64_t offset = self->_offset;
    unint64_t v43 = *(unsigned int *)(v28 + offset);
    if (v39 - offset < v43)
    {
      v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v71 = *MEMORY[0x1E4F28568];
      v50 = objc_msgSend_stringWithFormat_(NSString, v35, @"Size prefix indicates item length %u exceeding remaining profile buffer length %llu.", v36, v37, v38, v43, v39);
      v72[0] = v50;
      v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v51, (uint64_t)v72, (uint64_t)&v71, 1, v52);
      v56 = objc_msgSend_errorWithDomain_code_userInfo_(v49, v54, @"com.apple.koa.profile", 10, (uint64_t)v53, v55);
      v57 = v56;
      if (a3 && v56) {
        *a3 = v56;
      }

      goto LABEL_18;
    }
    if (v43 >= 0xC801)
    {
      v58 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      v59 = objc_msgSend_stringWithFormat_(NSString, v35, @"Size prefix indicates item length %u exceeding max item length %u.", v36, v37, v38, v43, 51200);
      v70 = v59;
      v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v60, (uint64_t)&v70, (uint64_t)&v69, 1, v61);
      v65 = objc_msgSend_errorWithDomain_code_userInfo_(v58, v63, @"com.apple.koa.profile", 7, (uint64_t)v62, v64);
      v66 = v65;
      if (a3 && v65) {
        *a3 = v65;
      }

LABEL_18:
      self->_uint64_t offset = 0;
      goto LABEL_21;
    }
    uint64_t v44 = (offset + 4);
    self->_uint64_t offset = v44;
    v45 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v35, v28 + v44, v43, 0, v38);
    self->_offset += v43;
    v46 = [KVItem alloc];
    v48 = objc_msgSend_initWithBuffer_verify_copy_error_(v46, v47, (uint64_t)v45, 1, 1, (uint64_t)a3);
    if (!v48) {
      goto LABEL_20;
    }
    if ((v5[2](v5, v48) & 1) == 0) {
      break;
    }

    BOOL v41 = ++v40 >= v22;
    if (v22 == v40) {
      goto LABEL_21;
    }
  }
  self->_uint64_t offset = 0;
LABEL_20:

LABEL_21:
  return v41;
}

- (KVStreamDatasetReader)initWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)KVStreamDatasetReader;
  uint64_t v8 = [(KVStreamDatasetReader *)&v18 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    uint64_t v10 = [KVDatasetInfo alloc];
    uint64_t v14 = objc_msgSend_initWithSizePrefixedBuffer_error_(v10, v11, (uint64_t)v7, (uint64_t)a4, v12, v13);
    datasetInfo = v9->_datasetInfo;
    v9->_datasetInfo = (KVDatasetInfo *)v14;

    if (!v9->_datasetInfo)
    {
      uint64_t v16 = 0;
      goto LABEL_6;
    }
    v9->_uint64_t offset = 0;
  }
  uint64_t v16 = v9;
LABEL_6:

  return v16;
}

@end