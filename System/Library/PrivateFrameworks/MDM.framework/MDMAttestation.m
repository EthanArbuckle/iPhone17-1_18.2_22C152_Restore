@interface MDMAttestation
+ (id)sharedInstance;
- (BOOL)_retrieveCerts:(id *)a3 nonce:(id *)a4 issued:(id *)a5;
- (BOOL)_storeCerts:(id)a3 nonce:(id)a4 issued:(id)a5 outError:(id *)a6;
- (__SecKey)attestationKey:(BOOL)a3 outError:(id *)a4;
- (id)_expirationForIssued:(id)a3;
- (id)_requestAttestationCertChainAnonymous:(BOOL)a3 nonce:(id)a4 outError:(id *)a5;
- (id)attestationCertificateChainAnonymous:(BOOL)a3 nonce:(id)a4 outError:(id *)a5;
- (id)initPrivate;
- (void)reset;
@end

@implementation MDMAttestation

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MDMAttestation_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance__sharedInstance_0;
  return v2;
}

uint64_t __32__MDMAttestation_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance__sharedInstance_0 = [objc_alloc(*(Class *)(a1 + 32)) initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)MDMAttestation;
  v2 = [(MDMAttestation *)&v7 init];
  v3 = v2;
  if (v2)
  {
    certs = v2->_certs;
    v2->_key = 0;
    v2->_certs = 0;

    nonce = v3->_nonce;
    v3->_nonce = 0;
  }
  return v3;
}

- (__SecKey)attestationKey:(BOOL)a3 outError:(id *)a4
{
  BOOL v5 = a3;
  v21[3] = *MEMORY[0x263EF8340];
  if (MEMORY[0x230FC59D0](self, a2))
  {
    objc_super v7 = self;
    objc_sync_enter(v7);
    key = v7->_key;
    if (key)
    {
LABEL_19:
      objc_sync_exit(v7);

      return key;
    }
    key = (__SecKey *)[MEMORY[0x263F38B90] retrieveAttestationKeyWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationKey"];
    if (key)
    {
LABEL_4:
      v7->_key = key;
      goto LABEL_19;
    }
    [(MDMAttestation *)v7 reset];
    uint64_t v11 = *MEMORY[0x263F170E8];
    uint64_t v12 = *MEMORY[0x263F16FA8];
    v20[0] = *MEMORY[0x263F170D0];
    v20[1] = v12;
    v13 = (uint64_t *)MEMORY[0x263F16FE8];
    if (!v5) {
      v13 = (uint64_t *)MEMORY[0x263F16FF0];
    }
    uint64_t v14 = *v13;
    v21[0] = v11;
    v21[1] = v14;
    v20[2] = *MEMORY[0x263F17590];
    v21[2] = MEMORY[0x263EFFA88];
    CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    CFErrorRef error = 0;
    key = SecKeyCreateRandomKey(v15, &error);
    if (key)
    {
      if ([MEMORY[0x263F38B90] storeAttestationKey:key withGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationKey"])
      {

        goto LABEL_4;
      }
      if (a4)
      {
        v16 = (void *)MEMORY[0x263F087E8];
        v17 = DMCErrorArray();
        objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12109, v17, *MEMORY[0x263F38A40], 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      CFRelease(key);
    }
    else if (a4)
    {
      *a4 = error;
    }

    key = 0;
    goto LABEL_19;
  }
  if (a4)
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = DMCErrorArray();
    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12106, v10, *MEMORY[0x263F38A40], 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)attestationCertificateChainAnonymous:(BOOL)a3 nonce:(id)a4 outError:(id *)a5
{
  BOOL v7 = a3;
  id v9 = a4;
  v10 = self;
  uint64_t v11 = objc_sync_enter(v10);
  if (MEMORY[0x230FC59D0](v11))
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26E553C80, &unk_26E553C98, &unk_26E553CB0, 0);
    v13 = [MEMORY[0x263F38B98] chipID];
    if (v13 && ![v12 containsObject:v13])
    {
      if ([(MDMAttestation *)v10 attestationKey:v7 outError:a5])
      {
        location = (id *)&v10->_certs;
        if (!v10->_certs)
        {
          id v40 = 0;
          id v41 = 0;
          id v39 = 0;
          BOOL v35 = [(MDMAttestation *)v10 _retrieveCerts:&v41 nonce:&v40 issued:&v39];
          id v18 = v41;
          id v34 = v41;
          id v19 = v40;
          id v33 = v40;
          id v20 = v39;
          id v21 = v39;
          if (v35)
          {
            id v36 = v21;
            objc_storeStrong(location, v18);
            objc_storeStrong((id *)&v10->_nonce, v19);
            objc_storeStrong((id *)&v10->_issued, v20);
            id v21 = v36;
          }

          if (!*location) {
            goto LABEL_33;
          }
        }
        if (v10->_issued
          && ([MEMORY[0x263EFF910] date],
              v22 = objc_claimAutoreleasedReturnValue(),
              [(MDMAttestation *)v10 _expirationForIssued:v10->_issued],
              v23 = objc_claimAutoreleasedReturnValue(),
              uint64_t v24 = [v22 compare:v23],
              v23,
              v22,
              v24 == -1))
        {
          v29 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230A49000, v29, OS_LOG_TYPE_DEFAULT, "Returning existing attestation certificate because of rate limiting", buf, 2u);
          }
        }
        else
        {
LABEL_33:
          if (![(NSData *)v10->_nonce isEqualToData:v9])
          {
            uint64_t v25 = [(MDMAttestation *)v10 _requestAttestationCertChainAnonymous:v7 nonce:v9 outError:a5];
            id v26 = *location;
            id *location = (id)v25;

            if (*location)
            {
              v27 = [MEMORY[0x263EFF910] date];
              if ([(MDMAttestation *)v10 _storeCerts:v10->_certs nonce:v9 issued:v27 outError:a5])
              {
                objc_storeStrong((id *)&v10->_nonce, a4);
                objc_storeStrong((id *)&v10->_issued, v27);
                a5 = v10->_certs;
              }
              else
              {
                if (a5)
                {
                  v30 = (void *)MEMORY[0x263F087E8];
                  v31 = DMCErrorArray();
                  objc_msgSend(v30, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12112, v31, *MEMORY[0x263F38A40], 0);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                }
                id v32 = *location;
                id *location = 0;

                a5 = 0;
              }

              goto LABEL_20;
            }
            goto LABEL_19;
          }
        }
        a5 = (id *)*location;
        goto LABEL_20;
      }
    }
    else
    {
      if (!a5)
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      CFDictionaryRef v15 = DMCErrorArray();
      objc_msgSend(v14, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12106, v15, *MEMORY[0x263F38A40], 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_19:
    a5 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    v16 = (void *)MEMORY[0x263F087E8];
    v17 = DMCErrorArray();
    objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x263F38B10], 12106, v17, *MEMORY[0x263F38A40], 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_21:
  objc_sync_exit(v10);

  return a5;
}

- (id)_requestAttestationCertChainAnonymous:(BOOL)a3 nonce:(id)a4 outError:(id *)a5
{
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v19 = a4;
  id v21 = [MEMORY[0x263F52858] oidsAnonymous:v5 nonce:v19 != 0 coresidency:0];
  id v20 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  [v20 setObject:&unk_26E553CC8 forKeyedSubscript:*MEMORY[0x263F399E0]];
  [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x263F399B0]];
  [v20 setObject:v19 forKeyedSubscript:*MEMORY[0x263F39948]];
  [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F399C0]];
  [v20 setObject:&unk_26E553CE0 forKeyedSubscript:*MEMORY[0x263F39940]];
  v22 = (void *)[v20 copy];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__0;
  id v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  for (int i = 2; i != -1; --i)
  {
    v8 = v6;
    AppAttest_DeviceAttestation_AttestKey();
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (v30[5])
    {
      uint64_t v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "Successfully retrieved attestation certificate";
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_13:
        _os_log_impl(&dword_230A49000, v13, v14, v12, buf, 2u);
      }
LABEL_14:

      goto LABEL_15;
    }
    if ([(id)v24[5] code] != -7)
    {
      CFDictionaryRef v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "Failed to fetch attestation certificate, not retrying";
        v13 = v15;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    id v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = i;
      _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch attestation certificate, %u retries left", buf, 8u);
    }
  }
  v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_ERROR, "Out of retries retrieving attestation certificate", buf, 2u);
  }
LABEL_15:
  if (a5) {
    *a5 = (id) v24[5];
  }
  id v16 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __71__MDMAttestation__requestAttestationCertChainAnonymous_nonce_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  if (v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v5;
LABEL_3:
    v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
    goto LABEL_8;
  }
  if (v16 && [v16 count] == 2)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v16;
    goto LABEL_3;
  }
  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F38B10];
  v10 = DMCErrorArray();
  uint64_t v13 = objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12107, v10, *MEMORY[0x263F38A40], 0);
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  CFDictionaryRef v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  key = obj->_key;
  if (key)
  {
    CFRelease(key);
    v2 = obj;
    obj->_key = 0;
  }
  certs = v2->_certs;
  v2->_certs = 0;

  nonce = obj->_nonce;
  obj->_nonce = 0;

  [MEMORY[0x263F38B90] deleteAttestationKeyWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationKey"];
  [MEMORY[0x263F38B90] deleteAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationCert"];
  [MEMORY[0x263F38B90] deleteAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationIntermediate"];
  [MEMORY[0x263F38B90] deleteAttestationMetadataWithGroup:@"com.apple.mdm.attestation" service:@"MDMAttestationMetadata"];
  objc_sync_exit(obj);
}

- (BOOL)_storeCerts:(id)a3 nonce:(id)a4 issued:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [MEMORY[0x263F38B90] deleteAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationCert"];
  [MEMORY[0x263F38B90] deleteAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationIntermediate"];
  [MEMORY[0x263F38B90] deleteAttestationMetadataWithGroup:@"com.apple.mdm.attestation" service:@"MDMAttestationMetadata"];
  uint64_t v12 = (void *)MEMORY[0x263F38B90];
  uint64_t v13 = [v9 objectAtIndexedSubscript:0];
  char v14 = [v12 storeAttestationCert:v13 withGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationCert"];

  if (v14)
  {
    CFDictionaryRef v15 = (void *)MEMORY[0x263F38B90];
    id v16 = [v9 objectAtIndexedSubscript:1];
    int v17 = [v15 storeAttestationCert:v16 withGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationIntermediate"];

    if (a6 && (v17 & 1) == 0)
    {
      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F38B10];
      id v20 = DMCErrorArray();
      uint64_t v21 = *MEMORY[0x263F38A40];
      v22 = v18;
      uint64_t v23 = v19;
      uint64_t v24 = 12111;
LABEL_7:
      objc_msgSend(v22, "DMCErrorWithDomain:code:descriptionArray:errorType:", v23, v24, v20, v21, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
      a6 = 0;
      goto LABEL_9;
    }
    if (!v17) {
      goto LABEL_8;
    }
    uint64_t v29 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    [v29 setObject:v11 forKeyedSubscript:@"issued"];
    [v29 setObject:v10 forKeyedSubscript:@"nonce"];
    a6 = [MEMORY[0x263F08AC0] dataWithPropertyList:v29 format:200 options:0 error:a6];

    if (!a6
      || ([MEMORY[0x263F38B90] storeAttestationMetadata:a6 withGroup:@"com.apple.mdm.attestation" service:@"MDMAttestationMetadata"] & 1) != 0)
    {
      BOOL v27 = 1;
      goto LABEL_10;
    }
  }
  else if (a6)
  {
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F38B10];
    id v20 = DMCErrorArray();
    uint64_t v21 = *MEMORY[0x263F38A40];
    v22 = v25;
    uint64_t v23 = v26;
    uint64_t v24 = 12110;
    goto LABEL_7;
  }
LABEL_9:
  [MEMORY[0x263F38B90] deleteAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationCert"];
  [MEMORY[0x263F38B90] deleteAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationIntermediate"];
  [MEMORY[0x263F38B90] deleteAttestationMetadataWithGroup:@"com.apple.mdm.attestation" service:@"MDMAttestationMetadata"];
  BOOL v27 = 0;
LABEL_10:

  return v27;
}

- (BOOL)_retrieveCerts:(id *)a3 nonce:(id *)a4 issued:(id *)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = [MEMORY[0x263F38B90] retrieveAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationCert"];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [MEMORY[0x263F38B90] retrieveAttestationCertWithGroup:@"com.apple.mdm.attestation" label:@"MDMAttestationIntermediate"];
    if (v10)
    {
      id v11 = (void *)v10;
      uint64_t v12 = [MEMORY[0x263F38B90] retrieveAttestationMetadataWithGroup:@"com.apple.mdm.attestation" service:@"MDMAttestationMetadata"];
      if (v12)
      {
        uint64_t v13 = [MEMORY[0x263F08AC0] propertyListWithData:v12 options:0 format:0 error:0];
        if (v13)
        {
          char v14 = (void *)v13;
          v16[0] = v9;
          v16[1] = v11;
          *a3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

          *a4 = [v14 objectForKeyedSubscript:@"nonce"];
          *a5 = [v14 objectForKeyedSubscript:@"issued"];

          LOBYTE(v8) = 1;
          return v8;
        }
      }
      CFRelease(v9);
      CFRelease(v11);
    }
    else
    {
      CFRelease(v9);
    }
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)_expirationForIssued:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF918];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [MEMORY[0x263F38B70] attestationRateLimitOverrideMinutes];
  BOOL v7 = v6;
  if (v6) {
    objc_msgSend(v5, "setMinute:", objc_msgSend(v6, "integerValue"));
  }
  else {
    [v5 setDay:7];
  }
  uint64_t v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v9 = [v8 dateByAddingComponents:v5 toDate:v4 options:0];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issued, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certs, 0);
}

@end