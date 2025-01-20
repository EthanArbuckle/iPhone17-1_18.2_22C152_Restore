uint64_t AppAttest_AppAttestation_IsEligibleApplication(long long *a1)
{
  AppAttestEligibilityManager *v2;
  long long v3;
  NSObject *v4;
  long long v5;
  long long v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  long long v11;
  long long v12;

  v2 = objc_alloc_init(AppAttestEligibilityManager);
  v3 = a1[1];
  v11 = *a1;
  v12 = v3;
  if ([(AppAttestEligibilityManager *)v2 isEligibleApplicationFor:&v11])
  {
    v4 = _DCAALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      AppAttest_AppAttestation_IsEligibleApplication_cold_1();
    }
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  v5 = a1[1];
  v11 = *a1;
  v12 = v5;
  if ([(AppAttestEligibilityManager *)v2 isEligibleDaemonFor:&v11])
  {
    v4 = _DCAALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      AppAttest_AppAttestation_IsEligibleApplication_cold_2();
    }
    goto LABEL_10;
  }
  v6 = a1[1];
  v11 = *a1;
  v12 = v6;
  v7 = [(AppAttestEligibilityManager *)v2 isEligibleApplicationExtensionFor:&v11];
  v4 = _DCAALogSystem();
  v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8) {
      AppAttest_AppAttestation_IsEligibleApplication_cold_3();
    }
    goto LABEL_10;
  }
  if (v8) {
    AppAttest_AppAttestation_IsEligibleApplication_cold_4();
  }
  v9 = 0;
LABEL_11:

  return v9;
}

id _DCAALogSystem()
{
  if (_DCAALogSystem_onceToken != -1) {
    dispatch_once(&_DCAALogSystem_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_DCAALogSystem_log;
  return v0;
}

void sub_22216B4F8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void _DCLogDebugBinary(void *a1, void *a2, void *a3)
{
  *(void *)&v24[5] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
    if ([v8 BOOLForKey:@"EnableExtendedBinaryLogs"])
    {
      v19 = v8;
      v9 = [v7 base64EncodedStringWithOptions:0];
      v10 = v5;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v22 = v6;
        __int16 v23 = 1024;
        *(_DWORD *)v24 = [v7 length];
        v24[2] = 1024;
        *(_DWORD *)&v24[3] = [v9 length];
        _os_log_debug_impl(&dword_22216A000, v10, OS_LOG_TYPE_DEBUG, "**BASE64DATABEGIN(%@:%u:%u)**\n", buf, 0x18u);
      }

      v20 = v9;
      uint64_t v11 = [v9 length];
      if (v11)
      {
        unint64_t v12 = v11;
        uint64_t v13 = 0;
        unint64_t v14 = 0;
        unint64_t v15 = 128;
        do
        {
          if (v12 >= v15) {
            unint64_t v16 = v15;
          }
          else {
            unint64_t v16 = v12;
          }
          v17 = v10;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v18 = objc_msgSend(v20, "substringWithRange:", v14, v16 + v13);
            *(_DWORD *)buf = 138412546;
            id v22 = v6;
            __int16 v23 = 2112;
            *(void *)v24 = v18;
            _os_log_debug_impl(&dword_22216A000, v17, OS_LOG_TYPE_DEBUG, "**BASE64DATA     (%@)**[%@]\n", buf, 0x16u);
          }
          v14 += 128;

          v15 += 128;
          v13 -= 128;
        }
        while (v12 > v14);
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        _DCLogDebugBinary_cold_1((uint64_t)v6, v10);
      }

      v8 = v19;
    }
  }
}

id sendServerRequestWithError(void *a1, void *a2)
{
  id v6 = a1;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v65[3] = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  id v52 = 0;
  if (!v6)
  {
    uint64_t v28 = createAppAttestError((uint64_t)"sendServerRequestWithError", 119, -2, 0, @"Invalid input.", v3, v4, v5, v37);
LABEL_10:
    v29 = (void *)v48[5];
    v48[5] = v28;

    v26 = 0;
    v27 = 0;
    id v22 = 0;
    unint64_t v15 = 0;
    goto LABEL_11;
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = (void *)v54[5];
  v54[5] = (uint64_t)v7;

  if (!v54[5])
  {
    uint64_t v28 = createAppAttestError((uint64_t)"sendServerRequestWithError", 125, -1, 0, @"Failed to create semaphore.", v9, v10, v11, v37);
    goto LABEL_10;
  }
  unint64_t v12 = [PinnedUrlDelegate alloc];
  uint64_t v13 = [v6 URL];
  unint64_t v14 = [v13 host];
  unint64_t v15 = [(PinnedUrlDelegate *)v12 initWithHost:v14];

  if (!v15)
  {
    uint64_t v28 = createAppAttestError((uint64_t)"sendServerRequestWithError", 131, -1, 0, @"Failed to create delegate.", v16, v17, v18, v37);
    goto LABEL_10;
  }
  id v22 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  if (v22)
  {
    v26 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v22 delegate:v15 delegateQueue:0];
    if (v26)
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      v39 = __sendServerRequestWithError_block_invoke;
      v40 = &unk_2645FB1A8;
      v43 = v65;
      v44 = &v47;
      id v41 = v6;
      id v22 = v22;
      id v42 = v22;
      v45 = &v59;
      v46 = &v53;
      v27 = [v26 dataTaskWithRequest:v41 completionHandler:&v37];

      objc_msgSend(v27, "resume", v37, v38, v39, v40);
      dispatch_semaphore_wait((dispatch_semaphore_t)v54[5], 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v35 = createAppAttestError((uint64_t)"sendServerRequestWithError", 143, -1, 0, @"Failed to create session.", v23, v24, v25, v37);
      v36 = (void *)v48[5];
      v48[5] = v35;

      v26 = 0;
      v27 = 0;
    }
  }
  else
  {
    uint64_t v33 = createAppAttestError((uint64_t)"sendServerRequestWithError", 137, -1, 0, @"Failed to query session configuration.", v19, v20, v21, v37);
    v34 = (void *)v48[5];
    v48[5] = v33;

    v26 = 0;
    v27 = 0;
    id v22 = 0;
  }
LABEL_11:
  [v26 invalidateAndCancel];
  v30 = (void *)v60[5];
  if (a2 && !v30)
  {
    *a2 = (id) v48[5];
    v30 = (void *)v60[5];
  }
  id v31 = v30;

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v65, 8);

  return v31;
}

void sub_22216BF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __sendServerRequestWithError_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 statusCode];
  uint64_t v10 = [v9 valueForHTTPHeaderField:@"Date"];
  uint64_t v11 = [v9 valueForHTTPHeaderField:@"X-B3-TraceId"];

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (!v7 || v8)
  {
    if (!v15)
    {
      uint64_t v16 = createAppAttestError((uint64_t)"sendServerRequestWithError_block_invoke", 157, -7, v8, @"Network communication error", v12, v13, v14, v41);
      uint64_t v17 = *(void *)(a1 + 56);
      goto LABEL_17;
    }
    uint64_t v18 = [*(id *)(a1 + 32) URL];
    uint64_t v19 = [*(id *)(a1 + 40) connectionProxyDictionary];
    v43 = [MEMORY[0x263F08C20] description];
    uint64_t v23 = createAppAttestError((uint64_t)"sendServerRequestWithError_block_invoke", 159, -1, v8, @"Failed to send HTTP request to %@ (proxy settings: %@ // session: %@): %ld", v20, v21, v22, (uint64_t)v18);
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
  else
  {
    if (v15 == 200)
    {
      uint64_t v16 = [MEMORY[0x263EFF8F8] dataWithData:v7];
      uint64_t v17 = *(void *)(a1 + 64);
LABEL_17:
      uint64_t v39 = *(void *)(v17 + 8);
      v40 = *(void **)(v39 + 40);
      *(void *)(v39 + 40) = v16;

      goto LABEL_18;
    }
    uint64_t v26 = isNSString(v10);
    if (v26)
    {
      v27 = (void *)v26;
      uint64_t v28 = isNSString(v11);

      if (v28)
      {
        v29 = _DCAALogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218498;
          uint64_t v45 = v30;
          __int16 v46 = 2082;
          uint64_t v47 = [v10 UTF8String];
          __int16 v48 = 2082;
          uint64_t v49 = [v11 UTF8String];
          _os_log_impl(&dword_22216A000, v29, OS_LOG_TYPE_DEFAULT, "Invalid server response - (%ld) (%{public}s) (%{public}s)\n", buf, 0x20u);
        }
      }
    }
    uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if ((unint64_t)(v31 - 500) < 0x64) {
      int v32 = -7;
    }
    else {
      int v32 = -6;
    }
    id v42 = [MEMORY[0x263F088A0] localizedStringForStatusCode:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v36 = createAppAttestError((uint64_t)"sendServerRequestWithError_block_invoke", 177, v32, 0, @"Server error: %ld (%@)", v33, v34, v35, v31);
    uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;
  }
LABEL_18:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
}

BOOL AppAttest_Common_ValidateBikParameters(__SecKey *a1)
{
  if (!a1)
  {
    id v7 = 0;
    id v6 = 0;
    uint64_t v4 = 0;
    BOOL v5 = 0;
    goto LABEL_9;
  }
  CFDictionaryRef v1 = SecKeyCopyAttributes(a1);
  Value = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F170D0]);
  uint64_t v3 = isNSString(Value);
  uint64_t v4 = v3;
  if (v3 && ![v3 compare:*MEMORY[0x263F170E8]])
  {
    id v9 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F16F98]);
    uint64_t v10 = isNSNumber(v9);
    id v6 = v10;
    if (v10 && ([v10 unsignedLongValue] == 256 || objc_msgSend(v6, "unsignedLongValue") == 384))
    {
      uint64_t v11 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F16FA8]);
      uint64_t v12 = isNSString(v11);
      id v7 = v12;
      BOOL v5 = v12
        && (![v12 compare:*MEMORY[0x263F16FB8]] || !objc_msgSend(v7, "compare:", *MEMORY[0x263F16FC8]));
      goto LABEL_6;
    }
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 0;
    id v6 = 0;
  }
  id v7 = 0;
LABEL_6:
  if (v1) {
    CFRelease(v1);
  }
LABEL_9:

  return v5;
}

id getSHA256(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = isNSData(v1);

  if (v2)
  {
    id v3 = v1;
    if (CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md))
    {
      v2 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

void AppAttest_Common_AttestKey(unsigned int a1, int a2, void *a3, __SecKey *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v19 = a7;
  if (a1 == 1)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKey", 316, -1, 0, @"Invalid request type.", v16, v17, v18, v26);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v27 = 0;
  uint64_t v21 = createAnonymousAttestationRequest(a1, a2, v13, (uint64_t)a4, v14, v15, &v27);
  id v20 = v27;
  if (v21)
  {
    AppAttest_Common_AttestKeyRequest(a1, a2, v21, a4, v19, 60.0);
  }
  else
  {
    uint64_t v25 = createAppAttestError((uint64_t)"AppAttest_Common_AttestKey", 313, -1, v20, @"Failed to copy certificate info.", v22, v23, v24, v26);

    id v20 = (id)v25;
    if (v19) {
LABEL_7:
    }
      (*((void (**)(id, void, id))v19 + 2))(v19, 0, v20);
  }
LABEL_8:
}

id createAnonymousAttestationRequest(int a1, int a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  v96[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = isNSData(v13);

  v87 = v12;
  if (!v15)
  {
    v44 = @"AuthenticatorData cannot be empty.";
    uint64_t v45 = 485;
LABEL_12:
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", v45, -2, 0, v44, v16, v17, v18, (uint64_t)v76);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    uint64_t v22 = 0;
LABEL_13:
    uint64_t v23 = 0;
LABEL_14:
    int v32 = 0;
LABEL_15:
    uint64_t v47 = 0;
    goto LABEL_16;
  }
  id v15 = isNSData(v14);

  if (!v15)
  {
    v44 = @"Nonce cannot be empty.";
    uint64_t v45 = 490;
    goto LABEL_12;
  }
  id v15 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithData:v13];
  [v15 appendData:v14];
  uint64_t v22 = getSHA256(v15);
  if (!v22)
  {
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 499, -1, 0, @"Failed to generate nonce.", v19, v20, v21, (uint64_t)v76);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    goto LABEL_13;
  }
  id v90 = 0;
  uint64_t v23 = getChipIDECID(&v90);
  id v24 = v90;
  if (!v23)
  {
    uint64_t v50 = v24;
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 505, -1, v24, @"Failed to generate chip/ecid", v25, v26, v27, (uint64_t)v76);
    id v46 = (id)objc_claimAutoreleasedReturnValue();

    v88 = 0;
    goto LABEL_14;
  }
  cf = v24;
  v88 = v23;
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v23 = v28;
  if (!v28)
  {
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 512, -1, 0, @"Failed to allocate dictionary.", v29, v30, v31, (uint64_t)v76);
    id v46 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (a1 == 2)
  {
    uint64_t v51 = *MEMORY[0x263F399E0];
    v93[0] = &unk_26D48E198;
    uint64_t v52 = *MEMORY[0x263F399B0];
    v92[0] = v51;
    v92[1] = v52;
    uint64_t v91 = *MEMORY[0x263F399A0];
    v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
    v92[2] = *MEMORY[0x263F39948];
    v93[1] = v78;
    v93[2] = v22;
    uint64_t v53 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:3];
    int v32 = (void *)[v53 mutableCopy];

    v43 = @"webauthn";
    uint64_t v41 = @"requestOrigin";
    id v42 = v23;
    goto LABEL_22;
  }
  if (a1)
  {
    int v32 = 0;
    goto LABEL_24;
  }
  int v32 = isNSString(v12);

  if (!v32)
  {
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 518, -1, cf, @"Incorrect parameters for App Attestation", v33, v34, v35, (uint64_t)v76);
    id v46 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v96[0] = &unk_26D48E198;
  uint64_t v36 = *MEMORY[0x263F399B0];
  v95[0] = *MEMORY[0x263F399E0];
  v95[1] = v36;
  uint64_t v37 = *MEMORY[0x263F39970];
  v94[0] = *MEMORY[0x263F39990];
  v94[1] = v37;
  v94[2] = *MEMORY[0x263F399A0];
  v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:3];
  uint64_t v38 = *MEMORY[0x263F39948];
  v96[1] = v77;
  v96[2] = v22;
  uint64_t v39 = *MEMORY[0x263F39900];
  v95[2] = v38;
  v95[3] = v39;
  v96[3] = v12;
  v40 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:4];
  int v32 = (void *)[v40 mutableCopy];

  [v23 setObject:@"appattestation" forKeyedSubscript:@"requestOrigin"];
  uint64_t v41 = @"appID";
  id v42 = v23;
  v43 = v87;
LABEL_22:
  id v28 = (id)[v42 setObject:v43 forKeyedSubscript:v41];
LABEL_24:
  if ((MEMORY[0x223C948D0](v28) & 1) == 0) {
    [v32 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F399D0]];
  }
  if (a2 == 1) {
    v54 = @"production";
  }
  else {
    v54 = @"development";
  }
  [v23 setObject:v54 forKeyedSubscript:@"environment"];
  v89[1] = cf;
  uint64_t v47 = DeviceIdentityCopyAttestationDictionary();
  id v55 = cf;

  if (v47)
  {
    v89[0] = 0;
    __int16 v48 = [MEMORY[0x263F08AC0] dataWithPropertyList:v47 format:100 options:0 error:v89];
    id v59 = v89[0];
    v60 = v55;
    id v46 = v59;

    if (v48)
    {
      cfb = [v48 base64EncodedStringWithOptions:0];
      [v23 setObject:cfb forKeyedSubscript:@"attUIKtoBIK"];

      cfc = [v88 base64EncodedStringWithOptions:0];
      [v23 setObject:cfc forKeyedSubscript:@"chipIDECID"];

      cfd = [v13 base64EncodedStringWithOptions:0];
      [v23 setObject:cfd forKeyedSubscript:@"authenticatorData"];

      cfe = [v14 base64EncodedStringWithOptions:0];
      [v23 setObject:cfe forKeyedSubscript:@"clientDataHash"];

      if (!os_variant_allows_internal_security_policies())
      {
LABEL_47:
        id v49 = v23;
        uint64_t v23 = v49;
        goto LABEL_41;
      }
      id v64 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
      if (v64)
      {
        cfa = v64;
        v65 = (void *)SecTaskCopyValueForEntitlement(v64, @"com.apple.appattest.daemoncheck", 0);
        uint64_t v66 = isNSNumber(v65);
        v79 = v65;
        if (v66)
        {
          v76 = (void *)v66;
          int v67 = [v65 BOOLValue];

          LODWORD(v76) = v67 ^ 1;
        }
        else
        {
          LODWORD(v76) = 0;
        }
        v75 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
        if (([v75 BOOLForKey:@"AAADisableTracking"] & 1) != 0 || v76) {
          objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88], @"DEBUG_notracking", v76, v79, cfa);
        }
        CFRelease(cfa);

        goto LABEL_47;
      }
      v70 = @"Failed to create self task.";
      uint64_t v71 = 584;
      v72 = 0;
    }
    else
    {
      v70 = @"Could not convert dictionary to xml data.";
      uint64_t v71 = 569;
      v72 = v46;
    }
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", v71, -1, v72, v70, v61, v62, v63, (uint64_t)v76);
    CFTypeRef cff = (CFTypeRef)objc_claimAutoreleasedReturnValue();

    id v46 = (id)cff;
    if (!a7) {
      goto LABEL_40;
    }
    goto LABEL_17;
  }
  uint64_t v68 = createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 562, -1, v55, @"Failed copy attestation dictionary.", v56, v57, v58, (uint64_t)v76);
  v69 = v55;
  id v46 = (id)v68;

LABEL_16:
  __int16 v48 = 0;
  if (!a7)
  {
LABEL_40:
    id v49 = 0;
    goto LABEL_41;
  }
LABEL_17:
  id v46 = v46;
  id v49 = 0;
  *a7 = v46;
LABEL_41:
  id v73 = v49;

  return v73;
}

void AppAttest_Common_AttestKeyRequest(unsigned int a1, int a2, void *a3, __SecKey *a4, void *a5, double a6)
{
  id v11 = a3;
  id v15 = a5;
  CFErrorRef error = 0;
  if (!v11)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 361, -1, 0, @"Failed to copy certificate info.", v12, v13, v14, v50);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    a4 = 0;
LABEL_8:
    uint64_t v22 = 0;
    CFDataRef v16 = 0;
LABEL_32:
    uint64_t v35 = 0;
    id v46 = 0;
    uint64_t v31 = 0;
    id v26 = 0;
    goto LABEL_33;
  }
  if (!a4)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 366, -1, 0, @"Invalid key.", v12, v13, v14, v50);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  id v58 = 0;
  CFDataRef v16 = [MEMORY[0x263F08900] dataWithJSONObject:v11 options:1 error:&v58];
  id v20 = v58;
  if (!v16)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 377, -1, v20, @"Failed to convert dictionary to data", v17, v18, v19, v50);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
LABEL_31:
    uint64_t v22 = 0;
    goto LABEL_32;
  }
  if (a1 != 1)
  {
    a4 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x263F172E8], v16, &error);
    if (a4) {
      goto LABEL_11;
    }
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 390, -3, 0, @"Failed to generate signature", v23, v24, v25, v50);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  a4 = 0;
LABEL_11:
  v54 = v20;
  id v26 = objc_alloc_init(MEMORY[0x263F089E0]);
  [v26 setCachePolicy:0];
  [v26 setTimeoutInterval:a6];
  [v26 setHTTPMethod:@"POST"];
  uint64_t v27 = [NSString stringWithFormat:@"application/json"];
  [v26 setValue:v27 forHTTPHeaderField:@"Content-Type"];

  id v28 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[__CFData length](v16, "length"));
  [v26 setValue:v28 forHTTPHeaderField:@"Content-Length"];

  [v26 setHTTPBody:v16];
  id v29 = [NSString alloc];
  if (a1 > 2) {
    uint64_t v30 = @"???";
  }
  else {
    uint64_t v30 = off_2645FB1C8[a1];
  }
  copy_current_process_name();
  uint64_t v52 = v51 = (uint64_t)v30;
  uint64_t v31 = (void *)[v29 initWithFormat:@"AppAttest (%@-88.3) - %@"];

  if (v31)
  {
    if (a4)
    {
      uint64_t v22 = [(__SecKey *)a4 base64EncodedStringWithOptions:0];
      [v26 setValue:v22 forHTTPHeaderField:@"signature"];
    }
    else
    {
      uint64_t v22 = 0;
    }
    [v26 setValue:v31 forHTTPHeaderField:@"User-Agent"];
    if (a2 == 1) {
      uint64_t v36 = @"https://register.appattest.apple.com/v1/attest";
    }
    else {
      uint64_t v36 = @"https://register-development.appattest.apple.com/v1/attest";
    }
    uint64_t v37 = [NSURL URLWithString:v36];
    [v26 setURL:v37];

    if (os_variant_allows_internal_security_policies())
    {
      id v38 = objc_alloc(MEMORY[0x263EFFA40]);
      uint64_t v39 = [v38 persistentDomainForName:@"com.apple.DeviceCheck"];

      uint64_t v53 = v39;
      v40 = [v39 objectForKeyedSubscript:@"AAAOverrideURL"];
      uint64_t v41 = isNSString(v40);

      if (v41)
      {
        id v42 = NSURL;
        v43 = [v53 objectForKeyedSubscript:@"AAAOverrideURL"];
        v44 = [v42 URLWithString:v43];
        [v26 setURL:v44];
      }
    }
    uint64_t v45 = (void *)MEMORY[0x223C94B60]();
    id v57 = v54;
    uint64_t v35 = sendServerRequestWithError(v26, &v57);
    id v21 = v57;

    if (!v35)
    {
      id v46 = 0;
      goto LABEL_33;
    }
    id v56 = v21;
    id v46 = [MEMORY[0x263F08900] JSONObjectWithData:v35 options:1 error:&v56];
    id v55 = v56;

    if (v46)
    {
      id v21 = v55;
      goto LABEL_33;
    }
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 447, -6, v55, @"Unable to parse response", v47, v48, v49, v51);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 407, -1, 0, @"Failed to create user agent string.", v32, v33, v34, v51);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v22 = 0;
    uint64_t v35 = 0;
  }
  id v46 = 0;
LABEL_33:
  if (error) {
    CFRelease(error);
  }
  if (v15) {
    v15[2](v15, v46, v21);
  }
}

id getChipIDECID(void *a1)
{
  v2 = (void *)MGCopyAnswer();
  id v3 = isNSNumber(v2);

  if (v3)
  {
    id v7 = (void *)MGCopyAnswer();
    id v8 = isNSNumber(v7);

    if (v8)
    {
      id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%08llX-%016llX", objc_msgSend(v7, "longLongValue"), objc_msgSend(v2, "longLongValue"));
      uint64_t v12 = [v3 dataUsingEncoding:4];
      uint64_t v13 = 0;
      if (!a1) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = createAppAttestError((uint64_t)"getChipIDECID", 283, -1, 0, @"Failed to retrieve %@.", v9, v10, v11, @"ChipID");
      uint64_t v12 = 0;
      id v3 = 0;
      if (!a1) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v13 = createAppAttestError((uint64_t)"getChipIDECID", 273, -1, 0, @"Failed to retrieve %@.", v4, v5, v6, @"UniqueChipID");
    uint64_t v12 = 0;
    id v7 = 0;
    if (!a1) {
      goto LABEL_10;
    }
  }
  if (!v12) {
    *a1 = v13;
  }
LABEL_10:
  id v14 = v12;

  return v14;
}

id createDeviceAttestationRequest(int a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  uint64_t v9 = isNSDictionary(v8);

  if (!v9)
  {
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", 632, -2, 0, @"Invalid options.", v10, v11, v12, v42);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v21 = 0;
LABEL_17:
    uint64_t v23 = 0;
    goto LABEL_18;
  }
  id v44 = 0;
  uint64_t v9 = getChipIDECID(&v44);
  id v16 = v44;
  if (!v9)
  {
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", 638, -1, v16, @"Failed to generate chip/ecid", v13, v14, v15, v42);
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v21 = v17;
  if (!v17)
  {
    uint64_t v36 = @"Failed to allocate dictionary.";
    uint64_t v37 = 645;
    id v38 = 0;
LABEL_16:
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", v37, -1, v38, v36, v18, v19, v20, v42);
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (a1 != 1)
  {
    uint64_t v36 = @"Invalid request type.";
    uint64_t v37 = 652;
    id v38 = v16;
    goto LABEL_16;
  }
  [v17 setObject:@"enterprise" forKeyedSubscript:@"requestOrigin"];
  if (a2 == 1) {
    uint64_t v22 = @"production";
  }
  else {
    uint64_t v22 = @"development";
  }
  [v21 setObject:v22 forKeyedSubscript:@"environment"];
  v43[1] = v16;
  uint64_t v23 = DeviceIdentityCopyAttestationDictionary();
  id v24 = v16;

  if (v23)
  {
    v43[0] = 0;
    id v28 = [MEMORY[0x263F08AC0] dataWithPropertyList:v23 format:100 options:0 error:v43];
    id v29 = v43[0];

    if (v28)
    {
      uint64_t v33 = [v28 base64EncodedStringWithOptions:0];
      [v21 setObject:v33 forKeyedSubscript:@"attUIKtoBIK"];

      uint64_t v34 = [v9 base64EncodedStringWithOptions:0];
      [v21 setObject:v34 forKeyedSubscript:@"chipIDECID"];

      id v35 = v21;
      id v21 = v35;
      goto LABEL_21;
    }
    uint64_t v41 = createAppAttestError((uint64_t)"createDeviceAttestationRequest", 674, -1, v29, @"Could not convert dictionary to xml data.", v30, v31, v32, v42);

    id v29 = (id)v41;
  }
  else
  {
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", 667, -1, v24, @"Failed copy attestation dictionary.", v25, v26, v27, v42);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (a5)
  {
    id v29 = v29;
    id v28 = 0;
    id v35 = 0;
    *a5 = v29;
  }
  else
  {
    id v28 = 0;
    id v35 = 0;
  }
LABEL_21:
  id v39 = v35;

  return v39;
}

uint64_t AppAttest_Common_ValidateEntitlements(void *a1)
{
  v34[1] = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  uint64_t v6 = v2;
  if (!v2)
  {
    uint64_t v15 = createAppAttestError((uint64_t)"AppAttest_Common_ValidateEntitlements", 702, -1, 0, @"Failed to create task.", v3, v4, v5, v29);
    id v7 = 0;
    if (!a1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v7 = (void *)SecTaskCopyValueForEntitlement(v2, @"com.apple.appattest.spi", &error);
  uint64_t v8 = isNSNumber(v7);
  if (!v8 || (uint64_t v9 = (void *)v8, v10 = [v7 BOOLValue], v9, (v10 & 1) == 0))
  {
    CFErrorRef v17 = error;
    uint64_t v33 = @"com.apple.appattest.spi";
    v34[0] = MEMORY[0x263EFFA88];
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v15 = createAppAttestError((uint64_t)"AppAttest_Common_ValidateEntitlements", 708, -5, v17, @"Missing required entitlement: %@", v19, v20, v21, (uint64_t)v18);

    if (!a1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v11 = (void *)SecTaskCopyValueForEntitlement(v6, @"com.apple.security.attestation.access", &error);

  uint64_t v12 = isNSNumber(v11);
  if (!v12 || (uint64_t v13 = (void *)v12, v14 = [v11 BOOLValue], v13, (v14 & 1) == 0))
  {
    CFErrorRef v24 = error;
    uint64_t v31 = @"com.apple.security.attestation.access";
    uint64_t v32 = MEMORY[0x263EFFA88];
    uint64_t v25 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v15 = createAppAttestError((uint64_t)"AppAttest_Common_ValidateEntitlements", 714, -5, v24, @"Missing required entitlement: %@", v26, v27, v28, (uint64_t)v25);

    id v7 = v11;
    if (!a1)
    {
LABEL_11:
      uint64_t v16 = 0;
      uint64_t v22 = 0;
      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_10:
    *a1 = v15;
    goto LABEL_11;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 1;
  id v7 = v11;
LABEL_12:
  CFRelease(v6);
  uint64_t v22 = v16;
LABEL_13:
  if (error) {
    CFRelease(error);
  }

  return v22;
}

id generateCredentialId(__SecKey *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0;
  if (!a1)
  {
    uint64_t v20 = createAppAttestError((uint64_t)"generateCredentialId", 743, -1, 0, @"Invalid key.", a6, a7, a8, v22);
    uint64_t v13 = 0;
LABEL_8:
    CFDataRef v18 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = SecKeyCopyPublicKey(a1);
  uint64_t v13 = v9;
  if (!v9)
  {
    uint64_t v20 = createAppAttestError((uint64_t)"generateCredentialId", 749, -1, 0, @"Failed to copy RK public key.", v10, v11, v12, v22);
    goto LABEL_8;
  }
  CFDataRef v14 = SecKeyCopyExternalRepresentation(v9, &error);
  CFDataRef v18 = v14;
  if (v14)
  {
    uint64_t v19 = getSHA256(v14);
    uint64_t v20 = 0;
    if (!a2) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v20 = createAppAttestError((uint64_t)"generateCredentialId", 754, -1, error, @"Failed to encode RK public key as data.", v15, v16, v17, v22);
LABEL_10:
  uint64_t v19 = 0;
  if (!a2) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v19) {
    *a2 = v20;
  }
LABEL_13:
  if (v13) {
    CFRelease(v13);
  }
  if (error) {
    CFRelease(error);
  }

  return v19;
}

id generateCredentialIdString(__SecKey *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v18 = 0;
  uint64_t v9 = generateCredentialId(a1, &v18, a3, a4, a5, a6, a7, a8);
  id v13 = v18;
  if (v9)
  {
    CFDataRef v14 = [v9 base64EncodedStringWithOptions:0];
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v15 = createAppAttestError((uint64_t)"generateCredentialIdString", 779, -1, 0, @"Failed to copy RK public key.", v10, v11, v12, v17);

    CFDataRef v14 = 0;
    id v13 = (id)v15;
    if (!a2) {
      goto LABEL_7;
    }
  }
  if (!v14) {
    *a2 = v13;
  }
LABEL_7:

  return v14;
}

CFTypeRef createReferenceKeyBlob(const void *a1, char a2, void *a3)
{
  v39[4] = *MEMORY[0x263EF8340];
  id v6 = (id)*MEMORY[0x263F16FB8];
  CFErrorRef error = 0;
  id v7 = (void *)MGCopyAnswer();
  uint64_t v8 = isNSNumber(v7);

  if (!v8)
  {
    uint64_t v21 = createAppAttestError((uint64_t)"createReferenceKeyBlob", 43, -1, 0, @"Failed to retrieve PKA state.", v9, v10, v11, v36);
    CFDictionaryRef v22 = 0;
    CFTypeRef v23 = 0;
    SecKeyRef v24 = 0;
    id v13 = 0;
    if (!a3) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if ([v7 BOOLValue] && (a2 & 1) == 0)
  {
    id v12 = (id)*MEMORY[0x263F16FC8];

    id v6 = v12;
  }
  if (!a1 || (id v13 = CFRetain(a1)) == 0)
  {
    if ((isRunningInRecovery() & 1) != 0
      || (isRunningInRecovery() & 1) != 0
      || isRunningInDiagnosticsMode())
    {
      id v13 = (const void *)SecAccessControlCreate();
      if (v13)
      {
        uint64_t v17 = *MEMORY[0x263F16EC0];
        if ((SecAccessControlSetProtection() & 1) == 0)
        {
          createAppAttestError((uint64_t)"createReferenceKeyBlob", 66, -1, error, @"Failed to set ACL protection to %@.", v18, v19, v20, v17);
          goto LABEL_16;
        }
        goto LABEL_19;
      }
      createAppAttestError((uint64_t)"createReferenceKeyBlob", 62, -1, error, @"Failed to create access control.", v14, v15, v16, v36);
      uint64_t v21 = LABEL_16:;
      CFDictionaryRef v22 = 0;
      CFTypeRef v23 = 0;
      SecKeyRef v24 = 0;
      if (!a3) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    id v13 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EA0], 0x40000000uLL, &error);
    if (!v13)
    {
      createAppAttestError((uint64_t)"createReferenceKeyBlob", 72, -1, error, @"Failed to create access control (%@).", v25, v26, v27, *MEMORY[0x263F16EB8]);
      goto LABEL_16;
    }
  }
LABEL_19:
  uint64_t v28 = *MEMORY[0x263F170D0];
  v38[0] = *MEMORY[0x263F16F50];
  v38[1] = v28;
  uint64_t v29 = *MEMORY[0x263F170E8];
  v39[0] = MEMORY[0x263EFFA80];
  v39[1] = v29;
  uint64_t v30 = *MEMORY[0x263F16E70];
  v38[2] = *MEMORY[0x263F16FA8];
  v38[3] = v30;
  v39[2] = v6;
  v39[3] = v13;
  CFDictionaryRef v22 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
  SecKeyRef v31 = SecKeyCreateRandomKey(v22, &error);
  SecKeyRef v24 = v31;
  if (v31)
  {
    CFTypeRef v23 = CFRetain(v31);
    uint64_t v21 = 0;
    if (!a3) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v21 = createAppAttestError((uint64_t)"createReferenceKeyBlob", 86, -1, error, @"Failed to create ref key.", v32, v33, v34, v36);
    CFTypeRef v23 = 0;
    if (!a3) {
      goto LABEL_25;
    }
  }
LABEL_23:
  if (!v23) {
    *a3 = v21;
  }
LABEL_25:
  if (v24) {
    CFRelease(v24);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (error) {
    CFRelease(error);
  }

  return v23;
}

id lockcrypto_decode_pems(void *a1, const char *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a1;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  *(_OWORD *)__str = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)__little = 0u;
  long long v37 = 0u;
  if (!v8 || !a2)
  {
    createAppAttestError((uint64_t)"lockcrypto_decode_pems", 40, -1, 0, @"Invalid input(s).", v5, v6, v7, v32);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v12)
  {
    createAppAttestError((uint64_t)"lockcrypto_decode_pems", 46, -1, 0, @"Failed to allocate array.", v9, v10, v11, v32);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 0;
    goto LABEL_22;
  }
  id v13 = v8;
  uint64_t v14 = (const char *)[v13 bytes];
  uint64_t v15 = [v13 length];
  id v16 = 0;
  if (v14)
  {
    size_t v17 = v15;
    uint64_t v18 = 0;
    if (v15 >= 1)
    {
      uint64_t v34 = a3;
      id v35 = v8;
      uint64_t v19 = 0;
      while (1)
      {
        int v20 = snprintf(__str, 0x50uLL, "-----BEGIN %s-----\n", a2);
        int v21 = snprintf(__little, 0x50uLL, "\n-----END %s-----", a2);
        CFDictionaryRef v22 = strnstr(v14, __str, v17);
        CFTypeRef v23 = strnstr(v14, __little, v17);
        if (!v22 || (SecKeyRef v24 = v23) == 0)
        {
          id v16 = 0;
          uint64_t v18 = v19;
          goto LABEL_18;
        }
        uint64_t v25 = (void *)MEMORY[0x223C94B60]();
        uint64_t v26 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&v22[v20] length:v24 - &v22[v20] freeWhenDone:0];
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v26 options:1];

        if (!v18) {
          break;
        }
        [v12 addObject:v18];

        uint64_t v30 = &v14[v17];
        uint64_t v14 = &v24[v21];
        size_t v17 = v30 - v14;
        uint64_t v19 = v18;
        if (v30 - v14 <= 0)
        {
          id v16 = 0;
          goto LABEL_18;
        }
      }
      createAppAttestError((uint64_t)"lockcrypto_decode_pems", 74, -1, 0, @"Failed to decode data.", v27, v28, v29, v33);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
      a3 = v34;
      id v8 = v35;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  if (![v12 count])
  {

    if (a3)
    {
      id v16 = v16;
      id v12 = 0;
      *a3 = v16;
      goto LABEL_22;
    }
LABEL_13:
    id v12 = 0;
  }
LABEL_22:

  return v12;
}

id createAppAttestError(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  uint64_t v14 = (objc_class *)MEMORY[0x263F089D8];
  id v15 = a5;
  id v16 = (void *)[[v14 alloc] initWithFormat:v15 arguments:&a9];

  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v18 = v17;
  if (v16) {
    [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (v13) {
    [v18 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      uint64_t v19 = [NSString stringWithUTF8String:a1];
      [v18 setObject:v19 forKeyedSubscript:@"FunctionName"];
    }
    if (a2)
    {
      int v20 = [NSNumber numberWithInt:a2];
      [v18 setObject:v20 forKeyedSubscript:@"SourceLine"];
    }
  }
  int v21 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.appattest.error" code:a3 userInfo:v18];

  return v21;
}

CFTypeRef copy_keychain_item(void *a1, void *a2, OSStatus *a3, void *a4)
{
  v28[5] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v12 = v8;
  CFTypeRef result = 0;
  if (v8)
  {
    uint64_t v13 = *MEMORY[0x263F171B8];
    v27[0] = *MEMORY[0x263F17000];
    v27[1] = v13;
    uint64_t v14 = *MEMORY[0x263F171E0];
    v28[0] = v8;
    v28[1] = v14;
    uint64_t v15 = *MEMORY[0x263F17580];
    v27[2] = *MEMORY[0x263F17530];
    v27[3] = v15;
    v28[2] = MEMORY[0x263EFFA88];
    v28[3] = MEMORY[0x263EFFA88];
    v27[4] = *MEMORY[0x263F17590];
    v28[4] = MEMORY[0x263EFFA88];
    id v16 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
    id v17 = (void *)[v16 mutableCopy];

    if (v7) {
      [v17 setObject:v7 forKeyedSubscript:*MEMORY[0x263F16E80]];
    }
    OSStatus v21 = SecItemCopyMatching((CFDictionaryRef)v17, &result);
    if (v21)
    {
      CFDictionaryRef v22 = createAppAttestError((uint64_t)"copy_keychain_item", 53, -1, 0, @"Failed to copy keychain item %@: %d", v18, v19, v20, (uint64_t)v12);

      CFTypeRef v23 = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    else
    {
      CFTypeRef v23 = result;
      CFTypeRef result = 0;

      CFDictionaryRef v22 = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  CFDictionaryRef v22 = createAppAttestError((uint64_t)"copy_keychain_item", 34, -2, 0, @"Invalid input.", v9, v10, v11, v25);
  CFTypeRef v23 = 0;
  OSStatus v21 = -1;
  if (a3) {
LABEL_8:
  }
    *a3 = v21;
LABEL_9:
  if (a4 && !v23) {
    *a4 = v22;
  }
  if (result) {
    CFRelease(result);
  }

  return v23;
}

CFTypeRef copy_all_items(void *a1, _DWORD *a2, void *a3)
{
  v21[5] = *MEMORY[0x263EF8340];
  id v5 = a1;
  CFTypeRef result = 0;
  uint64_t v6 = *MEMORY[0x263F171E0];
  uint64_t v7 = *MEMORY[0x263F17518];
  v20[0] = *MEMORY[0x263F171B8];
  v20[1] = v7;
  uint64_t v8 = *MEMORY[0x263F17400];
  v20[2] = *MEMORY[0x263F17580];
  v20[3] = v8;
  uint64_t v9 = *MEMORY[0x263F17408];
  v21[2] = MEMORY[0x263EFFA88];
  v21[3] = v9;
  v21[0] = v6;
  v21[1] = MEMORY[0x263EFFA88];
  v20[4] = *MEMORY[0x263F17590];
  v21[4] = MEMORY[0x263EFFA88];
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (v5) {
    [v11 setObject:v5 forKeyedSubscript:*MEMORY[0x263F16E80]];
  }
  uint64_t v15 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  if (!v15)
  {
    id v16 = 0;
    CFTypeRef v17 = result;
    CFTypeRef result = 0;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v16 = createAppAttestError((uint64_t)"copy_all_items", 99, -1, 0, @"Failed to copy keychain items with status: %d", v12, v13, v14, v15);
  CFTypeRef v17 = 0;
  if (a2) {
LABEL_5:
  }
    *a2 = v15;
LABEL_6:
  if (a3 && !v17) {
    *a3 = v16;
  }
  if (result) {
    CFRelease(result);
  }

  return v17;
}

uint64_t delete_keychain_item(void *a1, void *a2, void *a3)
{
  v25[4] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v10 = v6;
  if (!v6)
  {
    createAppAttestError((uint64_t)"delete_keychain_item", 130, -2, 0, @"Invalid input(s).", v7, v8, v9, v23);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 0;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  uint64_t v11 = *MEMORY[0x263F171B8];
  v24[0] = *MEMORY[0x263F17000];
  v24[1] = v11;
  uint64_t v12 = *MEMORY[0x263F171E0];
  v25[0] = v6;
  v25[1] = v12;
  uint64_t v13 = *MEMORY[0x263F17590];
  v24[2] = *MEMORY[0x263F17580];
  v24[3] = v13;
  v25[2] = MEMORY[0x263EFFA88];
  v25[3] = MEMORY[0x263EFFA88];
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  uint64_t v15 = (void *)[v14 mutableCopy];

  if (v5) {
    [v15 setObject:v5 forKeyedSubscript:*MEMORY[0x263F16E80]];
  }
  OSStatus v19 = SecItemDelete((CFDictionaryRef)v15);
  id v20 = 0;
  uint64_t v21 = 1;
  if (v19 != -25300 && v19)
  {
    createAppAttestError((uint64_t)"delete_keychain_item", 148, -1, 0, @"Failed to remove existing keychain item %@: %d", v16, v17, v18, (uint64_t)v10);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      uint64_t v21 = 0;
      goto LABEL_10;
    }
LABEL_9:
    id v20 = v20;
    uint64_t v21 = 0;
    *a3 = v20;
  }
LABEL_10:

  return v21;
}

uint64_t store_keychain_item(uint64_t a1, void *a2, void *a3, void *a4)
{
  v34[6] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v12 = v8;
  if (a1 && v8)
  {
    id v32 = 0;
    char v13 = delete_keychain_item(v7, v8, &v32);
    id v17 = v32;
    if (v13)
    {
      uint64_t v18 = *MEMORY[0x263F171B8];
      v33[0] = *MEMORY[0x263F17000];
      v33[1] = v18;
      uint64_t v19 = *MEMORY[0x263F171E0];
      v34[0] = v12;
      v34[1] = v19;
      uint64_t v20 = *MEMORY[0x263F17580];
      v33[2] = *MEMORY[0x263F175B8];
      v33[3] = v20;
      uint64_t v21 = *MEMORY[0x263F16E90];
      v33[4] = *MEMORY[0x263F17590];
      v33[5] = v21;
      void v34[2] = a1;
      v34[3] = MEMORY[0x263EFFA88];
      uint64_t v22 = *MEMORY[0x263F16EB8];
      v34[4] = MEMORY[0x263EFFA88];
      v34[5] = v22;
      uint64_t v23 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];
      SecKeyRef v24 = (void *)[v23 mutableCopy];

      if (v7) {
        [v24 setObject:v7 forKeyedSubscript:*MEMORY[0x263F16E80]];
      }
      if (!SecItemAdd((CFDictionaryRef)v24, 0))
      {
        uint64_t v29 = 1;
        goto LABEL_14;
      }
      uint64_t v28 = createAppAttestError((uint64_t)"store_keychain_item", 198, -1, 0, @"Failed to add %@ to keychain: %d", v25, v26, v27, (uint64_t)v12);
    }
    else
    {
      uint64_t v28 = createAppAttestError((uint64_t)"store_keychain_item", 178, -1, v17, @"Failed to delete existing keychain item.", v14, v15, v16, v31);

      SecKeyRef v24 = 0;
    }
    id v17 = (id)v28;
    if (!a4) {
      goto LABEL_12;
    }
  }
  else
  {
    createAppAttestError((uint64_t)"store_keychain_item", 173, -2, 0, @"Invalid input(s).", v9, v10, v11, v31);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    SecKeyRef v24 = 0;
    if (!a4)
    {
LABEL_12:
      uint64_t v29 = 0;
      goto LABEL_14;
    }
  }
  id v17 = v17;
  uint64_t v29 = 0;
  *a4 = v17;
LABEL_14:

  return v29;
}

id copy_keychain_data(void *a1, void *a2, OSStatus *a3, void *a4)
{
  v31[8] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  uint64_t v12 = v8;
  CFTypeRef result = 0;
  if (v8)
  {
    uint64_t v13 = *MEMORY[0x263F16F30];
    v30[0] = *MEMORY[0x263F17000];
    v30[1] = v13;
    v31[0] = v8;
    v31[1] = v8;
    uint64_t v14 = *MEMORY[0x263F17090];
    v30[2] = *MEMORY[0x263F16ED8];
    v30[3] = v14;
    v31[2] = v8;
    v31[3] = v8;
    uint64_t v15 = *MEMORY[0x263F171C8];
    uint64_t v16 = *MEMORY[0x263F17520];
    v30[4] = *MEMORY[0x263F171B8];
    v30[5] = v16;
    v31[4] = v15;
    v31[5] = MEMORY[0x263EFFA88];
    uint64_t v17 = *MEMORY[0x263F17590];
    v30[6] = *MEMORY[0x263F17580];
    v30[7] = v17;
    v31[6] = MEMORY[0x263EFFA88];
    v31[7] = MEMORY[0x263EFFA88];
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:8];
    uint64_t v19 = (void *)[v18 mutableCopy];

    if (v7) {
      [v19 setObject:v7 forKeyedSubscript:*MEMORY[0x263F16E80]];
    }
    OSStatus v23 = SecItemCopyMatching((CFDictionaryRef)v19, &result);
    if (v23)
    {
      SecKeyRef v24 = createAppAttestError((uint64_t)"copy_keychain_data", 247, -1, 0, @"Failed to copy keychain item %@: %d", v20, v21, v22, (uint64_t)v12);
      uint64_t v25 = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    else
    {
      SecKeyRef v24 = 0;
      uint64_t v25 = (void *)result;
      CFTypeRef result = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  SecKeyRef v24 = createAppAttestError((uint64_t)"copy_keychain_data", 223, -2, 0, @"Invalid input.", v9, v10, v11, v28);
  uint64_t v25 = 0;
  uint64_t v19 = 0;
  OSStatus v23 = -1;
  if (a3) {
LABEL_8:
  }
    *a3 = v23;
LABEL_9:
  if (a4 && !v25) {
    *a4 = v24;
  }
  if (result) {
    CFRelease(result);
  }
  id v26 = v25;

  return v26;
}

CFTypeRef copy_all_datas(void *a1, _DWORD *a2, void *a3)
{
  void v21[6] = *MEMORY[0x263EF8340];
  id v5 = a1;
  CFTypeRef result = 0;
  uint64_t v6 = *MEMORY[0x263F171C8];
  uint64_t v7 = *MEMORY[0x263F17518];
  v20[0] = *MEMORY[0x263F171B8];
  v20[1] = v7;
  v21[0] = v6;
  v21[1] = MEMORY[0x263EFFA88];
  uint64_t v8 = *MEMORY[0x263F17580];
  v20[2] = *MEMORY[0x263F17520];
  v20[3] = v8;
  uint64_t v9 = *MEMORY[0x263F17590];
  v20[4] = *MEMORY[0x263F17400];
  void v20[5] = v9;
  v21[2] = MEMORY[0x263EFFA88];
  v21[3] = MEMORY[0x263EFFA88];
  v21[4] = *MEMORY[0x263F17408];
  v21[5] = MEMORY[0x263EFFA88];
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (v5) {
    [v11 setObject:v5 forKeyedSubscript:*MEMORY[0x263F16E80]];
  }
  uint64_t v15 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  if (!v15)
  {
    uint64_t v16 = 0;
    CFTypeRef v17 = result;
    CFTypeRef result = 0;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v16 = createAppAttestError((uint64_t)"copy_all_datas", 294, -1, 0, @"Failed to copy keychain items with status: %d", v12, v13, v14, v15);
  CFTypeRef v17 = 0;
  if (a2) {
LABEL_5:
  }
    *a2 = v15;
LABEL_6:
  if (a3 && !v17) {
    *a3 = v16;
  }
  if (result) {
    CFRelease(result);
  }

  return v17;
}

uint64_t delete_keychain_data(void *a1, void *a2, void *a3)
{
  v26[7] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v10 = v6;
  if (!v6)
  {
    createAppAttestError((uint64_t)"delete_keychain_data", 325, -2, 0, @"Invalid input(s).", v7, v8, v9, v24);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 0;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  uint64_t v11 = *MEMORY[0x263F16F30];
  v25[0] = *MEMORY[0x263F17000];
  v25[1] = v11;
  v26[0] = v6;
  v26[1] = v6;
  uint64_t v12 = *MEMORY[0x263F17090];
  v25[2] = *MEMORY[0x263F16ED8];
  v25[3] = v12;
  v26[2] = v6;
  v26[3] = v6;
  uint64_t v13 = *MEMORY[0x263F171C8];
  uint64_t v14 = *MEMORY[0x263F17580];
  v25[4] = *MEMORY[0x263F171B8];
  void v25[5] = v14;
  v26[4] = v13;
  v26[5] = MEMORY[0x263EFFA88];
  v25[6] = *MEMORY[0x263F17590];
  v26[6] = MEMORY[0x263EFFA88];
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];
  uint64_t v16 = (void *)[v15 mutableCopy];

  if (v5) {
    [v16 setObject:v5 forKeyedSubscript:*MEMORY[0x263F16E80]];
  }
  OSStatus v20 = SecItemDelete((CFDictionaryRef)v16);
  id v21 = 0;
  uint64_t v22 = 1;
  if (v20 != -25300 && v20)
  {
    createAppAttestError((uint64_t)"delete_keychain_data", 348, -1, 0, @"Failed to remove existing keychain item %@: %d", v17, v18, v19, (uint64_t)v10);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      uint64_t v22 = 0;
      goto LABEL_10;
    }
LABEL_9:
    id v21 = v21;
    uint64_t v22 = 0;
    *a3 = v21;
  }
LABEL_10:

  return v22;
}

uint64_t store_keychain_data(void *a1, void *a2, void *a3, void *a4)
{
  v35[9] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v13 = v9;
  if (v7 && v9)
  {
    id v33 = 0;
    char v14 = delete_keychain_data(v8, v9, &v33);
    id v18 = v33;
    if (v14)
    {
      uint64_t v19 = *MEMORY[0x263F16F30];
      v34[0] = *MEMORY[0x263F17000];
      v34[1] = v19;
      v35[0] = v13;
      v35[1] = v13;
      uint64_t v20 = *MEMORY[0x263F17090];
      void v34[2] = *MEMORY[0x263F16ED8];
      v34[3] = v20;
      v35[2] = v13;
      v35[3] = v13;
      uint64_t v21 = *MEMORY[0x263F171C8];
      uint64_t v22 = *MEMORY[0x263F175A8];
      v34[4] = *MEMORY[0x263F171B8];
      v34[5] = v22;
      v35[4] = v21;
      v35[5] = v7;
      uint64_t v23 = *MEMORY[0x263F17590];
      v34[6] = *MEMORY[0x263F17580];
      void v34[7] = v23;
      v35[6] = MEMORY[0x263EFFA88];
      v35[7] = MEMORY[0x263EFFA88];
      v34[8] = *MEMORY[0x263F16E90];
      v35[8] = *MEMORY[0x263F16EB8];
      uint64_t v24 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:9];
      uint64_t v25 = (void *)[v24 mutableCopy];

      if (v8) {
        [v25 setObject:v8 forKeyedSubscript:*MEMORY[0x263F16E80]];
      }
      if (!SecItemAdd((CFDictionaryRef)v25, 0))
      {
        uint64_t v30 = 1;
        goto LABEL_14;
      }
      uint64_t v29 = createAppAttestError((uint64_t)"store_keychain_data", 403, -1, 0, @"Failed to add %@ to keychain: %d", v26, v27, v28, (uint64_t)v13);
    }
    else
    {
      uint64_t v29 = createAppAttestError((uint64_t)"store_keychain_data", 378, -1, v18, @"Failed to delete existing keychain item.", v15, v16, v17, v32);

      uint64_t v25 = 0;
    }
    id v18 = (id)v29;
    if (!a4) {
      goto LABEL_12;
    }
  }
  else
  {
    createAppAttestError((uint64_t)"store_keychain_data", 373, -2, 0, @"Invalid input(s).", v10, v11, v12, v32);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0;
    if (!a4)
    {
LABEL_12:
      uint64_t v30 = 0;
      goto LABEL_14;
    }
  }
  id v18 = v18;
  uint64_t v30 = 0;
  *a4 = v18;
LABEL_14:

  return v30;
}

void AppAttest_WebAuthentication_AttestKey(__SecKey *a1, void *a2, void *a3, void *a4)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__0;
  id v56 = __Block_byref_object_dispose__0;
  id v57 = 0;
  if (!v9)
  {
    long long v38 = _DCAALogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      AppAttest_WebAuthentication_AttestKey_cold_1(v38);
    }
    goto LABEL_24;
  }
  if ((DeviceIdentityIsSupported() & 1) == 0)
  {
    uint64_t v37 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 102, -4, 0, @"Not supported", v10, v11, v12, v46);
    goto LABEL_20;
  }
  uint64_t v13 = (id *)(v53 + 5);
  char v14 = (void *)v53[5];
  if (isSupportedSPIClient_onceToken != -1) {
    dispatch_once(&isSupportedSPIClient_onceToken, &__block_literal_global_1);
  }
  id v18 = copy_current_process_name();
  if (!v18)
  {
    long long v39 = createAppAttestError((uint64_t)"isSupportedSPIClient", 67, -1, 0, @"Failed to query process name.", v15, v16, v17, v46);
LABEL_19:
    id v41 = v39;

    objc_storeStrong(v13, v41);
    uint64_t v37 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 107, -1, (void *)v53[5], @"Client is not supported.", v42, v43, v44, v47);
    goto LABEL_20;
  }
  if (([(id)isSupportedSPIClient_supportedList containsObject:v18] & 1) == 0)
  {
    long long v39 = createAppAttestError((uint64_t)"isSupportedSPIClient", 72, -1, 0, @"%@ is not allowed to use this API.  Please refer to the header file for onboarding information.", v19, v20, v21, (uint64_t)v18);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      long long v40 = [v39 localizedDescription];
      AppAttest_WebAuthentication_AttestKey_cold_2(v40, buf);
    }
    goto LABEL_19;
  }

  objc_storeStrong(v13, v14);
  uint64_t v22 = (id *)(v53 + 5);
  id obj = (id)v53[5];
  int v23 = AppAttest_Common_ValidateEntitlements(&obj);
  objc_storeStrong(v22, obj);
  if (!v23) {
    goto LABEL_21;
  }
  uint64_t v24 = isNSData(v7);
  BOOL v25 = v24 == 0;

  if (v25)
  {
    uint64_t v37 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 117, -2, 0, @"Invalid authenticatorData", v26, v27, v28, v46);
    goto LABEL_20;
  }
  if (!AppAttest_Common_ValidateBikParameters(a1))
  {
    uint64_t v37 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 122, -3, 0, @"Invalid referenceKey", v29, v30, v31, v46);
    goto LABEL_20;
  }
  id v35 = isNSData(v8);
  if (!v35 || (BOOL v36 = (unint64_t)[v8 length] > 0x20, v35, v36))
  {
    uint64_t v37 = createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 127, -2, 0, @"Invalid clientDataHash", v32, v33, v34, v46);
LABEL_20:
    long long v45 = (void *)v53[5];
    v53[5] = v37;
  }
LABEL_21:
  if (!v53[5])
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __AppAttest_WebAuthentication_AttestKey_block_invoke;
    v48[3] = &unk_2645FB220;
    uint64_t v50 = &v52;
    uint64_t v49 = v9;
    AppAttest_Common_AttestKey(2u, 1, 0, a1, v7, v8, v48);
    long long v38 = v49;
LABEL_24:

    goto LABEL_25;
  }
  (*((void (**)(id, void))v9 + 2))(v9, 0);
LABEL_25:
  _Block_object_dispose(&v52, 8);
}

void sub_2221705E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __isSupportedSPIClient_block_invoke()
{
  v0 = (void *)isSupportedSPIClient_supportedList;
  isSupportedSPIClient_supportedList = (uint64_t)&unk_26D48E1B0;
}

id buildApplicationIdentifierKeychainLabel(void *a1)
{
  id v1 = [a1 dataUsingEncoding:4];
  v2 = getSHA256(v1);

  uint64_t v3 = NSString;
  uint64_t v4 = [v2 base64EncodedStringWithOptions:0];
  id v5 = [v3 stringWithFormat:@"%@%@", @"au:", v4];

  return v5;
}

id resolveAppUUIDKeychain(void *a1, void *a2, void *a3)
{
  id v46 = a1;
  id v5 = a2;
  id v6 = a3;
  OSStatus v49 = -1;
  id v7 = buildApplicationIdentifierKeychainLabel(v6);
  id v48 = 0;
  uint64_t v8 = copy_keychain_data(@"com.apple.appattest.identities", v7, &v49, &v48);
  id v9 = v48;
  OSStatus v10 = v49;
  uint64_t v44 = v7;
  long long v45 = (void *)v8;
  if (v49)
  {
    uint64_t v11 = _DCAALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      resolveAppUUIDKeychain_cold_14();
    }
LABEL_4:
    uint64_t v12 = 0;
    id v13 = 0;
    int v14 = 0;
    goto LABEL_31;
  }
  uint64_t v11 = [[NSString alloc] initWithData:v8 encoding:4];
  uint64_t v15 = _DCAALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    resolveAppUUIDKeychain_cold_13();
  }

  if (!v11) {
    goto LABEL_4;
  }
  uint64_t v16 = [v11 componentsSeparatedByString:@":"];
  if ([v16 count] == 1)
  {
    id v13 = v6;
    uint64_t v12 = [v16 objectAtIndexedSubscript:0];
    uint64_t v17 = _DCAALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      resolveAppUUIDKeychain_cold_10();
    }
    int v14 = 1;
    goto LABEL_29;
  }
  if ([v16 count] == 3)
  {
    uint64_t v17 = [v16 objectAtIndexedSubscript:0];
    if ([v17 isEqualToString:@"m"])
    {
      uint64_t v42 = v17;
      int v14 = 1;
    }
    else
    {
      if (([v17 isEqualToString:@"c"] & 1) == 0)
      {
        uint64_t v43 = _DCAALogSystem();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          resolveAppUUIDKeychain_cold_12();
        }
        uint64_t v12 = 0;
        id v13 = 0;
        int v14 = 0;
        goto LABEL_28;
      }
      uint64_t v42 = v17;
      int v14 = 2;
    }
    id v18 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v19 = [v16 objectAtIndexedSubscript:2];
    uint64_t v43 = [v18 initWithUUIDString:v19];

    uint64_t v20 = [v16 objectAtIndexedSubscript:1];
    LODWORD(v19) = [v20 hasPrefix:v6];

    if (v19 && v43)
    {
      id v13 = [v16 objectAtIndexedSubscript:1];
      uint64_t v12 = [v16 objectAtIndexedSubscript:2];
    }
    else
    {
      uint64_t v21 = _DCAALogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        resolveAppUUIDKeychain_cold_11();
      }

      uint64_t v12 = 0;
      id v13 = 0;
      int v14 = 0;
    }
    uint64_t v17 = v42;
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  uint64_t v12 = 0;
  id v13 = 0;
  int v14 = 0;
LABEL_30:

LABEL_31:
  uint64_t v22 = v46;
  if (([v5 hasPrefix:v6] & 1) == 0)
  {
    int v23 = _DCAALogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      resolveAppUUIDKeychain_cold_9();
    }
  }
  char v24 = [v6 isEqualToString:v5];
  if (v14 && v13 && v12)
  {
    char v25 = v24;
    if (v46 && [v12 isEqualToString:v46])
    {
      id v26 = v12;
      uint64_t v27 = _DCAALogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    if ([v5 isEqualToString:v13])
    {
      uint64_t v28 = _DCAALogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
LABEL_46:
      }
        resolveAppUUIDKeychain_cold_3(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    else
    {
      if (v14 == 2)
      {
        id v26 = v12;
        uint64_t v27 = _DCAALogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
LABEL_55:
        }
          resolveAppUUIDKeychain_cold_5();
LABEL_56:
        BOOL v36 = v44;
        goto LABEL_57;
      }
      if ((v25 & 1) == 0)
      {
        v47[2] = 0;
        uint64_t v28 = 0;
        CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
        id v26 = 0;
        BOOL v36 = v44;
        id v41 = _DCAALogSystem();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          resolveAppUUIDKeychain_cold_7();
        }

        goto LABEL_48;
      }
      uint64_t v28 = _DCAALogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_46;
      }
    }
  }
  else
  {
    uint64_t v28 = _DCAALogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_46;
    }
  }
  id v26 = 0;
  BOOL v36 = v44;
LABEL_48:

  if (v10)
  {
    uint64_t v22 = v46;
    goto LABEL_58;
  }
  v47[0] = v9;
  delete_keychain_data(@"com.apple.appattest.identities", v36, v47);
  id v37 = v47[0];

  uint64_t v27 = _DCAALogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    resolveAppUUIDKeychain_cold_2();
  }
  id v26 = 0;
  id v9 = v37;
  uint64_t v22 = v46;
LABEL_57:

LABEL_58:
  long long v38 = _DCAALogSystem();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    resolveAppUUIDKeychain_cold_1();
  }

  id v39 = v26;
  return v39;
}

uint64_t saveAppUUIDKeychain(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = isNSString(v5);
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = isNSString(v6);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = isNSString(v7);
      if (v12)
      {
        id v13 = (void *)v12;
        char v14 = [v6 hasPrefix:v7];

        if (v14) {
          goto LABEL_11;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_8:
  uint64_t v15 = _DCAALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    saveAppUUIDKeychain_cold_1(v15);
  }

LABEL_11:
  uint64_t v16 = buildApplicationIdentifierKeychainLabel(v7);
  uint64_t v17 = @"m";
  unint64_t v18 = [v6 length];
  if (v18 > [v7 length])
  {
    uint64_t v19 = @"c";

    uint64_t v17 = v19;
  }
  uint64_t v20 = [NSString stringWithFormat:@"%@:%@:%@", v17, v6, v5];
  uint64_t v21 = [v20 dataUsingEncoding:4];
  id v27 = 0;
  uint64_t v22 = store_keychain_data(v21, @"com.apple.appattest.identities", v16, &v27);
  id v23 = v27;
  char v24 = _DCAALogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    id v26 = "FAILED";
    *(_DWORD *)buf = 136315650;
    if (v22) {
      id v26 = "SUCCESS";
    }
    uint64_t v29 = v26;
    __int16 v30 = 2112;
    uint64_t v31 = v16;
    __int16 v32 = 2112;
    uint64_t v33 = v20;
    _os_log_debug_impl(&dword_22216A000, v24, OS_LOG_TYPE_DEBUG, "saveAppUUIDKeychain - (%s) - %@ - (%@)\n", buf, 0x20u);
  }

  return v22;
}

id encodeKeyToCOSE(__SecKey *a1, void *a2)
{
  uint64_t v4 = fetchPublicKey(a1);
  if (v4)
  {
    CFDictionaryRef v5 = SecKeyCopyAttributes(a1);
    id v6 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x263F16F98]];
    id v7 = v6;
    if (v6)
    {
      if ([v6 intValue] == 256 || objc_msgSend(v7, "intValue") == 384)
      {
        uint64_t v8 = [v7 integerValue] / 8;
        id v9 = malloc_type_malloc(v8, 0x9CCD4D4BuLL);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __encodeKeyToCOSE_block_invoke;
        v28[3] = &__block_descriptor_40_e5_v8__0l;
        v28[4] = v9;
        uint64_t v10 = (void (**)(void))MEMORY[0x223C94D20](v28);
        objc_msgSend(v4, "getBytes:range:", v9, 1, v8);
        uint64_t v11 = malloc_type_malloc(v8, 0x3C8DFB9uLL);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = (uint64_t)__encodeKeyToCOSE_block_invoke_2;
        v27[3] = (uint64_t)&__block_descriptor_40_e5_v8__0l;
        v27[4] = (uint64_t)v11;
        uint64_t v12 = (void (**)(void))MEMORY[0x223C94D20](v27);
        objc_msgSend(v4, "getBytes:range:", v11, v8 + 1, v8);
        id v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v9 length:v8];
        char v14 = [MEMORY[0x263EFF8F8] dataWithBytes:v11 length:v8];
        uint64_t v15 = generateCOSEForKeySize(v8, v13, v14);

        v12[2](v12);
        v10[2](v10);

LABEL_16:
        goto LABEL_17;
      }
      char v25 = _DCAALogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        encodeKeyToCOSE_cold_3(v7, v25);
      }

      uint64_t v24 = 277;
    }
    else
    {
      uint64_t v20 = _DCAALogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        encodeKeyToCOSE_cold_2();
      }

      uint64_t v24 = 271;
    }
    createAppAttestError((uint64_t)"encodeKeyToCOSE", v24, -3, 0, @"Failed to fetch size of public key.", v21, v22, v23, v27[0]);
    uint64_t v15 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  uint64_t v16 = _DCAALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    encodeKeyToCOSE_cold_1();
  }

  createAppAttestError((uint64_t)"encodeKeyToCOSE", 263, -3, 0, @"Failed to fetch data representation of public key.", v17, v18, v19, v27[0]);
  uint64_t v15 = 0;
  *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v15;
}

void sub_222171700(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

CFDataRef fetchPublicKey(__SecKey *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (AppAttest_Common_ValidateBikParameters(a1))
  {
    v2 = SecKeyCopyPublicKey(a1);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __fetchPublicKey_block_invoke;
    v14[3] = &__block_descriptor_40_e5_v8__0l;
    v14[4] = v2;
    uint64_t v3 = MEMORY[0x223C94D20](v14);
    if (!v2)
    {
      uint64_t v10 = _DCAALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        fetchPublicKey_cold_1();
      }

      CFDataRef v9 = 0;
      goto LABEL_16;
    }
    v12[4] = 0;
    CFErrorRef error = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __fetchPublicKey_block_invoke_161;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    uint64_t v4 = (void (**)(void))MEMORY[0x223C94D20](v12);
    CFDataRef v5 = SecKeyCopyExternalRepresentation(v2, &error);
    CFDataRef v6 = v5;
    if (error)
    {
      id v7 = _DCAALogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = (__CFString *)CFErrorCopyDescription(error);
        fetchPublicKey_cold_3(v8, (uint64_t)v15, v7);
      }
    }
    else
    {
      if (v5)
      {
        CFDataRef v9 = v5;
        goto LABEL_15;
      }
      id v7 = _DCAALogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        encodeKeyToCOSE_cold_1();
      }
    }

    CFDataRef v9 = 0;
LABEL_15:

    v4[2](v4);
LABEL_16:
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    goto LABEL_17;
  }
  uint64_t v3 = _DCAALogSystem();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEBUG)) {
    fetchPublicKey_cold_4();
  }
  CFDataRef v9 = 0;
LABEL_17:

  return v9;
}

void sub_222171978(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void __encodeKeyToCOSE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    free(v1);
  }
}

void __encodeKeyToCOSE_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    free(v1);
  }
}

id generateCOSEForKeySize(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((a1 & 0xFFFFFFFFFFFFFFEFLL) == 0x20)
  {
    id v7 = objc_alloc_init(CBORMap);
    uint64_t v8 = [[CBORUnsigned alloc] initWith:1];
    CFDataRef v9 = [[CBORUnsigned alloc] initWith:2];
    [(CBORMap *)v7 setKey:v8 value:v9];

    if (a1 == 48)
    {
      uint64_t v16 = [[CBORUnsigned alloc] initWith:3];
      uint64_t v17 = [[CBORNegative alloc] initWith:-35];
      [(CBORMap *)v7 setKey:v16 value:v17];

      uint64_t v12 = [[CBORNegative alloc] initWith:-1];
      id v13 = [[CBORUnsigned alloc] initWith:2];
      [(CBORMap *)v7 setKey:v12 value:v13];
      unint64_t v14 = 110;
    }
    else
    {
      if (a1 != 32)
      {
        unint64_t v14 = 110;
        goto LABEL_11;
      }
      uint64_t v10 = [[CBORUnsigned alloc] initWith:3];
      uint64_t v11 = [[CBORNegative alloc] initWith:-7];
      [(CBORMap *)v7 setKey:v10 value:v11];

      uint64_t v12 = [[CBORNegative alloc] initWith:-1];
      id v13 = [[CBORUnsigned alloc] initWith:1];
      [(CBORMap *)v7 setKey:v12 value:v13];
      unint64_t v14 = 77;
    }

LABEL_11:
    uint64_t v18 = [[CBORNegative alloc] initWith:-2];
    uint64_t v19 = [[CBORData alloc] initWith:v5];
    [(CBORMap *)v7 setKey:v18 value:v19];

    uint64_t v20 = [[CBORNegative alloc] initWith:-3];
    uint64_t v21 = [[CBORData alloc] initWith:v6];
    [(CBORMap *)v7 setKey:v20 value:v21];

    id v22 = objc_alloc_init(MEMORY[0x263EFF990]);
    [(CBORMap *)v7 write:v22];
    if ([v22 length] <= v14)
    {
      id v15 = v22;
    }
    else
    {
      uint64_t v23 = _DCAALogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        generateCOSEForKeySize_cold_1(v22, v14, v23);
      }

      id v15 = 0;
    }

    goto LABEL_17;
  }
  _DCAALogSystem();
  id v7 = (CBORMap *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_DEBUG)) {
    generateCOSEForKeySize_cold_2();
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

id createAppAttestationAuthenticatorDataShort(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = isNSString(v5);

  if (v7)
  {
    uint64_t v11 = [v5 dataUsingEncoding:4];
    id v7 = getSHA256(v11);

    id v16 = 0;
    uint64_t v12 = createGenericAuthenticatorDataShort(v7, 64, v6, &v16);
    id v13 = v16;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    createAppAttestError((uint64_t)"createAppAttestationAuthenticatorDataShort", 314, -2, 0, @"Invalid counter", v8, v9, v10, v15);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v12) {
    *a3 = v13;
  }
LABEL_7:

  return v12;
}

id createAppAttestationAuthenticatorDataFull(int a1, void *a2, void *a3, __SecKey *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = isNSString(v9);

  if (v11)
  {
    uint64_t v15 = [v9 dataUsingEncoding:4];
    uint64_t v11 = getSHA256(v15);

    if (a1 == 1) {
      id v16 = "appattest";
    }
    else {
      id v16 = "appattestdevelop";
    }
    uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:v16 length:16];
    if ([v17 length] == 16)
    {
      id v26 = 0;
      uint64_t v21 = createGenericAuthenticatorDataFull(v17, v11, 64, v10, a4, &v26);
      id v22 = v26;
      if (!a5) {
        goto LABEL_13;
      }
    }
    else
    {
      createAppAttestError((uint64_t)"createAppAttestationAuthenticatorDataFull", 357, -1, 0, @"Invalid aaguid length!", v18, v19, v20, v25);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = 0;
      if (!a5) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    createAppAttestError((uint64_t)"createAppAttestationAuthenticatorDataFull", 345, -2, 0, @"Invalid counter", v12, v13, v14, v25);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = 0;
    uint64_t v17 = 0;
    if (!a5) {
      goto LABEL_13;
    }
  }
  if (!v21) {
    *a5 = v22;
  }
LABEL_13:
  id v23 = v21;

  return v23;
}

uint64_t generateEnvironmentByAppSigning(_OWORD *a1)
{
  uint64_t v26 = 0;
  long long v2 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v2;
  uint64_t v3 = [MEMORY[0x263F01890] bundleRecordForAuditToken:&token error:&v26];
  if (!v3)
  {
    id v7 = objc_alloc_init(AppAttestEligibilityManager);
    long long v8 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v8;
    uint64_t v6 = [(AppAttestEligibilityManager *)v7 isEligibleDaemonFor:&token];
    id v9 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_alloc_init(AppAttestEligibilityManager);
    long long v5 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v5;
    uint64_t v6 = [(AppAttestEligibilityManager *)v4 isEligibleApplicationExtensionFor:&token];
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = 0;
LABEL_23:
    CFErrorRef error = 0;
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    long long v14 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v14;
    uint64_t v15 = SecTaskCreateWithAuditToken(v13, &token);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = SecTaskCopyValueForEntitlement(v15, @"com.apple.developer.devicecheck.appattest-environment", &error);
      uint64_t v18 = isNSString(v17);
      uint64_t v19 = v18;
      if (v18)
      {
        if ([v18 caseInsensitiveCompare:@"production"])
        {
          uint64_t v20 = [v19 caseInsensitiveCompare:@"development"];
          uint64_t v21 = _DCAALogSystem();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
          if (v20)
          {
            if (v22) {
              generateEnvironmentByAppSigning_cold_4();
            }
          }
          else
          {
            if (v22) {
              generateEnvironmentByAppSigning_cold_3();
            }
            uint64_t v6 = 0;
          }
        }
        else
        {
          uint64_t v21 = _DCAALogSystem();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            generateEnvironmentByAppSigning_cold_2();
          }
          uint64_t v6 = 1;
        }
      }
      CFRelease(v16);
    }
    else
    {
      uint64_t v17 = _DCAALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        generateEnvironmentByAppSigning_cold_1();
      }
    }

    goto LABEL_40;
  }
  id v9 = v3;
  if ([v9 isProfileValidated])
  {
    if ([v9 isUPPValidated])
    {
      _DCAALogSystem();
      id v7 = (AppAttestEligibilityManager *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG)) {
        generateEnvironmentByAppSigning_cold_5();
      }
    }
    else
    {
      int v11 = [v9 isBeta];
      _DCAALogSystem();
      id v7 = (AppAttestEligibilityManager *)objc_claimAutoreleasedReturnValue();
      BOOL v12 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG);
      if (!v11)
      {
        if (v12) {
          generateEnvironmentByAppSigning_cold_7();
        }
        uint64_t v6 = 0;
        goto LABEL_22;
      }
      if (v12) {
        generateEnvironmentByAppSigning_cold_6();
      }
    }
    uint64_t v6 = 1;
LABEL_22:

    goto LABEL_23;
  }
  id v10 = _DCAALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    generateEnvironmentByAppSigning_cold_8();
  }

  uint64_t v6 = 1;
LABEL_40:

  return v6;
}

id buildAppAttestApplicationIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && [v3 length] && (objc_msgSend(v3, "isEqualToString:", @"0000000000") & 1) == 0)
  {
    id v5 = [NSString stringWithFormat:@"%@.%@", v3, v4];
  }
  else
  {
    id v5 = v4;
  }
  uint64_t v6 = v5;

  return v6;
}

void resolveAppAttestApplicationIdentifiersForApplicationRecord(void *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [v5 teamIdentifier];
  id v7 = [v5 bundleIdentifier];
  buildAppAttestApplicationIdentifier(v6, v7);
  *a2 = (id)objc_claimAutoreleasedReturnValue();
  long long v8 = [v5 appClipMetadata];
  id v9 = v8;
  if (v8)
  {
    [v8 parentApplicationIdentifiers];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      BOOL v22 = a3;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v16 = _DCAALogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v15;
            _os_log_debug_impl(&dword_22216A000, v16, OS_LOG_TYPE_DEBUG, "AppClip found: Parent (%@)\n", buf, 0xCu);
          }

          *(void *)buf = 0;
          if (CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()) {
            BOOL v17 = *(void *)buf == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            uint64_t v18 = _DCAALogSystem();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_2();
            }

            uint64_t v20 = *(void **)buf;
            uint64_t v21 = _DCAALogSystem();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
              resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_1();
            }

            id v7 = v20;
            goto LABEL_22;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
LABEL_22:
      a3 = v22;
    }
  }
  buildAppAttestApplicationIdentifier(v6, v7);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
}

void resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a1;
    id v7 = [v5 teamIdentifier];
    uint64_t v6 = [v5 bundleIdentifier];

    buildAppAttestApplicationIdentifier(v7, v6);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    buildAppAttestApplicationIdentifier(v7, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *a2 = 0;
    *a3 = 0;
  }
}

uint64_t extractApplicationIdentifiers(_OWORD *a1, void *a2, void *a3, void *a4)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v9 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __extractApplicationIdentifiers_block_invoke;
  v64[3] = &__block_descriptor_40_e5_v8__0l;
  v64[4] = v9;
  uint64_t v13 = (void (**)(void))MEMORY[0x223C94D20](v64);
  if (v9)
  {
    v62[4] = 0;
    CFErrorRef error = 0;
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __extractApplicationIdentifiers_block_invoke_2;
    v62[3] = &__block_descriptor_40_e5_v8__0l;
    long long v14 = (void (**)(void))MEMORY[0x223C94D20](v62);
    uint64_t v18 = (void *)SecTaskCopyValueForEntitlement(v9, @"application-identifier", &error);
    if (error)
    {
      createAppAttestError((uint64_t)"extractApplicationIdentifiers", 572, -1, error, @"Failed to fetch connecting client application identifier.", v15, v16, v17, v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v18)
    {
      createAppAttestError((uint64_t)"extractApplicationIdentifiers", 576, -1, 0, @"Failed to fetch connecting client application identifier.", v15, v16, v17, v52);
      uint64_t v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

      v14[2](v14);
      goto LABEL_42;
    }
    id v56 = a3;
    CFTypeRef v19 = SecTaskCopyValueForEntitlement(v9, @"com.apple.appattest.daemoncheck", 0);
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __extractApplicationIdentifiers_block_invoke_3;
    v61[3] = &__block_descriptor_40_e5_v8__0l;
    v61[4] = v19;
    uint64_t v20 = (void (**)(void))MEMORY[0x223C94D20](v61);
    if (v19 && v19 == (CFTypeRef)*MEMORY[0x263EFFB38])
    {
      uint64_t v21 = _DCAALogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        extractApplicationIdentifiers_cold_2();
      }
    }
    else if ([@"com.apple.devicecheckd" compare:v18])
    {
      createAppAttestError((uint64_t)"extractApplicationIdentifiers", 588, -1, error, @"Failed to query code signing identifier..", v23, v24, v25, v52);
      uint64_t v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:
      v20[2](v20);

      goto LABEL_41;
    }
    long long v26 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v26;
    id v27 = [MEMORY[0x263F01890] bundleRecordForAuditToken:&token error:0];
    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = v27;
        resolveAppAttestApplicationIdentifiersForApplicationRecord(v28, a2, v56);
        uint64_t v22 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v22 = 0;
LABEL_39:

          goto LABEL_40;
        }
        uint64_t v28 = v27;
        resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(v28, a2, v56);
        if (a2) {
          BOOL v48 = v56 == 0;
        }
        else {
          BOOL v48 = 1;
        }
        uint64_t v22 = !v48;
        if (v48)
        {
          createAppAttestError((uint64_t)"extractApplicationIdentifiers", 665, -1, 0, @"Failed to fetch identifiers, unsupported application extension.", v45, v46, v47, v52);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      uint64_t v29 = objc_alloc_init(AppAttestEligibilityManager);
      long long v30 = a1[1];
      *(_OWORD *)token.val = *a1;
      *(_OWORD *)&token.val[4] = v30;
      id v55 = v29;
      if ([(AppAttestEligibilityManager *)v29 isEligibleDaemonFor:&token])
      {
        long long v34 = a1[1];
        *(_OWORD *)token.val = *a1;
        *(_OWORD *)&token.val[4] = v34;
        uint64_t v35 = SecTaskCreateWithAuditToken(v8, &token);
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __extractApplicationIdentifiers_block_invoke_55;
        v59[3] = &__block_descriptor_40_e5_v8__0l;
        v59[4] = v35;
        uint64_t v53 = (void (**)(void))MEMORY[0x223C94D20](v59);
        *(void *)token.val = 0;
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __extractApplicationIdentifiers_block_invoke_2_56;
        v58[3] = &__block_descriptor_40_e5_v8__0l;
        v58[4] = 0;
        uint64_t v54 = (void (**)(void))MEMORY[0x223C94D20](v58);
        BOOL v36 = (void *)SecTaskCopyValueForEntitlement(v35, @"application-identifier", (CFErrorRef *)&token);
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __extractApplicationIdentifiers_block_invoke_3_60;
        v57[3] = &__block_descriptor_40_e5_v8__0l;
        v57[4] = v36;
        long long v40 = (void (**)(void))MEMORY[0x223C94D20](v57);
        if (v36)
        {
          if (*(void *)token.val)
          {
            id v41 = [*(id *)token.val localizedDescription];
            createAppAttestError((uint64_t)"extractApplicationIdentifiers", 636, -1, 0, @"Failed to fetch application identifier entitlement for daemon. { error=%@ }", v42, v43, v44, (uint64_t)v41);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v22 = 0;
          }
          else
          {
            id v49 = v36;
            *a2 = v49;
            *id v56 = v49;
            uint64_t v50 = _DCAALogSystem();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
              extractApplicationIdentifiers_cold_1(a2, v56, v50);
            }

            uint64_t v22 = 1;
          }
        }
        else
        {
          createAppAttestError((uint64_t)"extractApplicationIdentifiers", 631, -2, 0, @"Daemon client connection is missing application identifier entitlement.", v37, v38, v39, v52);
          uint64_t v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v40[2](v40);

        v54[2](v54);
        v53[2](v53);
        uint64_t v28 = v55;
      }
      else
      {
        createAppAttestError((uint64_t)"extractApplicationIdentifiers", 617, -2, 0, @"Invalid daemon client connection.", v31, v32, v33, v52);
        uint64_t v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = v55;
      }
    }

    goto LABEL_39;
  }
  createAppAttestError((uint64_t)"extractApplicationIdentifiers", 563, -1, 0, @"Failed to create security task.", v10, v11, v12, v52);
  uint64_t v22 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
  v13[2](v13);

  return v22;
}

void sub_222172D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  (*(void (**)(void))(a12 + 16))();
  (*(void (**)(void))(a11 + 16))();
  (*(void (**)(void))(a15 + 16))();
  (*(void (**)(uint64_t))(v16 + 16))(v16);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Unwind_Resume(a1);
}

void __extractApplicationIdentifiers_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __extractApplicationIdentifiers_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __extractApplicationIdentifiers_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __extractApplicationIdentifiers_block_invoke_55(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __extractApplicationIdentifiers_block_invoke_2_56(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __extractApplicationIdentifiers_block_invoke_3_60(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

id generateAttestationObject(void *a1, void *a2, void *a3, void *a4)
{
  id v6 = a1;
  id v7 = a2;
  id v8 = a3;
  context = (void *)MEMORY[0x223C94B60]();
  id v9 = objc_alloc_init(CBORArray);
  if (v7 && objc_msgSend(v7, "count", context) == 2 && objc_msgSend(v7, "count"))
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = _DCAALogSystem();
      uint64_t v12 = [v7 objectAtIndexedSubscript:v10];
      _DCLogDebugBinary(v11, @"generateAttestationObject:cert", v12);

      uint64_t v13 = [CBORData alloc];
      long long v14 = [v7 objectAtIndexedSubscript:v10];
      uint64_t v15 = [(CBORData *)v13 initWith:v14];
      [(CBORArray *)v9 addObject:v15];

      ++v10;
    }
    while (v10 < [v7 count]);
  }
  uint64_t v16 = objc_alloc_init(CBORMap);
  uint64_t v17 = [[CBORString alloc] initWith:@"x5c"];
  [(CBORMap *)v16 setKey:v17 value:v9];

  uint64_t v18 = [[CBORString alloc] initWith:@"receipt"];
  CFTypeRef v19 = [[CBORData alloc] initWith:v8];
  [(CBORMap *)v16 setKey:v18 value:v19];

  uint64_t v20 = objc_alloc_init(CBORMap);
  uint64_t v21 = _DCAALogSystem();
  _DCLogDebugBinary(v21, @"generateAttestationObject:authData", v6);

  uint64_t v22 = [[CBORString alloc] initWith:@"authData"];
  uint64_t v23 = [[CBORData alloc] initWith:v6];
  [(CBORMap *)v20 setKey:v22 value:v23];

  uint64_t v24 = [[CBORString alloc] initWith:@"fmt"];
  uint64_t v25 = [[CBORString alloc] initWith:@"apple-appattest"];
  [(CBORMap *)v20 setKey:v24 value:v25];

  long long v26 = [[CBORString alloc] initWith:@"attStmt"];
  [(CBORMap *)v20 setKey:v26 value:v16];

  id v27 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(CBORMap *)v20 write:v27];
  uint64_t v28 = (void *)[v27 copy];
  uint64_t v29 = _DCAALogSystem();
  _DCLogDebugBinary(v29, @"generateAttestationObject:finalObject", v27);

  if (a4 && !v28) {
    *a4 = 0;
  }

  return v28;
}

id generateAssertionObject(__SecKey *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v30 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithData:v9];
  [v11 appendData:v10];
  getSHA256(v11);
  CFDataRef v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  CFErrorRef error = 0;
  CFDataRef v16 = SecKeyCreateSignature(a1, (SecKeyAlgorithm)*MEMORY[0x263F172E8], v12, &error);
  if (v16)
  {
    contexta = (void *)MEMORY[0x223C94B60]();
    uint64_t v17 = objc_alloc_init(CBORMap);
    uint64_t v18 = [[CBORString alloc] initWith:@"authenticatorData"];
    uint64_t v29 = a5;
    CFTypeRef v19 = [[CBORData alloc] initWith:v9];
    [(CBORMap *)v17 setKey:v18 value:v19];

    uint64_t v20 = [[CBORString alloc] initWith:@"signature"];
    uint64_t v21 = [[CBORData alloc] initWith:v16];
    [(CBORMap *)v17 setKey:v20 value:v21];

    id v22 = objc_alloc_init(MEMORY[0x263EFF990]);
    [(CBORMap *)v17 write:v22];
    uint64_t v23 = (void *)[v22 copy];
    uint64_t v24 = _DCAALogSystem();
    _DCLogDebugBinary(v24, @"generateAssertionObject:finalObject", v22);

    a5 = v29;
    uint64_t v25 = 0;
    if (!v29) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v25 = createAppAttestError((uint64_t)"generateAssertionObject", 756, -1, error, @"Failed to sign data with ref key.", v13, v14, v15, (uint64_t)context);
    uint64_t v23 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v23) {
    *a5 = v25;
  }
LABEL_7:
  if (error) {
    CFRelease(error);
  }

  return v23;
}

uint64_t saveCredentialKeychain(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v6 = buildKeychainLabel(a2, a3, a4, a5, @"rk");
  id v11 = 0;
  uint64_t v7 = store_keychain_item(a1, @"com.apple.appattest.identities", v6, &v11);
  id v8 = v11;
  id v9 = _DCAALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    saveCredentialKeychain_cold_1();
  }

  return v7;
}

id buildKeychainLabel(int a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = @"d";
  if (a1 == 1) {
    id v9 = @"p";
  }
  id v10 = v9;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [a2 dataUsingEncoding:4];
  uint64_t v15 = getSHA256(v14);

  CFDataRef v16 = [v13 dataUsingEncoding:4];

  uint64_t v17 = getSHA256(v16);

  uint64_t v18 = [v12 dataUsingEncoding:4];

  CFTypeRef v19 = getSHA256(v18);

  uint64_t v20 = NSString;
  uint64_t v21 = [v15 base64EncodedStringWithOptions:0];
  id v22 = [v17 base64EncodedStringWithOptions:0];
  uint64_t v23 = [v19 base64EncodedStringWithOptions:0];
  uint64_t v24 = [v20 stringWithFormat:@"%@%@%@:%@:%@:%@", @"aa:", v21, v10, v22, v23, v11];

  return v24;
}

CFTypeRef loadCredentialKeychain(int a1, void *a2, void *a3, void *a4)
{
  OSStatus v11 = -1;
  id v4 = buildKeychainLabel(a1, a2, a3, a4, @"rk");
  id v10 = 0;
  CFTypeRef v5 = copy_keychain_item(@"com.apple.appattest.identities", v4, &v11, &v10);
  id v6 = v10;
  CFTypeRef v7 = 0;
  if (!v11) {
    CFTypeRef v7 = CFRetain(v5);
  }
  id v8 = _DCAALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    loadCredentialKeychain_cold_1();
  }

  if (v5) {
    CFRelease(v5);
  }

  return v7;
}

uint64_t deleteCredentialKeychainWithLabel(void *a1)
{
  id v1 = a1;
  id v6 = 0;
  uint64_t v2 = delete_keychain_item(@"com.apple.appattest.identities", v1, &v6);
  id v3 = v6;
  id v4 = _DCAALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    deleteCredentialKeychainWithLabel_cold_1();
  }

  return v2;
}

id getAllCredentialKeychainLabels()
{
  int v13 = -1;
  v0 = objc_opt_new();
  uint64_t v12 = 0;
  CFArrayRef v1 = (const __CFArray *)copy_all_items(@"com.apple.appattest.identities", &v13, &v12);
  if (v1)
  {
    CFArrayRef v2 = v1;
    CFIndex Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      CFIndex v5 = 0;
      id v6 = (const void *)*MEMORY[0x263F17000];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v5);
        id v8 = CFDictionaryGetValue(ValueAtIndex, v6);
        if ([v8 hasPrefix:@"aa:"]) {
          [v0 addObject:v8];
        }

        ++v5;
      }
      while (v4 != v5);
    }
    CFRelease(v2);
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithArray:v0];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  id v10 = (void *)v9;

  return v10;
}

uint64_t saveAssertionCounterKeychain(void *a1, int a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = buildKeychainLabel(a2, a3, a4, a5, @"ct");
  id v18 = 0;
  OSStatus v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v18];

  id v12 = v18;
  id v17 = v12;
  uint64_t v13 = store_keychain_data(v11, @"com.apple.appattest.identities", v10, &v17);
  id v14 = v17;

  uint64_t v15 = _DCAALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    saveAssertionCounterKeychain_cold_1();
  }

  return v13;
}

id loadAssertionCounterKeychain(int a1, void *a2, void *a3, void *a4)
{
  OSStatus v13 = -1;
  CFIndex v4 = buildKeychainLabel(a1, a2, a3, a4, @"ct");
  id v12 = 0;
  CFIndex v5 = copy_keychain_data(@"com.apple.appattest.identities", v4, &v13, &v12);
  id v6 = v12;
  if (v13)
  {
    CFTypeRef v7 = 0;
  }
  else
  {
    id v11 = v6;
    CFTypeRef v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];
    id v8 = v11;

    id v6 = v8;
  }
  id v9 = _DCAALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    loadAssertionCounterKeychain_cold_1();
  }

  return v7;
}

uint64_t deleteAssertionCounterKeychainWithLabel(void *a1)
{
  id v1 = a1;
  id v6 = 0;
  uint64_t v2 = delete_keychain_data(@"com.apple.appattest.identities", v1, &v6);
  id v3 = v6;
  CFIndex v4 = _DCAALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    deleteAssertionCounterKeychainWithLabel_cold_1();
  }

  return v2;
}

id getAllAssertionCounterKeychainLabels()
{
  int v13 = -1;
  v0 = objc_opt_new();
  uint64_t v12 = 0;
  CFArrayRef v1 = (const __CFArray *)copy_all_datas(@"com.apple.appattest.identities", &v13, &v12);
  if (v1)
  {
    CFArrayRef v2 = v1;
    CFIndex Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      CFIndex v5 = 0;
      id v6 = (const void *)*MEMORY[0x263F17000];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v5);
        id v8 = CFDictionaryGetValue(ValueAtIndex, v6);
        if ([v8 hasPrefix:@"aa:"]) {
          [v0 addObject:v8];
        }

        ++v5;
      }
      while (v4 != v5);
    }
    CFRelease(v2);
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithArray:v0];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  id v10 = (void *)v9;

  return v10;
}

id getApplicationIdentifierHashFromKeychainLabel(void *a1)
{
  CFArrayRef v1 = [a1 componentsSeparatedByString:@":"];
  if ((unint64_t)[v1 count] > 4)
  {
    id v3 = [v1 objectAtIndexedSubscript:2];
  }
  else
  {
    CFArrayRef v2 = _DCAALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      getApplicationIdentifierHashFromKeychainLabel_cold_1();
    }

    id v3 = 0;
  }

  return v3;
}

id getAllAppUUIDKeychainLabels()
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  int v44 = -1;
  v0 = objc_opt_new();
  id v43 = 0;
  CFArrayRef v1 = (const __CFArray *)copy_all_datas(@"com.apple.appattest.identities", &v44, &v43);
  id v2 = v43;
  id v3 = v2;
  if (v1)
  {
    id v32 = v2;
    CFIndex v4 = _DCAALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      getAllAppUUIDKeychainLabels_cold_2();
    }

    CFIndex Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      id v8 = (const void *)*MEMORY[0x263F17000];
      key = (void *)*MEMORY[0x263F175A8];
      CFIndex v35 = Count;
      CFArrayRef v36 = v1;
      long long v34 = (const void *)*MEMORY[0x263F17000];
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v1, v7);
        id v10 = CFDictionaryGetValue(ValueAtIndex, v8);
        if ([v10 hasPrefix:@"au:"]) {
          break;
        }
LABEL_28:

        if (++v7 == v6) {
          goto LABEL_29;
        }
      }
      id v11 = [v10 componentsSeparatedByString:@":"];
      if ([v11 count] != 2)
      {
LABEL_27:

        goto LABEL_28;
      }
      long long v40 = v10;
      uint64_t v12 = [v11 objectAtIndexedSubscript:1];
      uint64_t v13 = CFDictionaryGetValue(ValueAtIndex, key);
      id v14 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
      uint64_t v38 = (void *)v13;
      uint64_t v39 = v11;
      uint64_t v37 = v14;
      if (!v14)
      {
        id v17 = 0;
LABEL_17:
        id v18 = isNSString(v17);

        if (v18)
        {
          char v19 = 1;
          uint64_t v20 = @"d";
          do
          {
            char v21 = v19;
            id v22 = v20;
            uint64_t v23 = [v17 dataUsingEncoding:4];
            uint64_t v24 = getSHA256(v23);

            uint64_t v25 = NSString;
            long long v26 = [v24 base64EncodedStringWithOptions:0];
            id v27 = [v25 stringWithFormat:@"%@%@%@:%@", @"aa:", v26, v22, v12];

            uint64_t v28 = _DCAALogSystem();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v46 = v27;
              _os_log_debug_impl(&dword_22216A000, v28, OS_LOG_TYPE_DEBUG, "    %@\n", buf, 0xCu);
            }

            [v0 addObject:v27];
            char v19 = 0;
            uint64_t v20 = @"p";
          }
          while ((v21 & 1) != 0);
        }
        else
        {
          uint64_t v29 = _DCAALogSystem();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            getAllAppUUIDKeychainLabels_cold_1(&v41, v42);
          }
        }
        CFIndex v6 = v35;
        CFArrayRef v1 = v36;
        id v8 = v34;
        id v11 = v39;
        id v10 = v40;
        goto LABEL_27;
      }
      uint64_t v15 = [v14 componentsSeparatedByString:@":"];
      if ([v15 count] == 1)
      {
        uint64_t v16 = 0;
      }
      else
      {
        if ([v15 count] != 3)
        {
          id v17 = 0;
          goto LABEL_16;
        }
        uint64_t v16 = 2;
      }
      id v17 = [v15 objectAtIndexedSubscript:v16];
LABEL_16:

      goto LABEL_17;
    }
LABEL_29:
    CFRelease(v1);
    id v30 = [MEMORY[0x263EFF8C0] arrayWithArray:v0];
    id v3 = v32;
  }
  else
  {
    id v30 = objc_opt_new();
  }

  return v30;
}

id listKeychainItems()
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v2 = [v0 nextObject];
  if (v2)
  {
    id v3 = (void *)v2;
    do
    {
      id v51 = 0;
      id v52 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationRecord(v3, &v52, &v51);
      id v4 = v52;
      id v5 = v51;
      CFIndex v6 = [v5 dataUsingEncoding:4];
      CFIndex v7 = getSHA256(v6);

      id v8 = [v7 base64EncodedStringWithOptions:0];
      [v1 setObject:v5 forKeyedSubscript:v8];

      uint64_t v9 = [v0 nextObject];

      id v3 = (void *)v9;
    }
    while (v9);
  }
  long long v40 = objc_alloc_init(AppAttestEligibilityManager);
  id v10 = [(AppAttestEligibilityManager *)v40 allowlistedDaemons];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v16 = [v15 dataUsingEncoding:4];
        id v17 = getSHA256(v16);

        id v18 = [v17 base64EncodedStringWithOptions:0];
        [v1 setObject:v15 forKeyedSubscript:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v12);
  }
  char v19 = [MEMORY[0x263F01858] enumeratorWithOptions:0];

  uint64_t v20 = [v19 nextObject];
  if (v20)
  {
    char v21 = (void *)v20;
    do
    {
      id v45 = 0;
      id v46 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(v21, &v46, &v45);
      id v22 = v46;
      id v23 = v45;
      uint64_t v24 = v23;
      if (v22) {
        BOOL v25 = v23 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      if (!v25)
      {
        long long v26 = [v23 dataUsingEncoding:4];
        id v27 = getSHA256(v26);

        uint64_t v28 = [v27 base64EncodedStringWithOptions:0];
        [v1 setObject:v24 forKeyedSubscript:v28];
      }
      uint64_t v29 = [v19 nextObject];

      char v21 = (void *)v29;
    }
    while (v29);
  }
  id v30 = getAllCredentialKeychainLabels();
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v30;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = getApplicationIdentifierHashFromKeychainLabel(*(void **)(*((void *)&v41 + 1) + 8 * j));
        uint64_t v38 = [v1 objectForKey:v37];
        if (v38) {
          [v31 addObject:v38];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v34);
  }

  return v31;
}

void removeAllKeychainItemsForMissingApps()
{
  v0 = _DCAALogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_22216A000, v0, OS_LOG_TYPE_DEFAULT, "Cleaning up keychain", v12, 2u);
  }

  id v1 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v2 = listOfInstalledAppHashes();
  id v3 = (void *)[v1 initWithArray:v2];

  id v4 = listOfAllowlistedDaemonHashes();
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  CFIndex v6 = listOfInstalledExtensionHashes();
  CFIndex v7 = [v5 arrayByAddingObjectsFromArray:v6];

  id v8 = _DCAALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    removeAllKeychainItemsForMissingApps_cold_2();
  }

  uint64_t v9 = getAllCredentialKeychainLabels();
  __removeAllKeychainItemsForMissingApps_block_invoke((uint64_t)v9, v9, v7, &__block_literal_global_154);

  id v10 = _DCAALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    removeAllKeychainItemsForMissingApps_cold_1();
  }

  uint64_t v11 = getAllAssertionCounterKeychainLabels();
  __removeAllKeychainItemsForMissingApps_block_invoke((uint64_t)v11, v11, v7, &__block_literal_global_157);
}

id listOfInstalledAppHashes()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  id v1 = objc_opt_new();
  uint64_t v2 = _DCAALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    listOfInstalledAppHashes_cold_1();
  }

  uint64_t v3 = [v0 nextObject];
  if (v3)
  {
    id v5 = (void *)v3;
    *(void *)&long long v4 = 138412546;
    long long v14 = v4;
    do
    {
      id v15 = 0;
      id v16 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationRecord(v5, &v16, &v15);
      id v6 = v16;
      id v7 = v15;
      id v8 = [v7 dataUsingEncoding:4];
      uint64_t v9 = getSHA256(v8);

      id v10 = [v9 base64EncodedStringWithOptions:0];
      if (([v7 hasPrefix:@"com.apple."] & 1) == 0)
      {
        uint64_t v11 = _DCAALogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          id v18 = v7;
          __int16 v19 = 2112;
          uint64_t v20 = v10;
          _os_log_debug_impl(&dword_22216A000, v11, OS_LOG_TYPE_DEBUG, "    %@ -> %@\n", buf, 0x16u);
        }
      }
      objc_msgSend(v1, "addObject:", v10, v14);

      uint64_t v12 = [v0 nextObject];

      id v5 = (void *)v12;
    }
    while (v12);
  }

  return v1;
}

id listOfAllowlistedDaemonHashes()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v13 = objc_alloc_init(AppAttestEligibilityManager);
  v0 = [(AppAttestEligibilityManager *)v13 allowlistedDaemons];
  id v1 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [v7 dataUsingEncoding:4];
        uint64_t v9 = getSHA256(v8);

        id v10 = [v9 base64EncodedStringWithOptions:0];
        [v1 addObject:v10];
        uint64_t v11 = _DCAALogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v19 = v7;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          _os_log_debug_impl(&dword_22216A000, v11, OS_LOG_TYPE_DEBUG, "    %@ -> %@\n", buf, 0x16u);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v4);
  }

  return v1;
}

id listOfInstalledExtensionHashes()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F01858] enumeratorWithOptions:0];
  id v1 = objc_opt_new();
  id v2 = _DCAALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    listOfInstalledExtensionHashes_cold_1();
  }

  uint64_t v3 = [v0 nextObject];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    do
    {
      id v14 = 0;
      id v15 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(v4, &v15, &v14);
      id v5 = v15;
      id v6 = v14;
      id v7 = v6;
      if (v6)
      {
        id v8 = [v6 dataUsingEncoding:4];
        uint64_t v9 = getSHA256(v8);

        id v10 = [v9 base64EncodedStringWithOptions:0];
        uint64_t v11 = _DCAALogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          long long v17 = v7;
          __int16 v18 = 2112;
          __int16 v19 = v10;
          _os_log_debug_impl(&dword_22216A000, v11, OS_LOG_TYPE_DEBUG, "    %@ -> %@\n", buf, 0x16u);
        }

        [v1 addObject:v10];
      }

      uint64_t v12 = [v0 nextObject];

      uint64_t v4 = (void *)v12;
    }
    while (v12);
  }

  return v1;
}

void __removeAllKeychainItemsForMissingApps_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v27 = a4;
  uint64_t v28 = getAllAppUUIDKeychainLabels();
  uint64_t v29 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
        uint64_t v13 = _DCAALogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v52 = v12;
          _os_log_debug_impl(&dword_22216A000, v13, OS_LOG_TYPE_DEBUG, "    Checking %@\n", buf, 0xCu);
        }

        id v14 = getApplicationIdentifierHashFromKeychainLabel(v12);
        if (v14)
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v15 = v7;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v42;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v42 != v18) {
                  objc_enumerationMutation(v15);
                }
                if (objc_msgSend(v14, "isEqualToString:", *(void *)(*((void *)&v41 + 1) + 8 * i), v27))
                {

                  long long v37 = 0u;
                  long long v38 = 0u;
                  long long v35 = 0u;
                  long long v36 = 0u;
                  id v21 = v28;
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v49 count:16];
                  if (v22)
                  {
                    uint64_t v23 = v22;
                    uint64_t v24 = *(void *)v36;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v23; ++j)
                      {
                        if (*(void *)v36 != v24) {
                          objc_enumerationMutation(v21);
                        }
                        if ([v12 hasPrefix:*(void *)(*((void *)&v35 + 1) + 8 * j)])
                        {
                          long long v26 = _DCAALogSystem();
                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
                            __removeAllKeychainItemsForMissingApps_block_invoke_cold_3(&v33, v34);
                          }

                          goto LABEL_33;
                        }
                      }
                      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v49 count:16];
                      if (v23) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v20 = _DCAALogSystem();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                    __removeAllKeychainItemsForMissingApps_block_invoke_cold_2(&v31, v32);
                  }
                  goto LABEL_29;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v20 = _DCAALogSystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            __removeAllKeychainItemsForMissingApps_block_invoke_cold_1(&v39, v40);
          }
LABEL_29:

          [v29 addObject:v12];
        }
LABEL_33:

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v9);
  }

  v27[2](v27, v29);
}

void __removeAllKeychainItemsForMissingApps_block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = _DCAALogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v7;
          _os_log_debug_impl(&dword_22216A000, v8, OS_LOG_TYPE_DEBUG, "    Removing %@\n", buf, 0xCu);
        }

        deleteCredentialKeychainWithLabel(v7);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

void __removeAllKeychainItemsForMissingApps_block_invoke_155(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = _DCAALogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v7;
          _os_log_debug_impl(&dword_22216A000, v8, OS_LOG_TYPE_DEBUG, "    Removing %@\n", buf, 0xCu);
        }

        deleteAssertionCounterKeychainWithLabel(v7);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

void __fetchPublicKey_block_invoke(uint64_t a1)
{
  id v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __fetchPublicKey_block_invoke_161(uint64_t a1)
{
  id v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unsigned char *OUTLINED_FUNCTION_8(unsigned char *result, unsigned char *a2)
{
  *CFTypeRef result = 0;
  *a2 = 0;
  return result;
}

void sub_2221759E0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v3 + 16))(v3);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_222175DE4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v4 + 16))(v4);
  (*(void (**)(uint64_t))(v3 + 16))(v3);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t isRunningInRecovery()
{
  return 0;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (isRunningInDiagnosticsMode_onceToken != -1) {
    dispatch_once(&isRunningInDiagnosticsMode_onceToken, &__block_literal_global_2);
  }
  return isRunningInDiagnosticsMode_retval;
}

void __isRunningInDiagnosticsMode_block_invoke()
{
  id v1 = (id)MGCopyAnswer();
  v0 = isNSNumber(v1);

  if (v0) {
    isRunningInDiagnosticsMode_retval = [v1 BOOLValue];
  }
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id copy_current_process_name()
{
  return copy_process_name();
}

id copy_process_name()
{
  int v0 = MEMORY[0x270FA5388]();
  uint64_t v10 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x1000uLL);
  memset(v8, 0, sizeof(v8));
  if (v0
    && ([MEMORY[0x263F08D68] currentConnection], (id v1 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v2 = v1;
    pid_t v3 = [v1 processIdentifier];
  }
  else
  {
    pid_t v3 = getpid();
  }
  proc_pidpath(v3, buffer, 0x1000u);
  int v4 = strlen(buffer);
  if ((v4 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v4] == 47) {
        break;
      }
    }
    while (v4-- > 0);
  }
  __strlcpy_chk();
  uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", v8);
  return v6;
}

void AppAttest_DeviceAttestation_AttestKey(__SecKey *a1, void *a2, void *a3)
{
  v109[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__1;
  v105 = __Block_byref_object_dispose__1;
  id v106 = 0;
  if (!v6)
  {
    long long v37 = _DCAALogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      AppAttest_DeviceAttestation_AttestKey_cold_1(v37);
    }
    long long v38 = 0;
    goto LABEL_28;
  }
  double v10 = 60.0;
  if ((DeviceIdentityIsSupported() & 1) == 0)
  {
    uint64_t v39 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 216, -4, 0, @"Not supported", v7, v8, v9, v95);
    goto LABEL_23;
  }
  long long v11 = (id *)(v102 + 5);
  long long v12 = (void *)v102[5];
  if (isSupportedSPIClient_onceToken_0 != -1) {
    dispatch_once(&isSupportedSPIClient_onceToken_0, &__block_literal_global_3);
  }
  uint64_t v16 = copy_current_process_name();
  if (!v16)
  {
    long long v40 = createAppAttestError((uint64_t)"isSupportedSPIClient", 176, -1, 0, @"Failed to query process name.", v13, v14, v15, v95);
LABEL_22:
    id v42 = v40;

    objc_storeStrong(v11, v42);
    uint64_t v39 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 221, -1, (void *)v102[5], @"Client is not supported.", v43, v44, v45, v96);
    goto LABEL_23;
  }
  if (([(id)isSupportedSPIClient_supportedList_0 containsObject:v16] & 1) == 0)
  {
    long long v40 = createAppAttestError((uint64_t)"isSupportedSPIClient", 181, -1, 0, @"%@ is not allowed to use this API.  Please refer to the header file for onboarding information.", v17, v18, v19, (uint64_t)v16);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      long long v41 = [v40 localizedDescription];
      AppAttest_WebAuthentication_AttestKey_cold_2(v41, (uint8_t *)error);
    }
    goto LABEL_22;
  }

  objc_storeStrong(v11, v12);
  uint64_t v20 = (id *)(v102 + 5);
  id v21 = (id)v102[5];
  error[0] = 0;
  uint64_t v22 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  long long v26 = v22;
  if (!v22)
  {
    createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 58, -1, 0, @"Failed to create task.", v23, v24, v25, v95);
    id v21 = objc_claimAutoreleasedReturnValue();
    id v27 = 0;
    int v36 = 0;
    long long v35 = v21;
    goto LABEL_36;
  }
  id v27 = (void *)SecTaskCopyValueForEntitlement(v22, @"com.apple.appattest.spi", error);
  uint64_t v28 = isNSNumber(v27);
  if (!v28 || (char v29 = [v27 BOOLValue], v28, (v29 & 1) == 0))
  {
    CFErrorRef v47 = error[0];
    v108 = @"com.apple.appattest.spi";
    v109[0] = MEMORY[0x263EFFA88];
    long long v48 = [NSDictionary dictionaryWithObjects:v109 forKeys:&v108 count:1];
    uint64_t v52 = createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 64, -5, v47, @"Missing required entitlement: %@", v49, v50, v51, (uint64_t)v48);
LABEL_31:
    uint64_t v53 = (void *)v52;
LABEL_34:

    id v21 = v53;
    int v36 = 0;
    long long v35 = v21;
    goto LABEL_35;
  }
  id v30 = (void *)SecTaskCopyValueForEntitlement(v26, @"com.apple.mobileactivationd.eda", error);

  char v31 = isNSNumber(v30);
  if (!v31 || (char v32 = [v30 BOOLValue], v31, (v32 & 1) == 0))
  {
    CFErrorRef v54 = error[0];
    v108 = @"com.apple.mobileactivationd.eda";
    v109[0] = MEMORY[0x263EFFA88];
    long long v48 = [NSDictionary dictionaryWithObjects:v109 forKeys:&v108 count:1];
    uint64_t v53 = createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 70, -5, v54, @"Missing required entitlement: %@", v55, v56, v57, (uint64_t)v48);
    id v27 = v30;
    goto LABEL_34;
  }
  id v27 = (void *)SecTaskCopyValueForEntitlement(v26, @"com.apple.security.attestation.access", error);

  char v33 = isNSNumber(v27);
  if (!v33 || (char v34 = [v27 BOOLValue], v33, (v34 & 1) == 0))
  {
    CFErrorRef v91 = error[0];
    v108 = @"com.apple.security.attestation.access";
    v109[0] = MEMORY[0x263EFFA88];
    long long v48 = [NSDictionary dictionaryWithObjects:v109 forKeys:&v108 count:1];
    uint64_t v52 = createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 76, -5, v91, @"Missing required entitlement: %@", v92, v93, v94, (uint64_t)v48);
    goto LABEL_31;
  }
  long long v35 = 0;
  int v36 = 1;
LABEL_35:
  CFRelease(v26);
LABEL_36:
  if (error[0]) {
    CFRelease(error[0]);
  }

  objc_storeStrong(v20, v21);
  if (v36)
  {
    if (!a1) {
      goto LABEL_53;
    }
    CFDictionaryRef v61 = SecKeyCopyAttributes(a1);
    Value = (void *)CFDictionaryGetValue(v61, (const void *)*MEMORY[0x263F170D0]);
    uint64_t v63 = isNSString(Value);
    id v64 = v63;
    if (v63 && ![v63 compare:*MEMORY[0x263F170E8]])
    {
      v87 = (void *)CFDictionaryGetValue(v61, (const void *)*MEMORY[0x263F16F98]);
      v88 = isNSNumber(v87);
      uint64_t v66 = v88;
      if (v88 && ([v88 unsignedLongValue] == 256 || objc_msgSend(v66, "unsignedLongValue") == 384))
      {
        v89 = (void *)CFDictionaryGetValue(v61, (const void *)*MEMORY[0x263F16FA8]);
        id v90 = isNSString(v89);
        int v67 = v90;
        BOOL v65 = v90
           && (![v90 compare:*MEMORY[0x263F16FF0]]
            || ![v67 compare:*MEMORY[0x263F16FE8]]
            || ![v67 compare:*MEMORY[0x263F16FB8]]
            || ![v67 compare:*MEMORY[0x263F16FC8]]);
        goto LABEL_44;
      }
      BOOL v65 = 0;
    }
    else
    {
      BOOL v65 = 0;
      uint64_t v66 = 0;
    }
    int v67 = 0;
LABEL_44:
    if (v61) {
      CFRelease(v61);
    }

    if (v65)
    {
      id v68 = v5;
      uint64_t v69 = *MEMORY[0x263F399C0];
      v70 = [v68 objectForKeyedSubscript:*MEMORY[0x263F399C0]];
      uint64_t v71 = isNSNumber(v70);
      if (v71)
      {
        v72 = [v68 objectForKeyedSubscript:v69];
        char v73 = [v72 BOOLValue];

        if (v73)
        {
          uint64_t v77 = *MEMORY[0x263F39940];
          v78 = [v68 objectForKeyedSubscript:*MEMORY[0x263F39940]];
          v79 = isNSNumber(v78);

          if (!v79
            || ([v68 objectForKeyedSubscript:v77],
                v80 = objc_claimAutoreleasedReturnValue(),
                [v80 doubleValue],
                double v10 = v81,
                v80,
                v10 > 0.0))
          {
            v85 = v102;
            id v100 = (id)v102[5];
            long long v38 = createDeviceAttestationRequest(1, 1, (uint64_t)a1, v68, &v100);
            id v86 = v100;
            long long v46 = (void *)v85[5];
            v85[5] = (uint64_t)v86;
            goto LABEL_24;
          }
          uint64_t v39 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 244, -2, 0, @"Invalid network timeout requested", v82, v83, v84, v95);
LABEL_23:
          long long v38 = 0;
          long long v46 = (void *)v102[5];
          v102[5] = v39;
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
      }
      uint64_t v39 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 236, -3, 0, @"Invalid options", v74, v75, v76, v95);
      goto LABEL_23;
    }
LABEL_53:
    uint64_t v39 = createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 231, -3, 0, @"Invalid referenceKey", v58, v59, v60, v95);
    goto LABEL_23;
  }
  long long v38 = 0;
LABEL_25:
  if (!v102[5])
  {
    v97[0] = MEMORY[0x263EF8330];
    v97[1] = 3221225472;
    v97[2] = __AppAttest_DeviceAttestation_AttestKey_block_invoke;
    v97[3] = &unk_2645FB220;
    v99 = &v101;
    v98 = v6;
    AppAttest_Common_AttestKeyRequest(1u, 1, v38, a1, v97, v10);
    long long v37 = v98;
LABEL_28:

    goto LABEL_29;
  }
  (*((void (**)(id, void))v6 + 2))(v6, 0);
LABEL_29:

  _Block_object_dispose(&v101, 8);
}

void sub_222176B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __isSupportedSPIClient_block_invoke_0()
{
  int v0 = (void *)isSupportedSPIClient_supportedList_0;
  isSupportedSPIClient_supportedList_0 = (uint64_t)&unk_26D48E1F8;
}

id createGenericAuthenticatorDataShort(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a1;
  char v24 = a2;
  id v8 = a3;
  unsigned int v23 = 0;
  uint64_t v9 = isNSData(v7);
  if (v9 && (uint64_t v13 = (void *)v9, v14 = [v7 length], v13, v14 == 32))
  {
    isNSNumber(v8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithData:v7];
      [v19 appendBytes:&v24 length:1];
      unsigned int v23 = bswap32([v8 unsignedIntValue]);
      [v19 appendBytes:&v23 length:4];
      id v15 = v19;
      uint64_t v20 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v20 = createAppAttestError((uint64_t)"createGenericAuthenticatorDataShort", 41, -2, 0, @"Invalid counter", v16, v17, v18, v22);
      if (!a4) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v20 = createAppAttestError((uint64_t)"createGenericAuthenticatorDataShort", 36, -2, 0, @"Invalid rpID", v10, v11, v12, v22);
    id v15 = 0;
    if (!a4) {
      goto LABEL_9;
    }
  }
  if (!v15) {
    *a4 = v20;
  }
LABEL_9:

  return v15;
}

id createGenericAuthenticatorDataFull(void *a1, void *a2, char a3, void *a4, __SecKey *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a4;
  id v42 = 0;
  uint64_t v14 = encodeKeyToCOSE(a5, &v42);
  id v15 = v42;
  if (v15)
  {
    id v19 = v15;
    uint64_t v20 = createAppAttestError((uint64_t)"createGenericAuthenticatorDataFull", 80, -3, v15, @"Unable to generate credentialId.", v16, v17, v18, (uint64_t)v39);
    id v21 = 0;
    uint64_t v22 = 0;
    goto LABEL_12;
  }
  id v41 = 0;
  id v21 = createGenericAuthenticatorDataShort(v12, a3, v13, &v41);
  id v26 = v41;
  if (!v21)
  {
    char v34 = @"Unable to generate authenticator data";
    uint64_t v35 = 86;
    int v36 = v26;
LABEL_10:
    uint64_t v20 = createAppAttestError((uint64_t)"createGenericAuthenticatorDataFull", v35, -1, v36, v34, v23, v24, v25, (uint64_t)v39);
    uint64_t v22 = 0;
    id v19 = v26;
    goto LABEL_12;
  }
  [v21 appendData:v11];
  if ([v11 length] != 16)
  {
    char v34 = @"Invalid aaguid length!";
    uint64_t v35 = 92;
    int v36 = 0;
    goto LABEL_10;
  }
  __int16 v40 = 0;
  id v39 = v26;
  uint64_t v22 = generateCredentialId(a5, &v39, v27, v28, v29, v23, v24, v25);
  id v19 = v39;

  if (v22 && [v22 length] == 32)
  {
    __int16 v40 = 0x2000;
    [v21 appendBytes:&v40 length:2];
    [v21 appendData:v22];
    [v21 appendData:v14];
    id v33 = v21;
    id v21 = v33;
    goto LABEL_15;
  }
  uint64_t v20 = createAppAttestError((uint64_t)"createGenericAuthenticatorDataFull", 99, -1, v19, @"Invalid credentialId length!", v30, v31, v32, (uint64_t)v39);
LABEL_12:

  if (a6)
  {
    id v19 = v20;
    id v33 = 0;
    *a6 = v19;
  }
  else
  {
    id v33 = 0;
    id v19 = v20;
  }
LABEL_15:
  id v37 = v33;

  return v37;
}

void AppAttest_AppAttestation_CreateKey(long long *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v5;
    if (DeviceIdentityIsSupported())
    {
      id v78 = 0;
      char v11 = IsSupportedSPIClient(&v78);
      id v12 = v78;
      uint64_t v16 = v12;
      if (v11)
      {
        id v77 = v12;
        int v17 = AppAttest_Common_ValidateEntitlements(&v77);
        id v18 = v77;

        if (v17)
        {
          long long v19 = a1[1];
          long long v75 = *a1;
          long long v76 = v19;
          if ((AppAttest_AppAttestation_IsEligibleApplication(&v75) & 1) == 0)
          {
            uint64_t v68 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 123, -4, 0, @"Application not eligible", v20, v21, v22, v69);

            id v28 = 0;
            id v27 = 0;
            uint64_t v43 = 0;
            id v18 = (id)v68;
            goto LABEL_21;
          }
          long long v23 = a1[1];
          long long v75 = *a1;
          long long v76 = v23;
          int v24 = generateEnvironmentByAppSigning(&v75);
          id v73 = 0;
          id v74 = 0;
          id v72 = v18;
          long long v25 = a1[1];
          long long v75 = *a1;
          long long v76 = v25;
          char v26 = extractApplicationIdentifiers(&v75, &v74, &v73, &v72);
          id v27 = v74;
          id v28 = v73;
          id v29 = v72;

          if (v26)
          {
            HIDWORD(v69) = v24;
            resolveAppUUIDKeychain(v7, v27, v28);
            id v33 = (id)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              char v34 = [MEMORY[0x263F08C38] UUID];
              id v33 = [v34 UUIDString];
            }
            id v71 = v29;
            uint64_t v35 = (__SecKey *)createReferenceKeyBlob(0, 0, &v71);
            id v36 = v71;

            if (v35)
            {
              id v70 = v36;
              uint64_t v43 = generateCredentialIdString(v35, &v70, v37, v38, v39, v40, v41, v42);
              id v18 = v70;

              if (v43)
              {
                if (saveCredentialKeychain((uint64_t)v35, SHIDWORD(v69), v33, v28, v43))
                {
                  if (v33 == v7)
                  {
LABEL_33:
                    CFRelease(v35);
                    goto LABEL_21;
                  }
                  if (saveAppUUIDKeychain(v33, v27, v28))
                  {
LABEL_32:
                    id v7 = v33;
                    goto LABEL_33;
                  }
                  uint64_t v53 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 163, -3, 0, @"Failed to refresh appUUID keychain", v50, v51, v52, v69);

                  id v33 = 0;
                }
                else
                {
                  uint64_t v53 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 156, -3, 0, @"Failed to store keychain", v47, v48, v49, v69);
                }
                id v18 = v43;
              }
              else
              {
                uint64_t v53 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 151, -3, v18, @"Failed to generate credentialId", v44, v45, v46, v69);
              }

              uint64_t v43 = 0;
              id v18 = (id)v53;
              goto LABEL_32;
            }
            createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 145, -3, v36, @"Failed to create bik", v40, v41, v42, v69);
            id v18 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v43 = 0;
            id v7 = v33;
LABEL_21:
            CFDictionaryRef v61 = _DCAALogSystem();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
              AppAttest_AppAttestation_CreateKey_cold_2((uint64_t)v18, v61, v62, v63, v64, v65, v66, v67);
            }

            v6[2](v6, v7, v43, v18);
            goto LABEL_24;
          }
          createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 132, -2, v29, @"Unable to fetch application identifier", v30, v31, v32, v69);
          id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
          uint64_t v43 = 0;
          goto LABEL_21;
        }
      }
      else
      {
        createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 113, -4, v12, @"Client is not supported.", v13, v14, v15, v69);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 108, -4, 0, @"Not supported", v8, v9, v10, v69);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v28 = 0;
    id v27 = 0;
    goto LABEL_20;
  }
  uint64_t v43 = _DCAALogSystem();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    AppAttest_AppAttestation_CreateKey_cold_1(v43, v54, v55, v56, v57, v58, v59, v60);
  }
LABEL_24:
}

uint64_t IsSupportedSPIClient(void *a1)
{
  if (IsSupportedSPIClient_onceToken != -1) {
    dispatch_once(&IsSupportedSPIClient_onceToken, &__block_literal_global_4);
  }
  id v5 = copy_current_process_name();
  if (!v5)
  {
    createAppAttestError((uint64_t)"IsSupportedSPIClient", 493, -1, 0, @"Failed to query process name.", v2, v3, v4, v12);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (a1)
    {
LABEL_10:
      id v9 = v9;
      uint64_t v10 = 0;
      *a1 = v9;
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  if (([(id)IsSupportedSPIClient_supportedList containsObject:v5] & 1) == 0)
  {
    createAppAttestError((uint64_t)"IsSupportedSPIClient", 498, -1, 0, @"%@ is not allowed to use this API.  Please refer to the header file for onboarding information.", v6, v7, v8, (uint64_t)v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      IsSupportedSPIClient_cold_1(v9);
      if (a1) {
        goto LABEL_10;
      }
    }
    else if (a1)
    {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  id v9 = 0;
  uint64_t v10 = 1;
LABEL_13:

  return v10;
}

void AppAttest_AppAttestation_AttestKey(_OWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  if (v12)
  {
    if (DeviceIdentityIsSupported())
    {
      id v121 = 0;
      char v16 = IsSupportedSPIClient(&v121);
      id v17 = v121;
      uint64_t v21 = v17;
      if (v16)
      {
        id v120 = v17;
        int v22 = AppAttest_Common_ValidateEntitlements(&v120);
        id v23 = v120;

        if (v22)
        {
          long long v24 = a1[1];
          *(_OWORD *)buf = *a1;
          *(_OWORD *)&uint8_t buf[16] = v24;
          if (AppAttest_AppAttestation_IsEligibleApplication((long long *)buf))
          {
            long long v28 = a1[1];
            *(_OWORD *)buf = *a1;
            *(_OWORD *)&uint8_t buf[16] = v28;
            int EnvironmentByAppSigning = generateEnvironmentByAppSigning(buf);
            id v118 = 0;
            id v119 = 0;
            id v117 = v23;
            long long v30 = a1[1];
            *(_OWORD *)buf = *a1;
            *(_OWORD *)&uint8_t buf[16] = v30;
            char v31 = extractApplicationIdentifiers(buf, &v119, &v118, &v117);
            id v32 = v119;
            id v33 = v118;
            id v104 = v117;

            if (v31)
            {
              uint64_t v34 = resolveAppUUIDKeychain(v9, v32, v33);
              if (v34)
              {
                uint64_t v101 = (void *)v34;
                uint64_t v35 = isNSString(v10);

                if (v35)
                {
                  uint64_t v36 = isNSData(v11);
                  if (v36 && (uint64_t v37 = (void *)v36, v38 = [v11 length], v37, v38 < 0x21))
                  {
                    CredentialKeychain = (__SecKey *)loadCredentialKeychain(EnvironmentByAppSigning, v101, v33, v10);
                    if (CredentialKeychain)
                    {
                      uint64_t v82 = loadAssertionCounterKeychain(EnvironmentByAppSigning, v101, v33, v10);
                      uint64_t v55 = v82;
                      if (!v82 || (int)[v82 intValue] < 2)
                      {
                        v87 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:0];

                        id v116 = v104;
                        v99 = v87;
                        uint64_t v88 = createAppAttestationAuthenticatorDataFull(EnvironmentByAppSigning, v33, v87, CredentialKeychain, &v116);
                        id v100 = v116;

                        v105 = v88;
                        if (v88)
                        {
                          uint64_t v56 = v101;
                          uint64_t v55 = v99;
                          id v23 = v100;
LABEL_20:
                          v102 = v55;
                          if (v23)
                          {
                            uint64_t v57 = _DCAALogSystem();
                            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
                              AppAttest_AppAttestation_AttestKey_cold_1(v57, v58, v59, v60, v61, v62, v63, v64);
                            }

                            uint64_t v65 = _DCAALogSystem();
                            uint64_t v66 = CredentialKeychain;
                            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                              AppAttest_AppAttestation_AttestKey_cold_2(v23);
                            }

                            v12[2](v12, 0, v23);
                            if (!CredentialKeychain) {
                              goto LABEL_27;
                            }
                          }
                          else
                          {
                            dispatch_semaphore_t v98 = dispatch_semaphore_create(0);
                            v106[0] = MEMORY[0x263EF8330];
                            v106[1] = 3221225472;
                            v106[2] = __AppAttest_AppAttestation_AttestKey_block_invoke;
                            v106[3] = &unk_2645FB328;
                            int v115 = EnvironmentByAppSigning;
                            id v107 = v10;
                            id v108 = v55;
                            id v109 = v56;
                            id v110 = v33;
                            id v111 = v32;
                            v112 = v105;
                            dispatch_semaphore_t v113 = v98;
                            v114 = v12;
                            uint64_t v67 = v98;
                            int v68 = EnvironmentByAppSigning;
                            uint64_t v66 = CredentialKeychain;
                            id v23 = 0;
                            AppAttest_Common_AttestKey(0, v68, v110, CredentialKeychain, v112, v11, v106);
                            dispatch_semaphore_wait(v67, 0xFFFFFFFFFFFFFFFFLL);

                            if (!CredentialKeychain) {
                              goto LABEL_27;
                            }
                          }
                          CFRelease(v66);
LABEL_27:

                          uint64_t v47 = v105;
                          goto LABEL_28;
                        }
                        id v90 = _DCAALogSystem();
                        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                        {
                          int v96 = [v99 intValue];
                          *(_DWORD *)buf = 67110402;
                          *(_DWORD *)&uint8_t buf[4] = EnvironmentByAppSigning;
                          *(_WORD *)&buf[8] = 2112;
                          *(void *)&buf[10] = v10;
                          *(_WORD *)&buf[18] = 1024;
                          *(_DWORD *)&buf[20] = v96;
                          *(_WORD *)&uint8_t buf[24] = 2112;
                          *(void *)&buf[26] = v101;
                          *(_WORD *)&buf[34] = 2112;
                          *(void *)&buf[36] = v33;
                          *(_WORD *)&buf[44] = 2112;
                          *(void *)&buf[46] = v32;
                          _os_log_error_impl(&dword_22216A000, v90, OS_LOG_TYPE_ERROR, "Failed to create authenticator data for attestation. { env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x36u);
                        }

                        uint64_t v94 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 268, -3, v100, @"Failed to generate authenticator data", v91, v92, v93, v97);

                        v105 = 0;
                        id v23 = (id)v94;
                        uint64_t v55 = v99;
LABEL_44:
                        uint64_t v56 = v101;
                        goto LABEL_20;
                      }
                      uint64_t v83 = _DCAALogSystem();
                      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                      {
                        int v95 = [v55 intValue];
                        *(_DWORD *)buf = 138413314;
                        *(void *)&uint8_t buf[4] = v10;
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v95;
                        *(_WORD *)&buf[18] = 2112;
                        *(void *)&buf[20] = v101;
                        *(_WORD *)&buf[28] = 2112;
                        *(void *)&buf[30] = v33;
                        *(_WORD *)&buf[38] = 2112;
                        *(void *)&buf[40] = v32;
                        _os_log_error_impl(&dword_22216A000, v83, OS_LOG_TYPE_ERROR, "Key already used, cannot be re-attested. { keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x30u);
                      }

                      uint64_t v46 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 257, -3, 0, @"Key already used, cannot be reattested.", v84, v85, v86, v97);

                      v105 = 0;
LABEL_43:
                      id v23 = (id)v46;
                      goto LABEL_44;
                    }
                    v89 = _DCAALogSystem();
                    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67110146;
                      *(_DWORD *)&uint8_t buf[4] = EnvironmentByAppSigning;
                      *(_WORD *)&buf[8] = 2112;
                      *(void *)&buf[10] = v10;
                      *(_WORD *)&buf[18] = 2112;
                      *(void *)&buf[20] = v101;
                      *(_WORD *)&buf[28] = 2112;
                      *(void *)&buf[30] = v33;
                      *(_WORD *)&buf[38] = 2112;
                      *(void *)&buf[40] = v32;
                      _os_log_error_impl(&dword_22216A000, v89, OS_LOG_TYPE_ERROR, "Failed to load BIK from Keychain. { env=%d, keyID=%@, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x30u);
                    }

                    uint64_t v43 = @"Failed to load keychain";
                    uint64_t v44 = 250;
                    int v45 = -3;
                  }
                  else
                  {
                    uint64_t v39 = _DCAALogSystem();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                      AppAttest_AppAttestation_AttestKey_cold_5(v11);
                    }

                    uint64_t v43 = @"Invalid clientDataHash";
                    uint64_t v44 = 242;
                    int v45 = -2;
                  }
                  uint64_t v46 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", v44, v45, 0, v43, v40, v41, v42, v97);
                }
                else
                {
                  id v78 = _DCAALogSystem();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
                    AppAttest_AppAttestation_AttestKey_cold_4();
                  }

                  uint64_t v46 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 236, -2, v104, @"Invalid keyId", v79, v80, v81, v97);
                }
                uint64_t v55 = 0;
                CredentialKeychain = 0;
                v105 = 0;
                goto LABEL_43;
              }
              id v74 = _DCAALogSystem();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v9;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v33;
                *(_WORD *)&buf[22] = 2112;
                *(void *)&uint8_t buf[24] = v32;
                _os_log_error_impl(&dword_22216A000, v74, OS_LOG_TYPE_ERROR, "Failed resolved App UUID. { incomingAppUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x20u);
              }

              uint64_t v69 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 230, -2, 0, @"Invalid appUUID", v75, v76, v77, v97);
            }
            else
            {
              id v70 = _DCAALogSystem();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                AppAttest_AppAttestation_AttestKey_cold_6(v104);
              }

              uint64_t v69 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 223, -2, v104, @"Unable to fetch application identifier", v71, v72, v73, v97);
            }
          }
          else
          {
            uint64_t v69 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 213, -4, 0, @"Application not eligible", v25, v26, v27, v97);

            int EnvironmentByAppSigning = 0;
            id v33 = 0;
            id v32 = 0;
          }
          uint64_t v56 = 0;
          CredentialKeychain = 0;
          v105 = 0;
          id v23 = (id)v69;
          uint64_t v55 = 0;
          goto LABEL_20;
        }
      }
      else
      {
        createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 203, -4, v17, @"Client is not supported.", v18, v19, v20, v97);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 198, -4, 0, @"Not supported", v13, v14, v15, v97);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    int EnvironmentByAppSigning = 0;
    uint64_t v55 = 0;
    id v33 = 0;
    id v32 = 0;
    uint64_t v56 = 0;
    CredentialKeychain = 0;
    v105 = 0;
    goto LABEL_20;
  }
  uint64_t v47 = _DCAALogSystem();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    AppAttest_AppAttestation_AttestKey_cold_1(v47, v48, v49, v50, v51, v52, v53, v54);
  }
LABEL_28:
}

void AppAttest_AppAttestation_Assert(_OWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v102 = v9;
    uint64_t v103 = v11;
    id v104 = v10;
    if (os_variant_allows_internal_security_policies())
    {
      if ([v10 isEqualToString:@"__debug_aa_kc_cleanup__"])
      {
        removeAllKeychainItemsForMissingApps();
        (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
      }
      else if ([v10 isEqualToString:@"__debug_aa_kc_list__"])
      {
        uint64_t v21 = listKeychainItems();
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v113 objects:v119 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v114;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v114 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v113 + 1) + 8 * v25);
              uint64_t v27 = _DCAALogSystem();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v26;
                _os_log_debug_impl(&dword_22216A000, v27, OS_LOG_TYPE_DEBUG, "Found app ID in keychain. { appID=%@ }", buf, 0xCu);
              }

              ++v25;
            }
            while (v23 != v25);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v113 objects:v119 count:16];
          }
          while (v23);
        }
        (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);

        id v11 = v103;
        id v10 = v104;
      }
    }
    if (DeviceIdentityIsSupported())
    {
      id v112 = 0;
      char v31 = IsSupportedSPIClient(&v112);
      id v32 = v112;
      uint64_t v36 = v32;
      if (v31)
      {
        id v111 = v32;
        int v37 = AppAttest_Common_ValidateEntitlements(&v111);
        id v38 = v111;

        if (v37)
        {
          uint64_t v39 = isNSData(v11);
          if (!v39 || (v43 = (void *)v39, unint64_t v44 = [v11 length], v43, v44 >= 0x21))
          {
            int v45 = @"Invalid clientDataHash";
            uint64_t v46 = 399;
            int v47 = -2;
LABEL_24:
            uint64_t v48 = createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", v46, v47, 0, v45, v40, v41, v42, v101);

            uint64_t v49 = 0;
            uint64_t v50 = 0;
            uint64_t v51 = 0;
            id v52 = 0;
            uint64_t v53 = 0;
            uint64_t v54 = 0;
            uint64_t v13 = 0;
            id v38 = (id)v48;
LABEL_30:
            uint64_t v55 = _DCAALogSystem();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
              AppAttest_AppAttestation_Assert_cold_2((uint64_t)v51, v55, v56, v57, v58, v59, v60, v61);
            }

            (*((void (**)(id, void *, id))v12 + 2))(v12, v51, v38);
            id v9 = v102;
            id v11 = v103;
            id v10 = v104;
            goto LABEL_33;
          }
          long long v62 = a1[1];
          *(_OWORD *)buf = *a1;
          long long v118 = v62;
          if ((AppAttest_AppAttestation_IsEligibleApplication((long long *)buf) & 1) == 0)
          {
            int v45 = @"Application not eligible";
            uint64_t v46 = 404;
            int v47 = -4;
            goto LABEL_24;
          }
          long long v63 = a1[1];
          *(_OWORD *)buf = *a1;
          long long v118 = v63;
          int EnvironmentByAppSigning = generateEnvironmentByAppSigning(buf);
          id v109 = 0;
          id v110 = 0;
          id v108 = v38;
          long long v65 = a1[1];
          *(_OWORD *)buf = *a1;
          long long v118 = v65;
          char v66 = extractApplicationIdentifiers(buf, &v110, &v109, &v108);
          id v67 = v110;
          id v52 = v109;
          id v68 = v108;

          if (v66)
          {
            int v72 = EnvironmentByAppSigning;
            uint64_t v73 = resolveAppUUIDKeychain(v9, v67, v52);
            if (v73)
            {
              id v74 = (void *)v73;
              uint64_t v51 = isNSString(v10);

              if (v51)
              {
                CredentialKeychain = (__SecKey *)loadCredentialKeychain(v72, v74, v52, v10);
                if (CredentialKeychain)
                {
                  uint64_t v82 = CredentialKeychain;
                  uint64_t v50 = loadAssertionCounterKeychain(v72, v74, v52, v10);
                  uint64_t v51 = isNSNumber(v50);

                  cf = v82;
                  if (v51)
                  {
                    if ([v50 unsignedIntValue] != -1)
                    {
                      uint64_t v49 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v50, "unsignedIntValue") + 1);
                      uint64_t v54 = v74;
                      if (saveAssertionCounterKeychain(v49, v72, v74, v52, v104))
                      {
                        uint64_t v53 = v67;
                        id v107 = v68;
                        createAppAttestationAuthenticatorDataShort(v52, v50, &v107);
                        uint64_t v13 = v92 = v68;
                        id v93 = v107;

                        if (v104 && v13)
                        {
                          uint64_t v97 = v93;
                          id v106 = v93;
                          uint64_t v51 = generateAssertionObject(cf, v104, v13, v103, &v106);
                          id v38 = v106;
LABEL_57:

                          CFRelease(cf);
                          goto LABEL_30;
                        }
                        uint64_t v97 = v93;
                        createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 457, -3, v93, @"Failed to generate authenticator data", v94, v95, v96, v101);
                        id v38 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        uint64_t v53 = v67;
                        createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 450, -3, v68, @"Unable to update counter for authenticator data", v89, v90, v91, v101);
                        uint64_t v97 = v68;
                        id v38 = (id)objc_claimAutoreleasedReturnValue();
                        uint64_t v13 = 0;
                      }
                      uint64_t v51 = 0;
                      goto LABEL_57;
                    }
                    uint64_t v54 = v74;
                    uint64_t v53 = v67;
                    createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 442, -3, 0, @"Unable to update counter for authenticator data", v86, v87, v88, v101);
                    uint64_t v97 = v68;
                    id v38 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v13 = 0;
                    uint64_t v51 = 0;
                  }
                  else
                  {
                    uint64_t v54 = v74;
                    uint64_t v53 = v67;
                    createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 436, -3, v68, @"Key not yet attested", v83, v84, v85, v101);
                    uint64_t v97 = v68;
                    id v38 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v13 = 0;
                  }
                  uint64_t v49 = 0;
                  goto LABEL_57;
                }
                uint64_t v54 = v74;
                uint64_t v53 = v67;
                createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 430, -3, 0, @"Failed to load keychain", v79, v80, v81, v101);
                id v38 = (id)objc_claimAutoreleasedReturnValue();

                uint64_t v49 = 0;
                uint64_t v50 = 0;
                uint64_t v51 = 0;
              }
              else
              {
                uint64_t v54 = v74;
                uint64_t v53 = v67;
                createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 424, -2, v68, @"Invalid keyId", v75, v76, v77, v101);
                id v38 = (id)objc_claimAutoreleasedReturnValue();

                uint64_t v49 = 0;
                uint64_t v50 = 0;
              }
LABEL_29:
              uint64_t v13 = 0;
              goto LABEL_30;
            }
            uint64_t v53 = v67;
            dispatch_semaphore_t v98 = @"Invalid appUUID";
            uint64_t v99 = 419;
            id v100 = 0;
          }
          else
          {
            uint64_t v53 = v67;
            dispatch_semaphore_t v98 = @"Unable to fetch application identifier";
            uint64_t v99 = 413;
            id v100 = v68;
          }
          createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", v99, -2, v100, v98, v69, v70, v71, v101);
          id v38 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v49 = 0;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
LABEL_28:
          uint64_t v54 = 0;
          goto LABEL_29;
        }
      }
      else
      {
        createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 389, -4, v32, @"Client is not supported.", v33, v34, v35, v101);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 384, -4, 0, @"Not supported", v28, v29, v30, v101);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    id v52 = 0;
    uint64_t v53 = 0;
    goto LABEL_28;
  }
  uint64_t v13 = _DCAALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    AppAttest_AppAttestation_Assert_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
LABEL_33:
}

void __IsSupportedSPIClient_block_invoke()
{
  int v0 = (void *)IsSupportedSPIClient_supportedList;
  IsSupportedSPIClient_supportedList = (uint64_t)&unk_26D48E210;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x40u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t v2 = *(void **)(v0 + 40);
  return [v2 intValue];
}

void _DCLogDebugBinary_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22216A000, a2, OS_LOG_TYPE_DEBUG, "**BASE64DATAEND  (%@)**\n", (uint8_t *)&v2, 0xCu);
}

void AppAttest_WebAuthentication_AttestKey_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "FAILED";
  _os_log_debug_impl(&dword_22216A000, log, OS_LOG_TYPE_DEBUG, "AppAttest_WebAuthentication_AttestKey - (%s)\n", (uint8_t *)&v1, 0xCu);
}

void AppAttest_WebAuthentication_AttestKey_cold_2(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_22216A000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
}

void resolveAppUUIDKeychain_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_22216A000, v0, v1, "validateAppUUIDKeychain - (%@)\n", v2, v3, v4, v5, v6);
}

void resolveAppUUIDKeychain_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "validateAppUUIDKeychain(deleteMismatch) - (%s) - %@\n");
}

void resolveAppUUIDKeychain_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void resolveAppUUIDKeychain_cold_5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain - (%@)\n", v2, v3, v4, v5, v6);
}

void resolveAppUUIDKeychain_cold_7()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain - (%@) - exists(%@)\n");
}

void resolveAppUUIDKeychain_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain - invalid input identifiers!\n", v2, v3, v4, v5, v6);
}

void resolveAppUUIDKeychain_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain - loaded first gen key\n", v2, v3, v4, v5, v6);
}

void resolveAppUUIDKeychain_cold_11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain - invalid loaded application identifier / uuid - tampered?\n", v2, v3, v4, v5, v6);
}

void resolveAppUUIDKeychain_cold_12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain - invalid loaded app class - tampered?\n", v2, v3, v4, v5, v6);
}

void resolveAppUUIDKeychain_cold_13()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain -   loaded existing key <- (%@)\n", v2, v3, v4, v5, v6);
}

void resolveAppUUIDKeychain_cold_14()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "resolveAppUUIDKeychain - failed or no existing key\n", v2, v3, v4, v5, v6);
}

void saveAppUUIDKeychain_cold_1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "FAILED";
  __int16 v3 = 2112;
  uint64_t v4 = @"Invalid inputs";
  _os_log_debug_impl(&dword_22216A000, log, OS_LOG_TYPE_DEBUG, "saveAppUUIDKeychain - (%s) - %@\n", (uint8_t *)&v1, 0x16u);
}

void encodeKeyToCOSE_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Failed to fetch data representation of public key.", v2, v3, v4, v5, v6);
}

void encodeKeyToCOSE_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Failed to fetch size of public key.", v2, v3, v4, v5, v6);
}

void encodeKeyToCOSE_cold_3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = (int)[a1 intValue];
  _os_log_debug_impl(&dword_22216A000, a2, OS_LOG_TYPE_DEBUG, "Unsupported key coordinate size. { size=%ld }", (uint8_t *)&v3, 0xCu);
}

void fetchPublicKey_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Failed to fetch public key from BIK.", v2, v3, v4, v5, v6);
}

void fetchPublicKey_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_debug_impl(&dword_22216A000, a3, OS_LOG_TYPE_DEBUG, "Failed to fetch data representation of public key. { error=%@ }", (uint8_t *)a2, 0xCu);
}

void fetchPublicKey_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Key has invalid properties.", v2, v3, v4, v5, v6);
}

void generateCOSEForKeySize_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 length];
  OUTLINED_FUNCTION_7();
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_22216A000, a3, OS_LOG_TYPE_DEBUG, "COSE key representation of public key is of unexpected length. { length=%zu, expected=%ld }", v5, 0x16u);
}

void generateCOSEForKeySize_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_22216A000, v0, v1, "Cannot generate COSE encoding for key, unsupported coordinate size. { coordinateSize=%ld }", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment override disabled\n", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment override -> production\n", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment override -> development\n", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment override -> invalid value, not touched\n", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment detected as: Enterprise\n", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment detected as: Testflight", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment detected as: FreeDev, Dev", v2, v3, v4, v5, v6);
}

void generateEnvironmentByAppSigning_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Environment detected as: Store, Adhoc, Internal", v2, v3, v4, v5, v6);
}

void resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_22216A000, v0, v1, "   Overriding: (%@)\n", v2, v3, v4, v5, v6);
}

void resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_22216A000, v0, v1, "Original Clip: (%@)\n", v2, v3, v4, v5, v6);
}

void extractApplicationIdentifiers_cold_1(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_4(&dword_22216A000, (uint64_t)a2, a3, "Extracted application identifiers for daemon client connection. { realApplicationIdentifier=%@, resolvedApplicationIdentifier=%@ }", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void extractApplicationIdentifiers_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Connecting application identifier check is disabled, not comparing self identifier to connection identifier.", v2, v3, v4, v5, v6);
}

void saveCredentialKeychain_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "saveCredentialKeychain - (%s) - %@\n");
}

void loadCredentialKeychain_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "loadCredentialKeychain - (%s) - %@\n");
}

void deleteCredentialKeychainWithLabel_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "deleteCredentialKeychainWithLabel - (%s) - %@\n");
}

void saveAssertionCounterKeychain_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "saveAssertionCounterKeychain - (%s) - %@\n");
}

void loadAssertionCounterKeychain_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "loadAssertionCounterKeychain - (%s) - %@\n");
}

void deleteAssertionCounterKeychainWithLabel_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22216A000, v0, v1, "deleteAssertionCounterKeychainWithLabel - (%s) - %@\n");
}

void getApplicationIdentifierHashFromKeychainLabel_cold_1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_22216A000, v0, OS_LOG_TYPE_ERROR, "Error getting app identifier from keychain label – not enough components", v1, 2u);
}

void getAllAppUUIDKeychainLabels_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_3(&dword_22216A000, v2, (uint64_t)v2, "    Invalid appUUID found, skipping\n", v3);
}

void getAllAppUUIDKeychainLabels_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "  Valid appUUIDs\n", v2, v3, v4, v5, v6);
}

void removeAllKeychainItemsForMissingApps_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "  Cleaning getAllAssertionCounterKeychainLabels\n", v2, v3, v4, v5, v6);
}

void removeAllKeychainItemsForMissingApps_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "  Cleaning getAllCredentialKeychainLabels\n", v2, v3, v4, v5, v6);
}

void listOfInstalledAppHashes_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "  Installed apps\n", v2, v3, v4, v5, v6);
}

void listOfInstalledExtensionHashes_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "  Installed extensions\n", v2, v3, v4, v5, v6);
}

void __removeAllKeychainItemsForMissingApps_block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_3(&dword_22216A000, v2, (uint64_t)v2, "        App no longer installed - adding to remove list\n", v3);
}

void __removeAllKeychainItemsForMissingApps_block_invoke_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_3(&dword_22216A000, v2, (uint64_t)v2, "        AppUUID not current - adding to remove list\n", v3);
}

void __removeAllKeychainItemsForMissingApps_block_invoke_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_3(&dword_22216A000, v2, (uint64_t)v2, "        App still installed, AppUUID current - keeping\n", v3);
}

void AppAttest_DeviceAttestation_AttestKey_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "FAILED";
  _os_log_debug_impl(&dword_22216A000, log, OS_LOG_TYPE_DEBUG, "AppAttest_DeviceAttestation_AttestKey - (%s)\n", (uint8_t *)&v1, 0xCu);
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Client is an eligible application.", v2, v3, v4, v5, v6);
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Client is an eligible daemon.", v2, v3, v4, v5, v6);
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Client is an eligible application extension.", v2, v3, v4, v5, v6);
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Client is of ineligible type.", v2, v3, v4, v5, v6);
}

void AppAttest_AppAttestation_CreateKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AppAttest_AppAttestation_CreateKey_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IsSupportedSPIClient_cold_1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_22216A000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%@", v2, 0xCu);
}

void AppAttest_AppAttestation_AttestKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AppAttest_AppAttestation_AttestKey_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_22216A000, v2, v3, "Key attestation failed. { error=%@ }", v4, v5, v6, v7, v8);
}

void AppAttest_AppAttestation_AttestKey_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_22216A000, v0, OS_LOG_TYPE_ERROR, "Key ID is invalid. { keyID=%@ }", v1, 0xCu);
}

void AppAttest_AppAttestation_AttestKey_cold_5(void *a1)
{
  uint64_t v1 = [a1 base64EncodedStringWithOptions:0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_22216A000, v2, v3, "Invalid client data hash. { clientDataHash=%@ }", v4, v5, v6, v7, v8);
}

void AppAttest_AppAttestation_AttestKey_cold_6(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_22216A000, v2, v3, "Failed to fetch identifiers. { error=%@ }", v4, v5, v6, v7, v8);
}

void AppAttest_AppAttestation_Assert_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AppAttest_AppAttestation_Assert_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x270F0CD08]();
}

uint64_t DeviceIdentityCopyAttestationDictionary()
{
  return MEMORY[0x270F25E48]();
}

uint64_t DeviceIdentityIsSupported()
{
  return MEMORY[0x270F25E60]();
}

uint64_t DeviceIdentityUCRTAttestationSupported()
{
  return MEMORY[0x270F25E70]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A20](table);
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x270EFD638]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x270EFD678]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x270EFD998](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x270EFDB40]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}