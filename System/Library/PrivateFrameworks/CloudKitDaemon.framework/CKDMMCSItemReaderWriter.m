@interface CKDMMCSItemReaderWriter
- (BOOL)closeWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7;
- (C3DownloadChunkContext)downloadChunkContext;
- (CKDMMCSItem)MMCSItem;
- (CKDMMCSItemGroupContext)MMCSRequest;
- (CKDMMCSItemReaderWriter)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4 downloadChunkContext:(id)a5;
- (NSFileHandle)fileHandle;
- (id)getFileMetadataWithError:(id *)a3;
- (void)dealloc;
- (void)setDownloadChunkContext:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setMMCSItem:(id)a3;
- (void)setMMCSRequest:(id)a3;
@end

@implementation CKDMMCSItemReaderWriter

- (CKDMMCSItemReaderWriter)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4 downloadChunkContext:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v14 = a5;
  if (!v10)
  {
    v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 32, @"Expected non-nil MMCS item");
  }
  v21.receiver = self;
  v21.super_class = (Class)CKDMMCSItemReaderWriter;
  v15 = [(CKDMMCSItemReaderWriter *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_MMCSItem, a3);
    objc_storeStrong((id *)&v16->_MMCSRequest, a4);
    objc_storeStrong((id *)&v16->_downloadChunkContext, a5);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v17 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "init, reader:%p", buf, 0xCu);
    }
  }

  return v16;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "dealloc, reader:%p", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDMMCSItemReaderWriter;
  [(CKDMMCSItemReaderWriter *)&v4 dealloc];
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_MMCSRequest(self, a2, (uint64_t)a3);
  id v11 = objc_msgSend_MMCSItem(self, v7, v8);
  if (!v11)
  {
    v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 51, @"Expected non-nil MMCS item for %@", self);
  }
  id v14 = objc_msgSend_fileHandle(self, v9, v10);
  if (v14)
  {
    v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 53, @"Expected an invalid file handle for %@", self);
  }
  v16 = objc_msgSend_operation(v6, v12, v13);
  if (v6)
  {
    id v49 = 0;
    char v17 = objc_msgSend_willOpenItemReaderWriter_error_(v6, v15, (uint64_t)self, &v49);
    id v18 = v49;
    id v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (a3)
      {
        id v19 = v18;
        BOOL v20 = 0;
        *a3 = v19;
      }
      else
      {
        BOOL v20 = 0;
      }
      goto LABEL_22;
    }
  }
  else
  {
    id v19 = 0;
  }
  objc_super v21 = v19;
  id v48 = v19;
  v22 = objc_msgSend_openWithOperation_error_(v11, v15, (uint64_t)v16, &v48);
  id v19 = v48;

  BOOL v20 = v22 != 0;
  if (v22)
  {
    uint64_t v25 = objc_msgSend_fileHandle(v22, v23, v24);

    objc_msgSend_setFileHandle_(self, v26, v25);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v27 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v33 = v27;
      v46 = objc_msgSend_MMCSItem(self, v34, v35);
      v38 = objc_msgSend_trackingUUID(v46, v36, v37);
      uint64_t v41 = objc_msgSend_itemID(v11, v39, v40);
      *(_DWORD *)buf = 138412802;
      v51 = v38;
      __int16 v52 = 2048;
      uint64_t v53 = v41;
      __int16 v54 = 2048;
      uint64_t v55 = v25;
      _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "open, trackingUUID:%@ itemID:%llu, handle:%p", buf, 0x20u);
    }
    id v47 = 0;
    id v29 = (id)objc_msgSend_getFileMetadataWithError_(self, v28, (uint64_t)&v47);
    id v30 = v47;
    if (a3) {
      id v31 = *a3;
    }
    else {
      id v31 = 0;
    }
    id v14 = (void *)v25;
    BOOL v20 = 1;
  }
  else if (a3)
  {
    id v31 = v19;
    id v30 = 0;
    *a3 = v31;
  }
  else
  {
    id v30 = 0;
    id v31 = 0;
  }
  objc_msgSend_didOpenItemReaderWriter_result_error_(v6, v23, (uint64_t)self, v22 != 0, v31);

LABEL_22:
  return v20;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_fileHandle(self, v5, v6);
  if (v7)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v8 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      id v11 = v8;
      int v14 = 134218240;
      uint64_t v15 = objc_msgSend_itemID(v4, v12, v13);
      __int16 v16 = 2048;
      char v17 = v7;
      _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "close, itemID:%llu, handle:%p", (uint8_t *)&v14, 0x16u);
    }
    objc_msgSend_setFileHandle_(self, v9, 0);
  }

  return 1;
}

- (id)getFileMetadataWithError:(id *)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_MMCSRequest(self, a2, (uint64_t)a3);
  v9 = objc_msgSend_operation(v6, v7, v8);
  int v14 = objc_msgSend_MMCSItem(self, v10, v11);
  if (!v14)
  {
    v65 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v65, v66, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 101, @"Expected non-nil MMCS item for %@", self);
  }
  char v17 = objc_msgSend_fileHandle(self, v12, v13);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_container(v9, v15, v16);
    id v72 = 0;
    BOOL v20 = objc_msgSend_getFileMetadataWithContainer_fileHandle_error_(v14, v19, (uint64_t)v18, v17, &v72);
    id v21 = v72;

    v22 = (void *)*MEMORY[0x1E4F1A548];
    if (v20)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v22);
      }
      v23 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        log = v23;
        uint64_t v68 = objc_msgSend_itemID(v14, v35, v36);
        v71 = objc_msgSend_fileSize(v20, v37, v38);
        uint64_t v67 = objc_msgSend_unsignedLongLongValue(v71, v39, v40);
        v69 = objc_msgSend_fileID(v20, v41, v42);
        uint64_t v45 = objc_msgSend_unsignedLongLongValue(v69, v43, v44);
        id v48 = objc_msgSend_generationID(v20, v46, v47);
        uint64_t v51 = objc_msgSend_unsignedLongValue(v48, v49, v50);
        __int16 v54 = objc_msgSend_modTimeInSeconds(v20, v52, v53);
        uint64_t v57 = objc_msgSend_unsignedLongLongValue(v54, v55, v56);
        *(_DWORD *)buf = 134219264;
        uint64_t v74 = v68;
        __int16 v75 = 2048;
        v76 = v17;
        __int16 v77 = 2048;
        uint64_t v78 = v67;
        __int16 v79 = 2048;
        uint64_t v80 = v45;
        __int16 v81 = 2048;
        uint64_t v82 = v51;
        __int16 v83 = 2048;
        uint64_t v84 = v57;
        _os_log_debug_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_DEBUG, "stat, itemID:%llu, handle:%p, fileSize:%llu, fileID:%llu, generationID:%lu, modTime:%llu", buf, 0x3Eu);
      }
      id v24 = v20;
      goto LABEL_20;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v22);
    }
    v33 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v58 = v33;
      uint64_t v61 = objc_msgSend_itemID(v14, v59, v60);
      v64 = objc_msgSend_operationID(v9, v62, v63);
      *(_DWORD *)buf = 134218754;
      uint64_t v74 = v61;
      __int16 v75 = 2048;
      v76 = v17;
      __int16 v77 = 2114;
      uint64_t v78 = (uint64_t)v64;
      __int16 v79 = 2112;
      uint64_t v80 = (uint64_t)v21;
      _os_log_error_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_ERROR, "Failed to stat itemID:%llu, handle:%p, operationID:%{public}@: %@", buf, 0x2Au);

      if (!a3) {
        goto LABEL_20;
      }
    }
    else if (!a3)
    {
LABEL_20:

      goto LABEL_21;
    }
    *a3 = v21;
    goto LABEL_20;
  }
  uint64_t v25 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v26 = *MEMORY[0x1E4F19C40];
  uint64_t v27 = objc_msgSend_itemID(v14, v15, v16);
  id v30 = objc_msgSend_operationID(v9, v28, v29);
  objc_msgSend_errorWithDomain_code_format_(v25, v31, v26, 1000, @"No file handle for itemID:%llu, operationID:%@", v27, v30);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v32 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v74 = (uint64_t)v21;
    _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    if (a3) {
      goto LABEL_14;
    }
  }
  else if (a3)
  {
LABEL_14:
    id v21 = v21;
    BOOL v20 = 0;
    *a3 = v21;
    goto LABEL_21;
  }
  BOOL v20 = 0;
LABEL_21:

  return v20;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = objc_msgSend_MMCSRequest(self, a2, a3);
  uint64_t v16 = objc_msgSend_MMCSItem(self, v14, v15);
  id v21 = objc_msgSend_operation(v13, v17, v18);
  if (!v16)
  {
    uint64_t v45 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 133, @"Expected non-nil MMCS item for %@", self);
  }
  id v24 = objc_msgSend_fileHandle(self, v19, v20);
  if (!v24)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(log, v47, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 135, @"Expected a valid file handle for %@", self);
  }
  objc_msgSend_setIsReaderReadFrom_(v16, v22, 1);
  int v27 = objc_msgSend_fileDescriptor(v24, v25, v26);
  ssize_t v28 = pread(v27, a4, a5, a3);
  ssize_t v29 = v28;
  if (v28 < 0)
  {
    id v30 = __error();
    uint64_t v31 = *v30;
    v32 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v33 = *MEMORY[0x1E4F19DD8];
    v34 = strerror(*v30);
    uint64_t v36 = objc_msgSend_errorWithDomain_code_format_(v32, v35, v33, 1000, @"pread error: %d (%s)", v31, v34);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v37 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      loga = v37;
      uint64_t v41 = objc_msgSend_itemID(v16, v39, v40);
      uint64_t v44 = objc_msgSend_operationID(v21, v42, v43);
      *(_DWORD *)buf = 134219266;
      uint64_t v52 = v41;
      __int16 v53 = 2048;
      __int16 v54 = v24;
      __int16 v55 = 2114;
      uint64_t v56 = v44;
      __int16 v57 = 2048;
      unint64_t v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = a5;
      __int16 v61 = 2112;
      v62 = v36;
      _os_log_error_impl(&dword_1C4CFF000, loga, OS_LOG_TYPE_ERROR, "Failed to pread for itemID:%llu, handle:%p, operationID:%{public}@, offset:0x%llx, length:%llu: %@", buf, 0x3Eu);
    }
    if (a7) {
      *a7 = v36;
    }
  }
  else if (a6)
  {
    *a6 = v28;
  }

  return v29 >= 0;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  int v14 = objc_msgSend_MMCSRequest(self, a2, a3);
  id v19 = objc_msgSend_MMCSItem(self, v15, v16);
  if (!v19)
  {
    uint64_t v45 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 161, @"Expected non-nil MMCS item for %@", self);
  }
  v22 = objc_msgSend_fileHandle(self, v17, v18);
  if (!v22)
  {
    uint64_t v50 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v47, (uint64_t)a2, self, @"CKDMMCSItemReaderWriter.m", 163, @"Expected a valid file handle for %@", self);
  }
  uint64_t v23 = objc_msgSend_operation(v14, v20, v21);
  int v26 = objc_msgSend_fileDescriptor(v22, v24, v25);
  ssize_t v27 = pwrite(v26, a4, a5, a3);
  ssize_t v28 = v27;
  if (v27 < 0)
  {
    id v49 = a7;
    ssize_t v29 = __error();
    uint64_t v30 = *v29;
    uint64_t v31 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v32 = *MEMORY[0x1E4F19DD8];
    uint64_t v33 = strerror(*v29);
    uint64_t v35 = objc_msgSend_errorWithDomain_code_format_(v31, v34, v32, 1000, @"pwrite error: %d (%s)", v30, v33);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v36 = v49;
    uint64_t v37 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v37;
      uint64_t v41 = objc_msgSend_itemID(v19, v39, v40);
      uint64_t v44 = objc_msgSend_operationID(v23, v42, v43);
      *(_DWORD *)buf = 134219266;
      uint64_t v52 = v41;
      __int16 v53 = 2048;
      __int16 v54 = v22;
      __int16 v55 = 2114;
      uint64_t v56 = v44;
      __int16 v57 = 2048;
      unint64_t v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = a5;
      __int16 v61 = 2112;
      v62 = v35;
      _os_log_error_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_ERROR, "Failed to pwrite for itemID:%llu, handle:%p, operationID:%{public}@, offset:0x%llx, length:%llu: %@", buf, 0x3Eu);

      uint64_t v36 = v49;
      if (!v49) {
        goto LABEL_13;
      }
    }
    else if (!v49)
    {
LABEL_13:

      goto LABEL_14;
    }
    id *v36 = v35;
    goto LABEL_13;
  }
  if (a6) {
    *a6 = v27;
  }
LABEL_14:

  return v28 >= 0;
}

- (C3DownloadChunkContext)downloadChunkContext
{
  return self->_downloadChunkContext;
}

- (void)setDownloadChunkContext:(id)a3
{
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

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
  objc_storeStrong((id *)&self->_downloadChunkContext, 0);
}

@end