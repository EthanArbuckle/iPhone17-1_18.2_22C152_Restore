@interface HMDMessageFilterChain
- (BOOL)acceptMessage:(id)a3 error:(id *)a4;
- (BOOL)shouldCloudSyncData;
- (HMDMessageFilterChain)init;
- (NSArray)filters;
- (void)addMessageFilter:(id)a3;
- (void)removeMessageFilter:(id)a3;
- (void)resetConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDMessageFilterChain

- (BOOL)acceptMessage:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 destination];
  v8 = [v7 target];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v9 = [(HMDMessageFilterChain *)self filters];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v26 = a4;
    id v12 = 0;
    uint64_t v13 = *(void *)v29;
    while (2)
    {
      uint64_t v14 = 0;
      v15 = v12;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
        id v27 = v15;
        char v17 = objc_msgSend(v16, "acceptMessage:target:errorReason:", v6, v8, &v27, v26);
        id v12 = v27;

        if ((v17 & 1) == 0)
        {
          v19 = (void *)MEMORY[0x1D9452090]();
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = HMFGetLogIdentifier();
            v22 = [v16 name];
            v23 = [v6 name];
            *(_DWORD *)buf = 138544130;
            v33 = v21;
            __int16 v34 = 2112;
            v35 = v22;
            __int16 v36 = 2112;
            v37 = v23;
            __int16 v38 = 2112;
            id v39 = v12;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@%@ Message %@ was rejected due to reason: %@", buf, 0x2Au);
          }
          BOOL v18 = 0;
          goto LABEL_13;
        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    BOOL v18 = 1;
LABEL_13:
    a4 = v26;
  }
  else
  {
    id v12 = 0;
    BOOL v18 = 1;
  }

  if (a4)
  {
    if (v18) {
      v24 = 0;
    }
    else {
      v24 = v12;
    }
    *a4 = v24;
  }

  return v18;
}

- (NSArray)filters
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSMutableArray *)self->_filters copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void).cxx_destruct
{
}

- (void)resetConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = self->_filters;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v12++) resetConfiguration];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_lock);
  if (v6 && v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HMDMessageFilterChain_resetConfiguration_completionHandler___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v14 = v7;
    dispatch_async(v6, block);
  }
}

uint64_t __62__HMDMessageFilterChain_resetConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldCloudSyncData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDMessageFilterChain *)self filters];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldCloudSyncData])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)removeMessageFilter:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_filters removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addMessageFilter:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_filters addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (HMDMessageFilterChain)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDMessageFilterChain;
  v2 = [(HMDMessageFilterChain *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    filters = v2->_filters;
    v2->_filters = (NSMutableArray *)v3;
  }
  return v2;
}

@end