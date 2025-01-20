@interface HMDCompositeSettingsLegacyDatabaseAdapter
- (Class)modelClass;
- (HMDCompositeSettingsDatabaseAdapterDelegate)delegate;
- (HMDCompositeSettingsLegacyDatabaseAdapter)initWithZoneManager:(id)a3 modelClass:(Class)a4;
- (HMDCompositeSettingsZoneManager)zoneManager;
- (OS_dispatch_queue)queue;
- (id)emptyModelWithID:(id)a3 parentModelID:(id)a4 modelClass:(Class)a5;
- (id)fetchModelWithID:(id)a3;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)rawDatabase;
- (void)addModel:(id)a3 withOptionsLabel:(id)a4 completion:(id)a5;
- (void)startObservingModelWithID:(id)a3;
- (void)startWithDelegate:(id)a3;
- (void)stopObservingModelWithID:(id)a3;
@end

@implementation HMDCompositeSettingsLegacyDatabaseAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_destroyWeak((id *)&self->_zoneManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_rawDatabase);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (HMDCompositeSettingsZoneManager)zoneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoneManager);
  return (HMDCompositeSettingsZoneManager *)WeakRetained;
}

- (HMDCompositeSettingsDatabaseAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCompositeSettingsDatabaseAdapterDelegate *)WeakRetained;
}

- (id)rawDatabase
{
  id WeakRetained = objc_loadWeakRetained(&self->_rawDatabase);
  return WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 model];
  if ([v8 conformsToProtocol:&unk_26E5338B8]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self queue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelDeletion___block_invoke;
    v18[3] = &unk_264A2F820;
    v18[4] = self;
    id v19 = v10;
    dispatch_async(v11, v18);
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [v7 model];
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid model deletion object, ignoring %@", buf, 0x16u);
    }
  }

  return 0;
}

void __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 database:*(void *)(a1 + 32) didProcessDeletionForModel:*(void *)(a1 + 40)];
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 model];
  if ([v8 conformsToProtocol:&unk_26E5338B8]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self queue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __77__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelUpdate___block_invoke;
    v18[3] = &unk_264A2F820;
    v18[4] = self;
    id v19 = v10;
    dispatch_async(v11, v18);
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [v7 model];
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid model update object, ignoring %@", buf, 0x16u);
    }
  }

  return 0;
}

void __77__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 database:*(void *)(a1 + 32) didProcessUpdateForModel:*(void *)(a1 + 40)];
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 model];
  if ([v8 conformsToProtocol:&unk_26E5338B8]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self queue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelCreation___block_invoke;
    v18[3] = &unk_264A2F820;
    v18[4] = self;
    id v19 = v10;
    dispatch_async(v11, v18);
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [v7 model];
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid model creation object, ignoring %@", buf, 0x16u);
    }
  }

  return 0;
}

void __79__HMDCompositeSettingsLegacyDatabaseAdapter_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 database:*(void *)(a1 + 32) didProcessCreationForModel:*(void *)(a1 + 40)];
}

- (id)emptyModelWithID:(id)a3 parentModelID:(id)a4 modelClass:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[[a5 alloc] initWithModelID:v7 parentModelID:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    _HMFPreconditionFailure();
LABEL_13:
    v18 = (HMDCompositeSettingsLegacyDatabaseAdapter *)_HMFPreconditionFailure();
    [(HMDCompositeSettingsLegacyDatabaseAdapter *)v18 addModel:v20 withOptionsLabel:v21 completion:v22];
    return result;
  }
  id v12 = v11;
  int v13 = [v12 conformsToProtocol:&unk_26E5338B8];
  char v14 = v13;
  if (v13) {
    v15 = v12;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }

  return v12;
}

- (void)addModel:(id)a3 withOptionsLabel:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self zoneManager];
  id v12 = v11;
  if (v11)
  {
    int v13 = [v11 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke;
    block[3] = &unk_264A2DDC0;
    id v19 = v9;
    id v20 = v12;
    id v21 = v8;
    id v22 = self;
    id v23 = v10;
    dispatch_async(v13, block);
  }
  else
  {
    char v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while adding model", buf, 0xCu);
    }
  }
}

void __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F49318] optionsWithLabel:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) localZone];
  v4 = (void *)MEMORY[0x263EFFA08];
  v12[0] = *(void *)(a1 + 48);
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v6 = [v4 setWithArray:v5];
  id v7 = [v3 addModels:v6 options:v2];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_2;
  v10[3] = &unk_264A2A558;
  id v8 = *(void **)(a1 + 64);
  v10[4] = *(void *)(a1 + 56);
  id v11 = v8;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

void __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_3;
  v8[3] = &unk_264A2F870;
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

uint64_t __82__HMDCompositeSettingsLegacyDatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)fetchModelWithID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self zoneManager];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 localZone];
    id v8 = objc_msgSend(v7, "fetchModelWithModelID:ofType:error:", v4, -[HMDCompositeSettingsLegacyDatabaseAdapter modelClass](self, "modelClass"), 0);
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while fetching model", (uint8_t *)&v14, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)stopObservingModelWithID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self zoneManager];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__HMDCompositeSettingsLegacyDatabaseAdapter_stopObservingModelWithID___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v13 = v6;
    int v14 = self;
    id v15 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while stopping observation", buf, 0xCu);
    }
  }
}

void __70__HMDCompositeSettingsLegacyDatabaseAdapter_stopObservingModelWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localZone];
  [v2 removeObserver:*(void *)(a1 + 40) forModelWithID:*(void *)(a1 + 48)];
}

- (void)startObservingModelWithID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self zoneManager];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 workQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __71__HMDCompositeSettingsLegacyDatabaseAdapter_startObservingModelWithID___block_invoke;
    v12[3] = &unk_264A2F820;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v15 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil zone manager while starting observation", buf, 0xCu);
    }
  }
}

void __71__HMDCompositeSettingsLegacyDatabaseAdapter_startObservingModelWithID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) zoneManager];
  id v2 = [v3 localZone];
  [v2 addObserver:*(void *)(a1 + 32) forModelWithID:*(void *)(a1 + 40)];
}

- (void)startWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting legacy database adapter with delegate %@", buf, 0x16u);
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  id v7 = [*(id *)(a1 + 32) zoneManager];
  objc_initWeak((id *)buf, v7);
  id v8 = [v7 configurationFuture];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_8;
  v12[3] = &unk_264A2A530;
  objc_copyWeak(&v13, (id *)buf);
  v12[4] = *(void *)(a1 + 32);
  id v9 = [v8 addSuccessBlock:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_3;
  v11[3] = &unk_264A2F3E8;
  v11[4] = *(void *)(a1 + 32);
  id v10 = (id)[v9 addFailureBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_2;
  block[3] = &unk_264A2F7F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 database:*(void *)(a1 + 32) didConfigureWithError:v4];
}

void __63__HMDCompositeSettingsLegacyDatabaseAdapter_startWithDelegate___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 database:*(void *)(a1 + 32) didConfigureWithError:0];
}

- (HMDCompositeSettingsLegacyDatabaseAdapter)initWithZoneManager:(id)a3 modelClass:(Class)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCompositeSettingsLegacyDatabaseAdapter;
  id v7 = [(HMDCompositeSettingsLegacyDatabaseAdapter *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_zoneManager, v6);
    objc_storeStrong((id *)&v8->_modelClass, a4);
    uint64_t v9 = [v6 workQueue];
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak(&v8->_rawDatabase, v6);
  }

  return v8;
}

@end