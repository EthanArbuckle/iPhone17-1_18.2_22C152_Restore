@interface DCCertificateGenerator
- (BOOL)_isNSDate:(id)a3;
- (DCCertificateGenerator)initWithContext:(id)a3 publicKey:(id)a4;
- (id)_encryptData:(id)a3 serverSyncedDate:(id)a4 error:(id *)a5;
- (int)keybagHandle;
- (void)_generateCertificateChainWithCompletion:(id)a3;
- (void)dealloc;
- (void)generateEncryptedCertificateChainWithCompletion:(id)a3;
@end

@implementation DCCertificateGenerator

- (DCCertificateGenerator)initWithContext:(id)a3 publicKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(DCCertificateGenerator *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publicKey, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (int)keybagHandle
{
  return 0;
}

- (void)generateEncryptedCertificateChainWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__DCCertificateGenerator_generateEncryptedCertificateChainWithCompletion___block_invoke;
  v6[3] = &unk_264BDC388;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DCCertificateGenerator *)self _generateCertificateChainWithCompletion:v6];
}

void __74__DCCertificateGenerator_generateEncryptedCertificateChainWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    id v9 = 0;
    id v5 = [v4 _encryptData:a2 serverSyncedDate:a3 error:&v9];
    id v6 = v9;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.cryptoerror" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
  }
}

- (BOOL)_isNSDate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_generateCertificateChainWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[DCCryptoUtilities identityCertificateOptions];
  id v5 = v3;
  DeviceIdentityIssueClientCertificateWithCompletion();
}

void __66__DCCertificateGenerator__generateCertificateChainWithCompletion___block_invoke(uint64_t a1, const void *a2, void *a3, void *a4)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _DCLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2330E6000, v7, OS_LOG_TYPE_DEFAULT, "Certificate issued, processing..", buf, 2u);
  }

  id v8 = v6;
  v59 = [MEMORY[0x263EFF910] date];
  if (!v5 || (uint64_t v9 = [v5 count], (v9 & 0xFFFFFFFFFFFFFFFELL) != 2))
  {
    v11 = 0;
    v29 = 0;
    int v37 = 0;
    v36 = v8;
    goto LABEL_25;
  }
  v56 = v8;
  uint64_t v57 = v9;
  char v64 = 0;
  v10 = 0;
  v11 = 0;
  char v12 = 0;
  uint64_t v13 = 0;
  char v14 = 1;
  id v61 = v5;
  uint64_t v62 = *MEMORY[0x263F08320];
  while (1)
  {
    char v15 = v14;
    char v16 = v12;
    v17 = [v5 objectAtIndexedSubscript:v13];

    CFDataRef v18 = SecCertificateCopyData((SecCertificateRef)v17);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    *(_OWORD *)buf = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    *(_OWORD *)__str = 0u;
    if (!v18)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v70 = v62;
      v71 = @"Invalid inputs.";
      v31 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v21 = [v30 errorWithDomain:@"com.apple.devicecheck.cryptoerror" code:0 userInfo:v31];

      v29 = 0;
      goto LABEL_18;
    }
    char v65 = v16;
    v19 = (void *)MEMORY[0x237DB7740]();
    v20 = [(__CFData *)v18 base64EncodedDataWithOptions:1];
    v21 = (char *)[v20 length];
    if (v21)
    {
      v63 = v11;
      int v22 = snprintf((char *)buf, 0x50uLL, "-----BEGIN %s-----\n", "CERTIFICATE");
      int v23 = snprintf(__str, 0x50uLL, "\n-----END %s-----", "CERTIFICATE");
      v24 = &v21[v22 + v23];
      v25 = (char *)malloc_type_malloc((size_t)(v24 + 1), 0x95B21735uLL);
      if (v25)
      {
        v26 = v25;
        v27 = &strncpy(v25, (const char *)buf, v22)[v22];
        objc_msgSend(v20, "getBytes:range:", v27, 0, v21);
        strncpy(&v21[(void)v27], __str, v23);
        uint64_t v28 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v26 length:v24];
        if (v28)
        {
          v29 = (void *)v28;
          v21 = 0;
LABEL_16:
          id v5 = v61;
          v11 = v63;
          goto LABEL_17;
        }
        v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v70 = v62;
        v71 = @"Failed to create pem data.";
        v35 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        v21 = [v34 errorWithDomain:@"com.apple.devicecheck.cryptoerror" code:0 userInfo:v35];

        free(v26);
      }
      else
      {
        v32 = (void *)MEMORY[0x263F087E8];
        uint64_t v70 = v62;
        v71 = @"Failed to allocate buffer.";
        v33 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        v21 = [v32 errorWithDomain:@"com.apple.devicecheck.cryptoerror" code:0 userInfo:v33];
      }
      v29 = 0;
      goto LABEL_16;
    }
    v29 = 0;
LABEL_17:

    char v16 = v65;
LABEL_18:

    if (!v29) {
      break;
    }
    if (v11) {
      [v11 appendBytes:"\n" length:1];
    }
    else {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v29, "length"));
    }
    [v11 appendData:v29];
    char v14 = 0;
    char v12 = 1;
    char v64 = v16;
    v10 = v29;
    uint64_t v13 = 1;
    if ((v15 & 1) == 0)
    {
      id v8 = v56;
      v36 = v56;
      goto LABEL_36;
    }
  }
  v46 = (void *)MEMORY[0x263F087E8];
  uint64_t v68 = v62;
  v69 = @"Failed to create PEM data from cert.";
  v47 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  v36 = [v46 errorWithDomain:@"com.apple.devicecheck.cryptoerror" code:0 userInfo:v47];
  id v8 = v56;

  char v16 = v64;
LABEL_36:
  if (v57 == 3)
  {
    v48 = *(void **)(a1 + 32);
    v49 = [v5 objectAtIndexedSubscript:2];
    LODWORD(v48) = [v48 _isNSDate:v49];

    if (v48)
    {
      uint64_t v50 = [v5 objectAtIndexedSubscript:2];

      v51 = _DCLogSystem();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2330E6000, v51, OS_LOG_TYPE_DEFAULT, "Using synced timestamp...", buf, 2u);
      }

      int v37 = v16 & 1;
      v59 = (void *)v50;
    }
    else
    {
      v53 = (void *)MEMORY[0x263F087E8];
      uint64_t v66 = v62;
      v67 = @"Expected date field, failing...";
      v54 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      uint64_t v55 = [v53 errorWithDomain:@"com.apple.devicecheck.cryptoerror" code:0 userInfo:v54];

      int v37 = 0;
      v36 = (void *)v55;
    }
  }
  else
  {
    v52 = _DCLogSystem();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2330E6000, v52, OS_LOG_TYPE_DEFAULT, "Using device timestamp...", buf, 2u);
    }

    int v37 = v16 & 1;
  }
LABEL_25:
  if (a2) {
    CFRelease(a2);
  }
  v38 = _DCLogSystem();
  v39 = v38;
  if (v37)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v11 length];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v40;
      _os_log_impl(&dword_2330E6000, v39, OS_LOG_TYPE_DEFAULT, "Certificate processed... (%lu)", buf, 0xCu);
    }

    uint64_t v41 = *(void *)(a1 + 40);
    v42 = (void *)[v11 copy];
    v43 = v59;
    v44 = (void *)[v59 copy];
    (*(void (**)(uint64_t, void *, void *))(v41 + 16))(v41, v42, v44);
  }
  else
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      __66__DCCertificateGenerator__generateCertificateChainWithCompletion___block_invoke_cold_1((uint64_t)v36, v39);
    }

    v43 = v59;
    uint64_t v45 = *(void *)(a1 + 40);
    v42 = (void *)[v59 copy];
    (*(void (**)(uint64_t, void, void *))(v45 + 16))(v45, 0, v42);
  }
}

- (id)_encryptData:(id)a3 serverSyncedDate:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v42 = a4;
  id v8 = _DCLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2330E6000, v8, OS_LOG_TYPE_DEFAULT, "Encrypting data...", buf, 2u);
  }

  uint64_t v9 = [(DCContext *)self->_context clientAppID];
  v10 = [v9 dataUsingEncoding:4];

  unsigned int v11 = [v10 length];
  id v41 = v10;
  char v12 = (const void *)[v41 bytes];
  unsigned int v13 = [v7 length];
  id v14 = v7;
  char v15 = (const void *)[v14 bytes];
  uint64_t v45 = 0;
  v46 = 0;
  uint64_t v44 = 0;
  ccaes_gcm_encrypt_mode();
  *(_OWORD *)buf = 0u;
  memset(v50, 0, sizeof(v50));
  size_t v16 = v13 + v11 + 235;
  v17 = malloc_type_calloc(1uLL, v16, 0x5FE01201uLL);
  CFDataRef v18 = v17;
  if (v17)
  {
    *(_DWORD *)((char *)v17 + 150) = v13 + v11 + 81;
    _DWORD *v17 = 2;
    memcpy(v17 + 5, [(NSData *)self->_publicKey bytes], [(NSData *)self->_publicKey length]);
    v19 = (char *)malloc_type_calloc(1uLL, *(unsigned int *)((char *)v18 + 150), 0x5A1EBE7EuLL);
    *(_DWORD *)(v19 + 73) = v13;
    memcpy(v19 + 81, v15, v13);
    *(_DWORD *)(v19 + 77) = v11;
    memcpy(&v19[v13 + 81], v12, v11);
    v20 = v42;
    [v42 timeIntervalSince1970];
    *(void *)(v19 + 65) = v21;
    int v22 = _DCLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(v19 + 65);
      *(_DWORD *)v47 = 134217984;
      uint64_t v48 = v23;
      _os_log_impl(&dword_2330E6000, v22, OS_LOG_TYPE_DEFAULT, "Token timestamp: %f", v47, 0xCu);
    }

    if (aks_ref_key_create([(DCCertificateGenerator *)self keybagHandle], 11, 4u, 0, 0, &v46))
    {
      v24 = _DCLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.6();
      }
LABEL_20:
      v25 = 0;
      goto LABEL_21;
    }
    uint64_t v43 = 0;
    uint64_t public_key = aks_ref_key_get_public_key(v46, &v43);
    if (v43 != 65)
    {
      v24 = _DCLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.5(&v43, v24);
      }
      goto LABEL_20;
    }
    *(_OWORD *)((char *)v18 + 85) = *(_OWORD *)public_key;
    long long v27 = *(_OWORD *)(public_key + 16);
    long long v28 = *(_OWORD *)(public_key + 32);
    long long v29 = *(_OWORD *)(public_key + 48);
    *((unsigned char *)v18 + 149) = *(unsigned char *)(public_key + 64);
    *(_OWORD *)((char *)v18 + 133) = v29;
    *(_OWORD *)((char *)v18 + 117) = v28;
    *(_OWORD *)((char *)v18 + 101) = v27;
    long long v31 = *(_OWORD *)(public_key + 32);
    long long v30 = *(_OWORD *)(public_key + 48);
    long long v32 = *(_OWORD *)(public_key + 16);
    v19[64] = *(unsigned char *)(public_key + 64);
    *((_OWORD *)v19 + 2) = v31;
    *((_OWORD *)v19 + 3) = v30;
    *((_OWORD *)v19 + 1) = v32;
    *(_OWORD *)v19 = *(_OWORD *)public_key;
    printf("%-25.25s = ", "random_pubkey");
    for (uint64_t i = 85; i != 150; ++i)
      printf("%02x", *((unsigned __int8 *)v18 + i));
    putchar(10);
    v34 = (uint64_t *)v46;
    v35 = [(NSData *)self->_publicKey bytes];
    [(NSData *)self->_publicKey length];
    if (aks_ref_key_compute_key(v34, 0, 0, (uint64_t)v35))
    {
      v24 = _DCLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.4();
      }
      goto LABEL_20;
    }
    int v37 = (char *)v45;
    uint64_t v38 = v44 - 2;
    printf("%-25.25s = ", "ECDH shared key");
    if (v38)
    {
      v39 = (unsigned __int8 *)(v37 + 2);
      do
      {
        int v40 = *v39++;
        printf("%02x", v40);
        --v38;
      }
      while (v38);
    }
    putchar(10);
    if (cchkdf())
    {
      v24 = _DCLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:]();
      }
      goto LABEL_20;
    }
    hex((std::ios_base *)"HKDF derived key");
    hex((std::ios_base *)"HKDF derived iv");
    if (ccgcm_one_shot())
    {
      v24 = _DCLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:]();
      }
      goto LABEL_20;
    }
    hex((std::ios_base *)"tag");
    fprintf((FILE *)*MEMORY[0x263EF8348], "encrypted_data_len: %d\n", *(_DWORD *)((char *)v18 + 150));
    v25 = [MEMORY[0x263EFF8F8] dataWithBytes:v18 length:v16];
    v24 = _DCLogSystem();
    _DCLogDebugBinary(v24, @"Token", v25);
  }
  else
  {
    v24 = _DCLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[DCCertificateGenerator _encryptData:serverSyncedDate:error:](v24);
    }
    v19 = 0;
    v25 = 0;
    v20 = v42;
  }
LABEL_21:

  if (v46) {
    aks_ref_key_free((uint64_t *)&v46);
  }
  if (v18) {
    free(v18);
  }
  if (v19) {
    free(v19);
  }
  if (v45) {
    free(v45);
  }

  return v25;
}

- (void)dealloc
{
  id v3 = _DCLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2330E6000, v3, OS_LOG_TYPE_DEFAULT, "DCCertificateGenerator generator going away...", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)DCCertificateGenerator;
  [(DCCertificateGenerator *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_publicKey, 0);
}

void __66__DCCertificateGenerator__generateCertificateChainWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2330E6000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain valid certificates from server: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_encryptData:(os_log_t)log serverSyncedDate:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2330E6000, log, OS_LOG_TYPE_ERROR, "out_data_to_send is NULL!\n", v1, 2u);
}

- (void)_encryptData:serverSyncedDate:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2330E6000, v0, v1, "Failed to perform AES-GSM encryption with shared key: %d\n", v2, v3, v4, v5, v6);
}

- (void)_encryptData:serverSyncedDate:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2330E6000, v0, v1, "Failed to perform HKDF with shared key: %d\n", v2, v3, v4, v5, v6);
}

- (void)_encryptData:serverSyncedDate:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2330E6000, v0, v1, "Failed to perform ECDH with server pubkey: %d\n", v2, v3, v4, v5, v6);
}

- (void)_encryptData:(uint64_t *)a1 serverSyncedDate:(NSObject *)a2 error:.cold.5(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = 65;
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_2330E6000, a2, OS_LOG_TYPE_ERROR, "Unexpected pubkey size. expected %ld got %ld\n", (uint8_t *)&v3, 0x16u);
}

- (void)_encryptData:serverSyncedDate:error:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2330E6000, v0, v1, "Failed to create ECDH key: %d\n", v2, v3, v4, v5, v6);
}

@end