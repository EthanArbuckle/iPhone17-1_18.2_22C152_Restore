@interface HMDMediaDestinationControllerBackingStoreHandler
+ (id)backingStoreObjectForData:(id)a3;
+ (id)logCategory;
- (HMDMediaDestinationControllerBackingStoreHandler)initWithData:(id)a3 backingStore:(id)a4 metricsEventDispatcher:(id)a5 delegate:(id)a6;
- (HMDMediaDestinationControllerBackingStoreHandlerDelegate)delegate;
- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher;
- (HMMediaDestinationControllerData)data;
- (id)logIdentifier;
- (void)mergeData:(id)a3;
- (void)notifyDidUpdateAvailableDestinationIdentifiers:(id)a3;
- (void)notifyDidUpdateDestinationIdentifier:(id)a3;
- (void)removeControllerWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetricsEventDispatcher:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)transactionObjectUpdatedAvailableDestinationIdentifiers:(id)a3 message:(id)a4;
- (void)transactionObjectUpdatedDestinationIdentifier:(id)a3 message:(id)a4;
- (void)transactionObjectUpdatedSupportedOptions:(unint64_t)a3 message:(id)a4;
- (void)updateAvailableDestinationIdentifiers:(id)a3;
- (void)updateAvailableDestinationIdentifiers:(id)a3 completion:(id)a4;
- (void)updateDestinationIdentifier:(id)a3;
- (void)updateDestinationIdentifier:(id)a3 completion:(id)a4;
- (void)updateSupportedOptions:(unint64_t)a3;
- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4;
@end

@implementation HMDMediaDestinationControllerBackingStoreHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setMetricsEventDispatcher:(id)a3
{
}

- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDMediaDestinationControllerMetricsEventDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaDestinationControllerBackingStoreHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaDestinationControllerBackingStoreHandlerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDBackingStoreHandler *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
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
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove unknown child with model object: %@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:14];
  [v7 respondWithError:v12];
}

- (void)transactionObjectUpdatedSupportedOptions:(unint64_t)a3 message:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HMDMediaDestinationControllerBackingStoreHandler *)self data];
  uint64_t v8 = [v7 supportedOptions];

  if (v8 != a3)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = HMMediaDestinationControllerSupportOptionsAsString();
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Transaction updated supported options: %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMDMediaDestinationControllerBackingStoreHandler *)v10 updateSupportedOptions:a3];
    v14 = [v6 transactionResult];
    [v14 markChanged];
  }
}

- (void)transactionObjectUpdatedAvailableDestinationIdentifiers:(id)a3 message:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDMediaDestinationControllerBackingStoreHandler *)self data];
  v9 = [v8 availableDestinationIdentifiers];

  v10 = [MEMORY[0x263EFFA08] setWithArray:v9];
  v11 = [MEMORY[0x263EFFA08] setWithArray:v6];
  char v12 = [v10 isEqualToSet:v11];

  if ((v12 & 1) == 0)
  {
    int v13 = (void *)MEMORY[0x230FBD990]([(HMDMediaDestinationControllerBackingStoreHandler *)self updateAvailableDestinationIdentifiers:v6]);
    v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v16;
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Transaction updated available destination identifiers: %@ to identifiers: %@", (uint8_t *)&v19, 0x20u);
    }
    __int16 v17 = [v7 transactionResult];
    [v17 markChanged];

    v18 = [v7 transactionResult];
    [v18 markSaveToAssistant];

    [(HMDMediaDestinationControllerBackingStoreHandler *)v14 notifyDidUpdateAvailableDestinationIdentifiers:v6];
  }
}

- (void)transactionObjectUpdatedDestinationIdentifier:(id)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDMediaDestinationControllerBackingStoreHandler *)self data];
  v9 = [v8 destinationIdentifier];

  if ((HMFEqualObjects() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x230FBD990]([(HMDMediaDestinationControllerBackingStoreHandler *)self updateDestinationIdentifier:v6]);
    v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      int v17 = 138543874;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v9;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Transaction updated destination identifier: %@ to destination identifier: %@", (uint8_t *)&v17, 0x20u);
    }
    v14 = [v7 transactionResult];
    [v14 markChanged];

    int v15 = [v7 transactionResult];
    [v15 markSaveToAssistant];

    id v16 = [(HMDMediaDestinationControllerBackingStoreHandler *)v11 metricsEventDispatcher];
    [v16 submitTransactionUpdatedDestinationEventWithDestinationIdentifier:v6 existingDestinationIdentifier:v9];

    [(HMDMediaDestinationControllerBackingStoreHandler *)v11 notifyDidUpdateDestinationIdentifier:v6];
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  char v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v51 = 138543618;
    v52 = v14;
    __int16 v53 = 2112;
    id v54 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating media destination controller using transaction object: %@", (uint8_t *)&v51, 0x16u);
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
      id v22 = [v21 uuid];
      uint64_t v23 = [(HMDBackingStoreHandler *)v12 identifier];
      char v24 = [v22 isEqual:v23];

      if (v24)
      {
        uint64_t v25 = [v8 objectChangeType];
        if (v25 == 1)
        {
          v26 = (void *)MEMORY[0x230FBD990]();
          v27 = v12;
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = HMFGetLogIdentifier();
            int v51 = 138543362;
            v52 = v29;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly processing destination controller add after one already exists", (uint8_t *)&v51, 0xCu);
          }
        }
        v30 = [v21 setProperties];
        if ([v30 containsObject:@"destinationModelIdentifier"])
        {
          v31 = [v21 destinationModelIdentifier];
          [(HMDMediaDestinationControllerBackingStoreHandler *)v12 transactionObjectUpdatedDestinationIdentifier:v31 message:v10];
        }
        if ([v30 containsObject:@"availableDestinationModelIdentifierStrings"])
        {
          v32 = [v21 availableDestinationModelIdentifiers];
          [(HMDMediaDestinationControllerBackingStoreHandler *)v12 transactionObjectUpdatedAvailableDestinationIdentifiers:v32 message:v10];
        }
        if ([v30 containsObject:@"supportedOptions"])
        {
          v33 = [v21 supportedOptions];
          -[HMDMediaDestinationControllerBackingStoreHandler transactionObjectUpdatedSupportedOptions:message:](v12, "transactionObjectUpdatedSupportedOptions:message:", [v33 unsignedIntegerValue], v10);
        }
        if (v25 == 1)
        {
          v34 = [(HMDMediaDestinationControllerBackingStoreHandler *)v12 delegate];
          v35 = (void *)MEMORY[0x230FBD990]();
          v36 = v12;
          v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v38 = HMFGetLogIdentifier();
            int v51 = 138543874;
            v52 = v38;
            __int16 v53 = 2112;
            id v54 = v21;
            __int16 v55 = 2112;
            v56 = v34;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Notifying of unexpected model add: %@ delegate: %@", (uint8_t *)&v51, 0x20u);
          }
          [v34 mediaDestinationControllerBackingStoreHandlerDidProcessUnexpectedModelAdd:v36];
        }
        [v10 respondWithSuccess];
        goto LABEL_35;
      }
      v46 = (void *)MEMORY[0x230FBD990]();
      v47 = v12;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = HMFGetLogIdentifier();
        v50 = [v21 uuid];
        int v51 = 138543618;
        v52 = v49;
        __int16 v53 = 2112;
        id v54 = v50;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Received unknown media destination controller model with identifier: %@", (uint8_t *)&v51, 0x16u);
      }
      v30 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      [v10 respondWithError:v30];
      v43 = [(HMDMediaDestinationControllerBackingStoreHandler *)v47 metricsEventDispatcher];
      v44 = v43;
      uint64_t v45 = 1;
    }
    else
    {
      v39 = (void *)MEMORY[0x230FBD990]();
      v40 = v12;
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        int v51 = 138543618;
        v52 = v42;
        __int16 v53 = 2112;
        id v54 = v8;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media destination controller model from new model object: %@", (uint8_t *)&v51, 0x16u);
      }
      v30 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
      [v10 respondWithError:v30];
      v43 = [(HMDMediaDestinationControllerBackingStoreHandler *)v40 metricsEventDispatcher];
      v44 = v43;
      uint64_t v45 = 7;
    }
    [v43 submitFailureEventWithEventErrorCode:v45 error:v30];

LABEL_35:
    goto LABEL_36;
  }
  int v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = v12;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    int v51 = 138543362;
    v52 = v18;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping due to Home Theater QFA enabled", (uint8_t *)&v51, 0xCu);
  }
LABEL_36:
}

- (void)notifyDidUpdateAvailableDestinationIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDMediaDestinationControllerBackingStoreHandler *)self delegate];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543874;
    v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    int v15 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated available destination identifiers: %@ delegate: %@", (uint8_t *)&v10, 0x20u);
  }
  [v5 mediaDestinationControllerBackingStoreHandler:v7 didUpdateAvailableDestinationIdentifiers:v4];
}

- (void)notifyDidUpdateDestinationIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDMediaDestinationControllerBackingStoreHandler *)self delegate];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543874;
    v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    int v15 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated destination identifier: %@ delegate: %@", (uint8_t *)&v10, 0x20u);
  }
  [v5 mediaDestinationControllerBackingStoreHandler:v7 didUpdateDestinationIdentifier:v4];
}

- (void)updateSupportedOptions:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMMutableMediaDestinationControllerData *)self->_data setSupportedOptions:a3];
  os_unfair_lock_unlock(p_lock);
}

- (void)updateAvailableDestinationIdentifiers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMMutableMediaDestinationControllerData *)self->_data setAvailableDestinationIdentifiers:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateDestinationIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMMutableMediaDestinationControllerData *)self->_data setDestinationIdentifier:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (HMMediaDestinationControllerData)data
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(HMMutableMediaDestinationControllerData *)self->_data copy];
  os_unfair_lock_unlock(p_lock);
  return (HMMediaDestinationControllerData *)v4;
}

- (void)mergeData:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if ([(HMMutableMediaDestinationControllerData *)self->_data isEqual:v4])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v5 = (HMMutableMediaDestinationControllerData *)[v4 mutableCopy];
    data = self->_data;
    self->_data = v5;

    os_unfair_lock_unlock(&self->_lock);
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      __int16 v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Merged data: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)removeControllerWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing destination controller", buf, 0xCu);
  }
  id v9 = [HMDMediaDestinationControllerModel alloc];
  int v10 = [(HMDMediaDestinationControllerBackingStoreHandler *)v6 data];
  int v11 = [(HMDMediaDestinationControllerModel *)v9 initWithData:v10 changeType:3];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__HMDMediaDestinationControllerBackingStoreHandler_removeControllerWithCompletion___block_invoke;
  v13[3] = &unk_264A2EDE0;
  v13[4] = v6;
  id v14 = v4;
  id v12 = v4;
  [(HMDBackingStoreHandler *)v6 runTransactionWithModel:v11 reason:@"MediaDestinationControllerRemoveControllerWithCompletion" completion:v13];
}

void __83__HMDMediaDestinationControllerBackingStoreHandler_removeControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run remove destination controller transaction completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Run remove destination controller transaction completed", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateAvailableDestinationIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to available destination identifiers: %@", buf, 0x16u);
  }
  __int16 v12 = [HMDMediaDestinationControllerModel alloc];
  id v13 = [(HMDMediaDestinationControllerBackingStoreHandler *)v9 data];
  uint64_t v14 = [(HMDMediaDestinationControllerModel *)v12 initWithData:v13 changeType:2];

  [(HMDMediaDestinationControllerModel *)v14 setAvailableDestinationModelIdentifiers:v6];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __101__HMDMediaDestinationControllerBackingStoreHandler_updateAvailableDestinationIdentifiers_completion___block_invoke;
  v16[3] = &unk_264A2EDE0;
  v16[4] = v9;
  id v17 = v7;
  id v15 = v7;
  [(HMDBackingStoreHandler *)v9 runTransactionWithModel:v14 reason:@"UpdateAvailableDestinationIdentifiers" completion:v16];
}

void __101__HMDMediaDestinationControllerBackingStoreHandler_updateAvailableDestinationIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run update available destination identifiers transaction completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Run update available destination identifiers transaction completed", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = HMMediaDestinationControllerSupportOptionsAsString();
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating to supported options: %@", buf, 0x16u);
  }
  __int16 v12 = [HMDMediaDestinationControllerModel alloc];
  id v13 = [(HMDMediaDestinationControllerBackingStoreHandler *)v8 data];
  uint64_t v14 = [(HMDMediaDestinationControllerModel *)v12 initWithData:v13 changeType:2];

  id v15 = [NSNumber numberWithUnsignedInteger:a3];
  [(HMDMediaDestinationControllerModel *)v14 setSupportedOptions:v15];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__HMDMediaDestinationControllerBackingStoreHandler_updateSupportedOptions_completion___block_invoke;
  v17[3] = &unk_264A2EDE0;
  v17[4] = v8;
  id v18 = v6;
  id v16 = v6;
  [(HMDBackingStoreHandler *)v8 runTransactionWithModel:v14 reason:@"UpdateSupportedOptions" completion:v17];
}

void __86__HMDMediaDestinationControllerBackingStoreHandler_updateSupportedOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run update supported options transaction completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Run update supported options transaction completed", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateDestinationIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating to destination identifier: %@", buf, 0x16u);
  }
  __int16 v12 = [HMDMediaDestinationControllerModel alloc];
  id v13 = [(HMDMediaDestinationControllerBackingStoreHandler *)v9 data];
  uint64_t v14 = [(HMDMediaDestinationControllerModel *)v12 initWithData:v13 changeType:2];

  [(HMDMediaDestinationControllerModel *)v14 setDestinationModelIdentifier:v6];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__HMDMediaDestinationControllerBackingStoreHandler_updateDestinationIdentifier_completion___block_invoke;
  v16[3] = &unk_264A2EDE0;
  v16[4] = v9;
  id v17 = v7;
  id v15 = v7;
  [(HMDBackingStoreHandler *)v9 runTransactionWithModel:v14 reason:@"UpdateDestinationIdentifier" completion:v16];
}

void __91__HMDMediaDestinationControllerBackingStoreHandler_updateDestinationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Run update destination identifier transaction completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Run update destination identifier transaction completed", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HMDMediaDestinationControllerBackingStoreHandler)initWithData:(id)a3 backingStore:(id)a4 metricsEventDispatcher:(id)a5 delegate:(id)a6
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
    __int16 v20 = (void *)_HMFPreconditionFailure();
    return (HMDMediaDestinationControllerBackingStoreHandler *)+[HMDMediaDestinationControllerBackingStoreHandler logCategory];
  }
  uint64_t v14 = v13;
  id v15 = [v10 identifier];
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaDestinationControllerBackingStoreHandler;
  id v16 = [(HMDBackingStoreHandler *)&v22 initWithIdentifier:v15 backingStore:v11];

  if (v16)
  {
    uint64_t v17 = [v10 mutableCopy];
    data = v16->_data;
    v16->_data = (HMMutableMediaDestinationControllerData *)v17;

    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_metricsEventDispatcher, a5);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1) {
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_5510);
  }
  v2 = (void *)logCategory__hmf_once_v32;
  return v2;
}

void __63__HMDMediaDestinationControllerBackingStoreHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v32;
  logCategory__hmf_once_v32 = v0;
}

+ (id)backingStoreObjectForData:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDMediaDestinationControllerModel alloc] initWithData:v3 changeType:0];
  id v5 = [v3 availableDestinationIdentifiers];
  [(HMDMediaDestinationControllerModel *)v4 setAvailableDestinationModelIdentifiers:v5];

  id v6 = [v3 destinationIdentifier];

  [(HMDMediaDestinationControllerModel *)v4 setDestinationModelIdentifier:v6];
  return v4;
}

@end