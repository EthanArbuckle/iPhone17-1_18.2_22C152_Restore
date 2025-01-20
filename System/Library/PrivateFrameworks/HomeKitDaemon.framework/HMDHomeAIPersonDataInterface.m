@interface HMDHomeAIPersonDataInterface
- (HMDHomeAIPersonDataInterface)initWithPersonManager:(id)a3 workQueue:(id)a4;
- (HMDPersonDataSource)dataSource;
- (HMIPersonManager)personManager;
- (OS_dispatch_queue)workQueue;
- (void)configureWithDataSource:(id)a3 home:(id)a4;
- (void)fetchAllFaceprintsWithCompletion:(id)a3;
- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3;
- (void)fetchAllPersonsWithCompletion:(id)a3;
- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleRemovedFaceprintWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedFaceprint:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedIsCurrentDeviceAvailableResident:(BOOL)a3;
- (void)handleUpdatedIsDataSyncInProgress:(BOOL)a3;
- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation HMDHomeAIPersonDataInterface

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPersonDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPersonDataSource *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMIPersonManager)personManager
{
  return (HMIPersonManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)handleUpdatedIsDataSyncInProgress:(BOOL)a3
{
  int v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDHomeAIPersonDataInterface *)self personManager];
  int v7 = [v6 isPersonDataAvailableViaHomeKit];

  if (v7 == v3)
  {
    uint64_t v8 = v3 ^ 1u;
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HMDHomeAIPersonDataInterface *)v10 personManager];
      int v14 = [v13 isPersonDataAvailableViaHomeKit];
      v15 = [(HMDHomeAIPersonDataInterface *)v10 personManager];
      int v17 = 138544130;
      v18 = v12;
      __int16 v19 = 1024;
      int v20 = v14;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating personDataAvailableViaHomeKit from %d -> %d on %@", (uint8_t *)&v17, 0x22u);
    }
    v16 = [(HMDHomeAIPersonDataInterface *)v10 personManager];
    [v16 setPersonDataAvailableViaHomeKit:v8];
  }
}

- (void)handleUpdatedIsCurrentDeviceAvailableResident:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  v5 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDHomeAIPersonDataInterface *)self personManager];
  int v7 = [v6 supportsFaceClassification];

  if (v7 != v3)
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [(HMDHomeAIPersonDataInterface *)v9 personManager];
      int v13 = [v12 supportsFaceClassification];
      int v14 = [(HMDHomeAIPersonDataInterface *)v9 personManager];
      int v16 = 138544130;
      int v17 = v11;
      __int16 v18 = 1024;
      int v19 = v13;
      __int16 v20 = 1024;
      BOOL v21 = v3;
      __int16 v22 = 2112;
      __int16 v23 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating supportsFaceClassification from %d -> %d on %@", (uint8_t *)&v16, 0x22u);
    }
    v15 = [(HMDHomeAIPersonDataInterface *)v9 personManager];
    [v15 setSupportsFaceClassification:v3];
  }
}

- (void)handleRemovedFaceprintWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a3;
  v6 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDHomeAIPersonDataInterface *)self personManager];
  [v7 handleRemovedFaceprintWithUUID:v5];
}

- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a3;
  v6 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDHomeAIPersonDataInterface *)self personManager];
  [v7 handleRemovedFaceCropWithUUID:v5];
}

- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a3;
  v6 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDHomeAIPersonDataInterface *)self personManager];
  [v7 handleRemovedPersonWithUUID:v5];
}

- (void)handleUpdatedFaceprint:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a3;
  v6 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v8 = [(HMDHomeAIPersonDataInterface *)self personManager];
  id v7 = [v5 createHMIFaceprint];

  [v8 handleUpdatedFaceprint:v7];
}

- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a3;
  v6 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v8 = [(HMDHomeAIPersonDataInterface *)self personManager];
  id v7 = [v5 createHMIPersonFaceCrop];

  [v8 handleUpdatedPersonFaceCrop:v7];
}

- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a3;
  v6 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v8 = [(HMDHomeAIPersonDataInterface *)self personManager];
  id v7 = [v5 createHMIPerson];

  [v8 handleUpdatedPerson:v7];
}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (!v6) {
    _HMFPreconditionFailure();
  }
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring HomeAI person data interface", (uint8_t *)&v14, 0xCu);
  }
  [(HMDHomeAIPersonDataInterface *)v10 setDataSource:v6];
  int v13 = [(HMDHomeAIPersonDataInterface *)v10 personManager];
  [v13 setDataSource:v10];
}

- (void)performCloudPullWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v14 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull", buf, 0xCu);
  }
  v9 = [(HMDHomeAIPersonDataInterface *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke;
  v11[3] = &unk_264A2F870;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  BOOL v3 = [v2 performCloudPull];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke_2;
  v5[3] = &unk_264A2D0B8;
  id v6 = *(id *)(a1 + 40);
  id v4 = (id)[v3 addCompletionBlock:v5];
}

uint64_t __63__HMDHomeAIPersonDataInterface_performCloudPullWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching faceprints for face crops with UUIDs: %@", buf, 0x16u);
  }
  id v12 = [(HMDHomeAIPersonDataInterface *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDHomeAIPersonDataInterface_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  id v16 = v6;
  id v17 = v7;
  block[4] = v9;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(v12, block);
}

void __80__HMDHomeAIPersonDataInterface_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dataSource];
  if ([v2 isDataAvailable])
  {
    BOOL v3 = [v2 faceprintsForFaceCropsWithUUIDs:*(void *)(a1 + 40)];
    id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_17);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch faceprints for face crops because data is not available", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

uint64_t __80__HMDHomeAIPersonDataInterface_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 createHMIFaceprint];
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching all faceprints", buf, 0xCu);
  }
  uint64_t v9 = [(HMDHomeAIPersonDataInterface *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke;
  v11[3] = &unk_264A2F870;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dataSource];
  if ([v2 isDataAvailable])
  {
    BOOL v3 = [MEMORY[0x263EFF9C0] set];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke_12;
    v10[3] = &unk_264A254F8;
    id v11 = v3;
    id v4 = v3;
    [v2 enumerateFaceprintsUsingBlock:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch all faceprints because data is not available", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v4);
  }
}

void __65__HMDHomeAIPersonDataInterface_fetchAllFaceprintsWithCompletion___block_invoke_12(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 createHMIFaceprint];
  [v2 addObject:v3];
}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for persons with UUIDs: %@", buf, 0x16u);
  }
  id v12 = [(HMDHomeAIPersonDataInterface *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__HMDHomeAIPersonDataInterface_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  id v16 = v6;
  id v17 = v7;
  block[4] = v9;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(v12, block);
}

void __77__HMDHomeAIPersonDataInterface_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dataSource];
  if ([v2 isDataAvailable])
  {
    id v3 = [v2 faceCropsForPersonsWithUUIDs:*(void *)(a1 + 40)];
    id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_11);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch face crops for persons because data is not available", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

uint64_t __77__HMDHomeAIPersonDataInterface_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 createHMIPersonFaceCrop];
}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching all person face crops", buf, 0xCu);
  }
  uint64_t v9 = [(HMDHomeAIPersonDataInterface *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v11[3] = &unk_264A2F870;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dataSource];
  if ([v2 isDataAvailable])
  {
    id v3 = [MEMORY[0x263EFF9C0] set];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke_6;
    v10[3] = &unk_264A254D0;
    id v11 = v3;
    id v4 = v3;
    [v2 enumeratePersonFaceCropsUsingBlock:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch all person face crops because data is not available", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v4);
  }
}

void __70__HMDHomeAIPersonDataInterface_fetchAllPersonFaceCropsWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 createHMIPersonFaceCrop];
  [v2 addObject:v3];
}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching persons with UUIDs: %@", buf, 0x16u);
  }
  id v12 = [(HMDHomeAIPersonDataInterface *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDHomeAIPersonDataInterface_fetchPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  id v16 = v6;
  id v17 = v7;
  block[4] = v9;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(v12, block);
}

void __65__HMDHomeAIPersonDataInterface_fetchPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dataSource];
  if ([v2 isDataAvailable])
  {
    id v3 = [v2 personsWithUUIDs:*(void *)(a1 + 40)];
    id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_13082);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch persons with UUIDs because data is not available", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

uint64_t __65__HMDHomeAIPersonDataInterface_fetchPersonsWithUUIDs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 createHMIPerson];
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching all persons", buf, 0xCu);
  }
  uint64_t v9 = [(HMDHomeAIPersonDataInterface *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke;
  v11[3] = &unk_264A2F870;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) dataSource];
  if ([v2 isDataAvailable])
  {
    id v3 = [MEMORY[0x263EFF9C0] set];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke_2;
    v10[3] = &unk_264A25480;
    id v11 = v3;
    id v4 = v3;
    [v2 enumeratePersonsUsingBlock:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch all persons because data is not available", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v4);
  }
}

void __62__HMDHomeAIPersonDataInterface_fetchAllPersonsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 createHMIPerson];
  [v2 addObject:v3];
}

- (HMDHomeAIPersonDataInterface)initWithPersonManager:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeAIPersonDataInterface;
  uint64_t v9 = [(HMDHomeAIPersonDataInterface *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a4);
    objc_storeStrong((id *)&v10->_personManager, a3);
  }

  return v10;
}

@end