@interface CKDMMCSEncryptedItemReader
- (BOOL)closeWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7;
- (CKDMMCSEncryptedItemReader)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4;
- (CKDMMCSItem)MMCSItem;
- (CKDMMCSItemGroupContext)MMCSRequest;
- (_mkbbackupref)handle;
- (id)getFileMetadataWithError:(id *)a3;
- (void)dealloc;
- (void)setHandle:(_mkbbackupref *)a3;
- (void)setMMCSItem:(id)a3;
- (void)setMMCSRequest:(id)a3;
@end

@implementation CKDMMCSEncryptedItemReader

- (CKDMMCSEncryptedItemReader)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDMMCSEncryptedItemReader;
  v9 = [(CKDMMCSEncryptedItemReader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_MMCSItem, a3);
    objc_storeStrong((id *)&v10->_MMCSRequest, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_msgSend_closeWithError_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKDMMCSEncryptedItemReader;
  [(CKDMMCSEncryptedItemReader *)&v3 dealloc];
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_MMCSRequest(self, a2, (uint64_t)a3);
  v11 = objc_msgSend_MMCSItem(self, v7, v8);
  if (!v11)
  {
    v106 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v106, v107, (uint64_t)a2, self, @"CKDMMCSEncryptedItemReader.m", 52, @"Expected non-nil MMCS item for %@", self);
  }
  uint64_t v14 = objc_msgSend_handle(self, v9, v10);
  uint64_t v119 = v14;
  if (v14)
  {
    v108 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v108, v109, (uint64_t)a2, self, @"CKDMMCSEncryptedItemReader.m", 54, @"Expected an invalid handle for %@", self);
  }
  v15 = objc_msgSend_fileURL(v11, v12, v13);
  v18 = objc_msgSend_path(v15, v16, v17);

  v21 = objc_msgSend_operation(v6, v19, v20);
  id v118 = 0;
  v23 = objc_msgSend_openWithOperation_error_(v11, v22, (uint64_t)v21, &v118);
  id v24 = v118;
  id v27 = v24;
  if (v23)
  {
    v116 = a3;
    v28 = objc_msgSend_fileHandle(v23, v25, v26);
    v31 = objc_msgSend_encryptedFileHandle(v23, v29, v30);
    v34 = v31;
    v117 = v21;
    if (!v28 || !v31 || (objc_msgSend_fileDescriptor(v31, v32, v33) & 0x80000000) != 0)
    {
      *(void *)v113 = v6;
      v115 = v11;
      v38 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v39 = *MEMORY[0x1E4F19DD8];
      v40 = objc_msgSend_fileHandle(v23, v32, v33);
      v111 = v23;
      v43 = objc_msgSend_encryptedFileHandle(v23, v41, v42);
      uint64_t v44 = v39;
      v45 = v18;
      v47 = objc_msgSend_errorWithDomain_code_path_format_(v38, v46, v44, 3001, v18, @"Invalid file handles, fileHandle:%@, encryptedFileHandle:%@", v40, v43);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v48 = (void *)*MEMORY[0x1E4F1A500];
      v6 = *(void **)v113;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        v72 = v48;
        uint64_t v75 = objc_msgSend_itemID(v115, v73, v74);
        v78 = objc_msgSend_operationID(v117, v76, v77);
        *(_DWORD *)buf = 134218754;
        uint64_t v121 = v75;
        v18 = v45;
        __int16 v122 = 2048;
        uint64_t v123 = v14;
        __int16 v124 = 2114;
        v125 = v78;
        __int16 v126 = 2112;
        *(void *)v127 = v47;
        _os_log_error_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_ERROR, "Failed to open itemID:%llu, handle:%p, operationID:%{public}@: %@", buf, 0x2Au);

        v6 = *(void **)v113;
      }
      if (v116)
      {
        id v49 = v47;
        BOOL v50 = 0;
        id *v116 = v49;
        v11 = v115;
        v21 = v117;
      }
      else
      {
        BOOL v50 = 0;
        v11 = v115;
        v21 = v117;
        id v49 = v47;
      }
      v23 = v111;
      goto LABEL_22;
    }
    v110 = v18;
    if ((objc_msgSend_fileDescriptor(v28, v32, v33) & 0x80000000) != 0)
    {
      int v112 = -1;
    }
    else
    {
      int v37 = objc_msgSend_fileDescriptor(v28, v35, v36);
      int v112 = dup(v37);
      if (v112 < 0)
      {
        int v114 = -1;
        goto LABEL_28;
      }
    }
    int v52 = objc_msgSend_fileDescriptor(v34, v35, v36);
    int v114 = dup(v52);
    if ((v114 & 0x80000000) == 0)
    {
      uint64_t v55 = 0;
      char v56 = 1;
      goto LABEL_29;
    }
LABEL_28:
    char v56 = 0;
    uint64_t v55 = *__error();
LABEL_29:
    if ((objc_msgSend_fileDescriptor(v28, v53, v54) & 0x80000000) == 0) {
      objc_msgSend_closeFile(v28, v57, v58);
    }
    if ((objc_msgSend_fileDescriptor(v34, v57, v58) & 0x80000000) == 0) {
      objc_msgSend_closeFile(v34, v59, v60);
    }

    if (v56)
    {
      int v61 = v114;
      uint64_t v62 = MKBBackupCreateFromFileDescriptors();
      if (v62)
      {
        v18 = v110;
        objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v63, *MEMORY[0x1E4F19DD8], 3001, v110, @"MKBBackupCreateFromFileDescriptors failed with rc:%d", v62);
        id v49 = (id)objc_claimAutoreleasedReturnValue();

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v64 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          v86 = v64;
          uint64_t v89 = objc_msgSend_itemID(v11, v87, v88);
          v90 = v11;
          v91 = v6;
          uint64_t v92 = v119;
          v95 = objc_msgSend_operationID(v117, v93, v94);
          *(_DWORD *)buf = 134219266;
          uint64_t v121 = v89;
          __int16 v122 = 2048;
          uint64_t v123 = v92;
          v6 = v91;
          v11 = v90;
          int v61 = v114;
          __int16 v124 = 2114;
          v125 = v95;
          __int16 v126 = 1024;
          *(_DWORD *)v127 = v112;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = v114;
          __int16 v128 = 2114;
          id v129 = v49;
          _os_log_error_impl(&dword_1C4CFF000, v86, OS_LOG_TYPE_ERROR, "MKBBackupCreateFromFileDescriptors failed for itemID:%llu, handle:%p, operationID:%{public}@, fd:%d, efd:%d: %{public}@", buf, 0x36u);

          v18 = v110;
        }
        close(v61);
        if ((v112 & 0x80000000) == 0) {
          close(v112);
        }
        v34 = 0;
        v28 = 0;
        BOOL v50 = 0;
      }
      else
      {
        objc_msgSend_setHandle_(self, v63, v119);
        v18 = v110;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v71 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v96 = v71;
          uint64_t v99 = objc_msgSend_itemID(v11, v97, v98);
          v100 = v11;
          v101 = v6;
          uint64_t v102 = v119;
          v21 = v117;
          v105 = objc_msgSend_operationID(v117, v103, v104);
          *(_DWORD *)buf = 134219010;
          uint64_t v121 = v99;
          __int16 v122 = 2048;
          uint64_t v123 = v102;
          v6 = v101;
          v11 = v100;
          __int16 v124 = 2114;
          v125 = v105;
          __int16 v126 = 1024;
          *(_DWORD *)v127 = v112;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = v114;
          _os_log_debug_impl(&dword_1C4CFF000, v96, OS_LOG_TYPE_DEBUG, "open, itemID:%llu, handle:%p, operationID:%{public}@, fd:%d, efd:%d", buf, 0x2Cu);

          v18 = v110;
          v34 = 0;
          v28 = 0;
          BOOL v50 = 1;
          id v49 = v27;
          goto LABEL_22;
        }
        v34 = 0;
        v28 = 0;
        BOOL v50 = 1;
        id v49 = v27;
      }
      v21 = v117;
LABEL_22:

      id v27 = v49;
      goto LABEL_23;
    }
    v65 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v66 = *MEMORY[0x1E4F19DD8];
    v67 = strerror(v55);
    uint64_t v68 = v66;
    v18 = v110;
    objc_msgSend_errorWithDomain_code_path_format_(v65, v69, v68, 3001, v110, @"dup failed, %d (%s)", v55, v67);
    id v49 = (id)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v70 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v79 = v70;
      uint64_t v82 = objc_msgSend_itemID(v11, v80, v81);
      v85 = objc_msgSend_operationID(v117, v83, v84);
      *(_DWORD *)buf = 134218754;
      uint64_t v121 = v82;
      __int16 v122 = 2048;
      uint64_t v123 = v14;
      __int16 v124 = 2114;
      v125 = v85;
      __int16 v126 = 2112;
      *(void *)v127 = v49;
      _os_log_error_impl(&dword_1C4CFF000, v79, OS_LOG_TYPE_ERROR, "Failed to dup file descriptors for itemID:%llu, handle:%p, operationID:%{public}@: %@", buf, 0x2Au);

      v18 = v110;
      if (!v116) {
        goto LABEL_47;
      }
    }
    else if (!v116)
    {
LABEL_47:
      v21 = v117;
      if ((v114 & 0x80000000) == 0) {
        close(v114);
      }
      if ((v112 & 0x80000000) == 0) {
        close(v112);
      }
      v34 = 0;
      v28 = 0;
      BOOL v50 = 0;
      goto LABEL_22;
    }
    id *v116 = v49;
    goto LABEL_47;
  }
  if (a3)
  {
    id v27 = v24;
    BOOL v50 = 0;
    *a3 = v27;
  }
  else
  {
    BOOL v50 = 0;
  }
LABEL_23:

  return v50;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_handle(self, v5, v6);
  if (v7)
  {
    uint64_t v8 = v7;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      objc_super v12 = v9;
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = objc_msgSend_itemID(v4, v13, v14);
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "close, itemID:%llu, handle:%p", buf, 0x16u);
    }
    MKBBackupClose();
    objc_msgSend_setHandle_(self, v10, 0);
  }

  return 1;
}

- (id)getFileMetadataWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_MMCSItem(self, a2, (uint64_t)a3);
  if (!v7)
  {
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CKDMMCSEncryptedItemReader.m", 135, @"Expected non-nil MMCS item for %@", self);
  }
  uint64_t v10 = objc_msgSend_handle(self, v5, v6);
  if (!v10)
  {
    id v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CKDMMCSEncryptedItemReader.m", 137, @"Expected a valid handle for %@", self);
  }
  uint64_t v11 = MKBBackupSize();
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  objc_super v12 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = v12;
    *(_DWORD *)buf = 134218496;
    uint64_t v27 = objc_msgSend_itemID(v7, v20, v21);
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2048;
    uint64_t v31 = v11;
    _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "stat, itemID:%llu, handle:%p, fileSize:%lld", buf, 0x20u);
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1A118]);
  v15 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v14, v11);
  __int16 v17 = objc_msgSend_initWithFileSize_(v13, v16, (uint64_t)v15);

  return v17;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = objc_msgSend_MMCSRequest(self, a2, a3);
  uint64_t v18 = objc_msgSend_MMCSItem(self, v14, v15);
  if (!v18)
  {
    uint64_t v36 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, @"CKDMMCSEncryptedItemReader.m", 149, @"Expected non-nil MMCS item for %@", self);
  }
  uint64_t v21 = objc_msgSend_handle(self, v16, v17);
  if (!v21)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(log, v38, (uint64_t)a2, self, @"CKDMMCSEncryptedItemReader.m", 151, @"Expected a valid handle for %@", self);
  }
  v22 = objc_msgSend_operation(v13, v19, v20);
  objc_msgSend_setIsReaderReadFrom_(v18, v23, 1);
  unint64_t v24 = MKBBackupPread();
  int64_t v26 = v24;
  if ((v24 & 0x8000000000000000) != 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v25, *MEMORY[0x1E4F19DD8], 1000, @"MKBBackupPread failed");
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v28 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      loga = v28;
      uint64_t v32 = objc_msgSend_itemID(v18, v30, v31);
      objc_msgSend_operationID(v22, v33, v34);
      *(_DWORD *)buf = 134219266;
      uint64_t v42 = v32;
      __int16 v43 = 2048;
      uint64_t v44 = v21;
      v46 = __int16 v45 = 2114;
      v35 = (void *)v46;
      __int16 v47 = 2048;
      unint64_t v48 = a3;
      __int16 v49 = 2048;
      unint64_t v50 = a5;
      __int16 v51 = 2114;
      id v52 = v27;
      _os_log_error_impl(&dword_1C4CFF000, loga, OS_LOG_TYPE_ERROR, "MKBBackupPread failed for itemID:%llu, handle:%p, operationID:%{public}@, offset:0x%llx, length:%llu: %{public}@", buf, 0x3Eu);

      if (!a7) {
        goto LABEL_13;
      }
    }
    else if (!a7)
    {
      goto LABEL_13;
    }
    id v27 = v27;
    *a7 = v27;
    goto LABEL_13;
  }
  id v27 = 0;
  if (a6) {
    *a6 = v24;
  }
LABEL_13:

  return v26 >= 0;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5, a6);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CKDMMCSEncryptedItemReader.m", 176, @"writing not supported");

  if (a7)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 3001, @"write not supported");
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

- (_mkbbackupref)handle
{
  return self->_handle;
}

- (void)setHandle:(_mkbbackupref *)a3
{
  self->_handle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
}

@end