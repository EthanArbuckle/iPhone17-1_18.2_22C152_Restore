@interface HMDHomeAIHomePersonDataInterface
+ (id)logCategory;
- (HMDHomeAIHomePersonDataInterface)initWithHomePersonManager:(id)a3 workQueue:(id)a4;
- (HMDHomeAIHomePersonDataInterface)initWithPersonManagerUUID:(id)a3 homeUUID:(id)a4 workQueue:(id)a5;
- (HMIHomePersonManager)homePersonManager;
- (id)logIdentifier;
- (void)addFaceCrops:(id)a3 completion:(id)a4;
- (void)addFaceprints:(id)a3 completion:(id)a4;
- (void)addPersons:(id)a3 completion:(id)a4;
- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3;
- (void)fetchSettingsWithCompletion:(id)a3;
- (void)handleFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4;
- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedUnassociatedFaceCrop:(id)a3 mirrorOutputFuture:(id)a4;
- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HMDHomeAIHomePersonDataInterface

- (void).cxx_destruct
{
}

- (HMIHomePersonManager)homePersonManager
{
  return (HMIHomePersonManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)handleFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc(MEMORY[0x263F47CC8]);
  v10 = [MEMORY[0x263F08C38] UUID];
  v11 = [MEMORY[0x263EFF910] date];
  v12 = objc_msgSend(v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v10, v6, v11, v7, *MEMORY[0x263F0C728], *(double *)(MEMORY[0x263F0C728] + 8), *(double *)(MEMORY[0x263F0C728] + 16), *(double *)(MEMORY[0x263F0C728] + 24));

  v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    int v18 = 138543618;
    v19 = v16;
    __int16 v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying HomeAI home person manager of misclassified person for face crop: %@", (uint8_t *)&v18, 0x16u);
  }
  v17 = [(HMDHomeAIHomePersonDataInterface *)v14 homePersonManager];
  [v17 handleMisclassifiedPersonForFaceCrop:v12];
}

- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 createHMIHomePersonManagerSettings];
  if (v9)
  {
    v10 = [(HMDHomeAIHomePersonDataInterface *)self homePersonManager];
    [v10 handleUpdatedSettings:v9];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Updated settings could not be converted into HMIHomePersonManagerSettings: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)handleUpdatedUnassociatedFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a3;
  id v6 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v8 = [(HMDHomeAIHomePersonDataInterface *)self homePersonManager];
  id v7 = [v5 createHMIFaceCrop];

  [v8 handleUpdatedUnassociatedFaceCrop:v7];
}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMDHomeAIHomePersonDataInterface_removeFaceprintsWithUUIDs_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __73__HMDHomeAIHomePersonDataInterface_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing faceprints with UUIDs: %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) dataSource];
  id v8 = [v7 removeFaceprintsWithUUIDs:*(void *)(a1 + 40)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__HMDHomeAIHomePersonDataInterface_removeFaceprintsWithUUIDs_completion___block_invoke_24;
  v10[3] = &unk_264A2D0B8;
  id v11 = *(id *)(a1 + 48);
  id v9 = (id)[v8 addCompletionBlock:v10];
}

uint64_t __73__HMDHomeAIHomePersonDataInterface_removeFaceprintsWithUUIDs_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HMDHomeAIHomePersonDataInterface_removeFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__HMDHomeAIHomePersonDataInterface_removeFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing face crops with UUIDs: %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) dataSource];
  id v8 = [v7 removeFaceCropsWithUUIDs:*(void *)(a1 + 40)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HMDHomeAIHomePersonDataInterface_removeFaceCropsWithUUIDs_completion___block_invoke_23;
  v10[3] = &unk_264A2D0B8;
  id v11 = *(id *)(a1 + 48);
  id v9 = (id)[v8 addCompletionBlock:v10];
}

uint64_t __72__HMDHomeAIHomePersonDataInterface_removeFaceCropsWithUUIDs_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDHomeAIHomePersonDataInterface_removePersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__HMDHomeAIHomePersonDataInterface_removePersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing persons with UUIDs: %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) dataSource];
  id v8 = [v7 removePersonsWithUUIDs:*(void *)(a1 + 40)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HMDHomeAIHomePersonDataInterface_removePersonsWithUUIDs_completion___block_invoke_22;
  v10[3] = &unk_264A2D0B8;
  id v11 = *(id *)(a1 + 48);
  id v9 = (id)[v8 addCompletionBlock:v10];
}

uint64_t __70__HMDHomeAIHomePersonDataInterface_removePersonsWithUUIDs_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__HMDHomeAIHomePersonDataInterface_addFaceprints_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __61__HMDHomeAIHomePersonDataInterface_addFaceprints_completion___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = a1[4];
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    __int16 v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding faceprints: %@", buf, 0x16u);
  }
  id v7 = objc_msgSend(a1[5], "na_map:", &__block_literal_global_20_163960);
  id v8 = [a1[4] dataSource];
  id v9 = [v8 addOrUpdateFaceprints:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__HMDHomeAIHomePersonDataInterface_addFaceprints_completion___block_invoke_2;
  v11[3] = &unk_264A2D0B8;
  id v12 = a1[6];
  id v10 = (id)[v9 addCompletionBlock:v11];
}

uint64_t __61__HMDHomeAIHomePersonDataInterface_addFaceprints_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __61__HMDHomeAIHomePersonDataInterface_addFaceprints_completion___block_invoke_17(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F0E360];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithHMIFaceprint:v3];

  return v4;
}

- (void)addFaceCrops:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMDHomeAIHomePersonDataInterface_addFaceCrops_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__HMDHomeAIHomePersonDataInterface_addFaceCrops_completion___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = a1[4];
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    __int16 v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding face crops: %@", buf, 0x16u);
  }
  id v7 = objc_msgSend(a1[5], "na_map:", &__block_literal_global_15_163965);
  id v8 = [a1[4] dataSource];
  id v9 = [v8 addOrUpdateFaceCrops:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__HMDHomeAIHomePersonDataInterface_addFaceCrops_completion___block_invoke_2;
  v11[3] = &unk_264A2D0B8;
  id v12 = a1[6];
  id v10 = (id)[v9 addCompletionBlock:v11];
}

uint64_t __60__HMDHomeAIHomePersonDataInterface_addFaceCrops_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __60__HMDHomeAIHomePersonDataInterface_addFaceCrops_completion___block_invoke_12(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F0E358];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithHMIFaceCrop:v3];

  return v4;
}

- (void)addPersons:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDHomeAIHomePersonDataInterface_addPersons_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __58__HMDHomeAIHomePersonDataInterface_addPersons_completion___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = a1[4];
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    __int16 v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding persons: %@", buf, 0x16u);
  }
  id v7 = objc_msgSend(a1[5], "na_map:", &__block_literal_global_9_163970);
  id v8 = [a1[4] dataSource];
  id v9 = [v8 addOrUpdatePersons:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__HMDHomeAIHomePersonDataInterface_addPersons_completion___block_invoke_2;
  v11[3] = &unk_264A2D0B8;
  id v12 = a1[6];
  id v10 = (id)[v9 addCompletionBlock:v11];
}

uint64_t __58__HMDHomeAIHomePersonDataInterface_addPersons_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __58__HMDHomeAIHomePersonDataInterface_addPersons_completion___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F0E620];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithHMIPerson:v3];

  return v4;
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMDHomeAIHomePersonDataInterface_fetchSettingsWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDHomeAIHomePersonDataInterface_fetchSettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Fetching settings", (uint8_t *)&v15, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) dataSource];
  id v7 = [v6 settings];

  id v8 = [v7 createHMIHomePersonManagerSettings];
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetched settings could not be converted into HMIHomePersonManagerSettings: %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    __int16 v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
  }
}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__HMDHomeAIHomePersonDataInterface_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__HMDHomeAIHomePersonDataInterface_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v17 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Fetching all unassociated face crops", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) dataSource];
  if ([v6 isDataAvailable])
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__HMDHomeAIHomePersonDataInterface_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_4;
    v14[3] = &unk_264A254A8;
    id v15 = v7;
    id v8 = v7;
    [v6 enumerateUnassociatedFaceCropsUsingBlock:v14];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v17 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch all unassociated face crops because data is not available", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v8);
  }
}

void __80__HMDHomeAIHomePersonDataInterface_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 createHMIFaceCrop];
  [v2 addObject:v3];
}

- (id)logIdentifier
{
  v2 = [(HMDHomeAIHomePersonDataInterface *)self homePersonManager];
  id v3 = [v2 UUID];
  id v4 = [v3 UUIDString];

  return v4;
}

- (HMDHomeAIHomePersonDataInterface)initWithHomePersonManager:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDHomeAIHomePersonDataInterface;
  id v8 = [(HMDHomeAIPersonDataInterface *)&v11 initWithPersonManager:v7 workQueue:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_homePersonManager, a3);
  }

  return v9;
}

- (HMDHomeAIHomePersonDataInterface)initWithPersonManagerUUID:(id)a3 homeUUID:(id)a4 workQueue:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263F47CA8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v8 alloc] initWithUUID:v11 homeUUID:v10];

  uint64_t v13 = [(HMDHomeAIHomePersonDataInterface *)self initWithHomePersonManager:v12 workQueue:v9];
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_163988 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_163988, &__block_literal_global_163989);
  }
  v2 = (void *)logCategory__hmf_once_v1_163990;
  return v2;
}

void __47__HMDHomeAIHomePersonDataInterface_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_163990;
  logCategory__hmf_once_v1_163990 = v0;
}

@end