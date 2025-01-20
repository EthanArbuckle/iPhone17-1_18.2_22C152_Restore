@interface HMMTRFabricDataFetcher
+ (id)logCategory;
- (HMMTRFabricDataFetcher)initWithCHIPStorageDelegate:(id)a3 keychainDelegate:(id)a4;
- (HMMTRFabricDataFetcherCHIPStorageDelegate)chipStorageDelegate;
- (HMMTRFabricDataFetcherKeychainDelegate)keychainDelegate;
- (id)locallyStoredFabricDataWithError:(id *)a3;
- (id)logIdentifier;
- (void)setChipStorageDelegate:(id)a3;
- (void)setKeychainDelegate:(id)a3;
@end

@implementation HMMTRFabricDataFetcher

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keychainDelegate);
  objc_destroyWeak((id *)&self->_chipStorageDelegate);
}

- (void)setKeychainDelegate:(id)a3
{
}

- (HMMTRFabricDataFetcherKeychainDelegate)keychainDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keychainDelegate);
  return (HMMTRFabricDataFetcherKeychainDelegate *)WeakRetained;
}

- (void)setChipStorageDelegate:(id)a3
{
}

- (HMMTRFabricDataFetcherCHIPStorageDelegate)chipStorageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chipStorageDelegate);
  return (HMMTRFabricDataFetcherCHIPStorageDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMMTRFabricDataFetcher *)self chipStorageDelegate];
  v3 = [v2 identifier];

  return v3;
}

- (id)locallyStoredFabricDataWithError:(id *)a3
{
  v5 = [(HMMTRFabricDataFetcher *)self keychainDelegate];
  v6 = [v5 nocSigner];
  v7 = (void *)[v6 copyV0KeyPair];

  if (v7)
  {
    CFDataRef v8 = SecKeyCopyExternalRepresentation((SecKeyRef)[v7 publicKey], 0);
    v9 = [(HMMTRFabricDataFetcher *)self chipStorageDelegate];
    v10 = [v9 keyValueStore];
    v11 = [v10 objectForKeyedSubscript:@"HMDHMMKVS.fabricID"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = [v9 keyValueStore];
      v15 = [v14 objectForKeyedSubscript:@"IPK"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;

      if (v17
        && (uint64_t v18 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v17 options:0]) != 0)
      {
        v19 = (void *)v18;
        v20 = [v9 keyValueStore];
        v21 = [v20 objectForKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v22 = v21;
        }
        else {
          v22 = 0;
        }
        id v23 = v22;

        v42 = v23;
        CFDataRef v39 = v8;
        if (v23) {
          v24 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v23 options:0];
        }
        else {
          v24 = 0;
        }
        uint64_t v41 = [MEMORY[0x263F10CC0] convertX509Certificate:v24];
        v40 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v41];
        v26 = [v40 subject];
        uint64_t v27 = [v26 nodeID];

        v43 = (void *)v27;
        if (v27)
        {
          v37 = v19;
          v38 = v24;
          v28 = [v9 keyValueStore];
          v29 = [v28 objectForKeyedSubscript:@"HMD.MTRPlugin.RootCert"];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v30 = v29;
          }
          else {
            v30 = 0;
          }
          id v31 = v30;

          if (v31
            && (uint64_t v32 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v31 options:0]) != 0)
          {
            v33 = (void *)v32;
            CFDataRef v8 = v39;
            v34 = v40;
            if ([MEMORY[0x263F10CC0] keypair:v7 matchesCertificate:v32])
            {
              v25 = [[HMMTRFabricDataSnapshot alloc] initWithRootPublicKey:v39 fabricID:v13 ipk:v37 residentNodeID:v43 rootKeyPair:v7 rootCert:v33];
            }
            else
            {
              *a3 = [MEMORY[0x263F087E8] hapErrorWithCode:36];

              v25 = 0;
            }
            v19 = v37;
          }
          else
          {
            [MEMORY[0x263F087E8] hapErrorWithCode:36];
            v25 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            v19 = v37;
            CFDataRef v8 = v39;
            v34 = v40;
          }

          v24 = v38;
          v35 = (void *)v41;
        }
        else
        {
          [MEMORY[0x263F087E8] hapErrorWithCode:36];
          v25 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          v34 = v40;
          v35 = (void *)v41;
          CFDataRef v8 = v39;
        }
      }
      else
      {
        [MEMORY[0x263F087E8] hapErrorWithCode:36];
        v25 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [MEMORY[0x263F087E8] hmfErrorWithCode:2];
      v25 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v25 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (HMMTRFabricDataFetcher)initWithCHIPStorageDelegate:(id)a3 keychainDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMTRFabricDataFetcher;
  CFDataRef v8 = [(HMMTRFabricDataFetcher *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_chipStorageDelegate, v6);
    objc_storeWeak((id *)&v9->_keychainDelegate, v7);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_5817 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_5817, &__block_literal_global_5818);
  }
  v2 = (void *)logCategory__hmf_once_v5_5819;
  return v2;
}

uint64_t __37__HMMTRFabricDataFetcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_5819;
  logCategory__hmf_once_v5_5819 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end