@interface AppAttest
@end

@implementation AppAttest

void __AppAttest_WebAuthentication_AttestKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x223C94B60]();
  uint64_t v8 = isNSDictionary(v5);
  if (v8)
  {
    v12 = (void *)v8;
    v13 = [v5 objectForKeyedSubscript:@"certs"];
    v14 = isNSString(v13);

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x263EFF8F8]);
      v16 = [v5 objectForKeyedSubscript:@"certs"];
      v17 = (void *)[v15 initWithBase64EncodedData:v16 options:1];

      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v18 + 40);
      v19 = lockcrypto_decode_pems(v17, "CERTIFICATE", &obj);
      objc_storeStrong((id *)(v18 + 40), obj);
      id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (!v23)
      {
        uint64_t v24 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 154, -1, 0, @"Failed to allocate array.", v20, v21, v22, v53);
        uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
        v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        v55 = v17;
        v56 = v7;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v54 = v19;
        id v27 = v19;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v58;
          CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          while (2)
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v58 != v30) {
                objc_enumerationMutation(v27);
              }
              SecCertificateRef v33 = SecCertificateCreateWithData(v31, *(CFDataRef *)(*((void *)&v57 + 1) + 8 * i));
              if (!v33)
              {
                uint64_t v43 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 166, -1, 0, @"Failed to create certificate.", v34, v35, v36, v53);
                uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 8);
                v45 = *(void **)(v44 + 40);
                *(void *)(v44 + 40) = v43;

                goto LABEL_21;
              }
              SecCertificateRef v37 = v33;
              [v23 addObject:v33];
              CFRelease(v37);
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        v17 = v55;
        v7 = v56;
        v19 = v54;
        if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
        {
          if ([v23 count] == 2)
          {
LABEL_25:

            goto LABEL_26;
          }
          uint64_t v49 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 178, -1, 0, @"The received cert chain length must be 2!", v46, v47, v48, v53);
          uint64_t v50 = *(void *)(*(void *)(a1 + 40) + 8);
          v51 = *(void **)(v50 + 40);
          *(void *)(v50 + 40) = v49;
        }
      }

      id v23 = 0;
      goto LABEL_25;
    }
  }
  if (v6
    && ([v6 domain],
        v38 = objc_claimAutoreleasedReturnValue(),
        int v39 = [v38 isEqualToString:@"com.apple.appattest.error"],
        v38,
        v39))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v40 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 146, -6, v6, @"Invalid server response", v9, v10, v11, v53);
    uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 8);
    v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;
  }
  id v23 = 0;
LABEL_26:
  v52 = _DCAALogSystem();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    __AppAttest_WebAuthentication_AttestKey_block_invoke_cold_1(a1, v52);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __AppAttest_DeviceAttestation_AttestKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x223C94B60]();
  uint64_t v8 = isNSDictionary(v5);
  if (v8)
  {
    v12 = (void *)v8;
    v13 = [v5 objectForKeyedSubscript:@"certs"];
    v14 = isNSString(v13);

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x263EFF8F8]);
      v16 = [v5 objectForKeyedSubscript:@"certs"];
      v17 = (void *)[v15 initWithBase64EncodedData:v16 options:1];

      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v18 + 40);
      v19 = lockcrypto_decode_pems(v17, "CERTIFICATE", &obj);
      objc_storeStrong((id *)(v18 + 40), obj);
      id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (!v23)
      {
        uint64_t v24 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 279, -1, 0, @"Failed to allocate array.", v20, v21, v22, v53);
        uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
        v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        v55 = v17;
        v56 = v7;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v54 = v19;
        id v27 = v19;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v58;
          CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          while (2)
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v58 != v30) {
                objc_enumerationMutation(v27);
              }
              SecCertificateRef v33 = SecCertificateCreateWithData(v31, *(CFDataRef *)(*((void *)&v57 + 1) + 8 * i));
              if (!v33)
              {
                uint64_t v43 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 291, -1, 0, @"Failed to create certificate.", v34, v35, v36, v53);
                uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 8);
                v45 = *(void **)(v44 + 40);
                *(void *)(v44 + 40) = v43;

                goto LABEL_21;
              }
              SecCertificateRef v37 = v33;
              [v23 addObject:v33];
              CFRelease(v37);
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        v17 = v55;
        v7 = v56;
        v19 = v54;
        if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
        {
          if ([v23 count] == 2)
          {
LABEL_25:

            goto LABEL_26;
          }
          uint64_t v49 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 303, -1, 0, @"The received cert chain length must be 2!", v46, v47, v48, v53);
          uint64_t v50 = *(void *)(*(void *)(a1 + 40) + 8);
          v51 = *(void **)(v50 + 40);
          *(void *)(v50 + 40) = v49;
        }
      }

      id v23 = 0;
      goto LABEL_25;
    }
  }
  if (v6
    && ([v6 domain],
        v38 = objc_claimAutoreleasedReturnValue(),
        int v39 = [v38 isEqualToString:@"com.apple.appattest.error"],
        v38,
        v39))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v40 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 271, -6, v6, @"Invalid server response", v9, v10, v11, v53);
    uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 8);
    v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;
  }
  id v23 = 0;
LABEL_26:
  v52 = _DCAALogSystem();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    __AppAttest_DeviceAttestation_AttestKey_block_invoke_cold_1(a1, v52);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __AppAttest_AppAttestation_AttestKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = isNSDictionary(v5);

  if (!v7)
  {
    if (v6
      && ([v6 domain],
          CFAllocatorRef v31 = objc_claimAutoreleasedReturnValue(),
          int v32 = [v31 isEqualToString:@"com.apple.appattest.error"],
          v31,
          v32))
    {
      SecCertificateRef v33 = v6;
    }
    else
    {
      SecCertificateRef v33 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 290, -6, v6, @"Invalid server response", v8, v9, v10, v63);
    }
    uint64_t v30 = v33;
    uint64_t v25 = _DCAALogSystem();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:@"attestationDataReceipt"];
  uint64_t v12 = isNSString(v11);
  if (!v12)
  {

LABEL_15:
    uint64_t v30 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 296, -6, 0, @"Invalid response", v16, v17, v18, v63);
    uint64_t v25 = _DCAALogSystem();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      uint64_t v29 = 0;
      goto LABEL_29;
    }
LABEL_16:
    __AppAttest_AppAttestation_AttestKey_block_invoke_cold_2(v6);
    goto LABEL_17;
  }
  v13 = (void *)v12;
  v14 = [v5 objectForKeyedSubscript:@"certs"];
  id v15 = isNSString(v14);

  if (!v15) {
    goto LABEL_15;
  }
  id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v20 = [v5 objectForKeyedSubscript:@"attestationDataReceipt"];
  uint64_t v21 = (void *)[v19 initWithBase64EncodedData:v20 options:1];

  id v22 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v23 = [v5 objectForKeyedSubscript:@"certs"];
  uint64_t v24 = (void *)[v22 initWithBase64EncodedData:v23 options:1];

  id v68 = 0;
  uint64_t v25 = lockcrypto_decode_pems(v24, "CERTIFICATE", &v68);
  id v26 = v68;
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = _DCAALogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __AppAttest_AppAttestation_AttestKey_block_invoke_cold_5(v27);
    }

    uint64_t v29 = 0;
    uint64_t v30 = v27;
  }
  else
  {
    if ([v25 count] == 2)
    {
      id v27 = [objc_alloc(NSNumber) initWithUnsignedInt:1];
      if (saveAssertionCounterKeychain(v27, *(_DWORD *)(a1 + 96), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 32)))
      {
        uint64_t v40 = *(void **)(a1 + 72);
        id v67 = 0;
        uint64_t v41 = generateAttestationObject(v40, v25, v21, &v67);
        id v42 = v67;
        uint64_t v43 = v42;
        if (v41)
        {
          uint64_t v29 = v41;

          uint64_t v30 = 0;
          id v27 = v29;
        }
        else
        {
          uint64_t v30 = v42;
          v52 = _DCAALogSystem();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            long long v58 = [v30 localizedDescription];
            int v64 = *(_DWORD *)(a1 + 96);
            uint64_t v66 = *(void *)(a1 + 32);
            int v59 = [*(id *)(a1 + 40) intValue];
            uint64_t v60 = *(void *)(a1 + 48);
            uint64_t v61 = *(void *)(a1 + 56);
            uint64_t v62 = *(void *)(a1 + 64);
            *(_DWORD *)buf = 138413826;
            *(void *)v70 = v58;
            *(_WORD *)&v70[8] = 1024;
            *(_DWORD *)&v70[10] = v64;
            __int16 v71 = 2112;
            *(void *)v72 = v66;
            *(_WORD *)&v72[8] = 1024;
            *(_DWORD *)&v72[10] = v59;
            __int16 v73 = 2112;
            uint64_t v74 = v60;
            __int16 v75 = 2112;
            uint64_t v76 = v61;
            __int16 v77 = 2112;
            uint64_t v78 = v62;
            _os_log_error_impl(&dword_22216A000, v52, OS_LOG_TYPE_ERROR, "Failed to generate attestation object. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x40u);
          }
          uint64_t v29 = 0;
          id v27 = v30;
        }
        goto LABEL_28;
      }
      uint64_t v30 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 321, -3, 0, @"Unable to set counter for authenticator data", v37, v38, v39, v63);
      uint64_t v44 = _DCAALogSystem();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        int v53 = *(_DWORD *)(a1 + 96);
        uint64_t v65 = *(void *)(a1 + 32);
        int v54 = [v27 intValue];
        uint64_t v55 = *(void *)(a1 + 48);
        uint64_t v56 = *(void *)(a1 + 56);
        uint64_t v57 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v70 = v53;
        *(_WORD *)&v70[4] = 2112;
        *(void *)&v70[6] = v65;
        __int16 v71 = 1024;
        *(_DWORD *)v72 = v54;
        *(_WORD *)&v72[4] = 2112;
        *(void *)&v72[6] = v55;
        __int16 v73 = 2112;
        uint64_t v74 = v56;
        __int16 v75 = 2112;
        uint64_t v76 = v57;
        _os_log_error_impl(&dword_22216A000, v44, OS_LOG_TYPE_ERROR, "Failed to update assertion counter. { env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x36u);
      }
    }
    else
    {
      uint64_t v30 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 315, -3, 0, @"The received cert chain length must be 2!", v34, v35, v36, v63);
      id v27 = _DCAALogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __AppAttest_AppAttestation_AttestKey_block_invoke_cold_4();
      }
    }
    uint64_t v29 = 0;
  }
LABEL_28:

LABEL_29:
  v45 = _DCAALogSystem();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
    __AppAttest_AppAttestation_AttestKey_block_invoke_cold_1((uint64_t)v30, v45, v46, v47, v48, v49, v50, v51);
  }

  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
}

void __AppAttest_WebAuthentication_AttestKey_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    v2 = "FAILED";
  }
  else {
    v2 = "SUCCESS";
  }
  int v3 = 136315138;
  v4 = v2;
  _os_log_debug_impl(&dword_22216A000, a2, OS_LOG_TYPE_DEBUG, "AppAttest_WebAuthentication_AttestKey - (%s)\n", (uint8_t *)&v3, 0xCu);
}

void __AppAttest_DeviceAttestation_AttestKey_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    v2 = "FAILED";
  }
  else {
    v2 = "SUCCESS";
  }
  int v3 = 136315138;
  v4 = v2;
  _os_log_debug_impl(&dword_22216A000, a2, OS_LOG_TYPE_DEBUG, "AppAttest_DeviceAttestation_AttestKey - (%s)\n", (uint8_t *)&v3, 0xCu);
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_2(void *a1)
{
  [a1 localizedDescription];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_22216A000, v2, v3, "Failed to attest key. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", v4, v5, v6, v7, v8);
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_4()
{
  [0 localizedDescription];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_22216A000, v1, v2, "Certificate chain length is invalid. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", v3, v4, v5, v6, v7);
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_5(void *a1)
{
  [a1 localizedDescription];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_22216A000, v2, v3, "Failed to decode certificates. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", v4, v5, v6, v7, v8);
}

@end