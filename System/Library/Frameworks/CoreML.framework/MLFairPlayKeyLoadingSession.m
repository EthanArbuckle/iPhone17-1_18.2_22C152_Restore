@interface MLFairPlayKeyLoadingSession
- ($8D16E72C621A2E7E101564C362693498)sessionContext;
- (MLFairPlayKeyLoadingSession)init;
- (NSString)keyIdentifier;
- (id)generateKeyRequestForKeyIdentifier:(id)a3 teamIdentifier:(id)a4 error:(id *)a5;
- (id)generatePersistentKeyBlobFromKeyResponse:(id)a3 error:(id *)a4;
- (id)transformKeyIdentifier:(id)a3 error:(id *)a4;
- (unsigned)sessionID;
- (void)dealloc;
- (void)setKeyIdentifier:(id)a3;
- (void)setSessionContext:(id *)a3;
- (void)setSessionID:(unsigned int)a3;
@end

@implementation MLFairPlayKeyLoadingSession

- (void).cxx_destruct
{
}

- (void)setSessionContext:(id *)a3
{
  self->_sessionContext = a3;
}

- ($8D16E72C621A2E7E101564C362693498)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSString)keyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)generatePersistentKeyBlobFromKeyResponse:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(MLFairPlayKeyLoadingSession *)self sessionID] == -1)
  {
    if (a4)
    {
      v17 = [(MLFairPlayKeyLoadingSession *)self keyIdentifier];
      *a4 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0, @"Cannot process key response for %@ at this time. No active session.", v17 format];
    }
    v12 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v13 = [(MLFairPlayKeyLoadingSession *)self keyIdentifier];
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    v14 = "Cannot process key response for %@ at this time. No active session.";
    v15 = v12;
    uint32_t v16 = 12;
    goto LABEL_16;
  }
  uint64_t v21 = 0;
  unsigned int v20 = 0;
  int v7 = [(MLFairPlayKeyLoadingSession *)self sessionID];
  id v8 = v6;
  uint64_t v9 = T8HkBFEVEnY(v7, [v8 bytes], objc_msgSend(v8, "length"), (uint64_t)&v21, (uint64_t)&v20);
  if (v9)
  {
    uint64_t v10 = v9;
    if (a4)
    {
      v11 = [(MLFairPlayKeyLoadingSession *)self keyIdentifier];
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0, @"Failed to process key response for %@ : error=%d", v11, v10 format];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v13 = [(MLFairPlayKeyLoadingSession *)self keyIdentifier];
    *(_DWORD *)buf = 138412546;
    v23 = v13;
    __int16 v24 = 1024;
    int v25 = v10;
    v14 = "Failed to process key response for %@ : error=%d";
    v15 = v12;
    uint32_t v16 = 18;
LABEL_16:
    _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);

LABEL_10:
    v18 = 0;
    goto LABEL_12;
  }
  v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:v20];
LABEL_12:

  return v18;
}

- (id)generateKeyRequestForKeyIdentifier:(id)a3 teamIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(MLFairPlayKeyLoadingSession *)self sessionID] != -1)
  {
    if (a5)
    {
      *a5 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0, @"Cannot generate key request at this time for %@. Session %d in progress.", v8, [(MLFairPlayKeyLoadingSession *)self sessionID] format];
    }
    uint64_t v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 1024;
      unsigned int v28 = [(MLFairPlayKeyLoadingSession *)self sessionID];
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Cannot generate key request at this time for %@. Session %d in progress.", buf, 0x12u);
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  uint64_t v13 = [(MLFairPlayKeyLoadingSession *)self transformKeyIdentifier:v8 error:a5];
  if (!v13)
  {
    __int16 v24 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "Cannot transform key identifier (%@) to data.", buf, 0xCu);
    }

    uint64_t v10 = 0;
    goto LABEL_6;
  }
  v14 = (void *)v13;
  v15 = [(MLFairPlayKeyLoadingSession *)self sessionContext];
  uint64_t v10 = v14;
  *(_OWORD *)v15->var4.var0 = *(_OWORD *)[v10 bytes];
  uint32_t v16 = [(MLFairPlayKeyLoadingSession *)self sessionContext];
  *(void *)&v16->var4.var1[8] = 0;
  *(void *)v16->var4.var1 = 0;
  *(unsigned char *)([(MLFairPlayKeyLoadingSession *)self sessionContext] + 4400) = 1;
  v17 = [(MLFairPlayKeyLoadingSession *)self sessionContext] + 4432;
  char v18 = objc_msgSend(v9, "getCString:maxLength:encoding:", v17, 128, objc_msgSend(NSString, "defaultCStringEncoding"));
  v19 = +[MLLogging coreChannel];
  unsigned int v20 = v19;
  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v9;
      _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "Team identifier exceeds maximum allowed string length: %@.", buf, 0xCu);
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v9;
    _os_log_debug_impl(&dword_19E58B000, v20, OS_LOG_TYPE_DEBUG, "Set sessionContext->keyRequestContext.teamID to: %@.", buf, 0xCu);
  }

  [(MLFairPlayKeyLoadingSession *)self sessionContext];
  xTQjDN5HCIo();
  if (v21)
  {
    unsigned int v22 = v21;
    if (a5)
    {
      *a5 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0, @"Failed to generate key request for %@ with error: %d", v8, v21 format];
    }
    v23 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v8;
      __int16 v27 = 1024;
      unsigned int v28 = v22;
      _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Failed to generate key request for %@ with error: %d", buf, 0x12u);
    }

    goto LABEL_6;
  }
  [(MLFairPlayKeyLoadingSession *)self setSessionID:0];
  [(MLFairPlayKeyLoadingSession *)self setKeyIdentifier:v8];
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
LABEL_7:

  return v11;
}

- (id)transformKeyIdentifier:(id)a3 error:(id *)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F29128];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithUUIDString:v7];

  if (v8)
  {
    v15[0] = 0;
    v15[1] = 0;
    [v8 getUUIDBytes:v15];
    id v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:16];
    uint64_t v10 = v9;
    if (v9)
    {
      if ((unint64_t)[v9 length] < 0x11)
      {
        id v11 = v10;
        goto LABEL_13;
      }
      if (a4)
      {
        +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, @"Key identifier (%lu) is larger than supported size (%d)", [v10 length], 16);
        id v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
    else if (a4)
    {
      uint64_t v13 = [(MLFairPlayKeyLoadingSession *)self keyIdentifier];
      *a4 = +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:0, @"Failed to transform key identifier (%@) to data", v13 format];
    }
    id v11 = 0;
    goto LABEL_13;
  }
  if (a4)
  {
    v12 = [(MLFairPlayKeyLoadingSession *)self keyIdentifier];
    *a4 = +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:0, @"Key identifier (%@) is not in the UUID format. Make sure .mlmodelkey file was not modified before it was used for encrypting the model.", v12 format];
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int sessionID = self->_sessionID;
  if (sessionID != -1)
  {
    TCvO8ZqLN8g(sessionID);
    if (v4)
    {
      int v5 = v4;
      id v6 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        keyIdentifier = self->_keyIdentifier;
        *(_DWORD *)buf = 138412546;
        id v11 = keyIdentifier;
        __int16 v12 = 1024;
        int v13 = v5;
        _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "Failed to destroy FairPlay session for %@ : error=%d", buf, 0x12u);
      }
    }
  }
  sessionContext = self->_sessionContext;
  if (sessionContext) {
    free(sessionContext);
  }
  v9.receiver = self;
  v9.super_class = (Class)MLFairPlayKeyLoadingSession;
  [(MLFairPlayKeyLoadingSession *)&v9 dealloc];
}

- (MLFairPlayKeyLoadingSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)MLFairPlayKeyLoadingSession;
  v2 = [(MLFairPlayKeyLoadingSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_unsigned int sessionID = -1;
    keyIdentifier = v2->_keyIdentifier;
    v2->_keyIdentifier = (NSString *)@"Uninitialized";

    int v5 = ($8D16E72C621A2E7E101564C362693498 *)malloc_type_calloc(1uLL, 0x11D0uLL, 0x1000040CE5F979FuLL);
    v3->_sessionContext = v5;
    *(void *)&v5->var0 = 0x1411000001000000;
    v5->var2 = -1342177280;
  }
  return v3;
}

@end