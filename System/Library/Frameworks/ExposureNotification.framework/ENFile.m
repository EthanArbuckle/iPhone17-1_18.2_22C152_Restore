@interface ENFile
- (BOOL)_readHashFromArchive:(id)a3 error:(id *)a4;
- (BOOL)_readHashFromFile:(__sFILE *)a3 error:(id *)a4;
- (BOOL)_readHeaderFromFile:(__sFILE *)a3 error:(id *)a4;
- (BOOL)_readMetadataFromArchive:(id)a3 error:(id *)a4;
- (BOOL)_readMetadataFromCoder:(id)a3 error:(id *)a4;
- (BOOL)_readMetadataFromFileHandle:(__sFILE *)a3 error:(id *)a4;
- (BOOL)_readPrepareAndReturnError:(id *)a3;
- (BOOL)_resetAndReadHeaderFromArchive:(id)a3 error:(id *)a4;
- (BOOL)_writeMetadataAndReturnError:(id *)a3;
- (BOOL)_writePrepareAndReturnError:(id *)a3;
- (BOOL)closeAndReturnError:(id *)a3;
- (BOOL)openForWritingToData:(id)a3 error:(id *)a4;
- (BOOL)openWithArchive:(id)a3 error:(id *)a4;
- (BOOL)openWithFD:(int)a3 reading:(BOOL)a4 error:(id *)a5;
- (BOOL)openWithFileSystemRepresentation:(const char *)a3 reading:(BOOL)a4 error:(id *)a5;
- (BOOL)writeTEK:(id)a3 error:(id *)a4;
- (BOOL)writeTEK:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (NSData)sha256Data;
- (NSDictionary)metadata;
- (id)_readKeyWithPtr:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)readTEKAndReturnError:(id *)a3;
- (id)readTEKWithFlags:(unsigned int)a3 error:(id *)a4;
- (void)dealloc;
- (void)setMetadata:(id)a3;
@end

@implementation ENFile

- (void)dealloc
{
  [(ENArchive *)self->_archive close];
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    if (fclose(fileHandle) && *__error()) {
      __error();
    }
    self->_fileHandle = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ENFile;
  [(ENFile *)&v4 dealloc];
}

- (BOOL)openWithArchive:(id)a3 error:(id *)a4
{
  v6 = (ENArchive *)a3;
  if (gLogCategory_ENFile <= 10 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  archive = self->_archive;
  self->_archive = v6;

  self->_reading = 1;

  return [(ENFile *)self _readPrepareAndReturnError:a4];
}

- (BOOL)openWithFD:(int)a3 reading:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (v6) {
    v9 = "rb";
  }
  else {
    v9 = "wb";
  }
  v10 = fdopen(a3, v9);
  if (v10 || *__error() && !*__error())
  {
    self->_fileHandle = v10;
    self->_reading = v6;
    if (v6)
    {
      if (![(ENFile *)self _readPrepareAndReturnError:a5]) {
        goto LABEL_18;
      }
      goto LABEL_15;
    }
    BOOL v11 = [(ENFile *)self _writePrepareAndReturnError:a5];
    if (v11) {
LABEL_15:
    }
      LOBYTE(v11) = 1;
  }
  else
  {
    if (!a5)
    {
LABEL_18:
      LOBYTE(v11) = 0;
      return v11;
    }
    ENErrorF(2);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    *a5 = v12;
  }
  return v11;
}

- (BOOL)openWithFileSystemRepresentation:(const char *)a3 reading:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
  {
    v9 = "no";
    if (v6) {
      v9 = "yes";
    }
    v13 = v9;
    LogPrintF_safe();
  }
  if (v6) {
    uint64_t v10 = open(a3, 0, 384, v13);
  }
  else {
    uint64_t v10 = open(a3, 1537, 384, v13);
  }
  uint64_t v11 = v10;
  if ((v10 & 0x80000000) != 0 && (!*__error() || *__error()))
  {
    if (a5)
    {
      ENErrorF(2);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    return [(ENFile *)self openWithFD:v11 reading:v6 error:a5];
  }
}

- (BOOL)openForWritingToData:(id)a3 error:(id *)a4
{
  BOOL v6 = (NSMutableData *)a3;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  outputData = self->_outputData;
  self->_outputData = v6;

  self->_reading = 0;

  return [(ENFile *)self _writePrepareAndReturnError:a4];
}

- (BOOL)closeAndReturnError:(id *)a3
{
  archive = self->_archive;
  if (archive)
  {
    [(ENArchive *)archive close];
    outputData = self->_archive;
    self->_archive = 0;
LABEL_5:

    return 1;
  }
  outputData = self->_outputData;
  if (outputData)
  {
    self->_outputData = 0;
    goto LABEL_5;
  }
  fileHandle = self->_fileHandle;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (fileHandle)
  {
    int v9 = fclose(fileHandle);
    self->_fileHandle = 0;
    if (!v9) {
      return 1;
    }
    if (a3)
    {
      __error();
      uint64_t v10 = 1;
LABEL_17:
      ENErrorF(v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v11;
      return result;
    }
  }
  else if (a3)
  {
    uint64_t v10 = 10;
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)_readPrepareAndReturnError:(id *)a3
{
  v5 = self->_archive;
  fileHandle = self->_fileHandle;
  if (!((unint64_t)v5 | (unint64_t)fileHandle))
  {
    if (!a3) {
      goto LABEL_16;
    }
    uint64_t v14 = 10;
    goto LABEL_13;
  }
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mutableMetadata = self->_mutableMetadata;
  self->_mutableMetadata = v7;

  objc_storeStrong((id *)&self->_metadata, self->_mutableMetadata);
  if (!v5)
  {
    if (fileHandle)
    {
      if ([(ENFile *)self _readHeaderFromFile:fileHandle error:a3]
        && [(ENFile *)self _readHashFromFile:fileHandle error:a3])
      {
        id v12 = objc_alloc_init(ENProtobufCoder);
        protobufCoder = self->_protobufCoder;
        self->_protobufCoder = v12;

        [(ENProtobufCoder *)self->_protobufCoder setFileHandle:fileHandle];
        BOOL v11 = [(ENFile *)self _readMetadataFromFileHandle:fileHandle error:a3];
        goto LABEL_17;
      }
LABEL_16:
      BOOL v11 = 0;
      goto LABEL_17;
    }
    if (!a3) {
      goto LABEL_16;
    }
    uint64_t v14 = 16;
LABEL_13:
    ENErrorF(v14);
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (![(ENFile *)self _readHashFromArchive:v5 error:a3]
    || ![(ENFile *)self _readMetadataFromArchive:v5 error:a3]
    || ![(ENFile *)self _resetAndReadHeaderFromArchive:v5 error:a3])
  {
    goto LABEL_16;
  }
  int v9 = objc_alloc_init(ENProtobufCoder);
  uint64_t v10 = self->_protobufCoder;
  self->_protobufCoder = v9;

  [(ENProtobufCoder *)self->_protobufCoder setReadArchive:v5];
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (BOOL)_resetAndReadHeaderFromArchive:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    if ([v5 resetToCurrentEntryAndReturnError:a4])
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      id v14 = 0;
      char v7 = [v6 readDataIntoBuffer:&v15 length:16 error:&v14];
      id v8 = v14;
      int v9 = v8;
      if (v7)
      {
        if (gLogCategory_ENFile <= 10 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize())) {
          LogPrintF_safe();
        }
        if (v15 == 0x726F707845204B45 && v16 == 0x2020202031762074)
        {
          BOOL v11 = 1;
          goto LABEL_23;
        }
        if (a4)
        {
          uint64_t v10 = ENErrorF(15);
          goto LABEL_9;
        }
      }
      else if (a4)
      {
        uint64_t v10 = ENNestedErrorF(v8, 15);
LABEL_9:
        BOOL v11 = 0;
        *a4 = v10;
LABEL_23:

        goto LABEL_24;
      }
      BOOL v11 = 0;
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  if (!a4)
  {
LABEL_19:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  ENErrorF(10);
  BOOL v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v11;
}

- (BOOL)_readHeaderFromFile:(__sFILE *)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t __ptr = 0;
  uint64_t v10 = 0;
  if (fread(&__ptr, 1uLL, 0x10uLL, a3) != 16)
  {
    if (feof(a3))
    {
      if (!a4) {
        return 0;
      }
    }
    else
    {
      __error();
      if (!a4) {
        return 0;
      }
    }
LABEL_9:
    ENErrorF(15);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a4 = v6;
    return result;
  }
  if (gLogCategory_ENFile <= 10 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (__ptr == 0x726F707845204B45 && v10 == 0x2020202031762074) {
    return 1;
  }
  if (a4) {
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)_readHashFromArchive:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 resetToCurrentEntryAndReturnError:a4])
  {
    uint64_t v7 = ccsha256_di();
    MEMORY[0x270FA5388]();
    int v9 = (char *)v17 - v8;
    bzero((char *)v17 - v8, v10);
    ccdigest_init();
    memset(v18, 0, sizeof(v18));
    uint64_t v11 = [v6 readDataIntoBuffer:v18 maxLength:128 error:a4];
    if (v11 < 0)
    {
LABEL_6:
      BOOL v13 = 0;
    }
    else
    {
      uint64_t v12 = v11;
      while (v12)
      {
        ccdigest_update();
        uint64_t v12 = [v6 readDataIntoBuffer:v18 maxLength:128 error:a4];
        if (v12 < 0) {
          goto LABEL_6;
        }
      }
      memset(v17, 0, sizeof(v17));
      (*(void (**)(uint64_t, char *, _OWORD *))(v7 + 56))(v7, v9, v17);
      id v14 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v17 length:32];
      sha256Data = self->_sha256Data;
      self->_sha256Data = v14;

      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_readHashFromFile:(__sFILE *)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if (a4)
    {
      ENErrorF(10);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    return 0;
  }
  int v6 = fileno(a3);
  memset(&v16, 0, sizeof(v16));
  if (fstat(v6, &v16) && (!*__error() || *__error()))
  {
    if (!a4) {
      return 0;
    }
LABEL_13:
    NSErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    id v14 = v13;
    BOOL result = 0;
    *a4 = v14;
    return result;
  }
  off_t st_size = v16.st_size;
  if (v16.st_size == -1)
  {
    if (!a4) {
      return 0;
    }
    goto LABEL_13;
  }
  uint64_t v8 = mmap(0, v16.st_size, 1, 2, v6, 0);
  if (v8 != (void *)-1 || *__error() && !*__error())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __34__ENFile__readHashFromFile_error___block_invoke;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = v8;
    v15[5] = st_size;
    int v9 = (void (**)(void))MEMORY[0x2166BC8A0](v15);
    memset(v17, 0, sizeof(v17));
    ccsha256_di();
    ccdigest();
    size_t v10 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v17 length:32];
    sha256Data = self->_sha256Data;
    self->_sha256Data = v10;

    v9[2](v9);
    return 1;
  }
  if (a4) {
    goto LABEL_13;
  }
  return 0;
}

uint64_t __34__ENFile__readHashFromFile_error___block_invoke(uint64_t a1)
{
  return munmap(*(void **)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)_readMetadataFromArchive:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ENFile *)self _resetAndReadHeaderFromArchive:v6 error:a4])
  {
    uint64_t v7 = objc_alloc_init(ENProtobufCoder);
    [(ENProtobufCoder *)v7 setReadArchive:v6];
    BOOL v8 = [(ENFile *)self _readMetadataFromCoder:v7 error:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_readMetadataFromFileHandle:(__sFILE *)a3 error:(id *)a4
{
  fpos_t v11 = 0;
  if (fgetpos(a3, &v11) && (!*__error() || *__error()))
  {
    if (a4)
    {
      NSErrorF();
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__ENFile__readMetadataFromFileHandle_error___block_invoke;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = a3;
    v10[5] = v11;
    uint64_t v7 = (void (**)(void))MEMORY[0x2166BC8A0](v10);
    BOOL v8 = [(ENFile *)self _readMetadataFromCoder:self->_protobufCoder error:a4];
    v7[2](v7);
  }
  return v8;
}

uint64_t __44__ENFile__readMetadataFromFileHandle_error___block_invoke(uint64_t a1)
{
  return fsetpos(*(FILE **)(a1 + 32), (const fpos_t *)(a1 + 40));
}

- (BOOL)_readMetadataFromCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __39__ENFile__readMetadataFromCoder_error___block_invoke;
  v43[3] = &unk_264244C68;
  v43[4] = &v44;
  v43[5] = a4;
  uint64_t v7 = (void (**)(void))MEMORY[0x2166BC8A0](v43);
  if (v6)
  {
    while ((~self->_metadataFlags & 0x7E) != 0)
    {
      BOOL v8 = (void *)MEMORY[0x2166BC6F0]();
      unsigned __int8 v42 = 0;
      int v9 = (id *)(v45 + 5);
      id obj = (id)v45[5];
      uint64_t v41 = 0;
      char v10 = [v6 readType:&v42 tag:&v41 eofOkay:1 error:&obj];
      objc_storeStrong(v9, obj);
      if (v10)
      {
        switch(v41)
        {
          case 1:
            fpos_t v11 = (id *)(v45 + 5);
            id v38 = (id)v45[5];
            uint64_t v39 = 0;
            char v12 = [v6 readFixedUInt64:&v39 error:&v38];
            objc_storeStrong(v11, v38);
            if ((v12 & 1) == 0) {
              goto LABEL_23;
            }
            id v13 = [NSNumber numberWithUnsignedLongLong:v39];
            [(NSMutableDictionary *)self->_mutableMetadata setObject:v13 forKeyedSubscript:@"startTS"];

            unsigned int v14 = self->_metadataFlags | 2;
            goto LABEL_18;
          case 2:
            uint64_t v39 = 0;
            v24 = (id *)(v45 + 5);
            id v37 = (id)v45[5];
            char v25 = [v6 readFixedUInt64:&v39 error:&v37];
            objc_storeStrong(v24, v37);
            if ((v25 & 1) == 0) {
              goto LABEL_23;
            }
            v26 = [NSNumber numberWithUnsignedLongLong:v39];
            [(NSMutableDictionary *)self->_mutableMetadata setObject:v26 forKeyedSubscript:@"endTS"];

            unsigned int v14 = self->_metadataFlags | 4;
            goto LABEL_18;
          case 3:
            uint64_t v19 = (id *)(v45 + 5);
            id v36 = (id)v45[5];
            v20 = [v6 readNSStringAndReturnError:&v36];
            objc_storeStrong(v19, v36);
            if (!v20) {
              goto LABEL_23;
            }
            [(NSMutableDictionary *)self->_mutableMetadata setObject:v20 forKeyedSubscript:@"region"];
            self->_metadataFlags |= 8u;

            goto LABEL_20;
          case 4:
            LODWORD(v39) = 0;
            v21 = (id *)(v45 + 5);
            id v35 = (id)v45[5];
            char v22 = [v6 readVarIntUInt32:&v39 error:&v35];
            objc_storeStrong(v21, v35);
            if ((v22 & 1) == 0) {
              goto LABEL_23;
            }
            v23 = [NSNumber numberWithUnsignedInt:v39];
            [(NSMutableDictionary *)self->_mutableMetadata setObject:v23 forKeyedSubscript:@"batchNum"];

            unsigned int v14 = self->_metadataFlags | 0x10;
            goto LABEL_18;
          case 5:
            LODWORD(v39) = 0;
            stat v16 = (id *)(v45 + 5);
            id v34 = (id)v45[5];
            char v17 = [v6 readVarIntUInt32:&v39 error:&v34];
            objc_storeStrong(v16, v34);
            if ((v17 & 1) == 0) {
              goto LABEL_23;
            }
            uint64_t v18 = [NSNumber numberWithUnsignedInt:v39];
            [(NSMutableDictionary *)self->_mutableMetadata setObject:v18 forKeyedSubscript:@"batchSize"];

            unsigned int v14 = self->_metadataFlags | 0x20;
LABEL_18:
            self->_metadataFlags = v14;
LABEL_20:
            int v15 = 0;
            break;
          default:
            v27 = (id *)(v45 + 5);
            id v33 = (id)v45[5];
            int v28 = [v6 skipType:v42 error:&v33];
            objc_storeStrong(v27, v33);
            if (v28) {
              goto LABEL_20;
            }
LABEL_23:
            int v15 = 1;
            break;
        }
      }
      else if (v45[5])
      {
        int v15 = 1;
      }
      else
      {
        int v15 = 5;
      }
      if (v15)
      {
        if (v15 != 5) {
          goto LABEL_27;
        }
        break;
      }
    }
    BOOL v29 = 1;
  }
  else
  {
    uint64_t v30 = ENErrorF(10);
    v31 = (void *)v45[5];
    v45[5] = v30;

LABEL_27:
    BOOL v29 = 0;
  }
  v7[2](v7);

  _Block_object_dispose(&v44, 8);
  return v29;
}

id __39__ENFile__readMetadataFromCoder_error___block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result)
  {
    if (*(void *)(a1 + 40))
    {
      id result = result;
      **(void **)(a1 + 40) = result;
    }
  }
  return result;
}

- (BOOL)_writePrepareAndReturnError:(id *)a3
{
  fileHandle = self->_fileHandle;
  unint64_t v6 = self->_outputData;
  uint64_t v7 = (void *)v6;
  if (!((unint64_t)fileHandle | v6))
  {
    if (a3)
    {
      uint64_t v14 = 10;
      goto LABEL_13;
    }
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if (!fileHandle)
  {
    if (v6)
    {
      [(id)v6 appendBytes:"EK Export v1    " length:16];
      char v10 = objc_alloc_init(ENProtobufCoder);
      protobufCoder = self->_protobufCoder;
      self->_protobufCoder = v10;

      [(ENProtobufCoder *)self->_protobufCoder setWriteMutableData:v7];
    }
    goto LABEL_9;
  }
  if (fwrite("EK Export v1    ", 1uLL, 0x10uLL, fileHandle) != 16 && (!*__error() || *__error()))
  {
    if (a3)
    {
      uint64_t v14 = 1;
LABEL_13:
      ENErrorF(v14);
      BOOL v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  BOOL v8 = objc_alloc_init(ENProtobufCoder);
  int v9 = self->_protobufCoder;
  self->_protobufCoder = v8;

  [(ENProtobufCoder *)self->_protobufCoder setFileHandle:fileHandle];
LABEL_9:
  BOOL v12 = [(ENFile *)self _writeMetadataAndReturnError:a3];
LABEL_10:

  return v12;
}

- (BOOL)_writeMetadataAndReturnError:(id *)a3
{
  if (!self->_protobufCoder)
  {
    if (a3)
    {
      ENErrorF(12);
      BOOL v6 = 0;
      id v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_13:
    BOOL v6 = 0;
    id v5 = 0;
    goto LABEL_9;
  }
  if (![(ENProtobufCoder *)self->_protobufCoder writeFixedUInt64:CFDictionaryGetInt64() tag:1 error:a3]|| ![(ENProtobufCoder *)self->_protobufCoder writeFixedUInt64:CFDictionaryGetInt64() tag:2 error:a3])
  {
    goto LABEL_13;
  }
  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  BOOL v6 = (!v5 || [(ENProtobufCoder *)self->_protobufCoder writeNSString:v5 tag:3 error:a3])&& [(ENProtobufCoder *)self->_protobufCoder writeVarIntUInt32:CFDictionaryGetInt64Ranged() tag:4 error:a3]&& [(ENProtobufCoder *)self->_protobufCoder writeVarIntUInt32:CFDictionaryGetInt64Ranged() tag:5 error:a3];
LABEL_9:

  return v6;
}

- (id)readTEKAndReturnError:(id *)a3
{
  return [(ENFile *)self readTEKWithFlags:3 error:a3];
}

- (id)readTEKWithFlags:(unsigned int)a3 error:(id *)a4
{
  unsigned __int8 v5 = a3;
  uint64_t v7 = self->_protobufCoder;
  if (v7)
  {
    BOOL v8 = (void *)MEMORY[0x2166BC6F0]();
    unsigned __int8 v28 = 0;
    id v26 = 0;
    uint64_t v27 = 0;
    BOOL v9 = [(ENProtobufCoder *)v7 readType:&v28 tag:&v27 eofOkay:1 error:&v26];
    id v10 = v26;
    if (v9)
    {
      while (1)
      {
        BOOL v11 = (v5 & 2) != 0 && v27 == 8;
        BOOL v12 = !v11;
        if ((v5 & (v27 == 7)) != 0 || !v12) {
          break;
        }
        id v22 = v10;
        BOOL v13 = [(ENProtobufCoder *)v7 skipType:v28 error:&v22];
        id v14 = v22;

        if (!v13)
        {
          stat v16 = 0;
          goto LABEL_19;
        }
        BOOL v8 = (void *)MEMORY[0x2166BC6F0]();
        unsigned __int8 v28 = 0;
        id v26 = v14;
        uint64_t v27 = 0;
        BOOL v15 = [(ENProtobufCoder *)v7 readType:&v28 tag:&v27 eofOkay:1 error:&v26];
        id v10 = v26;

        if (!v15) {
          goto LABEL_13;
        }
      }
      uint64_t v25 = 0;
      char v17 = v7;
      id v24 = v10;
      uint64_t v18 = [(ENProtobufCoder *)v17 readLengthDelimited:&v25 error:&v24];
      id v14 = v24;

      if (v18)
      {
        id v23 = v14;
        stat v16 = [(ENFile *)self _readKeyWithPtr:v18 length:v25 error:&v23];
        id v19 = v23;

        id v14 = v19;
      }
      else
      {
        stat v16 = 0;
      }
      [v16 setRevised:v27 == 8];
    }
    else
    {
LABEL_13:
      stat v16 = 0;
      id v14 = v10;
    }
LABEL_19:
    if (a4)
    {
      if (v16) {
        v20 = 0;
      }
      else {
        v20 = v14;
      }
      *a4 = v20;
    }
  }
  else if (a4)
  {
    ENErrorF(10);
    stat v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    stat v16 = 0;
  }

  return v16;
}

- (id)_readKeyWithPtr:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  p_tekProtobufCoder = &self->_tekProtobufCoder;
  BOOL v9 = self->_tekProtobufCoder;
  if (!v9)
  {
    BOOL v9 = objc_alloc_init(ENProtobufCoder);
    objc_storeStrong((id *)p_tekProtobufCoder, v9);
  }
  [(ENProtobufCoder *)v9 setReadMemory:a3 length:a4];
  id v10 = objc_alloc_init(ENTemporaryExposureKey);
  unsigned __int8 v23 = 0;
  id v21 = 0;
  uint64_t v22 = 0;
  BOOL v11 = [(ENProtobufCoder *)v9 readType:&v23 tag:&v22 eofOkay:1 error:&v21];
  id v12 = v21;
  BOOL v13 = v12;
  if (v11 || v12)
  {
    while (v11)
    {
      switch(v22)
      {
        case 1:
          uint64_t v14 = [(ENProtobufCoder *)v9 readNSDataAndReturnError:a5];
          if (!v14) {
            goto LABEL_34;
          }
          BOOL v15 = (void *)v14;
          [(ENTemporaryExposureKey *)v10 setKeyData:v14];

          break;
        case 2:
          unsigned int v20 = 0;
          if (![(ENProtobufCoder *)v9 readVarIntUInt32:&v20 error:a5]) {
            goto LABEL_34;
          }
          [(ENTemporaryExposureKey *)v10 setTransmissionRiskLevel:v20];
          break;
        case 3:
          unsigned int v20 = 0;
          if (![(ENProtobufCoder *)v9 readVarIntUInt32:&v20 error:a5]) {
            goto LABEL_34;
          }
          [(ENTemporaryExposureKey *)v10 setRollingStartNumber:v20];
          break;
        case 4:
          unsigned int v20 = 0;
          if (![(ENProtobufCoder *)v9 readVarIntUInt32:&v20 error:a5]) {
            goto LABEL_34;
          }
          [(ENTemporaryExposureKey *)v10 setRollingPeriod:v20];
          break;
        case 5:
          unsigned int v20 = 0;
          if (![(ENProtobufCoder *)v9 readVarIntUInt32:&v20 error:a5]) {
            goto LABEL_34;
          }
          [(ENTemporaryExposureKey *)v10 setDiagnosisReportType:v20];
          break;
        case 6:
          unsigned int v20 = 0;
          if (![(ENProtobufCoder *)v9 readVarIntSInt32:&v20 error:a5]) {
            goto LABEL_34;
          }
          [(ENTemporaryExposureKey *)v10 setDaysSinceOnsetOfSymptoms:(int)v20];
          break;
        case 7:
          LOBYTE(v20) = 0;
          if (![(ENProtobufCoder *)v9 readVarIntBoolean:&v20 error:a5]) {
            goto LABEL_34;
          }
          [(ENTemporaryExposureKey *)v10 setVaccinated:v20];
          break;
        case 8:
          unsigned int v20 = 0;
          if (![(ENProtobufCoder *)v9 readVarIntUInt32:&v20 error:a5]) {
            goto LABEL_34;
          }
          [(ENTemporaryExposureKey *)v10 setVariantOfConcernType:v20];
          break;
        default:
          if (![(ENProtobufCoder *)v9 skipType:v23 error:a5]) {
            goto LABEL_34;
          }
          break;
      }

      unsigned __int8 v23 = 0;
      id v21 = 0;
      uint64_t v22 = 0;
      BOOL v11 = [(ENProtobufCoder *)v9 readType:&v23 tag:&v22 eofOkay:1 error:&v21];
      id v16 = v21;
      BOOL v13 = v16;
      if (!v11 && !v16) {
        goto LABEL_27;
      }
    }
    if (a5) {
      *a5 = v13;
    }
LABEL_34:

LABEL_35:
    uint64_t v18 = 0;
    goto LABEL_29;
  }
LABEL_27:
  char v17 = [(ENTemporaryExposureKey *)v10 keyData];

  if (v17)
  {
    uint64_t v18 = v10;
    goto LABEL_29;
  }
  if (!a5) {
    goto LABEL_35;
  }
  ENErrorF(1);
  uint64_t v18 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v18;
}

- (BOOL)writeTEK:(id)a3 error:(id *)a4
{
  return [(ENFile *)self writeTEK:a3 flags:1 error:a4];
}

- (BOOL)writeTEK:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  char v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  fileHandle = self->_fileHandle;
  unint64_t v10 = self->_outputData;
  if (!((unint64_t)fileHandle | v10))
  {
    if (a5)
    {
      uint64_t v23 = 10;
LABEL_31:
      ENErrorF(v23);
      BOOL v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  tekProtobufCoder = self->_tekProtobufCoder;
  if (!tekProtobufCoder)
  {
    id v12 = objc_alloc_init(ENProtobufCoder);
    BOOL v13 = self->_tekProtobufCoder;
    self->_tekProtobufCoder = v12;

    tekProtobufCoder = self->_tekProtobufCoder;
  }
  memset(v25, 0, sizeof(v25));
  [(ENProtobufCoder *)tekProtobufCoder setWriteMemory:v25 length:128];
  if ([v8 daysSinceOnsetOfSymptoms] != 0x7FFFFFFFFFFFFFFFLL
    && !-[ENProtobufCoder writeVarIntSInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntSInt32:tag:error:", [v8 daysSinceOnsetOfSymptoms], 6, a5))
  {
    goto LABEL_33;
  }
  uint64_t v14 = [v8 diagnosisReportType];
  if (v14)
  {
    if (![(ENProtobufCoder *)self->_tekProtobufCoder writeVarIntUInt32:v14 tag:5 error:a5])goto LABEL_33; {
  }
    }
  BOOL v15 = [v8 keyData];
  if (v15
    && ![(ENProtobufCoder *)self->_tekProtobufCoder writeNSData:v15 tag:1 error:a5])
  {

    goto LABEL_33;
  }

  if (!-[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntUInt32:tag:error:", [v8 rollingStartNumber], 3, a5))goto LABEL_33; {
  uint64_t v16 = [v8 rollingPeriod];
  }
  if (v16)
  {
    if (![(ENProtobufCoder *)self->_tekProtobufCoder writeVarIntUInt32:v16 tag:4 error:a5])goto LABEL_33; {
  }
    }
  if (!-[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntUInt32:tag:error:", [v8 transmissionRiskLevel], 2, a5))goto LABEL_33; {
  if (!-[ENProtobufCoder writeVarIntBoolean:tag:error:](self->_tekProtobufCoder, "writeVarIntBoolean:tag:error:", [v8 vaccinated], 7, a5))goto LABEL_33;
  }
  uint64_t v17 = [v8 variantOfConcernType];
  if (v17)
  {
    if (![(ENProtobufCoder *)self->_tekProtobufCoder writeVarIntUInt32:v17 tag:8 error:a5])goto LABEL_33; {
  }
    }
  uint64_t v18 = [(ENProtobufCoder *)self->_tekProtobufCoder writeBase];
  if (!v18)
  {
    if (a5) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  id v19 = v18;
  unsigned int v20 = [(ENProtobufCoder *)self->_tekProtobufCoder writeDst];
  if (!v20)
  {
    if (a5)
    {
LABEL_30:
      uint64_t v23 = 16;
      goto LABEL_31;
    }
LABEL_33:
    BOOL v22 = 0;
    goto LABEL_34;
  }
  if (v20 != v19)
  {
    uint64_t v21 = (v6 & 2) != 0 ? 8 : 7;
    if (![(ENProtobufCoder *)self->_protobufCoder writeLengthDelimitedPtr:v19 length:v20 - v19 tag:v21 error:a5])goto LABEL_33; {
  }
    }
  BOOL v22 = 1;
LABEL_34:

  return v22;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)sha256Data
{
  return self->_sha256Data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sha256Data, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tekProtobufCoder, 0);
  objc_storeStrong((id *)&self->_protobufCoder, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_mutableMetadata, 0);

  objc_storeStrong((id *)&self->_archive, 0);
}

@end