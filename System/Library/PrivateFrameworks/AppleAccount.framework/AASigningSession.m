@interface AASigningSession
+ (id)_badURLError;
+ (id)establishedSessionWithCertURL:(id)a3 sessionURL:(id)a4 error:(id *)a5;
- (AASigningSession)initWithCertURL:(id)a3 sessionURL:(id)a4;
- (id)signatureForData:(id)a3;
- (int)error;
- (void)dealloc;
- (void)establishSession;
@end

@implementation AASigningSession

+ (id)establishedSessionWithCertURL:(id)a3 sessionURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = [[AASigningSession alloc] initWithCertURL:v7 sessionURL:v8];
    [(AASigningSession *)v10 establishSession];
  }
  else if (a5)
  {
    [(id)objc_opt_class() _badURLError];
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_badURLError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1000 userInfo:0];
}

- (AASigningSession)initWithCertURL:(id)a3 sessionURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AASigningSession;
  id v8 = [(AASigningSession *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    certURL = v8->_certURL;
    v8->_certURL = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    sessionURL = v8->_sessionURL;
    v8->_sessionURL = (NSString *)v11;
  }
  return v8;
}

- (void)establishSession
{
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Fetching absinthe cert", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F1CB10] URLWithString:self->_certURL];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = +[AAURLSession sharedSession];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __36__AASigningSession_establishSession__block_invoke;
  v12 = &unk_1E5A49D10;
  v13 = self;
  dispatch_semaphore_t v14 = v5;
  id v7 = v5;
  id v8 = [v6 dataTaskWithURL:v4 completion:&v9];
  objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __36__AASigningSession_establishSession__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v7 || v9)
  {
    if (v9)
    {
      v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v13;
        _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
    }
    *(void *)buf = 0;
    unsigned int v31 = 0;
    if (!v7)
    {
      LODWORD(v17) = -1;
LABEL_19:
      *(_DWORD *)(*(void *)(a1 + 32) + 32) = v17;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = [v7 length];
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Got Absinthe cert: %lu bytes", buf, 0xCu);
    }

    *(void *)buf = 0;
    unsigned int v31 = 0;
  }
  dispatch_semaphore_t v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Initializing absinthe session", v30, 2u);
  }

  id v15 = v7;
  KxmB0CKvgWt([v15 bytes], objc_msgSend(v15, "length"));
  if (v16)
  {
    uint64_t v17 = v16;
    v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __36__AASigningSession_establishSession__block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    goto LABEL_19;
  }
  v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)buf length:v31];
  Be81a395Bf0(*(uint64_t *)buf);
  v26 = [[AASigningSessionRequest alloc] initWithURLString:*(void *)(*(void *)(a1 + 32) + 24) sessionInfoRequestData:v25];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __36__AASigningSession_establishSession__block_invoke_60;
  v28[3] = &unk_1E5A49140;
  v27 = *(void **)(a1 + 40);
  v28[4] = *(void *)(a1 + 32);
  id v29 = v27;
  [(AARequest *)v26 performRequestWithHandler:v28];

LABEL_20:
}

void __36__AASigningSession_establishSession__block_invoke_60(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v23 = _AALogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __36__AASigningSession_establishSession__block_invoke_60_cold_2((uint64_t)v9, v23);
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
  }
  else
  {
    uint64_t v10 = [v8 sessionData];
    if (v10)
    {
      uint64_t v11 = _AALogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Initialized absinthe session, establishing key", v24, 2u);
      }

      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      id v13 = v10;
      nDYmeMqvWb(v12, [v13 bytes], objc_msgSend(v13, "length"));
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = _AALogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __36__AASigningSession_establishSession__block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
        }

        *(_DWORD *)(*(void *)(a1 + 32) + 32) = v15;
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)signatureForData:(id)a3
{
  if (self->_context)
  {
    uint64_t v23 = 0;
    int v22 = 0;
    id v4 = a3;
    dispatch_semaphore_t v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Absinthe signing data", v21, 2u);
    }

    context = self->_context;
    id v7 = v4;
    uint64_t v8 = [v7 bytes];
    uint64_t v9 = [v7 length];

    t1BoNctgaUu66((uint64_t)context, v8, v9, (uint64_t)&v23);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __36__AASigningSession_establishSession__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
      }

      self->_error = v11;
    }
    uint64_t v19 = 0;
    if (v23 && v22)
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
      Be81a395Bf0(v23);
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  IW1PcFszqNK((uint64_t)self->_context);
  v3.receiver = self;
  v3.super_class = (Class)AASigningSession;
  [(AASigningSession *)&v3 dealloc];
}

- (int)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionURL, 0);

  objc_storeStrong((id *)&self->_certURL, 0);
}

void __36__AASigningSession_establishSession__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __36__AASigningSession_establishSession__block_invoke_60_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Error: failed to initialize absinthe session with error: %@", (uint8_t *)&v2, 0xCu);
}

@end