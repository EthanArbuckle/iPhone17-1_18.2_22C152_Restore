@interface HMDBackingStoreHandler
+ (id)logCategory;
- (HMDBackingStore)backingStore;
- (HMDBackingStoreHandler)initWithIdentifier:(id)a3 backingStore:(id)a4;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)backingStoreObjectsForVersion:(int64_t)a3;
- (id)logIdentifier;
- (void)runTransactionWithModel:(id)a3 options:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)runTransactionWithModel:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)runTransactionWithModels:(id)a3 options:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)runTransactionWithModels:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDBackingStoreHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDBackingStoreHandler *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDBackingStoreHandler *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to process removed object: %@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
  [v7 respondWithError:v12];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to process udated changes for object: %@", (uint8_t *)&v16, 0x16u);
  }
  __int16 v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
  [v10 respondWithError:v15];
}

- (id)backingStoreObjectsForVersion:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x230FBD990](self, a2, a3);
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive backinstore objects for shared user", (uint8_t *)&v9, 0xCu);
  }
  return (id)MEMORY[0x263EFFA68];
}

- (void)runTransactionWithModels:(id)a3 options:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x230FBD990]();
  __int16 v15 = self;
  int v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v38 = v17;
    __int16 v39 = 2112;
    id v40 = v10;
    __int16 v41 = 2112;
    id v42 = v11;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Running transaction with models: %@ options: %@", buf, 0x20u);
  }
  if (v13)
  {
    __int16 v18 = [(HMDBackingStoreHandler *)v15 backingStore];
    id v29 = v12;
    id v19 = [v18 transaction:v12 options:v11];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v20 = v10;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          [v19 add:*(void *)(*((void *)&v32 + 1) + 8 * v24++)];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v22);
    }

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __77__HMDBackingStoreHandler_runTransactionWithModels_options_reason_completion___block_invoke;
    v30[3] = &unk_264A2EDE0;
    v30[4] = v15;
    id v31 = v13;
    [v19 run:v30];

    id v12 = v29;
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v15;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to run transaction due to no completion", buf, 0xCu);
    }
  }
}

void __77__HMDBackingStoreHandler_runTransactionWithModels_options_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Transaction completed with error: %@", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    int v9 = (void *)MEMORY[0x230FBD990](v8);
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Transaction completed", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)runTransactionWithModel:(id)a3 options:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v10 = (void *)MEMORY[0x263EFF8C0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  __int16 v15 = [v10 arrayWithObjects:&v16 count:1];

  -[HMDBackingStoreHandler runTransactionWithModels:options:reason:completion:](self, "runTransactionWithModels:options:reason:completion:", v15, v13, v12, v11, v16, v17);
}

- (void)runTransactionWithModels:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  [(HMDBackingStoreHandler *)self runTransactionWithModels:v10 options:v11 reason:v9 completion:v8];
}

- (void)runTransactionWithModel:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v13 count:1];

  -[HMDBackingStoreHandler runTransactionWithModels:reason:completion:](self, "runTransactionWithModels:reason:completion:", v12, v10, v9, v13, v14);
}

- (HMDBackingStoreHandler)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreHandler;
  id v9 = [(HMDBackingStoreHandler *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_backingStore, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_87359 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_87359, &__block_literal_global_87360);
  }
  v2 = (void *)logCategory__hmf_once_v8_87361;
  return v2;
}

void __37__HMDBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_87361;
  logCategory__hmf_once_v8_87361 = v0;
}

@end