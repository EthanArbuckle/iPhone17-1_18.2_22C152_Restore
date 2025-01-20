@interface ENFileSessionDaemon
- (BOOL)_resetAndAdvanceArchive:(id)a3 toPathWithExtension:(id)a4 error:(id *)a5;
- (BOOL)activateWithArchiveFD:(int)a3 error:(id *)a4;
- (BOOL)activateWithFileFD:(int)a3 signatureData:(id)a4 error:(id *)a5;
- (ENFile)file;
- (ENFileSessionDaemon)init;
- (id)_readTEKBatchAndReturnError:(id *)a3;
- (id)readSignaturesAndReturnError:(id *)a3;
- (id)readTEKBatchAndReturnError:(id *)a3;
- (unint64_t)batchSize;
- (unint64_t)invalidKeyCount;
- (unsigned)flags;
- (void)_createTransaction;
- (void)dealloc;
- (void)invalidate;
- (void)prepareNextTEKBatchIfNecessary;
- (void)setBatchSize:(unint64_t)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation ENFileSessionDaemon

- (void)dealloc
{
  [(ENFileSessionDaemon *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ENFileSessionDaemon;
  [(ENFileSessionDaemon *)&v3 dealloc];
}

- (ENFileSessionDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)ENFileSessionDaemon;
  v2 = [(ENFileSessionDaemon *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(ENFileSessionDaemon *)v2 setBatchSize:0];
  }
  return v3;
}

- (void)setBatchSize:(unint64_t)a3
{
  unint64_t v3 = 256;
  if (a3) {
    unint64_t v3 = a3;
  }
  self->_batchSize = v3;
}

- (BOOL)activateWithArchiveFD:(int)a3 error:(id *)a4
{
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F25720]) initWithFD:*(void *)&a3 error:a4];
  if (!v6)
  {
    LOBYTE(v15) = 0;
    goto LABEL_14;
  }
  id v18 = 0;
  BOOL v7 = [(ENFileSessionDaemon *)self _resetAndAdvanceArchive:v6 toPathWithExtension:@"sig" error:&v18];
  id v8 = v18;
  if (v7)
  {
    v9 = [MEMORY[0x1E4F257F8] signatureFileWithArchive:v6 error:a4];
    if (!v9) {
      goto LABEL_15;
    }
    v10 = v9;
    v11 = [v9 signatures];
    v12 = (NSArray *)[v11 copy];
    signatures = self->_signatures;
    self->_signatures = v12;
  }
  else if (gLogCategory__ENFileSessionDaemon <= 50 {
         && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
  }
  {
    id v17 = v8;
    LogPrintF_safe();
  }
  if ([(ENFileSessionDaemon *)self _resetAndAdvanceArchive:v6, @"bin", a4, v17 toPathWithExtension error])
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F25788]);
    int v15 = [v14 openWithArchive:v6 error:a4];
    if (v15)
    {
      objc_storeStrong((id *)&self->_archive, v6);
      objc_storeStrong((id *)&self->_file, v14);
      [(ENFileSessionDaemon *)self _createTransaction];
    }

    goto LABEL_13;
  }
LABEL_15:
  LOBYTE(v15) = 0;
LABEL_13:

LABEL_14:
  return v15;
}

- (BOOL)activateWithFileFD:(int)a3 signatureData:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E4F257F8];
    id v11 = v8;
    v12 = objc_msgSend(v10, "signatureFileWithBytes:length:error:", objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), a5);
    if (!v12)
    {
      LOBYTE(v18) = 0;
      goto LABEL_7;
    }
    v13 = v12;
    id v14 = [v12 signatures];
    int v15 = (NSArray *)[v14 copy];
    signatures = self->_signatures;
    self->_signatures = v15;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F25788]);
  int v18 = [v17 openWithFD:v6 reading:1 error:a5];
  if (v18)
  {
    objc_storeStrong((id *)&self->_file, v17);
    [(ENFileSessionDaemon *)self _createTransaction];
  }

LABEL_7:
  return v18;
}

- (void)_createTransaction
{
  unint64_t v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  MEMORY[0x1F41817F8](v3, transaction);
}

- (void)invalidate
{
  unint64_t v3 = self->_file;
  v4 = v3;
  if (v3)
  {
    id v11 = 0;
    char v5 = [(ENFile *)v3 closeAndReturnError:&v11];
    id v6 = v11;
    if ((v5 & 1) == 0
      && gLogCategory__ENFileSessionDaemon <= 90
      && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
    {
      v10 = CUPrintNSError();
      LogPrintF_safe();
    }
    file = self->_file;
    self->_file = 0;
  }
  [(ENArchive *)self->_archive close];
  archive = self->_archive;
  self->_archive = 0;

  transaction = self->_transaction;
  self->_transaction = 0;
}

- (BOOL)_resetAndAdvanceArchive:(id)a3 toPathWithExtension:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 resetAndReturnError:a5])
  {
    while (1)
    {
      int v9 = [v7 advanceEntryAndReturnError:a5];
      if (!v9) {
        break;
      }
      if ([v7 entryFileType] == 0x8000)
      {
        v10 = [v7 entryPath];
        id v11 = [v10 pathExtension];
        char v12 = [v11 isEqualToString:v8];

        if (v12) {
          break;
        }
      }
      if ([v7 endOfArchive])
      {
        if (!a5) {
          goto LABEL_8;
        }
        ENErrorF();
        LOBYTE(v9) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        break;
      }
    }
  }
  else
  {
LABEL_8:
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)readSignaturesAndReturnError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = self->_signatures;
  if (v4)
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v11, "encodeWithXPCObject:", v12, (void)v14);
          xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, v12);
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else if (a3)
  {
    ENErrorF();
    xpc_object_t v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    xpc_object_t v5 = 0;
  }

  return v5;
}

- (id)readTEKBatchAndReturnError:(id *)a3
{
  xpc_object_t v5 = self->_nextTEKBatch;
  if (v5)
  {
    id v6 = v5;
    nextTEKBatch = self->_nextTEKBatch;
    self->_nextTEKBatch = 0;
  }
  else
  {
    id v6 = [(ENFileSessionDaemon *)self _readTEKBatchAndReturnError:a3];
  }

  return v6;
}

- (id)_readTEKBatchAndReturnError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = self->_file;
  if (v5)
  {
    id v6 = [(ENFile *)self->_file sha256Data];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
    id v33 = v7;
    if (self->_batchSize)
    {
      v31 = a3;
      v32 = v5;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      while (1)
      {
        id v38 = 0;
        v10 = -[ENFile readTEKAndReturnError:](v5, "readTEKAndReturnError:", &v38, v29, v30);
        id v11 = v38;
        id v12 = v11;
        if (!v10) {
          break;
        }
        if ([v10 isValid])
        {
          [v7 addObject:v10];
        }
        else
        {
          v13 = [v10 keyData];
          long long v14 = v13;
          if (v13)
          {
            id v15 = v13;
          }
          else
          {
            id v15 = [MEMORY[0x1E4F1C9B0] data];
          }
          long long v16 = v15;

          if (v6)
          {
            id v17 = v6;
          }
          else
          {
            id v17 = [MEMORY[0x1E4F1C9B0] data];
          }
          int v18 = v17;
          if (gLogCategory__ENFileSessionDaemon <= 90
            && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSDataHex();
            v20 = uint64_t v19 = v6;
            CUPrintNSDataHex();
            v30 = v29 = v20;
            LogPrintF_safe();

            id v6 = v19;
            xpc_object_t v5 = v32;
            id v7 = v33;
          }
          ++v9;
        }
        if (++v8 >= self->_batchSize) {
          goto LABEL_22;
        }
      }
      if (v11)
      {
        xpc_object_t v21 = 0;
        if (v31) {
          id *v31 = v11;
        }
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
LABEL_22:
    self->_invalidKeyCount += v9;
    if (self->_flags) {
      [v7 enRandomlyShuffle];
    }
    xpc_object_t v21 = xpc_array_create(0, 0);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v12 = v7;
    uint64_t v22 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v12);
          }
          v26 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
          [v26 encodeWithXPCObject:v27];
          xpc_array_set_value(v21, 0xFFFFFFFFFFFFFFFFLL, v27);
        }
        uint64_t v23 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v23);
      id v7 = v33;
    }
LABEL_32:

    goto LABEL_33;
  }
  if (a3)
  {
    ENErrorF();
    xpc_object_t v21 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    xpc_object_t v21 = 0;
  }
LABEL_33:

  return v21;
}

- (void)prepareNextTEKBatchIfNecessary
{
  if (self->_file && !self->_nextTEKBatch)
  {
    id v7 = 0;
    unint64_t v3 = [(ENFileSessionDaemon *)self _readTEKBatchAndReturnError:&v7];
    id v4 = v7;
    nextTEKBatch = self->_nextTEKBatch;
    self->_nextTEKBatch = v3;

    if (!self->_nextTEKBatch
      && gLogCategory__ENFileSessionDaemon <= 90
      && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (ENFile)file
{
  return self->_file;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unint64_t)invalidKeyCount
{
  return self->_invalidKeyCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_nextTEKBatch, 0);

  objc_storeStrong((id *)&self->_archive, 0);
}

@end