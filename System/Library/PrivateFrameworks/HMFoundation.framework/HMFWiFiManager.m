@interface HMFWiFiManager
+ (HMFWiFiManager)sharedManager;
+ (id)logCategory;
- (BOOL)currentNetworkRequiresPassword;
- (BOOL)isActive;
- (BOOL)isCaptive;
- (HMFMACAddress)MACAddress;
- (HMFWiFiManager)init;
- (HMFWiFiManager)initWithWorkQueue:(id)a3 dataSource:(id)a4;
- (HMFWifiNetworkAssociation)currentNetworkAssociation;
- (NSNumber)currentNetworkRSSI;
- (NSString)currentNetworkSSID;
- (id)beginActiveAssertionWithOptions:(unint64_t)a3 reason:(id)a4;
- (void)__updateActiveAssertions;
- (void)currentNetworkDidChangeForDataSource:(id)a3;
- (void)dataSource:(id)a3 didChangeLinkAvailability:(BOOL)a4;
- (void)dataSource:(id)a3 didChangeWoWState:(BOOL)a4;
- (void)endActiveAssertion:(id)a3;
- (void)releaseWoWAssertion;
- (void)takeWoWAssertion;
@end

@implementation HMFWiFiManager

- (void)__updateActiveAssertions
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 1);
    os_unfair_lock_lock_with_options();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v3 = a1[6];
    unint64_t v4 = 0;
    int v5 = 0;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v9, "isValid", (void)v24))
          {
            v4 |= [v9 options];
            int v5 = 1;
          }
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v6);
    }

    id v10 = a1[4];
    int v11 = [v10 isAssertionActive];

    if ((v5 ^ v11))
    {
      v12 = (void *)MEMORY[0x19F3A87A0]();
      v13 = a1;
      if ((v5 & 1) == 0)
      {
        HMFGetOSLogHandle();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier(v13);
          *(_DWORD *)buf = 138543362;
          id v29 = v23;
          _os_log_impl(&dword_19D57B000, v22, OS_LOG_TYPE_INFO, "%{public}@Deactivating", buf, 0xCu);
        }
        id v17 = v13[4];
        [v17 deactivate];
        goto LABEL_23;
      }
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v13);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = HMFWiFiAssertionOptionsDescription(v4);
        *(_DWORD *)buf = 138543618;
        id v29 = v15;
        __int16 v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_INFO, "%{public}@Activating with options: %@", buf, 0x16u);
      }
    }
    else
    {
      id v18 = a1[4];
      BOOL v19 = v4 == [v18 assertionOptions];

      if (v19)
      {
LABEL_24:
        os_unfair_lock_unlock(v2);
        return;
      }
      v12 = (void *)MEMORY[0x19F3A87A0]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v13);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = HMFWiFiAssertionOptionsDescription(v4);
        *(_DWORD *)buf = 138543618;
        id v29 = v20;
        __int16 v30 = 2112;
        v31 = v21;
        _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating activation with options: %@", buf, 0x16u);
      }
    }

    id v17 = v13[4];
    [v17 activateWithOptions:v4];
LABEL_23:

    goto LABEL_24;
  }
}

+ (HMFWiFiManager)sharedManager
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_9);
  }
  v2 = (void *)qword_1EB4EE9E0;
  return (HMFWiFiManager *)v2;
}

uint64_t __31__HMFWiFiManager_sharedManager__block_invoke()
{
  qword_1EB4EE9E0 = objc_alloc_init(HMFWiFiManager);
  return MEMORY[0x1F41817F8]();
}

- (HMFWiFiManager)init
{
  id v3 = (const char *)HMFDispatchQueueName(self, 0);
  unint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v5 = dispatch_queue_create(v3, v4);

  uint64_t v6 = [[HMFWiFiManagerDataSource alloc] initWithWorkQueue:v5];
  uint64_t v7 = [(HMFWiFiManager *)self initWithWorkQueue:v5 dataSource:v6];

  return v7;
}

- (HMFWiFiManager)initWithWorkQueue:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMFWiFiManager;
  v9 = [(HMFWiFiManager *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    activeAssertions = v10->_activeAssertions;
    v10->_activeAssertions = (NSHashTable *)v11;

    objc_storeStrong((id *)&v10->_dataSource, a4);
    [(HMFWiFiManagerDataSource *)v10->_dataSource setDelegate:v10];
    v13 = [(id)objc_opt_class() MACAddressString];
    v14 = [[HMFMACAddress alloc] initWithMACAddressString:v13];
    MACAddress = v10->_MACAddress;
    v10->_MACAddress = v14;

    workQueue = v10->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HMFWiFiManager_initWithWorkQueue_dataSource___block_invoke;
    block[3] = &unk_1E5957698;
    BOOL v19 = v10;
    dispatch_async(workQueue, block);
  }
  return v10;
}

uint64_t __47__HMFWiFiManager_initWithWorkQueue_dataSource___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v2 = v1[4];
  }
  else {
    uint64_t v2 = 0;
  }
  return [v1 currentNetworkDidChangeForDataSource:v2];
}

- (NSString)currentNetworkSSID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    dataSource = self->_dataSource;
  }
  else {
    dataSource = 0;
  }
  dispatch_queue_t v5 = dataSource;
  uint64_t v6 = [(HMFWiFiManagerDataSource *)v5 currentNetworkAssociation];
  id v7 = [v6 SSID];

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v7;
}

- (HMFWifiNetworkAssociation)currentNetworkAssociation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    dataSource = self->_dataSource;
  }
  else {
    dataSource = 0;
  }
  dispatch_queue_t v5 = dataSource;
  uint64_t v6 = [(HMFWiFiManagerDataSource *)v5 currentNetworkAssociation];

  os_unfair_lock_unlock(p_lock);
  return (HMFWifiNetworkAssociation *)v6;
}

- (BOOL)currentNetworkRequiresPassword
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    dataSource = self->_dataSource;
  }
  else {
    dataSource = 0;
  }
  dispatch_queue_t v5 = dataSource;
  uint64_t v6 = [(HMFWiFiManagerDataSource *)v5 currentNetworkAssociation];
  char v7 = [v6 requiresPassword];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSNumber)currentNetworkRSSI
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    dataSource = self->_dataSource;
  }
  else {
    dataSource = 0;
  }
  dispatch_queue_t v5 = dataSource;
  uint64_t v6 = [(HMFWiFiManagerDataSource *)v5 currentNetworkRSSI];

  os_unfair_lock_unlock(p_lock);
  return (NSNumber *)v6;
}

- (BOOL)isActive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    dataSource = self->_dataSource;
  }
  else {
    dataSource = 0;
  }
  dispatch_queue_t v5 = dataSource;
  BOOL v6 = [(HMFWiFiManagerDataSource *)v5 isAssertionActive];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isCaptive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    dataSource = self->_dataSource;
  }
  else {
    dataSource = 0;
  }
  dispatch_queue_t v5 = dataSource;
  BOOL v6 = [(HMFWiFiManagerDataSource *)v5 isCaptive];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)beginActiveAssertionWithOptions:(unint64_t)a3 reason:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = (void *)MEMORY[0x19F3A87A0]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier(v8);
    int v13 = 138543618;
    v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@Taking active assertion with reason: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [[__HMFWiFiAssertion alloc] initWithOptions:a3 manager:v8 reason:v6];
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)v8->_activeAssertions addObject:v11];
  os_unfair_lock_unlock(&v8->_lock);
  [(__HMFWiFiAssertion *)v11 acquire:0];

  return v11;
}

- (void)endActiveAssertion:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v6;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    os_unfair_lock_lock_with_options();
    [(NSHashTable *)self->_activeAssertions removeObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    [v5 invalidate];
  }
}

- (void)takeWoWAssertion
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMFWiFiManager_takeWoWAssertion__block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__HMFWiFiManager_takeWoWAssertion__block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (v1 && !*(unsigned char *)(v1 + 12) && *(void *)(v1 + 32))
  {
    uint64_t v2 = result;
    id v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = *(id *)(v2 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier(v4);
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Taking WoW assertion", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = *(void *)(v2 + 32);
    if (v7 && (*(unsigned char *)(v7 + 12) = 1, (uint64_t v8 = *(void *)(v2 + 32)) != 0)) {
      v9 = *(void **)(v8 + 32);
    }
    else {
      v9 = 0;
    }
    return [v9 setWoWAsserted:1];
  }
  return result;
}

- (void)releaseWoWAssertion
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HMFWiFiManager_releaseWoWAssertion__block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __37__HMFWiFiManager_releaseWoWAssertion__block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (v1 && *(unsigned char *)(v1 + 12) && *(void *)(v1 + 32))
  {
    uint64_t v2 = result;
    id v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = *(id *)(v2 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier(v4);
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Releasing WoW assertion", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = *(void *)(v2 + 32);
    if (v7 && (*(unsigned char *)(v7 + 12) = 0, (uint64_t v8 = *(void *)(v2 + 32)) != 0)) {
      v9 = *(void **)(v8 + 32);
    }
    else {
      v9 = 0;
    }
    return [v9 setWoWAsserted:0];
  }
  return result;
}

+ (id)logCategory
{
  if (qword_1EB4EE9E8 != -1) {
    dispatch_once(&qword_1EB4EE9E8, &__block_literal_global_79);
  }
  uint64_t v2 = (void *)qword_1EB4EE9F0;
  return v2;
}

uint64_t __29__HMFWiFiManager_logCategory__block_invoke()
{
  qword_1EB4EE9F0 = HMFCreateOSLogHandle(@"Networking.WiFi.Manager", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (void)dataSource:(id)a3 didChangeWoWState:(BOOL)a4
{
  id v5 = self;
  if (self) {
    self = (HMFWiFiManager *)self->_workQueue;
  }
  dispatch_assert_queue_V2(&self->super.super);
  if (v5 && !a4 && v5->_shouldAssertWoW)
  {
    dataSource = v5->_dataSource;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__HMFWiFiManager_dataSource_didChangeWoWState___block_invoke;
    v7[3] = &unk_1E5957698;
    v7[4] = v5;
    [(HMFWiFiManagerDataSource *)dataSource performBlockAfterWoWReassertionDelay:v7];
  }
}

void __47__HMFWiFiManager_dataSource_didChangeWoWState___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Re-Enabling WoW", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (*(unsigned char *)(v6 + 12)) {
      [*(id *)(v6 + 32) setWoWAsserted:1];
    }
  }
}

- (void)dataSource:(id)a3 didChangeLinkAvailability:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  dispatch_assert_queue_V2(workQueue);
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier(v9);
    uint64_t v12 = (void *)v11;
    int v13 = @"Down";
    if (v4) {
      int v13 = @"Up";
    }
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@WiFi link is %@", (uint8_t *)&v14, 0x16u);
  }
  if (self && !v4) {
    v9->_shouldAssertWoW = 0;
  }
}

- (void)currentNetworkDidChangeForDataSource:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    dataSource = self->_dataSource;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    dataSource = 0;
  }
  id v6 = dataSource;
  int v7 = [(HMFWiFiManagerDataSource *)v6 currentNetworkAssociation];
  uint64_t v8 = [v7 SSID];

  if (self) {
    savedNetworkSSID = self->_savedNetworkSSID;
  }
  else {
    savedNetworkSSID = 0;
  }
  if ((HMFEqualObjects(savedNetworkSSID, v8) & 1) == 0)
  {
    int v10 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier(v11);
      int v14 = (void *)v13;
      if (self) {
        uint64_t v15 = v11->_savedNetworkSSID;
      }
      else {
        uint64_t v15 = 0;
      }
      int v18 = 138543874;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_INFO, "%{public}@Current network SSID updated from %@ to %@", (uint8_t *)&v18, 0x20u);
    }
    if (self) {
      objc_setProperty_nonatomic_copy(v11, v16, v8, 40);
    }
    uint64_t v17 = +[HMFNotificationCenter defaultCenter];
    [v17 postNotificationName:@"HMFWiFiManagerCurrentNetworkDidChangeNotification" object:v11];
  }
}

- (HMFMACAddress)MACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_savedNetworkSSID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end