@interface MCMSystemChangeMonitor
- (MCMSystemChangeMonitor)initWithQueue:(id)a3 flushables:(id)a4;
- (NSArray)flushables;
- (OS_dispatch_queue)queue;
- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4;
- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4;
@end

@implementation MCMSystemChangeMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushables, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSArray)flushables
{
  return self->_flushables;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MCMSystemChangeMonitor *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__MCMSystemChangeMonitor_userIdentityCache_didAddUserIdentity___block_invoke;
  v11[3] = &unk_1E6A80270;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

void __63__MCMSystemChangeMonitor_userIdentityCache_didAddUserIdentity___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v2 = [*(id *)(a1 + 32) flushables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&unk_1F2F24018]) {
          [v7 didAddUserIdentity:*(void *)(a1 + 40)];
        }
        else {
          [v7 flush];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v4);
  }

  v8 = [*(id *)(a1 + 48) libraryRepairForUserIdentity:*(void *)(a1 + 40)];
  id v13 = 0;
  char v9 = [v8 createPathsIfNecessaryWithError:&v13];
  id v10 = v13;
  if ((v9 & 1) == 0)
  {
    v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Failed creating working directories for %@: %{public}@", buf, 0x16u);
    }
  }
}

- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(MCMSystemChangeMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MCMSystemChangeMonitor_userIdentityCache_didInvalidateUserIdentity___block_invoke;
  block[3] = &unk_1E6A805F0;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __70__MCMSystemChangeMonitor_userIdentityCache_didInvalidateUserIdentity___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [*(id *)(a1 + 32) flushables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&unk_1F2F24018]) {
          [v7 didInvalidateUserIdentity:*(void *)(a1 + 40)];
        }
        else {
          [v7 flush];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v4);
  }
}

- (MCMSystemChangeMonitor)initWithQueue:(id)a3 flushables:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMSystemChangeMonitor;
  long long v9 = [(MCMSystemChangeMonitor *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_flushables, a4);
  }

  return v10;
}

@end