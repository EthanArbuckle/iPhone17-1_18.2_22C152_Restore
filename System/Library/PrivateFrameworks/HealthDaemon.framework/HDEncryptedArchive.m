@interface HDEncryptedArchive
+ (BOOL)encryptContentsOfFileHandle:(id)a3 to:(id)a4 key:(id)a5 error:(id *)a6;
+ (id)archiveForDecryptionWithFileHandle:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)archiveForEncryptionWithFileHandle:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)randomSymmetricKeyWithError:(id *)a3;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (HDEncryptedArchive)initWithContext:(AEAContext_impl *)a3 fileStream:(AAByteStream_impl *)a4 byteStream:(AAByteStream_impl *)a5 mode:(int64_t)a6;
- (id)readDataOfLength:(int64_t)a3 offset:(int64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
@end

@implementation HDEncryptedArchive

+ (id)archiveForDecryptionWithFileHandle:(id)a3 key:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v8 = dup([a3 fileDescriptor]);
  v9 = AAFileStreamOpenWithFD(v8, 1);
  if (!v9)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    v20 = @"Failed to open file stream.";
    v21 = a5;
    uint64_t v22 = 922;
LABEL_9:
    objc_msgSend(v19, "hk_assignError:code:format:", v21, v22, v20);
    v23 = 0;
    goto LABEL_16;
  }
  v10 = v9;
  AEAContext v11 = AEAContextCreateWithEncryptedStream(v9);
  if (!v11)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    v20 = @"Failed to construct context from encrypted stream.";
    v21 = a5;
    uint64_t v22 = 921;
    goto LABEL_9;
  }
  v12 = v11;
  v13 = [v7 keyDataForDecryptionWithError:a5];
  if (v13)
  {
    int v14 = [v7 symmetric];
    id v15 = v13;
    v16 = (const uint8_t *)[v15 bytes];
    size_t v17 = [v15 length];
    if (v14)
    {
      uint64_t v18 = AEAContextSetFieldBlob(v12, 9u, 0, v16, v17);
      if ((v18 & 0x80000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 921, @"Failed to set symmetric key: %d", v18);
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v24 = AEAContextSetFieldBlob(v12, 0xBu, 1u, v16, v17);
      if ((v24 & 0x80000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 921, @"Failed to set recipient private key: %d", v24);
        goto LABEL_14;
      }
    }
    v23 = (HDEncryptedArchive *)AEADecryptionRandomAccessInputStreamOpen(v10, v12, 0, 0, 1);
    if (v23) {
      v23 = [[HDEncryptedArchive alloc] initWithContext:v12 fileStream:v10 byteStream:v23 mode:1];
    }
    goto LABEL_15;
  }
LABEL_14:
  v23 = 0;
LABEL_15:

LABEL_16:

  return v23;
}

+ (id)archiveForEncryptionWithFileHandle:(id)a3 key:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 symmetric]) {
    AEAProfile v9 = 1;
  }
  else {
    AEAProfile v9 = 3;
  }
  AEAContext v10 = AEAContextCreateWithProfile(v9);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 921, @"Failed to create context.");
    v20 = 0;
    goto LABEL_21;
  }
  AEAContext v11 = v10;
  v12 = [v8 keyDataForEncryptionWithError:a5];
  if (!v12) {
    goto LABEL_19;
  }
  int v13 = [v8 symmetric];
  id v14 = v12;
  id v15 = (const uint8_t *)[v14 bytes];
  size_t v16 = [v14 length];
  if (v13)
  {
    uint64_t v17 = AEAContextSetFieldBlob(v11, 9u, 0, v15, v16);
    if ((v17 & 0x80000000) != 0)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = v17;
      v19 = @"Failed to set symmetric key: %d";
LABEL_16:
      v25 = v18;
      v26 = a5;
      uint64_t v27 = 921;
LABEL_18:
      objc_msgSend(v25, "hk_assignError:code:format:", v26, v27, v19, v29);
LABEL_19:
      v20 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v21 = AEAContextSetFieldBlob(v11, 0xAu, 1u, v15, v16);
    if ((v21 & 0x80000000) != 0)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = v21;
      v19 = @"Failed to set recipient public key: %d";
      goto LABEL_16;
    }
  }
  uint64_t v22 = AEAContextSetFieldUInt(v11, 3u, 0);
  if ((v22 & 0x80000000) != 0)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = v22;
    v19 = @"Failed to set compression algorithm key: %d";
    goto LABEL_16;
  }
  int v23 = dup([v7 fileDescriptor]);
  uint64_t v24 = AAFileStreamOpenWithFD(v23, 1);
  if (!v24)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    v19 = @"Failed to open file stream.";
    v26 = a5;
    uint64_t v27 = 922;
    goto LABEL_18;
  }
  v20 = [[HDEncryptedArchive alloc] initWithContext:v11 fileStream:v24 byteStream:AEAEncryptionOutputStreamOpen(v24, v11, 0, 1) mode:0];
LABEL_20:

LABEL_21:

  return v20;
}

+ (BOOL)encryptContentsOfFileHandle:(id)a3 to:(id)a4 key:(id)a5 error:(id *)a6
{
  id v9 = a3;
  AEAContext v10 = +[HDEncryptedArchive archiveForEncryptionWithFileHandle:a4 key:a5 error:a6];
  if (v10)
  {
    while (1)
    {
      AEAContext v11 = [v9 readDataUpToLength:0x8000 error:a6];
      if (![v11 length]) {
        break;
      }
      int v12 = [v10 writeData:v11 error:a6];

      if (!v12) {
        goto LABEL_4;
      }
    }

    [v10 close];
    BOOL v13 = 1;
  }
  else
  {
LABEL_4:
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)randomSymmetricKeyWithError:(id *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  size_t v6 = [v4 length];
  id v7 = v4;
  uint64_t v8 = SecRandomCopyBytes(v5, v6, (void *)[v7 mutableBytes]);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 2000, @"Failed to generate random symmetric key: %d", v8);
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

- (HDEncryptedArchive)initWithContext:(AEAContext_impl *)a3 fileStream:(AAByteStream_impl *)a4 byteStream:(AAByteStream_impl *)a5 mode:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HDEncryptedArchive;
  result = [(HDEncryptedArchive *)&v11 init];
  if (result)
  {
    result->_byteStream = a5;
    result->_mode = a6;
    result->_context = a3;
    result->_fileStream = a4;
  }
  return result;
}

- (void)dealloc
{
  [(HDEncryptedArchive *)self close];
  v3.receiver = self;
  v3.super_class = (Class)HDEncryptedArchive;
  [(HDEncryptedArchive *)&v3 dealloc];
}

- (void)close
{
  byteStream = self->_byteStream;
  if (byteStream)
  {
    AAByteStreamClose(byteStream);
    self->_byteStream = 0;
  }
  fileStream = self->_fileStream;
  if (fileStream)
  {
    AAByteStreamClose(fileStream);
    self->_fileStream = 0;
  }
  context = self->_context;
  if (context)
  {
    AEAContextDestroy(context);
    self->_context = 0;
  }
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_mode)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = @"Archive is not open for encryption.";
    AEAContext v10 = a4;
    uint64_t v11 = 126;
LABEL_3:
    objc_msgSend(v8, "hk_assignError:code:format:", v10, v11, v9, v17);
    goto LABEL_4;
  }
  byteStream = self->_byteStream;
  if (!byteStream)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = @"Archive is not open.";
    AEAContext v10 = a4;
    uint64_t v11 = 3;
    goto LABEL_3;
  }
  id v15 = v6;
  ssize_t v16 = AAByteStreamWrite(byteStream, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
  if ((v16 & 0x8000000000000000) == 0)
  {
    BOOL v12 = 1;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 923, @"Failed to write encrypted data: %ld", v16);
LABEL_4:
  BOOL v12 = 0;
LABEL_5:

  return v12;
}

- (id)readDataOfLength:(int64_t)a3 offset:(int64_t)a4 error:(id *)a5
{
  if (self->_mode != 1)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    id v15 = @"Archive is not open for decryption.";
    ssize_t v16 = a5;
    uint64_t v17 = 126;
LABEL_9:
    objc_msgSend(v14, "hk_assignError:code:format:", v16, v17, v15);
    id v13 = 0;
    goto LABEL_12;
  }
  if (!self->_byteStream)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    id v15 = @"Archive is not open.";
    ssize_t v16 = a5;
    uint64_t v17 = 3;
    goto LABEL_9;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3];
  byteStream = self->_byteStream;
  id v11 = v9;
  ssize_t v12 = AAByteStreamPRead(byteStream, (void *)[v11 mutableBytes], a3, a4);
  if (v12 < 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 923, @"Failed to read encrypted data at %lld (length %ld): %ld (errno: %d)", a4, a3, v12, *__error());
    id v13 = 0;
  }
  else
  {
    if (a3 > v12) {
      objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", v12, a3 - v12, 0, 0);
    }
    id v13 = v11;
  }

LABEL_12:

  return v13;
}

@end