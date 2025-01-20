@interface HMDPhotoLibrary
+ (id)_phPersonWithUUID:(id)a3 fromSuggestedPersonsFetchResult:(id)a4;
+ (id)logCategory;
- (HMDPhotoLibrary)initWithWorkQueue:(id)a3;
- (HMDPhotoLibraryDelegate)delegate;
- (NSSet)persons;
- (OS_dispatch_queue)workQueue;
- (PHFetchResult)suggestedPersonsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (id)faceCropFromFaceCropData:(id)a3;
- (id)fetchFaceCropDataByUUIDForPersonUUID:(id)a3;
- (id)fetchOptions;
- (unint64_t)numberOfFaceCropsForPersonWithUUID:(id)a3;
- (void)fetchPersons;
- (void)photoLibraryDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSuggestedPersonsFetchResult:(id)a3;
@end

@implementation HMDPhotoLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPersonsFetchResult, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setSuggestedPersonsFetchResult:(id)a3
{
}

- (PHFetchResult)suggestedPersonsFetchResult
{
  return (PHFetchResult *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(HMDPhotoLibrary *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HMDPhotoLibrary_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __41__HMDPhotoLibrary_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Photo Library did change", (uint8_t *)&v25, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) changedLocalIdentifiersForEntityClass:objc_opt_class()];
  uint64_t v7 = *MEMORY[0x263F150D0];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F150D0]];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:v7];
    int v10 = objc_msgSend(v9, "hmf_isEmpty") ^ 1;
  }
  else
  {
    int v10 = 0;
  }

  v11 = *(void **)(a1 + 40);
  v12 = [*(id *)(a1 + 32) suggestedPersonsFetchResult];
  v13 = [v11 changeDetailsForFetchResult:v12];

  v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = *(id *)(a1 + 32);
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = HMFGetLogIdentifier();
    v18 = HMFBooleanToString();
    int v25 = 138543874;
    v26 = v17;
    __int16 v27 = 2112;
    v28 = v18;
    __int16 v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@anyPersonWasAdded: %@, changeDetails: %@", (uint8_t *)&v25, 0x20u);
  }
  if (v13) {
    int v19 = 1;
  }
  else {
    int v19 = v10;
  }
  if (v19 == 1)
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Found changes for photo library persons", (uint8_t *)&v25, 0xCu);
    }
    v24 = [*(id *)(a1 + 32) delegate];
    [v24 photoLibraryPersonsDidChange];
  }
}

- (id)fetchOptions
{
  id v3 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDPhotoLibrary *)self photoLibrary];
  v5 = [v4 librarySpecificFetchOptions];

  [v5 setIncludeNonvisibleFaces:0];
  return v5;
}

- (PHPhotoLibrary)photoLibrary
{
  id v3 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v3);

  photoLibrary = self->_photoLibrary;
  if (!photoLibrary)
  {
    v5 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
    id v6 = self->_photoLibrary;
    self->_photoLibrary = v5;

    photoLibrary = self->_photoLibrary;
  }
  return photoLibrary;
}

- (id)faceCropFromFaceCropData:(id)a3
{
  return (id)[MEMORY[0x263F47C90] faceCropFromPhotosFaceCropImageData:a3];
}

- (unint64_t)numberOfFaceCropsForPersonWithUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDPhotoLibrary *)self suggestedPersonsFetchResult];
  if (v6)
  {
    uint64_t v7 = +[HMDPhotoLibrary _phPersonWithUUID:v4 fromSuggestedPersonsFetchResult:v6];
    if (v7)
    {
      id v8 = [(HMDPhotoLibrary *)self fetchOptions];
      v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"isInVIPModel == YES"];
      [v8 setPredicate:v9];

      int v10 = [MEMORY[0x263F14DF0] fetchFacesForPerson:v7 options:v8];
      v11 = [v10 objects];
      unint64_t v12 = [v11 count];
    }
    else
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v20;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find person with UUID: %@, returning 0", (uint8_t *)&v22, 0x16u);
      }
      unint64_t v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@suggestedPersonsFetchResult is nil, returning 0", (uint8_t *)&v22, 0xCu);
    }
    unint64_t v12 = 0;
  }

  return v12;
}

- (id)fetchFaceCropDataByUUIDForPersonUUID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDPhotoLibrary *)self suggestedPersonsFetchResult];
  if (v6)
  {
    uint64_t v7 = +[HMDPhotoLibrary _phPersonWithUUID:v4 fromSuggestedPersonsFetchResult:v6];
    if (v7)
    {
      id v8 = [(HMDPhotoLibrary *)self fetchOptions];
      [v8 setFetchLimit:20];
      v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:0];
      int v22 = v9;
      int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
      [v8 setSortDescriptors:v10];

      v11 = [MEMORY[0x263F14E00] fetchTransientTrainingFaceCropsForPerson:v7 options:v8];
      unint64_t v12 = [v11 faceCropDataByUUID];
    }
    else
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v24 = v20;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find person with UUID: %@, returning empty dictionary", buf, 0x16u);
      }
      unint64_t v12 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v24 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@suggestedPersonsFetchResult is nil, returning nil", buf, 0xCu);
    }
    unint64_t v12 = 0;
  }

  return v12;
}

- (void)fetchPersons
{
  id v3 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x263F14E88];
  id v6 = [(HMDPhotoLibrary *)self fetchOptions];
  v5 = [v4 fetchSuggestedPersonsForClient:1 options:v6];
  [(HMDPhotoLibrary *)self setSuggestedPersonsFetchResult:v5];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v5);

  objc_storeWeak((id *)&self->_delegate, v4);
  id v6 = [(HMDPhotoLibrary *)self photoLibrary];
  id v7 = v6;
  if (v4) {
    [v6 registerChangeObserver:self];
  }
  else {
    [v6 unregisterChangeObserver:self];
  }
}

- (HMDPhotoLibraryDelegate)delegate
{
  id v3 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDPhotoLibraryDelegate *)WeakRetained;
}

- (NSSet)persons
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HMDPhotoLibrary *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDPhotoLibrary *)self suggestedPersonsFetchResult];
  v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    id v7 = [v4 objects];
    id v8 = [v6 setWithArray:v7];

    v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_53518);
  }
  else
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    unint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@suggestedPersonsFetchResult is nil, returning nil", (uint8_t *)&v15, 0xCu);
    }
    v9 = 0;
  }

  return (NSSet *)v9;
}

uint64_t __26__HMDPhotoLibrary_persons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 createPhotoLibraryPerson];
}

- (HMDPhotoLibrary)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPhotoLibrary;
  id v6 = [(HMDPhotoLibrary *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workQueue, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_53529 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_53529, &__block_literal_global_252);
  }
  v2 = (void *)logCategory__hmf_once_v9_53530;
  return v2;
}

void __30__HMDPhotoLibrary_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_53530;
  logCategory__hmf_once_v9_53530 = v0;
}

+ (id)_phPersonWithUUID:(id)a3 fromSuggestedPersonsFetchResult:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objects];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__HMDPhotoLibrary__phPersonWithUUID_fromSuggestedPersonsFetchResult___block_invoke;
  v10[3] = &unk_264A1AB30;
  id v11 = v5;
  id v7 = v5;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __69__HMDPhotoLibrary__phPersonWithUUID_fromSuggestedPersonsFetchResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) UUIDString];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

@end