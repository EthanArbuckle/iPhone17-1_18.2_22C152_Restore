@interface CKAtomBatch
+ (BOOL)supportsSecureCoding;
+ (id)atomBatchByMergingAtomBatches:(id)a3 error:(id *)a4;
+ (id)bindingForFormatVersion:(unsigned __int8)a3;
- ($06D0163FE0D7AFE752A9F21F38483579)writerIdentity;
- (BOOL)_setStorage:(id)a3 optionsByReaderWriterClass:(id)a4 error:(id *)a5;
- (BOOL)fileBacked;
- (BOOL)finishWritingWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWriting;
- (BOOL)size:(unint64_t *)a3 error:(id *)a4;
- (BOOL)splitWithMaximumSize:(unint64_t)a3 error:(id *)a4 block:(id)a5;
- (BOOL)validateWithError:(id *)a3;
- (CKAtomBatch)initWithCoder:(id)a3;
- (CKAtomBatch)initWithData:(id)a3 error:(id *)a4;
- (CKAtomBatch)initWithData:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 error:(id *)a6;
- (CKAtomBatch)initWithData:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 options:(id)a6 error:(id *)a7;
- (CKAtomBatch)initWithFileURL:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 options:(id)a6 error:(id *)a7;
- (CKAtomBatch)initWithMergeableDelta:(id)a3 error:(id *)a4;
- (CKAtomBatch)initWithStorage:(id)a3 optionsByReaderWriterClass:(id)a4 mergeableValueID:(id)a5 vectors:(id)a6 formatVersion:(unsigned __int8)a7 error:(id *)a8;
- (CKDSReadableStorage)storage;
- (CKDistributedTimestampStateVector)enumeratedContentsVector;
- (CKMergeableDeltaVectors)vectors;
- (CKMergeableValueID)mergeableValueID;
- (CKXBackingStore)backingStore;
- (id)_metadataForCoding;
- (id)atomValueDescriptionBlock;
- (id)contentsDescription;
- (id)contentsDescriptionWithStringSiteIdentifiers;
- (id)contentsDescriptionWithStringSiteIdentifiers:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)dataWithError:(id *)a3;
- (id)description;
- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 formatVersion:(unsigned __int8)a5 error:(id *)a6;
- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 formatVersion:(unsigned __int8)a5 fileURL:(id)a6 error:(id *)a7;
- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 version:(unsigned __int8)a5;
- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 formatVersion:(unsigned __int8)a5 error:(id *)a6;
- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 formatVersion:(unsigned __int8)a5 fileURL:(id)a6 error:(id *)a7;
- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 options:(id)a5 error:(id *)a6;
- (id)splitWithMaximumDeltaSize:(unint64_t)a3 error:(id *)a4;
- (id)splitWithMaximumSize:(unint64_t)a3 error:(id *)a4;
- (id)writableCopy;
- (id)writableCopyWithMergeableValueID:(id)a3 vectors:(id)a4;
- (id)writerOptions;
- (int64_t)count;
- (unint64_t)hash;
- (unsigned)formatVersion;
- (void)appendAtomWithBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAtomsWithOptions:(id)a3 usingBlock:(id)a4;
- (void)finishWriting;
- (void)setAtomValueDescriptionBlock:(id)a3;
- (void)setBackingStore:(id)a3;
@end

@implementation CKAtomBatch

- (CKAtomBatch)initWithMergeableDelta:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v7 = *MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
  {
    int v31 = 138412290;
    id v32 = v6;
    _os_log_debug_impl(&dword_1DD237000, v7, OS_LOG_TYPE_DEBUG, "Creating atom batch from delta: %@", (uint8_t *)&v31, 0xCu);
  }
  v12 = objc_msgSend_fileURL(v6, v8, v9);
  if (v12)
  {
    v13 = objc_msgSend_valueID(v6, v10, v11);
    v16 = objc_msgSend_metadata(v6, v14, v15);
    v19 = objc_msgSend_vectors(v16, v17, v18);
    self = (CKAtomBatch *)(id)objc_msgSend_initWithFileURL_mergeableValueID_vectors_options_error_(self, v20, (uint64_t)v12, v13, v19, 0, a4);
  }
  else
  {
    v13 = objc_msgSend_dataWithError_(v6, v10, (uint64_t)a4);
    if (!v13)
    {
      v29 = 0;
      goto LABEL_10;
    }
    v16 = objc_msgSend_valueID(v6, v21, v22);
    v19 = objc_msgSend_metadata(v6, v23, v24);
    v27 = objc_msgSend_vectors(v19, v25, v26);
    self = (CKAtomBatch *)(id)objc_msgSend_initWithData_mergeableValueID_vectors_error_(self, v28, (uint64_t)v13, v16, v27, a4);
  }
  v29 = self;
LABEL_10:

  return v29;
}

- (id)splitWithMaximumDeltaSize:(unint64_t)a3 error:(id *)a4
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1DD30704C;
  v29 = sub_1DD30705C;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v7 = objc_opt_new();
  v19 = &v21;
  id v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DD307064;
  v16[3] = &unk_1E6CBAC98;
  uint64_t v18 = &v25;
  id v8 = v7;
  id v17 = v8;
  char v10 = objc_msgSend_splitWithMaximumSize_error_block_(self, v9, a3, &v20, v16);
  id v11 = v20;
  v12 = v11;
  if (*((unsigned char *)v22 + 24)) {
    char v13 = v10;
  }
  else {
    char v13 = 0;
  }
  if (v13)
  {
    id v14 = v8;
  }
  else if (a4)
  {
    if (v26[5]) {
      id v11 = (id)v26[5];
    }
    id v14 = 0;
    *a4 = v11;
  }
  else
  {
    id v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (CKAtomBatch)initWithData:(id)a3 error:(id *)a4
{
  return (CKAtomBatch *)objc_msgSend_initWithData_mergeableValueID_vectors_error_(self, a2, (uint64_t)a3, 0, 0, a4);
}

- (CKAtomBatch)initWithData:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 error:(id *)a6
{
  return (CKAtomBatch *)MEMORY[0x1F4181798](self, sel_initWithData_mergeableValueID_vectors_options_error_, a3);
}

- (CKAtomBatch)initWithData:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [CKDSReadableStorage alloc];
  uint64_t v18 = objc_msgSend_initWithData_(v16, v17, (uint64_t)v15);

  uint64_t v21 = objc_msgSend_underlyingReaderOptionsByClass(v12, v19, v20);

  uint64_t v23 = (CKAtomBatch *)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(self, v22, (uint64_t)v18, v21, v14, v13, 3, a7);
  return v23;
}

- (CKAtomBatch)initWithFileURL:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [CKDSReadableStorage alloc];
  uint64_t v18 = objc_msgSend_initWithFileURL_(v16, v17, (uint64_t)v15);

  uint64_t v21 = objc_msgSend_underlyingReaderOptionsByClass(v12, v19, v20);

  uint64_t v23 = (CKAtomBatch *)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(self, v22, (uint64_t)v18, v21, v14, v13, 3, a7);
  return v23;
}

- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 version:(unsigned __int8)a5
{
  id v19 = 0;
  inited = objc_msgSend_initWriterWithMergeableValueID_metadata_formatVersion_error_(self, a2, (uint64_t)a3, a4, a5, &v19);
  id v6 = v19;
  id v7 = inited;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    v16 = objc_msgSend_description(v6, v14, v15);
    objc_msgSend_raise_format_(v10, v17, v11, @"Failed to initialize %@: %@", v13, v16);
  }
  return v8;
}

- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 formatVersion:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v13 = objc_msgSend_vectors(a4, v11, v12);
  inited = objc_msgSend_initWriterWithMergeableValueID_vectors_formatVersion_fileURL_error_(self, v14, (uint64_t)v10, v13, v7, 0, a6);

  return inited;
}

- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 formatVersion:(unsigned __int8)a5 fileURL:(id)a6 error:(id *)a7
{
  uint64_t v8 = a5;
  id v12 = a6;
  id v13 = a3;
  v16 = objc_msgSend_vectors(a4, v14, v15);
  inited = objc_msgSend_initWriterWithMergeableValueID_vectors_formatVersion_fileURL_error_(self, v17, (uint64_t)v13, v16, v8, v12, a7);

  return inited;
}

- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 formatVersion:(unsigned __int8)a5 error:(id *)a6
{
  return (id)objc_msgSend_initWriterWithMergeableValueID_vectors_formatVersion_fileURL_error_(self, a2, (uint64_t)a3, a4, a5, 0, a6);
}

- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 formatVersion:(unsigned __int8)a5 fileURL:(id)a6 error:(id *)a7
{
  uint64_t v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = objc_opt_new();
  objc_msgSend_setFormatVersion_(v15, v16, v8);
  objc_msgSend_setFileBacked_(v15, v17, v8 == 3);
  objc_msgSend_setFileURL_(v15, v18, (uint64_t)v12);

  inited = objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(self, v19, (uint64_t)v14, v13, v15, a7);
  return inited;
}

- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v14 = a5;
  if (!v14) {
    id v14 = (id)objc_opt_new();
  }
  if (!objc_msgSend_fileBacked(v14, v12, v13))
  {
    v28 = [CKDSWritableStorage alloc];
    uint64_t v24 = objc_msgSend_initInMemory(v28, v29, v30);
    goto LABEL_8;
  }
  id v17 = objc_msgSend_fileURL(v14, v15, v16);

  uint64_t v18 = [CKDSWritableStorage alloc];
  uint64_t v21 = v18;
  if (v17)
  {
    uint64_t v22 = objc_msgSend_fileURL(v14, v19, v20);
    uint64_t v24 = objc_msgSend_initWithFileURL_(v21, v23, (uint64_t)v22);

    id v25 = 0;
    if (v24)
    {
LABEL_6:

LABEL_8:
      int v31 = objc_msgSend_underlyingWriterOptionsByClass(v14, v26, v27);
      uint64_t v34 = objc_msgSend_formatVersion(v14, v32, v33);
      self = (CKAtomBatch *)(id)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(self, v35, v24, v31, v10, v11, v34, a6);

      id v25 = (id)v24;
      v36 = self;
      goto LABEL_9;
    }
  }
  else
  {
    id v38 = 0;
    uint64_t v24 = objc_msgSend_initWithTemporaryFile_(v18, v19, (uint64_t)&v38);
    id v25 = v38;
    if (v24) {
      goto LABEL_6;
    }
  }
  if (a6)
  {
    id v25 = v25;
    v36 = 0;
    *a6 = v25;
  }
  else
  {
    v36 = 0;
  }
LABEL_9:

  return v36;
}

- (CKAtomBatch)initWithStorage:(id)a3 optionsByReaderWriterClass:(id)a4 mergeableValueID:(id)a5 vectors:(id)a6 formatVersion:(unsigned __int8)a7 error:(id *)a8
{
  uint64_t v9 = a7;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v20 = a6;
  if (!v15)
  {
    v56 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v56, v57, (uint64_t)a2, self, @"CKAtomBatch.m", 186, @"Storage must not be nil");
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v24 = objc_msgSend_fileURL(v15, v22, v23);

  v63.receiver = self;
  v63.super_class = (Class)CKAtomBatch;
  uint64_t v27 = [(CKAtomBatch *)&v63 init];
  if (!v27)
  {
    id v36 = 0;
    goto LABEL_13;
  }
  uint64_t v28 = objc_msgSend_copy(v17, v25, v26);
  mergeableValueID = v27->_mergeableValueID;
  v27->_mergeableValueID = (CKMergeableValueID *)v28;

  uint64_t v32 = objc_msgSend_copy(v20, v30, v31);
  vectors = v27->_vectors;
  v27->_vectors = (CKMergeableDeltaVectors *)v32;

  if (isKindOfClass)
  {
    id v62 = 0;
    objc_msgSend__setStorage_optionsByReaderWriterClass_error_(v27, v34, (uint64_t)v15, v16, &v62);
    id v36 = v62;
    goto LABEL_12;
  }
  v60 = a8;
  char v59 = isKindOfClass;
  if (v9 < 3)
  {
    if (v24)
    {
      v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v34, v35);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v58, (uint64_t)a2, v27, @"CKAtomBatch.m", 206, @"File-backed batches only supported for format version %d", 3);
      goto LABEL_29;
    }
  }
  else if (!v20)
  {
    v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v34, v35);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, v27, @"CKAtomBatch.m", 204, @"Expecting non-nil metadata for format version %d", v9);
LABEL_29:
  }
  v39 = [CKXBackingStore alloc];
  v40 = objc_opt_class();
  v42 = objc_msgSend_bindingForFormatVersion_(v40, v41, v9);
  id v61 = 0;
  int v44 = v9;
  uint64_t v9 = objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(v39, v43, (uint64_t)v15, v42, v16, v9, &v61);
  id v36 = v61;
  backingStore = v27->_backingStore;
  v27->_backingStore = (CKXBackingStore *)v9;
  LODWORD(v9) = v44;

  a8 = v60;
  char isKindOfClass = v59;
LABEL_12:
  if (!v27->_backingStore)
  {
    if (a8)
    {
      id v36 = v36;
      v47 = 0;
      *a8 = v36;
    }
    else
    {
      v47 = 0;
    }
    goto LABEL_17;
  }
LABEL_13:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v46 = (void *)*MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
  {
    if (v24) {
      v49 = @"file-backed ";
    }
    else {
      v49 = &stru_1F387E398;
    }
    if (isKindOfClass) {
      v50 = @"reader";
    }
    else {
      v50 = @"writer";
    }
    v51 = v46;
    unsigned int v52 = v9;
    v53 = v51;
    v55 = CKDSStringForBackingStoreFormatVersion(v52, v54);
    *(_DWORD *)buf = 138412802;
    v65 = v49;
    __int16 v66 = 2112;
    v67 = v50;
    __int16 v68 = 2112;
    v69 = v55;
    _os_log_debug_impl(&dword_1DD237000, v53, OS_LOG_TYPE_DEBUG, "Created %@%@ atom batch with format version %@", buf, 0x20u);
  }
  v47 = v27;
LABEL_17:

  return v47;
}

- (CKDSReadableStorage)storage
{
  v3 = objc_msgSend_backingStore(self, a2, v2);
  id v6 = objc_msgSend_readableStorage(v3, v4, v5);

  return (CKDSReadableStorage *)v6;
}

- (unsigned)formatVersion
{
  uint64_t v5 = objc_msgSend_backingStore(self, a2, v2);

  if (!v5)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKAtomBatch.m", 238, @"Unable to read format version before data is set");
  }
  uint64_t v8 = objc_msgSend_backingStore(self, v6, v7);
  unsigned __int8 v11 = objc_msgSend_formatVersion(v8, v9, v10);

  return v11;
}

- (BOOL)fileBacked
{
  v3 = objc_msgSend_storage(self, a2, v2);
  id v6 = objc_msgSend_fileURL(v3, v4, v5);
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)writerOptions
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_formatVersion(self, v4, v5);
  objc_msgSend_setFormatVersion_(v3, v7, v6);
  uint64_t v10 = objc_msgSend_fileBacked(self, v8, v9);
  objc_msgSend_setFileBacked_(v3, v11, v10);
  return v3;
}

- ($06D0163FE0D7AFE752A9F21F38483579)writerIdentity
{
  uint64_t v5 = objc_msgSend_backingStore(self, a2, v2);

  if (!v5)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKAtomBatch.m", 255, @"Unable to read writer identity before data is set");
  }
  uint64_t v8 = objc_msgSend_backingStore(self, v6, v7);
  $06D0163FE0D7AFE752A9F21F38483579 v11 = ($06D0163FE0D7AFE752A9F21F38483579)objc_msgSend_writerIdentity(v8, v9, v10);

  return v11;
}

- (void)enumerateAtomsWithOptions:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  $06D0163FE0D7AFE752A9F21F38483579 v11 = objc_msgSend_backingStore(self, v9, v10);

  if (!v11)
  {
    uint64_t v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKAtomBatch.m", 261, @"Unable to read atoms before data is set");
  }
  id v14 = objc_msgSend_backingStore(self, v12, v13);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1DD31833C;
  v20[3] = &unk_1E6CBAFF8;
  id v21 = v7;
  id v22 = v8;
  id v15 = v8;
  id v16 = v7;
  objc_msgSend_readUsingBlock_(v14, v17, (uint64_t)v20);
}

- (void)appendAtomWithBlock:(id)a3
{
  id v5 = a3;
  id v8 = objc_msgSend_backingStore(self, v6, v7);

  if (!v8)
  {
    uint64_t v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKAtomBatch.m", 281, @"Unable to append atoms before data is set");
  }
  $06D0163FE0D7AFE752A9F21F38483579 v11 = self->_mergeableValueID;
  id v14 = objc_msgSend_backingStore(self, v12, v13);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1DD318728;
  v20[3] = &unk_1E6CBB048;
  id v21 = v11;
  id v22 = v5;
  void v20[4] = self;
  id v15 = v11;
  id v16 = v5;
  objc_msgSend_writeUsingBlock_(v14, v17, (uint64_t)v20);
}

- (BOOL)isWriting
{
  v3 = objc_msgSend_backingStore(self, a2, v2);
  char isWriting = objc_msgSend_isWriting(v3, v4, v5);

  return isWriting;
}

- (void)finishWriting
{
  id v5 = 0;
  char v2 = objc_msgSend_finishWritingWithError_(self, a2, (uint64_t)&v5);
  id v4 = v5;
  if ((v2 & 1) == 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v3, *MEMORY[0x1E4F1C3A8], @"Failed to finish writing: %@", v4);
  }
}

- (BOOL)finishWritingWithError:(id *)a3
{
  v3 = a3;
  id v4 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  LOBYTE(v3) = objc_msgSend_finishWritingWithError_(v4, v5, (uint64_t)v3);

  return (char)v3;
}

- (BOOL)validateWithError:(id *)a3
{
  v76[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v5, *MEMORY[0x1E4F1C3C8], @"-[CKAtomBatch finishWritingWithError:] must be called before reading data");
    return 0;
  }
  else
  {
    char v8 = objc_msgSend_formatVersion(self, v5, v6);
    $06D0163FE0D7AFE752A9F21F38483579 v11 = objc_msgSend_vectors(self, v9, v10);
    id v14 = objc_msgSend_previous(v11, v12, v13);
    id v17 = objc_msgSend_mutableCopy(v14, v15, v16);

    id v20 = objc_msgSend_contents(v11, v18, v19);
    uint64_t v23 = objc_msgSend_clockVector(v20, v21, v22);
    objc_msgSend_unionVector_(v17, v24, (uint64_t)v23);

    uint64_t v27 = objc_msgSend_contents(v11, v25, v26);
    v29 = objc_msgSend_vectorFilteredByAtomState_(v27, v28, 3);

    uint64_t v32 = objc_msgSend_contents(v11, v30, v31);
    uint64_t v35 = objc_msgSend_clockVector(v32, v33, v34);
    id v38 = objc_msgSend_mutableCopy(v35, v36, v37);

    v41 = objc_msgSend_clockVector(v29, v39, v40);
    objc_msgSend_minusVector_(v38, v42, (uint64_t)v41);

    v43 = objc_opt_new();
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    char v74 = 1;
    uint64_t v65 = 0;
    __int16 v66 = &v65;
    uint64_t v67 = 0x3032000000;
    __int16 v68 = sub_1DD318D14;
    v69 = sub_1DD318D24;
    id v70 = 0;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1DD318D2C;
    v58[3] = &unk_1E6CBB0C0;
    id v62 = &v65;
    objc_super v63 = &v71;
    char v64 = v8;
    id v44 = v11;
    id v59 = v44;
    id v45 = v17;
    id v60 = v45;
    id v46 = v43;
    id v61 = v46;
    objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v47, 0, v58);
    if (!v66[5] && (objc_msgSend_isEqual_(v46, v48, (uint64_t)v38) & 1) == 0)
    {
      *((unsigned char *)v72 + 24) = 0;
      v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v51 = objc_msgSend_stringWithFormat_(NSString, v49, @"Batch contents %@ not equal to contents vector %@", v46, v38);
      v76[0] = v51;
      v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v52, (uint64_t)v76, &v75, 1);
      uint64_t v55 = objc_msgSend_errorWithDomain_code_userInfo_(v50, v54, @"CKDSErrorDomain", 3, v53);
      v56 = (void *)v66[5];
      v66[5] = v55;
    }
    if (a3) {
      *a3 = (id) v66[5];
    }
    BOOL v7 = *((unsigned char *)v72 + 24) != 0;

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v71, 8);
  }
  return v7;
}

- (id)data
{
  id v13 = 0;
  id v4 = objc_msgSend_dataWithError_(self, a2, (uint64_t)&v13);
  id v7 = v13;
  if (v4)
  {
    id v8 = v4;
  }
  else
  {
    uint64_t v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, @"CKAtomBatch.m", 419, @"Unable to retrieve atom batch data: %@", v7);

    id v8 = (id)objc_opt_new();
  }
  $06D0163FE0D7AFE752A9F21F38483579 v11 = v8;

  return v11;
}

- (id)dataWithError:(id *)a3
{
  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v6, *MEMORY[0x1E4F1C3C8], @"-[CKAtomBatch finishWritingWithError:] must be called before reading data");
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend_backingStore(self, v6, v7);
    id v12 = objc_msgSend_readableStorage(v9, v10, v11);

    if (!v12)
    {
      uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CKAtomBatch.m", 434, @"Unexpectedly nil readable storage");
    }
    id v8 = objc_msgSend_dataWithError_(v12, v13, (uint64_t)a3);
  }
  return v8;
}

- (BOOL)_setStorage:(id)a3 optionsByReaderWriterClass:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_backingStore(self, v10, v11);

  if (v12)
  {
    if (a5)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v40[0] = @"Cannot replace existing backing store";
      id v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v40, &v39, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, @"CKDSErrorDomain", 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v17 = 0;
  }
  else
  {
    char v36 = 0;
    __int16 v35 = 0;
    id v34 = 0;
    char v18 = objc_msgSend_header_forStorage_error_(CKXBackingStore, v13, (uint64_t)&v35, v8, &v34);
    id v19 = v34;
    id v20 = v19;
    if (v18)
    {
      id v21 = [CKXBackingStore alloc];
      uint64_t v22 = objc_opt_class();
      uint64_t v24 = objc_msgSend_bindingForFormatVersion_(v22, v23, v35);
      uint64_t v26 = (CKXBackingStore *)objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(v21, v25, (uint64_t)v8, v24, v9, v35, a5);
      backingStore = self->_backingStore;
      self->_backingStore = v26;

      v29 = self->_backingStore;
      if (v29 && v35 >= 3u && !self->_vectors)
      {
        if (a5)
        {
          uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v37 = *MEMORY[0x1E4F28568];
          id v38 = @"Expecting non-nil vectors";
          uint64_t v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)&v38, &v37, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, @"CKDSErrorDomain", 2, v31);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v29 = self->_backingStore;
        }
        self->_backingStore = 0;

        v29 = self->_backingStore;
      }
      BOOL v17 = v29 != 0;
    }
    else
    {
      BOOL v17 = 0;
      if (a5) {
        *a5 = v19;
      }
    }
  }
  return v17;
}

- (CKMergeableValueID)mergeableValueID
{
  p_mergeableValueID = &self->_mergeableValueID;
  if (!self->_mergeableValueID
    && objc_msgSend_formatVersion(self, a2, v2) <= 2
    && (objc_msgSend_isWriting(self, v5, v6) & 1) == 0)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    char v18 = sub_1DD318D14;
    id v19 = sub_1DD318D24;
    id v20 = 0;
    id v9 = objc_msgSend_backingStore(self, v7, v8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1DD319A78;
    v14[3] = &unk_1E6CBB110;
    v14[4] = &v15;
    objc_msgSend_readUsingBlock_(v9, v10, (uint64_t)v14);

    uint64_t v11 = (void *)v16[5];
    if (v11) {
      objc_storeStrong((id *)p_mergeableValueID, v11);
    }
    _Block_object_dispose(&v15, 8);
  }
  id v12 = *p_mergeableValueID;
  return v12;
}

- (BOOL)size:(unint64_t *)a3 error:(id *)a4
{
  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v7, *MEMORY[0x1E4F1C3C8], @"-[CKAtomBatch finishWritingWithError:] must be called before getting the size");
    return 0;
  }
  else
  {
    unint64_t v34 = 0;
    uint64_t v10 = objc_msgSend_storage(self, v7, v8);
    id v33 = 0;
    char v9 = objc_msgSend_size_error_(v10, v11, (uint64_t)&v34, &v33);
    id v12 = v33;

    if (v9)
    {
      uint64_t v15 = objc_msgSend_mergeableValueID(self, v13, v14);
      if (v15
        && (char v18 = (void *)v15,
            objc_msgSend_mergeableValueID(self, v16, v17),
            id v19 = objc_claimAutoreleasedReturnValue(),
            char isEncrypted = objc_msgSend_isEncrypted(v19, v20, v21),
            v19,
            v18,
            (isEncrypted & 1) == 0))
      {
        unint64_t v23 = v34;
      }
      else
      {
        unint64_t v23 = v34 + 28;
        v34 += 28;
      }
      unint64_t v24 = v23 + 2;
      if (v23 >= 0x80)
      {
        do
        {
          ++v24;
          unint64_t v25 = v23 >> 14;
          v23 >>= 7;
        }
        while (v25);
      }
      uint64_t v26 = objc_msgSend__metadataForCoding(self, v16, v17);
      unint64_t v29 = objc_msgSend_size(v26, v27, v28);
      unint64_t v30 = v29 + 2;
      if (v29 >= 0x80)
      {
        do
        {
          ++v30;
          unint64_t v31 = v29 >> 14;
          v29 >>= 7;
        }
        while (v31);
      }

      if (a3) {
        *a3 = v24 + v30 + 16;
      }
    }
    else if (a4)
    {
      *a4 = v12;
    }
  }
  return v9;
}

- (int64_t)count
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (objc_msgSend_isWriting(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_backingStore(self, v4, v5);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1DD319E30;
    v12[3] = &unk_1E6CBB138;
    v12[4] = &v13;
    objc_msgSend_writeUsingBlock_(v6, v7, (uint64_t)v12);
  }
  else
  {
    uint64_t v6 = objc_msgSend_backingStore(self, v4, v5);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1DD319E8C;
    v11[3] = &unk_1E6CBB110;
    v11[4] = &v13;
    objc_msgSend_readUsingBlock_(v6, v8, (uint64_t)v11);
  }

  int64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (CKDistributedTimestampStateVector)enumeratedContentsVector
{
  v3 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DD319F98;
  v7[3] = &unk_1E6CBB160;
  id v4 = v3;
  id v8 = v4;
  objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v5, 0, v7);

  return (CKDistributedTimestampStateVector *)v4;
}

- (CKMergeableDeltaVectors)vectors
{
  if (!self->_vectors && (objc_msgSend_isWriting(self, a2, v2) & 1) == 0)
  {
    uint64_t v6 = objc_msgSend_enumeratedContentsVector(self, v4, v5);
    id v7 = objc_alloc(MEMORY[0x1E4F1A158]);
    id v8 = objc_opt_new();
    uint64_t v10 = (CKMergeableDeltaVectors *)objc_msgSend_initWithPreviousStateVector_currentStateVector_(v7, v9, (uint64_t)v8, v6);
    vectors = self->_vectors;
    self->_vectors = v10;
  }
  id v12 = self->_vectors;
  return v12;
}

- (id)contentsDescriptionWithStringSiteIdentifiers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_new();
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = sub_1DD318D14;
  v69[4] = sub_1DD318D24;
  id v70 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v68[3] = 0;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  uint64_t v8 = objc_msgSend_count(self, v6, v7);
  uint64_t v11 = objc_msgSend_count(self, v9, v10);
  uint64_t v13 = @"s";
  if (v11 == 1) {
    uint64_t v13 = &stru_1F387E398;
  }
  objc_msgSend_appendFormat_(v5, v12, @"Atom Batch (%ld atom%@) {\n", v8, v13);
  if (objc_msgSend_isWriting(self, v14, v15))
  {
    objc_msgSend_appendFormat_(v5, v16, @"  <Writing, not yet fully initialized>\n");
  }
  else
  {
    id v19 = objc_msgSend_vectors(self, v16, v17);
    uint64_t v22 = objc_msgSend_previous(v19, v20, v21);
    unint64_t v24 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v22, v23, v3, 1);
    objc_msgSend_appendFormat_(v5, v25, @"  Previous: %@\n", v24);

    uint64_t v28 = objc_msgSend_vectors(self, v26, v27);
    unint64_t v31 = objc_msgSend_contents(v28, v29, v30);
    id v33 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v31, v32, v3, 1);
    objc_msgSend_appendFormat_(v5, v34, @"  Contents: %@\n", v33);

    uint64_t v37 = objc_msgSend_vectors(self, v35, v36);
    uint64_t v40 = objc_msgSend_removals(v37, v38, v39);
    v42 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v40, v41, v3, 1);
    objc_msgSend_appendFormat_(v5, v43, @"  Removals: %@\n", v42);

    id v46 = objc_msgSend_vectors(self, v44, v45);
    v49 = objc_msgSend_dependencies(v46, v47, v48);
    v51 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v49, v50, v3, 1);
    objc_msgSend_appendFormat_(v5, v52, @"  Dependencies: %@\n", v51);

    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1DD31A51C;
    v58[3] = &unk_1E6CBB1B0;
    BOOL v63 = v3;
    id v60 = &v64;
    void v58[4] = self;
    id v61 = v69;
    id v62 = v68;
    id v53 = v5;
    id v59 = v53;
    objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v54, 0, v58);
    if (*((unsigned char *)v65 + 24)) {
      objc_msgSend_appendFormat_(v53, v55, @"\n  }\n");
    }
  }
  objc_msgSend_appendFormat_(v5, v18, @"}");
  id v56 = v5;
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v69, 8);

  return v56;
}

- (id)description
{
  BOOL v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_backingStore(self, v4, v5);
  int64_t v9 = objc_msgSend_readableStorage(v6, v7, v8);
  id v12 = v9;
  if (v9)
  {
    id v13 = v9;
  }
  else
  {
    uint64_t v14 = objc_msgSend_backingStore(self, v10, v11);
    objc_msgSend_writableStorage(v14, v15, v16);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v48 = 0;
  objc_msgSend_size_error_(v13, v17, (uint64_t)&v48, 0);
  char v18 = (objc_class *)objc_opt_class();
  id v19 = NSStringFromClass(v18);
  objc_msgSend_appendFormat_(v3, v20, @"<%@: %p; ", v19, self);

  unsigned int v23 = objc_msgSend_formatVersion(self, v21, v22);
  unint64_t v25 = CKDSStringForBackingStoreFormatVersion(v23, v24);
  objc_msgSend_appendFormat_(v3, v26, @"formatVersion=%@, ", v25);

  uint64_t v27 = NSNumber;
  uint64_t isWriting = objc_msgSend_isWriting(self, v28, v29);
  uint64_t v32 = objc_msgSend_numberWithBool_(v27, v31, isWriting);
  objc_msgSend_appendFormat_(v3, v33, @"isWriting=%@, ", v32);

  objc_msgSend_appendFormat_(v3, v34, @"storage=%@, ", v13);
  uint64_t v36 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v35, v48);
  objc_msgSend_appendFormat_(v3, v37, @"size=%@, ", v36);

  if (self->_mergeableValueID || (objc_msgSend_isWriting(self, v38, v39) & 1) == 0)
  {
    uint64_t v40 = objc_msgSend_mergeableValueID(self, v38, v39);
    objc_msgSend_appendFormat_(v3, v41, @"valueID=%@, ", v40);
  }
  if (self->_vectors)
  {
    v42 = objc_msgSend_vectors(self, v38, v39);
    objc_msgSend_appendFormat_(v3, v43, @"vectors=%@, ", v42);
  }
  uint64_t v44 = objc_msgSend_length(v3, v38, v39);
  objc_msgSend_deleteCharactersInRange_(v3, v45, v44 - 2, 2);
  objc_msgSend_appendFormat_(v3, v46, @">");

  return v3;
}

- (id)contentsDescription
{
  return (id)MEMORY[0x1F4181798](self, sel_contentsDescriptionWithStringSiteIdentifiers_, 0);
}

- (id)contentsDescriptionWithStringSiteIdentifiers
{
  return (id)MEMORY[0x1F4181798](self, sel_contentsDescriptionWithStringSiteIdentifiers_, 1);
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_mergeableValueID(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  uint64_t v10 = objc_msgSend_vectors(self, v8, v9);
  unint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (CKAtomBatch *)a3;
  if (v5 == self)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      uint64_t v9 = objc_msgSend_mergeableValueID(self, v7, v8);
      uint64_t v14 = objc_msgSend_mergeableValueID(v6, v10, v11);
      if (v9 != v14)
      {
        uint64_t v15 = objc_msgSend_mergeableValueID(self, v12, v13);
        BOOL v3 = objc_msgSend_mergeableValueID(v6, v16, v17);
        if (!objc_msgSend_isEqual_(v15, v18, (uint64_t)v3))
        {
          char isEqual = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        uint64_t v32 = v15;
      }
      id v20 = objc_msgSend_vectors(self, v12, v13);
      unint64_t v25 = objc_msgSend_vectors(v6, v21, v22);
      if (v20 == v25)
      {
        char isEqual = 1;
      }
      else
      {
        uint64_t v26 = objc_msgSend_vectors(self, v23, v24);
        uint64_t v29 = objc_msgSend_vectors(v6, v27, v28);
        char isEqual = objc_msgSend_isEqual_(v26, v30, (uint64_t)v29);
      }
      uint64_t v15 = v32;
      if (v9 == v14) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char isEqual = 0;
  }
LABEL_15:

  return isEqual;
}

+ (id)bindingForFormatVersion:(unsigned __int8)a3
{
  if (a3 == 2) {
    CKXAtomBindingFormatVersionORC();
  }
  else {
  BOOL v3 = CKXAtomBindingFormatVersionORCv2();
  }
  return v3;
}

- (id)writableCopyWithMergeableValueID:(id)a3 vectors:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [CKAtomBatch alloc];
  uint64_t v12 = objc_msgSend_writerOptions(self, v10, v11);
  id v36 = 0;
  inited = objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v9, v13, (uint64_t)v7, v8, v12, &v36);

  id v15 = v36;
  if (v15)
  {
    uint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
    unint64_t v31 = objc_msgSend_description(v15, v29, v30);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v32, (uint64_t)a2, self, @"CKAtomBatch.m", 739, v31);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1DD31AEC0;
  v33[3] = &unk_1E6CBB200;
  id v18 = inited;
  id v34 = v18;
  id v35 = v7;
  id v19 = v7;
  objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v20, 0, v33);
  unsigned int v23 = objc_msgSend_atomValueDescriptionBlock(self, v21, v22);
  objc_msgSend_setAtomValueDescriptionBlock_(v18, v24, (uint64_t)v23);

  unint64_t v25 = v35;
  id v26 = v18;

  return v26;
}

- (id)writableCopy
{
  id v4 = objc_msgSend_mergeableValueID(self, a2, v2);
  uint64_t v6 = objc_msgSend_writableCopyWithMergeableValueID_vectors_(self, v5, (uint64_t)v4, 0);

  return v6;
}

+ (id)atomBatchByMergingAtomBatches:(id)a3 error:(id *)a4
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_msgSend_count(v5, v6, v7))
  {
    if (objc_msgSend_count(v5, v8, v9) == 1)
    {
      objc_msgSend_firstObject(v5, v10, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v69 = a4;
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v17 = v5;
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v79, v86, 16);
      if (v19)
      {
        uint64_t v22 = v19;
        uint64_t v23 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v80 != v23) {
              objc_enumerationMutation(v17);
            }
            unint64_t v25 = objc_msgSend_vectors(*(void **)(*((void *)&v79 + 1) + 8 * i), v20, v21);
            objc_msgSend_addObject_(v16, v26, (uint64_t)v25);
          }
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v79, v86, 16);
        }
        while (v22);
      }

      uint64_t v28 = objc_msgSend_mergeableDeltaMetadataVectorsByCombiningVectors_(MEMORY[0x1E4F1A158], v27, (uint64_t)v16);
      unint64_t v31 = objc_msgSend_firstObject(v17, v29, v30);
      id v34 = objc_msgSend_writerOptions(v31, v32, v33);

      id v35 = [CKAtomBatch alloc];
      id v38 = objc_msgSend_firstObject(v17, v36, v37);
      v41 = objc_msgSend_mergeableValueID(v38, v39, v40);
      id v78 = 0;
      inited = objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v35, v42, (uint64_t)v41, v28, v34, &v78);
      id v44 = v78;

      if (inited)
      {
        id v66 = v44;
        char v67 = v28;
        id v68 = v5;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        obuint64_t j = v17;
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v74, v85, 16);
        if (v46)
        {
          uint64_t v49 = v46;
          uint64_t v50 = *(void *)v75;
          while (2)
          {
            for (uint64_t j = 0; j != v49; ++j)
            {
              if (*(void *)v75 != v50) {
                objc_enumerationMutation(obj);
              }
              unsigned int v52 = *(void **)(*((void *)&v74 + 1) + 8 * j);
              int v53 = objc_msgSend_formatVersion(v52, v47, v48, v66, v67, v68);
              if (v53 != objc_msgSend_formatVersion(v34, v54, v55))
              {
                if (v69)
                {
                  id v62 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v83 = *MEMORY[0x1E4F28568];
                  v84 = @"Unable to merge atom batches with different format versions";
                  BOOL v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)&v84, &v83, 1);
                  objc_msgSend_errorWithDomain_code_userInfo_(v62, v64, @"CKDSErrorDomain", 2, v63);
                  id *v69 = (id)objc_claimAutoreleasedReturnValue();
                }
                id v12 = 0;
                uint64_t v28 = v67;
                id v5 = v68;
                id v44 = v66;
                goto LABEL_34;
              }
              v72[0] = MEMORY[0x1E4F143A8];
              v72[1] = 3221225472;
              v72[2] = sub_1DD31B518;
              v72[3] = &unk_1E6CBB160;
              id v73 = inited;
              objc_msgSend_enumerateAtomsWithOptions_usingBlock_(v52, v57, 0, v72);
            }
            uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v74, v85, 16);
            if (v49) {
              continue;
            }
            break;
          }
        }

        id v71 = 0;
        char v59 = objc_msgSend_finishWritingWithError_(inited, v58, (uint64_t)&v71);
        id v60 = v71;
        id v61 = v60;
        if (v59)
        {
          id v12 = inited;
        }
        else
        {
          id v12 = 0;
          if (v69) {
            id *v69 = v60;
          }
        }
        uint64_t v28 = v67;
        id v5 = v68;
        id v44 = v66;
      }
      else
      {
        id v12 = 0;
        if (v69) {
          id *v69 = v44;
        }
      }
LABEL_34:
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v87 = *MEMORY[0x1E4F28568];
      v88[0] = @"Cannot merge zero atom batches";
      uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v88, &v87, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, @"CKDSErrorDomain", 2, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v12 = 0;
  }

  return v12;
}

- (id)splitWithMaximumSize:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DD31B698;
  v12[3] = &unk_1E6CBB250;
  id v8 = v7;
  id v13 = v8;
  if (objc_msgSend_splitWithMaximumSize_error_block_(self, v9, a3, a4, v12)) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)splitWithMaximumSize:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void (**)(id, void *))a5;
  if (objc_msgSend_isWriting(self, v10, v11))
  {
    v173 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v173, v174, (uint64_t)a2, self, @"CKAtomBatch.m", 841, @"Cannot split an atom batch which is writing");
  }
  uint64_t v14 = objc_msgSend_vectors(self, v12, v13);
  v181 = objc_msgSend_previous(v14, v15, v16);

  uint64_t v19 = objc_msgSend_vectors(self, v17, v18);
  v178 = objc_msgSend_removals(v19, v20, v21);

  uint64_t v24 = objc_msgSend_vectors(self, v22, v23);
  uint64_t v27 = objc_msgSend_dependencies(v24, v25, v26);
  uint64_t v30 = objc_msgSend_mutableCopy(v27, v28, v29);

  uint64_t v33 = objc_msgSend_vectors(self, v31, v32);
  id v36 = objc_msgSend_contents(v33, v34, v35);
  uint64_t v39 = objc_msgSend_clockVector(v36, v37, v38);
  v180 = v30;
  objc_msgSend_unionVector_(v30, v40, (uint64_t)v39);

  v43 = objc_msgSend_vectors(self, v41, v42);
  uint64_t v46 = objc_msgSend_contents(v43, v44, v45);
  v177 = objc_msgSend_vectorFilteredByAtomState_(v46, v47, 3);

  v183 = objc_opt_new();
  v182 = objc_opt_new();
  uint64_t v48 = self;
  uint64_t v49 = v48;
  if (!v48)
  {
    id v50 = 0;
    v150 = 0;
    unint64_t v167 = 0;
LABEL_46:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v169 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v202 = v49;
      __int16 v203 = 2048;
      unint64_t v204 = v167;
      _os_log_debug_impl(&dword_1DD237000, v169, OS_LOG_TYPE_DEBUG, "Successfully split atom batch %@ over %tu iterations", buf, 0x16u);
    }
    BOOL v170 = 1;
    goto LABEL_58;
  }
  v175 = a4;
  id v50 = 0;
  uint64_t v187 = 0;
  uint64_t v51 = 1;
  v186 = v48;
  unint64_t v184 = a3;
  v179 = v9;
  while (1)
  {
    uint64_t v52 = v51;
    context = (void *)MEMORY[0x1E01B2270]();
    if (v49 != v186)
    {
      uint64_t v55 = objc_msgSend_vectors(v186, v53, v54);
      v58 = objc_msgSend_contents(v55, v56, v57);
      id v61 = objc_msgSend_mutableCopy(v58, v59, v60);

      uint64_t v64 = objc_msgSend_vectors(v49, v62, v63);
      char v67 = objc_msgSend_contents(v64, v65, v66);
      id v70 = objc_msgSend_clockVector(v67, v68, v69);
      objc_msgSend_intersectVector_(v61, v71, (uint64_t)v70);

      long long v74 = objc_msgSend_vectors(v49, v72, v73);
      long long v77 = objc_msgSend_contents(v74, v75, v76);
      objc_msgSend_unionStateVector_(v77, v78, (uint64_t)v61);

      if (!v187)
      {
        long long v81 = objc_msgSend_vectors(v49, v79, v80);
        v84 = objc_msgSend_contents(v81, v82, v83);
        objc_msgSend_unionStateVector_(v84, v85, (uint64_t)v177);

        v88 = objc_msgSend_vectors(v49, v86, v87);
        v91 = objc_msgSend_removals(v88, v89, v90);
        objc_msgSend_unionStateVector_(v91, v92, (uint64_t)v178);
      }
    }
    unint64_t v189 = v52;
    unint64_t v93 = objc_msgSend_count(v49, v53, v54);
    id v199 = v50;
    unint64_t v200 = 0;
    char v95 = objc_msgSend_size_error_(v49, v94, (uint64_t)&v200, &v199);
    id v96 = v199;

    if ((v95 & 1) == 0)
    {

      v150 = 0;
      id v50 = v96;
      v168 = v175;
      unint64_t v167 = v189;
      goto LABEL_51;
    }
    unint64_t v99 = v200;
    if (v200 <= a3 || v93 <= 1)
    {
      if (v9)
      {
        v9[2](v9, v49);
        ++v187;
        unint64_t v99 = v200;
      }
      if (v99 > a3)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v152 = *MEMORY[0x1E4F1A510];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v202 = (CKAtomBatch *)v200;
          __int16 v203 = 2048;
          unint64_t v204 = a3;
          _os_log_impl(&dword_1DD237000, v152, OS_LOG_TYPE_INFO, "An indivisible batch of size %tu exceeds the maximum requested size %tu, continuing as a best effort", buf, 0x16u);
        }
      }
      v153 = v9;
      uint64_t v154 = objc_msgSend_lastObject(v183, v97, v98);
      v131 = objc_msgSend_lastObject(v182, v155, v156);
      objc_msgSend_removeLastObject(v183, v157, v158);
      objc_msgSend_removeLastObject(v182, v159, v160);
      if (!v154)
      {
        v150 = 0;
        id v166 = v96;
        v140 = 0;
        goto LABEL_29;
      }
      v161 = [CKAtomBatch alloc];
      v164 = objc_msgSend_mergeableValueID(v186, v162, v163);
      id v198 = v96;
      v150 = (CKAtomBatch *)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(v161, v165, v154, 0, v164, v131, 3, &v198);
      id v166 = v198;

      v140 = (void *)v154;
      if (v150)
      {
        a3 = v184;
LABEL_29:
        uint64_t v9 = v153;
        int v137 = 1;
        int v151 = 4;
        goto LABEL_38;
      }
      int v137 = 0;
      int v151 = 5;
      a3 = v184;
      uint64_t v9 = v153;
    }
    else
    {
      id v100 = objc_alloc(MEMORY[0x1E4F1A158]);
      v101 = objc_opt_new();
      v102 = objc_opt_new();
      uint64_t v104 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v100, v103, (uint64_t)v181, v101, v102, v180);

      id v105 = objc_alloc(MEMORY[0x1E4F1A158]);
      v106 = objc_opt_new();
      v107 = objc_opt_new();
      uint64_t v109 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v105, v108, (uint64_t)v181, v106, v107, v180);

      v110 = [CKAtomBatch alloc];
      v113 = objc_msgSend_mergeableValueID(v186, v111, v112);
      v116 = objc_msgSend_writerOptions(v186, v114, v115);
      id v197 = v96;
      v185 = (void *)v104;
      uint64_t inited = objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v110, v117, (uint64_t)v113, v104, v116, &v197);
      id v119 = v197;

      v120 = (void *)inited;
      if (inited)
      {
        v121 = [CKAtomBatch alloc];
        v124 = objc_msgSend_mergeableValueID(v186, v122, v123);
        v127 = objc_msgSend_writerOptions(v186, v125, v126);
        id v196 = v119;
        v129 = objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v121, v128, (uint64_t)v124, v109, v127, &v196);
        id v130 = v196;

        v131 = (void *)v109;
        if (v129)
        {
          v176 = (void *)v109;
          v192[0] = MEMORY[0x1E4F143A8];
          v192[1] = 3221225472;
          v192[2] = sub_1DD31C0E8;
          v192[3] = &unk_1E6CBB278;
          unint64_t v195 = v93;
          id v132 = v120;
          id v193 = v132;
          v133 = v129;
          id v134 = v129;
          id v194 = v134;
          objc_msgSend_enumerateAtomsWithOptions_usingBlock_(v49, v135, 0, v192);
          id v191 = v130;
          int v137 = objc_msgSend_finishWritingWithError_(v132, v136, (uint64_t)&v191);
          id v138 = v191;

          v140 = v185;
          if (v137)
          {
            id v190 = v138;
            int v137 = objc_msgSend_finishWritingWithError_(v134, v139, (uint64_t)&v190);
            id v141 = v190;

            if (v137)
            {
              v144 = objc_msgSend_storage(v134, v142, v143);
              objc_msgSend_addObject_(v183, v145, (uint64_t)v144);

              v148 = objc_msgSend_vectors(v134, v146, v147);
              objc_msgSend_addObject_(v182, v149, (uint64_t)v148);

              v150 = (CKAtomBatch *)v132;
              int v151 = 0;
              int v137 = 1;
            }
            else
            {
              v150 = 0;
              int v151 = 5;
            }
            id v138 = v141;
          }
          else
          {
            v150 = 0;
            int v151 = 5;
          }

          id v130 = v138;
          v131 = v176;
          v129 = v133;
        }
        else
        {
          v150 = 0;
          int v137 = 0;
          int v151 = 5;
          v140 = v185;
        }

        id v166 = v130;
      }
      else
      {
        id v166 = v119;
        v150 = 0;
        int v137 = 0;
        int v151 = 5;
        v140 = v185;
        v131 = (void *)v109;
      }

      uint64_t v9 = v179;
      a3 = v184;
    }
LABEL_38:

    if (v151 == 5) {
      break;
    }
    unint64_t v167 = v189;
    uint64_t v51 = v189 + 1;
    uint64_t v49 = v150;
    id v50 = v166;
    if (!v150) {
      goto LABEL_44;
    }
  }
  unint64_t v167 = v189;
  id v50 = v166;
LABEL_44:
  v168 = v175;
  if (v137)
  {
    uint64_t v49 = v186;
    goto LABEL_46;
  }
LABEL_51:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v171 = *MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v202 = v186;
    __int16 v203 = 2048;
    unint64_t v204 = v167;
    _os_log_error_impl(&dword_1DD237000, v171, OS_LOG_TYPE_ERROR, "Failed to split atom batch %@ over %tu iterations", buf, 0x16u);
    if (!v168) {
      goto LABEL_57;
    }
LABEL_55:
    id v50 = v50;
    BOOL v170 = 0;
    id *v168 = v50;
  }
  else
  {
    if (v168) {
      goto LABEL_55;
    }
LABEL_57:
    BOOL v170 = 0;
  }
LABEL_58:

  return v170;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    uint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CKAtomBatch.m", 1019, @"Cannot copy an atom batch which is writing");
  }
  uint64_t v7 = [CKAtomBatch alloc];
  id v10 = objc_msgSend_storage(self, v8, v9);
  vectors = self->_vectors;
  mergeableValueID = self->_mergeableValueID;
  uint64_t v15 = objc_msgSend_formatVersion(self, v13, v14);
  id v30 = 0;
  id v17 = objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(v7, v16, (uint64_t)v10, 0, mergeableValueID, vectors, v15, &v30);
  id v18 = v30;

  if (!v17)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    unint64_t v25 = objc_msgSend_description(v18, v23, v24);
    objc_msgSend_raise_format_(v19, v26, v20, @"Failed to copy %@: %@", v22, v25);
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_msgSend_isWriting(self, v6, v7))
  {
    uint64_t v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKAtomBatch.m", 1045, @"Cannot encode an atom batch which is writing");
  }
  id v25 = 0;
  id v10 = objc_msgSend_dataWithError_(self, v8, (uint64_t)&v25);
  id v11 = v25;
  if (v10)
  {
    mergeableValueID = self->_mergeableValueID;
    uint64_t v13 = NSStringFromSelector(sel_mergeableValueID);
    objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)mergeableValueID, v13);

    if (self->_vectors)
    {
      id v17 = objc_msgSend__metadataForCoding(self, v15, v16);
      objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)v17, @"metadata");
    }
    else
    {
      objc_msgSend_encodeObject_forKey_(v5, v15, 0, @"metadata");
    }
    uint64_t v21 = NSStringFromSelector(sel_data);
    objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)v10, v21);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v19 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v11;
      _os_log_error_impl(&dword_1DD237000, v19, OS_LOG_TYPE_ERROR, "Error exporting data for atom batch in coder: %@", buf, 0xCu);
    }
    objc_msgSend_failWithError_(v5, v20, (uint64_t)v11);
  }
}

- (CKAtomBatch)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_mergeableValueID);
  id v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);

  uint64_t v9 = objc_opt_class();
  id v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"metadata");
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = NSStringFromSelector(sel_data);
  uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);

  id v18 = objc_msgSend_vectors(v11, v16, v17);
  id v26 = 0;
  uint64_t v20 = objc_msgSend_initWithData_mergeableValueID_vectors_error_(self, v19, (uint64_t)v15, v8, v18, &v26);
  id v21 = v26;

  if (v21)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_error_impl(&dword_1DD237000, v22, OS_LOG_TYPE_ERROR, "Error initializing atom batch from data in coder: %@", buf, 0xCu);
    }
    objc_msgSend_failWithError_(v4, v23, (uint64_t)v21);
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = v20;
  }

  return v24;
}

- (id)_metadataForCoding
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v16[0] = 0;
  v16[1] = 0;
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v5 = objc_msgSend_initWithUUIDBytes_(v3, v4, (uint64_t)v16);
  id v8 = objc_msgSend_UUIDString(v5, v6, v7);

  id v9 = objc_alloc(MEMORY[0x1E4F1A150]);
  uint64_t v12 = objc_msgSend_vectors(self, v10, v11);
  uint64_t v14 = objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v9, v13, (uint64_t)v8, v12, 0);

  return v14;
}

- (id)atomValueDescriptionBlock
{
  return self->_atomValueDescriptionBlock;
}

- (void)setAtomValueDescriptionBlock:(id)a3
{
}

- (CKXBackingStore)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong(&self->_atomValueDescriptionBlock, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
  objc_storeStrong((id *)&self->_vectors, 0);
}

@end