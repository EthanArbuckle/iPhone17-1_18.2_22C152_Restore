@interface CKDMMCSClientProxyItemReader
- (BOOL)closeWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7;
- (CKDMMCSClientProxyItemReader)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4;
- (CKDMMCSItem)MMCSItem;
- (CKDMMCSItemGroupContext)MMCSRequest;
- (id)getFileMetadataWithError:(id *)a3;
- (void)setMMCSItem:(id)a3;
- (void)setMMCSRequest:(id)a3;
@end

@implementation CKDMMCSClientProxyItemReader

- (CKDMMCSClientProxyItemReader)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v12 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CKDMMCSClientProxyItemReader.m", 28, @"Expected non-nil MMCS item");

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKDMMCSClientProxyItemReader.m", 29, @"Expected non-nil MMCS request for %@", v8);

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)CKDMMCSClientProxyItemReader;
  v13 = [(CKDMMCSClientProxyItemReader *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_MMCSItem, a3);
    objc_storeStrong((id *)&v14->_MMCSRequest, a4);
  }

  return v14;
}

- (BOOL)openWithError:(id *)a3
{
  return 1;
}

- (BOOL)closeWithError:(id *)a3
{
  return 1;
}

- (id)getFileMetadataWithError:(id *)a3
{
  v7 = objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  if (!v7)
  {
    v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDMMCSClientProxyItemReader.m", 47, @"Expected non-nil MMCS item for %@", self);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1A118]);
  id v9 = (void *)MEMORY[0x1E4F28ED0];
  v12 = objc_msgSend_asset(v7, v10, v11);
  uint64_t v15 = objc_msgSend_size(v12, v13, v14);
  v17 = objc_msgSend_numberWithUnsignedLongLong_(v9, v16, v15);
  v19 = objc_msgSend_initWithFileSize_(v8, v18, (uint64_t)v17);

  return v19;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = objc_msgSend_MMCSRequest(self, a2, a3);
  v17 = objc_msgSend_operation(v14, v15, v16);
  v22 = objc_msgSend_MMCSItem(self, v18, v19);
  if (!v22)
  {
    v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v43, (uint64_t)a2, self, @"CKDMMCSClientProxyItemReader.m", 58, @"Expected non-nil MMCS item for %@", self);
  }
  objc_msgSend_setIsReaderReadFrom_(v22, v20, 1);
  v25 = objc_msgSend_container(v17, v23, v24);
  id v45 = 0;
  v27 = objc_msgSend_readBytesOfInMemoryAssetContentWithContainer_offset_length_error_(v22, v26, (uint64_t)v25, a3, a5, &v45);
  id v28 = v45;

  if (!v27)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v34 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v36 = v34;
      uint64_t v39 = objc_msgSend_itemID(v22, v37, v38);
      v42 = objc_msgSend_operationID(v17, v40, v41);
      *(_DWORD *)buf = 134218498;
      uint64_t v47 = v39;
      __int16 v48 = 2114;
      v49 = v42;
      __int16 v50 = 2112;
      id v51 = v28;
      _os_log_error_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_ERROR, "Failed to read bytes itemID:%llu, operationID:%{public}@: %@", buf, 0x20u);

      if (!a7) {
        goto LABEL_14;
      }
    }
    else if (!a7)
    {
      goto LABEL_14;
    }
    *a7 = v28;
    goto LABEL_14;
  }
  unint64_t v31 = objc_msgSend_length(v27, v29, v30);
  if (v31 >= a5)
  {
    unint64_t v33 = a5;
    objc_msgSend_getBytes_length_(v27, v32, (uint64_t)a4, a5);
  }
  else
  {
    unint64_t v33 = v31;
    objc_msgSend_getBytes_length_(v27, v32, (uint64_t)a4, v31);
  }
  if (a6) {
    *a6 = v33;
  }
LABEL_14:

  return v27 != 0;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5, a6);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CKDMMCSClientProxyItemReader.m", 80, @"Writing not supported");

  if (a7)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 3001, @"Writing not supported");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (CKDMMCSItemGroupContext)MMCSRequest
{
  return self->_MMCSRequest;
}

- (void)setMMCSRequest:(id)a3
{
}

- (CKDMMCSItem)MMCSItem
{
  return self->_MMCSItem;
}

- (void)setMMCSItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
}

@end