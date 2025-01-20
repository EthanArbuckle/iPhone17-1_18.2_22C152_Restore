@interface ADASPreferenceStore
+ (id)sharedInstance;
- (ADASPreferenceStore)init;
- (NPSDomainAccessor)coreAudioDeviceDomain;
- (NPSDomainAccessor)coreAudioDomain;
- (NSDictionary)defaultValues;
- (NSDictionary)keyMap;
- (NSDictionary)specialDarwinKeys;
- (void)initNPSDomain;
- (void)pairedDeviceStateChanged:(id)a3;
- (void)registerForNotifications;
- (void)setCoreAudioDeviceDomain:(id)a3;
- (void)setCoreAudioDomain:(id)a3;
@end

@implementation ADASPreferenceStore

- (NSDictionary)keyMap
{
  return self->_keyMap;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __37__ADASPreferenceStore_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(ADASPreferenceStore);

  return MEMORY[0x270F9A758]();
}

- (void)pairedDeviceStateChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_npsDomainLock);
  v5 = ADAFLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_21873E000, v5, OS_LOG_TYPE_DEFAULT, "NPSDomainAccessor state change: %@", (uint8_t *)&v8, 0xCu);
  }

  coreAudioDomain = self->_coreAudioDomain;
  self->_coreAudioDomain = 0;

  coreAudioDeviceDomain = self->_coreAudioDeviceDomain;
  self->_coreAudioDeviceDomain = 0;

  os_unfair_lock_unlock(&self->_npsDomainLock);
}

- (void)registerForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_pairedDeviceStateChanged_ name:*MEMORY[0x263F57688] object:0];
  [v3 addObserver:self selector:sel_pairedDeviceStateChanged_ name:*MEMORY[0x263F57690] object:0];
  [v3 addObserver:self selector:sel_pairedDeviceStateChanged_ name:*MEMORY[0x263F576A8] object:0];
  [v3 addObserver:self selector:sel_pairedDeviceStateChanged_ name:*MEMORY[0x263F576B8] object:0];
}

- (void)initNPSDomain
{
  if (!self->_coreAudioDomain || !self->_coreAudioDeviceDomain)
  {
    npsDomainAccessorQueue = self->_npsDomainAccessorQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__ADASPreferenceStore_initNPSDomain__block_invoke;
    block[3] = &unk_2643373B0;
    block[4] = self;
    dispatch_async(npsDomainAccessorQueue, block);
  }
}

void __36__ADASPreferenceStore_initNPSDomain__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 48))
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.coreaudio"];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 56))
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.coreaudio.device"];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v6;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
}

- (ADASPreferenceStore)init
{
  v25.receiver = self;
  v25.super_class = (Class)ADASPreferenceStore;
  uint64_t v2 = [(ADASPreferenceStore *)&v25 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_npsDomainLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.coreaudio.adam.nps", 0);
    npsDomainAccessorQueue = v3->_npsDomainAccessorQueue;
    v3->_npsDomainAccessorQueue = (OS_dispatch_queue *)v4;

    coreAudioDomain = v3->_coreAudioDomain;
    v3->_coreAudioDomain = 0;

    coreAudioDeviceDomain = v3->_coreAudioDeviceDomain;
    v3->_coreAudioDeviceDomain = 0;

    [(ADASPreferenceStore *)v3 initNPSDomain];
    [(ADASPreferenceStore *)v3 registerForNotifications];
    objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"VolumeLimitEnabled", @"_ADAFPreferenceKeyVolumeLimitEnabled", @"VolumeLimitThreshold", @"_ADAFPreferenceKeyVolumeLimitThreshold", @"LoudnessCompensationEnabled", @"_ADAFPreferenceKeyLoudnessCompensationEnabled", @"EnableHAELiveMonitor", @"_ADAFPreferenceKeyHAENotificationFeatureEnabled", @"HAENSampleTransient", @"_ADAFPreferenceKeyHAESampleTransient", @"EnableHAEHKWrite", @"_ADAFPreferenceKeyHAEEnableHKWrite", @"EnableHAEOtherDevices", @"_ADAFPreferenceKeyHAEEnableOtherDevices", @"UnknownDeviceIsHeadphone", @"_ADAFPreferenceKeyConnectedWiredDeviceIsHeadphone", @"HAENVolumeReductionDelta",
      @"_ADAFPreferenceKeyVolumeReductionDelta",
      @"HAELiveMonitorThreshold",
      @"_ADAFPreferenceKeyHAENotificationLiveThreshold",
      @"HAELiveMonitorWindowInSecond",
      @"_ADAFPreferenceKeyHAENotificationLiveWindowInSeconds",
      @"HAENKnownAccessories",
      @"_ADAFPreferenceKeyKnownAccessories",
      @"HAENKnownAccessoryExpiryDays",
      @"_ADAFPreferenceKeyHAENKnownAccessoryExpiryDays",
      @"MXVolumeLimitOn",
      @"_ADAFPreferenceKeyMXVolumeLimitOn",
      @"HAENRegionCode",
      @"_ADAFPreferenceKeyHAENDeviceCountryCodeOverride",
      @"HAENDeviceProductTypeOverride",
      @"_ADAFPreferenceKeyHAENDeviceProductTypeOverride",
    uint64_t v8 = 0);
    keyMap = v3->_keyMap;
    v3->_keyMap = (NSDictionary *)v8;

    uint64_t v10 = (void *)MGGetStringAnswer();
    uint64_t v11 = [v10 isEqualToString:@"iPad"] ^ 1;
    v12 = NSDictionary;
    v13 = [NSNumber numberWithBool:0];
    v14 = [NSNumber numberWithBool:v11];
    v15 = [NSNumber numberWithBool:0];
    v16 = [NSNumber numberWithInt:85];
    v17 = [NSNumber numberWithDouble:0.0625];
    v18 = [NSNumber numberWithDouble:14.0];
    v19 = [NSNumber numberWithBool:1];
    uint64_t v20 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, @"VolumeLimitEnabled", v14, @"EnableHAEHKWrite", v15, @"EnableHAEOtherDevices", v16, @"VolumeLimitThreshold", v17, @"HAENVolumeReductionDelta", v18, @"HAENKnownAccessoryExpiryDays", v19, @"EnableHAELiveMonitor", 0);
    defaultValues = v3->_defaultValues;
    v3->_defaultValues = (NSDictionary *)v20;

    uint64_t v22 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"HAENUnknownWiredDeviceStatusChanged", @"_ADAFPreferenceKeyConnectedWiredDeviceIsHeadphone", @"HAENVolumeLimitStatusDidChange", @"_ADAFPreferenceKeyMXVolumeLimitOn", @"HAENRLSStatusDidChange", @"_ADAFPreferenceKeyVolumeLimitEnabled", @"HAENRLSStatusDidChange", @"_ADAFPreferenceKeyVolumeLimitThreshold", @"HAENKnownAccessoriesDidChange", @"_ADAFPreferenceKeyKnownAccessories", 0);
    specialDarwinKeys = v3->_specialDarwinKeys;
    v3->_specialDarwinKeys = (NSDictionary *)v22;
  }
  return v3;
}

- (NSDictionary)specialDarwinKeys
{
  return self->_specialDarwinKeys;
}

- (NPSDomainAccessor)coreAudioDomain
{
  return self->_coreAudioDomain;
}

- (void)setCoreAudioDomain:(id)a3
{
}

- (NPSDomainAccessor)coreAudioDeviceDomain
{
  return self->_coreAudioDeviceDomain;
}

- (void)setCoreAudioDeviceDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAudioDeviceDomain, 0);
  objc_storeStrong((id *)&self->_coreAudioDomain, 0);
  objc_storeStrong((id *)&self->_specialDarwinKeys, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_keyMap, 0);

  objc_storeStrong((id *)&self->_npsDomainAccessorQueue, 0);
}

@end