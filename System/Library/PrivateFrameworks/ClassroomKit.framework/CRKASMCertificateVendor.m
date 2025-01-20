@interface CRKASMCertificateVendor
- (BOOL)isEqual:(id)a3;
- (CRKASMCertificateVendor)initWithCredentialStore:(id)a3;
- (CRKASMCredentialStore)credentialStore;
- (id)certificatesForUserIdentifier:(id)a3;
- (id)certificatesForUserIdentifiers:(id)a3;
- (id)manifest;
- (unint64_t)hash;
- (void)forgetPersistentIDs:(id)a3;
@end

@implementation CRKASMCertificateVendor

- (CRKASMCertificateVendor)initWithCredentialStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMCertificateVendor;
  v6 = [(CRKASMCertificateVendor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_credentialStore, a3);
  }

  return v7;
}

- (id)certificatesForUserIdentifier:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  id v5 = [(CRKASMCertificateVendor *)self certificatesForUserIdentifiers:v4];

  return v5;
}

- (id)certificatesForUserIdentifiers:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32 = objc_opt_new();
  v36 = objc_opt_new();
  v37 = self;
  id v5 = [(CRKASMCertificateVendor *)self manifest];
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"Process certificate manifest contents for %lu user identifiers", objc_msgSend(v4, "count"));
  v30 = +[CRKExecutionTimer startedTimerWithDescription:](CRKExecutionTimer, "startedTimerWithDescription:");
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [v5 persistentIDs];
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  v35 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    id v34 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v38 = v7;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x22A6208B0]();
        v12 = [v5 entryForPersistentID:v10];
        if ([v12 isFullyPopulated])
        {
          v13 = [v12 userIdentifier];
          int v14 = [v4 containsObject:v13];

          v15 = [v12 validityInterval];
          int v16 = objc_msgSend(v15, "crk_containsCurrentDate");

          if (v14) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            uint64_t v7 = v38;
            goto LABEL_24;
          }
          v18 = [(CRKASMCertificateVendor *)v37 credentialStore];
          v19 = [v18 certificateWithPersistentID:v10];

          if (v19)
          {
            v20 = [v12 fingerprint];
            if (v20 || ([v19 fingerprint], (v33 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v21 = [v12 fingerprint];
              v22 = [v19 fingerprint];
              char v23 = [v21 isEqual:v22];

              if (v20) {
              else
              }

              id v4 = v34;
              id v5 = v35;
              if ((v23 & 1) == 0) {
                goto LABEL_20;
              }
            }
            else
            {
              v33 = 0;
            }
            v24 = v32;
            v25 = v19;
          }
          else
          {
LABEL_20:
            v24 = v36;
            v25 = v10;
          }
          [v24 addObject:v25];
          uint64_t v7 = v38;
        }
LABEL_24:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v7);
  }

  [(CRKASMCertificateVendor *)v37 forgetPersistentIDs:v36];
  v26 = _CRKLogASM_17();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [v30 stop];
    *(_DWORD *)buf = 138412290;
    v45 = v27;
    _os_log_impl(&dword_224C00000, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v28 = (void *)[v32 copy];

  return v28;
}

- (id)manifest
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = +[CRKExecutionTimer startedTimerWithDescription:@"Read certificate manifest"];
  id v4 = [(CRKASMCertificateVendor *)self credentialStore];
  id v5 = [v4 certificateManifest];

  uint64_t v6 = _CRKLogASM_17();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v3 stop];
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (void)forgetPersistentIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = _CRKLogASM_17();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CRKASMCertificateVendor forgetPersistentIDs:](v4, v5);
    }

    uint64_t v6 = [(CRKASMCertificateVendor *)self credentialStore];
    [v6 forgetCertificatesWithPersistentIDs:v4];
  }
}

- (unint64_t)hash
{
  v2 = [(CRKASMCertificateVendor *)self credentialStore];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [@"credentialStore" componentsSeparatedByString:@","];
  uint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_15;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  uint64_t v8 = self;
  int v9 = (CRKASMCertificateVendor *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMCertificateVendor *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          BOOL v17 = v9;
          uint64_t v18 = [(CRKASMCertificateVendor *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMCertificateVendor *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (CRKASMCredentialStore)credentialStore
{
  return self->_credentialStore;
}

- (void).cxx_destruct
{
}

- (void)forgetPersistentIDs:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Found %lu invalid trusted user certificates", (uint8_t *)&v3, 0xCu);
}

@end