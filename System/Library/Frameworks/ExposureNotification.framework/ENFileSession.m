@interface ENFileSession
- (BOOL)_activateHandleReply:(id)a3 error:(id *)a4;
- (BOOL)_activateSyncWithRequest:(id)a3 error:(id *)a4;
- (BOOL)activateWithArchivePath:(id)a3 error:(id *)a4;
- (BOOL)activateWithFD:(int)a3 signatureData:(id)a4 error:(id *)a5;
- (BOOL)activateWithFilePath:(id)a3 error:(id *)a4;
- (ENFileSession)initWithServiceClient:(id)a3;
- (ENXPCServiceClient)serviceClient;
- (NSArray)signatures;
- (NSData)sha256Data;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)metadata;
- (id)_activateCreateXPCRequestWithFD:(int)a3 archive:(BOOL)a4 signatureData:(id)a5 error:(id *)a6;
- (id)_activateCreateXPCRequestWithPath:(id)a3 archive:(BOOL)a4 signatureData:(id)a5 error:(id *)a6;
- (id)_readTEKBatchHandleReply:(id)a3 error:(id *)a4;
- (id)readTEKBatchAndReturnError:(id *)a3;
- (id)verifySignatureWithPublicKey:(__SecKey *)a3 error:(id *)a4;
- (unint64_t)batchSize;
- (unint64_t)invalidKeyCount;
- (unsigned)flags;
- (void)dealloc;
- (void)invalidate;
- (void)setBatchSize:(unint64_t)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation ENFileSession

- (ENFileSession)initWithServiceClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENFileSession;
  v6 = [(ENFileSession *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    v7->_batchSize = 256;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_activateSucceeded && !self->_invalidated)
  {
    v2 = (ENFileSession *)FatalErrorF();
    [(ENFileSession *)v2 startDate];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ENFileSession;
    [(ENFileSession *)&v4 dealloc];
  }
}

- (NSDate)startDate
{
  v2 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"startTS"];
  SEL v3 = v2;
  if (v2)
  {
    objc_super v4 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v2, "unsignedLongValue"));
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  v2 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"endTS"];
  SEL v3 = v2;
  if (v2)
  {
    objc_super v4 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v2, "unsignedLongValue"));
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_activateCalled)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __27__ENFileSession_invalidate__block_invoke;
      v11[3] = &unk_264244868;
      v11[4] = self;
      SEL v3 = (void (**)(void, void))MEMORY[0x2166BC8A0](v11, a2);
      serviceClient = self->_serviceClient;
      id v10 = 0;
      id v5 = [(ENXPCServiceClient *)serviceClient getXPCConnectionAndReturnError:&v10];
      id v6 = v10;
      if (v5)
      {
        xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v7, "smTyp", 12);
        v8 = [(ENXPCServiceClient *)self->_serviceClient dispatchQueue];
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __27__ENFileSession_invalidate__block_invoke_2;
        handler[3] = &unk_264244D78;
        handler[4] = v3;
        xpc_connection_send_message_with_reply(v5, v7, v8, handler);
      }
      else
      {
        ((void (**)(void, id))v3)[2](v3, v6);
      }
    }
  }
}

uint64_t __27__ENFileSession_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (gLogCategory__ENFileSession <= 90)
    {
      id v8 = v2;
      if (gLogCategory__ENFileSession != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v8, v2))
      {
        objc_super v4 = (objc_class *)objc_opt_class();
        id v5 = NSStringFromClass(v4);
        xpc_object_t v7 = CUPrintNSError();
        LogPrintF_safe();

        id v3 = v8;
      }
    }
  }

  return MEMORY[0x270F9A758](v2, v3);
}

void __27__ENFileSession_invalidate__block_invoke_2(uint64_t a1)
{
  CUXPCDecodeNSErrorIfNeeded();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)activateWithArchivePath:(id)a3 error:(id *)a4
{
  id v6 = [(ENFileSession *)self _activateCreateXPCRequestWithPath:a3 archive:1 signatureData:0 error:a4];
  if (v6) {
    BOOL v7 = [(ENFileSession *)self _activateSyncWithRequest:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)activateWithFD:(int)a3 signatureData:(id)a4 error:(id *)a5
{
  BOOL v7 = [(ENFileSession *)self _activateCreateXPCRequestWithFD:*(void *)&a3 archive:0 signatureData:a4 error:a5];
  if (v7) {
    BOOL v8 = [(ENFileSession *)self _activateSyncWithRequest:v7 error:a5];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)activateWithFilePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [v6 stringByDeletingPathExtension];
  BOOL v8 = [v7 stringByAppendingPathExtension:@"sig"];

  objc_super v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    id v17 = 0;
    uint64_t v11 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v8 options:0 error:&v17];
    id v12 = v17;
    v13 = v12;
    if (!v11)
    {
      if (a4)
      {
        ENNestedErrorF(v12, 1);
        BOOL v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v15 = 0;
      }
      goto LABEL_8;
    }

    v13 = (void *)v11;
  }
  else
  {
    v13 = 0;
  }
  v14 = [(ENFileSession *)self _activateCreateXPCRequestWithPath:v6 archive:0 signatureData:v13 error:a4];
  if (v14) {
    BOOL v15 = [(ENFileSession *)self _activateSyncWithRequest:v14 error:a4];
  }
  else {
    BOOL v15 = 0;
  }

LABEL_8:
  return v15;
}

- (id)_activateCreateXPCRequestWithPath:(id)a3 archive:(BOOL)a4 signatureData:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = v10;
  v13 = realpath_DARWIN_EXTSN((const char *)[v12 fileSystemRepresentation], 0);
  if (v13)
  {
    v14 = v13;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __79__ENFileSession__activateCreateXPCRequestWithPath_archive_signatureData_error___block_invoke;
    v19[3] = &__block_descriptor_40_e5_v8__0l;
    v19[4] = v13;
    BOOL v15 = (void (**)(void))MEMORY[0x2166BC8A0](v19);
    uint64_t v16 = open(v14, 0);
    if ((v16 & 0x80000000) != 0 && (!*__error() || *__error()))
    {
      if (a6)
      {
        ENErrorF(2);
        id v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = [(ENFileSession *)self _activateCreateXPCRequestWithFD:v16 archive:v8 signatureData:v11 error:a6];
      if (!v17) {
        close(v16);
      }
    }
    v15[2](v15);
  }
  else if (a6)
  {
    ENErrorF(2);
    id v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __79__ENFileSession__activateCreateXPCRequestWithPath_archive_signatureData_error___block_invoke(uint64_t a1)
{
}

- (id)_activateCreateXPCRequestWithFD:(int)a3 archive:(BOOL)a4 signatureData:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  xpc_object_t v11 = xpc_fd_create(a3);
  if (v11)
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    v13 = v12;
    if (v7) {
      int64_t v14 = 10;
    }
    else {
      int64_t v14 = 11;
    }
    xpc_dictionary_set_int64(v12, "smTyp", v14);
    xpc_dictionary_set_uint64(v13, "btSz", self->_batchSize);
    xpc_dictionary_set_value(v13, "fd", v11);
    xpc_dictionary_set_uint64(v13, "fileSF", self->_flags);
    if (v10)
    {
      id v15 = v10;
      id v16 = v13;
      id v17 = v15;
      uint64_t v18 = [v17 bytes];
      if (v18) {
        v19 = (const char *)v18;
      }
      else {
        v19 = "";
      }
      size_t v20 = [v17 length];

      xpc_dictionary_set_data(v16, "sigD", v19, v20);
    }
    if ((a3 & 0x80000000) == 0) {
      close(a3);
    }
  }
  else if (a6)
  {
    ENErrorF(1);
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_activateSyncWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_activateCalled)
  {
    if (a4) {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if (self->_invalidated)
  {
    if (a4)
    {
LABEL_10:
      ENErrorF(10);
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_12:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  BOOL v7 = [(ENXPCServiceClient *)self->_serviceClient getXPCConnectionAndReturnError:a4];
  BOOL v8 = v7;
  if (v7)
  {
    self->_activateCalled = 1;
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v7, v6);
    BOOL v10 = [(ENFileSession *)self _activateHandleReply:v9 error:a4];
  }
  else
  {
    BOOL v10 = 0;
  }

LABEL_6:
  return v10;
}

- (BOOL)_activateHandleReply:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  xpc_object_t v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  CUXPCDecodeNSErrorIfNeeded();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)v10[5];
  if (v6)
  {
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    BOOL v7 = xpc_dictionary_get_value(v5, "meta");
    if (v7)
    {
      if ((CUXPCDecodeNSData() & 1) != 0 && a4)
      {
        ENErrorF(16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a4)
    {
      ENErrorF(16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  _Block_object_dispose(&v9, 8);

  return 0;
}

BOOL __44__ENFileSession__activateHandleReply_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENSignature alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    BOOL v7 = [(ENSignature *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENNestedErrorF(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 2);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    xpc_object_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (id)readTEKBatchAndReturnError:(id *)a3
{
  if (self->_activateSucceeded)
  {
    if (!self->_invalidated)
    {
      id v5 = [(ENXPCServiceClient *)self->_serviceClient getXPCConnectionAndReturnError:a3];
      if (v5)
      {
        xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v6, "smTyp", 13);
        xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
        BOOL v8 = [(ENFileSession *)self _readTEKBatchHandleReply:v7 error:a3];
      }
      else
      {
        BOOL v8 = 0;
      }

      goto LABEL_6;
    }
    if (a3) {
      goto LABEL_12;
    }
  }
  else if (a3)
  {
LABEL_12:
    ENErrorF(10);
    BOOL v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (id)_readTEKBatchHandleReply:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  size_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  CUXPCDecodeNSErrorIfNeeded();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  xpc_object_t v7 = (void *)v17[5];
  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = xpc_dictionary_get_array(v6, "tekA");
    uint64_t v10 = v9;
    if (v9)
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __48__ENFileSession__readTEKBatchHandleReply_error___block_invoke;
      applier[3] = &unk_264244840;
      applier[4] = v8;
      applier[5] = &v16;
      xpc_array_apply(v9, applier);
    }

    uint64_t v11 = (void *)v17[5];
    if (v11)
    {
      if (a4)
      {
        id v13 = 0;
        *a4 = v11;
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v22 = 0;
      int v12 = CUXPCDecodeUInt64RangedEx();
      if (v12 == 6)
      {
        self->_invalidKeyCount = v22;
LABEL_8:
        id v13 = v8;
LABEL_9:

        goto LABEL_10;
      }
      if (v12 != 5) {
        goto LABEL_8;
      }
    }
    id v13 = 0;
    goto LABEL_9;
  }
  id v13 = 0;
  if (a4) {
    *a4 = v7;
  }
LABEL_10:
  _Block_object_dispose(&v16, 8);

  return v13;
}

BOOL __48__ENFileSession__readTEKBatchHandleReply_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x2166BCD00]() == MEMORY[0x263EF8708])
  {
    id v5 = [ENTemporaryExposureKey alloc];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    xpc_object_t v7 = [(ENTemporaryExposureKey *)v5 initWithXPCObject:v4 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    BOOL v8 = v7 != 0;
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v13 = ENNestedErrorF(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 2);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  else
  {
    uint64_t v10 = ENErrorF(15);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    BOOL v8 = 0;
  }

  return v8;
}

- (id)verifySignatureWithPublicKey:(__SecKey *)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (!self->_activateSucceeded)
  {
    if (!a4) {
      goto LABEL_52;
    }
LABEL_48:
    uint64_t v33 = 10;
LABEL_51:
    ENErrorF(v33);
    id v31 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if (self->_invalidated)
  {
    if (!a4) {
      goto LABEL_52;
    }
    goto LABEL_48;
  }
  sha256Data = self->_sha256Data;
  if (sha256Data)
  {
    xpc_object_t v7 = self->_signatures;
    BOOL v8 = v7;
    if (v7)
    {
      uint64_t v9 = [(NSArray *)v7 firstObject];

      if (v9)
      {
        v36 = a4;
        v37 = v8;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v10 = v8;
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          CFStringRef v13 = (const __CFString *)*MEMORY[0x263F172A8];
          uint64_t v14 = *(void *)v41;
          uint64_t v38 = *MEMORY[0x263F08410];
          unint64_t v15 = 0x26786A000uLL;
LABEL_8:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(v10);
            }
            id v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
            uint64_t v18 = objc_msgSend(v17, "signatureData", v34, v35);

            if (!v18)
            {
              int v23 = *(_DWORD *)(v15 + 3856);
              if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v24 = [v17 keyID];
                v25 = (void *)v24;
                if (v24) {
                  v26 = (__CFString *)v24;
                }
                else {
                  v26 = @"<no key ID>";
                }
                uint64_t v27 = [v17 keyVersion];
                v28 = (void *)v27;
                v29 = @"<no key version>";
                if (v27) {
                  v29 = (__CFString *)v27;
                }
                v34 = v26;
                v35 = v29;
                unint64_t v15 = 0x26786A000;
                LogPrintF_safe();
              }
              goto LABEL_34;
            }
            CFErrorRef error = 0;
            if (SecKeyVerifySignature(a3, v13, (CFDataRef)sha256Data, (CFDataRef)v18, &error))
            {
              id v31 = v17;

              goto LABEL_40;
            }
            CFErrorRef v19 = error;
            if (!error) {
              goto LABEL_34;
            }
            size_t v20 = [(__CFError *)error domain];
            if (![v20 isEqualToString:v38]) {
              break;
            }
            uint64_t v21 = [(__CFError *)v19 code];

            BOOL v22 = v21 == -67808;
            unint64_t v15 = 0x26786A000;
            if (!v22) {
              goto LABEL_27;
            }
LABEL_33:

LABEL_34:
            if (v12 == ++v16)
            {
              uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v40 objects:v44 count:16];
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_36;
            }
          }

LABEL_27:
          int v30 = *(_DWORD *)(v15 + 3856);
          if (v30 <= 90 && (v30 != -1 || _LogCategory_Initialize()))
          {
            v34 = CUPrintNSError();
            LogPrintF_safe();
          }
          goto LABEL_33;
        }
LABEL_36:

        if (v36)
        {
          ENErrorF(2);
          id v31 = 0;
          id *v36 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v31 = 0;
        }
LABEL_40:
        BOOL v8 = v37;
        goto LABEL_41;
      }
      if (a4) {
        goto LABEL_56;
      }
    }
    else if (a4)
    {
LABEL_56:
      ENErrorF(2);
      id v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

      goto LABEL_42;
    }
    id v31 = 0;
    goto LABEL_41;
  }
  if (a4)
  {
    uint64_t v33 = 2;
    goto LABEL_51;
  }
LABEL_52:
  id v31 = 0;
LABEL_42:

  return v31;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
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

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSData)sha256Data
{
  return self->_sha256Data;
}

- (NSArray)signatures
{
  return self->_signatures;
}

- (ENXPCServiceClient)serviceClient
{
  return self->_serviceClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_sha256Data, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end