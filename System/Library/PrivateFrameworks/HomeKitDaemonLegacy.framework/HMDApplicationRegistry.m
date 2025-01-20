@interface HMDApplicationRegistry
+ (id)logCategory;
+ (id)sharedRegistry;
- (HMDApplicationRegistry)init;
- (NSArray)applications;
- (id)applicationInfoForBundleIdentifier:(id)a3;
- (id)applicationInfoForBundleURL:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
@end

@implementation HMDApplicationRegistry

- (id)applicationInfoForBundleURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    v5 = __HMDApplicationRegistryApplicationForBundleURL((id *)&self->super.super.isa, v4);
    if (v5
      || (+[HMDApplicationInfo applicationInfoForBundleURL:](HMDApplicationInfo, "applicationInfoForBundleURL:", v4), v5 = objc_claimAutoreleasedReturnValue(), ![v5 isInstalled]))
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSMutableSet *)self->_applications addObject:v5];
      os_unfair_lock_unlock(&self->_lock);
      __HMDApplicationRegistryHandleAddedApplicationInfo((uint64_t)self, v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)sharedRegistry
{
  if (sharedRegistry_onceToken_113923 != -1) {
    dispatch_once(&sharedRegistry_onceToken_113923, &__block_literal_global_113924);
  }
  v2 = (void *)sharedRegistry_sharedRegistry;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_applications, 0);
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__HMDApplicationRegistry_applicationsDidInstall___block_invoke;
  v12[3] = &unk_1E6A0FB68;
  v12[4] = self;
  v3 = objc_msgSend(a3, "na_map:", v12);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        logAndPostNotification(@"HMDApplicationInstalledNotification", *(void **)(*((void *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

HMDApplicationInfo *__49__HMDApplicationRegistry_applicationsDidInstall___block_invoke(uint64_t a1, void *a2)
{
  return __HMDApplicationRegistryApplicationInfoForApplicationProxy(*(void **)(a1 + 32), a2);
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  os_unfair_lock_lock_with_options();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = __HMDApplicationRegistryApplicationInfoForApplicationProxy(self, *(void **)(*((void *)&v19 + 1) + 8 * v9));
        if (v10)
        {
          [(NSMutableSet *)self->_applications removeObject:v10];
          [v5 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        logAndPostNotification(@"HMDApplicationUninstalledNotification", *(void **)(*((void *)&v15 + 1) + 8 * v14++), 0);
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)applicationInfoForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v6 = __HMDApplicationRegistryApplicationWithBundleIdentifier((id *)&self->super.super.isa, v4);
    if (v6)
    {
      id v7 = v6;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      uint64_t v8 = +[HMDApplicationInfo applicationInfoForBundleIdentifier:v4];
      if ([v8 isInstalled])
      {
        [(NSMutableSet *)self->_applications addObject:v8];
        os_unfair_lock_unlock(&self->_lock);
        __HMDApplicationRegistryHandleAddedApplicationInfo((uint64_t)self, v8);
      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
      }
      id v7 = v8;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)applications
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_applications allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)dealloc
{
  [(LSApplicationWorkspace *)self->_workspace removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HMDApplicationRegistry;
  [(HMDApplicationRegistry *)&v3 dealloc];
}

- (HMDApplicationRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDApplicationRegistry;
  v2 = [(HMDApplicationRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    applications = v2->_applications;
    v2->_applications = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    workspace = v2->_workspace;
    v2->_workspace = (LSApplicationWorkspace *)v5;

    [(LSApplicationWorkspace *)v2->_workspace addObserver:v2];
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_113916 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_113916, &__block_literal_global_11_113917);
  }
  v2 = (void *)logCategory__hmf_once_v4_113918;
  return v2;
}

uint64_t __37__HMDApplicationRegistry_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_113918;
  logCategory__hmf_once_v4_113918 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __40__HMDApplicationRegistry_sharedRegistry__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDApplicationRegistry);
  uint64_t v1 = sharedRegistry_sharedRegistry;
  sharedRegistry_sharedRegistry = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end