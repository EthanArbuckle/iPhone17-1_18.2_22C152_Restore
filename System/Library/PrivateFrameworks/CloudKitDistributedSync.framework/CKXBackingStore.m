@interface CKXBackingStore
+ ($00740EB67EC846EA2D41B6DF60171431)headerForData:(id)a3;
+ (BOOL)header:(id *)a3 forStorage:(id)a4 error:(id *)a5;
+ (BOOL)prefixStorage:(id)a3 withHeaderForVersion:(unsigned __int8)a4 error:(id *)a5;
+ (id)createHeaderDataForFormatVersion:(unsigned __int8)a3;
+ (unint64_t)headerSizeForFormatVersion:(unsigned __int8)a3;
- ($00740EB67EC846EA2D41B6DF60171431)header;
- ($06D0163FE0D7AFE752A9F21F38483579)writerIdentity;
- ($3CC19D079FD0B010EE84973AA846B91B)beginReferencedListForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($3CC19D079FD0B010EE84973AA846B91B)referencedListForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginAppendedListStructInList:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginReferencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginRootStructWithType:(SEL)a3 error:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructAtIndex:(SEL)a3 inList:(int64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)rootStructWithType:(SEL)a3;
- (BOOL)_setupBackingStoreForReadingWithError:(id *)a3;
- (BOOL)_setupBackingStoreForWritingWithError:(id *)a3;
- (BOOL)_validateVersion:(unsigned __int8)a3 isReader:(BOOL)a4 error:(id *)a5;
- (BOOL)finishWritingWithError:(id *)a3;
- (BOOL)flushWithError:(id *)a3;
- (BOOL)isWriting;
- (BOOL)referenceIsNull:(unint64_t)a3 inStruct:(id *)a4;
- (BOOL)setReadableStorage:(id)a3 error:(id *)a4;
- (BOOL)setWritableStorage:(id)a3 error:(id *)a4;
- (CKDSReadableStorage)readableStorage;
- (CKDSStorage)storage;
- (CKDSWritableStorage)writableStorage;
- (CKXBackingStore)initWithStorage:(id)a3 binding:(id)a4 error:(id *)a5;
- (CKXBackingStore)initWithStorage:(id)a3 binding:(id)a4 optionsByReaderWriterClass:(id)a5 formatVersion:(unsigned __int8)a6 error:(id *)a7;
- (CKXBinding)binding;
- (CKXProxyCache)proxyCache;
- (CKXReadStructProxy)topLevelReadProxy;
- (CKXVersionedReaderWriterStore)readerWriterStore;
- (CKXWriteStructProxy)topLevelWriteProxy;
- (id)_proxyWithListInstance:(id *)a3 mutable:(BOOL)a4 cacheScope:(int64_t)a5;
- (id)_proxyWithStructInstance:(id *)a3 mutable:(BOOL)a4 cacheScope:(int64_t)a5;
- (id)appendedStructProxyForListInstance:(id *)a3;
- (id)initWriterWithStorage:(id)a3 binding:(id)a4 formatVersion:(unsigned __int8)a5;
- (id)reader;
- (id)readerForProxy:(id)a3;
- (id)schema;
- (id)structListProxyForListReference:(unint64_t)a3 inStructInstance:(id *)a4 mutable:(BOOL)a5;
- (id)structProxyForListInstance:(id *)a3 atIndex:(int64_t)a4;
- (id)structProxyForStructReference:(unint64_t)a3 inStructInstance:(id *)a4 mutable:(BOOL)a5;
- (id)writer;
- (id)writerForProxy:(id)a3;
- (int64_t)lengthForList:(id *)a3;
- (unint64_t)cacheScope;
- (unint64_t)valueSizeForField:(unint64_t)a3;
- (unsigned)formatVersion;
- (void)assignStruct:(id *)a3 toReference:(unint64_t)a4 inStruct:(id *)a5;
- (void)commitStruct:(id *)a3;
- (void)copyData:(void *)a3 forField:(unint64_t)a4 inStruct:(id *)a5;
- (void)copyData:(void *)a3 forList:(id *)a4;
- (void)proxyScope:(id)a3;
- (void)readUsingBlock:(id)a3;
- (void)setCacheScope:(unint64_t)a3;
- (void)setData:(void *)a3 withEncoding:(const char *)a4 forField:(unint64_t)a5 inStruct:(id *)a6;
- (void)setData:(void *)a3 withLength:(unint64_t)a4 forList:(id *)a5;
- (void)setHeader:(id)a3;
- (void)setProxyCache:(id)a3;
- (void)setReaderWriterStore:(id)a3;
- (void)setStorage:(id)a3;
- (void)setTopLevelReadProxy:(id)a3;
- (void)writeUsingBlock:(id)a3;
@end

@implementation CKXBackingStore

- (CKXBackingStore)initWithStorage:(id)a3 binding:(id)a4 error:(id *)a5
{
  return (CKXBackingStore *)objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(self, a2, (uint64_t)a3, a4, 0, 3, a5);
}

- (id)initWriterWithStorage:(id)a3 binding:(id)a4 formatVersion:(unsigned __int8)a5
{
  return (id)objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(self, a2, (uint64_t)a3, a4, 0, a5, 0);
}

- (CKXBackingStore)initWithStorage:(id)a3 binding:(id)a4 optionsByReaderWriterClass:(id)a5 formatVersion:(unsigned __int8)a6 error:(id *)a7
{
  id v14 = a3;
  id v15 = a4;
  id v18 = a5;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v36 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, @"CKXBackingStore.mm", 60, @"Storage must not be nil");

    if (v15) {
      goto LABEL_3;
    }
  }
  v38 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, self, @"CKXBackingStore.mm", 61, @"Binding must not be nil");

LABEL_3:
  SEL v42 = a2;
  v19 = (CKXBackingStore *)a7;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v45.receiver = self;
  v45.super_class = (Class)CKXBackingStore;
  v21 = [(CKXBackingStore *)&v45 init];
  if (v21)
  {
    uint64_t v22 = objc_opt_new();
    v23 = (void *)*((void *)v21 + 4);
    *((void *)v21 + 4) = v22;

    objc_storeStrong((id *)v21 + 8, a4);
    v24 = [CKXVersionedReaderWriterStore alloc];
    uint64_t v26 = objc_msgSend_initWithBinding_optionsByReaderWriterClass_(v24, v25, (uint64_t)v15, v18);
    v27 = (void *)*((void *)v21 + 3);
    *((void *)v21 + 3) = v26;

    objc_storeStrong((id *)v21 + 2, a3);
    if (isKindOfClass)
    {
      *((_WORD *)v21 + 4) = 0;
      v21[10] = 0;
      v44 = 0;
      char v29 = objc_msgSend__setupBackingStoreForReadingWithError_(v21, v28, (uint64_t)&v44);
      v30 = v44;
    }
    else
    {
      v21[8] = a6;
      *(_WORD *)(v21 + 9) = 1025;
      v43 = 0;
      char v29 = objc_msgSend__setupBackingStoreForWritingWithError_(v21, v28, (uint64_t)&v43);
      v30 = v43;
    }
    id v32 = v30;
    id v31 = v32;
    if ((v29 & 1) == 0)
    {
      if (v32)
      {
        if (!a7) {
          goto LABEL_13;
        }
      }
      else
      {
        v40 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v33, v34);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)v42, v21, @"CKXBackingStore.mm", 90, @"No error found for failed backing store init");

        if (!a7) {
          goto LABEL_13;
        }
      }
      id v31 = v31;
      v19 = 0;
      *a7 = v31;
      goto LABEL_13;
    }
  }
  else
  {
    id v31 = 0;
  }
  v19 = v21;
LABEL_13:

  return v19;
}

- (BOOL)_validateVersion:(unsigned __int8)a3 isReader:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  unsigned int v7 = a3;
  v25[1] = *MEMORY[0x1E4F143B8];
  char v9 = objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, a2, a3);
  if (v9) {
    return v9;
  }
  if (v6)
  {
    v10 = NSString;
    if (v7 >= 4)
    {
      uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v8, @"Unknown reader format version %d", v7);
LABEL_11:
      v16 = (void *)v11;
      goto LABEL_12;
    }
    if (!v7)
    {
      uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v8, @"Invalid reader format version");
      goto LABEL_11;
    }
    id v14 = CKDSStringForBackingStoreFormatVersion(v7, v8);
    v16 = objc_msgSend_stringWithFormat_(v10, v15, @"Unsupported reader format version %@", v14);
  }
  else
  {
    v13 = NSString;
    if ((v7 - 4) <= 0xFCu)
    {
      uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v8, @"Unknown writer format version");
      goto LABEL_11;
    }
    uint64_t v17 = CKDSStringForBackingStoreFormatVersion(v7, v8);
    v16 = objc_msgSend_stringWithFormat_(v13, v18, @"Unsupported writer format version %@", v17);
  }
LABEL_12:
  v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v24 = *MEMORY[0x1E4F28568];
  v25[0] = v16;
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v25, &v24, 1);
  uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, @"CKDSErrorDomain", 4, v20);

  if (a5) {
    *a5 = v22;
  }

  return v9;
}

- (BOOL)_setupBackingStoreForReadingWithError:(id *)a3
{
  v103[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_readableStorage(self, a2, (uint64_t)a3);

  if (!v6)
  {
    v83 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v83, v84, (uint64_t)a2, self, @"CKXBackingStore.mm", 142, @"Readable storage not present");
  }
  if (self->_topLevelReadProxy)
  {
    v85 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v85, v86, (uint64_t)a2, self, @"CKXBackingStore.mm", 143, @"Backing store already set up for reading");
  }
  char v9 = objc_opt_class();
  v12 = objc_msgSend_readableStorage(self, v10, v11);
  id v99 = 0;
  char v14 = objc_msgSend_header_forStorage_error_(v9, v13, (uint64_t)&self->_header, v12, &v99);
  id v15 = v99;

  if (v14)
  {
    uint64_t v18 = objc_msgSend_formatVersion(self, v16, v17);
    id v98 = 0;
    char isReader_error = objc_msgSend__validateVersion_isReader_error_(self, v19, v18, 1, &v98);
    id v21 = v98;
    uint64_t v24 = v21;
    if ((isReader_error & 1) == 0)
    {
      BOOL v52 = 0;
      if (a3) {
        *a3 = v21;
      }
      goto LABEL_29;
    }
    v25 = objc_msgSend_readerWriterStore(self, v22, v23);
    uint64_t v28 = objc_msgSend_formatVersion(self, v26, v27);
    v30 = objc_msgSend_readerForVersion_(v25, v29, v28);

    if (!v30)
    {
      v87 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v31, v32);
      unsigned int v90 = objc_msgSend_formatVersion(self, v88, v89);
      v92 = CKDSStringForBackingStoreFormatVersion(v90, v91);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v87, v93, (uint64_t)a2, self, @"CKXBackingStore.mm", 167, @"Reader unexpectedly unavailable for atom batch format version %@", v92);
    }
    v33 = objc_opt_class();
    uint64_t v36 = objc_msgSend_formatVersion(self, v34, v35);
    unint64_t v38 = objc_msgSend_headerSizeForFormatVersion_(v33, v37, v36);
    v41 = objc_msgSend_readableStorage(self, v39, v40);
    v44 = objc_msgSend_fileURL(v41, v42, v43);
    BOOL v45 = v44 == 0;

    if (v45)
    {
      v53 = objc_msgSend_readableStorage(self, v46, v47);
      v49 = objc_msgSend_data(v53, v54, v55);

      if (objc_msgSend_length(v49, v56, v57) < v38)
      {
        v60 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v100 = *MEMORY[0x1E4F28568];
        v101 = @"Invalid file length";
        v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v58, (uint64_t)&v101, &v100, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v60, v62, @"CKDSErrorDomain", 5, v61);
        id v51 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      uint64_t v66 = objc_msgSend_length(v49, v58, v59);
      v68 = objc_msgSend_subdataWithRange_(v49, v67, v38, v66 - v38);
      v69 = [CKDSReadableStorage alloc];
      v71 = objc_msgSend_initWithData_(v69, v70, (uint64_t)v68);
      id v96 = 0;
      char v73 = objc_msgSend_setReadableStorage_error_(v30, v72, (uint64_t)v71, &v96);
      id v51 = v96;

      if ((v73 & 1) == 0) {
        goto LABEL_21;
      }
    }
    else
    {
      if (v38)
      {
        v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v102 = *MEMORY[0x1E4F28568];
        v103[0] = @"Not implemented";
        v49 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v46, (uint64_t)v103, &v102, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v48, v50, @"CKDSErrorDomain", 1, v49);
        id v51 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
        if (a3) {
          *a3 = v51;
        }

        BOOL v52 = 0;
        goto LABEL_28;
      }
      v63 = objc_msgSend_readableStorage(self, v46, v47);
      id v97 = 0;
      char v65 = objc_msgSend_setReadableStorage_error_(v30, v64, (uint64_t)v63, &v97);
      id v51 = v97;

      if ((v65 & 1) == 0) {
        goto LABEL_21;
      }
    }

    long long v94 = 0uLL;
    uint64_t v95 = 0;
    v76 = objc_msgSend_binding(self, v74, v75);
    uint64_t v79 = objc_msgSend_topLevelStructToken(v76, v77, v78);
    objc_msgSend_rootStructWithType_(self, v80, v79);

    topLevelReadProxy = self->_topLevelReadProxy;
    self->_topLevelReadProxy = 0;

    BOOL v52 = 1;
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  BOOL v52 = 0;
  if (a3) {
    *a3 = v15;
  }
LABEL_30:

  return v52;
}

- (BOOL)_setupBackingStoreForWritingWithError:(id *)a3
{
  BOOL v6 = objc_msgSend_writableStorage(self, a2, (uint64_t)a3);

  if (!v6)
  {
    v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, @"CKXBackingStore.mm", 216, @"Writable storage not present");
  }
  if (self->_topLevelWriteProxy)
  {
    v46 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, (uint64_t)a2, self, @"CKXBackingStore.mm", 217, @"Backing store already set up for writing");
  }
  uint64_t v9 = objc_msgSend_formatVersion(self, v7, v8);
  id v61 = 0;
  char isReader_error = objc_msgSend__validateVersion_isReader_error_(self, v10, v9, 0, &v61);
  id v12 = v61;
  id v15 = v12;
  if (isReader_error)
  {
    v16 = objc_msgSend_readerWriterStore(self, v13, v14);
    uint64_t v19 = objc_msgSend_formatVersion(self, v17, v18);
    id v21 = objc_msgSend_writerForVersion_(v16, v20, v19);

    if (!v21)
    {
      v48 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23);
      unsigned int v51 = objc_msgSend_formatVersion(self, v49, v50);
      v53 = CKDSStringForBackingStoreFormatVersion(v51, v52);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v54, (uint64_t)a2, self, @"CKXBackingStore.mm", 231, @"Writer unexpectedly unavailable for atom batch format version %@", v53);
    }
    uint64_t v24 = objc_msgSend_writableStorage(self, v22, v23);
    id v60 = 0;
    char v26 = objc_msgSend_setWritableStorage_error_(v21, v25, (uint64_t)v24, &v60);
    id v27 = v60;

    if (v26)
    {

      long long v58 = 0uLL;
      uint64_t v59 = 0;
      v30 = objc_msgSend_binding(self, v28, v29);
      uint64_t v33 = objc_msgSend_topLevelStructToken(v30, v31, v32);
      id v57 = 0;
      objc_msgSend_beginRootStructWithType_error_(self, v34, v33, &v57);
      id v27 = v57;

      BOOL v37 = (void)v58 != 0;
      if ((void)v58)
      {
        long long v55 = v58;
        uint64_t v56 = v59;
        uint64_t v38 = objc_msgSend_cacheScope(self, v35, v36);
        objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v39, (uint64_t)&v55, 1, v38);
        uint64_t v40 = (CKXWriteStructProxy *)objc_claimAutoreleasedReturnValue();
        topLevelWriteProxy = self->_topLevelWriteProxy;
        self->_topLevelWriteProxy = v40;

LABEL_20:
        goto LABEL_21;
      }
      if (!a3) {
        goto LABEL_20;
      }
      id v42 = v27;
    }
    else
    {
      if (!a3)
      {
        BOOL v37 = 0;
        goto LABEL_20;
      }
      id v42 = v27;
      id v27 = v42;
      BOOL v37 = 0;
    }
    *a3 = v42;
    goto LABEL_20;
  }
  BOOL v37 = 0;
  if (a3) {
    *a3 = v12;
  }
LABEL_21:

  return v37;
}

- (CKDSReadableStorage)readableStorage
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->_storage;
  }
  else {
    v3 = 0;
  }
  return (CKDSReadableStorage *)v3;
}

- (CKDSWritableStorage)writableStorage
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->_storage;
  }
  else {
    v3 = 0;
  }
  return (CKDSWritableStorage *)v3;
}

- (BOOL)isWriting
{
  v3 = objc_msgSend_writableStorage(self, a2, v2);
  BOOL v4 = v3 != 0;

  return v4;
}

- (unsigned)formatVersion
{
  return objc_msgSend_header(self, a2, v2);
}

- ($06D0163FE0D7AFE752A9F21F38483579)writerIdentity
{
  return ($06D0163FE0D7AFE752A9F21F38483579)(objc_msgSend_header(self, a2, v2) >> 8);
}

- (id)reader
{
  if (objc_msgSend_isWriting(self, a2, v2))
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CKXBackingStore.mm", 291, @"Reading not permitted while writing");
  }
  unsigned int v7 = objc_msgSend_readerWriterStore(self, v5, v6);
  uint64_t v10 = objc_msgSend_formatVersion(self, v8, v9);
  id v12 = objc_msgSend_readerForVersion_(v7, v11, v10);

  if (!v12)
  {
    uint64_t v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKXBackingStore.mm", 293, @"Reader not found");
  }
  return v12;
}

- (id)writer
{
  if ((objc_msgSend_isWriting(self, a2, v2) & 1) == 0)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CKXBackingStore.mm", 298, @"Writing not permitted while reading");
  }
  unsigned int v7 = objc_msgSend_readerWriterStore(self, v5, v6);
  uint64_t v10 = objc_msgSend_formatVersion(self, v8, v9);
  id v12 = objc_msgSend_writerForVersion_(v7, v11, v10);

  if (!v12)
  {
    uint64_t v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKXBackingStore.mm", 300, @"Writer not found");
  }
  return v12;
}

- (void)readUsingBlock:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, NSObject *))a3;
  uint64_t v6 = (void *)MEMORY[0x1E01B2270]();
  if (objc_msgSend_isWriting(self, v7, v8))
  {
    BOOL v45 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, @"CKXBackingStore.mm", 306, @"finishWriting needs to be called before any data can be read");
  }
  uint64_t v11 = objc_msgSend_topLevelReadProxy(self, v9, v10);

  id v12 = (void *)*MEMORY[0x1E4F1A548];
  if (v11)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v12);
    }
    v13 = (id)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v21 = objc_msgSend_header(self, v14, v15);
      CKDSStringForBackingStoreFormatVersion(v21, v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      unsigned __int8 v26 = (unsigned __int16)objc_msgSend_header(self, v24, v25) >> 8;
      unsigned __int8 v29 = objc_msgSend_header(self, v27, v28) >> 16;
      uint64_t v32 = objc_msgSend_readableStorage(self, v30, v31);
      int v47 = 138413058;
      id v48 = v23;
      __int16 v49 = 1024;
      int v50 = v26;
      __int16 v51 = 1024;
      int v52 = v29;
      __int16 v53 = 2112;
      v54 = v32;
      _os_log_debug_impl(&dword_1DD237000, v13, OS_LOG_TYPE_DEBUG, "Reading %@ file with writer code %u, writer version %d, and storage %@", (uint8_t *)&v47, 0x22u);
    }
    uint64_t v18 = objc_msgSend_topLevelReadProxy(self, v16, v17);
    v5[2](v5, v18);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v12);
    }
    uint64_t v18 = (id)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v33 = objc_msgSend_header(self, v19, v20);
      CKDSStringForBackingStoreFormatVersion(v33, v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      unsigned __int8 v38 = (unsigned __int16)objc_msgSend_header(self, v36, v37) >> 8;
      unsigned __int8 v41 = objc_msgSend_header(self, v39, v40) >> 16;
      v44 = objc_msgSend_readableStorage(self, v42, v43);
      int v47 = 138413058;
      id v48 = v35;
      __int16 v49 = 1024;
      int v50 = v38;
      __int16 v51 = 1024;
      int v52 = v41;
      __int16 v53 = 2112;
      v54 = v44;
      _os_log_debug_impl(&dword_1DD237000, v18, OS_LOG_TYPE_DEBUG, "Skipping read for %@ file with writer code %u, writer version %d, and storage %@, due to null root struct", (uint8_t *)&v47, 0x22u);
    }
  }
}

- (void)writeUsingBlock:(id)a3
{
  v13 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x1E01B2270]();
  if ((objc_msgSend_isWriting(self, v6, v7) & 1) == 0)
  {
    uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CKXBackingStore.mm", 320, @"Writing not permitted after finishWriting has already been called");
  }
  uint64_t v10 = objc_msgSend_topLevelWriteProxy(self, v8, v9);
  v13[2](v13, v10);
}

- (BOOL)finishWritingWithError:(id *)a3
{
  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    id v34 = 0;
    char v6 = objc_msgSend_flushWithError_(self, v5, (uint64_t)&v34);
    id v7 = v34;
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v11 = objc_msgSend_writableStorage(self, v9, v10);
      uint64_t v14 = objc_msgSend_formatVersion(self, v12, v13);
      id v33 = v7;
      char v16 = objc_msgSend_prefixStorage_withHeaderForVersion_error_(v8, v15, (uint64_t)v11, v14, &v33);
      id v17 = v33;

      if ((v16 & 1) == 0)
      {
        if (!a3)
        {
          BOOL v30 = 0;
          id v7 = v17;
          goto LABEL_12;
        }
        id v7 = v17;
        goto LABEL_11;
      }
      uint64_t v20 = objc_msgSend_writableStorage(self, v18, v19);
      objc_msgSend_readableStorage(v20, v21, v22);
      id v23 = (CKDSStorage *)objc_claimAutoreleasedReturnValue();
      storage = self->_storage;
      self->_storage = v23;

      objc_msgSend_reset(self->_topLevelWriteProxy, v25, v26);
      topLevelWriteProxy = self->_topLevelWriteProxy;
      self->_topLevelWriteProxy = 0;

      id v32 = v17;
      char v29 = objc_msgSend__setupBackingStoreForReadingWithError_(self, v28, (uint64_t)&v32);
      id v7 = v32;

      if (v29)
      {
        BOOL v30 = 1;
LABEL_12:

        return v30;
      }
    }
    if (!a3)
    {
      BOOL v30 = 0;
      goto LABEL_12;
    }
LABEL_11:
    id v7 = v7;
    BOOL v30 = 0;
    *a3 = v7;
    goto LABEL_12;
  }
  return 1;
}

- (id)structProxyForStructReference:(unint64_t)a3 inStructInstance:(id *)a4 mutable:(BOOL)a5
{
  if (!a4->var0) {
    goto LABEL_7;
  }
  BOOL v5 = a5;
  if (a5)
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = *a4;
    objc_msgSend_beginReferencedStructForReference_inStruct_(self, a2, a3, &v16);
  }
  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = *a4;
    objc_msgSend_referencedStructForReference_inStruct_(self, a2, a3, &v15);
  }
  long long v19 = v18;
  if (v17)
  {
    uint64_t v13 = v17;
    long long v14 = v19;
    uint64_t v9 = objc_msgSend_cacheScope(self, v7, v8);
    uint64_t v11 = objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v10, (uint64_t)&v13, v5, v9);
  }
  else
  {
LABEL_7:
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)structListProxyForListReference:(unint64_t)a3 inStructInstance:(id *)a4 mutable:(BOOL)a5
{
  if (!a4->var0) {
    goto LABEL_7;
  }
  BOOL v5 = a5;
  if (a5)
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = *a4;
    objc_msgSend_beginReferencedListForReference_inStruct_(self, a2, a3, &v15);
  }
  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a4;
    objc_msgSend_referencedListForReference_inStruct_(self, a2, a3, &v14);
  }
  long long v19 = v18;
  if (v17)
  {
    uint64_t v9 = objc_msgSend_cacheScope(self, v7, v8, v16, v17, v19);
    uint64_t v11 = objc_msgSend__proxyWithListInstance_mutable_cacheScope_(self, v10, (uint64_t)&v13, v5, v9);
  }
  else
  {
LABEL_7:
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)appendedStructProxyForListInstance:(id *)a3
{
  if (a3->var1
    && (long long v13 = 0uLL,
        uint64_t v14 = 0,
        long long v4 = *(_OWORD *)&a3->var2,
        v12[0] = *(_OWORD *)&a3->var0,
        v12[1] = v4,
        objc_msgSend_beginAppendedListStructInList_(self, a2, (uint64_t)v12),
        (void)v13))
  {
    uint64_t v7 = objc_msgSend_cacheScope(self, v5, v6, v13, v14);
    uint64_t v9 = objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v8, (uint64_t)&v11, 1, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)structProxyForListInstance:(id *)a3 atIndex:(int64_t)a4
{
  if (a3->var1
    && (long long v14 = 0uLL,
        uint64_t v15 = 0,
        long long v5 = *(_OWORD *)&a3->var2,
        v13[0] = *(_OWORD *)&a3->var0,
        v13[1] = v5,
        objc_msgSend_referencedStructAtIndex_inList_(self, a2, a4, v13),
        (void)v14))
  {
    uint64_t v8 = objc_msgSend_cacheScope(self, v6, v7, v14, v15);
    uint64_t v10 = objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v9, (uint64_t)&v12, 0, v8);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)_proxyWithStructInstance:(id *)a3 mutable:(BOOL)a4 cacheScope:(int64_t)a5
{
  BOOL v6 = a4;
  if (a3->var0 == -1)
  {
    uint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CKXBackingStore.mm", 443, @"Invalid struct token");

    if (a3->var0) {
      goto LABEL_3;
    }
  }
  else if (a3->var0)
  {
LABEL_3:
    uint64_t v9 = objc_msgSend_proxyCache(self, a2, (uint64_t)a3);
    long long v13 = objc_msgSend_binding(self, v10, v11);
    if (v6) {
      uint64_t v14 = objc_msgSend_mutableProxyClassForStructToken_(v13, v12, a3->var0);
    }
    else {
      uint64_t v14 = objc_msgSend_proxyClassForStructToken_(v13, v12, a3->var0);
    }
    uint64_t v16 = objc_msgSend_proxyForClass_withScope_(v9, v15, v14, a5);

    objc_msgSend_associateWithBackingStore_(v16, v17, (uint64_t)self);
    long long v23 = *(_OWORD *)&a3->var0;
    unint64_t var2 = a3->var2;
    objc_msgSend_associateWithStructInstance_(v16, v18, (uint64_t)&v23);
    goto LABEL_9;
  }
  uint64_t v16 = 0;
LABEL_9:
  return v16;
}

- (id)_proxyWithListInstance:(id *)a3 mutable:(BOOL)a4 cacheScope:(int64_t)a5
{
  unint64_t var1 = a3->var1;
  if (var1 == -1)
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKXBackingStore.mm", 456, @"Invalid struct token");

    if (a3->var1) {
      goto LABEL_3;
    }
  }
  else if (var1)
  {
LABEL_3:
    uint64_t v9 = objc_msgSend_proxyCache(self, a2, (uint64_t)a3);
    uint64_t v10 = objc_opt_class();
    long long v12 = objc_msgSend_proxyForClass_withScope_(v9, v11, v10, a5);

    objc_msgSend_associateWithBackingStore_(v12, v13, (uint64_t)self);
    long long v14 = *(_OWORD *)&a3->var2;
    v20[0] = *(_OWORD *)&a3->var0;
    v20[1] = v14;
    objc_msgSend_associateWithListInstance_(v12, v15, (uint64_t)v20);
    goto LABEL_6;
  }
  long long v12 = 0;
LABEL_6:
  return v12;
}

- (void)proxyScope:(id)a3
{
  long long v19 = (void (**)(void))a3;
  uint64_t v6 = objc_msgSend_cacheScope(self, v4, v5);
  uint64_t v9 = objc_msgSend_cacheScope(self, v7, v8) + 1;
  objc_msgSend_setCacheScope_(self, v10, v9);
  uint64_t v12 = objc_msgSend_setCacheScope_(self, v11, v9);
  long long v13 = (void *)MEMORY[0x1E01B2270](v12);
  v19[2]();
  uint64_t v16 = objc_msgSend_proxyCache(self, v14, v15);
  objc_msgSend_putBackAllProxiesWithScope_(v16, v17, v9);

  objc_msgSend_setCacheScope_(self, v18, v6);
}

- (id)readerForProxy:(id)a3
{
  id v5 = a3;
  if (objc_msgSend_isMutable(v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CKXBackingStore.mm", 480, @"Proxy must be immutable for reading");
  }
  return self;
}

- (id)writerForProxy:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isMutable(v5, v6, v7) & 1) == 0)
  {
    uint64_t v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CKXBackingStore.mm", 485, @"Proxy must be mutable for writing");
  }
  if (objc_msgSend_committed(v5, v8, v9))
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    objc_msgSend_raise_format_(v10, v13, *MEMORY[0x1E4F1C3B8], @"Write proxy %@ was retained out of scope and cannot be reused", v12);
  }
  return self;
}

- (id)schema
{
  v3 = objc_msgSend_binding(self, a2, v2);
  uint64_t v6 = objc_msgSend_schema(v3, v4, v5);

  return v6;
}

- (unint64_t)valueSizeForField:(unint64_t)a3
{
  long long v4 = objc_msgSend_schema(self, a2, a3);
  unint64_t v6 = sub_1DD2FE180((uint64_t)v4, (const char *)a3, v5);

  return v6;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)rootStructWithType:(SEL)a3
{
  retstr->var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  unint64_t v6 = objc_msgSend_reader(self, a3, a4);
  id v9 = v6;
  if (v6)
  {
    objc_msgSend_rootStructWithType_(v6, v7, a4);
  }
  else
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  id v9 = objc_msgSend_schema(self, a3, a4);
  if (!v9 || (uint64_t v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  int v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->unint64_t var1 = -1;
    retstr->unint64_t var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  uint64_t v15 = objc_msgSend_reader(self, v13, v14);
  uint64_t v17 = v15;
  long long v18 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_referencedStructForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }

  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)referencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  id v9 = objc_msgSend_schema(self, a3, a4);
  if (!v9 || (uint64_t v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  int v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = -1;
    retstr->var3 = -1;
    return result;
  }
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->unint64_t var2 = 0u;
  uint64_t v15 = objc_msgSend_reader(self, v13, v14);
  uint64_t v17 = v15;
  long long v18 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_referencedListForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->unint64_t var2 = 0u;
  }

  return result;
}

- (BOOL)referenceIsNull:(unint64_t)a3 inStruct:(id *)a4
{
  uint64_t v7 = objc_msgSend_schema(self, a2, a3);
  if (!v7 || (uint64_t v8 = v7[10], 0x6DB6DB6DB6DB6DB7 * ((v7[11] - v8) >> 3) <= a3))
  {

    return 1;
  }
  int v9 = *(unsigned __int8 *)(v8 + 56 * a3);

  if (!v9) {
    return 1;
  }
  uint64_t v12 = objc_msgSend_reader(self, v10, v11);
  long long v16 = *(_OWORD *)&a4->var0;
  unint64_t var2 = a4->var2;
  char IsNull_inStruct = objc_msgSend_referenceIsNull_inStruct_(v12, v13, a3, &v16);

  return IsNull_inStruct;
}

- (int64_t)lengthForList:(id *)a3
{
  if (!a3->var1) {
    return 0;
  }
  long long v4 = objc_msgSend_reader(self, a2, (uint64_t)a3);
  long long v5 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  int64_t v7 = objc_msgSend_lengthForList_(v4, v6, (uint64_t)v9);

  return v7;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructAtIndex:(SEL)a3 inList:(int64_t)a4
{
  int v9 = objc_msgSend_schema(self, a3, a4);
  if (!v9 || (var1 = a5->var1, uint64_t v11 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v11) >> 3) <= var1))
  {

    goto LABEL_7;
  }
  int v12 = *(unsigned __int8 *)(v11 + 56 * var1);

  if (!v12)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->unint64_t var1 = -1;
    retstr->unint64_t var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  long long v16 = objc_msgSend_reader(self, v14, v15);
  long long v18 = v16;
  long long v19 = *(_OWORD *)&a5->var2;
  v20[0] = *(_OWORD *)&a5->var0;
  v20[1] = v19;
  if (v16)
  {
    objc_msgSend_referencedStructAtIndex_inList_(v16, v17, a4, v20);
  }
  else
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }

  return result;
}

- (void)copyData:(void *)a3 forField:(unint64_t)a4 inStruct:(id *)a5
{
  int v9 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  if (v9 && (uint64_t v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) > a4))
  {
    int v11 = *(unsigned __int8 *)(v10 + 56 * a4);

    if (v11)
    {
      uint64_t v14 = objc_msgSend_reader(self, v12, v13);
      long long v16 = *(_OWORD *)&a5->var0;
      unint64_t var2 = a5->var2;
      objc_msgSend_copyData_forField_inStruct_(v14, v15, (uint64_t)a3, a4, &v16);
    }
  }
  else
  {
  }
}

- (void)copyData:(void *)a3 forList:(id *)a4
{
  int64_t v7 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  if (v7 && (var1 = a4->var1, uint64_t v9 = v7[10], 0x6DB6DB6DB6DB6DB7 * ((v7[11] - v9) >> 3) > var1))
  {
    int v10 = *(unsigned __int8 *)(v9 + 56 * var1);

    if (v10)
    {
      uint64_t v13 = objc_msgSend_reader(self, v11, v12);
      long long v14 = *(_OWORD *)&a4->var2;
      v16[0] = *(_OWORD *)&a4->var0;
      v16[1] = v14;
      objc_msgSend_copyData_forList_(v13, v15, (uint64_t)a3, v16);
    }
  }
  else
  {
  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginRootStructWithType:(SEL)a3 error:(unint64_t)a4
{
  retstr->var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  uint64_t v8 = objc_msgSend_writer(self, a3, a4);
  id v11 = v8;
  if (v8)
  {
    objc_msgSend_beginRootStructWithType_error_(v8, v9, a4, a5);
  }
  else
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginReferencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  uint64_t v9 = objc_msgSend_schema(self, a3, a4);
  if (!v9 || (uint64_t v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  int v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->unint64_t var1 = -1;
    retstr->unint64_t var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  uint64_t v15 = objc_msgSend_writer(self, v13, v14);
  uint64_t v17 = v15;
  long long v18 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_beginReferencedStructForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }

  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)beginReferencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  uint64_t v9 = objc_msgSend_schema(self, a3, a4);
  if (!v9 || (uint64_t v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  int v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = -1;
    retstr->var3 = -1;
    return result;
  }
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->unint64_t var2 = 0u;
  uint64_t v15 = objc_msgSend_writer(self, v13, v14);
  uint64_t v17 = v15;
  long long v18 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_beginReferencedListForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->unint64_t var2 = 0u;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginAppendedListStructInList:(SEL)a3
{
  int64_t v7 = objc_msgSend_schema(self, a3, (uint64_t)a4);
  if (!v7 || (var1 = a4->var1, uint64_t v9 = v7[10], 0x6DB6DB6DB6DB6DB7 * ((v7[11] - v9) >> 3) <= var1))
  {

    goto LABEL_7;
  }
  int v10 = *(unsigned __int8 *)(v9 + 56 * var1);

  if (!v10)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->unint64_t var1 = -1;
    retstr->unint64_t var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->unint64_t var1 = 0;
  retstr->unint64_t var2 = 0;
  uint64_t v14 = objc_msgSend_writer(self, v12, v13);
  long long v16 = v14;
  long long v17 = *(_OWORD *)&a4->var2;
  v18[0] = *(_OWORD *)&a4->var0;
  v18[1] = v17;
  if (v14)
  {
    objc_msgSend_beginAppendedListStructInList_(v14, v15, (uint64_t)v18);
  }
  else
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }

  return result;
}

- (void)setData:(void *)a3 withEncoding:(const char *)a4 forField:(unint64_t)a5 inStruct:(id *)a6
{
  int v11 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  if (v11 && (uint64_t v12 = v11[10], 0x6DB6DB6DB6DB6DB7 * ((v11[11] - v12) >> 3) > a5))
  {
    int v13 = *(unsigned __int8 *)(v12 + 56 * a5);

    if (v13)
    {
      long long v16 = objc_msgSend_writer(self, v14, v15);
      long long v18 = *(_OWORD *)&a6->var0;
      unint64_t var2 = a6->var2;
      objc_msgSend_setData_withEncoding_forField_inStruct_(v16, v17, (uint64_t)a3, a4, a5, &v18);
    }
  }
  else
  {
  }
}

- (void)setData:(void *)a3 withLength:(unint64_t)a4 forList:(id *)a5
{
  uint64_t v9 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  if (v9 && (var1 = a5->var1, uint64_t v11 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v11) >> 3) > var1))
  {
    int v12 = *(unsigned __int8 *)(v11 + 56 * var1);

    if (v12)
    {
      uint64_t v15 = objc_msgSend_writer(self, v13, v14);
      long long v16 = *(_OWORD *)&a5->var2;
      v18[0] = *(_OWORD *)&a5->var0;
      v18[1] = v16;
      objc_msgSend_setData_withLength_forList_(v15, v17, (uint64_t)a3, a4, v18);
    }
  }
  else
  {
  }
}

- (void)assignStruct:(id *)a3 toReference:(unint64_t)a4 inStruct:(id *)a5
{
  uint64_t v9 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  if (v9 && (uint64_t v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) > a4))
  {
    int v11 = *(unsigned __int8 *)(v10 + 56 * a4);

    if (v11)
    {
      uint64_t v14 = objc_msgSend_writer(self, v12, v13);
      long long v18 = *(_OWORD *)&a3->var0;
      unint64_t var2 = a3->var2;
      long long v16 = *(_OWORD *)&a5->var0;
      unint64_t v17 = a5->var2;
      objc_msgSend_assignStruct_toReference_inStruct_(v14, v15, (uint64_t)&v18, a4, &v16);
    }
  }
  else
  {
  }
}

- (void)commitStruct:(id *)a3
{
  long long v4 = objc_msgSend_writer(self, a2, (uint64_t)a3);
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  objc_msgSend_commitStruct_(v4, v5, (uint64_t)&v6);
}

- (BOOL)flushWithError:(id *)a3
{
  long long v5 = objc_msgSend_topLevelWriteProxy(self, a2, (uint64_t)a3);

  if (v5) {
    goto LABEL_6;
  }
  id v15 = 0;
  int v8 = objc_msgSend__setupBackingStoreForWritingWithError_(self, v6, (uint64_t)&v15);
  id v9 = v15;
  uint64_t v10 = v9;
  if (a3 && (v8 & 1) == 0) {
    *a3 = v9;
  }

  if (!v8) {
    return 0;
  }
LABEL_6:
  int v11 = objc_msgSend_writer(self, v6, v7);
  char v13 = objc_msgSend_flushWithError_(v11, v12, (uint64_t)a3);

  return v13;
}

- (BOOL)setReadableStorage:(id)a3 error:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CKXBackingStore.mm", 642, @"setReadableStorage should not be called on the backing store instance");

  return 0;
}

- (BOOL)setWritableStorage:(id)a3 error:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CKXBackingStore.mm", 647, @"setWritableStorage should not be called on the backing store instance");

  return 0;
}

- (CKDSStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (CKXVersionedReaderWriterStore)readerWriterStore
{
  return self->_readerWriterStore;
}

- (void)setReaderWriterStore:(id)a3
{
}

- (CKXProxyCache)proxyCache
{
  return self->_proxyCache;
}

- (void)setProxyCache:(id)a3
{
}

- (unint64_t)cacheScope
{
  return self->_cacheScope;
}

- (void)setCacheScope:(unint64_t)a3
{
  self->_cacheScope = a3;
}

- (CKXReadStructProxy)topLevelReadProxy
{
  return self->_topLevelReadProxy;
}

- (void)setTopLevelReadProxy:(id)a3
{
}

- (CKXWriteStructProxy)topLevelWriteProxy
{
  return self->_topLevelWriteProxy;
}

- ($00740EB67EC846EA2D41B6DF60171431)header
{
  return ($00740EB67EC846EA2D41B6DF60171431)(*(unsigned __int16 *)&self->_header.formatVersion | (self->_header.writerIdentity.writerVersion << 16));
}

- (void)setHeader:(id)a3
{
  self->_header = ($4648BA6A93F1E3DAEC2343E896DE4F97)a3;
}

- (CKXBinding)binding
{
  return self->_binding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binding, 0);
  objc_storeStrong((id *)&self->_topLevelWriteProxy, 0);
  objc_storeStrong((id *)&self->_topLevelReadProxy, 0);
  objc_storeStrong((id *)&self->_proxyCache, 0);
  objc_storeStrong((id *)&self->_readerWriterStore, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

+ (unint64_t)headerSizeForFormatVersion:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if ((objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, a2, a3) & 1) == 0)
  {
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    int v11 = CKDSStringForBackingStoreFormatVersion(v3, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v12, (uint64_t)a2, a1, @"CKXBackingStore.mm", 661, @"Format version %@ not supported", v11);

LABEL_7:
    return 0;
  }
  if (v3 != 3)
  {
    if (v3 == 2) {
      return 7;
    }
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v13, (uint64_t)a2, a1, @"CKXBackingStore.mm", 670, @"Unexpected format version");
    goto LABEL_7;
  }
  return 0;
}

+ (BOOL)header:(id *)a3 forStorage:(id)a4 error:(id *)a5
{
  id v8 = a4;
  int v11 = objc_msgSend_fileURL(v8, v9, v10);

  if (v11)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1C9B8];
    id v15 = objc_msgSend_fileURL(v8, v12, v13);
    id v26 = 0;
    unint64_t v17 = objc_msgSend_dataWithContentsOfURL_options_error_(v14, v16, (uint64_t)v15, 1, &v26);
    id v18 = v26;

    BOOL v20 = v17 != 0;
    if (v17)
    {
      if (a3)
      {
        uint64_t v21 = objc_msgSend_headerForData_(a1, v19, (uint64_t)v17);
        *(_WORD *)&a3->var0 = v21;
        a3->var1.unint64_t var1 = BYTE2(v21);
      }
    }
    else if (a5)
    {
      *a5 = v18;
    }
  }
  else
  {
    if (a3)
    {
      uint64_t v22 = objc_msgSend_data(v8, v12, v13);
      uint64_t v24 = objc_msgSend_headerForData_(a1, v23, (uint64_t)v22);
      *(_WORD *)&a3->var0 = v24;
      a3->var1.unint64_t var1 = BYTE2(v24);
    }
    BOOL v20 = 1;
  }

  return v20;
}

+ ($00740EB67EC846EA2D41B6DF60171431)headerForData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1DD30BFC0;
  v19[3] = &unk_1E6CBACE0;
  id v4 = v3;
  id v20 = v4;
  long long v5 = (uint64_t (**)(void, void, void))MEMORY[0x1E01B2450](v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DD30C02C;
  v17[3] = &unk_1E6CBACE0;
  id v6 = v4;
  id v18 = v6;
  uint64_t v7 = (uint64_t (**)(void, void, void))MEMORY[0x1E01B2450](v17);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DD30C0EC;
  v15[3] = &unk_1E6CBACE0;
  id v8 = v6;
  id v16 = v8;
  id v9 = (void (**)(void, void, void))MEMORY[0x1E01B2450](v15);
  int v24 = 0;
  uint64_t v23 = 0;
  unint64_t v12 = objc_msgSend_length(v8, v10, v11);
  if (v12 >= 0xC) {
    objc_msgSend_getBytes_range_(v8, v13, (uint64_t)&v23, 0, 12);
  }
  else {
    objc_msgSend_getBytes_range_(v8, v13, (uint64_t)&v23, 0, v12);
  }
  unsigned __int8 v22 = 0;
  unsigned __int16 v21 = 0;
  if ((((uint64_t (**)(void, uint64_t *, unsigned __int16 *))v5)[2](v5, &v23, &v21) & 1) == 0
    && (((uint64_t (**)(void, uint64_t *, unsigned __int16 *))v7)[2](v7, &v23, &v21) & 1) == 0)
  {
    ((void (**)(void, uint64_t *, unsigned __int16 *))v9)[2](v9, &v23, &v21);
  }

  return ($00740EB67EC846EA2D41B6DF60171431)(v21 | (v22 << 16));
}

+ (id)createHeaderDataForFormatVersion:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if ((objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, a2, a3) & 1) == 0)
  {
    id v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    uint64_t v11 = CKDSStringForBackingStoreFormatVersion(v3, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v12, (uint64_t)a2, a1, @"CKXBackingStore.mm", 759, @"Format version %@ not supported", v11);

    goto LABEL_6;
  }
  if (v3 != 2)
  {
    if (v3 == 3)
    {
LABEL_7:
      uint64_t v13 = objc_opt_new();
      goto LABEL_8;
    }
    id v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, a1, @"CKXBackingStore.mm", 772, @"Unexpected format version");
LABEL_6:

    goto LABEL_7;
  }
  int v15 = -1421867861;
  __int16 v16 = 258;
  char v17 = 4;
  uint64_t v13 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v6, (uint64_t)&v15, 7);
LABEL_8:
  return v13;
}

+ (BOOL)prefixStorage:(id)a3 withHeaderForVersion:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, v10, v6) & 1) == 0)
  {
    BOOL v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    id v32 = CKDSStringForBackingStoreFormatVersion(v6, v31);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v33, (uint64_t)a2, a1, @"CKXBackingStore.mm", 781, @"Format version %@ not supported", v32);

    LOBYTE(a5) = 0;
    goto LABEL_8;
  }
  uint64_t v13 = objc_msgSend_createHeaderDataForFormatVersion_(a1, v11, v6);
  if (objc_msgSend_length(v13, v14, v15))
  {
    id v18 = objc_msgSend_data(v9, v16, v17);

    if (!v18)
    {
      if (a5)
      {
        id v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        v41[0] = @"Not implemented";
        uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v41, &v40, 1);
        unsigned __int8 v38 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v37, @"CKDSErrorDomain", 1, v36);

        id v39 = v38;
        *a5 = v39;

        LOBYTE(a5) = 0;
      }
      goto LABEL_6;
    }
    unsigned __int16 v21 = objc_msgSend_data(v9, v19, v20);
    id v22 = v13;
    uint64_t v25 = objc_msgSend_bytes(v22, v23, v24);
    uint64_t v28 = objc_msgSend_length(v22, v26, v27);
    objc_msgSend_replaceBytesInRange_withBytes_length_(v21, v29, 0, 0, v25, v28);
  }
  LOBYTE(a5) = 1;
LABEL_6:

LABEL_8:
  return (char)a5;
}

@end