@interface HMDHAPAccessoryTaskTracker
- (HMDHAPAccessoryTaskTracker)init;
- (NSMutableDictionary)pendingTasks;
- (id)pendingRemoteTasks;
- (unint64_t)nextTaskIdentifier;
- (void)executeTask:(id)a3;
- (void)removePendingTaskWithIdentifier:(id)a3;
@end

@implementation HMDHAPAccessoryTaskTracker

- (void).cxx_destruct
{
}

- (NSMutableDictionary)pendingTasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)pendingRemoteTasks
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v4 = [(NSMutableDictionary *)self->_pendingTasks allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v35;
    uint64_t v27 = *(void *)v35;
    v28 = v4;
    do
    {
      uint64_t v7 = 0;
      uint64_t v29 = v5;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        if (objc_msgSend(v8, "supportsMultiPartResponse", lock))
        {
          id v9 = v8;
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
            [v3 addObject:v11];
          }
          else
          {
            id v12 = v9;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v13 = v12;
            }
            else {
              v13 = 0;
            }
            id v14 = v13;

            id v9 = [v14 remoteTask];

            if (v9)
            {
              [v3 addObject:v9];
            }
            else
            {
              long long v32 = 0u;
              long long v33 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              id v15 = v12;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v16 = v15;
              }
              else {
                v16 = 0;
              }
              id v17 = v16;

              v18 = [v17 remoteFallbackTasks];

              id v9 = 0;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v31;
                do
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v31 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    v22 = [*(id *)(*((void *)&v30 + 1) + 8 * i) remoteTask];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      v23 = v22;
                    }
                    else {
                      v23 = 0;
                    }
                    id v24 = v23;

                    id v9 = v24;
                    if (v24) {
                      [v3 addObject:v24];
                    }
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
                }
                while (v19);
              }
            }
          }

          uint64_t v6 = v27;
          v4 = v28;
          uint64_t v5 = v29;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  return v3;
}

- (unint64_t)nextTaskIdentifier
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t currentTaskIdentifier = self->_currentTaskIdentifier;
  self->_unint64_t currentTaskIdentifier = currentTaskIdentifier + 1;
  os_unfair_lock_unlock(p_lock);
  return currentTaskIdentifier;
}

- (void)removePendingTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_pendingTasks removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)executeTask:(id)a3
{
  id v7 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  pendingTasks = self->_pendingTasks;
  uint64_t v6 = [v7 identifier];
  [(NSMutableDictionary *)pendingTasks setObject:v7 forKey:v6];

  os_unfair_lock_unlock(p_lock);
  [v7 execute];
}

- (HMDHAPAccessoryTaskTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHAPAccessoryTaskTracker;
  v2 = [(HMDHAPAccessoryTaskTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    pendingTasks = v2->_pendingTasks;
    v2->_pendingTasks = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end