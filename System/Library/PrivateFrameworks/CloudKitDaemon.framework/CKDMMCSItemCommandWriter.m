@interface CKDMMCSItemCommandWriter
- (BOOL)closeWithError:(id *)a3;
- (BOOL)isContiguous;
- (BOOL)openWithError:(id *)a3;
- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7;
- (CKDMMCSItem)MMCSItem;
- (CKDMMCSItemCommandWriter)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4;
- (CKDMMCSItemGroupContext)MMCSRequest;
- (NSMutableIndexSet)byteRanges;
- (id)getFileMetadataWithError:(id *)a3;
- (unint64_t)maximumLength;
- (void)dealloc;
- (void)setByteRanges:(id)a3;
- (void)setMMCSItem:(id)a3;
- (void)setMMCSRequest:(id)a3;
- (void)setMaximumLength:(unint64_t)a3;
@end

@implementation CKDMMCSItemCommandWriter

- (CKDMMCSItemCommandWriter)initWithMMCSItem:(id)a3 MMCSRequest:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
    v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDMMCSItemCommandWriter.m", 27, @"Expected non-nil MMCS item");

    if (v12) {
      goto LABEL_3;
    }
  }
  v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKDMMCSItemCommandWriter.m", 28, @"Expected non-nil MMCS request for %@", v8);

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)CKDMMCSItemCommandWriter;
  v13 = [(CKDMMCSItemCommandWriter *)&v25 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_MMCSItem, a3);
    objc_storeStrong((id *)&v14->_MMCSRequest, a4);
    uint64_t v17 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v15, v16);
    byteRanges = v14->_byteRanges;
    v14->_byteRanges = (NSMutableIndexSet *)v17;

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v19 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v14;
      _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "init, reader:%p", buf, 0xCu);
    }
  }

  return v14;
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
  v4.super_class = (Class)CKDMMCSItemCommandWriter;
  [(CKDMMCSItemCommandWriter *)&v4 dealloc];
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
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 1, @"getFileMetadataWithError not implemented");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)readBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  if (a7)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], a2, *MEMORY[0x1E4F19DD8], 1, @"readBytesAtOffset not implemented", a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)isContiguous
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  CKNSIndexSet_enumerateInverseRangesInRange_options_usingBlock();
  BOOL v2 = *((unsigned char *)v5 + 24) == 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)writeBytesAtOffset:(unint64_t)a3 bytes:(char *)a4 length:(unint64_t)a5 bytesWritten:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_containsIndexesInRange_(self->_byteRanges, a2, a3, a5))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v14 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v29 = v14;
      v36.location = a3;
      v36.length = a5;
      v30 = NSStringFromRange(v36);
      *(_DWORD *)buf = 138543362;
      v34 = v30;
      _os_log_error_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_ERROR, "range %{public}@ overlaps with previous range", buf, 0xCu);
    }
  }
  objc_msgSend_addIndexesInRange_(self->_byteRanges, v13, a3, a5);
  if (self->_maximumLength < a5 + a3) {
    self->_maximumLength = a5 + a3;
  }
  uint64_t v16 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v15, (uint64_t)a4, a5);
  v18 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v17, a3);
  v31[0] = @"Data";
  v31[1] = @"Offset";
  v32[0] = v16;
  v32[1] = v18;
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v32, v31, 2);
  v23 = objc_msgSend_MMCSRequest(self, v21, v22);
  v26 = objc_msgSend_MMCSItem(self, v24, v25);
  objc_msgSend_handleCommand_forItem_(v23, v27, (uint64_t)v20, v26);

  if (a6) {
    *a6 = a5;
  }
  if (a7) {
    *a7 = 0;
  }

  return 1;
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

- (NSMutableIndexSet)byteRanges
{
  return self->_byteRanges;
}

- (void)setByteRanges:(id)a3
{
}

- (unint64_t)maximumLength
{
  return self->_maximumLength;
}

- (void)setMaximumLength:(unint64_t)a3
{
  self->_maximumLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteRanges, 0);
  objc_storeStrong((id *)&self->_MMCSItem, 0);
  objc_storeStrong((id *)&self->_MMCSRequest, 0);
}

@end