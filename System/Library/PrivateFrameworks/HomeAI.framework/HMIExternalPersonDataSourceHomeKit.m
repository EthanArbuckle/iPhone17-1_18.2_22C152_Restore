@interface HMIExternalPersonDataSourceHomeKit
- (HMIExternalPersonDataSourceHomeKit)initWithHMPhotosPersonManager:(id)a3;
- (HMPhotosPersonManager)photosPersonManager;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)addFaceprints:(id)a3 completion:(id)a4;
- (void)fetchAllFaceprintsWithCompletion:(id)a3;
- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3;
- (void)fetchAllPersonsWithCompletion:(id)a3;
- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchSettingsWithCompletion:(id)a3;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4;
- (void)setPhotosPersonManager:(id)a3;
@end

@implementation HMIExternalPersonDataSourceHomeKit

- (HMIExternalPersonDataSourceHomeKit)initWithHMPhotosPersonManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMIExternalPersonDataSourceHomeKit;
  v6 = [(HMIExternalPersonDataSourceHomeKit *)&v14 init];
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

    objc_storeStrong((id *)&v7->_photosPersonManager, a3);
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
  v9 = [(HMIExternalPersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HMIExternalPersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __68__HMIExternalPersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photosPersonManager];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__HMIExternalPersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_2;
  v3[3] = &unk_26477BD30;
  id v4 = *(id *)(a1 + 40);
  [v2 fetchAllPersonsWithCompletion:v3];
}

void __68__HMIExternalPersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_5);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

id __68__HMIExternalPersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
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
  id v12 = [(HMIExternalPersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMIExternalPersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __71__HMIExternalPersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photosPersonManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__HMIExternalPersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_26477BD30;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 fetchPersonsWithUUIDs:v3 completion:v4];
}

void __71__HMIExternalPersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_4);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

id __71__HMIExternalPersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_3(uint64_t a1, uint64_t a2)
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
  v9 = [(HMIExternalPersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__HMIExternalPersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __76__HMIExternalPersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photosPersonManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__HMIExternalPersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_2;
  v4[3] = &unk_26477BDA8;
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 fetchAllPersonFaceCropsWithCompletion:v4];
}

void __76__HMIExternalPersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__HMIExternalPersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_3;
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

HMIPersonFaceCrop *__76__HMIExternalPersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
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
  id v12 = [(HMIExternalPersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__HMIExternalPersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __83__HMIExternalPersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photosPersonManager];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__HMIExternalPersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2;
  v5[3] = &unk_26477BDA8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 fetchFaceCropsForPersonsWithUUIDs:v3 completion:v5];
}

void __83__HMIExternalPersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __83__HMIExternalPersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_3;
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

HMIPersonFaceCrop *__83__HMIExternalPersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
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
  v9 = [(HMIExternalPersonDataSourceHomeKit *)v6 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__HMIExternalPersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __71__HMIExternalPersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photosPersonManager];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__HMIExternalPersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_2;
  v3[3] = &unk_26477BD30;
  id v4 = *(id *)(a1 + 40);
  [v2 fetchAllFaceprintsWithCompletion:v3];
}

void __71__HMIExternalPersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_9);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

HMIFaceprint *__71__HMIExternalPersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
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
  id v12 = [(HMIExternalPersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__HMIExternalPersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __86__HMIExternalPersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photosPersonManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __86__HMIExternalPersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_26477BD30;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 fetchFaceprintsForFaceCropsWithUUIDs:v3 completion:v4];
}

void __86__HMIExternalPersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

HMIFaceprint *__86__HMIExternalPersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
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
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    dispatch_queue_t v11 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@performCloudPullWithCompletion", (uint8_t *)&v10, 0xCu);
  }
  v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
  v4[2](v4, v9);
}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x22A641C70]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addFaceprints:%@", buf, 0x16u);
  }
  uint64_t v12 = [(HMIExternalPersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMIExternalPersonDataSourceHomeKit_addFaceprints_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __63__HMIExternalPersonDataSourceHomeKit_addFaceprints_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_16);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) photosPersonManager];
  [v2 addOrUpdateFaceprints:v3 completion:*(void *)(a1 + 48)];
}

id __63__HMIExternalPersonDataSourceHomeKit_addFaceprints_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F0E360];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 UUID];
  id v6 = [v3 data];
  id v7 = [v3 modelUUID];
  id v8 = [v3 faceCropUUID];

  v9 = (void *)[v4 initWithUUID:v5 data:v6 modelUUID:v7 faceCropUUID:v8];
  return v9;
}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x22A641C70]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@removeFaceprintsWithUUIDs:%@", buf, 0x16u);
  }
  uint64_t v12 = [(HMIExternalPersonDataSourceHomeKit *)v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMIExternalPersonDataSourceHomeKit_removeFaceprintsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  void block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __75__HMIExternalPersonDataSourceHomeKit_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photosPersonManager];
  [v2 removeFaceprintsWithUUIDs:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)logIdentifier
{
  id v2 = NSString;
  id v3 = [(HMIExternalPersonDataSourceHomeKit *)self photosPersonManager];
  id v4 = [v3 UUID];
  id v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (HMPhotosPersonManager)photosPersonManager
{
  return (HMPhotosPersonManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPhotosPersonManager:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photosPersonManager, 0);
}

@end