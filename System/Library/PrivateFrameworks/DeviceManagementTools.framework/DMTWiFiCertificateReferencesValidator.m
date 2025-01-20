@interface DMTWiFiCertificateReferencesValidator
- (BOOL)validateProfile:(id)a3 error:(id *)a4;
@end

@implementation DMTWiFiCertificateReferencesValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v6 = [v5 payloadsOfType:@"com.apple.wifi.managed"];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v24 = a4;
    v25 = v5;
    v9 = 0;
    uint64_t v10 = *(void *)v32;
    v26 = v6;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v31 + 1) + 8 * i);
        if (!v9)
        {
          v9 = [v25 payloadsByUUID];
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v13 = objc_msgSend(v12, "certificateAnchorUUID", v23);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * j);
              v19 = [v9 objectForKeyedSubscript:v18];

              if (!v19)
              {
                if (v24)
                {
                  v35[0] = @"kDMTInvalidConfigurationProfileValueErrorKey";
                  v35[1] = @"PayloadCertificateAnchorUUID[]";
                  v36[0] = @"PayloadCertificateAnchorUUID[]";
                  v36[1] = v18;
                  v21 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
                  DMTErrorWithCodeAndUserInfo(76, v21);
                  id *v24 = (id)objc_claimAutoreleasedReturnValue();
                }
                BOOL v20 = 0;
                id v5 = v25;
                v6 = v26;
                goto LABEL_23;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        v6 = v26;
        uint64_t v10 = v23;
      }
      uint64_t v8 = [v26 countByEnumeratingWithState:&v31 objects:v38 count:16];
      BOOL v20 = 1;
      id v5 = v25;
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    BOOL v20 = 1;
  }
LABEL_23:

  return v20;
}

@end