@interface HMDResidentLocationHandler
+ (id)cachedResidentLocationPath;
+ (id)logCategory;
+ (void)deleteCachedResidentLocation;
- (HMDHome)home;
- (HMDResidentLocationHandler)initWithHome:(id)a3 queue:(id)a4 messageDispatcher:(id)a5;
- (HMDResidentLocationHandler)initWithHome:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 locationProvider:(id)a6;
- (HMDResidentLocationProvider)residentLocationProvider;
- (HMFMessageDispatcher)messageDispatcher;
- (NSNumber)residentLocationRawValue;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)_cachedResidentLocationRawValue;
- (id)logIdentifier;
- (unint64_t)_residentLocationFromHomeLocation:(id)a3 location:(id)a4;
- (void)_cacheResidentLocationRawValue:(id)a3;
- (void)_determineHomeOrAwayUsingElector:(id)a3 location:(id)a4 withCompletion:(id)a5;
- (void)_handleDetermineResidentLocationMessage:(id)a3;
- (void)_sendResidentLocationMessageToElector:(id)a3 location:(id)a4 completion:(id)a5;
- (void)_updateToUnknownIfNoCachedLocation;
- (void)configure;
- (void)determineHomeOrAwayUsingElector:(id)a3 withCompletion:(id)a4;
- (void)requestResidentLocation;
- (void)setHome:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setResidentLocationProvider:(id)a3;
- (void)setResidentLocationRawValue:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDResidentLocationHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentLocationProvider, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_residentLocationRawValue, 0);
}

- (void)setResidentLocationProvider:(id)a3
{
}

- (HMDResidentLocationProvider)residentLocationProvider
{
  return self->_residentLocationProvider;
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setResidentLocationRawValue:(id)a3
{
}

- (NSNumber)residentLocationRawValue
{
  return self->_residentLocationRawValue;
}

- (void)_handleDetermineResidentLocationMessage:(id)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDResidentLocationHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 messagePayload];
  v7 = objc_msgSend(v6, "hm_locationFromDataForKey:", @"drl.el");
  if (v7)
  {
    v8 = [(HMDResidentLocationHandler *)self home];
    v9 = [v8 homeLocationHandler];
    v10 = [v9 location];

    if (v10)
    {
      uint64_t v11 = [(HMDResidentLocationHandler *)self _residentLocationFromHomeLocation:v10 location:v7];
      v12 = [v4 remoteSourceDevice];
      v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        StringFromHMDResidentLocation(v11);
        v17 = v29 = v13;
        [v12 shortDescription];
        v18 = uint64_t v30 = v11;
        *(_DWORD *)buf = 138543874;
        v34 = v16;
        __int16 v35 = 2112;
        v36 = v17;
        __int16 v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@We are the elector, determined location of: %@ for resident device: %@", buf, 0x20u);

        uint64_t v11 = v30;
        v13 = v29;
      }
      v31 = @"drl.dl";
      v19 = [NSNumber numberWithUnsignedInteger:v11];
      v32 = v19;
      v20 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      [v4 respondWithPayload:v20];
    }
    else
    {
      v25 = (void *)MEMORY[0x230FBD990]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v34 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Home location is nil when handling determine resident location message", buf, 0xCu);
      }
      v39 = @"drl.dl";
      v40 = &unk_26E473090;
      v12 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      [v4 respondWithPayload:v12];
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Determine resident location message payload: %@ did not contain resident location", buf, 0x16u);
    }
    v41 = @"drl.dl";
    v42[0] = &unk_26E473090;
    v10 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    [v4 respondWithPayload:v10];
  }
}

- (void)_sendResidentLocationMessageToElector:(id)a3 location:(id)a4 completion:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a3;
  v9 = encodeRootObject();
  v20 = @"drl.el";
  v21[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v11 = [HMDRemoteDeviceMessageDestination alloc];
  v12 = [(HMDResidentLocationHandler *)self messageTargetUUID];
  v13 = [v8 device];

  v14 = [(HMDRemoteDeviceMessageDestination *)v11 initWithTarget:v12 device:v13];
  v15 = [[HMDRemoteMessage alloc] initWithName:@"HMDDetermineResidentDeviceLocationMessage" qualityOfService:25 destination:v14 payload:v10 type:0 timeout:1 secure:30.0 restriction:-1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__HMDResidentLocationHandler__sendResidentLocationMessageToElector_location_completion___block_invoke;
  v18[3] = &unk_264A273E0;
  id v19 = v7;
  id v16 = v7;
  [(HMDRemoteMessage *)v15 setResponseHandler:v18];
  v17 = [(HMDResidentLocationHandler *)self messageDispatcher];
  [v17 sendMessage:v15 completionHandler:0];
}

void __88__HMDResidentLocationHandler__sendResidentLocationMessageToElector_location_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "hmf_numberForKey:", @"drl.dl");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_determineHomeOrAwayUsingElector:(id)a3 location:(id)a4 withCompletion:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDResidentLocationHandler *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    id v16 = [v8 shortDescription];
    *(_DWORD *)buf = 138543874;
    v40 = v15;
    __int16 v41 = 2112;
    v42 = v16;
    __int16 v43 = 2112;
    id v44 = v9;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Determining resident home/away using elector: %@ location: %@", buf, 0x20u);
  }
  if ([v8 isCurrentDevice])
  {
    v17 = [(HMDResidentLocationHandler *)v13 home];
    v18 = [v17 homeLocationHandler];
    id v19 = [v18 location];

    if (v19)
    {
      uint64_t v20 = [(HMDResidentLocationHandler *)v13 _residentLocationFromHomeLocation:v19 location:v9];
      v21 = [NSNumber numberWithUnsignedInteger:v20];
      [(HMDResidentLocationHandler *)v13 setResidentLocationRawValue:v21];

      v22 = [NSNumber numberWithUnsignedInteger:v20];
      [(HMDResidentLocationHandler *)v13 _cacheResidentLocationRawValue:v22];

      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = v13;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        v27 = StringFromHMDResidentLocation(v20);
        *(_DWORD *)buf = 138543618;
        v40 = v26;
        __int16 v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@We are the elector, determined we are: %@", buf, 0x16u);
      }
      v28 = _Block_copy(v10);
      v29 = v28;
      if (v28) {
        (*((void (**)(void *, void))v28 + 2))(v28, 0);
      }
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x230FBD990]();
      v31 = v13;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v40 = v33;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@We are the elector, home location is nil, defaulting to unknown", buf, 0xCu);
      }
      [(HMDResidentLocationHandler *)v31 _updateToUnknownIfNoCachedLocation];
      v29 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      v34 = _Block_copy(v10);
      __int16 v35 = v34;
      if (v34) {
        (*((void (**)(void *, void *))v34 + 2))(v34, v29);
      }
    }
  }
  else
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke;
    v36[3] = &unk_264A273B8;
    v36[4] = v13;
    id v37 = v8;
    id v38 = v10;
    [(HMDResidentLocationHandler *)v13 _sendResidentLocationMessageToElector:v37 location:v9 completion:v36];
  }
}

void __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke_2;
  block[3] = &unk_264A2DDC0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = *(id *)(a1 + 48);
  id v17 = v6;
  id v18 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v7, block);
}

void __87__HMDResidentLocationHandler__determineHomeOrAwayUsingElector_location_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = [v4 unsignedIntegerValue];
    id v6 = *(void **)(a1 + 40);
    if (v5 != 100)
    {
      [v6 setResidentLocationRawValue:v4];
      [*(id *)(a1 + 40) _cacheResidentLocationRawValue:v4];
      goto LABEL_11;
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 48) shortDescription];
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Did not receive a determined resident location back from elector: %@, defaulting to unknown", (uint8_t *)&v14, 0x16u);
    }
    id v6 = *(void **)(a1 + 40);
  }
  [v6 _updateToUnknownIfNoCachedLocation];
LABEL_11:
  id v12 = _Block_copy(*(const void **)(a1 + 64));
  v13 = v12;
  if (v12) {
    (*((void (**)(void *, void))v12 + 2))(v12, *(void *)(a1 + 56));
  }
}

- (unint64_t)_residentLocationFromHomeLocation:(id)a3 location:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 distanceFromLocation:v7];
  double v10 = v9;
  if (v9 >= 1000.0 && fabs(v9 + -1000.0) >= 2.22044605e-16) {
    unint64_t v11 = 200;
  }
  else {
    unint64_t v11 = 300;
  }
  id v12 = (void *)MEMORY[0x230FBD990](v8);
  v13 = self;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    __int16 v16 = StringFromHMDResidentLocation(v11);
    int v18 = 138544386;
    id v19 = v15;
    __int16 v20 = 2112;
    v21 = v16;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2048;
    double v27 = v10;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Resident is: %@ homeLocation: %@ location: %@ distance: %f", (uint8_t *)&v18, 0x34u);
  }

  return v11;
}

- (void)_updateToUnknownIfNoCachedLocation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentLocationHandler *)self _cachedResidentLocationRawValue];
  if ([v3 unsignedIntegerValue] == 100)
  {
    [(HMDResidentLocationHandler *)self setResidentLocationRawValue:&unk_26E473090];
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    uint64_t v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      double v9 = v7;
      __int16 v10 = 2112;
      unint64_t v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Not updating to unknown, cached location exists: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_cacheResidentLocationRawValue:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[HMDResidentLocationHandler cachedResidentLocationPath];
  if (v5)
  {
    id v6 = [v4 stringValue];
    id v13 = 0;
    [v6 writeToFile:v5 atomically:1 encoding:4 error:&v13];
    id v7 = v13;
    int v8 = (void *)MEMORY[0x230FBD990]();
    double v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Caching resident location: %@ succeeded: %@ with error: %@", buf, 0x2Au);
    }
  }
}

- (id)_cachedResidentLocationRawValue
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = +[HMDResidentLocationHandler cachedResidentLocationPath];
  if (v3)
  {
    id v4 = [NSString stringWithContentsOfFile:v3 encoding:4 error:0];
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
      id v6 = [v5 numberFromString:v4];
      id v7 = (void *)MEMORY[0x230FBD990]();
      int v8 = self;
      double v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = HMFGetLogIdentifier();
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2112;
        uint64_t v15 = v6;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded cached resident location: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      id v6 = &unk_26E473090;
    }
  }
  else
  {
    id v6 = &unk_26E473090;
  }

  return v6;
}

- (id)logIdentifier
{
  id v2 = [(HMDResidentLocationHandler *)self home];
  v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (NSUUID)messageTargetUUID
{
  id v2 = [(HMDResidentLocationHandler *)self home];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)determineHomeOrAwayUsingElector:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x263F42520]);
    double v9 = [(HMDResidentLocationHandler *)self workQueue];
    __int16 v10 = (void *)[v8 initWithQueue:v9];

    unint64_t v11 = [(HMDResidentLocationHandler *)self residentLocationProvider];
    int v12 = [v11 locationUpdatedFuture];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke;
    v21[3] = &unk_264A27390;
    v21[4] = self;
    id v23 = v7;
    id v22 = v6;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke_100;
    v19[3] = &unk_264A2A808;
    v19[4] = self;
    id v20 = v23;
    id v13 = (id)[v12 inContext:v10 then:v21 orRecover:v19];
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@No elector, defaulting to unknown", buf, 0xCu);
    }
    [(HMDResidentLocationHandler *)v15 _updateToUnknownIfNoCachedLocation];
    __int16 v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    __int16 v18 = _Block_copy(v7);
    int v12 = v18;
    if (v18) {
      (*((void (**)(void *, void *))v18 + 2))(v18, v10);
    }
  }
}

uint64_t __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v17 = 138543362;
    __int16 v18 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Resident location request resolved", (uint8_t *)&v17, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) residentLocationProvider];
  double v9 = [v8 location];

  if (v9)
  {
    [*(id *)(a1 + 32) _determineHomeOrAwayUsingElector:*(void *)(a1 + 40) location:v9 withCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      __int16 v18 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Resident location is nil, defaulting to Unknown", (uint8_t *)&v17, 0xCu);
    }
    [*(id *)(a1 + 32) _updateToUnknownIfNoCachedLocation];
    __int16 v14 = (void (**)(void *, void *))_Block_copy(*(const void **)(a1 + 48));
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      v14[2](v14, v15);
    }
  }

  return 1;
}

uint64_t __77__HMDResidentLocationHandler_determineHomeOrAwayUsingElector_withCompletion___block_invoke_100(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v11 = 138543618;
    int v12 = v7;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Resident location request encountered error: %@, defaulting to Unknown", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) _updateToUnknownIfNoCachedLocation];
  id v8 = _Block_copy(*(const void **)(a1 + 40));
  double v9 = v8;
  if (v8) {
    (*((void (**)(void *, id))v8 + 2))(v8, v3);
  }

  return 1;
}

- (void)requestResidentLocation
{
  id v2 = [(HMDResidentLocationHandler *)self residentLocationProvider];
  [v2 requestResidentLocation];
}

- (void)configure
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = +[HMDRemoteMessagePolicy defaultPolicy];
  [v3 setRequiresSecureMessage:1];
  objc_msgSend(v3, "setRoles:", objc_msgSend(v3, "roles") | 4);
  id v4 = (void *)[v3 copy];
  id v5 = [(HMDResidentLocationHandler *)self home];
  id v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:3 remoteAccessRequired:0];

  id v7 = [(HMDResidentLocationHandler *)self messageDispatcher];
  v10[0] = v4;
  v10[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [v7 registerForMessage:@"HMDDetermineResidentDeviceLocationMessage" receiver:self policies:v8 selector:sel__handleDetermineResidentLocationMessage_];

  double v9 = [(HMDResidentLocationHandler *)self _cachedResidentLocationRawValue];
  if ([v9 unsignedIntegerValue] != 100) {
    [(HMDResidentLocationHandler *)self setResidentLocationRawValue:v9];
  }
}

- (HMDResidentLocationHandler)initWithHome:(id)a3 queue:(id)a4 messageDispatcher:(id)a5 locationProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDResidentLocationHandler;
  id v14 = [(HMDResidentLocationHandler *)&v18 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    objc_storeStrong((id *)&v15->_workQueue, a4);
    objc_storeStrong((id *)&v15->_messageDispatcher, a5);
    residentLocationRawValue = v15->_residentLocationRawValue;
    v15->_residentLocationRawValue = (NSNumber *)&unk_26E473090;

    objc_storeStrong((id *)&v15->_residentLocationProvider, a6);
  }

  return v15;
}

- (HMDResidentLocationHandler)initWithHome:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDResidentLocationProvider);
  id v12 = [(HMDResidentLocationHandler *)self initWithHome:v10 queue:v9 messageDispatcher:v8 locationProvider:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_212554 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_212554, &__block_literal_global_212555);
  }
  id v2 = (void *)logCategory__hmf_once_v12_212556;
  return v2;
}

void __41__HMDResidentLocationHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v12_212556;
  logCategory__hmf_once_v12_212556 = v0;
}

+ (void)deleteCachedResidentLocation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = +[HMDResidentLocationHandler cachedResidentLocationPath];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08850] defaultManager];
    id v9 = 0;
    [v3 removeItemAtPath:v2 error:&v9];
    id v4 = v9;

    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v2;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removing cache file: %@ succeeded: %@ with error: %@", buf, 0x2Au);
    }
  }
}

+ (id)cachedResidentLocationPath
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = determineHomeKitDaemonRootStorePath();
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 stringByAppendingPathComponent:@"lastDeterminedResidentLocation"];
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get HomeKit daemon root store path!", (uint8_t *)&v9, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

@end