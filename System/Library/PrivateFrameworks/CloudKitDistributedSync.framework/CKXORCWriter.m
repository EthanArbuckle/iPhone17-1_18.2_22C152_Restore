@interface CKXORCWriter
- ($3CC19D079FD0B010EE84973AA846B91B)beginReferencedListForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)appendRowForStruct:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginAppendedListStructInList:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginReferencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginRootStructWithType:(SEL)a3 error:(unint64_t)a4;
- (BOOL)commitBatchIfNeededWithError:(id *)a3;
- (BOOL)commitBatchWithError:(id *)a3;
- (BOOL)createWriterWithError:(id *)a3;
- (BOOL)flushWithError:(id *)a3;
- (BOOL)growCurrentBatchToIncludeBatchOffset:(unint64_t)a3;
- (BOOL)growCurrentBatchToIncludeRow:(unint64_t)a3;
- (BOOL)setWritableStorage:(id)a3 error:(id *)a4;
- (CKDSWritableStorage)storage;
- (CKXORCHelpers)helpers;
- (CKXORCWriter)initWithSchema:(id)a3;
- (CKXORCWriter)initWithSchema:(id)a3 helpers:(id)a4 options:(id)a5;
- (CKXORCWriterOptions)options;
- (NSError)writeError;
- (id).cxx_construct;
- (unint64_t)commitCount;
- (unint64_t)offsetInCurrentBatchForRow:(unint64_t)a3;
- (unint64_t)rootStructToken;
- (unint64_t)startingRowForCurrentBatch;
- (unint64_t)valueSizeForField:(unint64_t)a3;
- (void)_appendData:(void *)a3 withValueSize:(unint64_t)a4 length:(unint64_t)a5 toRow:(unint64_t)a6 toList:(unint64_t)a7;
- (void)assignStruct:(id *)a3 toReference:(unint64_t)a4 inStruct:(id *)a5;
- (void)commitStruct:(id *)a3;
- (void)enumerateAllColumnsWithBlock:(id)a3;
- (void)expandColumn:(void *)a3 includingBatchOffset:(unint64_t)a4;
- (void)expandColumn:(void *)a3 includingRow:(unint64_t)a4;
- (void)listColumnForReference:(unint64_t)a3;
- (void)resetColumnNulls:(void *)a3 inRange:(_NSRange)a4;
- (void)rootColumn;
- (void)setCommitCount:(unint64_t)a3;
- (void)setData:(void *)a3 withEncoding:(const char *)a4 forField:(unint64_t)a5 inStruct:(id *)a6;
- (void)setData:(void *)a3 withLength:(unint64_t)a4 forList:(id *)a5;
- (void)setRootStructToken:(unint64_t)a3;
- (void)setStartingRowForCurrentBatch:(unint64_t)a3;
- (void)setStorage:(id)a3;
- (void)setWriteError:(id)a3;
- (void)structColumnForStruct:(unint64_t)a3;
- (void)structReferenceColumnForReference:(unint64_t)a3;
- (void)updateNumberOfElementsForCurrentBatch;
- (void)valueColumnForField:(unint64_t)a3;
@end

@implementation CKXORCWriter

- (CKXORCWriter)initWithSchema:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  v5 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v4, v6, *MEMORY[0x1E4F1C3B8], @"%@ is unavailable", v5);

  return 0;
}

- (CKXORCWriter)initWithSchema:(id)a3 helpers:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (!v10)
  {
    v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 667, @"The ORC writer requires a helper object conforming to CKXORCHelpers");
  }
  v20.receiver = self;
  v20.super_class = (Class)CKXORCWriter;
  v14 = [(CKXWriterBase *)&v20 initWithSchema:v9];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_helpers, a4);
    v16 = v13;
    if (!v13) {
      v16 = objc_opt_new();
    }
    objc_storeStrong((id *)&v15->_options, v16);
    if (!v13) {

    }
    v15->_rootStructToken = -1;
  }

  return v15;
}

- (void)resetColumnNulls:(void *)a3 inRange:(_NSRange)a4
{
  NSUInteger v4 = *((void *)a3 + 1);
  if (v4 >= a4.location + a4.length) {
    NSUInteger v4 = a4.location + a4.length;
  }
  memset((void *)(*((void *)a3 + 5) + a4.location), *((unsigned __int8 *)a3 + 64) ^ 1, v4 - a4.location);
}

- (BOOL)createWriterWithError:(id *)a3
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_storage(self, a2, (uint64_t)a3);

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    v7 = NSStringFromSelector(sel_setWritableStorage_error_);
    objc_msgSend_raise_format_(v6, v8, *MEMORY[0x1E4F1C3C8], @"Call %@ before writing data", v7);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DD310E18;
  v13[3] = &unk_1E6CBAD30;
  v13[4] = self;
  v13[5] = a2;
  id v9 = v13;
  sub_1DD310E18((uint64_t)v9, v10, v11);

  return 1;
}

- (void)updateNumberOfElementsForCurrentBatch
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  value = self->_currentBatch.__ptr_.__value_;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1DD3115B8;
  v4[3] = &unk_1E6CBADF8;
  v4[4] = &v5;
  objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, a2, (uint64_t)value, 0, 1, v4);
  *((void *)self->_currentBatch.__ptr_.__value_ + 2) = v6[3];
  _Block_object_dispose(&v5, 8);
}

- (BOOL)commitBatchWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = objc_msgSend_writeError(self, a2, (uint64_t)a3);

  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F1A510];
  if (v4)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1DD237000, v9, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Calling commitBatch while writeError is present", buf, 2u);
    }
  }
  if (self->_uncommittedStructs.__tree_.__pair3_.__value_)
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1DD237000, v10, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Committing batch while uncommitted structs are still present", buf, 2u);
    }
  }
  objc_msgSend_updateNumberOfElementsForCurrentBatch(self, v5, v6);
  uint64_t v12 = *((void *)self->_currentBatch.__ptr_.__value_ + 2);
  if (v12)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1DD311B30;
    v30[3] = &unk_1E6CBAE20;
    v30[4] = self;
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v11, (uint64_t)v30);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1DD311BF0;
    v29[3] = &unk_1E6CBAD08;
    v29[4] = self;
    id v13 = v29;
    sub_1DD311BF0((uint64_t)v13, v14, v15);

    objc_msgSend_enumerateAllColumnsWithBlock_(self, v16, (uint64_t)&unk_1F387CF20);
    sub_1DD314A68((void *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
    self->_uncommittedStructs.__tree_.__begin_node_ = &self->_uncommittedStructs.__tree_.__pair1_;
    self->_uncommittedStructs.__tree_.__pair3_.__value_ = 0;
    self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_ = 0;
    (*(void (**)(ColumnVectorBatch *))(*(void *)self->_currentBatch.__ptr_.__value_ + 32))(self->_currentBatch.__ptr_.__value_);
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v17, (uint64_t)&unk_1F387D000);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1DD311EBC;
    v28[3] = &unk_1E6CBAE20;
    v28[4] = self;
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v18, (uint64_t)v28);
    uint64_t v21 = objc_msgSend_startingRowForCurrentBatch(self, v19, v20);
    objc_msgSend_setStartingRowForCurrentBatch_(self, v22, v21 + v12);
    uint64_t v25 = objc_msgSend_commitCount(self, v23, v24);
    objc_msgSend_setCommitCount_(self, v26, v25 + 1);
  }
  return 1;
}

- (BOOL)commitBatchIfNeededWithError:(id *)a3
{
  if (self->_uncommittedStructs.__tree_.__pair3_.__value_) {
    return 1;
  }
  objc_msgSend_updateNumberOfElementsForCurrentBatch(self, a2, (uint64_t)a3);
  value = self->_currentBatch.__ptr_.__value_;
  unint64_t v7 = *((void *)value + 1);
  uint64_t v6 = *((void *)value + 2);
  id v10 = objc_msgSend_options(self, v8, v9);
  objc_msgSend_batchCommitMarginPercentage(v10, v11, v12);
  unint64_t v14 = (unint64_t)(v13 * (double)v7);

  if (v6 + v14 < v7) {
    return 1;
  }
  return objc_msgSend_commitBatchWithError_(self, v15, (uint64_t)a3);
}

- (BOOL)growCurrentBatchToIncludeBatchOffset:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  value = self->_currentBatch.__ptr_.__value_;
  unint64_t v7 = *((void *)value + 1);
  if (v7 > a3)
  {
    unint64_t v25 = *((void *)value + 1);
  }
  else
  {
    uint64_t v8 = objc_msgSend_options(self, a2, a3);
    unint64_t v11 = objc_msgSend_batchSize((void *)v8, v9, v10);

    LOBYTE(v8) = a3 + 1 > v11;
    unint64_t v14 = objc_msgSend_options(self, v12, v13);
    v17 = v14;
    if (v8)
    {
      unint64_t v18 = objc_msgSend_batchResizeIncrement(v14, v15, v16);
      uint64_t v21 = objc_msgSend_options(self, v19, v20);
      uint64_t v24 = objc_msgSend_batchResizeIncrement(v21, v22, v23) * ((a3 + 1) / v18 + 1);
    }
    else
    {
      uint64_t v24 = objc_msgSend_batchSize(v14, v15, v16);
    }

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v26 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v33 = v7;
      __int16 v34 = 2048;
      uint64_t v35 = v24;
      _os_log_debug_impl(&dword_1DD237000, v26, OS_LOG_TYPE_DEBUG, "Growing ORC write batch to size %llu->%llu", buf, 0x16u);
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1DD312240;
    v31[3] = &unk_1E6CBAE48;
    v31[5] = v24;
    v31[6] = a2;
    v31[4] = self;
    objc_msgSend_enumerateAllColumnsWithBlock_(self, v27, (uint64_t)v31);
    unint64_t v25 = *((void *)self->_currentBatch.__ptr_.__value_ + 1);
  }
  if (v25 <= a3)
  {
    v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 876, @"Incorrect rows loaded: batch offset %llu does not fit in range %d->%llu", a3, 0, v25);
  }
  return v7 <= a3;
}

- (BOOL)growCurrentBatchToIncludeRow:(unint64_t)a3
{
  if (objc_msgSend_startingRowForCurrentBatch(self, a2, a3) > a3) {
    return 0;
  }
  uint64_t v9 = a3 - objc_msgSend_startingRowForCurrentBatch(self, v5, v6);
  return objc_msgSend_growCurrentBatchToIncludeBatchOffset_(self, v8, v9);
}

- (unint64_t)offsetInCurrentBatchForRow:(unint64_t)a3
{
  if (objc_msgSend_startingRowForCurrentBatch(self, a2, a3) > a3)
  {
    unint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    uint64_t v14 = objc_msgSend_startingRowForCurrentBatch(self, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v15, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 895, @"Can't access row (%llu) smaller than the current batch starting row (%llu)", a3, v14);
  }
  objc_msgSend_growCurrentBatchToIncludeRow_(self, v6, a3);
  return a3 - objc_msgSend_startingRowForCurrentBatch(self, v8, v9);
}

- (void)expandColumn:(void *)a3 includingBatchOffset:(unint64_t)a4
{
  if (a3)
  {
    unint64_t v4 = *((void *)a3 + 2);
    if (v4 <= a4 + 1) {
      unint64_t v5 = a4 + 1;
    }
    else {
      unint64_t v5 = *((void *)a3 + 2);
    }
    *((void *)a3 + 2) = v5;
    if (*((unsigned char *)a3 + 64)) {
      *(unsigned char *)(*((void *)a3 + 5) + a4) = 1;
    }
    uint64_t v6 = __dynamic_cast(a3, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878100, 0);
    unint64_t v7 = v4 + 1;
    if (v6) {
      BOOL v8 = v7 > v5;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      uint64_t v9 = v6[12];
      do
        *(void *)(v9 + 8 * v7++) = *(void *)(v9 + 8 * v4);
      while (v7 <= v5);
    }
  }
}

- (void)expandColumn:(void *)a3 includingRow:(unint64_t)a4
{
  uint64_t v7 = objc_msgSend_offsetInCurrentBatchForRow_(self, a2, a4);
  objc_msgSend_expandColumn_includingBatchOffset_(self, v6, (uint64_t)a3, v7);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)appendRowForStruct:(SEL)a3
{
  BOOL v8 = objc_msgSend_writeError(self, a3, a4);

  if (v8)
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
    return result;
  }
  uint64_t v11 = objc_msgSend_structColumnForStruct_(self, v10, a4);
  uint64_t v14 = objc_msgSend_options(self, v12, v13);
  int v17 = objc_msgSend_testRowsInterspersedWithNulls(v14, v15, v16);

  if (v17)
  {
    if (!arc4random_uniform(0xAu))
    {
      uint64_t v20 = *(void *)(v11 + 16) + arc4random_uniform(3u) + 1;
      if (*(void *)(v11 + 8) > (unint64_t)(v20 + 1)) {
        *(void *)(v11 + 16) = v20;
      }
    }
  }
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v21 = objc_msgSend_schema(self, v18, v19);
  uint64_t v24 = (const char *)objc_msgSend_rootStructToken(self, v22, v23);
  if (sub_1DD2FE7C8((BOOL)v21, v24, v25))
  {
    v28 = objc_msgSend_schema(self, v26, v27);
    unint64_t v31 = objc_msgSend_rootStructToken(self, v29, v30);
    uint64_t v32 = sub_1DD2FE4C8(v28, v31);

    if (v32 == 1)
    {
      uint64_t v35 = objc_msgSend_schema(self, v33, v34);
      unint64_t v38 = objc_msgSend_rootStructToken(self, v36, v37);
      uint64_t v39 = sub_1DD2FE638((uint64_t)v35, 0, v38);

      v70[3] = 0;
      if (v39 == a4)
      {
        value = self->_currentBatch.__ptr_.__value_;
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = sub_1DD3128FC;
        v68[3] = &unk_1E6CBADF8;
        v68[4] = &v69;
        objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v40, (uint64_t)value, 0, 1, v68);
      }
      else
      {
        uint64_t v47 = *(void *)(objc_msgSend_structColumnForStruct_(self, v40, v39) + 16);
        unint64_t v49 = *(void *)(objc_msgSend_structColumnForStruct_(self, v48, a4) + 16);
        unint64_t v50 = v47 - 1;
        if (!v47) {
          unint64_t v50 = 0;
        }
        if (v49 <= v50) {
          unint64_t v49 = v50;
        }
        v70[3] = v49;
      }
      uint64_t v51 = objc_msgSend_startingRowForCurrentBatch(self, v42, v43);
      v46 = v70;
      uint64_t v45 = v70[3] + v51;
      goto LABEL_19;
    }
  }
  else
  {
  }
  uint64_t v45 = *(void *)(v11 + 16) + objc_msgSend_startingRowForCurrentBatch(self, v33, v34);
  v46 = v70;
LABEL_19:
  v46[3] = v45;
  objc_msgSend_growCurrentBatchToIncludeRow_(self, v44, v45);
  if ((unint64_t)(*(void *)(v11 + 16) + 1) > *(void *)(v11 + 8))
  {
    v66 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v52, v53);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v67, (uint64_t)a3, self, @"CKXORCReaderWriter.mm", 970, @"Number of elements in batch exceeds capacity");
  }
  retstr->var0 = a4;
  retstr->var1 = 0;
  retstr->var2 = v70[3];
  objc_msgSend_expandColumn_includingRow_(self, v52, v11);
  uint64_t v56 = objc_msgSend_rootColumn(self, v54, v55);
  uint64_t v58 = objc_msgSend_offsetInCurrentBatchForRow_(self, v57, v70[3]);
  v61 = objc_msgSend_schema(self, v59, v60);
  v64 = objc_msgSend_helpers(self, v62, v63);
  objc_msgSend_setDefaultValuesForStruct_withRootColumn_atOffset_withSchema_orcHelpers_(CKXORCUtilities, v65, a4, v56, v58, v61, v64);

  _Block_object_dispose(&v69, 8);
  return result;
}

- (void)enumerateAllColumnsWithBlock:(id)a3
{
}

- (void)rootColumn
{
  result = self->_currentBatch.__ptr_.__value_;
  if (result) {
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
  }
  return result;
}

- (BOOL)setWritableStorage:(id)a3 error:(id *)a4
{
  unint64_t v5 = (CKDSWritableStorage *)a3;
  value = self->_writer.__ptr_.__value_;
  self->_writer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Writer *))(*(void *)value + 8))(value);
  }
  uint64_t v7 = self->_outputStream.__ptr_.__value_;
  self->_outputStream.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(OutputStream *))(*(void *)v7 + 8))(v7);
  }
  BOOL v8 = self->_currentBatch.__ptr_.__value_;
  self->_currentBatch.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(ColumnVectorBatch *))(*(void *)v8 + 8))(v8);
  }
  sub_1DD314A68((void *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
  self->_uncommittedStructs.__tree_.__begin_node_ = &self->_uncommittedStructs.__tree_.__pair1_;
  self->_uncommittedStructs.__tree_.__pair3_.__value_ = 0;
  self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_ = 0;
  self->_rootStructToken = 0;
  self->_startingRowForCurrentBatch = 0;
  self->_commitCount = 0;
  writeError = self->_writeError;
  self->_writeError = 0;

  storage = self->_storage;
  self->_storage = v5;

  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginRootStructWithType:(SEL)a3 error:(unint64_t)a4
{
  id v20 = 0;
  char WriterWithError = objc_msgSend_createWriterWithError_(self, a3, (uint64_t)&v20);
  id v10 = v20;
  uint64_t v12 = v10;
  if (WriterWithError)
  {
    objc_msgSend_setRootStructToken_(self, v11, a4);
    uint64_t v15 = objc_msgSend_schema(self, v13, v14);
    BOOL v17 = sub_1DD2FE7C8((BOOL)v15, (const char *)a4, v16);

    if (v17)
    {
      retstr->var0 = a4;
      *(_OWORD *)&retstr->var1 = xmmword_1DD3261C0;
    }
    else
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0;
      objc_msgSend_appendRowForStruct_(self, v18, a4);
    }
  }
  else
  {
    if (a5) {
      *a5 = v10;
    }
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginReferencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  if (a5->var1 == 1)
  {
    uint64_t v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a3, a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a3, self, @"CKXORCReaderWriter.mm", 1027, @"Invalid struct");
  }
  uint64_t v9 = objc_msgSend_writeError(self, a3, a4);

  if (v9)
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->unint64_t var2 = -1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_schema(self, v11, v12);
    uint64_t v15 = sub_1DD2FE38C((uint64_t)v13, (const char *)a4, v14);

    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->unint64_t var2 = 0;
    objc_msgSend_appendRowForStruct_(self, v16, v15);
    long long v23 = *(_OWORD *)&retstr->var0;
    unint64_t var2 = retstr->var2;
    long long v21 = *(_OWORD *)&a5->var0;
    unint64_t v22 = a5->var2;
    objc_msgSend_assignStruct_toReference_inStruct_(self, v17, (uint64_t)&v23, a4, &v21);
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)sub_1DD314AB4((uint64_t *)&self->_uncommittedStructs, &retstr->var0, (uint64_t)retstr);
  }
  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)beginReferencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  uint64_t v9 = objc_msgSend_writeError(self, a3, a4);

  if (v9)
  {
    *(_OWORD *)&retstr->var0 = xmmword_1DD3262D0;
    unint64_t var2 = -1;
    retstr->unint64_t var2 = -1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_schema(self, v11, v12);
    uint64_t v16 = sub_1DD2FE0E0((uint64_t)v14, (const char *)a4, v15);

    if (v16)
    {
      unint64_t v19 = -1;
    }
    else
    {
      id v20 = objc_msgSend_schema(self, v17, v18);
      unint64_t v19 = sub_1DD2FE42C((uint64_t)v20, (const char *)a4, v21);
    }
    if (a5->var1 == 1)
    {
      retstr->var0 = v19;
      retstr->var1 = a4;
      retstr->unint64_t var2 = 1;
      retstr->var3 = a4;
      return result;
    }
    unint64_t var2 = a5->var2;
    retstr->var0 = v19;
    retstr->var1 = a4;
    retstr->unint64_t var2 = 0;
  }
  retstr->var3 = var2;
  return result;
}

- (void)_appendData:(void *)a3 withValueSize:(unint64_t)a4 length:(unint64_t)a5 toRow:(unint64_t)a6 toList:(unint64_t)a7
{
  uint64_t v11 = (char *)a3;
  if (a4 != 8)
  {
    unint64_t v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1064, @"Array integer size %lu not supported", a4);
  }
  uint64_t v14 = objc_msgSend_writeError(self, a2, (uint64_t)a3);

  if (!v14) {
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v16 = *MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1DD237000, v16, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Calling _appendData while writeError is present", buf, 2u);
    if (!a5) {
      return;
    }
  }
  else
  {
LABEL_7:
    if (!a5) {
      return;
    }
  }
  BOOL v17 = objc_msgSend_listColumnForReference_(self, v15, a7);
  objc_msgSend_expandColumn_includingRow_(self, v18, (uint64_t)v17, a6);
  id v20 = (const void *)v17[15];
  if (v20) {
    uint64_t v21 = __dynamic_cast(v20, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878118, 0);
  }
  else {
    uint64_t v21 = 0;
  }
  unint64_t v24 = objc_msgSend_offsetInCurrentBatchForRow_(self, v19, a6) + 1;
  uint64_t v25 = *(void *)(v17[12] + 8 * v24);
  if (v25 != v21[2])
  {
    unint64_t v33 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1086, @"Can't append to any list row other than the last one");
  }
  objc_msgSend_growCurrentBatchToIncludeBatchOffset_(self, v22, a5 + v25 - 1);
  uint64_t v27 = v25;
  unint64_t v28 = a5;
  do
  {
    objc_msgSend_expandColumn_includingBatchOffset_(self, v26, (uint64_t)v21, v27++);
    --v28;
  }
  while (v28);
  if (v24 <= v17[2])
  {
    uint64_t v29 = v17[12];
    do
      *(void *)(v29 + 8 * v24++) += a5;
    while (v24 <= v17[2]);
  }
  uint64_t v30 = (void *)(v21[12] + 8 * v25);
  do
  {
    uint64_t __dst = 0;
    memcpy(&__dst, v11, a4);
    *v30++ = __dst;
    v11 += a4;
    --a5;
  }
  while (a5);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginAppendedListStructInList:(SEL)a3
{
  if (a4->var0 == -1)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a3, self, @"CKXORCReaderWriter.mm", 1108, @"Invalid struct");
  }
  uint64_t v7 = objc_msgSend_writeError(self, a3, (uint64_t)a4);

  if (v7)
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->unint64_t var2 = -1;
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->unint64_t var2 = 0;
    objc_msgSend_appendRowForStruct_(self, v9, a4->var0);
    if (a4->var2 == 1)
    {
      return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)sub_1DD314AB4((uint64_t *)&self->_uncommittedStructs, &retstr->var0, (uint64_t)retstr);
    }
    else
    {
      unint64_t v14 = retstr->var2 - a4->var3;
      objc_msgSend__appendData_withValueSize_length_toRow_toList_(self, v10, (uint64_t)&v14, 8, 1);
      return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)sub_1DD314AB4((uint64_t *)&self->_uncommittedStructs, &retstr->var0, (uint64_t)retstr);
    }
  }
  return result;
}

- (unint64_t)valueSizeForField:(unint64_t)a3
{
  unint64_t v4 = objc_msgSend_schema(self, a2, a3);
  unint64_t v6 = sub_1DD2FE180((uint64_t)v4, (const char *)a3, v5);

  return v6;
}

- (void)setData:(void *)a3 withEncoding:(const char *)a4 forField:(unint64_t)a5 inStruct:(id *)a6
{
  if (a6->var1 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v27, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1148, @"Invalid struct");
  }
  uint64_t v12 = objc_msgSend_writeError(self, a2, (uint64_t)a3);

  if (!v12)
  {
    unint64_t v14 = (const void *)objc_msgSend_valueColumnForField_(self, v13, a5);
    if (v14) {
      uint64_t v16 = __dynamic_cast(v14, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878118, 0);
    }
    else {
      uint64_t v16 = 0;
    }
    unint64_t var2 = a6->var2;
    objc_msgSend_expandColumn_includingRow_(self, v15, (uint64_t)v16, var2);
    objc_msgSend_typeForEncoding_(MEMORY[0x1E4F1A1F0], v18, (uint64_t)a4);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    size_t v20 = objc_msgSend_valueSizeForField_(self, v19, a5);
    if (v20 != objc_msgSend_size(v33, v21, v22))
    {
      unint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v23, v24);
      uint64_t v31 = objc_msgSend_size(v33, v29, v30);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v32, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1161, @"Invalid size for data (is %lu, expecting %lu)", v20, v31);
    }
    *(void *)(v16[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v23, var2)) = 0;
    uint64_t v26 = objc_msgSend_offsetInCurrentBatchForRow_(self, v25, var2);
    memcpy((void *)(v16[12] + 8 * v26), a3, v20);
  }
}

- (void)setData:(void *)a3 withLength:(unint64_t)a4 forList:(id *)a5
{
  if (a5->var0 != -1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v36, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1167, @"Invalid struct");
  }
  if (a5->var2 == 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v37, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1168, @"Invalid list");
  }
  id v10 = objc_msgSend_writeError(self, a2, (uint64_t)a3);

  if (!v10)
  {
    objc_msgSend_schema(self, v11, v12);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = sub_1DD2FE0E0((uint64_t)v39, (const char *)a5->var1, v13);

    if ((unint64_t)(v14 - 1) < 2)
    {
      uint64_t v21 = (const void *)objc_msgSend_valueColumnForField_(self, v15, a5->var1);
      if (v21) {
        uint64_t v23 = __dynamic_cast(v21, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F38782D0, 0);
      }
      else {
        uint64_t v23 = 0;
      }
      unint64_t var3 = a5->var3;
      objc_msgSend_expandColumn_includingRow_(self, v22, (uint64_t)v23, var3);
      if (*(void *)(v23[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v26, var3)))
      {
        uint64_t v29 = objc_msgSend_offsetInCurrentBatchForRow_(self, v27, var3);
        free(*(void **)(v23[12] + 8 * v29));
        *(void *)(v23[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v30, var3)) = 0;
      }
      if (a3)
      {
        uint64_t v31 = malloc_type_malloc(a4, 0xFCBB8C78uLL);
        *(void *)(v23[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v32, var3)) = v31;
        uint64_t v34 = objc_msgSend_offsetInCurrentBatchForRow_(self, v33, var3);
        memcpy(*(void **)(v23[12] + 8 * v34), a3, a4);
      }
      else
      {
        if (a4)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v27, v28);
          id v43 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v38, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1199, @"Attempting to set null data with non-zero length");
        }
        *(unsigned char *)(v23[5] + objc_msgSend_offsetInCurrentBatchForRow_(self, v27, var3)) = 0;
      }
      *(void *)(v23[17] + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v35, var3)) = a4;
    }
    else if (v14)
    {
      if (v14 == 3)
      {
        unint64_t v17 = a5->var3;
        uint64_t v19 = objc_msgSend_valueSizeForField_(self, v15, a5->var1);
        unint64_t var1 = a5->var1;
        objc_msgSend__appendData_withValueSize_length_toRow_toList_(self, v18, (uint64_t)a3, v19, a4, v17, var1);
      }
    }
    else
    {
      objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v24, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1178, @"Invalid list type");
    }
  }
}

- (void)assignStruct:(id *)a3 toReference:(unint64_t)a4 inStruct:(id *)a5
{
  if (a3->var1 == 1)
  {
    uint64_t v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1219, @"Invalid struct");
  }
  if (a5->var1 == 1)
  {
    uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1220, @"Invalid struct");
  }
  unint64_t var0 = a3->var0;
  uint64_t v11 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  uint64_t v13 = sub_1DD2FE38C((uint64_t)v11, (const char *)a4, v12);

  if (var0 != v13)
  {
    uint64_t v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1221, @"Invalid struct type");
  }
  uint64_t v16 = objc_msgSend_writeError(self, v14, v15);

  if (!v16)
  {
    uint64_t v18 = objc_msgSend_structReferenceColumnForReference_(self, v17, a4);
    unint64_t var2 = a5->var2;
    objc_msgSend_expandColumn_includingRow_(self, v20, v18, var2);
    unint64_t v21 = a3->var2 - var2;
    *(void *)(*(void *)(v18 + 96) + 8 * objc_msgSend_offsetInCurrentBatchForRow_(self, v22, var2)) = v21;
  }
}

- (void)commitStruct:(id *)a3
{
  if (a3->var1 == 1)
  {
    uint64_t v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1244, @"Invalid struct");
  }
  uint64_t v5 = objc_msgSend_writeError(self, a2, (uint64_t)a3);

  if (v5) {
    return;
  }
  p_uncommittedStructs = &self->_uncommittedStructs;
  left = (uint64_t *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_33;
  }
  unint64_t var1 = a3->var1;
  unint64_t var2 = a3->var2;
  p_pair1 = (CKXORCWriter *)&self->_uncommittedStructs.__tree_.__pair1_;
  isa = (CKXORCWriter *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_;
  unint64_t var0 = a3->var0;
  do
  {
    unint64_t begin_node = (unint64_t)isa->_uncommittedStructs.__tree_.__begin_node_;
    if (begin_node < var1)
    {
LABEL_7:
      isa = (CKXORCWriter *)((char *)isa + 8);
      goto LABEL_10;
    }
    if (begin_node > var1) {
      goto LABEL_9;
    }
    unint64_t v15 = (unint64_t)isa->_uncommittedStructs.__tree_.__pair1_.__value_.__left_;
    if (v15 < var2) {
      goto LABEL_7;
    }
    if (v15 > var2)
    {
LABEL_9:
      p_pair1 = isa;
    }
    else if (isa->_currentBatch.__ptr_.__value_ < (ColumnVectorBatch *)var0)
    {
      isa = (CKXORCWriter *)((char *)isa + 8);
    }
    else
    {
      p_pair1 = isa;
    }
LABEL_10:
    isa = (CKXORCWriter *)isa->super.super.isa;
  }
  while (isa);
  if (&self->_uncommittedStructs.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<CKXStructInstance, void *>>> *)p_pair1)
  {
    uint64_t v16 = p_pair1->_uncommittedStructs.__tree_.__begin_node_;
    if (var1 >= (unint64_t)v16)
    {
      if (var1 > (unint64_t)v16
        || (uint64_t v19 = p_pair1->_uncommittedStructs.__tree_.__pair1_.__value_.__left_, var2 >= (unint64_t)v19)
        && (var2 > (unint64_t)v19 || (ColumnVectorBatch *)var0 >= p_pair1->_currentBatch.__ptr_.__value_))
      {
        schema = p_pair1->super._schema;
        if (schema)
        {
          do
          {
            value = (CKXORCWriter **)schema;
            schema = (CKXSchema *)schema->super.isa;
          }
          while (schema);
        }
        else
        {
          size_t v20 = p_pair1;
          do
          {
            value = (CKXORCWriter **)v20->_writer.__ptr_.__value_;
            BOOL v21 = *value == v20;
            size_t v20 = (CKXORCWriter *)value;
          }
          while (!v21);
        }
        if (p_uncommittedStructs->__tree_.__begin_node_ == p_pair1) {
          p_uncommittedStructs->__tree_.__begin_node_ = value;
        }
        --self->_uncommittedStructs.__tree_.__pair3_.__value_;
        sub_1DD2F535C(left, (uint64_t *)p_pair1);
        operator delete(p_pair1);
      }
    }
  }
LABEL_33:
  id v28 = 0;
  char v22 = objc_msgSend_commitBatchIfNeededWithError_(self, v6, (uint64_t)&v28);
  id v24 = v28;
  if ((v22 & 1) == 0) {
    objc_msgSend_setWriteError_(self, v23, (uint64_t)v24);
  }
}

- (BOOL)flushWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_writer.__ptr_.__value_) {
    goto LABEL_8;
  }
  id v27 = 0;
  int WriterWithError = objc_msgSend_createWriterWithError_(self, a2, (uint64_t)&v27);
  id v6 = v27;
  uint64_t v7 = v6;
  if (a3) {
    char v8 = WriterWithError;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0) {
    *a3 = v6;
  }

  if (WriterWithError)
  {
LABEL_8:
    uint64_t v9 = objc_msgSend_writeError(self, a2, (uint64_t)a3);
    BOOL v10 = v9 == 0;

    objc_msgSend_writeError(self, v11, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      sub_1DD314A68((void *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
      self->_uncommittedStructs.__tree_.__begin_node_ = &self->_uncommittedStructs.__tree_.__pair1_;
      self->_uncommittedStructs.__tree_.__pair3_.__value_ = 0;
      self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_ = 0;
      id v26 = v13;
      int v15 = objc_msgSend_commitBatchWithError_(self, v14, (uint64_t)&v26);
      id v16 = v26;

      if (v15)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_1DD314130;
        v25[3] = &unk_1E6CBAD08;
        v25[4] = self;
        unint64_t v17 = v25;
        sub_1DD314130((uint64_t)v17);

        id v13 = v16;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v18 = (id)*MEMORY[0x1E4F1A510];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = objc_msgSend_startingRowForCurrentBatch(self, v19, v20);
          *(_DWORD *)buf = 134217984;
          uint64_t v29 = v24;
          _os_log_debug_impl(&dword_1DD237000, v18, OS_LOG_TYPE_DEBUG, "Flushed ORC writer with rows: %llu", buf, 0xCu);
        }

        BOOL v21 = 1;
        goto LABEL_24;
      }
      id v13 = v16;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v22 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v13;
      _os_log_debug_impl(&dword_1DD237000, v22, OS_LOG_TYPE_DEBUG, "Error flushing ORC writer: %@", buf, 0xCu);
      if (a3) {
        goto LABEL_21;
      }
    }
    else if (a3)
    {
LABEL_21:
      id v13 = v13;
      BOOL v21 = 0;
      *a3 = v13;
LABEL_24:

      return v21;
    }
    BOOL v21 = 0;
    goto LABEL_24;
  }
  return 0;
}

- (void)structColumnForStruct:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_rootColumn(self, a2, a3);
  char v8 = objc_msgSend_helpers(self, v6, v7);
  uint64_t v10 = objc_msgSend_topLevelIndexForStruct_(v8, v9, a3);

  result = *(void **)(*(void *)(v5 + 80) + 8 * v10);
  if (result)
  {
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
  }
  return result;
}

- (void)structReferenceColumnForReference:(unint64_t)a3
{
  id v6 = objc_msgSend_schema(self, a2, a3);
  if (v6) {
    uint64_t v7 = *(void *)(v6[10] + 56 * a3 + 16);
  }
  else {
    uint64_t v7 = 0;
  }

  uint64_t v9 = objc_msgSend_structColumnForStruct_(self, v8, v7);
  uint64_t v12 = objc_msgSend_helpers(self, v10, v11);
  unint64_t v14 = objc_msgSend_structReferenceIndexForReference_(v12, v13, a3);

  uint64_t v17 = *(void *)(v9 + 80);
  if (v14 >= (*(void *)(v9 + 88) - v17) >> 3
    || (uint64_t v18 = *(const void **)(v17 + 8 * v14)) == 0
    || (result = __dynamic_cast(v18, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878118, 0)) == 0)
  {
    uint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1313, @"Unexpected null struct reference column in writer");

    return 0;
  }
  return result;
}

- (void)listColumnForReference:(unint64_t)a3
{
  id v6 = objc_msgSend_schema(self, a2, a3);
  if (v6) {
    uint64_t v7 = *(void *)(v6[10] + 56 * a3 + 16);
  }
  else {
    uint64_t v7 = 0;
  }

  uint64_t v9 = objc_msgSend_structColumnForStruct_(self, v8, v7);
  uint64_t v12 = objc_msgSend_helpers(self, v10, v11);
  unint64_t v14 = objc_msgSend_listColumnIndexForReference_(v12, v13, a3);

  uint64_t v17 = *(void *)(v9 + 80);
  if (v14 >= (*(void *)(v9 + 88) - v17) >> 3
    || (uint64_t v18 = *(const void **)(v17 + 8 * v14)) == 0
    || (result = __dynamic_cast(v18, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878100, 0)) == 0)
  {
    uint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1322, @"Unexpected null struct list column in writer");

    return 0;
  }
  return result;
}

- (void)valueColumnForField:(unint64_t)a3
{
  id v6 = objc_msgSend_schema(self, a2, a3);
  if (v6) {
    uint64_t v7 = *(void *)(v6[10] + 56 * a3 + 16);
  }
  else {
    uint64_t v7 = 0;
  }

  uint64_t v9 = objc_msgSend_structColumnForStruct_(self, v8, v7);
  uint64_t v12 = objc_msgSend_helpers(self, v10, v11);
  unint64_t v14 = objc_msgSend_valueColumnIndexForField_(v12, v13, a3);

  uint64_t v17 = *(void *)(v9 + 80);
  if (v14 >= (*(void *)(v9 + 88) - v17) >> 3 || (result = *(void **)(v17 + 8 * v14)) == 0)
  {
    uint64_t v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 1331, @"Unexpected null value column in writer");

    return 0;
  }
  return result;
}

- (CKDSWritableStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (CKXORCHelpers)helpers
{
  return self->_helpers;
}

- (CKXORCWriterOptions)options
{
  return self->_options;
}

- (unint64_t)rootStructToken
{
  return self->_rootStructToken;
}

- (void)setRootStructToken:(unint64_t)a3
{
  self->_rootStructToken = a3;
}

- (unint64_t)startingRowForCurrentBatch
{
  return self->_startingRowForCurrentBatch;
}

- (void)setStartingRowForCurrentBatch:(unint64_t)a3
{
  self->_startingRowForCurrentBatch = a3;
}

- (unint64_t)commitCount
{
  return self->_commitCount;
}

- (void)setCommitCount:(unint64_t)a3
{
  self->_commitCount = a3;
}

- (NSError)writeError
{
  return self->_writeError;
}

- (void)setWriteError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeError, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  sub_1DD314A68((void *)self->_uncommittedStructs.__tree_.__pair1_.__value_.__left_);
  value = self->_currentBatch.__ptr_.__value_;
  self->_currentBatch.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(ColumnVectorBatch *))(*(void *)value + 8))(value);
  }
  unint64_t v4 = self->_outputStream.__ptr_.__value_;
  self->_outputStream.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(OutputStream *))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = self->_writer.__ptr_.__value_;
  self->_writer.__ptr_.__value_ = 0;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = (char *)self + 48;
  return self;
}

@end