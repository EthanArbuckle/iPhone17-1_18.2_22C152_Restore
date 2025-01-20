@interface AKAttestationSigner
+ (AKAttestationSigner)sharedSigner;
- (AKAttestationSigner)init;
- (id)_attestationWithCertificates:(id)a3 error:(id *)a4;
- (id)_signatureForData:(id)a3 withReferenceKey:(__SecKey *)a4 error:(id *)a5;
- (void)_baaSignatureForData:(id)a3 completion:(id)a4;
- (void)_baaSignaturesForData:(id)a3 completion:(id)a4;
- (void)signatureForData:(id)a3 options:(id)a4 completion:(id)a5;
- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation AKAttestationSigner

+ (AKAttestationSigner)sharedSigner
{
  if (sharedSigner_onceToken != -1) {
    dispatch_once(&sharedSigner_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedSigner_sharedSigner;

  return (AKAttestationSigner *)v2;
}

uint64_t __35__AKAttestationSigner_sharedSigner__block_invoke()
{
  sharedSigner_sharedSigner = objc_alloc_init(AKAttestationSigner);

  return MEMORY[0x1F41817F8]();
}

- (AKAttestationSigner)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKAttestationSigner;
  v2 = [(AKAttestationSigner *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.authkit.ATTQ", v3);
    attestationQueue = v2->_attestationQueue;
    v2->_attestationQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)signatureForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 objectForKeyedSubscript:@"AKAttestationUseDeviceCheckKeychainAccess"];
  [v11 BOOLValue];

  if ([v8 length])
  {
    v12 = [v9 objectForKeyedSubscript:@"AKAttestationUseDeviceCheckKeychainAccess"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      [(AKAttestationSigner *)self _baaSignatureForData:v8 completion:v10];
    }
    else
    {
      v15 = _AKAttestationOptionsFromOptions(v9);
      attestationQueue = self->_attestationQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __59__AKAttestationSigner_signatureForData_options_completion___block_invoke;
      v17[3] = &unk_1E575F8F8;
      v17[4] = self;
      id v18 = v8;
      id v19 = v10;
      SDeviceIdentityIssueClientCertificateWithCompletion(attestationQueue, v15, v17);
    }
  }
  else
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AKAttestationSigner signatureForData:options:completion:]();
    }

    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
}

void __59__AKAttestationSigner_signatureForData_options_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2 && v7)
  {
    id v9 = (void *)a1[4];
    uint64_t v10 = a1[5];
    id v24 = 0;
    v11 = [v9 _signatureForData:v10 withReferenceKey:a2 error:&v24];
    id v12 = v24;
    if (v11)
    {
      int v13 = (void *)a1[4];
      id v23 = 0;
      v14 = [v13 _attestationWithCertificates:v7 error:&v23];
      id v15 = v23;
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    v16 = _AKLogSystem();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v17) {
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_2();
      }

      uint64_t v18 = a1[6];
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28A50];
      v26[0] = v8;
      v20 = (void *)MEMORY[0x1E4F1C9E8];
      id v21 = v8;
      v22 = [v20 dictionaryWithObjects:v26 forKeys:&v25 count:1];
      id v12 = [v19 errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:v22];
    }
    else
    {
      if (v17) {
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_1();
      }

      uint64_t v18 = a1[6];
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:0];
    }
    (*(void (**)(uint64_t, void, void, id))(v18 + 16))(v18, 0, 0, v12);
  }
}

- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 objectForKeyedSubscript:@"AKAttestationUseDeviceCheckKeychainAccess"];
  [v11 BOOLValue];

  if ([v8 count])
  {
    id v12 = [v9 objectForKeyedSubscript:@"AKAttestationUseDeviceCheckKeychainAccess"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      [(AKAttestationSigner *)self _baaSignaturesForData:v8 completion:v10];
    }
    else
    {
      id v15 = _AKAttestationOptionsFromOptions(v9);
      attestationQueue = self->_attestationQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke;
      v17[3] = &unk_1E575F8F8;
      id v18 = v8;
      id v19 = self;
      id v20 = v10;
      SDeviceIdentityIssueClientCertificateWithCompletion(attestationQueue, v15, v17);
    }
  }
  else
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AKAttestationSigner signaturesForData:options:completion:]();
    }

    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
}

void __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a2 && v7)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__3;
    v30[4] = __Block_byref_object_dispose__3;
    id v31 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_31;
    v29[3] = &unk_1E575F920;
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v29[5] = v30;
    v29[6] = a2;
    v29[4] = v11;
    id v12 = objc_msgSend(v10, "aaf_mapStoppable:", v29);
    uint64_t v13 = [*(id *)(a1 + 32) count];
    if (v13 == [v12 count])
    {
      v14 = *(void **)(a1 + 40);
      id v28 = 0;
      id v15 = [v14 _attestationWithCertificates:v7 error:&v28];
      id v16 = v28;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }

    _Block_object_dispose(v30, 8);
  }
  else
  {
    BOOL v17 = v8 == 0;
    id v18 = _AKLogSystem();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19) {
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_1();
      }

      uint64_t v26 = *(void *)(a1 + 48);
      v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v26 + 16))(v26, 0, 0, v27);
    }
    else
    {
      if (v19) {
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_2();
      }

      uint64_t v20 = *(void *)(a1 + 48);
      id v21 = (void *)MEMORY[0x1E4F28C58];
      v32[0] = *MEMORY[0x1E4F28A50];
      v30[0] = v9;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      id v23 = v9;
      id v24 = [v22 dictionaryWithObjects:v30 forKeys:v32 count:1];
      uint64_t v25 = [v21 errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:v24];

      (*(void (**)(uint64_t, void, void, void *))(v20 + 16))(v20, 0, 0, v25);
    }
  }
}

id __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_31(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = (void *)a1[4];
  uint64_t v7 = a1[6];
  id v14 = 0;
  id v8 = [v6 _signatureForData:a3 withReferenceKey:v7 error:&v14];
  id v9 = v14;
  id v10 = v14;
  if (v8)
  {
    id v11 = v8;
  }
  else
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_31_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v9);
    *a4 = 1;
  }

  return v8;
}

- (void)_baaSignaturesForData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  DCBAASigningControllerClass = (objc_class *)DeviceCheckInternalLibraryCore();
  if (DCBAASigningControllerClass) {
    DCBAASigningControllerClass = (objc_class *)getDCBAASigningControllerClass();
  }
  id v8 = objc_alloc_init(DCBAASigningControllerClass);
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__AKAttestationSigner__baaSignaturesForData_completion___block_invoke;
    v10[3] = &unk_1E575F948;
    id v11 = v6;
    [v8 baaSignaturesForData:v5 completion:v10];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAttestationErrorDomain" code:-10000 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v9);
  }
}

uint64_t __56__AKAttestationSigner__baaSignaturesForData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_baaSignatureForData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  DCBAASigningControllerClass = (objc_class *)DeviceCheckInternalLibraryCore();
  if (DCBAASigningControllerClass) {
    DCBAASigningControllerClass = (objc_class *)getDCBAASigningControllerClass();
  }
  id v8 = objc_alloc_init(DCBAASigningControllerClass);
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__AKAttestationSigner__baaSignatureForData_completion___block_invoke;
    v10[3] = &unk_1E575F970;
    id v11 = v6;
    [v8 baaSignatureForData:v5 completion:v10];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAttestationErrorDomain" code:-10000 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v9);
  }
}

uint64_t __55__AKAttestationSigner__baaSignatureForData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_signatureForData:(id)a3 withReferenceKey:(__SecKey *)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  CFErrorRef v19 = 0;
  CFDataRef v6 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], (CFDataRef)a3, &v19);
  CFDataRef v7 = v6;
  CFErrorRef v8 = v19;
  if (v6)
  {
    CFDataRef v9 = v6;
    goto LABEL_13;
  }
  id v10 = _AKLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11) {
      -[AKAttestationSigner _signatureForData:withReferenceKey:error:]();
    }

    if (a5)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      v21[0] = v8;
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
      id v14 = v8;
      id v15 = [v13 dictionaryWithObjects:v21 forKeys:&v20 count:1];
      uint64_t v16 = [v12 errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:v15];

      BOOL v17 = (void *)v16;
LABEL_12:
      *a5 = v17;
    }
  }
  else
  {
    if (v11) {
      -[AKAttestationSigner _signatureForData:withReferenceKey:error:]();
    }

    if (a5)
    {
      BOOL v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:0];
      goto LABEL_12;
    }
  }
LABEL_13:

  return v7;
}

- (id)_attestationWithCertificates:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a3, "aaf_map:", &__block_literal_global_37);
  uint64_t v20 = @"certs";
  id v21 = v5;
  CFDataRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v19 = 0;
  CFDataRef v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:&v19];
  id v8 = v19;
  if (v7)
  {
    CFDataRef v9 = objc_msgSend(v7, "aaf_toCompressedData:", 517);
    goto LABEL_14;
  }
  id v10 = _AKLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11) {
      -[AKAttestationSigner _attestationWithCertificates:error:]();
    }

    if (a4)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      v23[0] = v8;
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
      id v14 = v8;
      id v15 = [v13 dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v16 = [v12 errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:v15];

      BOOL v17 = (void *)v16;
LABEL_12:
      CFDataRef v9 = 0;
      *a4 = v17;
      goto LABEL_14;
    }
  }
  else
  {
    if (v11) {
      -[AKAttestationSigner _attestationWithCertificates:error:]();
    }

    if (a4)
    {
      BOOL v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAttestationErrorDomain" code:-10001 userInfo:0];
      goto LABEL_12;
    }
  }
  CFDataRef v9 = 0;
LABEL_14:

  return v9;
}

id __58__AKAttestationSigner__attestationWithCertificates_error___block_invoke(int a1, SecCertificateRef certificate)
{
  CFDataRef v2 = SecCertificateCopyData(certificate);
  v3 = [(__CFData *)v2 base64EncodedStringWithOptions:0];

  return v3;
}

- (void).cxx_destruct
{
}

- (void)signatureForData:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "AKAttestationSigner signatureForData: - No data, nothing to sign.", v1, 2u);
}

void __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to BAA, unknown error!", v2, v3, v4, v5, v6);
}

void __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to BAA, error: %@", v2, v3, v4, v5, v6);
}

- (void)signaturesForData:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "AKAttestationSigner signaturesForData: - No data, nothing to sign.", v1, 2u);
}

void __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to generate signatures, bailing!", v2, v3, v4, v5, v6);
}

- (void)_signatureForData:withReferenceKey:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to BAA, failed to generate signature: unknown error!", v2, v3, v4, v5, v6);
}

- (void)_signatureForData:withReferenceKey:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to BAA, failed to generate signature: %@", v2, v3, v4, v5, v6);
}

- (void)_attestationWithCertificates:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to BAA, failed to serialize: unknown error!", v2, v3, v4, v5, v6);
}

- (void)_attestationWithCertificates:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to BAA, failed to serialize: %@", v2, v3, v4, v5, v6);
}

@end