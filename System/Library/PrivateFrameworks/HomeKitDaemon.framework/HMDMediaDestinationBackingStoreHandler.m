@interface HMDMediaDestinationBackingStoreHandler
+ (id)backingStoreObjectForMediaDestination:(id)a3;
+ (id)logCategory;
- (HMDMediaDestinationBackingStoreHandler)initWithDestination:(id)a3 backingStore:(id)a4 metricsDispatcher:(id)a5 delegate:(id)a6;
- (HMDMediaDestinationBackingStoreHandlerDelegate)delegate;
- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher;
- (HMMediaDestination)destination;
- (void)mergeDestination:(id)a3;
- (void)setAudioGroupIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateAudioGroupIdentifier:(id)a3 completion:(id)a4;
- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4;
@end

@implementation HMDMediaDestinationBackingStoreHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (HMDMediaDestinationManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDMediaDestinationManagerMetricsDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationBackingStoreHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationBackingStoreHandlerDelegate *)WeakRetained;
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
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove unknown transaction object: %@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
  [v7 respondWithError:v12];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v48 = v14;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction object updated with new object: %@", buf, 0x16u);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ![(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    id v19 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      v22 = [(HMDMediaDestinationBackingStoreHandler *)v12 destination];
      v23 = v22;
      if (v22
        && ([v22 uniqueIdentifier],
            v24 = objc_claimAutoreleasedReturnValue(),
            [v21 uuid],
            v25 = objc_claimAutoreleasedReturnValue(),
            char v26 = objc_msgSend(v24, "hmf_isEqualToUUID:", v25),
            v25,
            v24,
            (v26 & 1) == 0))
      {
        v42 = (void *)MEMORY[0x230FBD990]();
        v43 = v12;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v48 = v45;
          __int16 v49 = 2112;
          id v50 = v21;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio destination with unrecongnized model: %@", buf, 0x16u);
        }
      }
      else
      {
        v27 = [v21 setProperties];
        if ([v27 containsObject:@"supportedOptions"])
        {
          v28 = [v21 supportedOptions];
          -[HMDMediaDestinationBackingStoreHandler setSupportedOptions:](v12, "setSupportedOptions:", [v28 unsignedIntegerValue]);
        }
        if ([v27 containsObject:@"audioGroupIdentifier"])
        {
          v29 = [v21 audioGroupIdentifier];
          [(HMDMediaDestinationBackingStoreHandler *)v12 setAudioGroupIdentifier:v29];
        }
        v30 = [(HMDMediaDestinationBackingStoreHandler *)v12 destination];
        if ((HMFEqualObjects() & 1) == 0)
        {
          v31 = (void *)MEMORY[0x230FBD990]();
          v32 = v12;
          v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = v46 = v31;
            *(_DWORD *)buf = 138543874;
            v48 = v34;
            __int16 v49 = 2112;
            id v50 = v23;
            __int16 v51 = 2112;
            v52 = v30;
            _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Updated audio destination: %@ new audio destination: %@", buf, 0x20u);

            v31 = v46;
          }

          v35 = [v10 transactionResult];
          [v35 markChanged];

          v36 = [v10 transactionResult];
          [v36 markSaveToAssistant];

          v37 = [(HMDMediaDestinationBackingStoreHandler *)v32 delegate];
          [v37 mediaDestinationBackingStoreHandler:v32 didUpdateDestination:v30];
        }
        [v10 respondWithSuccess];
      }
    }
    else
    {
      v38 = (void *)MEMORY[0x230FBD990]();
      v39 = v12;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v48 = v41;
        __int16 v49 = 2112;
        id v50 = v19;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to process unknown transaction object: %@", buf, 0x16u);
      }
      v23 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      [v10 respondWithError:v23];
    }
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v12;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping due to Home Theater QFA enabled", buf, 0xCu);
    }
  }
}

- (void)setAudioGroupIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMMutableMediaDestination *)self->_destination setAudioGroupIdentifier:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSupportedOptions:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMMutableMediaDestination *)self->_destination setSupportedOptions:a3];
  os_unfair_lock_unlock(p_lock);
}

- (HMMediaDestination)destination
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(HMMutableMediaDestination *)self->_destination copy];
  os_unfair_lock_unlock(p_lock);
  return (HMMediaDestination *)v4;
}

- (void)updateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v28 = 138543618;
    v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to audio group identifier: %@", (uint8_t *)&v28, 0x16u);
  }
  if (v7)
  {
    v12 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    int v13 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
    v14 = [v13 audioGroupIdentifier];
    int v15 = objc_msgSend(v6, "hmf_isEqualToUUID:", v14);

    if (v15)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      uint64_t v17 = v9;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        int v28 = 138543362;
        v29 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Attempting forced push due to audio group identifier already updated", (uint8_t *)&v28, 0xCu);
      }
      uint64_t v20 = +[HMDBackingStoreTransactionOptions defaultOutOfSyncOptions];

      v12 = (void *)v20;
    }
    id v21 = [HMDMediaDestinationModel alloc];
    v22 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
    v23 = [(HMDMediaDestinationModel *)v21 initWithDestination:v22 changeType:2];

    [(HMDMediaDestinationModel *)v23 setAudioGroupIdentifier:v6];
    [(HMDBackingStoreHandler *)v9 runTransactionWithModel:v23 options:v12 reason:@"UpdateAudioGroupIdentifier" completion:v7];
  }
  else
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    v25 = v9;
    char v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      int v28 = 138543362;
      v29 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio group identifier due to no completion", (uint8_t *)&v28, 0xCu);
    }
  }
}

- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  id v7 = HMMediaDestinationSupportOptionsAsString();
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to supported options: %@", buf, 0x16u);
  }
  if (v6)
  {
    v12 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
    if ([v12 supportedOptions] == a3)
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      v14 = v9;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Supported options already updated", buf, 0xCu);
      }
      v6[2](v6, 0);
    }
    else
    {
      id v21 = [NSString stringWithFormat:@"%@:%@", @"UpdateSupportedOptions", v7];
      v22 = [HMDMediaDestinationModel alloc];
      v23 = [(HMDMediaDestinationBackingStoreHandler *)v9 destination];
      v24 = [(HMDMediaDestinationModel *)v22 initWithDestination:v23 changeType:2];

      v25 = [NSNumber numberWithUnsignedInteger:a3];
      [(HMDMediaDestinationModel *)v24 setSupportedOptions:v25];

      [(HMDBackingStoreHandler *)v9 runTransactionWithModel:v24 reason:v21 completion:v6];
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v9;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update supported options due to no completion", buf, 0xCu);
    }
  }
}

- (void)mergeDestination:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if ([(HMMutableMediaDestination *)self->_destination isEqual:v4])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = (HMMutableMediaDestination *)[v4 mutableCopy];
    destination = self->_destination;
    self->_destination = v5;

    os_unfair_lock_unlock(&self->_lock);
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Merged destination: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (HMDMediaDestinationBackingStoreHandler)initWithDestination:(id)a3 backingStore:(id)a4 metricsDispatcher:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    uint64_t v20 = (void *)_HMFPreconditionFailure();
    return (HMDMediaDestinationBackingStoreHandler *)+[HMDMediaDestinationBackingStoreHandler logCategory];
  }
  id v14 = v13;
  uint64_t v15 = [v10 uniqueIdentifier];
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaDestinationBackingStoreHandler;
  id v16 = [(HMDBackingStoreHandler *)&v22 initWithIdentifier:v15 backingStore:v11];

  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v14);
    uint64_t v17 = [v10 mutableCopy];
    destination = v16->_destination;
    v16->_destination = (HMMutableMediaDestination *)v17;

    objc_storeStrong((id *)&v16->_metricsDispatcher, a5);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_56556 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_56556, &__block_literal_global_56557);
  }
  v2 = (void *)logCategory__hmf_once_v19_56558;
  return v2;
}

void __53__HMDMediaDestinationBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v19_56558;
  logCategory__hmf_once_v19_56558 = v0;
}

+ (id)backingStoreObjectForMediaDestination:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDMediaDestinationModel alloc] initWithDestination:v3 changeType:0];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "supportedOptions"));
  [(HMDMediaDestinationModel *)v4 setSupportedOptions:v5];

  id v6 = [v3 audioGroupIdentifier];

  [(HMDMediaDestinationModel *)v4 setAudioGroupIdentifier:v6];
  return v4;
}

@end