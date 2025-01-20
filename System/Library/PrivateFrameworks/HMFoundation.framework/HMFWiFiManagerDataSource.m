@interface HMFWiFiManagerDataSource
+ (NSString)MACAddressString;
- (BOOL)isAssertionActive;
- (BOOL)isCaptive;
- (BOOL)isWoWAsserted;
- (HMFWiFiManagerDataSource)initWithWorkQueue:(id)a3;
- (HMFWiFiManagerDataSourceDelegate)delegate;
- (HMFWifiNetworkAssociation)currentNetworkAssociation;
- (NSLock)captiveCachedLock;
- (NSNumber)currentNetworkRSSI;
- (OS_dispatch_queue)workQueue;
- (__SCDynamicStore)scStore;
- (__WiFiDeviceClient)wifiDeviceReference;
- (__WiFiManagerClient)wifiClientReference;
- (__WiFiNetwork)currentNetwork;
- (int)captiveCached;
- (unint64_t)assertionOptions;
- (void)_invalidateCaptiveState;
- (void)_registerForCaptiveStateChanges;
- (void)_setCurrentNetwork:(__WiFiNetwork *)a3;
- (void)activateWithOptions:(unint64_t)a3;
- (void)deactivate;
- (void)dealloc;
- (void)handleWiFiLinkChangedWithEventDictionary:(id)a3;
- (void)performBlockAfterWoWReassertionDelay:(id)a3;
- (void)setCaptiveCached:(int)a3;
- (void)setCaptiveCachedLock:(id)a3;
- (void)setCurrentNetwork:(__WiFiNetwork *)a3;
- (void)setDelegate:(id)a3;
- (void)setScStore:(__SCDynamicStore *)a3;
- (void)setWifiDeviceReference:(__WiFiDeviceClient *)a3;
- (void)setWoWAsserted:(BOOL)a3;
- (void)startWithWiFiDevice:(__WiFiDeviceClient *)a3;
@end

@implementation HMFWiFiManagerDataSource

- (HMFWiFiManagerDataSource)initWithWorkQueue:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMFWiFiManagerDataSource;
  v6 = [(HMFWiFiManagerDataSource *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    captiveCachedLock = v7->_captiveCachedLock;
    v7->_captiveCachedLock = v8;

    v10 = (void *)MEMORY[0x19F3A87A0]();
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Initializing WiFi Services", buf, 0xCu);
    }
    uint64_t v13 = WiFiManagerClientCreate();
    v7->_wifiClientReference = (__WiFiManagerClient *)v13;
    if (v13)
    {
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      WiFiManagerClientRegisterWowStateChangedCallback();
      CFArrayRef v14 = (const __CFArray *)WiFiManagerClientCopyDevices();
      if (v14)
      {
        CFArrayRef v15 = v14;
        if (CFArrayGetCount(v14)) {
          [(HMFWiFiManagerDataSource *)v7 startWithWiFiDevice:CFArrayGetValueAtIndex(v15, 0)];
        }
        CFRelease(v15);
      }
      [(HMFWiFiManagerDataSource *)v7 _registerForCaptiveStateChanges];
    }
    else
    {
      v16 = (void *)MEMORY[0x19F3A87A0]();
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier(0);
        *(_DWORD *)buf = 138543362;
        v22 = v18;
        _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_ERROR, "%{public}@[HMFWiFiManagerDataSource] Failed to create WiFiManagerClient", buf, 0xCu);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(HMFWiFiManagerDataSource *)self wifiClientReference])
  {
    v3 = (void *)MEMORY[0x19F3A87A0]();
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Clearing wifi client reference", buf, 0xCu);
    }
    [(HMFWiFiManagerDataSource *)self wifiClientReference];
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    [(HMFWiFiManagerDataSource *)self wifiClientReference];
    WiFiManagerClientRegisterWowStateChangedCallback();
    CFRelease([(HMFWiFiManagerDataSource *)self wifiClientReference]);
  }
  if ([(HMFWiFiManagerDataSource *)self wifiDeviceReference])
  {
    v6 = (void *)MEMORY[0x19F3A87A0]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Clearing wifi device reference", buf, 0xCu);
    }
    [(HMFWiFiManagerDataSource *)self wifiDeviceReference];
    WiFiDeviceClientRegisterExtendedLinkCallback();
    CFRelease([(HMFWiFiManagerDataSource *)self wifiDeviceReference]);
  }
  if ([(HMFWiFiManagerDataSource *)self currentNetwork]) {
    CFRelease([(HMFWiFiManagerDataSource *)self currentNetwork]);
  }
  if ([(HMFWiFiManagerDataSource *)self scStore])
  {
    [(HMFWiFiManagerDataSource *)self scStore];
    SCDynamicStoreRemoveWatchedKey();
    CFRelease([(HMFWiFiManagerDataSource *)self scStore]);
  }
  v9.receiver = self;
  v9.super_class = (Class)HMFWiFiManagerDataSource;
  [(HMFWiFiManagerDataSource *)&v9 dealloc];
}

+ (NSString)MACAddressString
{
  v2 = +[HMFSystemInfo systemInfo];
  v3 = [v2 WiFiInterfaceMACAddress];
  v4 = [v3 formattedString];

  return (NSString *)v4;
}

- (BOOL)isAssertionActive
{
  return WiFiManagerClientGetType() - 1 < 2;
}

- (unint64_t)assertionOptions
{
  return WiFiManagerClientGetType() == 2;
}

- (void)activateWithOptions:(unint64_t)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  v4 = [(HMFWiFiManagerDataSource *)self wifiClientReference];
  MEMORY[0x1F412FF40](v4, v3);
}

- (void)deactivate
{
  v2 = [(HMFWiFiManagerDataSource *)self wifiClientReference];
  MEMORY[0x1F412FF40](v2, 0);
}

- (BOOL)isWoWAsserted
{
  uint64_t v3 = [(HMFWiFiManagerDataSource *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMFWiFiManagerDataSource *)self wifiClientReference];
  return WiFiManagerClientGetWoWState() != 0;
}

- (void)setWoWAsserted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMFWiFiManagerDataSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x19F3A87A0]();
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier(0);
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Calling WiFiManagerClientSetWoWState() with %d", (uint8_t *)&v9, 0x12u);
  }
  [(HMFWiFiManagerDataSource *)self wifiClientReference];
  WiFiManagerClientSetWoWState();
}

- (HMFWifiNetworkAssociation)currentNetworkAssociation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMFWiFiManagerDataSource *)self currentNetwork])
  {
    v17 = p_lock;
    v4 = (void *)WiFiCopyCurrentNetworkInfoEx();
    id v5 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"rawRecord");
    [(HMFWiFiManagerDataSource *)self currentNetwork];
    v18 = WiFiNetworkGetSSID();
    [(HMFWiFiManagerDataSource *)self currentNetwork];
    int v6 = WiFiNetworkRequiresPassword();
    v7 = +[HMFSystemInfo systemInfo];
    v8 = [v7 WiFiInterfaceMACAddress];

    [(HMFWiFiManagerDataSource *)self currentNetwork];
    int v9 = (void *)WiFiNetworkCopyBSSIDData();
    if (v9) {
      v10 = [[HMFMACAddress alloc] initWithAddressData:v9];
    }
    else {
      v10 = 0;
    }
    BOOL v12 = objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x1E4F78C38]);
    uint64_t v13 = v4;
    CFArrayRef v14 = objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x1E4F78C40]);
    if (v14) {
      CFArrayRef v15 = [[HMFMACAddress alloc] initWithMACAddressString:v14];
    }
    else {
      CFArrayRef v15 = 0;
    }
    __int16 v11 = 0;
    if (v18 && v8 && v10 && v12 && v15) {
      __int16 v11 = [[HMFWifiNetworkAssociation alloc] initWithMACAddress:v8 SSID:v18 requiresPassword:v6 != 0 BSSID:v10 gatewayIPAddress:v12 gatewayMACAddress:v15];
    }

    p_lock = v17;
  }
  else
  {
    __int16 v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (NSNumber)currentNetworkRSSI
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMFWiFiManagerDataSource *)self currentNetwork])
  {
    v4 = NSNumber;
    [(HMFWiFiManagerDataSource *)self currentNetwork];
    id v5 = [v4 numberWithInt:WiFiNetworkGetRSSI()];
  }
  else
  {
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (NSNumber *)v5;
}

- (BOOL)isCaptive
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  [(NSLock *)self->_captiveCachedLock lock];
  int captiveCached = self->_captiveCached;
  if (!captiveCached)
  {
    id v5 = (void *)WiFiCopyCurrentNetworkInfo();
    if (v5)
    {
      if (CFDictionaryGetInt64()) {
        int v6 = 6;
      }
      else {
        int v6 = 5;
      }
      self->_int captiveCached = v6;
    }
    else
    {
      v7 = (void *)MEMORY[0x19F3A87A0]();
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v9 = HMFGetLogIdentifier(0);
        int v15 = 138543362;
        v16 = v9;
        _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@[HMFWiFiManagerDataSource] isCaptive: WiFi info not found", (uint8_t *)&v15, 0xCu);
      }
    }

    int captiveCached = self->_captiveCached;
  }
  v10 = (void *)MEMORY[0x19F3A87A0]([(NSLock *)self->_captiveCachedLock unlock]);
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    BOOL v12 = HMFGetLogIdentifier(0);
    CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
    int v15 = 138543874;
    v16 = v12;
    __int16 v17 = 2048;
    double v18 = v13 - Current;
    __int16 v19 = 1024;
    BOOL v20 = captiveCached == 6;
    _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[HMFWiFiManagerDataSource] isCaptive took %.02f seconds (captive: %d)", (uint8_t *)&v15, 0x1Cu);
  }
  return captiveCached == 6;
}

- (void)_invalidateCaptiveState
{
  [(NSLock *)self->_captiveCachedLock lock];
  [(HMFWiFiManagerDataSource *)self setCaptiveCached:0];
  captiveCachedLock = self->_captiveCachedLock;
  [(NSLock *)captiveCachedLock unlock];
}

- (void)performBlockAfterWoWReassertionDelay:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFWiFiManagerDataSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  v7 = [(HMFWiFiManagerDataSource *)self workQueue];
  dispatch_after(v6, v7, v4);
}

- (void)startWithWiFiDevice:(__WiFiDeviceClient *)a3
{
  id v5 = [(HMFWiFiManagerDataSource *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HMFWiFiManagerDataSource_startWithWiFiDevice___block_invoke;
  v6[3] = &unk_1E59587E8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __48__HMFWiFiManagerDataSource_startWithWiFiDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  BOOL v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = HMFGetLogIdentifier(0);
    int v12 = 138543362;
    CFAbsoluteTime v13 = v4;
    _os_log_impl(&dword_19D57B000, v3, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Initializing WiFi Device", (uint8_t *)&v12, 0xCu);
  }
  if ([*(id *)(a1 + 32) wifiDeviceReference])
  {
    id v5 = (void *)MEMORY[0x19F3A87A0]();
    dispatch_time_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier(0);
      int v12 = 138543362;
      CFAbsoluteTime v13 = v7;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Clearing previous reference", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) wifiDeviceReference];
    WiFiDeviceClientRegisterExtendedLinkCallback();
    CFRelease((CFTypeRef)[*(id *)(a1 + 32) wifiDeviceReference]);
  }
  [*(id *)(a1 + 32) setWifiDeviceReference:CFRetain(*(CFTypeRef *)(a1 + 40))];
  [*(id *)(a1 + 32) wifiDeviceReference];
  WiFiDeviceClientRegisterExtendedLinkCallback();
  [*(id *)(a1 + 32) wifiDeviceReference];
  v8 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
  int v9 = (void *)MEMORY[0x19F3A87A0]();
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier(0);
    int v12 = 138543618;
    CFAbsoluteTime v13 = v11;
    __int16 v14 = 2112;
    int v15 = v8;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Initialized WiFi Device with current network: %@", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(a1 + 32) _setCurrentNetwork:v8];
  if (v8) {
    CFRelease(v8);
  }
}

- (void)handleWiFiLinkChangedWithEventDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFWiFiManagerDataSource *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HMFWiFiManagerDataSource_handleWiFiLinkChangedWithEventDictionary___block_invoke;
  v7[3] = &unk_1E5957730;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__HMFWiFiManagerDataSource_handleWiFiLinkChangedWithEventDictionary___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", @"LINK_CHANGED_IS_LINKDOWN");
  int v3 = [v2 BOOLValue];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"LINK_CHANGED_NETWORK"];

  id v5 = (void *)MEMORY[0x19F3A87A0]();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier(0);
    id v8 = (void *)v7;
    int v9 = @"Up";
    if (v3) {
      int v9 = @"Down";
    }
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] WiFi link is %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [*(id *)(a1 + 40) delegate];
  [v10 dataSource:*(void *)(a1 + 40) didChangeLinkAvailability:v3 ^ 1u];

  [*(id *)(a1 + 40) _setCurrentNetwork:v4];
}

- (void)_setCurrentNetwork:(__WiFiNetwork *)a3
{
  id v5 = [(HMFWiFiManagerDataSource *)self workQueue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  if ([(HMFWiFiManagerDataSource *)self currentNetwork] == a3)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if ([(HMFWiFiManagerDataSource *)self currentNetwork]) {
      CFRelease([(HMFWiFiManagerDataSource *)self currentNetwork]);
    }
    [(HMFWiFiManagerDataSource *)self setCurrentNetwork:a3];
    if ([(HMFWiFiManagerDataSource *)self currentNetwork]) {
      CFRetain([(HMFWiFiManagerDataSource *)self currentNetwork]);
    }
    [(HMFWiFiManagerDataSource *)self _invalidateCaptiveState];
    os_unfair_lock_unlock(&self->_lock);
    id v6 = [(HMFWiFiManagerDataSource *)self delegate];
    [v6 currentNetworkDidChangeForDataSource:self];
  }
}

- (void)_registerForCaptiveStateChanges
{
  v5.version = 0;
  memset(&v5.retain, 0, 24);
  v5.info = self;
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(0, @"HMFWiFiManager", (SCDynamicStoreCallBack)dynamicStoreCallback, &v5);
  if (v3)
  {
    id v4 = v3;
    if (SCDynamicStoreAddWatchedKey())
    {
      if (SCDynamicStoreSetDispatchQueue(v4, (dispatch_queue_t)self->_workQueue)) {
        self->_scStore = v4;
      }
    }
  }
}

- (HMFWiFiManagerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFWiFiManagerDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (__WiFiManagerClient)wifiClientReference
{
  return self->_wifiClientReference;
}

- (__WiFiDeviceClient)wifiDeviceReference
{
  return self->_wifiDeviceReference;
}

- (void)setWifiDeviceReference:(__WiFiDeviceClient *)a3
{
  self->_wifiDeviceReference = a3;
}

- (__WiFiNetwork)currentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(__WiFiNetwork *)a3
{
  self->_currentNetwork = a3;
}

- (__SCDynamicStore)scStore
{
  return self->_scStore;
}

- (void)setScStore:(__SCDynamicStore *)a3
{
  self->_scStore = a3;
}

- (NSLock)captiveCachedLock
{
  return self->_captiveCachedLock;
}

- (void)setCaptiveCachedLock:(id)a3
{
}

- (int)captiveCached
{
  return self->_captiveCached;
}

- (void)setCaptiveCached:(int)a3
{
  self->_int captiveCached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captiveCachedLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end