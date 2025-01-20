@interface DCBAASigner
+ (DCBAASigner)sharedSigner;
- (id)_attestationWithCertificates:(id)a3 error:(id *)a4;
- (id)_signatureForData:(id)a3 withReferenceKey:(__SecKey *)a4 error:(id *)a5;
- (void)signatureForData:(id)a3 completion:(id)a4;
- (void)signaturesForData:(id)a3 completion:(id)a4;
@end

@implementation DCBAASigner

+ (DCBAASigner)sharedSigner
{
  if (sharedSigner_onceToken != -1) {
    dispatch_once(&sharedSigner_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedSigner_sharedSigner;

  return (DCBAASigner *)v2;
}

uint64_t __27__DCBAASigner_sharedSigner__block_invoke()
{
  sharedSigner_sharedSigner = objc_alloc_init(DCBAASigner);

  return MEMORY[0x270F9A758]();
}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if (DeviceIdentityIsSupported())
    {
      v7 = +[DCCryptoUtilities identityCertificateOptions];
      id v11 = v5;
      id v12 = v6;
      DeviceIdentityIssueClientCertificateWithCompletion();
    }
    else
    {
      v9 = _DCLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[DCBAASigner signatureForData:completion:]();
      }

      v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10000 userInfo:0];
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v10);
    }
  }
  else
  {
    v8 = _DCLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[DCBAASigner signatureForData:completion:]();
    }

    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

void __43__DCBAASigner_signatureForData_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  v33[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a2 && v7)
  {
    v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    id v31 = 0;
    id v12 = [v10 _signatureForData:v11 withReferenceKey:a2 error:&v31];
    id v13 = v31;
    if (v12)
    {
      v14 = (void *)a1[4];
      id v30 = 0;
      v15 = [v14 _attestationWithCertificates:v7 error:&v30];
      id v16 = v30;
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    if (v8)
    {
      int HasDomainAndErrorCode = mobileactivationErrorHasDomainAndErrorCode();
      v18 = _DCLogSystem();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      if (HasDomainAndErrorCode)
      {
        if (v19) {
          __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();
        }

        uint64_t v20 = a1[6];
        v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F08608];
        v33[0] = v9;
        v22 = NSDictionary;
        id v23 = v9;
        v24 = [v22 dictionaryWithObjects:v33 forKeys:&v32 count:1];
        v25 = v21;
        uint64_t v26 = -10002;
      }
      else
      {
        if (v19) {
          __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();
        }

        uint64_t v20 = a1[6];
        v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F08608];
        v33[0] = v9;
        v29 = NSDictionary;
        id v23 = v9;
        v24 = [v29 dictionaryWithObjects:v33 forKeys:&v32 count:1];
        v25 = v28;
        uint64_t v26 = -10001;
      }
      id v13 = [v25 errorWithDomain:@"com.apple.devicecheck.error.baa" code:v26 userInfo:v24];
    }
    else
    {
      v27 = _DCLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __43__DCBAASigner_signatureForData_completion___block_invoke_cold_1();
      }

      uint64_t v20 = a1[6];
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10001 userInfo:0];
    }
    (*(void (**)(uint64_t, void, void, id))(v20 + 16))(v20, 0, 0, v13);
  }
}

- (void)signaturesForData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if (DeviceIdentityIsSupported())
    {
      id v7 = +[DCCryptoUtilities identityCertificateOptions];
      id v11 = v5;
      id v12 = v6;
      DeviceIdentityIssueClientCertificateWithCompletion();
    }
    else
    {
      v9 = _DCLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[DCBAASigner signatureForData:completion:]();
      }

      v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10000 userInfo:0];
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v10);
    }
  }
  else
  {
    id v8 = _DCLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[DCBAASigner signaturesForData:completion:]();
    }

    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a2 && v7)
  {
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy_;
    v46[4] = __Block_byref_object_dispose_;
    id v47 = 0;
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __44__DCBAASigner_signaturesForData_completion___block_invoke_5;
    v37[3] = &unk_264BDC200;
    id v11 = *(void **)(a1 + 32);
    v37[4] = *(void *)(a1 + 40);
    uint64_t v40 = a2;
    id v12 = v10;
    id v38 = v12;
    v39 = v46;
    [v11 enumerateKeysAndObjectsUsingBlock:v37];
    uint64_t v13 = [*(id *)(a1 + 32) count];
    if (v13 == [v12 count])
    {
      v14 = *(void **)(a1 + 40);
      id v36 = 0;
      v15 = [v14 _attestationWithCertificates:v7 error:&v36];
      id v16 = v36;
      if (v15)
      {
        v17 = _DCLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v12;
          __int16 v42 = 2112;
          v43 = v15;
          __int16 v44 = 2112;
          id v45 = v16;
          _os_log_debug_impl(&dword_2330E6000, v17, OS_LOG_TYPE_DEBUG, "Signing Completed in DeviceCheckd - SignatureData: %@, AttestationData: %@, Error:%@", buf, 0x20u);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }

    _Block_object_dispose(v46, 8);
  }
  else if (v8)
  {
    int HasDomainAndErrorCode = mobileactivationErrorHasDomainAndErrorCode();
    BOOL v19 = _DCLogSystem();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (HasDomainAndErrorCode)
    {
      if (v20) {
        __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();
      }

      uint64_t v21 = *(void *)(a1 + 48);
      v22 = (void *)MEMORY[0x263F087E8];
      *(void *)buf = *MEMORY[0x263F08608];
      v46[0] = v9;
      id v23 = NSDictionary;
      id v24 = v9;
      v25 = [v23 dictionaryWithObjects:v46 forKeys:buf count:1];
      uint64_t v26 = [v22 errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10002 userInfo:v25];

      (*(void (**)(uint64_t, void, void, void *))(v21 + 16))(v21, 0, 0, v26);
    }
    else
    {
      if (v20) {
        __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();
      }

      uint64_t v30 = *(void *)(a1 + 48);
      id v31 = (void *)MEMORY[0x263F087E8];
      *(void *)buf = *MEMORY[0x263F08608];
      v46[0] = v9;
      uint64_t v32 = NSDictionary;
      id v33 = v9;
      v34 = [v32 dictionaryWithObjects:v46 forKeys:buf count:1];
      v35 = [v31 errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10001 userInfo:v34];

      (*(void (**)(uint64_t, void, void, void *))(v30 + 16))(v30, 0, 0, v35);
    }
  }
  else
  {
    v27 = _DCLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __43__DCBAASigner_signatureForData_completion___block_invoke_cold_1();
    }

    uint64_t v28 = *(void *)(a1 + 48);
    v29 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10001 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v28 + 16))(v28, 0, 0, v29);
  }
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = _DCLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_3();
  }

  id v10 = v8;
  if (![v10 length])
  {
    id v11 = _DCLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_2();
    }

    *a4 = 1;
  }
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 56);
  id v18 = 0;
  v14 = [v12 _signatureForData:v10 withReferenceKey:v13 error:&v18];
  id v15 = v18;
  id v16 = v18;
  if (v14)
  {
    [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v7];
  }
  else
  {
    v17 = _DCLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v15);
    *a4 = 1;
  }
}

- (id)_signatureForData:(id)a3 withReferenceKey:(__SecKey *)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  CFErrorRef v19 = 0;
  CFDataRef v6 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x263F172E8], (CFDataRef)a3, &v19);
  CFDataRef v7 = v6;
  CFErrorRef v8 = v19;
  if (v6)
  {
    CFDataRef v9 = v6;
    goto LABEL_12;
  }
  id v10 = _DCLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11) {
      -[DCBAASigner _signatureForData:withReferenceKey:error:]();
    }

    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08608];
    v21[0] = v8;
    uint64_t v13 = NSDictionary;
    v14 = v8;
    id v15 = [v13 dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v16 = [v12 errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10001 userInfo:v15];

    v17 = (void *)v16;
    goto LABEL_11;
  }
  if (v11) {
    -[DCBAASigner _signatureForData:withReferenceKey:error:]();
  }

  if (a5)
  {
    v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10001 userInfo:0];
LABEL_11:
    *a5 = v17;
  }
LABEL_12:

  return v7;
}

- (id)_attestationWithCertificates:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  CFDataRef v7 = [v5 objectAtIndexedSubscript:0];
  CFDataRef v8 = SecCertificateCopyData(v7);
  CFDataRef v9 = [(__CFData *)v8 base64EncodedStringWithOptions:0];
  [v6 addObject:v9];

  id v10 = [v5 objectAtIndexedSubscript:1];
  CFDataRef v11 = SecCertificateCopyData(v10);
  id v12 = [(__CFData *)v11 base64EncodedStringWithOptions:0];
  [v6 addObject:v12];

  uint64_t v28 = @"certs";
  id v29 = v6;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v27 = 0;
  v14 = [MEMORY[0x263F08900] dataWithJSONObject:v13 options:0 error:&v27];
  id v15 = v27;
  if (v14)
  {
    uint64_t v16 = objc_msgSend(v14, "dc_compressedData:", 517);
    goto LABEL_14;
  }
  v17 = _DCLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[DCBAASigner _attestationWithCertificates:error:]();
  }

  id v18 = _DCLogSystem();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    if (v19) {
      -[DCBAASigner _attestationWithCertificates:error:]();
    }

    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08608];
    v31[0] = v15;
    uint64_t v21 = NSDictionary;
    id v22 = v15;
    id v23 = [v21 dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v24 = [v20 errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10001 userInfo:v23];

    v25 = (void *)v24;
    goto LABEL_13;
  }
  if (v19) {
    -[DCBAASigner _attestationWithCertificates:error:]();
  }

  if (a4)
  {
    v25 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error.baa" code:-10001 userInfo:0];
LABEL_13:
    uint64_t v16 = 0;
    *a4 = v25;
    goto LABEL_14;
  }
  uint64_t v16 = 0;
LABEL_14:

  return v16;
}

- (void)signatureForData:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2330E6000, v0, OS_LOG_TYPE_DEBUG, "DCBAASigner signatureForData: - No data, nothing to sign.", v1, 2u);
}

- (void)signatureForData:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2330E6000, v0, v1, "Platform not supported by Device Identity", v2, v3, v4, v5, v6);
}

void __43__DCBAASigner_signatureForData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2330E6000, v0, v1, "Failed to BAA, unknown error!", v2, v3, v4, v5, v6);
}

void __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2330E6000, v0, v1, "Failed to BAA, error: %@", v2, v3, v4, v5, v6);
}

- (void)signaturesForData:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2330E6000, v0, OS_LOG_TYPE_DEBUG, "signaturesForData: - No data, nothing to sign.", v1, 2u);
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2330E6000, v0, v1, "Failed to generate signatures, bailing!", v2, v3, v4, v5, v6);
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2330E6000, v0, v1, "Nothing to sign for key: %@, bailing!", v2, v3, v4, v5, v6);
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2330E6000, v1, OS_LOG_TYPE_DEBUG, "%@ = %@", v2, 0x16u);
}

- (void)_signatureForData:withReferenceKey:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2330E6000, v0, v1, "Failed to BAA, failed to generate signature: unknown error!", v2, v3, v4, v5, v6);
}

- (void)_signatureForData:withReferenceKey:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2330E6000, v0, v1, "Failed to BAA, failed to generate signature: %@", v2, v3, v4, v5, v6);
}

- (void)_attestationWithCertificates:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2330E6000, v0, v1, "Failed to BAA, failed to serialize: unknown error!", v2, v3, v4, v5, v6);
}

- (void)_attestationWithCertificates:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2330E6000, v0, v1, "Failed to BAA, failed to serialize: %@", v2, v3, v4, v5, v6);
}

- (void)_attestationWithCertificates:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2330E6000, v0, v1, "Attestation Error %@", v2, v3, v4, v5, v6);
}

@end