@interface HMMTRFabric
+ (id)logCategory;
- (BOOL)_createNewFabricData;
- (BOOL)cachedDataValid;
- (BOOL)isCachedDataValid;
- (BOOL)isSystemCommissionerFabric;
- (BOOL)isValid;
- (HMMTRAccessControl)accessControl;
- (HMMTRControllerData)currentDeviceNodeData;
- (HMMTRFabric)initWithDelegate:(id)a3 queue:(id)a4;
- (HMMTRFabricData)fabricData;
- (HMMTRFabricDelegate)delegate;
- (HMMTRStorage)storage;
- (NSNumber)fabricID;
- (NSUUID)controllerEntityIdentifier;
- (NSUUID)targetFabricUUID;
- (OS_dispatch_queue)workQueue;
- (id)_getDataToPersist;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)_clearNewFabricData;
- (void)_loadForPairingWithFetchFromResident:(BOOL)a3 completion:(id)a4;
- (void)_loadFromDiskWithCompletion:(id)a3;
- (void)_loadFromRemoteWithCompletion:(id)a3;
- (void)_loadFromResidentWithCompletion:(id)a3;
- (void)_loadFromStorageWithCompletion:(id)a3;
- (void)createNewFabricIdentityWithCompletion:(id)a3;
- (void)invalidateCachedData;
- (void)loadFabricAndControllerDataForPairing:(BOOL)a3 fetchFromResident:(BOOL)a4 completion:(id)a5;
- (void)setAccessControl:(id)a3;
- (void)setCachedDataValid:(BOOL)a3;
- (void)setControllerEntityIdentifier:(id)a3;
- (void)setFabricID:(id)a3;
- (void)setStorage:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMMTRFabric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_controllerEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_currentDeviceNodeData, 0);
  objc_storeStrong((id *)&self->_fabricData, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessControl, 0);
  objc_storeStrong((id *)&self->_targetFabricUUID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
}

- (void)setCachedDataValid:(BOOL)a3
{
  self->_cachedDataValid = a3;
}

- (BOOL)cachedDataValid
{
  return self->_cachedDataValid;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setControllerEntityIdentifier:(id)a3
{
}

- (NSUUID)controllerEntityIdentifier
{
  return self->_controllerEntityIdentifier;
}

- (HMMTRControllerData)currentDeviceNodeData
{
  return self->_currentDeviceNodeData;
}

- (HMMTRFabricData)fabricData
{
  return self->_fabricData;
}

- (void)setStorage:(id)a3
{
}

- (HMMTRStorage)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  return (HMMTRStorage *)WeakRetained;
}

- (HMMTRFabricDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMMTRFabricDelegate *)WeakRetained;
}

- (void)setAccessControl:(id)a3
{
}

- (HMMTRAccessControl)accessControl
{
  return self->_accessControl;
}

- (BOOL)isSystemCommissionerFabric
{
  return self->_systemCommissionerFabric;
}

- (NSUUID)targetFabricUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFabricID:(id)a3
{
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMMTRFabric *)self fabricID];
  v6 = (void *)[v4 initWithName:@"Fabric ID" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMMTRFabric *)self isSystemCommissionerFabric];
  v8 = HMFBooleanToString();
  v9 = (void *)[v7 initWithName:@"System Commissioner" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMMTRFabric *)self accessControl];
  v12 = (void *)[v10 initWithName:@"Access Control" value:v11];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = [(HMMTRFabric *)self storage];
  v15 = (void *)[v13 initWithName:@"Storage" value:v14];
  [v3 addObject:v15];

  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  v17 = [(HMMTRFabric *)self fabricData];
  v18 = (void *)[v16 initWithName:@"Fabric Data" value:v17];
  [v3 addObject:v18];

  id v19 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMMTRFabric *)self currentDeviceNodeData];
  v21 = (void *)[v19 initWithName:@"Controller Data" value:v20];
  [v3 addObject:v21];

  id v22 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMMTRFabric *)self isCachedDataValid];
  v23 = HMFBooleanToString();
  v24 = (void *)[v22 initWithName:@"Is Cached Data Valid" value:v23];
  [v3 addObject:v24];

  v25 = (void *)[v3 copy];
  return v25;
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMMTRFabric *)self fabricID];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (void)_loadFromStorageWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  v5 = [(HMMTRFabric *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v37 = v9;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data from storage", buf, 0xCu);
  }
  id v10 = [(HMMTRFabric *)v7 fabricID];

  if (v10)
  {
    v11 = [(HMMTRFabric *)v7 storage];
    v12 = [(HMMTRFabric *)v7 fabricID];
    id v13 = [(HMMTRFabric *)v7 delegate];
    v14 = [v13 currentDeviceControllerNodeID];
    id v34 = 0;
    id v35 = 0;
    id v32 = 0;
    id v33 = 0;
    [v11 fetchCertificatesFromStorageForFabricID:v12 controllerNodeID:v14 rootCert:&v35 operationalCert:&v34 residentNodeID:&v33 ipk:&v32];
    id v15 = v35;
    id v16 = v34;
    id v17 = v33;
    id v18 = v32;

    id v19 = (void *)MEMORY[0x2533B64D0]();
    v20 = v7;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544386;
      v37 = v22;
      __int16 v38 = 2112;
      id v39 = v15;
      __int16 v40 = 2112;
      id v41 = v16;
      __int16 v42 = 2112;
      id v43 = v17;
      __int16 v44 = 2112;
      id v45 = v18;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@tempRootCert %@ && tempOperationalCert %@ && tempResidentNodeID %@ && tempOwnerIPK %@", buf, 0x34u);
    }
    if (v15 && v16 && v17 && v18)
    {
      v23 = [(HMMTRFabric *)v20 fabricData];
      [v23 setRootCert:v15];

      v24 = [(HMMTRFabric *)v20 currentDeviceNodeData];
      [v24 setOperationalCertificate:v16];

      v25 = [(HMMTRFabric *)v20 fabricData];
      [v25 setResidentNodeID:v17];

      v26 = [(HMMTRFabric *)v20 fabricData];
      [v26 setIpk:v18];

      [(HMMTRFabric *)v20 setCachedDataValid:1];
      v27 = 0;
    }
    else
    {
      v27 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    }
    v4[2](v4, v27);
  }
  else
  {
    v28 = (void *)MEMORY[0x2533B64D0]();
    v29 = v7;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v31;
      _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@Cannot read from storage when fabric ID is not valid", buf, 0xCu);
    }
    id v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
    v4[2](v4, v15);
  }
}

- (void)_loadForPairingWithFetchFromResident:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HMMTRFabric *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x2533B64D0]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    v12 = (void *)v11;
    id v13 = "current device";
    if (v4) {
      id v13 = "resident";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v11;
    __int16 v45 = 2080;
    uint64_t v46 = (void *)v13;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data for pairing from %s", buf, 0x16u);
  }
  v14 = [(HMMTRFabric *)v9 storage];
  id v15 = [v14 operationalKeyPair];
  uint64_t v16 = [v15 publicKey];

  if (v16)
  {
    CFErrorRef error = 0;
    id v17 = [(HMMTRFabric *)v9 storage];
    id v18 = [v17 operationalKeyPair];
    uint64_t v19 = [v18 publicKey];

    if (v19)
    {
      v20 = [(HMMTRFabric *)v9 storage];
      v21 = [v20 operationalKeyPair];
      id v22 = SecKeyCopyExternalRepresentation((SecKeyRef)[v21 publicKey], &error);

      if (v22)
      {
        v23 = [(HMMTRFabric *)v9 delegate];
        v24 = [(HMMTRFabric *)v9 fabricID];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __63__HMMTRFabric__loadForPairingWithFetchFromResident_completion___block_invoke;
        v40[3] = &unk_265376B18;
        v40[4] = v9;
        id v41 = v6;
        [v23 fetchOperationalCertificatesForNewFabricWithFabricID:v24 publicKey:v22 fetchFromResident:v4 completion:v40];
      }
      else
      {
        CFErrorRef v34 = error;
        id v35 = (void *)MEMORY[0x2533B64D0]();
        v36 = v9;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          __int16 v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v44 = (uint64_t)v38;
          __int16 v45 = 2112;
          uint64_t v46 = v34;
          _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert public key to NSData for transmission with error %@", buf, 0x16u);
        }
        id v39 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
        (*((void (**)(id, void *))v6 + 2))(v6, v39);

        id v22 = 0;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x2533B64D0]();
      v31 = v9;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v44 = (uint64_t)v33;
        _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to load certs from resident without operational key", buf, 0xCu);
      }
      id v22 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      (*((void (**)(id, void *))v6 + 2))(v6, v22);
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x2533B64D0]();
    v26 = v9;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = (uint64_t)v28;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@No operational key created yet. Aborting fabric cert loading.", buf, 0xCu);
    }
    v29 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*((void (**)(id, void *))v6 + 2))(v6, v29);
  }
}

void __63__HMMTRFabric__loadForPairingWithFetchFromResident_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x2533B64D0]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v59 = v19;
      __int16 v60 = 2112;
      uint64_t v61 = (uint64_t)v15;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to create operational certificates from owner with error %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v11 && v12 && v13 && v14)
    {
      uint64_t v20 = [*(id *)(a1 + 32) fabricID];
      if (!v20
        || (v21 = (void *)v20,
            [*(id *)(a1 + 32) fabricID],
            id v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = [v22 isEqualToNumber:&unk_2702B53E8],
            v22,
            v21,
            v23))
      {
        v24 = [MEMORY[0x263F10CC0] convertX509Certificate:v11];
        v25 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v24];
        context = (void *)MEMORY[0x2533B64D0]();
        id v26 = *(id *)(a1 + 32);
        v27 = HMFGetOSLogHandle();
        v28 = v27;
        if (v25)
        {
          v54 = v24;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v52 = HMFGetLogIdentifier();
            v53 = [v25 subject];
            [v53 fabricID];
            *(_DWORD *)buf = 138543618;
            v59 = v52;
            v61 = __int16 v60 = 2112;
            v29 = (void *)v61;
            _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@Updating fabric ID to %@ for Shared Home", buf, 0x16u);
          }
          v30 = [v25 subject];
          v31 = [v30 fabricID];
          [*(id *)(a1 + 32) setFabricID:v31];

          v24 = v54;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v55 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v59 = v55;
            _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", buf, 0xCu);
          }
        }
      }
      __int16 v38 = (void *)MEMORY[0x2533B64D0]();
      id v39 = *(id *)(a1 + 32);
      __int16 v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = HMFGetLogIdentifier();
        [*(id *)(a1 + 32) fabricID];
        __int16 v42 = contexta = v38;
        *(_DWORD *)buf = 138544386;
        v59 = v41;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v42;
        __int16 v62 = 2112;
        id v63 = v11;
        __int16 v64 = 2112;
        id v65 = v12;
        __int16 v66 = 2112;
        id v67 = v13;
        _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_INFO, "%{public}@Successfully created operational certificates from owner for fabric ID %@. Root Certificate %@, Operational certificate %@, Owner NodeID %@", buf, 0x34u);

        __int16 v38 = contexta;
      }

      id v43 = [HMMTRCachedFabricCertificateData alloc];
      uint64_t v44 = [*(id *)(a1 + 32) fabricID];
      v37 = [(HMMTRCachedFabricCertificateData *)v43 initWithFabricID:v44 rootCert:v11 operationalCert:v12 ownerNode:v13 ipk:v14];

      __int16 v45 = [*(id *)(a1 + 32) storage];
      uint64_t v46 = [v45 delegate];
      uint64_t v47 = [*(id *)(a1 + 32) fabricID];
      [v46 cacheOperationalCertificate:v37 fabricID:v47];

      v48 = [*(id *)(a1 + 32) fabricData];
      [v48 setRootCert:v11];

      v49 = [*(id *)(a1 + 32) currentDeviceNodeData];
      [v49 setOperationalCertificate:v12];

      v50 = [*(id *)(a1 + 32) fabricData];
      [v50 setResidentNodeID:v13];

      v51 = [*(id *)(a1 + 32) fabricData];
      [v51 setIpk:v14];

      [*(id *)(a1 + 32) setCachedDataValid:1];
      (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
    }
    else
    {
      id v32 = (void *)MEMORY[0x2533B64D0]();
      id v33 = *(id *)(a1 + 32);
      CFErrorRef v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v59 = v35;
        _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Certificates OR Owner Node ID required for pairing", buf, 0xCu);
      }
      uint64_t v36 = *(void *)(a1 + 40);
      v37 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      (*(void (**)(uint64_t, HMMTRCachedFabricCertificateData *))(v36 + 16))(v36, v37);
    }
  }
}

- (void)_loadFromResidentWithCompletion:(id)a3
{
}

- (void)_loadFromDiskWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void *))a3;
  v5 = [(HMMTRFabric *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data from disk", buf, 0xCu);
  }
  if (![(HMMTRFabric *)v7 isCachedDataValid])
  {
    id v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = v7;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      id v22 = "%{public}@Cached data is not valid";
LABEL_13:
      int v23 = v16;
      os_log_type_t v24 = OS_LOG_TYPE_INFO;
      uint32_t v25 = 12;
LABEL_14:
      _os_log_impl(&dword_252495000, v23, v24, v22, buf, v25);
    }
LABEL_15:

    id v26 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v4[2](v4, v26);

    goto LABEL_16;
  }
  id v10 = [(HMMTRFabric *)v7 fabricID];

  if (!v10)
  {
    id v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = v7;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      id v22 = "%{public}@Cannot read from disk when fabric ID is not valid";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  id v11 = [(HMMTRFabric *)v7 storage];
  id v12 = [v11 delegate];

  id v13 = (void *)MEMORY[0x2533B64D0]();
  id v14 = v7;
  id v15 = HMFGetOSLogHandle();
  uint64_t v16 = v15;
  if (!v12)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v30 = v21;
    __int16 v31 = 2112;
    id v32 = v14;
    id v22 = "%{public}@fabric storage is not set %@";
    int v23 = v16;
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    uint32_t v25 = 22;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v30 = v17;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Reading disk data for current fabric", buf, 0xCu);
  }
  id v18 = [(HMMTRFabric *)v14 storage];
  uint64_t v19 = [v18 delegate];
  uint64_t v20 = [(HMMTRFabric *)v14 fabricID];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke;
  v27[3] = &unk_265375B50;
  v27[4] = v14;
  v28 = v4;
  [v19 fetchCachedOperationalCertificateForFabricID:v20 completionHandler:v27];

LABEL_16:
}

void __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke_2;
  block[3] = &unk_265378900;
  id v8 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 rootCert];
    BOOL v4 = [*(id *)(a1 + 40) fabricData];
    [v4 setRootCert:v3];

    id v5 = [*(id *)(a1 + 32) operationalCert];
    id v6 = [*(id *)(a1 + 40) currentDeviceNodeData];
    [v6 setOperationalCertificate:v5];

    id v7 = [*(id *)(a1 + 32) ownerNode];
    id v8 = [*(id *)(a1 + 40) fabricData];
    [v8 setResidentNodeID:v7];

    uint64_t v9 = [*(id *)(a1 + 32) ipk];
    id v10 = [*(id *)(a1 + 40) fabricData];
    [v10 setIpk:v9];

    id v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = *(id *)(a1 + 40);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v41 = [*(id *)(a1 + 40) fabricData];
      id v15 = [v41 rootCert];
      id v39 = [*(id *)(a1 + 40) currentDeviceNodeData];
      uint64_t v16 = [v39 operationalCertificate];
      id v17 = [*(id *)(a1 + 40) fabricData];
      id v18 = [v17 residentNodeID];
      [*(id *)(a1 + 40) fabricData];
      uint64_t v19 = v40 = v11;
      uint64_t v20 = [v19 ipk];
      *(_DWORD *)buf = 138544386;
      uint64_t v44 = v14;
      __int16 v45 = 2112;
      uint64_t v46 = v15;
      __int16 v47 = 2112;
      v48 = v16;
      __int16 v49 = 2112;
      v50 = v18;
      __int16 v51 = 2112;
      v52 = v20;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Read cached operational cert data from disk self.rootCert %@, self.operationalCert %@ self.residentNodeID %@ self.ownerIPK %@", buf, 0x34u);

      id v11 = v40;
    }

    v21 = (void *)MEMORY[0x263F10CC0];
    id v22 = [*(id *)(a1 + 40) storage];
    int v23 = [v22 nocSigner];
    os_log_type_t v24 = [*(id *)(a1 + 40) fabricData];
    uint32_t v25 = [v24 rootCert];
    [v21 keypair:v23 matchesCertificate:v25];

    id v26 = (void *)MEMORY[0x2533B64D0]();
    id v27 = *(id *)(a1 + 40);
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      v30 = (void *)MEMORY[0x263F10CC0];
      __int16 v31 = [*(id *)(a1 + 40) fabricData];
      id v32 = [v31 rootCert];
      uint64_t v33 = [v30 shortDescriptionForX509Certificate:v32];
      CFErrorRef v34 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v44 = v29;
      __int16 v45 = 2112;
      uint64_t v46 = v33;
      __int16 v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@Cached root certificate: %@, matches: %@", buf, 0x20u);
    }
    id v35 = (void *)MEMORY[0x263F10CC0];
    uint64_t v36 = [*(id *)(a1 + 40) fabricData];
    v37 = [v36 rootCert];
    [v35 printX509Certificate:v37];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v38 = *(void *)(a1 + 48);
    id v42 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t))(v38 + 16))(v38);
  }
}

- (void)_loadFromRemoteWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMMTRFabric *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v26 = v9;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data from remote source", buf, 0xCu);
  }
  id v10 = [(HMMTRFabric *)v7 accessControl];
  uint64_t v11 = [v10 currentUserPrivilege];

  if (v11 == 1)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke;
    v23[3] = &unk_265378578;
    v23[4] = v7;
    id v24 = v4;
    [(HMMTRFabric *)v7 _loadFromStorageWithCompletion:v23];
    id v12 = v24;
LABEL_9:

    goto LABEL_10;
  }
  id v13 = [(HMMTRFabric *)v7 accessControl];
  if ([v13 currentUserPrivilege] == 2)
  {

LABEL_8:
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke_42;
    v21[3] = &unk_265378578;
    v21[4] = v7;
    id v22 = v4;
    [(HMMTRFabric *)v7 _loadFromResidentWithCompletion:v21];
    id v12 = v22;
    goto LABEL_9;
  }
  id v14 = [(HMMTRFabric *)v7 accessControl];
  uint64_t v15 = [v14 currentUserPrivilege];

  if (v15 == 3) {
    goto LABEL_8;
  }
  uint64_t v16 = (void *)MEMORY[0x2533B64D0]();
  id v17 = v7;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v26 = v19;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Unexpected user privilege for user", buf, 0xCu);
  }
  uint64_t v20 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
  (*((void (**)(id, void *))v4 + 2))(v4, v20);

LABEL_10:
}

void __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Loading from storage completed with error %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Loading from resident completed with error %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_getDataToPersist
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRFabric *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v77 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Dumping stack storage for params", buf, 0xCu);
  }
  uint64_t v9 = [(HMMTRFabric *)v6 fabricData];
  __int16 v10 = [v9 ipk];
  [v4 setObject:v10 forKeyedSubscript:@"IPK"];

  id v11 = (void *)MEMORY[0x263F10CC0];
  uint64_t v12 = [(HMMTRFabric *)v6 fabricData];
  id v13 = [v12 rootCert];
  id v14 = [v11 convertX509Certificate:v13];
  [v4 setObject:v14 forKeyedSubscript:@"f/1/r"];

  uint64_t v15 = (void *)MEMORY[0x263F10CC0];
  uint64_t v16 = [(HMMTRFabric *)v6 currentDeviceNodeData];
  id v17 = [v16 operationalCertificate];
  id v18 = [v15 convertX509Certificate:v17];
  [v4 setObject:v18 forKeyedSubscript:@"f/1/n"];

  uint64_t v84 = 0x12C1349002515;
  char v85 = 24;
  uint64_t v19 = [MEMORY[0x263EFF8F8] dataWithBytes:&v84 length:9];
  [v4 setObject:v19 forKeyedSubscript:@"f/1/m"];

  uint64_t v20 = [(HMMTRFabric *)v6 storage];
  v21 = [v20 operationalKeyPair];
  id v22 = [v21 serialize];
  [v4 setObject:v22 forKeyedSubscript:@"f/1/o"];

  uint64_t v82 = 0x104013602002415;
  __int16 v83 = 6168;
  int v23 = [MEMORY[0x263EFF8F8] dataWithBytes:&v82 length:10];
  [v4 setObject:v23 forKeyedSubscript:@"g/fidx"];

  uint64_t v81 = 0x1829625600002615;
  id v24 = [MEMORY[0x263EFF8F8] dataWithBytes:&v81 length:8];
  [v4 setObject:v24 forKeyedSubscript:@"g/lkgt"];

  uint32_t v25 = (void *)MEMORY[0x263F10CC0];
  id v26 = [v4 objectForKeyedSubscript:@"f/1/n"];
  uint64_t v27 = [v25 convertMatterCertificate:v26];
  [v4 setObject:v27 forKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];

  v28 = (void *)MEMORY[0x263F10CC0];
  v29 = [v4 objectForKeyedSubscript:@"f/1/r"];
  uint64_t v30 = [v28 convertMatterCertificate:v29];
  [v4 setObject:v30 forKeyedSubscript:@"HMD.MTRPlugin.RootCert"];

  __int16 v31 = [(HMMTRFabric *)v6 storage];
  LOBYTE(v30) = [v31 isResidentDevice];

  if (v30) {
    goto LABEL_13;
  }
  id v32 = (void *)MEMORY[0x263F10CC0];
  uint64_t v33 = [v4 objectForKeyedSubscript:@"f/1/r"];
  uint64_t v68 = [v32 convertMatterCertificate:v33];

  CFErrorRef v34 = [(HMMTRFabric *)v6 fabricData];
  v69 = [v34 residentNodeID];

  id v35 = [(HMMTRFabric *)v6 delegate];
  uint64_t v36 = [v35 accessoryAdministerPrivilegeCATID:0];

  id v67 = (void *)v36;
  if (v36)
  {
    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v80 = v36;
    uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
    uint64_t v39 = [v37 setWithArray:v38];
  }
  else
  {
    uint64_t v39 = 0;
  }
  __int16 v40 = (void *)MEMORY[0x263F10CC0];
  id v65 = [(HMMTRFabric *)v6 storage];
  id v41 = [v65 nocSigner];
  id v42 = [(HMMTRFabric *)v6 storage];
  id v43 = [v42 operationalKeyPair];
  uint64_t v44 = [v43 publicKey];
  __int16 v45 = [(HMMTRFabric *)v6 fabricID];
  id v74 = 0;
  uint64_t v46 = (void *)v68;
  __int16 v66 = (void *)v39;
  __int16 v47 = [v40 createOperationalCertificate:v41 signingCertificate:v68 operationalPublicKey:v44 fabricID:v45 nodeID:v69 caseAuthenticatedTags:v39 error:&v74];
  id v48 = v74;

  if (v47)
  {
    [v4 setObject:v47 forKeyedSubscript:@"HMD.MTRPlugin.OperationalCert"];
    [v4 setObject:v68 forKeyedSubscript:@"HMD.MTRPlugin.RootCert"];
    __int16 v49 = [MEMORY[0x263F10CC0] convertX509Certificate:v47];
    [v4 setObject:v49 forKeyedSubscript:@"f/1/n"];
  }
  else
  {
    v50 = (void *)MEMORY[0x2533B64D0]();
    __int16 v51 = v6;
    v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v77 = v53;
      __int16 v78 = 2112;
      id v79 = v48;
      _os_log_impl(&dword_252495000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist legacy node with error %@", buf, 0x16u);
    }
    uint64_t v46 = (void *)v68;
  }

  if (v47)
  {
LABEL_13:
    v54 = [MEMORY[0x263EFF9A0] dictionary];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v55 = v4;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(v55);
          }
          uint64_t v60 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          uint64_t v61 = [v55 objectForKeyedSubscript:v60];
          __int16 v62 = [v61 base64EncodedStringWithOptions:0];
          [v54 setObject:v62 forKeyedSubscript:v60];
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v57);
    }

    id v63 = (void *)[v54 copy];
  }
  else
  {
    id v63 = 0;
  }

  return v63;
}

- (void)_clearNewFabricData
{
  id v3 = [(HMMTRFabric *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMMTRFabric *)self fabricData];
  [v4 setRootCert:0];

  id v5 = [(HMMTRFabric *)self currentDeviceNodeData];
  [v5 setOperationalCertificate:0];

  id v6 = [(HMMTRFabric *)self fabricData];
  [v6 setIpk:0];

  id v7 = [(HMMTRFabric *)self fabricData];
  [v7 setResidentNodeID:0];

  [(HMMTRFabric *)self setCachedDataValid:0];
}

- (BOOL)_createNewFabricData
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRFabric *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x263F10CC0];
  id v5 = [(HMMTRFabric *)self storage];
  id v6 = [v5 nocSigner];
  id v7 = [(HMMTRFabric *)self storage];
  int v8 = [v7 certificateIssuerID];
  uint64_t v9 = [(HMMTRFabric *)self fabricID];
  id v57 = 0;
  __int16 v10 = [v4 createRootCertificate:v6 issuerID:v8 fabricID:v9 error:&v57];
  id v11 = v57;

  if (v10)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    id v13 = [(HMMTRFabric *)self storage];
    int v14 = [v13 isResidentDevice];

    v54 = v12;
    id v55 = v10;
    v52 = v11;
    if (v14)
    {
      id v15 = v12;
      __int16 v51 = 0;
    }
    else
    {
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
      id v22 = [(HMMTRFabric *)self delegate];
      int v23 = [v22 accessoryAdministerPrivilegeCATID:0];

      if (v23)
      {
        id v24 = (void *)MEMORY[0x263EFFA08];
        uint64_t v58 = v23;
        uint32_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
        uint64_t v26 = [v24 setWithArray:v25];
      }
      else
      {
        uint64_t v26 = 0;
      }
      __int16 v51 = (void *)v26;

      id v15 = (id)v21;
    }
    uint64_t v27 = (void *)MEMORY[0x263F10CC0];
    v28 = [(HMMTRFabric *)self storage];
    v29 = [v28 nocSigner];
    uint64_t v30 = [(HMMTRFabric *)self storage];
    __int16 v31 = [v30 operationalKeyPair];
    uint64_t v32 = [v31 publicKey];
    uint64_t v33 = [(HMMTRFabric *)self fabricID];
    id v56 = v52;
    id v53 = v15;
    CFErrorRef v34 = [v27 createOperationalCertificate:v29 signingCertificate:v55 operationalPublicKey:v32 fabricID:v33 nodeID:v15 caseAuthenticatedTags:v51 error:&v56];
    id v35 = v56;

    if (!v34)
    {
      id v42 = (void *)MEMORY[0x2533B64D0]();
      id v43 = self;
      uint64_t v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        __int16 v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v60 = v45;
        __int16 v61 = 2112;
        id v62 = v35;
        _os_log_impl(&dword_252495000, v44, OS_LOG_TYPE_INFO, "%{public}@Failed to generate operational certificate with error %@", buf, 0x16u);
      }
      BOOL v20 = 0;
      v37 = v54;
      __int16 v10 = v55;
      goto LABEL_23;
    }
    uint64_t v36 = +[HMMTRStorage generateIPK];
    if (v36)
    {
      v37 = v54;
      __int16 v10 = v55;
      if (v54)
      {
        uint64_t v38 = [(HMMTRFabric *)self fabricData];
        [v38 setRootCert:v55];

        uint64_t v39 = [(HMMTRFabric *)self currentDeviceNodeData];
        [v39 setOperationalCertificate:v34];

        __int16 v40 = [(HMMTRFabric *)self fabricData];
        [v40 setIpk:v36];

        id v41 = [(HMMTRFabric *)self fabricData];
        [v41 setResidentNodeID:v54];

        [(HMMTRFabric *)self setCachedDataValid:1];
        BOOL v20 = [(HMMTRFabric *)self isValid];
LABEL_22:

        id v15 = v53;
LABEL_23:

        id v11 = v35;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v46 = (void *)MEMORY[0x2533B64D0]();
      __int16 v47 = self;
      id v48 = HMFGetOSLogHandle();
      v37 = v54;
      __int16 v10 = v55;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        __int16 v49 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v49;
        _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate IPK", buf, 0xCu);
      }
    }
    BOOL v20 = 0;
    goto LABEL_22;
  }
  uint64_t v16 = (void *)MEMORY[0x2533B64D0]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v60 = v19;
    __int16 v61 = 2112;
    id v62 = v11;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to generate root certificate with error %@", buf, 0x16u);
  }
  BOOL v20 = 0;
LABEL_24:

  return v20;
}

- (BOOL)isValid
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (![(HMMTRFabric *)self isCachedDataValid]) {
    return 0;
  }
  uint64_t v3 = [(HMMTRFabric *)self fabricID];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  id v5 = [(HMMTRFabric *)self fabricID];
  char v6 = [v5 isEqualToNumber:&unk_2702B53E8];

  if (v6) {
    return 0;
  }
  id v7 = [(HMMTRFabric *)self fabricData];
  uint64_t v8 = [v7 rootCert];
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = (void *)v8;
  __int16 v10 = [(HMMTRFabric *)self currentDeviceNodeData];
  uint64_t v11 = [v10 operationalCertificate];
  if (!v11)
  {
LABEL_14:

LABEL_15:
    return 0;
  }
  uint64_t v12 = (void *)v11;
  id v13 = [(HMMTRFabric *)self fabricData];
  uint64_t v14 = [v13 residentNodeID];
  if (!v14)
  {

    goto LABEL_14;
  }
  id v15 = (void *)v14;
  uint64_t v16 = [(HMMTRFabric *)self fabricData];
  id v17 = [v16 ipk];

  if (v17)
  {
    id v18 = (void *)MEMORY[0x263F10CC0];
    uint64_t v19 = [(HMMTRFabric *)self fabricData];
    BOOL v20 = [v19 rootCert];
    uint64_t v21 = [v18 convertX509Certificate:v20];

    id v22 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v21];
    int v23 = v22;
    if (v22)
    {
      id v24 = [v22 subject];
      uint32_t v25 = [v24 fabricID];
      uint64_t v26 = [(HMMTRFabric *)self fabricID];
      char v27 = [v25 isEqualToNumber:v26];

      if (v27)
      {
        v28 = (void *)MEMORY[0x263F10CC0];
        v29 = [(HMMTRFabric *)self currentDeviceNodeData];
        uint64_t v30 = [v29 operationalCertificate];
        __int16 v31 = [v28 convertX509Certificate:v30];

        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F10CB8]) initWithTLVBytes:v31];
        uint64_t v33 = v32;
        if (v32)
        {
          CFErrorRef v34 = [v32 subject];
          id v35 = [v34 fabricID];
          uint64_t v36 = [(HMMTRFabric *)self fabricID];
          char v37 = [v35 isEqualToNumber:v36];

          if (v37)
          {
            BOOL v38 = 1;
LABEL_30:

            goto LABEL_31;
          }
          uint64_t v46 = (void *)MEMORY[0x2533B64D0]();
          v50 = self;
          id v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            __int16 v49 = HMFGetLogIdentifier();
            __int16 v51 = [v33 subject];
            v52 = [v51 fabricID];
            int v53 = 138543618;
            v54 = v49;
            __int16 v55 = 2112;
            id v56 = v52;
            _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_ERROR, "%{public}@Operational certificate fabric ID %@ doesn't match fabric ID of current fabric", (uint8_t *)&v53, 0x16u);

            goto LABEL_28;
          }
        }
        else
        {
          uint64_t v46 = (void *)MEMORY[0x2533B64D0]();
          __int16 v47 = self;
          id v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            __int16 v49 = HMFGetLogIdentifier();
            int v53 = 138543362;
            v54 = v49;
            _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", (uint8_t *)&v53, 0xCu);
LABEL_28:
          }
        }

        [(HMMTRFabric *)self setCachedDataValid:0];
        BOOL v38 = 0;
        goto LABEL_30;
      }
      __int16 v40 = (void *)MEMORY[0x2533B64D0]();
      id v41 = self;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        id v43 = HMFGetLogIdentifier();
        uint64_t v44 = [v23 subject];
        __int16 v45 = [v44 fabricID];
        int v53 = 138543618;
        v54 = v43;
        __int16 v55 = 2112;
        id v56 = v45;
        _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_ERROR, "%{public}@Root certificate fabric ID %@ doesn't match fabric ID of current fabric", (uint8_t *)&v53, 0x16u);

        goto LABEL_22;
      }
    }
    else
    {
      __int16 v40 = (void *)MEMORY[0x2533B64D0]();
      id v41 = self;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        id v43 = HMFGetLogIdentifier();
        int v53 = 138543362;
        v54 = v43;
        _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", (uint8_t *)&v53, 0xCu);
LABEL_22:
      }
    }

    [(HMMTRFabric *)v41 setCachedDataValid:0];
    BOOL v38 = 0;
LABEL_31:

    return v38;
  }
  return 0;
}

- (BOOL)isCachedDataValid
{
  return self->_cachedDataValid;
}

- (void)invalidateCachedData
{
}

- (void)loadFabricAndControllerDataForPairing:(BOOL)a3 fetchFromResident:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(HMMTRFabric *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke;
  block[3] = &unk_265375B28;
  BOOL v13 = a3;
  BOOL v14 = a4;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

void __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    char v6 = HMFBooleanToString();
    id v7 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v42 = v5;
    __int16 v43 = 2112;
    uint64_t v44 = v6;
    __int16 v45 = 2112;
    uint64_t v46 = v7;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data, pairing: %@, resident fetch: %@", buf, 0x20u);
  }
  if (*(unsigned char *)(a1 + 48) || ![*(id *)(a1 + 32) isValid])
  {
    id v12 = [*(id *)(a1 + 32) fabricData];
    BOOL v13 = [v12 rootCert];

    BOOL v14 = [*(id *)(a1 + 32) currentDeviceNodeData];
    id v15 = [v14 operationalCertificate];

    uint64_t v16 = [*(id *)(a1 + 32) fabricData];
    id v17 = [v16 residentNodeID];

    id v18 = [*(id *)(a1 + 32) fabricData];
    uint64_t v19 = [v18 ipk];

    BOOL v20 = [*(id *)(a1 + 32) fabricData];
    [v20 setRootCert:0];

    uint64_t v21 = [*(id *)(a1 + 32) currentDeviceNodeData];
    [v21 setOperationalCertificate:0];

    id v22 = [*(id *)(a1 + 32) fabricData];
    [v22 setResidentNodeID:0];

    int v23 = [*(id *)(a1 + 32) fabricData];
    [v23 setIpk:0];

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_6;
    v35[3] = &unk_265376938;
    v35[4] = *(void *)(a1 + 32);
    id v24 = v13;
    id v36 = v24;
    id v25 = v15;
    id v37 = v25;
    id v26 = v17;
    id v38 = v26;
    id v27 = v19;
    id v39 = v27;
    id v40 = *(id *)(a1 + 40);
    v28 = (void *)MEMORY[0x2533B66E0](v35);
    v29 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      [v29 _loadForPairingWithFetchFromResident:*(unsigned __int8 *)(a1 + 49) completion:v28];
    }
    else
    {
      uint64_t v30 = [v29 accessControl];
      uint64_t v31 = [v30 currentUserPrivilege];

      uint64_t v32 = *(void **)(a1 + 32);
      if (v31 == 1)
      {
        [v32 _loadFromRemoteWithCompletion:v28];
      }
      else
      {
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_3;
        v33[3] = &unk_265378578;
        v33[4] = v32;
        id v34 = v28;
        [v32 _loadFromDiskWithCompletion:v33];
      }
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v42 = v11;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Certificate data is valid", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_6(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_2;
  block[3] = &unk_265375B00;
  id v9 = v3;
  id v5 = a1[5];
  id v6 = a1[4];
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[6];
  id v13 = a1[7];
  id v14 = a1[8];
  id v15 = a1[9];
  id v7 = v3;
  dispatch_async(v4, block);
}

void __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 || ![*(id *)(a1 + 32) isValid]) {
    [*(id *)(a1 + 32) _loadFromRemoteWithCompletion:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      id v3 = [*(id *)(a1 + 48) fabricData];
      [v3 setRootCert:v2];

      uint64_t v4 = *(void *)(a1 + 56);
      id v5 = [*(id *)(a1 + 48) currentDeviceNodeData];
      [v5 setOperationalCertificate:v4];

      uint64_t v6 = *(void *)(a1 + 64);
      id v7 = [*(id *)(a1 + 48) fabricData];
      [v7 setResidentNodeID:v6];

      uint64_t v8 = *(void *)(a1 + 72);
      id v9 = [*(id *)(a1 + 48) fabricData];
      [v9 setIpk:v8];
    }
  }
  id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
  return v10();
}

- (void)createNewFabricIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMTRFabric *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HMMTRFabric_createNewFabricIdentityWithCompletion___block_invoke;
  v7[3] = &unk_2653770F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__HMMTRFabric_createNewFabricIdentityWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isValid])
  {
    uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v46 = 138543362;
      uint64_t v47 = v5;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to create fabric data as existing data is already valid", (uint8_t *)&v46, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 1;
    goto LABEL_14;
  }
  id v9 = [*(id *)(a1 + 32) accessControl];
  uint64_t v10 = [v9 currentUserPrivilege];

  if (v10 != 1)
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v46 = 138543362;
      uint64_t v47 = v18;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fabric data by non-owner user", (uint8_t *)&v46, 0xCu);
      goto LABEL_12;
    }
LABEL_13:

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 5;
LABEL_14:
    BOOL v20 = [v7 hmfErrorWithCode:v8];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v20);
    goto LABEL_15;
  }
  uint64_t v11 = [*(id *)(a1 + 32) fabricID];
  if (!v11
    || (id v12 = (void *)v11,
        [*(id *)(a1 + 32) fabricID],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqualToNumber:&unk_2702B53E8],
        v13,
        v12,
        v14))
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = [*(id *)(a1 + 32) fabricID];
      int v46 = 138543618;
      uint64_t v47 = v18;
      __int16 v48 = 2112;
      __int16 v49 = v19;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fabric data due to incorrect fabric ID %@", (uint8_t *)&v46, 0x16u);

LABEL_12:
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (([*(id *)(a1 + 32) _createNewFabricData] & 1) == 0)
  {
    id v39 = (void *)MEMORY[0x2533B64D0]();
    id v40 = *(id *)(a1 + 32);
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      id v42 = HMFGetLogIdentifier();
      int v46 = 138543362;
      uint64_t v47 = v42;
      _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@Newly generated fabric data is invalid", (uint8_t *)&v46, 0xCu);
    }
    [*(id *)(a1 + 32) _clearNewFabricData];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 11;
    goto LABEL_14;
  }
  BOOL v20 = [*(id *)(a1 + 32) _getDataToPersist];
  uint64_t v21 = (void *)MEMORY[0x2533B64D0]();
  id v22 = *(id *)(a1 + 32);
  int v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = HMFGetLogIdentifier();
    int v46 = 138543618;
    uint64_t v47 = v24;
    __int16 v48 = 2112;
    __int16 v49 = v20;
    _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Attempting to persist %@", (uint8_t *)&v46, 0x16u);
  }
  id v25 = [*(id *)(a1 + 32) storage];
  int v26 = [v25 syncDataSourceDictionary:v20 forFabric:*(void *)(a1 + 32)];

  id v27 = (void *)MEMORY[0x2533B64D0]();
  id v28 = *(id *)(a1 + 32);
  v29 = HMFGetOSLogHandle();
  uint64_t v30 = v29;
  if (v26)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      uint64_t v32 = [*(id *)(a1 + 32) fabricData];
      uint64_t v33 = [*(id *)(a1 + 32) currentDeviceNodeData];
      int v46 = 138543874;
      uint64_t v47 = v31;
      __int16 v48 = 2112;
      __int16 v49 = v32;
      __int16 v50 = 2112;
      __int16 v51 = v33;
      _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully persisted new fabric with %@ and created new controller with %@", (uint8_t *)&v46, 0x20u);
    }
    id v34 = (void *)MEMORY[0x2533B64D0]();
    id v35 = *(id *)(a1 + 32);
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = HMFGetLogIdentifier();
      id v38 = *(void **)(a1 + 32);
      int v46 = 138543618;
      uint64_t v47 = v37;
      __int16 v48 = 2112;
      __int16 v49 = v38;
      _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@New fabric %@", (uint8_t *)&v46, 0x16u);
    }
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v43 = HMFGetLogIdentifier();
      int v46 = 138543362;
      uint64_t v47 = v43;
      _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist new fabric data", (uint8_t *)&v46, 0xCu);
    }
    [*(id *)(a1 + 32) _clearNewFabricData];
    uint64_t v44 = *(void *)(a1 + 40);
    __int16 v45 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v45);
  }
LABEL_15:
}

- (HMMTRFabric)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRFabric;
  uint64_t v8 = [(HMMTRFabric *)&v19 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = objc_alloc_init(HMMTRAccessControl);
    accessControl = v9->_accessControl;
    v9->_accessControl = v10;

    [(HMMTRAccessControl *)v9->_accessControl setFabric:v9];
    id v12 = [[HMMTRFabricData alloc] initWithFabric:v9];
    fabricData = v9->_fabricData;
    v9->_fabricData = v12;

    int v14 = [[HMMTRControllerData alloc] initWithFabric:v9];
    currentDeviceNodeData = v9->_currentDeviceNodeData;
    v9->_currentDeviceNodeData = v14;

    objc_storeStrong((id *)&v9->_workQueue, a4);
    v9->_cachedDataValid = 1;
    uint64_t v16 = [MEMORY[0x263F08C38] UUID];
    targetFabricUUID = v9->_targetFabricUUID;
    v9->_targetFabricUUID = (NSUUID *)v16;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42 != -1) {
    dispatch_once(&logCategory__hmf_once_t42, &__block_literal_global_2632);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v43;
  return v2;
}

uint64_t __26__HMMTRFabric_logCategory__block_invoke()
{
  logCategory__hmf_once___int16 v43 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end