@interface HMMTRFabricControllerStore
+ (BOOL)startupParams1:(id)a3 isEquivalentTo:(id)a4;
+ (BOOL)startupParams2:(id)a3 isEquivalentTo:(id)a4;
+ (BOOL)startupParams:(id)a3 isEquivalentTo:(id)a4;
+ (id)logCategory;
- (HMMTRControllerFactory)controllerFactory;
- (HMMTRFabricControllerStore)initWithQueue:(id)a3 controllerFactory:(id)a4;
- (NSMutableDictionary)controllerWrappers;
- (OS_dispatch_queue)workQueue;
- (id)cachedWrapperWithFabricID:(id)a3;
- (id)wrapperWithTargetFabricUUID:(id)a3 startupParams:(id)a4 allTargetFabricUUIDs:(id)a5 entityIdentifier:(id)a6;
- (void)_auditControllerWrappersWithAllFabricUUIDs:(id)a3;
- (void)removeAllGetters;
@end

@implementation HMMTRFabricControllerStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerWrappers, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSMutableDictionary)controllerWrappers
{
  return self->_controllerWrappers;
}

- (HMMTRControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_auditControllerWrappersWithAllFabricUUIDs:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2533B64D0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v8;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Hitting maximum number of getters. Removing unused and restarting factory. Currently used: %@", buf, 0x16u);
  }
  v27 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(HMMTRFabricControllerStore *)v6 controllerWrappers];
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v30;
    *(void *)&long long v10 = 138543618;
    long long v26 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v14, v26) & 1) == 0)
        {
          v15 = (void *)MEMORY[0x2533B64D0]();
          v16 = v6;
          v17 = v6;
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v26;
            v35 = v19;
            __int16 v36 = 2112;
            id v37 = v14;
            _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing %@ from factory", buf, 0x16u);
          }
          v20 = [(HMMTRFabricControllerStore *)v17 controllerWrappers];
          v21 = [v20 objectForKeyedSubscript:v14];
          [v21 remove];

          [v27 addObject:v14];
          v6 = v16;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  v22 = [(HMMTRFabricControllerStore *)v6 controllerWrappers];
  [v22 removeObjectsForKeys:v27];

  v23 = [(HMMTRFabricControllerStore *)v6 controllerFactory];
  v24 = [v23 disableNormalOperation];

  v25 = [(HMMTRFabricControllerStore *)v6 controllerFactory];
  [v25 enableNormalOperationWithToken:v24];
}

- (void)removeAllGetters
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v10 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing all controller wrappers", buf, 0xCu);
  }
  v7 = [(HMMTRFabricControllerStore *)v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HMMTRFabricControllerStore_removeAllGetters__block_invoke;
  block[3] = &unk_265378638;
  block[4] = v4;
  dispatch_async(v7, block);
}

void __46__HMMTRFabricControllerStore_removeAllGetters__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "controllerWrappers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        v8 = [*(id *)(a1 + 32) controllerWrappers];
        uint64_t v9 = [v8 objectForKeyedSubscript:v7];
        [v9 remove];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  long long v10 = [*(id *)(a1 + 32) controllerWrappers];
  [v10 removeAllObjects];
}

- (id)cachedWrapperWithFabricID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2675;
  uint64_t v16 = __Block_byref_object_dispose__2676;
  id v17 = 0;
  uint64_t v5 = [(HMMTRFabricControllerStore *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMMTRFabricControllerStore_cachedWrapperWithFabricID___block_invoke;
  block[3] = &unk_265377F50;
  block[4] = self;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__HMMTRFabricControllerStore_cachedWrapperWithFabricID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) controllerWrappers];
  uint64_t v3 = [v2 allValues];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HMMTRFabricControllerStore_cachedWrapperWithFabricID___block_invoke_2;
  v8[3] = &unk_265375BA0;
  id v9 = *(id *)(a1 + 40);
  id v4 = objc_msgSend(v3, "na_filter:", v8);

  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

uint64_t __56__HMMTRFabricControllerStore_cachedWrapperWithFabricID___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 startupParams];
  id v4 = [v3 fabricID];
  uint64_t v5 = [v2 isEqual:v4];

  return v5;
}

- (id)wrapperWithTargetFabricUUID:(id)a3 startupParams:(id)a4 allTargetFabricUUIDs:(id)a5 entityIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__2675;
  long long v31 = __Block_byref_object_dispose__2676;
  id v32 = 0;
  uint64_t v14 = [(HMMTRFabricControllerStore *)self workQueue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __110__HMMTRFabricControllerStore_wrapperWithTargetFabricUUID_startupParams_allTargetFabricUUIDs_entityIdentifier___block_invoke;
  v21[3] = &unk_265375B78;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v13;
  id v25 = v12;
  long long v26 = &v27;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(v14, v21);

  id v19 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v19;
}

void __110__HMMTRFabricControllerStore_wrapperWithTargetFabricUUID_startupParams_allTargetFabricUUIDs_entityIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) controllerWrappers];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v3);
    id v4 = [v3 startupParams];
    BOOL v5 = +[HMMTRFabricControllerStore startupParams:v4 isEquivalentTo:*(void *)(a1 + 48)];

    if (v5)
    {
      if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
      {
        uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) entityIdentifier];
        id v7 = v6;
        if (v6 == *(void **)(a1 + 56))
        {
        }
        else
        {
          v8 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) entityIdentifier];
          char v9 = [v8 isEqual:*(void *)(a1 + 56)];

          if ((v9 & 1) == 0)
          {
            id v10 = (void *)MEMORY[0x2533B64D0]();
            id v11 = *(id *)(a1 + 32);
            id v12 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              id v13 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v37 = v13;
              _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Controller parameters are not stored correctly (rdar://122026373) - Matter Native operation will work erroneously", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v29 = (void *)MEMORY[0x2533B64D0]();
      id v30 = *(id *)(a1 + 32);
      long long v31 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      id v32 = HMFGetLogIdentifier();
      uint64_t v35 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v37 = v32;
      __int16 v38 = 2112;
      uint64_t v39 = v35;
      v34 = "%{public}@Startup parameter remains the same for %@. Returning the previous controller wrapper.";
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x2533B64D0]([v3 replaceStartupParams:*(void *)(a1 + 48)]);
      id v30 = *(id *)(a1 + 32);
      long long v31 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        goto LABEL_22;
      }
      id v32 = HMFGetLogIdentifier();
      uint64_t v33 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v37 = v32;
      __int16 v38 = 2112;
      uint64_t v39 = v33;
      v34 = "%{public}@Startup parameter changed for %@. Replaced controller wrapper params.";
    }
    _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, v34, buf, 0x16u);

    goto LABEL_21;
  }
  uint64_t v14 = [*(id *)(a1 + 32) controllerWrappers];
  unint64_t v15 = [v14 count];

  if (v15 >= 8) {
    uint64_t v16 = [*(id *)(a1 + 32) _auditControllerWrappersWithAllFabricUUIDs:*(void *)(a1 + 64)];
  }
  id v17 = (void *)MEMORY[0x2533B64D0](v16);
  id v18 = *(id *)(a1 + 32);
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    uint64_t v21 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v37 = v20;
    __int16 v38 = 2112;
    uint64_t v39 = v21;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Retrieving controller wrapper for the first time for %@", buf, 0x16u);
  }
  id v22 = [*(id *)(a1 + 32) controllerFactory];
  id v23 = [NSString stringWithFormat:@"PerFabricUUID:%@", *(void *)(a1 + 40)];
  uint64_t v24 = [v22 wrapperWithName:v23 startupParams:*(void *)(a1 + 48) entityIdentifier:*(void *)(a1 + 56)];
  uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
  long long v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;

  uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v28 = [*(id *)(a1 + 32) controllerWrappers];
  [v28 setObject:v27 forKeyedSubscript:*(void *)(a1 + 40)];

LABEL_22:
}

- (HMMTRFabricControllerStore)initWithQueue:(id)a3 controllerFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMMTRFabricControllerStore;
  char v9 = [(HMMTRFabricControllerStore *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_controllerFactory, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    controllerWrappers = v10->_controllerWrappers;
    v10->_controllerWrappers = (NSMutableDictionary *)v11;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_2700 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_2700, &__block_literal_global_2701);
  }
  v2 = (void *)logCategory__hmf_once_v12_2702;
  return v2;
}

uint64_t __41__HMMTRFabricControllerStore_logCategory__block_invoke()
{
  logCategory__hmf_once_v12_2702 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

+ (BOOL)startupParams2:(id)a3 isEquivalentTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 operationalKeypair];
  if ([v8 publicKey])
  {
    char v9 = [v7 operationalKeypair];
    uint64_t v10 = [v9 publicKey];

    if (v10)
    {
      uint64_t v11 = [v6 operationalKeypair];
      CFDataRef v12 = SecKeyCopyExternalRepresentation((SecKeyRef)[v11 publicKey], 0);

      uint64_t v13 = [v7 operationalKeypair];
      objc_super v14 = SecKeyCopyExternalRepresentation((SecKeyRef)[(id)v13 publicKey], 0);

      LOBYTE(v13) = [(__CFData *)v12 isEqual:v14];
      if ((v13 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  unint64_t v15 = [v6 operationalKeypair];
  if (![v15 publicKey])
  {
    id v17 = [v7 operationalKeypair];
    objc_super v14 = (void *)[v17 publicKey];

    if (v14)
    {
LABEL_12:
      char v16 = 0;
      goto LABEL_13;
    }
LABEL_10:
    int v18 = [v6 usesCommonStorageDelegate];
    if (v18 != [v7 usesCommonStorageDelegate]) {
      goto LABEL_12;
    }
    int v19 = [v6 shouldAdvertiseOperational];
    if (v19 != [v7 shouldAdvertiseOperational]) {
      goto LABEL_12;
    }
    unint64_t v15 = [v6 ipk];
    if (v15 || ([v7 ipk], (v56 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v14 = [v6 ipk];
      id v4 = [v7 ipk];
      if (![v14 isEqual:v4])
      {
        char v16 = 0;
LABEL_59:

LABEL_60:
        if (!v15) {

        }
        goto LABEL_8;
      }
      int v57 = 1;
    }
    else
    {
      v56 = 0;
      int v57 = 0;
    }
    uint64_t v21 = (void *)MEMORY[0x263F10CC0];
    id v22 = [v6 rootCertificate];
    id v23 = [v7 rootCertificate];
    if (![v21 isCertificate:v22 equalTo:v23])
    {
      char v16 = 0;
      int v26 = v57;
      goto LABEL_58;
    }
    uint64_t v55 = [v6 intermediateCertificate];
    if (v55
      || ([v7 intermediateCertificate], (v48 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v24 = (void *)MEMORY[0x263F10CC0];
      uint64_t v25 = [v6 intermediateCertificate];
      v53 = [v7 intermediateCertificate];
      v54 = (void *)v25;
      if (!objc_msgSend(v24, "isCertificate:equalTo:", v25))
      {
        char v16 = 0;
        int v26 = v57;
        uint64_t v27 = (void *)v55;
LABEL_54:

LABEL_55:
        if (!v27) {

        }
LABEL_58:
        if (!v26) {
          goto LABEL_60;
        }
        goto LABEL_59;
      }
      int v51 = 1;
    }
    else
    {
      v48 = 0;
      int v51 = 0;
    }
    uint64_t v52 = [v6 operationalCertificate];
    if (v52 || ([v7 operationalCertificate], (v43 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = (void *)MEMORY[0x263F10CC0];
      uint64_t v29 = [v6 operationalCertificate];
      v49 = [v7 operationalCertificate];
      v50 = (void *)v29;
      if (!objc_msgSend(v28, "isCertificate:equalTo:", v29))
      {
        char v16 = 0;
        int v26 = v57;
        uint64_t v27 = (void *)v55;
LABEL_50:

        goto LABEL_51;
      }
      int v46 = 1;
    }
    else
    {
      v43 = 0;
      int v46 = 0;
    }
    uint64_t v47 = [v6 operationalCertificateIssuer];
    if (v47
      || ([v7 operationalCertificateIssuer], (v41 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v30 = [v6 operationalCertificateIssuer];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v31 = v30;
      }
      else {
        long long v31 = 0;
      }
      id v32 = v31;

      uint64_t v33 = [v7 operationalCertificateIssuer];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v34 = v33;
      }
      else {
        v34 = 0;
      }
      id v35 = v34;

      v44 = v35;
      v45 = v32;
      if (![v32 isEquivalentTo:v35])
      {
        char v16 = 0;
        goto LABEL_47;
      }
      int v42 = 1;
    }
    else
    {
      v41 = 0;
      int v42 = 0;
    }
    __int16 v36 = [v6 vendorID];
    id v37 = [v7 vendorID];
    char v16 = [v36 isEqual:v37];

    if (!v42)
    {
      int v26 = v57;
      uint64_t v27 = (void *)v55;
      uint64_t v40 = (void *)v47;
      if (!v47) {
        uint64_t v40 = v41;
      }

      if (v46) {
        goto LABEL_50;
      }
      goto LABEL_51;
    }
LABEL_47:
    int v26 = v57;
    uint64_t v27 = (void *)v55;

    __int16 v38 = (void *)v47;
    if (!v47)
    {

      __int16 v38 = 0;
    }

    if (v46) {
      goto LABEL_50;
    }
LABEL_51:
    uint64_t v39 = (void *)v52;
    if (!v52)
    {

      uint64_t v39 = 0;
    }

    if (!v51) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  char v16 = 0;
LABEL_8:

LABEL_13:
  return v16;
}

+ (BOOL)startupParams1:(id)a3 isEquivalentTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 nocSigner];
  if ([v7 publicKey])
  {
    id v8 = [v6 nocSigner];
    uint64_t v9 = [v8 publicKey];

    if (v9)
    {
      uint64_t v10 = [v5 nocSigner];
      uint64_t v11 = SecKeyCopyExternalRepresentation((SecKeyRef)[v10 publicKey], 0);

      CFDataRef v12 = [v6 nocSigner];
      uint64_t v13 = SecKeyCopyExternalRepresentation((SecKeyRef)[v12 publicKey], 0);

      int v14 = [v11 isEqual:v13];
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v11 = [v5 nocSigner];
  if ([v11 publicKey])
  {
    int v14 = 0;
    goto LABEL_9;
  }
  uint64_t v13 = [v6 nocSigner];
  int v14 = [v13 publicKey] == 0;
LABEL_8:

LABEL_9:
  unint64_t v15 = [v5 operationalKeypair];
  if ([v15 publicKey])
  {
    char v16 = [v6 operationalKeypair];
    uint64_t v17 = [v16 publicKey];

    if (v17)
    {
      int v18 = [v5 operationalKeypair];
      int v19 = SecKeyCopyExternalRepresentation((SecKeyRef)[v18 publicKey], 0);

      v20 = [v6 operationalKeypair];
      uint64_t v21 = SecKeyCopyExternalRepresentation((SecKeyRef)[v20 publicKey], 0);

      uint64_t v22 = [v19 isEqual:v21];
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v19 = [v5 operationalKeypair];
  if ([v19 publicKey])
  {
    char v23 = 0;
LABEL_78:

    goto LABEL_79;
  }
  uint64_t v21 = [v6 operationalKeypair];
  uint64_t v22 = [v21 publicKey] == 0;
LABEL_16:

  if ((v14 & v22) == 1)
  {
    int v19 = [v5 ipk];
    if (v19 || ([v6 ipk], (v68 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v21 = [v5 ipk];
      uint64_t v22 = [v6 ipk];
      if (![v21 isEqual:v22])
      {
        char v23 = 0;
LABEL_75:

LABEL_76:
        if (!v19) {

        }
        goto LABEL_78;
      }
      int v69 = 1;
    }
    else
    {
      v68 = 0;
      int v69 = 0;
    }
    uint64_t v24 = (void *)MEMORY[0x263F10CC0];
    uint64_t v25 = [v5 rootCertificate];
    int v26 = [v6 rootCertificate];
    if (![v24 isCertificate:v25 equalTo:v26])
    {
      char v23 = 0;
      int v31 = v69;
      goto LABEL_74;
    }
    v67 = [v5 intermediateCertificate];
    if (v67
      || ([v6 intermediateCertificate], (v60 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v27 = (void *)MEMORY[0x263F10CC0];
      uint64_t v28 = [v5 intermediateCertificate];
      uint64_t v29 = [v6 intermediateCertificate];
      v66 = (void *)v28;
      uint64_t v30 = v28;
      uint64_t v24 = (void *)v29;
      if (![v27 isCertificate:v30 equalTo:v29])
      {
        char v23 = 0;
        int v31 = v69;
LABEL_70:

LABEL_71:
        if (!v67) {

        }
LABEL_74:
        if (!v31) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      int v64 = 1;
    }
    else
    {
      v60 = 0;
      int v64 = 0;
    }
    uint64_t v65 = [v5 operationalCertificate];
    if (v65 || ([v6 operationalCertificate], (v63 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v32 = (void *)MEMORY[0x263F10CC0];
      uint64_t v33 = [v5 operationalCertificate];
      v61 = [v6 operationalCertificate];
      v62 = (void *)v33;
      if (!objc_msgSend(v32, "isCertificate:equalTo:", v33))
      {
        char v23 = 0;
        int v31 = v69;
        goto LABEL_66;
      }
      int v58 = 1;
      v34 = v63;
    }
    else
    {
      v34 = 0;
      int v58 = 0;
    }
    uint64_t v59 = [v5 caseAuthenticatedTags];
    v63 = v34;
    if (v59 || ([v6 caseAuthenticatedTags], (int v51 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v35 = [v5 caseAuthenticatedTags];
      v56 = [v6 caseAuthenticatedTags];
      int v57 = v35;
      if (!objc_msgSend(v35, "isEqual:"))
      {
        char v23 = 0;
        goto LABEL_43;
      }
      int v53 = 1;
    }
    else
    {
      int v51 = 0;
      int v53 = 0;
    }
    [v5 operationalCertificateIssuer];
    uint64_t v55 = v54 = v24;
    if (v55
      || ([v6 operationalCertificateIssuer], (v49 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      __int16 v36 = [v5 operationalCertificateIssuer];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v37 = v36;
      }
      else {
        id v37 = 0;
      }
      id v38 = v37;

      uint64_t v39 = [v6 operationalCertificateIssuer];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v40 = v39;
      }
      else {
        uint64_t v40 = 0;
      }
      id v41 = v40;

      uint64_t v52 = v41;
      if (![v38 isEquivalentTo:v41])
      {
        char v23 = 0;
        uint64_t v24 = v54;
        goto LABEL_59;
      }
      id v48 = v38;
      int v50 = 1;
    }
    else
    {
      v49 = 0;
      int v50 = 0;
    }
    int v42 = [v5 vendorID];
    v43 = [v6 vendorID];
    char v23 = [v42 isEqual:v43];

    if (v50)
    {
      uint64_t v24 = v54;
      id v38 = v48;
LABEL_59:

      int v31 = v69;
      v44 = v55;
      if (!v55)
      {

        v44 = 0;
      }

      if (v53) {
        goto LABEL_62;
      }
LABEL_63:
      v45 = (void *)v59;
      if (!v59)
      {

        v45 = 0;
      }

      if (!v58)
      {
LABEL_67:
        int v46 = (void *)v65;
        if (!v65)
        {

          int v46 = 0;
        }

        if (!v64) {
          goto LABEL_71;
        }
        goto LABEL_70;
      }
LABEL_66:

      goto LABEL_67;
    }
    uint64_t v24 = v54;
    if (!v55)
    {

      int v31 = v69;
      if ((v53 & 1) == 0) {
        goto LABEL_63;
      }
LABEL_62:

      goto LABEL_63;
    }

    if ((v53 & 1) == 0)
    {
      int v31 = v69;
      goto LABEL_63;
    }
LABEL_43:
    int v31 = v69;
    goto LABEL_62;
  }
  char v23 = 0;
LABEL_79:

  return v23;
}

+ (BOOL)startupParams:(id)a3 isEquivalentTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 usesCommonStorageDelegate])
  {
    uint64_t v8 = [v7 controllerParams];

    uint64_t v9 = [v6 controllerParams];
    char v10 = [a1 startupParams1:v8 isEquivalentTo:v9];

    id v7 = (id)v8;
  }
  else
  {
    char v10 = [a1 startupParams2:v7 isEquivalentTo:v6];
  }

  return v10;
}

@end