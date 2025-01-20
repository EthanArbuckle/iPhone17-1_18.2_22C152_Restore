@interface MLFairPlayDecryptSessionManager
- ($8D16E72C621A2E7E101564C362693498)sessionContext;
- (BOOL)startDecryptionOfModelAtPath:(id)a3 usingKeyBlob:(id)a4 teamIdentifier:(id)a5 error:(id *)a6;
- (BOOL)stopDecryptionOfModelAtPath:(id)a3 error:(id *)a4;
- (MLFairPlayDecryptSessionManager)init;
- (NSMutableDictionary)modelPathToSessionID;
- (OS_dispatch_queue)syncQueue;
- (int)stopDecryptionOfModelAtPath:(id)a3;
- (void)dealloc;
@end

@implementation MLFairPlayDecryptSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);

  objc_storeStrong((id *)&self->_modelPathToSessionID, 0);
}

- (OS_dispatch_queue)syncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- ($8D16E72C621A2E7E101564C362693498)sessionContext
{
  return self->_sessionContext;
}

- (NSMutableDictionary)modelPathToSessionID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)stopDecryptionOfModelAtPath:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      *a4 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0 format:@"Model path is nil"];
    }
    v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Model path is nil", (uint8_t *)&buf, 2u);
    }
    goto LABEL_12;
  }
  if ((unint64_t)[v6 length] >= 0x1000)
  {
    if (a4)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, @"Invalid model path length (%ld)", [v7 length]);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v7 length];
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Invalid model path length (%ld)", (uint8_t *)&buf, 0xCu);
    }
LABEL_12:

    BOOL v9 = 0;
    goto LABEL_17;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  v10 = [(MLFairPlayDecryptSessionManager *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MLFairPlayDecryptSessionManager_stopDecryptionOfModelAtPath_error___block_invoke;
  block[3] = &unk_1E59A5350;
  p_long long buf = &buf;
  block[4] = self;
  id v11 = v7;
  id v15 = v11;
  dispatch_sync(v10, block);

  uint64_t v12 = *(unsigned int *)(*((void *)&buf + 1) + 24);
  BOOL v9 = v12 == 0;
  if (a4 && v12)
  {
    +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0, @"Failed to destroy decrypt session for %@. error=%d", v11, v12 format];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&buf, 8);
LABEL_17:

  return v9;
}

uint64_t __69__MLFairPlayDecryptSessionManager_stopDecryptionOfModelAtPath_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) stopDecryptionOfModelAtPath:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)stopDecryptionOfModelAtPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MLFairPlayDecryptSessionManager *)self modelPathToSessionID];
  id v6 = [v5 objectForKeyedSubscript:v4];
  int v7 = [v6 unsignedIntValue];

  if (v7)
  {
    v8 = [(MLFairPlayDecryptSessionManager *)self modelPathToSessionID];
    [v8 setObject:0 forKeyedSubscript:v4];

    TCvO8ZqLN8g(v7);
    int v10 = v9;
    id v11 = +[MLLogging coreChannel];
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412546;
        *(void *)id v15 = v4;
        *(_WORD *)&v15[8] = 1024;
        *(_DWORD *)&v15[10] = v10;
        _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Failed to destroy decrypt session for %@. error=%d", (uint8_t *)&v14, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 67109378;
        *(_DWORD *)id v15 = v7;
        *(_WORD *)&v15[4] = 2112;
        *(void *)&v15[6] = v4;
        _os_log_debug_impl(&dword_19E58B000, v12, OS_LOG_TYPE_DEBUG, "Successfully destroyed decrypt session (id: %u) for %@", (uint8_t *)&v14, 0x12u);
      }
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (BOOL)startDecryptionOfModelAtPath:(id)a3 usingKeyBlob:(id)a4 teamIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    if (a6)
    {
      *a6 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0 format:@"Model path is nil"];
    }
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Model path is nil", (uint8_t *)&v38, 2u);
    }
    goto LABEL_24;
  }
  if (!v11)
  {
    if (a6)
    {
      *a6 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0 format:@"Key blob is nil"];
    }
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Key blob is nil", (uint8_t *)&v38, 2u);
    }
    goto LABEL_24;
  }
  if ((unint64_t)[v10 length] >= 0x1000)
  {
    if (a6)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, @"Invalid model path length (%ld)", [v10 length]);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v38) = 134217984;
      *(void *)((char *)&v38 + 4) = [v10 length];
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Invalid model path length (%ld)", (uint8_t *)&v38, 0xCu);
    }
LABEL_24:

    BOOL v14 = 0;
    goto LABEL_25;
  }
  if ((unint64_t)[v11 length] >= 0x89)
  {
    if (a6)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, @"Invalid key blob length (%ld)", [v11 length]);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v38) = 134217984;
      *(void *)((char *)&v38 + 4) = [v11 length];
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Invalid key blob length (%ld)", (uint8_t *)&v38, 0xCu);
    }
    goto LABEL_24;
  }
  *(void *)&long long v38 = 0;
  *((void *)&v38 + 1) = &v38;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  uint64_t v16 = [(MLFairPlayDecryptSessionManager *)self syncQueue];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __98__MLFairPlayDecryptSessionManager_startDecryptionOfModelAtPath_usingKeyBlob_teamIdentifier_error___block_invoke;
  v25 = &unk_1E59A48D0;
  v26 = self;
  id v17 = v10;
  id v27 = v17;
  id v28 = v11;
  id v29 = v12;
  v30 = &v38;
  v31 = &v32;
  dispatch_sync(v16, &block);

  uint64_t v18 = *(unsigned int *)(*((void *)&v38 + 1) + 24);
  BOOL v14 = v18 == 0;
  if (v18)
  {
    if (a6)
    {
      *a6 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0, @"Failed to set up decrypt context for %@. error:%d", v17, v18, block, v23, v24, v25, v26, v27, v28 format];
    }
    int v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = *(_DWORD *)(*((void *)&v38 + 1) + 24);
      *(_DWORD *)long long buf = 138412546;
      *(void *)v37 = v17;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v20;
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Failed to set up decrypt context for %@. error:%d", buf, 0x12u);
    }
  }
  else
  {
    int v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v21 = *((_DWORD *)v33 + 6);
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)v37 = v21;
      *(_WORD *)&v37[4] = 2112;
      *(void *)&v37[6] = v17;
      _os_log_debug_impl(&dword_19E58B000, v19, OS_LOG_TYPE_DEBUG, "Successfully created decrypt session (id: %u) for %@", buf, 0x12u);
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
LABEL_25:

  return v14;
}

void __98__MLFairPlayDecryptSessionManager_startDecryptionOfModelAtPath_usingKeyBlob_teamIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) stopDecryptionOfModelAtPath:*(void *)(a1 + 40)];
  bzero((void *)([*(id *)(a1 + 32) sessionContext] + 12), 0x1114uLL);
  memcpy((void *)([*(id *)(a1 + 32) sessionContext] + 160), (const void *)objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation"), objc_msgSend(*(id *)(a1 + 40), "length"));
  uint64_t v2 = [*(id *)(a1 + 32) sessionContext];
  *(unsigned char *)(v2 + [*(id *)(a1 + 40) length] + 160) = 47;
  LODWORD(v2) = [*(id *)(a1 + 40) length] + 1;
  *(_DWORD *)([*(id *)(a1 + 32) sessionContext] + 156) = v2;
  if ((unint64_t)[*(id *)(a1 + 48) length] <= 0x87)
  {
    uint64_t v3 = [*(id *)(a1 + 32) sessionContext];
    *(_OWORD *)(v3 + 20) = 0u;
    *(_OWORD *)(v3 + 36) = 0u;
    *(_OWORD *)(v3 + 52) = 0u;
    *(_OWORD *)(v3 + 68) = 0u;
    *(_OWORD *)(v3 + 84) = 0u;
    *(_OWORD *)(v3 + 100) = 0u;
    *(_OWORD *)(v3 + 116) = 0u;
    *(_OWORD *)(v3 + 132) = 0u;
    *(void *)(v3 + 148) = 0;
  }
  id v4 = (void *)([*(id *)(a1 + 32) sessionContext] + 20);
  v5 = (const void *)[*(id *)(a1 + 48) bytes];
  if ((unint64_t)[*(id *)(a1 + 48) length] > 0x87) {
    size_t v6 = 136;
  }
  else {
    size_t v6 = [*(id *)(a1 + 48) length];
  }
  memcpy(v4, v5, v6);
  int v7 = *(void **)(a1 + 56);
  uint64_t v8 = [*(id *)(a1 + 32) sessionContext] + 4256;
  LOBYTE(v8) = objc_msgSend(v7, "getCString:maxLength:encoding:", v8, 128, objc_msgSend(NSString, "defaultCStringEncoding"));
  int v9 = +[MLLogging coreChannel];
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_debug_impl(&dword_19E58B000, v10, OS_LOG_TYPE_DEBUG, "Set sessionContext->decryptContext.teamID to: %@.", buf, 0xCu);
    }

    *(void *)long long buf = 0;
    [*(id *)(a1 + 32) sessionContext];
    xTQjDN5HCIo();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      v13 = [*(id *)(a1 + 32) modelPathToSessionID];
      [v13 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Team identifier exceeds maximum allowed string length: %@.", buf, 0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -1;
  }
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_modelPathToSessionID allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v5 = 67109378;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_modelPathToSessionID, "objectForKeyedSubscript:", v9, v17);
        int v11 = [v10 unsignedIntValue];

        TCvO8ZqLN8g(v11);
        int v13 = v12;
        uint64_t v14 = +[MLLogging coreChannel];
        uint64_t v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)v24 = v9;
            *(_WORD *)&v24[8] = 1024;
            *(_DWORD *)&v24[10] = v13;
            _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Failed to destroy decrypt session for %@. error=%d", buf, 0x12u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = v17;
          *(_DWORD *)v24 = v11;
          *(_WORD *)&v24[4] = 2112;
          *(void *)&v24[6] = v9;
          _os_log_debug_impl(&dword_19E58B000, v15, OS_LOG_TYPE_DEBUG, "Successfully destroyed decrypt session (id: %u) for %@", buf, 0x12u);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  sessionContext = self->_sessionContext;
  if (sessionContext) {
    free(sessionContext);
  }
  v18.receiver = self;
  v18.super_class = (Class)MLFairPlayDecryptSessionManager;
  [(MLFairPlayDecryptSessionManager *)&v18 dealloc];
}

- (MLFairPlayDecryptSessionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MLFairPlayDecryptSessionManager;
  uint64_t v2 = [(MLFairPlayDecryptSessionManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CC08] mutableCopy];
    modelPathToSessionID = v2->_modelPathToSessionID;
    v2->_modelPathToSessionID = (NSMutableDictionary *)v3;

    long long v5 = ($8D16E72C621A2E7E101564C362693498 *)malloc_type_calloc(1uLL, 0x11D0uLL, 0x1000040CE5F979FuLL);
    v2->_sessionContext = v5;
    *(void *)&v5->var0 = 0x1411000001000000;
    v5->var2 = 0;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.coreml.DecrptSessionManager", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

@end