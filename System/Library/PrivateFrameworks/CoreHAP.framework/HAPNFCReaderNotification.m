@interface HAPNFCReaderNotification
+ (void)start;
- (HAPNFCReaderNotification)init;
- (HAPNFCReaderXPC)nfcHomeKit;
- (HAPNFCReaderXPC)tagProxCard;
- (id)_initializeNFCStream:(id)a3 withSource:(unint64_t)a4 workQueue:(id)a5 backgroundReadingSupported:(BOOL)a6;
- (id)setupNotificationDictionaryWithNFCData:(id)a3;
- (void)_initializeHomeKitNFCStreamWithQueue:(id)a3 backgroundReadingSupported:(BOOL)a4;
- (void)_initializeProxCardStreamWithQueue:(id)a3 backgroundReadingSupported:(BOOL)a4;
- (void)_sendHomeNotificationForSource:(unint64_t)a3 withDictionary:(id)a4;
- (void)nfcStreamIndicationFromSource:(unint64_t)a3 withPayload:(id)a4;
- (void)setNfcHomeKit:(id)a3;
- (void)setTagProxCard:(id)a3;
@end

@implementation HAPNFCReaderNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagProxCard, 0);

  objc_storeStrong((id *)&self->_nfcHomeKit, 0);
}

- (void)setTagProxCard:(id)a3
{
}

- (HAPNFCReaderXPC)tagProxCard
{
  return (HAPNFCReaderXPC *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNfcHomeKit:(id)a3
{
}

- (HAPNFCReaderXPC)nfcHomeKit
{
  return (HAPNFCReaderXPC *)objc_getProperty(self, a2, 8, 1);
}

- (id)setupNotificationDictionaryWithNFCData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:v4 forKey:@"kHAPNFCData"];

  return v5;
}

- (void)_sendHomeNotificationForSource:(unint64_t)a3 withDictionary:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 1)
  {
    v14 = (void *)MEMORY[0x1D944E080]();
    v8 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v16;
      __int16 v23 = 2112;
      unint64_t v24 = (unint64_t)v6;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending HAPNFCStreamSource_AccessorySetupPayload notification with dictionary %@", (uint8_t *)&v21, 0x16u);
    }
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v12 = v11;
    v13 = @"kHAPNFCProxSetupNotification";
    goto LABEL_9;
  }
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1D944E080]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v10;
      __int16 v23 = 2112;
      unint64_t v24 = (unint64_t)v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending HAPNFCStreamSource_HKField notification with dictionary %@", (uint8_t *)&v21, 0x16u);
    }
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v12 = v11;
    v13 = @"kHapTapNotification";
LABEL_9:
    [v11 postNotificationName:v13 object:v8 userInfo:v6];

    goto LABEL_13;
  }
  v17 = (void *)MEMORY[0x1D944E080]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v20;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unknown notifySource %lu", (uint8_t *)&v21, 0x16u);
  }
LABEL_13:
}

- (HAPNFCReaderNotification)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HAPNFCReaderNotification;
  v2 = [(HAPNFCReaderNotification *)&v16 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1D944E080]();
    id v4 = v2;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Initializing NFC streams", buf, 0xCu);
    }
    v7 = (const char *)HAPDispatchQueueName(v4, 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);

    v10 = (void *)MEMORY[0x1E4F7A098];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__HAPNFCReaderNotification_init__block_invoke;
    v13[3] = &unk_1E69F2350;
    dispatch_queue_t v14 = v9;
    v15 = v4;
    v11 = v9;
    [v10 sharedHardwareManager:v13];
  }
  return v2;
}

void __32__HAPNFCReaderNotification_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HAPNFCReaderNotification_init__block_invoke_2;
  block[3] = &unk_1E69F4708;
  id v5 = v3;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  dispatch_async(v4, block);
  id v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = *(id *)(a1 + 40);
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Completed initializing NFC streams", buf, 0xCu);
  }
}

uint64_t __32__HAPNFCReaderNotification_init__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isBackgroundTagReadingAvailable];
  uint64_t result = [*(id *)(a1 + 40) _initializeHomeKitNFCStreamWithQueue:*(void *)(a1 + 48) backgroundReadingSupported:v2];
  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v4 _initializeProxCardStreamWithQueue:v5 backgroundReadingSupported:1];
  }
  return result;
}

- (void)nfcStreamIndicationFromSource:(unint64_t)a3 withPayload:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D944E080]();
  v8 = self;
  dispatch_queue_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v12 = 138543874;
    id v13 = v10;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@NFC from source %lu with data: %@", (uint8_t *)&v12, 0x20u);
  }
  id v11 = [(HAPNFCReaderNotification *)v8 setupNotificationDictionaryWithNFCData:v6];
  [(HAPNFCReaderNotification *)v8 _sendHomeNotificationForSource:a3 withDictionary:v11];
}

- (void)_initializeProxCardStreamWithQueue:(id)a3 backgroundReadingSupported:(BOOL)a4
{
  id v5 = [(HAPNFCReaderNotification *)self _initializeNFCStream:@"com.apple.nfcd.homekit.proxcard" withSource:1 workQueue:a3 backgroundReadingSupported:a4];
  [(HAPNFCReaderNotification *)self setTagProxCard:v5];
}

- (void)_initializeHomeKitNFCStreamWithQueue:(id)a3 backgroundReadingSupported:(BOOL)a4
{
  id v5 = [(HAPNFCReaderNotification *)self _initializeNFCStream:@"com.apple.nfcd.homekit.field" withSource:0 workQueue:a3 backgroundReadingSupported:a4];
  [(HAPNFCReaderNotification *)self setNfcHomeKit:v5];
}

- (id)_initializeNFCStream:(id)a3 withSource:(unint64_t)a4 workQueue:(id)a5 backgroundReadingSupported:(BOOL)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  int v12 = (void *)MEMORY[0x1D944E080]();
  id v13 = self;
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unint64_t v15 = HMFGetLogIdentifier();
    int v24 = 138543874;
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    unint64_t v27 = (unint64_t)v10;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@Initializing NFC session: %@ %lu", (uint8_t *)&v24, 0x20u);
  }
  __int16 v16 = (void *)MEMORY[0x1D944E080]();
  id v17 = v13;
  uint64_t v18 = HMFGetOSLogHandle();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (a4 != 1 || a6)
  {
    if (v19)
    {
      v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      uint64_t v25 = v22;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@Initializing nfc xpc for source %lu", (uint8_t *)&v24, 0x16u);
    }
    id v21 = [[HAPNFCReaderXPC alloc] initReaderWithStream:v10 fromSource:a4 workQueue:v11 readerStream:v17];
    [v21 beginSession];
  }
  else
  {
    if (v19)
    {
      v20 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v20;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@Background tag reading not supported on this platform", (uint8_t *)&v24, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

+ (void)start
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__HAPNFCReaderNotification_start__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (start_onceToken != -1) {
    dispatch_once(&start_onceToken, block);
  }
}

uint64_t __33__HAPNFCReaderNotification_start__block_invoke(uint64_t a1)
{
  start_hapNFCReaderNotification = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end