@interface HMFNetServiceBrowser
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isBrowsing;
- (BOOL)shouldCache;
- (HMFNetServiceBrowser)init;
- (HMFNetServiceBrowser)initWithDomain:(id)a3 serviceType:(id)a4;
- (HMFNetServiceBrowserDelegate)delegate;
- (NSArray)cachedNetServices;
- (NSNetServiceBrowser)internal;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)domain;
- (NSString)serviceType;
- (OS_dispatch_queue)clientQueue;
- (id)browseBlock;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)logIdentifier;
- (id)shortDescription;
- (void)_stopBrowsingWithError:(id)a3;
- (void)addNetServiceToCache:(id)a3;
- (void)dealloc;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowserDidStopSearch:(id)a3;
- (void)netServiceBrowserWillSearch:(id)a3;
- (void)setBrowseBlock:(id)a3;
- (void)setBrowsing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldCache:(BOOL)a3;
- (void)startBrowsingWithCompletionHandler:(id)a3;
- (void)stopBrowsing;
@end

@implementation HMFNetServiceBrowser

- (HMFNetServiceBrowser)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFNetServiceBrowser)initWithDomain:(id)a3 serviceType:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HMFNetServiceBrowser;
  v8 = [(HMFNetServiceBrowser *)&v28 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_clientQueue, MEMORY[0x1E4F14428]);
  uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  netServices = v9->_netServices;
  v9->_netServices = (NSHashTable *)v10;

  uint64_t v12 = [v6 copy];
  domain = v9->_domain;
  v9->_domain = (NSString *)v12;

  uint64_t v14 = [v7 copy];
  serviceType = v9->_serviceType;
  v9->_serviceType = (NSString *)v14;

  v16 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x1E4F18D68]);
  if (v16)
  {
    internal = v9->_internal;
    v9->_internal = v16;
    v18 = v16;

    [(NSNetServiceBrowser *)v18 setDelegate:v9];
    v19 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    uint64_t v20 = *MEMORY[0x1E4F1C4B0];
    [(NSNetServiceBrowser *)v18 removeFromRunLoop:v19 forMode:*MEMORY[0x1E4F1C4B0]];

    v21 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(NSNetServiceBrowser *)v18 scheduleInRunLoop:v21 forMode:v20];

LABEL_4:
    v22 = v9;
    goto LABEL_8;
  }
  v23 = (void *)MEMORY[0x19F3A87A0]();
  v24 = v9;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier(v24);
    *(_DWORD *)buf = 138543362;
    v30 = v26;
    _os_log_impl(&dword_19D57B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create internal net service browser", buf, 0xCu);
  }
  v22 = 0;
LABEL_8:

  return v22;
}

- (void)dealloc
{
  [(NSNetServiceBrowser *)self->_internal setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)HMFNetServiceBrowser;
  [(HMFNetServiceBrowser *)&v3 dealloc];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  v5 = NSString;
  id v6 = [(HMFNetServiceBrowser *)self shortDescription];
  id v7 = [(HMFNetServiceBrowser *)self domain];
  uint64_t v8 = [(HMFNetServiceBrowser *)self serviceType];
  v9 = (void *)v8;
  if (a3)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v11 = [v5 stringWithFormat:@"<%@%@, Domain = %@, Service Type = %@>", v6, v7, v9, v10];
  }
  else
  {
    v11 = [v5 stringWithFormat:@"<%@%@, Domain = %@, Service Type = %@>", v6, v7, v8, &stru_1EEF0F5E0];
  }

  return v11;
}

- (NSString)debugDescription
{
  return (NSString *)[(HMFNetServiceBrowser *)self descriptionWithPointer:1];
}

- (NSString)description
{
  return (NSString *)[(HMFNetServiceBrowser *)self descriptionWithPointer:0];
}

- (BOOL)shouldCache
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_cachedNetServices != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setShouldCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v3)
  {
    id v6 = [MEMORY[0x1E4F1CA70] orderedSet];
    cachedNetServices = self->_cachedNetServices;
    self->_cachedNetServices = v6;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = self->_netServices;
    uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "isPublishing", (void)v14)) {
            [(NSMutableOrderedSet *)self->_cachedNetServices addObject:v12];
          }
        }
        uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v13 = self->_cachedNetServices;
    self->_cachedNetServices = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)cachedNetServices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(NSMutableOrderedSet *)self->_cachedNetServices array];
  v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)addNetServiceToCache:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSHashTable *)self->_netServices addObject:v5];
    [(NSMutableOrderedSet *)self->_cachedNetServices addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (BOOL)isBrowsing
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_browsing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBrowsing:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_browsing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)startBrowsingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFNetServiceBrowser *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMFNetServiceBrowser_startBrowsingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5957780;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMFNetServiceBrowser_startBrowsingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isBrowsing];
  BOOL v3 = (void *)MEMORY[0x19F3A87A0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier(v4);
      int v15 = 138543362;
      long long v16 = v7;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@The browser is already browsing", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = HMFGetLogIdentifier(v4);
      uint64_t v10 = [*(id *)(a1 + 32) serviceType];
      v11 = [*(id *)(a1 + 32) domain];
      int v15 = 138543874;
      long long v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Start browsing for %@%@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 32) setBrowsing:1];
    [*(id *)(a1 + 32) setBrowseBlock:*(void *)(a1 + 40)];
    uint64_t v12 = [*(id *)(a1 + 32) internal];
    v13 = [*(id *)(a1 + 32) serviceType];
    long long v14 = [*(id *)(a1 + 32) domain];
    [v12 searchForServicesOfType:v13 inDomain:v14];
  }
}

- (void)stopBrowsing
{
  BOOL v3 = [(HMFNetServiceBrowser *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HMFNetServiceBrowser_stopBrowsing__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__HMFNetServiceBrowser_stopBrowsing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopBrowsingWithError:0];
}

- (void)_stopBrowsingWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMFNetServiceBrowser *)self isBrowsing])
  {
    id v5 = (void *)MEMORY[0x19F3A87A0]();
    BOOL v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier(v6);
      int v13 = 138543362;
      long long v14 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping the browse", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v9 = [(HMFNetServiceBrowser *)v6 internal];
    [v9 stop];

    uint64_t v10 = v6;
    id v11 = v4;
    if (v10)
    {
      uint64_t v12 = [(HMFNetServiceBrowser *)v10 delegate];
      if (objc_opt_respondsToSelector()) {
        [v12 netServiceBrowser:v10 didStopBrowsingWithError:v11];
      }
    }
  }
}

+ (id)logCategory
{
  if (_MergedGlobals_3_4 != -1) {
    dispatch_once(&_MergedGlobals_3_4, &__block_literal_global_15);
  }
  int v2 = (void *)qword_1EB4EEA90;
  return v2;
}

uint64_t __35__HMFNetServiceBrowser_logCategory__block_invoke()
{
  qword_1EB4EEA90 = HMFCreateOSLogHandle(@"Networking.Service.Browser", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (id)logIdentifier
{
  BOOL v3 = NSString;
  id v4 = [(HMFNetServiceBrowser *)self domain];
  id v5 = [(HMFNetServiceBrowser *)self serviceType];
  BOOL v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (void)netServiceBrowserWillSearch:(id)a3
{
  id v4 = [(HMFNetServiceBrowser *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMFNetServiceBrowser_netServiceBrowserWillSearch___block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v4, block);
}

void __52__HMFNetServiceBrowser_netServiceBrowserWillSearch___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Browser started browsing", (uint8_t *)&v7, 0xCu);
  }
  BOOL v6 = [*(id *)(a1 + 32) browseBlock];
  if (v6)
  {
    [*(id *)(a1 + 32) setBrowseBlock:0];
    v6[2](v6, 0);
  }
}

- (void)netServiceBrowserDidStopSearch:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A87A0]();
  BOOL v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier(v6);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Browse did stop", (uint8_t *)&v9, 0xCu);
  }
  [(HMFNetServiceBrowser *)v6 setBrowsing:0];
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(HMFNetServiceBrowser *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HMFNetServiceBrowser_netServiceBrowser_didNotSearch___block_invoke;
  v8[3] = &unk_1E5957730;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __55__HMFNetServiceBrowser_netServiceBrowser_didNotSearch___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v15 = 138543362;
    long long v16 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to browse", (uint8_t *)&v15, 0xCu);
  }
  BOOL v6 = (void *)MEMORY[0x19F3A87A0]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier(v7);
    uint64_t v10 = *(void *)(a1 + 40);
    int v15 = 138543618;
    long long v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to browse with error: %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v11 = [*(id *)(a1 + 32) browseBlock];
  if (v11)
  {
    [*(id *)(a1 + 32) setBrowseBlock:0];
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    int v13 = +[HMFNetService errorFromNetServiceErrorDict:*(void *)(a1 + 40)];
    long long v14 = [v12 hmfErrorWithCode:12 reason:@"Failed to search for services." suggestion:0 underlyingError:v13];

    ((void (**)(void, void *))v11)[2](v11, v14);
  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(HMFNetServiceBrowser *)self clientQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HMFNetServiceBrowser_netServiceBrowser_didFindService_moreComing___block_invoke;
  v9[3] = &unk_1E5957730;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __68__HMFNetServiceBrowser_netServiceBrowser_didFindService_moreComing___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    __int16 v25 = 2112;
    uint64_t v26 = v6;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Added service: %@", buf, 0x16u);
  }
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 16);
  id v9 = (HMFNetService *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (HMFNetService *)((char *)i + 1))
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "internal", (void)v18);
        int v14 = [v13 isEqual:*(void *)(a1 + 40)];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_13;
        }
      }
      id v9 = (HMFNetService *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(v7);
  if (!v9) {
    id v9 = [[HMFNetService alloc] initWithNetService:*(void *)(a1 + 40)];
  }
  -[HMFNetService setPublishing:](v9, "setPublishing:", 1, (void)v18);
  [*(id *)(a1 + 32) addNetServiceToCache:v9];
  id v15 = *(id *)(a1 + 32);
  long long v16 = v9;
  if (v16 && v15)
  {
    __int16 v17 = [v15 delegate];
    if (objc_opt_respondsToSelector()) {
      [v17 netServiceBrowser:v15 didAddService:v16];
    }
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(HMFNetServiceBrowser *)self clientQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HMFNetServiceBrowser_netServiceBrowser_didRemoveDomain_moreComing___block_invoke;
  v9[3] = &unk_1E5957730;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __69__HMFNetServiceBrowser_netServiceBrowser_didRemoveDomain_moreComing___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) domain];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    id v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier(v5);
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@The browse domain, %@, was removed", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12 reason:@"The search domain was removed."];
    [*(id *)(a1 + 40) _stopBrowsingWithError:v9];
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(HMFNetServiceBrowser *)self clientQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HMFNetServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke;
  v9[3] = &unk_1E5957730;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __70__HMFNetServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    __int16 v25 = 2112;
    uint64_t v26 = v6;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Removed service: %@", buf, 0x16u);
  }
  id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 16);
  id v9 = (HMFNetService *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (HMFNetService *)((char *)i + 1))
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        __int16 v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "internal", (void)v18);
        int v14 = [v13 isEqual:*(void *)(a1 + 40)];

        if (v14)
        {
          id v9 = v12;
          [(HMFNetService *)v9 setPublishing:0];
          [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v9];
          goto LABEL_13;
        }
      }
      id v9 = (HMFNetService *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(v7);
  if (!v9) {
    id v9 = [[HMFNetService alloc] initWithNetService:*(void *)(a1 + 40)];
  }
  id v15 = *(id *)(a1 + 32);
  long long v16 = v9;
  if (v16 && v15)
  {
    __int16 v17 = [v15 delegate];
    if (objc_opt_respondsToSelector()) {
      [v17 netServiceBrowser:v15 didRemoveService:v16];
    }
  }
}

- (HMFNetServiceBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFNetServiceBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSNetServiceBrowser)internal
{
  return self->_internal;
}

- (id)browseBlock
{
  return self->_browseBlock;
}

- (void)setBrowseBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_browseBlock, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedNetServices, 0);
  objc_storeStrong((id *)&self->_netServices, 0);
}

@end