@interface ENSignatureFile
+ (id)_signatureFileWithProtobufCoder:(id)a3 error:(id *)a4;
+ (id)signatureFileWithArchive:(id)a3 error:(id *)a4;
+ (id)signatureFileWithBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)closeAndReturnError:(id *)a3;
- (BOOL)openForWritingToData:(id)a3 error:(id *)a4;
- (BOOL)openWithFileSystemRepresentation:(const char *)a3 reading:(BOOL)a4 error:(id *)a5;
- (BOOL)writeAndReturnError:(id *)a3;
- (NSArray)signatures;
- (void)setSignatures:(id)a3;
@end

@implementation ENSignatureFile

+ (id)signatureFileWithArchive:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(ENProtobufCoder);
  [(ENProtobufCoder *)v7 setReadArchive:v6];

  v8 = [a1 _signatureFileWithProtobufCoder:v7 error:a4];

  return v8;
}

+ (id)signatureFileWithBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  v9 = objc_alloc_init(ENProtobufCoder);
  [(ENProtobufCoder *)v9 setReadMemory:a3 length:a4];
  v10 = [a1 _signatureFileWithProtobufCoder:v9 error:a5];

  return v10;
}

+ (id)_signatureFileWithProtobufCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __57__ENSignatureFile__signatureFileWithProtobufCoder_error___block_invoke;
  v29[3] = &unk_264244C68;
  v29[4] = &v30;
  v29[5] = a4;
  id v6 = (void (**)(void))MEMORY[0x2166BC8A0](v29);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  do
  {
    v8 = (void *)MEMORY[0x2166BC6F0]();
    unsigned __int8 v28 = 0;
    v9 = (id *)(v31 + 5);
    id obj = (id)v31[5];
    uint64_t v27 = 0;
    char v10 = [v5 readType:&v28 tag:&v27 eofOkay:1 error:&obj];
    objc_storeStrong(v9, obj);
    if (v10)
    {
      if (v27 == 1)
      {
        uint64_t v25 = 0;
        id v11 = v5;
        v12 = (id *)(v31 + 5);
        id v24 = (id)v31[5];
        uint64_t v13 = [v11 readLengthDelimited:&v25 error:&v24];
        objc_storeStrong(v12, v24);
        if (v13)
        {
          v14 = [ENSignature alloc];
          v15 = (id *)(v31 + 5);
          id v23 = (id)v31[5];
          v16 = [(ENSignature *)v14 initWithBytes:v13 length:v25 error:&v23];
          objc_storeStrong(v15, v23);
          if (v16)
          {
            [v7 addObject:v16];

LABEL_11:
            int v17 = 0;
            goto LABEL_12;
          }
        }
      }
      else
      {
        v18 = (id *)(v31 + 5);
        id v22 = (id)v31[5];
        int v19 = [v5 skipType:v28 error:&v22];
        objc_storeStrong(v18, v22);
        if (v19) {
          goto LABEL_11;
        }
      }
      int v17 = 1;
    }
    else if (v31[5])
    {
      int v17 = 1;
    }
    else
    {
      int v17 = 2;
    }
LABEL_12:
  }
  while (!v17);
  if (v17 == 2)
  {
    v20 = objc_alloc_init(ENSignatureFile);
    [(ENSignatureFile *)v20 setSignatures:v7];
  }
  else
  {
    v20 = 0;
  }

  v6[2](v6);
  _Block_object_dispose(&v30, 8);

  return v20;
}

id __57__ENSignatureFile__signatureFileWithProtobufCoder_error___block_invoke(uint64_t a1)
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

- (BOOL)openWithFileSystemRepresentation:(const char *)a3 reading:(BOOL)a4 error:(id *)a5
{
  if (a4)
  {
    if (a5)
    {
      uint64_t v9 = 5;
      goto LABEL_10;
    }
  }
  else if (self->_fileHandle || self->_outputData)
  {
    if (a5)
    {
      uint64_t v9 = 10;
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = fopen(a3, "wb");
    self->_fileHandle = v7;
    if (v7 || *__error() && !*__error()) {
      return 1;
    }
    if (a5)
    {
      uint64_t v9 = 2;
LABEL_10:
      ENErrorF(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a5 = v10;
      return result;
    }
  }
  return 0;
}

- (BOOL)openForWritingToData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (self->_fileHandle || (outputData = self->_outputData, p_outputData = &self->_outputData, outputData))
  {
    if (a4)
    {
      ENErrorF(10);
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    objc_storeStrong((id *)p_outputData, a3);
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)closeAndReturnError:(id *)a3
{
  outputData = self->_outputData;
  if (outputData)
  {
    self->_outputData = 0;

    return 1;
  }
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    int v7 = fclose(fileHandle);
    self->_fileHandle = 0;
    if (!v7) {
      return 1;
    }
    if (a3)
    {
      __error();
      uint64_t v9 = 1;
      goto LABEL_10;
    }
  }
  else if (a3)
  {
    uint64_t v9 = 10;
LABEL_10:
    ENErrorF(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v10;
    return result;
  }
  return 0;
}

- (BOOL)writeAndReturnError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __39__ENSignatureFile_writeAndReturnError___block_invoke;
  v33[3] = &unk_264244C68;
  v33[4] = &v34;
  v33[5] = a3;
  uint64_t v25 = (void (**)(void))MEMORY[0x2166BC8A0](v33, a2);
  fileHandle = self->_fileHandle;
  v26 = self->_outputData;
  if ((unint64_t)fileHandle | (unint64_t)v26)
  {
    id v5 = objc_alloc_init(ENProtobufCoder);
    id v6 = v5;
    if (fileHandle)
    {
      [(ENProtobufCoder *)v5 setFileHandle:fileHandle];
    }
    else if (v26)
    {
      [(ENProtobufCoder *)v5 setWriteMutableData:v26];
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v7 = self->_signatures;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x2166BC6F0]();
          uint64_t v13 = objc_alloc_init(ENProtobufCoder);
          id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
          [(ENProtobufCoder *)v13 setWriteMutableData:v14];
          v15 = (id *)(v35 + 5);
          id obj = (id)v35[5];
          LOBYTE(v11) = [v11 encodeWithProtobufCoder:v13 error:&obj];
          objc_storeStrong(v15, obj);
          BOOL v20 = 0;
          if (v11)
          {
            uint64_t v16 = [v14 length];
            if (!v16
              || (uint64_t v17 = [v14 bytes],
                  v18 = (id *)(v35 + 5),
                  id v27 = (id)v35[5],
                  BOOL v19 = [(ENProtobufCoder *)v6 writeLengthDelimitedPtr:v17 length:v16 tag:1 error:&v27], objc_storeStrong(v18, v27), v19))
            {
              BOOL v20 = 1;
            }
          }

          if (!v20)
          {
            BOOL v22 = 0;
            goto LABEL_22;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v21 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v40 count:16];
        uint64_t v8 = v21;
      }
      while (v21);
    }
    BOOL v22 = 1;
LABEL_22:
  }
  else
  {
    uint64_t v24 = ENErrorF(10);
    BOOL v22 = 0;
    id v6 = (ENProtobufCoder *)v35[5];
    v35[5] = v24;
  }

  v25[2](v25);
  _Block_object_dispose(&v34, 8);

  return v22;
}

id __39__ENSignatureFile_writeAndReturnError___block_invoke(uint64_t a1)
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

- (NSArray)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);

  objc_storeStrong((id *)&self->_outputData, 0);
}

@end