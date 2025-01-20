@interface HMDRemoteAccountManager
+ (id)logCategory;
+ (id)sharedManager;
- (BOOL)isCurrentDeviceDataOwnerForDevice:(id)a3;
- (BOOL)isMonitoring;
- (BOOL)shouldAccount:(id)a3 pushbackModel:(id)a4 actions:(id)a5;
- (BOOL)shouldCacheAccount:(id)a3;
- (BOOL)shouldDevice:(id)a3 processModel:(id)a4 actions:(id)a5;
- (BOOL)shouldSyncAccount:(id)a3;
- (BOOL)shouldSyncDevice:(id)a3;
- (HMDAccountRegistry)accountRegistry;
- (HMDBackingStore)backingStore;
- (HMDIDSService)service;
- (HMDRemoteAccountManager)init;
- (HMDRemoteAccountManager)initWithIDSService:(id)a3;
- (NSArray)accounts;
- (NSArray)attributeDescriptions;
- (NSMutableArray)resolveOperations;
- (id)accountForDeviceHandle:(id)a3;
- (id)accountForHandle:(id)a3;
- (id)accountForIdentifier:(id)a3;
- (id)accountForModelIdentifier:(id)a3;
- (id)accountForSenderContext:(id)a3;
- (id)deviceForSenderContext:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__handleSendMessageFailureWithError:(id)a3 destination:(id)a4;
- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4;
- (void)addAccount:(id)a3;
- (void)configureWithAccountRegistry:(id)a3;
- (void)processAccountModel:(id)a3 message:(id)a4;
- (void)processAccountModelRemove:(id)a3 message:(id)a4;
- (void)removeAccount:(id)a3;
- (void)reset;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)setAccounts:(id)a3;
- (void)setBackingStore:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDRemoteAccountManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_resolveOperations, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setBackingStore:(id)a3
{
}

- (HMDBackingStore)backingStore
{
  return self->_backingStore;
}

- (NSMutableArray)resolveOperations
{
  return self->_resolveOperations;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (HMDIDSService)service
{
  return self->_service;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = v17;
  if (!a6)
  {
    v19 = [v17 toID];

    if (v19)
    {
      v20 = [v18 toID];
      [(HMDRemoteAccountManager *)self __handleSendMessageFailureWithError:v16 destination:v20];
    }
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(HMDRemoteAccountManager *)self accounts];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)processAccountModelRemove:(id)a3 message:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uuid];
  unint64_t v9 = [(HMDRemoteAccountManager *)self accountForModelIdentifier:v8];

  if (v9)
  {
    [(HMDRemoteAccountManager *)self removeAccount:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object model received", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)processAccountModel:(id)a3 message:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 uuid];
  v8 = [(HMDRemoteAccountManager *)self accountForModelIdentifier:v7];

  if (v8)
  {
    [v8 transactionObjectUpdated:0 newValues:v10 message:v6];
  }
  else
  {
    unint64_t v9 = [[HMDAccount alloc] initWithObjectModel:v10];
    if (!v9) {
      goto LABEL_6;
    }
    v8 = v9;
    [(HMDRemoteAccountManager *)self addAccount:v9];
  }

LABEL_6:
}

- (BOOL)isCurrentDeviceDataOwnerForDevice:(id)a3
{
  return 0;
}

- (BOOL)shouldDevice:(id)a3 processModel:(id)a4 actions:(id)a5
{
  return 1;
}

- (BOOL)shouldAccount:(id)a3 pushbackModel:(id)a4 actions:(id)a5
{
  return 0;
}

- (BOOL)shouldSyncDevice:(id)a3
{
  v4 = [a3 account];
  LOBYTE(self) = [(HMDRemoteAccountManager *)self shouldSyncAccount:v4];

  return (char)self;
}

- (BOOL)shouldSyncAccount:(id)a3
{
  return [a3 isAuthenticated];
}

- (BOOL)shouldCacheAccount:(id)a3
{
  return [a3 isAuthenticated];
}

- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke;
    block[3] = &unk_264A2EE80;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(queue, block);
  }
}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) isMonitoring];
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting to resolve handle: %@", buf, 0x16u);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    unint64_t v9 = [*(id *)(a1 + 32) resolveOperations];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v10)
    {
LABEL_15:

      goto LABEL_22;
    }
    uint64_t v11 = *(void *)v29;
LABEL_6:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v9);
      }
      v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
      int v14 = [v13 handle];
      if ([v14 isEqual:*(void *)(a1 + 40)])
      {
        char v15 = [v13 isFinished];

        if ((v15 & 1) == 0)
        {
          id v17 = v13;

          if (v17)
          {
            int v18 = 0;
            goto LABEL_23;
          }
LABEL_22:
          id v17 = [[HMDAccountHandleResolveOperation alloc] initWithHandle:*(void *)(a1 + 40)];
          v19 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Accounts.Resolve"];
          [(HMFOperation *)v17 setActivity:v19];
          objc_initWeak((id *)buf, *(id *)(a1 + 32));
          objc_initWeak(&location, v17);
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_38;
          v24[3] = &unk_264A26E10;
          objc_copyWeak(&v25, (id *)buf);
          objc_copyWeak(&v26, &location);
          [(HMDAccountHandleResolveOperation *)v17 setCompletionBlock:v24];
          v20 = [*(id *)(a1 + 32) resolveOperations];
          [v20 addObject:v17];

          objc_destroyWeak(&v26);
          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);

          int v18 = 1;
LABEL_23:
          id v21 = *(void **)(a1 + 48);
          if (v21)
          {
            v22[0] = MEMORY[0x263EF8330];
            v22[1] = 3221225472;
            v22[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_3;
            v22[3] = &unk_264A23B10;
            id v23 = v21;
            [(HMDAccountHandleResolveOperation *)v17 addResolveBlock:v22];
          }
          if (v18) {
            [(HMFOperation *)v17 start];
          }
LABEL_27:

          return;
        }
      }
      else
      {
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_6;
        }
        goto LABEL_15;
      }
    }
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v34 = v16;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot resolve handle before started", buf, 0xCu);
  }
  if (*(void *)(a1 + 48))
  {
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_27;
  }
}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_38(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_2;
    v5[3] = &unk_264A2C148;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5[4] = v3;
    dispatch_async(v4, v5);
    objc_destroyWeak(&v6);
  }
}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = a2;
  uint64_t v5 = a3;
  if (!(v6 | v5))
  {
    uint64_t v5 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v2 = [*(id *)(a1 + 32) resolveOperations];
    [v2 removeObject:WeakRetained];
  }
}

- (void)removeAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if ([(NSMutableSet *)self->_accounts containsObject:v6])
    {
      [(NSMutableSet *)self->_accounts removeObject:v6];
      uint64_t v5 = [v6 manager];
      if (v5 == self) {
        [v6 setManager:0];
      }
      __deleteAccountModel(self, v6);

      os_unfair_recursive_lock_unlock();
      __notifyDelegateAccountRemoved_178100(self, v6);
    }
    else
    {
      os_unfair_recursive_lock_unlock();
    }
    id v4 = v6;
  }
}

- (void)addAccount:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v37 = v4;
    if ([(NSMutableSet *)self->_accounts containsObject:v4])
    {
LABEL_32:
      os_unfair_recursive_lock_unlock();
    }
    else
    {
      if ([v4 isAuthenticated])
      {
        objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableSet count](self->_accounts, "count"));
        obj = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v5 = (void *)[(NSMutableSet *)self->_accounts copy];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v47 != v7) {
                objc_enumerationMutation(v5);
              }
              unint64_t v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              if ([v9 isRelatedToAccount:v37])
              {
                uint64_t v10 = (void *)MEMORY[0x230FBD990]();
                uint64_t v11 = self;
                HMFGetOSLogHandle();
                uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
                {
                  v13 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v55 = v13;
                  __int16 v56 = 2112;
                  id v57 = v9;
                  _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing related account: %@", buf, 0x16u);
                }
                [(NSMutableSet *)self->_accounts removeObject:v9];
                int v14 = [v9 manager];
                BOOL v15 = v14 == v11;

                if (v15) {
                  [v9 setManager:0];
                }
                __deleteAccountModel(v11, v9);
                [(NSMutableSet *)obj addObject:v9];
              }
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v58 count:16];
          }
          while (v6);
        }

        if ([(NSMutableSet *)obj count]) {
          uint64_t v16 = (void *)[(NSMutableSet *)obj copy];
        }
        else {
          uint64_t v16 = 0;
        }
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        obj = self->_accounts;
        uint64_t v16 = (void *)[(NSMutableSet *)obj countByEnumeratingWithState:&v42 objects:v53 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v43;
          while (2)
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v43 != v17) {
                objc_enumerationMutation(obj);
              }
              v19 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
              if (([v19 isAuthenticated] & 1) != 0
                && [v19 isRelatedToAccount:v37])
              {
                v20 = (void *)MEMORY[0x230FBD990]();
                id v21 = self;
                HMFGetOSLogHandle();
                v22 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  id v23 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v55 = v23;
                  __int16 v56 = 2112;
                  id v57 = v37;
                  _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Unable to add account: %@", buf, 0x16u);
                }

                goto LABEL_32;
              }
            }
            uint64_t v16 = (void *)[(NSMutableSet *)obj countByEnumeratingWithState:&v42 objects:v53 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
      }

      [(NSMutableSet *)self->_accounts addObject:v37];
      [v37 setManager:self];
      id v24 = v37;
      id v25 = [(HMDRemoteAccountManager *)self accountRegistry];
      [v25 addAccount:v24 isLocal:0];

      os_unfair_recursive_lock_unlock();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v26 = v16;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v39 != v28) {
              objc_enumerationMutation(v26);
            }
            __notifyDelegateAccountRemoved_178100(self, *(void **)(*((void *)&v38 + 1) + 8 * k));
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }
        while (v27);
      }

      long long v30 = (void *)MEMORY[0x230FBD990]();
      long long v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v55 = v33;
        __int16 v56 = 2112;
        id v57 = v24;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Account added: %@", buf, 0x16u);
      }
      v34 = [MEMORY[0x263F08A00] defaultCenter];
      v50 = @"HMDAccountNotificationKey";
      id v51 = v24;
      __int16 v35 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      [v34 postNotificationName:@"HMDRemoteAccountManagerAddedAccountNotification" object:v31 userInfo:v35];
    }
    id v4 = v37;
  }
}

- (void)setAccounts:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9C0] setWithArray:v4];
    accounts = self->_accounts;
    self->_accounts = v5;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setManager:", self, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(NSMutableSet *)self->_accounts removeAllObjects];
  }
  os_unfair_recursive_lock_unlock();
}

- (id)accountForDeviceHandle:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = self->_accounts;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v17 = v6;
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v9 = [v8 devices];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v9);
              }
              long long v13 = [*(id *)(*((void *)&v19 + 1) + 8 * j) handles];
              char v14 = [v13 containsObject:v4];

              if (v14)
              {
                id v15 = v8;

                goto LABEL_19;
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v15 = 0;
    }
    while (v6);
  }
  else
  {
    id v15 = 0;
  }
LABEL_19:

  os_unfair_recursive_lock_unlock();
  return v15;
}

- (id)accountForModelIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "modelIdentifier", (void)v13);
        char v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)accountForHandle:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "handles", (void)v13);
        char v11 = [v10 containsObject:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)accountForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (NSArray)accounts
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = [(NSMutableSet *)self->_accounts allObjects];
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMDRemoteAccountManager_reset__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __32__HMDRemoteAccountManager_reset__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "accounts", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) removeAccount:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMDRemoteAccountManager_stop__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__HMDRemoteAccountManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isMonitoring])
  {
    char v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setMonitoring:0];
    id v6 = [*(id *)(a1 + 32) service];
    [v6 removeDelegate:*(void *)(a1 + 32)];
  }
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMDRemoteAccountManager_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __32__HMDRemoteAccountManager_start__block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isMonitoring] & 1) == 0)
  {
    char v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v67 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setMonitoring:1];
    id v6 = [*(id *)(a1 + 32) service];
    [v6 addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];

    id v7 = *(id *)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v38 = v7;
      id v9 = v7;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        long long v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v67 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Staring audit", buf, 0xCu);
      }
      long long v46 = [MEMORY[0x263EFF9C0] set];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = [v9 accounts];
      uint64_t v41 = [obj countByEnumeratingWithState:&v56 objects:buf count:16];
      if (v41)
      {
        uint64_t v40 = *(void *)v57;
        id v43 = v9;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v57 != v40) {
              objc_enumerationMutation(obj);
            }
            uint64_t v42 = v12;
            long long v13 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v45 = v13;
            id v44 = [v13 devices];
            uint64_t v14 = [v44 countByEnumeratingWithState:&v52 objects:v65 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v47 = *(void *)v53;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v53 != v47) {
                    objc_enumerationMutation(v44);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  id v19 = v46;
                  uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v64 count:16];
                  if (v20)
                  {
                    uint64_t v21 = v20;
                    uint64_t v22 = *(void *)v49;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v21; ++j)
                      {
                        if (*(void *)v49 != v22) {
                          objc_enumerationMutation(v19);
                        }
                        if ([v17 isRelatedToDevice:*(void *)(*((void *)&v48 + 1) + 8 * j)])
                        {
                          uint64_t v29 = (void *)MEMORY[0x230FBD990]();
                          id v30 = v9;
                          long long v31 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                          {
                            v32 = HMFGetLogIdentifier();
                            v33 = [v17 shortDescription];
                            *(_DWORD *)v60 = 138543618;
                            v61 = v32;
                            __int16 v62 = 2112;
                            v63 = v33;
                            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Found duplicate device: %@", v60, 0x16u);

                            id v9 = v43;
                          }

                          [v45 removeDevice:v17];

                          goto LABEL_31;
                        }
                      }
                      uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v64 count:16];
                      if (v21) {
                        continue;
                      }
                      break;
                    }
                  }

                  long long v24 = (void *)MEMORY[0x230FBD990]();
                  id v25 = v9;
                  long long v26 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v27 = HMFGetLogIdentifier();
                    uint64_t v28 = [v17 shortDescription];
                    *(_DWORD *)v60 = 138543618;
                    v61 = v27;
                    __int16 v62 = 2112;
                    v63 = v28;
                    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Audited device: %@", v60, 0x16u);

                    id v9 = v43;
                  }

                  [v19 addObject:v17];
LABEL_31:
                }
                uint64_t v15 = [v44 countByEnumeratingWithState:&v52 objects:v65 count:16];
              }
              while (v15);
            }

            uint64_t v12 = v42 + 1;
          }
          while (v42 + 1 != v41);
          uint64_t v41 = [obj countByEnumeratingWithState:&v56 objects:buf count:16];
        }
        while (v41);
      }

      v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = v9;
      uint64_t v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        *(_DWORD *)v60 = 138543362;
        v61 = v37;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Finished audit", v60, 0xCu);
      }

      id v7 = v38;
    }
  }
}

- (void)configureWithAccountRegistry:(id)a3
{
  id v4 = (HMDAccountRegistry *)a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_accountRegistry)
  {
LABEL_7:
    _HMFPreconditionFailure();
    __break(1u);
    return;
  }
  self->_accountRegistry = v5;
  id v6 = v5;
  os_unfair_recursive_lock_unlock();
  id v7 = [(HMDAccountRegistry *)v6 fetchAccountsWithLocalFlag:0];

  [(HMDRemoteAccountManager *)self setAccounts:v7];
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDRemoteAccountManager *)self accounts];
  uint64_t v5 = (void *)[v3 initWithName:@"Accounts" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (HMDRemoteAccountManager)initWithIDSService:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDRemoteAccountManager;
  id v6 = [(HMDRemoteAccountManager *)&v17 init];
  if (v6)
  {
    HMDispatchQueueNameString();
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (const char *)[v7 UTF8String];
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    accounts = v6->_accounts;
    v6->_accounts = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x263EFF980] array];
    resolveOperations = v6->_resolveOperations;
    v6->_resolveOperations = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v6->_service, a3);
  }

  return v6;
}

- (HMDRemoteAccountManager)init
{
  char v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_178138 != -1) {
    dispatch_once(&logCategory__hmf_once_t33_178138, &__block_literal_global_178139);
  }
  char v2 = (void *)logCategory__hmf_once_v34_178140;
  return v2;
}

void __38__HMDRemoteAccountManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v34_178140;
  logCategory__hmf_once_v34_178140 = v0;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMDRemoteAccountManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_178145 != -1) {
    dispatch_once(&sharedManager_onceToken_178145, block);
  }
  char v2 = (void *)sharedManager_accountManager_178146;
  return v2;
}

void __40__HMDRemoteAccountManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v2 = [HMDRemoteAccountManager alloc];
  uint64_t v3 = +[HMDIDSServiceManager sharedManager];
  id v4 = [v3 service];
  uint64_t v5 = [(HMDRemoteAccountManager *)v2 initWithIDSService:v4];
  id v6 = (void *)sharedManager_accountManager_178146;
  sharedManager_accountManager_178146 = v5;

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating an HMDRemoteAccountManager", (uint8_t *)&v11, 0xCu);
  }
}

- (id)deviceForSenderContext:(id)a3
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  id v4 = (HMDAccount *)a3;
  if (!v4)
  {
    v134 = 0;
    goto LABEL_99;
  }
  v122 = v4;
  uint64_t v5 = [(HMDAccount *)v4 accountHandle];
  BOOL v6 = v5 == 0;

  id v7 = (void *)MEMORY[0x230FBD990]();
  v124 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      __int16 v150 = 2112;
      v151 = v122;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot update with sender context: %@", buf, 0x16u);
    }
    v134 = 0;
    goto LABEL_98;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    __int16 v150 = 2112;
    v151 = v122;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updating with sender context: %@", buf, 0x16u);
  }
  os_unfair_recursive_lock_lock_with_options();
  int v11 = v124;
  uint64_t v12 = v122;
  v123 = v11;
  if (!v11)
  {
    v130 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  uint64_t v14 = [(HMDAccount *)v12 accountIdentifier];

  if (v14)
  {
    uint64_t v15 = [(HMDAccount *)v13 accountIdentifier];
    v130 = [(HMDRemoteAccountManager *)v123 accountForIdentifier:v15];
  }
  else
  {
    objc_super v17 = [(HMDAccount *)v13 accountHandle];

    if (!v17)
    {
      v130 = 0;
      goto LABEL_16;
    }
    uint64_t v15 = [(HMDAccount *)v13 accountHandle];
    v130 = [(HMDRemoteAccountManager *)v123 accountForHandle:v15];
  }

LABEL_16:
  uint64_t v12 = v13;
LABEL_17:
  v125 = v12;

  if (v130)
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v123;
    HMFGetOSLogHandle();
    uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [(HMDAccount *)v130 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v21;
      __int16 v150 = 2112;
      v151 = v22;
      __int16 v152 = 2112;
      v153 = v125;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Found an existing account, %@, for sender: %@", buf, 0x20u);
    }
    long long v23 = [(HMDAccount *)v130 handles];
    long long v24 = [(HMDAccount *)v125 accountHandle];
    char v25 = [v23 containsObject:v24];

    if ((v25 & 1) == 0)
    {
      long long v26 = [(HMDAccount *)v125 accountHandle];
      uint64_t v27 = v19;
      v130 = v130;
      id v28 = v26;
      uint64_t v29 = v28;
      v131 = v27;
      if (v27 && v28)
      {
        id v30 = (void *)MEMORY[0x230FBD990]();
        v135 = v131;
        long long v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          v33 = [v29 shortDescription];
          v34 = [(HMDAccount *)v130 shortDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v32;
          __int16 v150 = 2112;
          v151 = v33;
          __int16 v152 = 2112;
          v153 = v34;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding handle, %@, to account: %@", buf, 0x20u);
        }
        long long v147 = 0u;
        long long v148 = 0u;
        long long v145 = 0u;
        long long v146 = 0u;
        id v35 = [(HMDRemoteAccountManager *)v135 accounts];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v145 objects:buf count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v146;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v146 != v37) {
                objc_enumerationMutation(v35);
              }
              long long v39 = *(HMDAccount **)(*((void *)&v145 + 1) + 8 * i);
              if (v39 != v130)
              {
                uint64_t v40 = [*(id *)(*((void *)&v145 + 1) + 8 * i) handles];
                int v41 = [v40 containsObject:v29];

                if (v41)
                {
                  uint64_t v42 = [(HMDAccount *)v39 handles];
                  uint64_t v43 = [v42 count];

                  id v44 = (void *)MEMORY[0x230FBD990]();
                  long long v45 = v135;
                  long long v46 = HMFGetOSLogHandle();
                  BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
                  if (v43 == 1)
                  {
                    if (v47)
                    {
                      long long v48 = HMFGetLogIdentifier();
                      *(_DWORD *)v154 = 138543618;
                      *(void *)&v154[4] = v48;
                      *(_WORD *)&v154[12] = 2112;
                      *(void *)&v154[14] = v39;
                      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Removing account: %@", v154, 0x16u);
                    }
                    [(HMDRemoteAccountManager *)v45 removeAccount:v39];
                  }
                  else
                  {
                    if (v47)
                    {
                      long long v49 = HMFGetLogIdentifier();
                      *(_DWORD *)v154 = 138543874;
                      *(void *)&v154[4] = v49;
                      *(_WORD *)&v154[12] = 2112;
                      *(void *)&v154[14] = v29;
                      *(_WORD *)&v154[22] = 2112;
                      *(void *)&v154[24] = v39;
                      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Removing handle, %@, from account: %@", v154, 0x20u);
                    }
                    [(HMDAccount *)v39 removeHandle:v29];
                  }
                }
              }
            }
            uint64_t v36 = [v35 countByEnumeratingWithState:&v145 objects:buf count:16];
          }
          while (v36);
        }

        [(HMDAccount *)v130 addHandle:v29];
      }
    }
  }
  else
  {
    long long v50 = v125;
    long long v51 = v50;
    if (v123)
    {
      long long v52 = (void *)MEMORY[0x263EFF980];
      long long v53 = [(HMDAccount *)v50 deviceHandle];
      *(void *)buf = v53;
      long long v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
      long long v55 = [v52 arrayWithArray:v54];

      long long v56 = [(HMDAccount *)v51 localDeviceHandle];

      if (v56)
      {
        long long v57 = [(HMDAccount *)v51 localDeviceHandle];
        [v55 addObject:v57];
      }
      long long v58 = [HMDDevice alloc];
      long long v59 = [(HMDAccount *)v51 deviceHandle];
      v60 = [v59 identifier];
      v61 = [(HMDAccount *)v51 deviceVersion];
      __int16 v62 = [(HMDDevice *)v58 initWithIdentifier:v60 handles:v55 name:0 productInfo:0 version:v61 capabilities:0];

      v63 = [(HMDAccount *)v51 accountIdentifier];

      v64 = [HMDAccount alloc];
      if (v63)
      {
        v65 = [(HMDAccount *)v51 accountIdentifier];
        v66 = [(HMDAccount *)v51 accountHandle];
        *(void *)&long long v145 = v66;
        v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v145 count:1];
        *(void *)v154 = v62;
        uint64_t v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:1];
        v130 = [(HMDAccount *)v64 initWithIdentifier:v65 handles:v67 devices:v68];
      }
      else
      {
        v65 = [(HMDAccount *)v51 accountHandle];
        v66 = +[HMDAccountIdentifier accountIdentifierForAccountHandle:v65];
        v67 = [(HMDAccount *)v51 accountHandle];
        *(void *)&long long v145 = v67;
        uint64_t v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v145 count:1];
        *(void *)v154 = v62;
        v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:1];
        v130 = [(HMDAccount *)v64 initWithIdentifier:v66 handles:v68 devices:v69];
      }
    }
    else
    {
      v130 = 0;
    }

    v70 = (void *)MEMORY[0x230FBD990]();
    v71 = v123;
    HMFGetOSLogHandle();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      v73 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v73;
      __int16 v150 = 2112;
      v151 = v130;
      _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@Adding account: %@", buf, 0x16u);
    }
    [(HMDRemoteAccountManager *)v71 addAccount:v130];
  }
  v121 = [(HMDAccount *)v125 localDeviceHandle];
  v74 = [(HMDAccount *)v125 deviceHandle];
  v134 = [(HMDAccount *)v130 deviceForHandle:v74];

  if (v134)
  {
    if (v121 && [(HMDAccount *)v134 addHandle:v121])
    {
      v75 = (void *)MEMORY[0x230FBD990]();
      v76 = v123;
      HMFGetOSLogHandle();
      v77 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        v78 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v78;
        __int16 v150 = 2112;
        v151 = v134;
        _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_INFO, "%{public}@Adding local handle to device %@", buf, 0x16u);
      }
    }
    v79 = [(HMDAccount *)v125 deviceVersion];
    if (!v79) {
      goto LABEL_96;
    }
    v80 = [(HMDAccount *)v125 deviceVersion];
    v81 = [(HMDAccount *)v134 version];
    char v82 = HMFEqualObjects();

    if (v82) {
      goto LABEL_96;
    }
    v83 = (void *)MEMORY[0x230FBD990]();
    v84 = v123;
    HMFGetOSLogHandle();
    v85 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v86 = (id)objc_claimAutoreleasedReturnValue();
      v87 = [(HMDAccount *)v125 deviceVersion];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v86;
      __int16 v150 = 2112;
      v151 = v134;
      __int16 v152 = 2112;
      v153 = v87;
      _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with version: %@", buf, 0x20u);
    }
    v88 = [(HMDAccount *)v125 deviceVersion];
    [(HMDAccount *)v134 updateVersion:v88];
  }
  else
  {
    v89 = (void *)MEMORY[0x263EFF980];
    v90 = [(HMDAccount *)v125 deviceHandle];
    v140 = v90;
    v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v140 count:1];
    v120 = [v89 arrayWithArray:v91];

    if (v121)
    {
      v92 = [(HMDAccount *)v125 localDeviceHandle];
      [v120 addObject:v92];
    }
    v93 = [HMDDevice alloc];
    v94 = [(HMDAccount *)v125 deviceHandle];
    v95 = [v94 identifier];
    v96 = (void *)[v120 copy];
    v97 = [(HMDAccount *)v125 deviceVersion];
    v98 = [(HMDDevice *)v93 initWithIdentifier:v95 handles:v96 name:0 productInfo:0 version:v97 capabilities:0];

    v99 = v123;
    v128 = v130;
    v134 = v98;
    v119 = v99;
    if (v99 && v128 && v134)
    {
      v100 = (void *)MEMORY[0x230FBD990]();
      v133 = v119;
      v101 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        v102 = HMFGetLogIdentifier();
        v103 = [(HMDAccount *)v134 shortDescription];
        v104 = [(HMDAccount *)v128 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v102;
        __int16 v150 = 2112;
        v151 = v103;
        __int16 v152 = 2112;
        v153 = v104;
        _os_log_impl(&dword_22F52A000, v101, OS_LOG_TYPE_INFO, "%{public}@Adding device, %@, to the account: %@", buf, 0x20u);
      }
      long long v155 = 0u;
      long long v156 = 0u;
      memset(v154, 0, sizeof(v154));
      obuint64_t j = [(HMDRemoteAccountManager *)v133 accounts];
      uint64_t v129 = [obj countByEnumeratingWithState:v154 objects:buf count:16];
      if (v129)
      {
        uint64_t v127 = **(void **)&v154[16];
        do
        {
          for (uint64_t j = 0; j != v129; ++j)
          {
            if (**(void **)&v154[16] != v127) {
              objc_enumerationMutation(obj);
            }
            v105 = *(HMDAccount **)(*(void *)&v154[8] + 8 * j);
            if (v105 != v128)
            {
              long long v138 = 0u;
              long long v139 = 0u;
              long long v136 = 0u;
              long long v137 = 0u;
              v106 = [(HMDAccount *)v105 devices];
              uint64_t v107 = [v106 countByEnumeratingWithState:&v136 objects:&v145 count:16];
              if (v107)
              {
                uint64_t v108 = *(void *)v137;
                do
                {
                  for (uint64_t k = 0; k != v107; ++k)
                  {
                    if (*(void *)v137 != v108) {
                      objc_enumerationMutation(v106);
                    }
                    v110 = *(void **)(*((void *)&v136 + 1) + 8 * k);
                    if (objc_msgSend(v110, "isRelatedToDevice:", v134, v119))
                    {
                      v111 = (void *)MEMORY[0x230FBD990]();
                      v112 = v133;
                      v113 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                      {
                        v114 = HMFGetLogIdentifier();
                        *(_DWORD *)v141 = 138543618;
                        v142 = v114;
                        __int16 v143 = 2112;
                        v144 = v110;
                        _os_log_impl(&dword_22F52A000, v113, OS_LOG_TYPE_INFO, "%{public}@Removing device: %@", v141, 0x16u);
                      }
                      [(HMDAccount *)v105 removeDevice:v110];
                    }
                  }
                  uint64_t v107 = [v106 countByEnumeratingWithState:&v136 objects:&v145 count:16];
                }
                while (v107);
              }
            }
          }
          uint64_t v129 = [obj countByEnumeratingWithState:v154 objects:buf count:16];
        }
        while (v129);
      }

      [(HMDAccount *)v128 addDevice:v134];
    }

    v88 = v120;
  }

LABEL_96:
  uint64_t v115 = os_unfair_recursive_lock_unlock();
  id v7 = (void *)MEMORY[0x230FBD990](v115);
  v116 = v123;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v117 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v117;
    __int16 v150 = 2112;
    v151 = v125;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updated with sender context: %@", buf, 0x16u);
  }
LABEL_98:

  id v4 = v122;
LABEL_99:

  return v134;
}

- (id)accountForSenderContext:(id)a3
{
  if (a3)
  {
    uint64_t v3 = -[HMDRemoteAccountManager deviceForSenderContext:](self, "deviceForSenderContext:");
    id v4 = [v3 account];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)__handleSendMessageFailureWithError:(id)a3 destination:(id)a4
{
  v55[2] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    dispatch_queue_t v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      long long v51 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Received notification of failed message to, %@, with error: %@", buf, 0x20u);
    }
    uint64_t v13 = [v6 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x263F49E40]];

    if (v14)
    {
      if (([v6 code] & 0xFFFFFFFFFFFFFFFELL) != 2) {
        goto LABEL_40;
      }
LABEL_10:
      objc_super v17 = v10;
      id v18 = v8;
      if (!v17)
      {
LABEL_39:

        goto LABEL_40;
      }
      id v19 = +[HMDAccountHandleFormatter defaultFormatter];
      uint64_t v20 = [v19 accountHandleFromString:v18];

      if (!v20)
      {
        uint64_t v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = v17;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&unsigned char buf[12] = 2160;
          *(void *)&buf[14] = 1752392040;
          *(_WORD *)&buf[22] = 2112;
          long long v51 = v18;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from unknown account handle: %{mask.hash}@", buf, 0x20u);
        }
        goto LABEL_38;
      }
      id v21 = [(HMDRemoteAccountManager *)v17 accountForHandle:v20];
      uint64_t v22 = +[HMDDeviceHandle deviceHandleForDestination:v18];
      long long v48 = v22;
      if (v22)
      {
        if (([v22 isGlobal] & 1) == 0)
        {
          long long v23 = (void *)MEMORY[0x230FBD990]();
          long long v24 = v17;
          char v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v38;
            *(_WORD *)&unsigned char buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            long long v51 = v48;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from non-global handle: %{mask.hash}@", buf, 0x20u);
          }
          goto LABEL_19;
        }
        if (!v21)
        {
          id v21 = [(HMDRemoteAccountManager *)v17 accountForDeviceHandle:v48];
          if (!v21)
          {
            uint64_t v43 = (void *)MEMORY[0x230FBD990]();
            id v44 = v17;
            long long v45 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              long long v46 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v46;
              *(_WORD *)&unsigned char buf[12] = 2160;
              *(void *)&buf[14] = 1752392040;
              *(_WORD *)&buf[22] = 2112;
              long long v51 = v48;
              _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from device handle with no account %{mask.hash}@", buf, 0x20u);
            }
            goto LABEL_37;
          }
        }
        BOOL v47 = [v21 deviceForHandle:v48];
        if (!v47)
        {
          long long v23 = (void *)MEMORY[0x230FBD990]();
          long long v24 = v17;
          char v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            long long v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v26;
            *(_WORD *)&unsigned char buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            long long v51 = v48;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from unknown device handle: %{mask.hash}@", buf, 0x20u);
          }
LABEL_19:

LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
      }
      else
      {
        if (!v21)
        {
          long long v39 = (void *)MEMORY[0x230FBD990]();
          uint64_t v40 = v17;
          int v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            uint64_t v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v42;
            *(_WORD *)&unsigned char buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            long long v51 = v18;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from unknown destination: %{mask.hash}@", buf, 0x20u);
          }
          goto LABEL_37;
        }
        BOOL v47 = 0;
      }
      long long v31 = (void *)MEMORY[0x230FBD990]();
      v32 = v17;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&unsigned char buf[12] = 2160;
        *(void *)&buf[14] = 1752392040;
        *(_WORD *)&buf[22] = 2112;
        long long v51 = v18;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Received unregistration from destination: %{mask.hash}@", buf, 0x20u);
      }
      objc_initWeak(&location, v32);
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____handleUnregisteredDestination_block_invoke;
      long long v51 = &unk_264A23B38;
      objc_copyWeak(v55, &location);
      id v35 = v21;
      id v52 = v35;
      id v36 = v20;
      id v53 = v36;
      id v37 = v47;
      id v54 = v37;
      [(HMDRemoteAccountManager *)v32 _resolveAccountForHandle:v36 completionHandler:buf];

      objc_destroyWeak(v55);
      objc_destroyWeak(&location);

      goto LABEL_37;
    }
    uint64_t v15 = [v6 domain];
    int v16 = [v15 isEqualToString:*MEMORY[0x263F49EA8]];

    if (v16 && [v6 code] == 1) {
      goto LABEL_10;
    }
  }
LABEL_40:
}

@end