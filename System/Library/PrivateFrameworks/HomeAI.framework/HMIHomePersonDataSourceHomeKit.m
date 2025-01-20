@interface HMIHomePersonDataSourceHomeKit
- (HMHomePersonManager)homePersonManager;
- (HMIHomePersonDataSourceHomeKit)initWithHMHomePersonManager:(id)a3;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)addFaceCrops:(id)a3 completion:(id)a4;
- (void)addFaceprints:(id)a3 completion:(id)a4;
- (void)addPersonFaceCrops:(id)a3 completion:(id)a4;
- (void)addPersons:(id)a3 completion:(id)a4;
- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6;
- (void)fetchAllFaceprintsWithCompletion:(id)a3;
- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3;
- (void)fetchAllPersonsWithCompletion:(id)a3;
- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3;
- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchSettingsWithCompletion:(id)a3;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4;
- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)setHomePersonManager:(id)a3;
@end

@implementation HMIHomePersonDataSourceHomeKit

- (HMIHomePersonDataSourceHomeKit)initWithHMHomePersonManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMIHomePersonDataSourceHomeKit;
  v6 = [(HMIHomePersonDataSourceHomeKit *)&v14 init];
  v7 = v6;
  if (v6)
  {
    HMIDispatchQueueNameString(v6, 0);
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v7->_homePersonManager, a3);
  }

  return v7;
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    objc_super v14 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllPersonsWithCompletion", buf, 0xCu);
  }
  v9 = [(HMIHomePersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) homePersonManager];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_2;
  v3[3] = &unk_26477BD30;
  id v4 = *(id *)(a1 + 40);
  [v2 fetchAllPersonsWithCompletion:v3];
}

void __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_23);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

id __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HMIPerson personFromHomePerson:a2];
}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x22A641C70]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@fetchPersonsWithUUIDs:%@", buf, 0x16u);
  }
  id v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) homePersonManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_26477BD30;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 fetchPersonsWithUUIDs:v3 completion:v4];
}

void __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_4_0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

id __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HMIPerson personFromHomePerson:a2];
}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllPersonFaceCropsWithCompletion", buf, 0xCu);
  }
  v9 = [(HMIHomePersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) homePersonManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_2;
  v4[3] = &unk_26477BDA8;
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 fetchAllPersonFaceCropsWithCompletion:v4];
}

void __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_3;
    v5[3] = &unk_26477BD80;
    v5[4] = *(void *)(a1 + 32);
    id v3 = objc_msgSend(a2, "na_map:", v5);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

HMIPersonFaceCrop *__72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [v3 source];
  if (v4 >= 5)
  {
    id v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v8;
      __int16 v26 = 2048;
      uint64_t v27 = [v3 source];
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMPersonFaceCropSource: %ld", (uint8_t *)&v24, 0x16u);
    }
    unint64_t v4 = 0;
  }
  v9 = [HMIPersonFaceCrop alloc];
  id v10 = [v3 UUID];
  dispatch_queue_t v11 = [v3 dataRepresentation];
  id v12 = [v3 dateCreated];
  [v3 faceBoundingBox];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [v3 personUUID];
  uint64_t v22 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v10, v11, v12, v21, v4, v14, v16, v18, v20);

  return v22;
}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x22A641C70]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@fetchFaceCropsForPersonsWithUUIDs:%@", buf, 0x16u);
  }
  id v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) homePersonManager];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2;
  v5[3] = &unk_26477BDA8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 fetchFaceCropsForPersonsWithUUIDs:v3 completion:v5];
}

void __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_3;
    v5[3] = &unk_26477BD80;
    v5[4] = *(void *)(a1 + 32);
    uint64_t v3 = objc_msgSend(a2, "na_map:", v5);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

HMIPersonFaceCrop *__79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [v3 source];
  if (v4 >= 5)
  {
    id v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v8;
      __int16 v26 = 2048;
      uint64_t v27 = [v3 source];
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMPersonFaceCropSource: %ld", (uint8_t *)&v24, 0x16u);
    }
    unint64_t v4 = 0;
  }
  v9 = [HMIPersonFaceCrop alloc];
  id v10 = [v3 UUID];
  dispatch_queue_t v11 = [v3 dataRepresentation];
  id v12 = [v3 dateCreated];
  [v3 faceBoundingBox];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [v3 personUUID];
  uint64_t v22 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v10, v11, v12, v21, v4, v14, v16, v18, v20);

  return v22;
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    double v14 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllFaceprintsWithCompletion", buf, 0xCu);
  }
  v9 = [(HMIHomePersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) homePersonManager];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_2;
  v3[3] = &unk_26477BD30;
  id v4 = *(id *)(a1 + 40);
  [v2 fetchAllFaceprintsWithCompletion:v3];
}

void __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_9_1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

HMIFaceprint *__67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [HMIFaceprint alloc];
  id v4 = [v2 UUID];
  id v5 = [v2 data];
  id v6 = [v2 modelUUID];
  id v7 = [v2 faceCropUUID];

  id v8 = [(HMIFaceprint *)v3 initWithUUID:v4 data:v5 modelUUID:v6 faceCropUUID:v7];
  return v8;
}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x22A641C70]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@fetchFaceprintsForFaceCropsWithUUIDs:%@", buf, 0x16u);
  }
  id v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homePersonManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_26477BD30;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 fetchFaceprintsForFaceCropsWithUUIDs:v3 completion:v4];
}

void __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_12_0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

HMIFaceprint *__82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [HMIFaceprint alloc];
  id v4 = [v2 UUID];
  id v5 = [v2 data];
  id v6 = [v2 modelUUID];
  id v7 = [v2 faceCropUUID];

  id v8 = [(HMIFaceprint *)v3 initWithUUID:v4 data:v5 modelUUID:v6 faceCropUUID:v7];
  return v8;
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    dispatch_queue_t v11 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchSettingsWithCompletion", (uint8_t *)&v10, 0xCu);
  }
  v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
  v4[2](v4, 0, v9);
}

- (void)performCloudPullWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@performCloudPullWithCompletion", buf, 0xCu);
  }
  v9 = [(HMIHomePersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HMIHomePersonDataSourceHomeKit_performCloudPullWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __65__HMIHomePersonDataSourceHomeKit_performCloudPullWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homePersonManager];
  [v2 performCloudPullWithCompletion:*(void *)(a1 + 40)];
}

- (void)addFaceCrops:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x22A641C70]();
  v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addFaceCrops:%@", buf, 0x16u);
  }
  id v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMIHomePersonDataSourceHomeKit_addFaceCrops_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __58__HMIHomePersonDataSourceHomeKit_addFaceCrops_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_16_0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) homePersonManager];
  [v2 addOrUpdateFaceCrops:v3 completion:*(void *)(a1 + 48)];
}

id __58__HMIHomePersonDataSourceHomeKit_addFaceCrops_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F0E358];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 UUID];
  id v6 = [v3 dataRepresentation];
  id v7 = [v3 dateCreated];
  [v3 faceBoundingBox];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id v16 = objc_msgSend(v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7, v9, v11, v13, v15);
  return v16;
}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)MEMORY[0x22A641C70]();
  double v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addFaceprints:%@", buf, 0x16u);
  }
  double v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMIHomePersonDataSourceHomeKit_addFaceprints_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __59__HMIHomePersonDataSourceHomeKit_addFaceprints_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_20_0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) homePersonManager];
  [v2 addOrUpdateFaceprints:v3 completion:*(void *)(a1 + 48)];
}

id __59__HMIHomePersonDataSourceHomeKit_addFaceprints_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F0E360];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 UUID];
  id v6 = [v3 data];
  id v7 = [v3 modelUUID];
  double v8 = [v3 faceCropUUID];

  double v9 = (void *)[v4 initWithUUID:v5 data:v6 modelUUID:v7 faceCropUUID:v8];
  return v9;
}

- (void)addPersonFaceCrops:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)MEMORY[0x22A641C70]();
  double v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addPersonFaceCrops:%@", buf, 0x16u);
  }
  double v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke_2;
  v5[3] = &unk_26477D880;
  v5[4] = *(void *)(a1 + 40);
  id v3 = objc_msgSend(v2, "na_map:", v5);
  id v4 = [*(id *)(a1 + 40) homePersonManager];
  [v4 addOrUpdateFaceCrops:v3 completion:*(void *)(a1 + 48)];
}

id __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [v3 source];
  if (v4 >= 5)
  {
    id v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      double v8 = HMFGetLogIdentifier();
      int v25 = 138543618;
      __int16 v26 = v8;
      __int16 v27 = 2048;
      uint64_t v28 = [v3 source];
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMIPersonFaceCropSource: %ld", (uint8_t *)&v25, 0x16u);
    }
    unint64_t v4 = 0;
  }
  id v9 = objc_alloc(MEMORY[0x263F0E5C8]);
  double v10 = [v3 UUID];
  double v11 = [v3 dataRepresentation];
  double v12 = [v3 dateCreated];
  [v3 faceBoundingBox];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  __int16 v21 = [v3 personUUID];
  id v22 = objc_msgSend(v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v10, v11, v12, v21, v14, v16, v18, v20);

  [v22 setSource:v4];
  uint64_t v23 = (void *)[v22 copy];

  return v23;
}

- (void)addPersons:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)MEMORY[0x22A641C70]();
  id v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addPersons:%@", buf, 0x16u);
  }
  double v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMIHomePersonDataSourceHomeKit_addPersons_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v16 = v6;
  double v17 = v9;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __56__HMIHomePersonDataSourceHomeKit_addPersons_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_26);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) homePersonManager];
  [v2 addOrUpdatePersons:v3 completion:*(void *)(a1 + 48)];
}

id __56__HMIHomePersonDataSourceHomeKit_addPersons_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F0E5C0];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 UUID];
  id v6 = (void *)[v4 initWithUUID:v5];

  id v7 = [v3 name];

  [v6 setName:v7];
  return v6;
}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllUnassociatedFaceCropsWithCompletion", buf, 0xCu);
  }
  id v9 = [(HMIHomePersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homePersonManager];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_2;
  v3[3] = &unk_26477BD30;
  id v4 = *(id *)(a1 + 40);
  [v2 fetchAllUnassociatedFaceCropsWithCompletion:v3];
}

void __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_30);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

HMIFaceCrop *__78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [HMIFaceCrop alloc];
  id v4 = [v2 UUID];
  id v5 = [v2 dataRepresentation];
  id v6 = [v2 dateCreated];
  [v2 faceBoundingBox];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v3, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v4, v5, v6, v8, v10, v12, v14);
  return v15;
}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)MEMORY[0x22A641C70]();
  double v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@removeFaceCropsWithUUIDs:%@", buf, 0x16u);
  }
  double v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMIHomePersonDataSourceHomeKit_removeFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  void block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __70__HMIHomePersonDataSourceHomeKit_removeFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homePersonManager];
  [v2 removeFaceCropsWithUUIDs:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)MEMORY[0x22A641C70]();
  double v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@removeFaceprintsWithUUIDs:%@", buf, 0x16u);
  }
  double v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMIHomePersonDataSourceHomeKit_removeFaceprintsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  void block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __71__HMIHomePersonDataSourceHomeKit_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homePersonManager];
  [v2 removeFaceprintsWithUUIDs:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)MEMORY[0x22A641C70]();
  double v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@removePersonsWithUUIDs:%@", buf, 0x16u);
  }
  double v12 = [(HMIHomePersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMIHomePersonDataSourceHomeKit_removePersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  void block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __68__HMIHomePersonDataSourceHomeKit_removePersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homePersonManager];
  [v2 removePersonsWithUUIDs:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5) {
    _HMFPreconditionFailure();
  }
  id v13 = v12;
  id v14 = (void *)MEMORY[0x22A641C70]();
  uint64_t v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v17;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_DEBUG, "%{public}@associateFaceCropsWithUUIDs:%@ toPersonWithUUID:%@", buf, 0x20u);
  }
  id v18 = [(HMIHomePersonDataSourceHomeKit *)v15 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__HMIHomePersonDataSourceHomeKit_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke;
  block[3] = &unk_26477D8E8;
  id v25 = v13;
  int64_t v26 = a5;
  void block[4] = v15;
  id v23 = v10;
  id v24 = v11;
  id v19 = v13;
  id v20 = v11;
  id v21 = v10;
  dispatch_async(v18, block);
}

void __100__HMIHomePersonDataSourceHomeKit_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 5)
  {
    id v3 = (void *)MEMORY[0x22A641C70]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 64);
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMIPersonFaceCropSource: %ld", (uint8_t *)&v9, 0x16u);
    }
    unint64_t v2 = 0;
  }
  double v8 = [*(id *)(a1 + 32) homePersonManager];
  [v8 associateFaceCropsWithUUIDs:*(void *)(a1 + 40) toPersonWithUUID:*(void *)(a1 + 48) forSource:v2 completion:*(void *)(a1 + 56)];
}

- (id)logIdentifier
{
  unint64_t v2 = NSString;
  id v3 = [(HMIHomePersonDataSourceHomeKit *)self homePersonManager];
  id v4 = [v3 UUID];
  id v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (HMHomePersonManager)homePersonManager
{
  return (HMHomePersonManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHomePersonManager:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homePersonManager, 0);
}

@end