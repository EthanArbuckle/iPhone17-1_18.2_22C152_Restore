@interface HMDHomeLocalOperationalCertificateDataStore
+ (id)localOperationalCertDataStore;
+ (id)logCategory;
- (HMDHomeLocalOperationalCertificateDataStore)initWithMOC:(id)a3;
- (NSManagedObjectContext)localMOC;
- (id)currentOperationalCertDataForFabric:(id)a3 withMOC:(id)a4 error:(id *)a5;
- (id)operationalCertDataForFabricID:(id)a3;
- (void)removeOperationalCertDataForFabricID:(id)a3;
- (void)saveOperationalCertData:(id)a3 forFabricID:(id)a4;
- (void)setLocalMOC:(id)a3;
@end

@implementation HMDHomeLocalOperationalCertificateDataStore

- (void).cxx_destruct
{
}

- (void)setLocalMOC:(id)a3
{
}

- (NSManagedObjectContext)localMOC
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)removeOperationalCertDataForFabricID:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = [(HMDHomeLocalOperationalCertificateDataStore *)self localMOC];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__HMDHomeLocalOperationalCertificateDataStore_removeOperationalCertDataForFabricID___block_invoke;
  v10[3] = &unk_264A2F078;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  id v8 = v6;
  id v12 = v8;
  v14 = v15;
  v9 = v5;
  v13 = v9;
  [v8 performBlock:v10];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(v15, 8);
}

void __84__HMDHomeLocalOperationalCertificateDataStore_removeOperationalCertDataForFabricID___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v22 = 0;
  v5 = [v2 currentOperationalCertDataForFabric:v3 withMOC:v4 error:&v22];
  id v6 = v22;
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentCertData for fabric %@", buf, 0x16u);
    }

    v5 = 0;
  }
  else if (v5)
  {
    [*(id *)(a1 + 48) deleteObject:v5];
    v13 = *(void **)(a1 + 48);
    id v21 = 0;
    char v14 = [v13 save:&v21];
    id v7 = v21;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v14;
  }
  else
  {
    id v7 = 0;
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = *(id *)(a1 + 32);
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    v19 = HMFBooleanToString();
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v24 = v18;
    __int16 v25 = 2112;
    v26 = v19;
    __int16 v27 = 2112;
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@LocalOperationalCertificateData deletion results = %@, fabricID %@ error %@", buf, 0x2Au);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (id)operationalCertDataForFabricID:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__244812;
  id v21 = __Block_byref_object_dispose__244813;
  id v22 = 0;
  v5 = [(HMDHomeLocalOperationalCertificateDataStore *)self localMOC];
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__HMDHomeLocalOperationalCertificateDataStore_operationalCertDataForFabricID___block_invoke;
  v12[3] = &unk_264A2F078;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  id v16 = &v17;
  id v9 = v6;
  v15 = v9;
  [v8 performBlock:v12];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __78__HMDHomeLocalOperationalCertificateDataStore_operationalCertDataForFabricID___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v26 = 0;
  v5 = [v2 currentOperationalCertDataForFabric:v3 withMOC:v4 error:&v26];
  id v6 = v26;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error %@ fetching currentCertData for fabric %@", buf, 0x20u);
    }
  }
  else if (v5)
  {
    id v17 = objc_alloc(MEMORY[0x263F497E0]);
    v18 = [v5 fabricID];
    uint64_t v19 = [v5 rootCert];
    uint64_t v20 = [v5 operationalCert];
    id v21 = [v5 ownerNodeID];
    id v22 = [v5 ipk];
    uint64_t v23 = [v17 initWithFabricID:v18 rootCert:v19 operationalCert:v20 ownerNode:v21 ipk:v22];
    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    __int16 v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    goto LABEL_10;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = HMFGetLogIdentifier();
    id v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No locally saved data for fabricID %@", buf, 0x16u);
  }
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)saveOperationalCertData:(id)a3 forFabricID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeLocalOperationalCertificateDataStore *)self localMOC];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__HMDHomeLocalOperationalCertificateDataStore_saveOperationalCertData_forFabricID___block_invoke;
  v12[3] = &unk_264A2E610;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  [v10 performBlock:v12];
}

void __83__HMDHomeLocalOperationalCertificateDataStore_saveOperationalCertData_forFabricID___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v30 = 0;
  v5 = [v2 currentOperationalCertDataForFabric:v3 withMOC:v4 error:&v30];
  id v6 = v30;
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v11;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error %@ fetching currentCertData for fabric %@", buf, 0x20u);
    }
  }
  else
  {
    if (!v5)
    {
      id v13 = (void *)MEMORY[0x263EFF240];
      id v14 = +[MKFLocalOperationalCertificateData entity];
      id v15 = [v14 name];
      v5 = [v13 insertNewObjectForEntityForName:v15 inManagedObjectContext:*(void *)(a1 + 48)];

      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        uint64_t v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v19;
        __int16 v33 = 2112;
        id v34 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Created new model for LocalOperationalCertificateData for fabric %@", buf, 0x16u);
      }
    }
    [v5 setFabricID:*(void *)(a1 + 40)];
    id v21 = [*(id *)(a1 + 56) operationalCert];
    [v5 setOperationalCert:v21];

    id v22 = [*(id *)(a1 + 56) rootCert];
    [v5 setRootCert:v22];

    uint64_t v23 = [*(id *)(a1 + 56) ownerNode];
    [v5 setOwnerNodeID:v23];

    uint64_t v24 = [*(id *)(a1 + 56) ipk];
    [v5 setIpk:v24];

    __int16 v25 = *(void **)(a1 + 48);
    id v29 = 0;
    [v25 save:&v29];
    id v7 = v29;
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v26 = HMFGetLogIdentifier();
      __int16 v27 = *(void **)(a1 + 40);
      uint64_t v28 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v26;
      __int16 v33 = 2112;
      id v34 = v27;
      __int16 v35 = 2112;
      v36 = v28;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@LocalOperationalCertificateData for fabricID %@ save resuls = %@, error %@", buf, 0x2Au);
    }
  }
}

- (id)currentOperationalCertDataForFabric:(id)a3 withMOC:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend(v8, "hmd_assertIsExecuting");
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__244812;
  id v21 = __Block_byref_object_dispose__244813;
  id v22 = 0;
  id v9 = +[MKFLocalOperationalCertificateData fetchRequest];
  id v10 = [v8 executeFetchRequest:v9 error:a5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__HMDHomeLocalOperationalCertificateDataStore_currentOperationalCertDataForFabric_withMOC_error___block_invoke;
  v14[3] = &unk_264A2BE28;
  id v11 = v7;
  id v15 = v11;
  id v16 = &v17;
  objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __97__HMDHomeLocalOperationalCertificateDataStore_currentOperationalCertDataForFabric_withMOC_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = [v12 entity];
  id v8 = +[MKFLocalOperationalCertificateData entity];
  int v9 = [v7 isKindOfEntity:v8];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v12 fabricID];
    LODWORD(v10) = [v10 isEqual:v11];

    if (v10)
    {
      *a4 = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

- (HMDHomeLocalOperationalCertificateDataStore)initWithMOC:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHomeLocalOperationalCertificateDataStore;
  id v6 = [(HMDHomeLocalOperationalCertificateDataStore *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localMOC, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_244830 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_244830, &__block_literal_global_7_244831);
  }
  v2 = (void *)logCategory__hmf_once_v8_244832;
  return v2;
}

void __58__HMDHomeLocalOperationalCertificateDataStore_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_244832;
  logCategory__hmf_once_v8_244832 = v0;
}

+ (id)localOperationalCertDataStore
{
  if (localOperationalCertDataStore_dispatchOnce != -1) {
    dispatch_once(&localOperationalCertDataStore_dispatchOnce, &__block_literal_global_244837);
  }
  v2 = (void *)localOperationalCertDataStore_result;
  return v2;
}

void __76__HMDHomeLocalOperationalCertificateDataStore_localOperationalCertDataStore__block_invoke()
{
  uint64_t v0 = [HMDHomeLocalOperationalCertificateDataStore alloc];
  id v5 = +[HMDCoreData sharedInstance];
  v1 = [v5 container];
  v2 = (void *)[v1 newBackgroundContext];
  uint64_t v3 = [(HMDHomeLocalOperationalCertificateDataStore *)v0 initWithMOC:v2];
  uint64_t v4 = (void *)localOperationalCertDataStore_result;
  localOperationalCertDataStore_result = v3;
}

@end