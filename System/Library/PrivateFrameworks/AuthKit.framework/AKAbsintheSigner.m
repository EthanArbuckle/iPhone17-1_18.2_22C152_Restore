@interface AKAbsintheSigner
+ (id)sharedSigner;
- (BOOL)_didSigningContextExpire;
- (id)_sessionInfoFromCertificateData:(id)a3;
- (id)signatureForURLRequest:(id)a3;
- (void)_createSigningContextWithCompletionHandler:(id)a3;
- (void)_destroySigningContext;
- (void)_establishSessionWithInfo:(id)a3 sessionURL:(id)a4 completionHandler:(id)a5;
- (void)_generateSignatureForRequest:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)signatureForURLRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation AKAbsintheSigner

+ (id)sharedSigner
{
  if (sharedSigner_onceToken_0 != -1) {
    dispatch_once(&sharedSigner_onceToken_0, &__block_literal_global_38);
  }
  v2 = (void *)sharedSigner_sharedSigner_0;

  return v2;
}

uint64_t __32__AKAbsintheSigner_sharedSigner__block_invoke()
{
  sharedSigner_sharedSigner_0 = objc_alloc_init(AKAbsintheSigner);

  return MEMORY[0x1F41817F8]();
}

- (id)signatureForURLRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__AKAbsintheSigner_signatureForURLRequest___block_invoke;
  v9[3] = &unk_1E5761930;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  [(AKAbsintheSigner *)self signatureForURLRequest:v4 completionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__AKAbsintheSigner_signatureForURLRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)signatureForURLRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__AKAbsintheSigner_signatureForURLRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E5761958;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AKAbsintheSigner *)self _createSigningContextWithCompletionHandler:v10];
}

uint64_t __61__AKAbsintheSigner_signatureForURLRequest_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _generateSignatureForRequest:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_generateSignatureForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 valueForHTTPHeaderField:@"X-MMe-Client-Info"];
  id v9 = [v8 dataUsingEncoding:4];

  if (!v9)
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKAbsintheSigner _generateSignatureForRequest:completionHandler:]();
    }

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:"L" length:1];
  }
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Generating signature for body of URL request: %@...", buf, 0xCu);
  }

  *(void *)buf = 0;
  context = self->_context;
  id v13 = v9;
  t1BoNctgaUu66((uint64_t)context, [v13 bytes], objc_msgSend(v13, "length"), (uint64_t)buf);
  if (v14)
  {
    uint64_t v15 = v14;
    v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AKAbsintheSigner _generateSignatureForRequest:completionHandler:](v15);
    }

    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAbsintheErrorDomain" code:-9002 userInfo:0];
    v7[2](v7, 0, v17);
  }
  else
  {
    if (*(void *)buf)
    {
      id v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)buf length:0];
      Be81a395Bf0(*(uint64_t *)buf);
    }
    else
    {
      id v17 = 0;
    }
    v18 = [v17 base64EncodedStringWithOptions:0];
    ((void (**)(id, void *, void *))v7)[2](v7, v18, 0);
  }
}

- (void)_createSigningContextWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!self->_context) {
    goto LABEL_4;
  }
  if ([(AKAbsintheSigner *)self _didSigningContextExpire])
  {
    [(AKAbsintheSigner *)self _destroySigningContext];
LABEL_4:
    dispatch_semaphore_t v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Creating new signing context...", buf, 2u);
    }

    id v6 = +[AKURLBag bagForAltDSID:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5761778;
    v8[4] = self;
    id v9 = v4;
    [v6 requestNewURLBagIfNecessaryWithCompletion:v8];

    goto LABEL_10;
  }
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AKAbsintheSigner _createSigningContextWithCompletionHandler:]();
  }

  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
LABEL_10:
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = +[AKURLBag bagForAltDSID:0];
    id v7 = [v6 absintheCertURL];

    if (v7)
    {
      id v8 = +[AKURLBag bagForAltDSID:0];
      id v9 = [v8 absintheSessionURL];

      if (v9)
      {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v7];
        objc_msgSend(v10, "ak_addClientInfoHeader");
        id v11 = +[AKURLSession sharedURLSession];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10;
        v16[3] = &unk_1E575F9D0;
        v16[4] = *(void *)(a1 + 32);
        id v17 = v9;
        id v18 = *(id *)(a1 + 40);
        id v12 = (id)[v11 beginDataTaskWithRequest:v10 completionHandler:v16];
      }
      else
      {
        uint64_t v15 = _AKLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_2();
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      uint64_t v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_3();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v7 && !v9)
  {
    id v11 = [*(id *)(a1 + 32) _sessionInfoFromCertificateData:v7];
    if (v11)
    {
      [*(id *)(a1 + 32) _establishSessionWithInfo:v11 sessionURL:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAbsintheErrorDomain" code:-9003 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
    goto LABEL_11;
  }
  if (!v9)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAbsintheErrorDomain" code:-9004 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v11);
LABEL_11:

    goto LABEL_12;
  }
  id v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10_cold_1(v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_12:
}

- (id)_sessionInfoFromCertificateData:(id)a3
{
  id v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AKAbsintheSigner _sessionInfoFromCertificateData:](v3, v4);
  }

  id v5 = v3;
  KxmB0CKvgWt([v5 bytes], objc_msgSend(v5, "length"));
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKAbsintheSigner _sessionInfoFromCertificateData:](v7);
    }
  }
  else
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKAbsintheSigner _sessionInfoFromCertificateData:]();
    }
  }

  return 0;
}

- (void)_establishSessionWithInfo:(id)a3 sessionURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F18D50];
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v9 alloc] initWithURL:v10];

  uint64_t v13 = [v11 base64EncodedStringWithOptions:0];

  [v12 setValue:v13 forHTTPHeaderField:@"X-MMe-Nas-Session"];
  objc_msgSend(v12, "ak_addClientInfoHeader");
  uint64_t v14 = +[AKURLSession sharedURLSession];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke;
  v17[3] = &unk_1E5761980;
  v17[4] = self;
  id v18 = v8;
  id v15 = v8;
  id v16 = (id)[v14 beginDataTaskWithRequest:v12 completionHandler:v17];
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7)
  {
    id v45 = 0;
    id v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v45];
    id v12 = v45;
    if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v13 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      v21 = _AKLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_6();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_14;
    }
    uint64_t v13 = [v11 objectForKeyedSubscript:@"session-info"];
    if (!v13)
    {
      v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
      }

      uint64_t v31 = *(void *)(a1 + 40);
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAbsintheErrorDomain" code:-9005 userInfo:0];
      (*(void (**)(uint64_t, void, id))(v31 + 16))(v31, 0, v14);
      goto LABEL_30;
    }
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
    id v15 = _AKLogSystem();
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_5();
      }

      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
      id v14 = v14;
      nDYmeMqvWb(v17, [v14 bytes], objc_msgSend(v14, "length"));
      uint64_t v19 = v18;
      uint64_t v20 = _AKLogSystem();
      id v16 = v20;
      if (!v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v44 = 0;
          _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "NACKeyEstablishment for new context. Ready for use!", v44, 2u);
        }

        uint64_t v41 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v42 = *(void *)(a1 + 32);
        v43 = *(void **)(v42 + 16);
        *(void *)(v42 + 16) = v41;

        (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0);
        goto LABEL_30;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_4(v19);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_3(v16, v32, v33, v34, v35, v36, v37, v38);
    }

    uint64_t v39 = *(void *)(a1 + 40);
    v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAbsintheErrorDomain" code:-9005 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v39 + 16))(v39, 0, v40);

LABEL_30:
LABEL_14:

    goto LABEL_20;
  }
  if (v9)
  {
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_20:
}

- (void)_destroySigningContext
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Attempting to destroy absinthe context", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  [(AKAbsintheSigner *)self _destroySigningContext];
  v3.receiver = self;
  v3.super_class = (Class)AKAbsintheSigner;
  [(AKAbsintheSigner *)&v3 dealloc];
}

- (BOOL)_didSigningContextExpire
{
  objc_super v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_contextCreationDate];
  LOBYTE(self) = v4 > 240.0;

  return (char)self;
}

- (void).cxx_destruct
{
}

- (void)_generateSignatureForRequest:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "NACSign failed with status %@.", v4, v5, v6, v7, v8);
}

- (void)_generateSignatureForRequest:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Nothing to sign. Using dummy data.", v2, v3, v4, v5, v6);
}

- (void)_createSigningContextWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Using a previously generated Absinthe context", v2, v3, v4, v5, v6);
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "No URL for Absinthe signing cert!", v2, v3, v4, v5, v6);
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "No URL for Absinthe signing session!", v2, v3, v4, v5, v6);
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to fetch URL bag prior to Absinthe signing", v2, v3, v4, v5, v6);
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "No Absinthe cert! Error: %@", v4, v5, v6, v7, v8);
}

- (void)_sessionInfoFromCertificateData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "NACInit did not return an session info bytes!", v2, v3, v4, v5, v6);
}

- (void)_sessionInfoFromCertificateData:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "NACInit failed with status: %@", v4, v5, v6, v7, v8);
}

- (void)_sessionInfoFromCertificateData:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "length"));
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "Got Absinthe cert: %@ bytes", v4, 0xCu);
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Request for Absinthe session failed with error: %@", v2, v3, v4, v5, v6);
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_4(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "NACKeyEstablishment failed with result: %@", v4, v5, v6, v7, v8);
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Calling NACKeyEstablishment...", v2, v3, v4, v5, v6);
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_6()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_193494000, v1, OS_LOG_TYPE_ERROR, "Could not parse Absinthe session response data: %@. Details: %@", v2, 0x16u);
}

@end