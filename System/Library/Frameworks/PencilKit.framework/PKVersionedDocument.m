@interface PKVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
+ (unsigned)versionedDocumentSerializationVersion;
- (BOOL)loadData:(id)a3;
- (BOOL)loadDocumentArchive:(void *)a3;
- (BOOL)loadUnzippedData:(id)a3;
- (PKVersionedDocument)init;
- (PKVersionedDocument)initWithArchive:(const void *)a3;
- (PKVersionedDocument)initWithData:(id)a3;
- (PKVersionedDocument)initWithUnzippedData:(id)a3;
- (id)serialize;
- (id)serializeCurrentVersion:(unsigned int *)a3;
- (unint64_t)futureVersionCount;
- (unint64_t)mergeWithVersionedDocument:(id)a3;
- (unsigned)maxDocumentVersion;
- (void)dealloc;
- (void)documentArchive;
- (void)loadArchive:(const void *)a3;
- (void)saveCurrentVersion:(void *)a3;
- (void)saveToArchive:(void *)a3;
- (void)setDocumentArchive:(void *)a3;
@end

@implementation PKVersionedDocument

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

+ (unsigned)versionedDocumentSerializationVersion
{
  return 0;
}

- (PKVersionedDocument)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKVersionedDocument;
  if ([(PKVersionedDocument *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (PKVersionedDocument)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKVersionedDocument;
  v5 = [(PKVersionedDocument *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PKVersionedDocument *)v5 loadData:v4];
  }

  return v6;
}

- (PKVersionedDocument)initWithUnzippedData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKVersionedDocument;
  v5 = [(PKVersionedDocument *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PKVersionedDocument *)v5 loadUnzippedData:v4];
  }

  return v6;
}

- (PKVersionedDocument)initWithArchive:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKVersionedDocument;
  id v4 = [(PKVersionedDocument *)&v7 init];
  v5 = v4;
  if (v4) {
    [(PKVersionedDocument *)v4 loadArchive:a3];
  }
  return v5;
}

- (BOOL)loadData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __32__PKVersionedDocument_loadData___block_invoke;
  activity_block[3] = &unk_1E64CA8B0;
  v10 = self;
  v11 = &v12;
  id v9 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1C44F8000, "Unzipping versioned document", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  char v6 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v6;
}

void __32__PKVersionedDocument_loadData___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "PK_gzipInflate");
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) loadUnzippedData:v2];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      objc_super v3 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v4 = 0;
        _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "PKVersionedDocument gzipped protobuf corrupt.", v4, 2u);
      }
    }
  }
}

- (BOOL)loadUnzippedData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __40__PKVersionedDocument_loadUnzippedData___block_invoke;
  activity_block[3] = &unk_1E64C9198;
  void activity_block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v5 = v4;
  _os_activity_initiate(&dword_1C44F8000, "Loading versioned document", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  char v6 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __40__PKVersionedDocument_loadUnzippedData___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8)) {
    operator new();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = (const unsigned __int8 *)[ (id) result bytes];
    [*(id *)(a1 + 40) length];
    uint64_t result = PB::Reader::Reader((PB::Reader *)v6, v3);
    if (*(void *)(a1 + 40))
    {
      uint64_t result = (*(uint64_t (**)(void, unsigned char *))(**(void **)(*(void *)(a1 + 32) + 8) + 16))(*(void *)(*(void *)(a1 + 32) + 8), v6);
      if (result)
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
        if (*(unsigned char *)(v4 + 36))
        {
          int v5 = *(_DWORD *)(v4 + 32);
          uint64_t result = +[PKVersionedDocument versionedDocumentSerializationVersion];
          if (v5 == result)
          {
            uint64_t result = [*(id *)(a1 + 32) loadDocumentArchive:*(void *)(*(void *)(a1 + 32) + 8)];
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
          }
        }
      }
    }
  }
  return result;
}

- (void)loadArchive:(const void *)a3
{
}

- (BOOL)loadDocumentArchive:(void *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(id)objc_opt_class() serializationVersion];
  uint64_t v7 = *((void *)a3 + 1);
  unint64_t v8 = *((void *)a3 + 2) - v7;
  unint64_t v9 = v8 >> 3;
  if (!(v8 >> 3)) {
    goto LABEL_26;
  }
  unsigned int v10 = v5;
  uint64_t v11 = 0;
  uint64_t v12 = (v8 >> 3);
  int v13 = -1;
  do
  {
    uint64_t v14 = *(void *)(v7 + 8 * v11);
    if (*(_DWORD *)(v14 + 20) < v5)
    {
      if (v13 < 0) {
        int v13 = v11;
      }
      if (v13 < 0) {
        goto LABEL_26;
      }
LABEL_8:
      int v15 = v9 - v13;
      if (v9 <= v13) {
        return 1;
      }
      uint64_t v16 = 8 * v13;
      *(void *)&long long v6 = 67109632;
      long long v29 = v6;
      while (1)
      {
        uint64_t v17 = *(void *)(*((void *)a3 + 1) + v16);
        v18 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", **(void **)(v17 + 8), *(void *)(*(void *)(v17 + 8) + 8), 0, v29);
        unsigned int v19 = *(_DWORD *)(v17 + 20);
        if (v19 >= v10)
        {
          if (v19 == v10)
          {
            v20 = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              unsigned int v32 = v10;
              v22 = v20;
              v23 = "Loading current version %d";
              uint32_t v24 = 8;
              goto LABEL_20;
            }
          }
          else
          {
            unsigned int v30 = *(_DWORD *)(v17 + 16);
            v25 = os_log_create("com.apple.pencilkit", "");
            v20 = v25;
            if (v30 > v10)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_ERROR, "Should not attempt to load invalid version.", buf, 2u);
              }

              goto LABEL_28;
            }
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              int v27 = *(_DWORD *)(v17 + 16);
              unsigned int v26 = *(_DWORD *)(v17 + 20);
              *(_DWORD *)buf = v29;
              unsigned int v32 = v26;
              __int16 v33 = 1024;
              unsigned int v34 = v10;
              __int16 v35 = 1024;
              int v36 = v27;
              v22 = v20;
              v23 = "Loading future version %d > %d where min-supported %d";
              uint32_t v24 = 20;
              goto LABEL_20;
            }
          }
        }
        else
        {
          v20 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v21 = *(_DWORD *)(v17 + 20);
            *(_DWORD *)buf = 67109376;
            unsigned int v32 = v21;
            __int16 v33 = 1024;
            unsigned int v34 = v10;
            v22 = v20;
            v23 = "Loading old version %d < %d";
            uint32_t v24 = 14;
LABEL_20:
            _os_log_debug_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_DEBUG, v23, buf, v24);
          }
        }

        [(PKVersionedDocument *)self mergeVersion:*(unsigned int *)(v17 + 20) fromData:v18];
        v16 += 8;
        if (!--v15) {
          return 1;
        }
      }
    }
    if (*(_DWORD *)(v14 + 16) <= v5) {
      int v13 = v11;
    }
    ++v11;
  }
  while (v12 != v11);
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_8;
  }
LABEL_26:
  v18 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_ERROR, "PKVersionedDocument did not load any compatible version.", buf, 2u);
  }
LABEL_28:

  return 1;
}

- (void)dealloc
{
  documentArchive = self->_documentArchive;
  if (documentArchive) {
    (*(void (**)(void *, SEL))(*(void *)documentArchive + 8))(documentArchive, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKVersionedDocument;
  [(PKVersionedDocument *)&v4 dealloc];
}

- (unint64_t)futureVersionCount
{
  return (uint64_t)(*((void *)self->_documentArchive + 2) - *((void *)self->_documentArchive + 1)) >> 3;
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  return 0;
}

- (void)saveCurrentVersion:(void *)a3
{
  int v5 = [(id)objc_opt_class() minimumSupportedVersion];
  int v11 = 0;
  long long v6 = [(PKVersionedDocument *)self serializeCurrentVersion:&v11];
  int v7 = v11;
  *((unsigned char *)a3 + 24) |= 3u;
  *((_DWORD *)a3 + 4) = v5;
  *((_DWORD *)a3 + 5) = v7;
  id v8 = v6;
  unint64_t v9 = (const unsigned __int8 *)[v8 bytes];
  unsigned int v10 = (PB::Data *)*((void *)a3 + 1);
  if (!v10) {
    operator new();
  }
  PB::Data::assign(v10, v9, &v9[[v8 length]]);
}

- (unint64_t)mergeWithVersionedDocument:(id)a3
{
  return 1;
}

- (unsigned)maxDocumentVersion
{
  objc_super v3 = [(PKVersionedDocument *)self documentArchive];
  if (v3[2] != v3[1]) {
    return *(_DWORD *)(**(void **)([(PKVersionedDocument *)self documentArchive] + 8) + 20);
  }
  int v5 = objc_opt_class();

  return [v5 serializationVersion];
}

- (id)serialize
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(id)objc_opt_class() serializationVersion];
    int v7 = [(PKVersionedDocument *)self documentArchive];
    uint64_t v8 = (uint64_t)(v7[2] - v7[1]) >> 3;
    v10[0] = 67109376;
    v10[1] = v6;
    v11[0] = 2048;
    *(void *)&v11[1] = v8;
    _os_log_debug_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEBUG, "Saving versioned document %d with %ld future versions.", (uint8_t *)v10, 0x12u);
  }

  objc_super v4 = [(PKVersionedDocument *)self documentArchive];
  unsigned int v5 = +[PKVersionedDocument versionedDocumentSerializationVersion];
  v4[36] |= 1u;
  *((_DWORD *)v4 + 8) = v5;
  [(PKVersionedDocument *)self documentArchive];
  PB::PtrVector<versioned_document::Version>::emplace_back<>();
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [(id)objc_opt_class() serializationVersion];
    unint64_t v9 = [(PKVersionedDocument *)self documentArchive];
    uint64_t v10 = (uint64_t)(v9[2] - v9[1]) >> 3;
    v11[0] = 67109376;
    v11[1] = v8;
    __int16 v12 = 2048;
    uint64_t v13 = v10;
    _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "Saving versioned document %d with %ld future versions.", (uint8_t *)v11, 0x12u);
  }

  versioned_document::Document::operator=((uint64_t)a3, (const versioned_document::Document *)self->_documentArchive);
  unsigned int v6 = +[PKVersionedDocument versionedDocumentSerializationVersion];
  *((unsigned char *)a3 + 36) |= 1u;
  *((_DWORD *)a3 + 8) = v6;
  int v7 = [(PKVersionedDocument *)self documentArchive];
  if (v7[1] != v7[2]) {
    operator new();
  }
  PB::PtrVector<versioned_document::Version>::emplace_back<>();
}

- (void)documentArchive
{
  return self->_documentArchive;
}

- (void)setDocumentArchive:(void *)a3
{
  self->_documentArchive = a3;
}

@end