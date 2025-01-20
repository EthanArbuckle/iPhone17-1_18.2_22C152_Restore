@interface HMDAccessorySettingsBackingStoreTransactionReceiver
- (HMDAccessorySettingsBackingStoreTransactionReceiver)initWithDelegate:(id)a3;
- (HMDAccessorySettingsBackingStoreTransactionReceiverDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDAccessorySettingsBackingStoreTransactionReceiver

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMDAccessorySettingsBackingStoreTransactionReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessorySettingsBackingStoreTransactionReceiverDelegate *)WeakRetained;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAccessorySettingsBackingStoreTransactionReceiver *)self delegate];
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke;
    v26[3] = &unk_264A2E210;
    v26[4] = self;
    id v27 = v11;
    id v28 = v7;
    id v12 = v11;
    [v8 handleRemovedSettingModel:v12 completion:v26];

    v13 = v27;
  }
  else
  {
    id v14 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_7;
      v23[3] = &unk_264A2E210;
      v23[4] = self;
      id v24 = v16;
      id v25 = v7;
      id v12 = v16;
      [v8 handleRemovedGroupModel:v12 completion:v23];

      v13 = v24;
    }
    else
    {
      id v17 = v14;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;

      if (!v19)
      {
        id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v7 respondWithError:v12];
        goto LABEL_17;
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_8;
      v20[3] = &unk_264A2E210;
      v20[4] = self;
      id v21 = v19;
      id v22 = v7;
      id v12 = v19;
      [v8 handleRemovedSettingConstraintModel:v12 completion:v20];

      v13 = v21;
    }
  }

LABEL_17:
}

void __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ removing a setting %@.", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v3];
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) transactionResult];
    [v9 markChanged];

    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

void __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ removing a group %@.", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v3];
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) transactionResult];
    [v9 markChanged];

    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

void __88__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectRemoved_message___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ removing the constraint %@.", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v3];
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) transactionResult];
    [v9 markChanged];

    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HMDAccessorySettingsBackingStoreTransactionReceiver *)self delegate];
  id v10 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke;
    v27[3] = &unk_264A2E210;
    v27[4] = self;
    id v28 = v12;
    id v29 = v8;
    id v13 = v12;
    [v9 handleUpdatedGroupModel:v13 completion:v27];

    __int16 v14 = v28;
  }
  else
  {
    id v15 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_2;
      v24[3] = &unk_264A1B1A8;
      v24[4] = self;
      id v25 = v17;
      id v26 = v8;
      id v13 = v17;
      [v9 handleUpdatedSettingModel:v13 completion:v24];

      __int16 v14 = v25;
    }
    else
    {
      id v18 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }
      id v20 = v19;

      if (!v20)
      {
        id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v8 respondWithError:v13];
        goto LABEL_17;
      }
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_5;
      v21[3] = &unk_264A2E210;
      v21[4] = self;
      id v22 = v20;
      id v23 = v8;
      id v13 = v20;
      [v9 handleUpdatedSettingConstraintModel:v13 completion:v21];

      __int16 v14 = v22;
    }
  }

LABEL_17:
}

void __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ adding a group %@.", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v3];
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) transactionResult];
    [v9 markChanged];

    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

void __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ adding a setting %@.", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v7];
  }
  else
  {
    if (a2)
    {
      __int16 v14 = [*(id *)(a1 + 48) transactionResult];
      [v14 markChanged];
    }
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

void __98__HMDAccessorySettingsBackingStoreTransactionReceiver_transactionObjectUpdated_newValues_message___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@There was an error %@ adding a constraint %@.", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v3];
  }
  else
  {
    id v9 = [*(id *)(a1 + 48) transactionResult];
    [v9 markChanged];

    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (HMDAccessorySettingsBackingStoreTransactionReceiver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessorySettingsBackingStoreTransactionReceiver;
  id v5 = [(HMDAccessorySettingsBackingStoreTransactionReceiver *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

@end