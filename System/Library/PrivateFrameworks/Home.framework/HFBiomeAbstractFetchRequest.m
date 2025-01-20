@interface HFBiomeAbstractFetchRequest
- (BMHomeKitClientAccessoryControlStream)accessoryControlStream;
- (BOOL)publisherFilter:(id)a3;
- (HFBiomeAbstractFetchRequest)init;
- (HFBiomeAbstractFetchRequest)initWithHome:(id)a3;
- (HMAccessory)accessory;
- (HMHome)home;
- (HMRoom)room;
- (HMService)service;
- (HMZone)zone;
- (OS_dispatch_queue)workQueue;
- (id)fetch;
- (id)successHandler;
- (void)_fetchWithPromise:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setRoom:(id)a3;
- (void)setService:(id)a3;
- (void)setZone:(id)a3;
@end

@implementation HFBiomeAbstractFetchRequest

- (HFBiomeAbstractFetchRequest)initWithHome:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFBiomeAbstractFetchRequest;
  v6 = [(HFBiomeAbstractFetchRequest *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Home.biomefetchrequest", v9);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

    v12 = (BMHomeKitClientAccessoryControlStream *)objc_alloc_init(MEMORY[0x263F2A7A8]);
    accessoryControlStream = v7->_accessoryControlStream;
    v7->_accessoryControlStream = v12;
  }
  return v7;
}

- (HFBiomeAbstractFetchRequest)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFBiomeAbstractFetchRequest.m", 34, @"%s is unavailable; use %@ instead",
    "-[HFBiomeAbstractFetchRequest init]",
    v5);

  return 0;
}

- (BOOL)publisherFilter:(id)a3
{
  v4 = [a3 eventBody];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = [(HFBiomeAbstractFetchRequest *)self home];
  v6 = [v5 uniqueIdentifier];
  v7 = [v6 UUIDString];
  v8 = [v4 base];
  v9 = [v8 homeUniqueIdentifier];
  int v10 = [v7 isEqualToString:v9];

  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = [(HFBiomeAbstractFetchRequest *)self room];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(HFBiomeAbstractFetchRequest *)self room];
    v14 = [v13 uniqueIdentifier];
    objc_super v15 = [v14 UUIDString];
    v16 = [v4 roomUniqueIdentifier];
    int v17 = [v15 isEqualToString:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  uint64_t v18 = [(HFBiomeAbstractFetchRequest *)self zone];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v4 zoneUniqueIdentifiers];
    v21 = [(HFBiomeAbstractFetchRequest *)self zone];
    v22 = [v21 uniqueIdentifier];
    v23 = [v22 UUIDString];
    int v24 = [v20 containsObject:v23];

    if (!v24) {
      goto LABEL_11;
    }
  }
  uint64_t v25 = [(HFBiomeAbstractFetchRequest *)self accessory];
  if (!v25) {
    goto LABEL_9;
  }
  v26 = (void *)v25;
  v27 = [(HFBiomeAbstractFetchRequest *)self accessory];
  v28 = [v27 uniqueIdentifier];
  v29 = [v28 UUIDString];
  v30 = [v4 accessoryUniqueIdentifier];
  int v31 = [v29 isEqualToString:v30];

  if (v31)
  {
LABEL_9:
    uint64_t v32 = [(HFBiomeAbstractFetchRequest *)self service];
    if (v32)
    {
      v33 = (void *)v32;
      v34 = [(HFBiomeAbstractFetchRequest *)self service];
      v35 = [v34 uniqueIdentifier];
      v36 = [v35 UUIDString];
      v37 = [v4 serviceUniqueIdentifier];
      char v38 = [v36 isEqualToString:v37];
    }
    else
    {
      char v38 = 1;
    }
  }
  else
  {
LABEL_11:
    char v38 = 0;
  }

  return v38;
}

- (id)successHandler
{
  return 0;
}

- (void)_fetchWithPromise:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] distantPast];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  v8 = [(HFBiomeAbstractFetchRequest *)self accessoryControlStream];
  v9 = [v8 publisherFromStartTime:v7];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke;
  v18[3] = &unk_264095638;
  objc_copyWeak(&v19, &location);
  int v10 = [v9 filterWithIsIncluded:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2;
  v15[3] = &unk_264095660;
  id v11 = v4;
  id v16 = v11;
  objc_copyWeak(&v17, &location);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_3;
  v13[3] = &unk_264095688;
  objc_copyWeak(&v14, &location);
  id v12 = (id)[v10 sinkWithCompletion:v15 receiveInput:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained publisherFilter:v3];

  return v5;
}

void __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = HFLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = [v3 error];
      *(_DWORD *)buf = 136315394;
      id v16 = "-[HFBiomeAbstractFetchRequest _fetchWithPromise:]_block_invoke_2";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_10;
    block[3] = &unk_26408D450;
    id v13 = *(id *)(a1 + 32);
    id v14 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v5 = v13;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v7 = [WeakRetained successHandler];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2_12;
    v9[3] = &unk_26408D450;
    id v10 = v7;
    id v11 = *(id *)(a1 + 32);
    id v5 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_10(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) error];
  [v1 finishWithError:v2];
}

uint64_t __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_2_12(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "finishWithResult:");
  }
  else {
    return [v1 finishWithNoResult];
  }
}

void __49__HFBiomeAbstractFetchRequest__fetchWithPromise___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)MEMORY[0x21053EE50]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained eventHandler:v5];
}

- (id)fetch
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__HFBiomeAbstractFetchRequest_fetch__block_invoke;
  v4[3] = &unk_26408E4E0;
  v4[4] = self;
  uint64_t v2 = [MEMORY[0x263F58190] futureWithBlock:v4];
  return v2;
}

void __36__HFBiomeAbstractFetchRequest_fetch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[HFUtilities isInternalTest];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _fetchWithPromise:v3];
  }
  else
  {
    double v6 = [v5 workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__HFBiomeAbstractFetchRequest_fetch__block_invoke_2;
    v7[3] = &unk_26408D450;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __36__HFBiomeAbstractFetchRequest_fetch__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWithPromise:*(void *)(a1 + 40)];
}

- (HMHome)home
{
  return (HMHome *)objc_getProperty(self, a2, 8, 1);
}

- (HMRoom)room
{
  return (HMRoom *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRoom:(id)a3
{
}

- (HMZone)zone
{
  return (HMZone *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZone:(id)a3
{
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessory:(id)a3
{
}

- (HMService)service
{
  return (HMService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (BMHomeKitClientAccessoryControlStream)accessoryControlStream
{
  return (BMHomeKitClientAccessoryControlStream *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryControlStream, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end