@interface HMDAppleMediaProfile
- (BOOL)_updatePlayback:(id)a3;
- (BOOL)_updateRefreshPlayback:(id)a3;
- (HMDAppleMediaAccessory)mediaAccessory;
- (HMDAppleMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6;
- (HMDMediaSystem)mediaSystem;
- (MPRequestResponseController)controller;
- (void)_handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5;
- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4;
- (void)didFinishLoadingRequestForController:(id)a3;
- (void)didUpdateSleepWakeState:(unint64_t)a3;
- (void)registerForMessages;
- (void)sessionAudioControlUpdated:(id)a3;
- (void)setMediaSession:(id)a3;
- (void)setMediaSystem:(id)a3;
@end

@implementation HMDAppleMediaProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_mediaSystem);
}

- (MPRequestResponseController)controller
{
  return (MPRequestResponseController *)objc_getProperty(self, a2, 88, 1);
}

- (void)didUpdateSleepWakeState:(unint64_t)a3
{
  v55[2] = *MEMORY[0x263EF8340];
  v5 = [(HMDMediaProfile *)self mediaSession];
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x263EFF9A0];
    v54[0] = *MEMORY[0x263F0D218];
    v8 = [v5 uuid];
    v9 = [v8 UUIDString];
    v54[1] = @"force-notify";
    v55[0] = v9;
    v55[1] = MEMORY[0x263EFFA88];
    v10 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    v11 = [v7 dictionaryWithDictionary:v10];

    if (a3)
    {
      v12 = [NSNumber numberWithUnsignedInteger:a3];
      [v11 setValue:v12 forKey:*MEMORY[0x263F0D210]];
    }
    v13 = (void *)[v11 copy];
    [(HMDMediaProfile *)self handleSessionUpdatedNotification:v13];

    v14 = [(HMDAccessoryProfile *)self accessory];
    v15 = [v14 home];
    v16 = [v15 uuid];

    if (v16)
    {
      v47 = v11;
      v17 = (void *)[objc_alloc(MEMORY[0x263F0DFE8]) initWithSleepWakeState:a3];
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      double v19 = v18;
      id v20 = objc_alloc(MEMORY[0x263F49390]);
      v21 = [v14 uuid];
      v22 = [v21 UUIDString];
      uint64_t v23 = [v20 initWithSource:v22 cachePolicy:2 combineType:2 timestamp:v19];

      id v24 = objc_alloc(MEMORY[0x263F49380]);
      v46 = v17;
      v25 = [v17 protoData];
      v45 = (void *)v23;
      v26 = (void *)[v24 initWithEventData:v25 metadata:v23];

      v27 = (void *)MEMORY[0x263F0DFA8];
      uint64_t v28 = *MEMORY[0x263F0B310];
      v29 = [v14 uuid];
      v30 = [v27 topicFromSuffixID:v28 homeUUID:v16 accessoryUUID:v29];

      v31 = [(HMDMediaProfile *)self eventForwarder];
      [v31 forwardEvent:v26 topic:v30 completion:0];

      v32 = (void *)MEMORY[0x230FBD990]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        [v6 uuid];
        v36 = v44 = v16;
        [v36 UUIDString];
        v43 = v32;
        v38 = v37 = v26;
        *(_DWORD *)buf = 138543874;
        v49 = v35;
        __int16 v50 = 2112;
        v51 = v38;
        __int16 v52 = 2048;
        unint64_t v53 = a3;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@didUpdateSleepWakeState called for mediaSession: %@ sw:%tu", buf, 0x20u);

        v26 = v37;
        v32 = v43;

        v16 = v44;
      }

      v11 = v47;
    }
    else
    {
      v39 = (void *)MEMORY[0x230FBD990]();
      v40 = self;
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v42;
        __int16 v50 = 2112;
        v51 = v14;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to post sleep wake state event for accessory without home: %@", buf, 0x16u);
      }
    }
  }
}

- (void)didFinishLoadingRequestForController:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v44 = a3;
  v4 = [(HMDMediaProfile *)self mediaSession];
  if (v4)
  {
    v5 = [v44 response];
    v6 = (void *)[v5 copy];

    v7 = [MEMORY[0x263EFF9A0] dictionary];
    v8 = [v4 uuid];
    v9 = [v8 UUIDString];
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F0D218]];

    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"force-notify"];
    unint64_t v10 = [v6 state];
    if (v10 > 6) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = qword_2303E4A20[v10];
    }
    v12 = [NSNumber numberWithInteger:v11];
    [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x263F0D1A8]];

    v13 = [v6 tracklist];
    uint64_t v14 = [v13 shuffleType];
    if (v14 == 1) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    if (v14 == 2) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = v15;
    }

    v17 = [NSNumber numberWithInteger:v16];
    [v7 setObject:v17 forKeyedSubscript:*MEMORY[0x263F0D200]];

    double v18 = [v6 tracklist];
    uint64_t v19 = [v18 repeatType];
    if (v19 == 1) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 1;
    }
    if (v19 == 2) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = v20;
    }

    v22 = [NSNumber numberWithInteger:v21];
    [v7 setObject:v22 forKeyedSubscript:*MEMORY[0x263F0D1D0]];

    uint64_t v23 = [v6 tracklist];
    id v24 = [v23 uniqueIdentifier];
    [v7 setObject:v24 forKeyedSubscript:*MEMORY[0x263F0D190]];

    v25 = [v4 state];
    v26 = [v25 volume];
    [v7 setObject:v26 forKeyedSubscript:*MEMORY[0x263F0D220]];

    v27 = (void *)[v7 copy];
    [(HMDMediaProfile *)self handleSessionUpdatedNotification:v27];

    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      v42 = [v4 uuid];
      v32 = [v42 UUIDString];
      uint64_t v38 = [v6 state];
      v41 = [v6 tracklist];
      uint64_t v37 = [v41 shuffleType];
      v40 = [v6 tracklist];
      uint64_t v36 = [v40 repeatType];
      v39 = [v4 state];
      v33 = [v39 volume];
      v34 = [v6 tracklist];
      [v34 uniqueIdentifier];
      v35 = v43 = v28;
      *(_DWORD *)buf = 138545154;
      v46 = v31;
      __int16 v47 = 2112;
      v48 = v32;
      __int16 v49 = 2048;
      uint64_t v50 = v38;
      __int16 v51 = 2048;
      uint64_t v52 = v37;
      __int16 v53 = 2048;
      uint64_t v54 = v36;
      __int16 v55 = 2112;
      v56 = v33;
      __int16 v57 = 2112;
      v58 = v35;
      __int16 v59 = 2112;
      v60 = v7;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@didFinishLoadingRequestForController called for mediaSession:%@ pb:%tu s:%tu r:%tu v:%@ m:%@ userInfo:%@", buf, 0x52u);

      uint64_t v28 = v43;
    }
  }
}

- (void)sessionAudioControlUpdated:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAppleMediaProfile *)self mediaSystem];

  if (v5)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Media profile is part of a media system - passing on handling the audio control  update notification for session", buf, 0xCu);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDAppleMediaProfile;
    [(HMDMediaProfile *)&v10 sessionAudioControlUpdated:v4];
  }
}

- (void)_handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5
{
  v60[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (__CFString *)a4;
  id v10 = a5;
  if (!v10) {
    _HMFPreconditionFailure();
  }
  uint64_t v11 = (void (**)(void, void, void))v10;
  v12 = [(HMDAppleMediaProfile *)self mediaAccessory];
  uint64_t v13 = [(__CFString *)v12 device];
  uint64_t v50 = (void *)v13;
  if (v13)
  {
    uint64_t v14 = (__CFString *)v13;
    if (([(__CFString *)v12 isDeviceReachable] & 1) == 0)
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        double v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        __int16 v55 = v18;
        __int16 v56 = 2112;
        __int16 v57 = @"HMDMediaProfileSetPowerRequestKey";
        __int16 v58 = 2112;
        __int16 v59 = v12;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Attempting to send message: %@ to unreachable accessory: %@", buf, 0x20u);
      }
    }
    uint64_t v19 = (__CFString *)v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = v20;

    if (v21)
    {
      id v48 = v8;
      __int16 v49 = v9;
      __int16 v51 = v9;
      uint64_t v52 = v21;
      v22 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      uint64_t v23 = (void *)MEMORY[0x263F42590];
      id v24 = [HMDRemoteDeviceMessageDestination alloc];
      v25 = [(HMDAccessoryProfile *)self uniqueIdentifier];
      v26 = [(HMDRemoteDeviceMessageDestination *)v24 initWithTarget:v25 device:v14];
      v27 = [v23 messageWithName:@"HMDMediaProfileSetPowerRequestKey" destination:v26 payload:v22];

      [v27 setResponseHandler:v11];
      if ([(__CFString *)v14 isCurrentDevice])
      {
        [(HMDAppleMediaProfile *)self _handleSetPower:v27];
      }
      else
      {
        v42 = (void *)MEMORY[0x230FBD990]();
        v43 = self;
        id v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          __int16 v55 = v45;
          __int16 v56 = 2112;
          __int16 v57 = v14;
          __int16 v58 = 2112;
          __int16 v59 = v49;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Sending remote message to device (%@) for set value execution with request property %@", buf, 0x20u);
        }
        [v27 setSecureRemote:1];
        v46 = +[HMDSecureRemoteMessageTransport defaultTransport];
        __int16 v47 = (void *)[v27 copy];
        [v46 sendMessage:v47 completionHandler:0];
      }
      id v8 = v48;
      v32 = v49;
    }
    else
    {
      v35 = (void *)MEMORY[0x230FBD990]();
      uint64_t v36 = self;
      uint64_t v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v55 = v38;
        __int16 v56 = 2112;
        __int16 v57 = v19;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@The value %@ passed in is either nil or non NSNumber", buf, 0x16u);
      }
      v22 = +[HMDMediaPropertyRequest requestWithProperty:v9 mediaProfile:v36];
      v32 = v9;
      v39 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v27 = +[HMDMediaPropertyResponse responseWithRequest:v22 error:v39];

      __int16 v53 = v27;
      v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
      v41 = +[HMDMediaPropertyResponse serializeResponses:v40];
      ((void (**)(void, void, void *))v11)[2](v11, 0, v41);

      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v55 = v31;
      __int16 v56 = 2112;
      __int16 v57 = v12;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@The device of Media Accessory %@ is not found", buf, 0x16u);
    }
    uint64_t v21 = +[HMDMediaPropertyRequest requestWithProperty:v9 mediaProfile:v29];
    v32 = v9;
    v33 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v22 = +[HMDMediaPropertyResponse responseWithRequest:v21 error:v33];

    v60[0] = v22;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
    v34 = +[HMDMediaPropertyResponse serializeResponses:v27];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v34);
  }
}

- (BOOL)_updateRefreshPlayback:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMDAppleMediaProfile;
  if (![(HMDMediaProfile *)&v29 _updateRefreshPlayback:v4])
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@No local session for mediaProfile - attempting to redispatch the command to resident/device", buf, 0xCu);
    }
    id v28 = 0;
    BOOL v9 = __lookupDeviceForRemoteCommands(v6, &v28);
    id v20 = v28;
    if (v9)
    {
      id v10 = [MEMORY[0x263EFF980] array];
      [v4 arrayForKey:*MEMORY[0x263F0D1B8]];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v25;
        uint64_t v14 = *MEMORY[0x263F0D1A8];
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v11);
            }
            if ([*(id *)(*((void *)&v24 + 1) + 8 * v15) isEqual:v14])
            {
              uint64_t v16 = +[HMDMediaPropertyRequest requestWithProperty:v14 mediaProfile:v6];
              [v10 addObject:v16];
            }
            ++v15;
          }
          while (v12 != v15);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v12);
      }

      v17 = [(HMDAccessoryProfile *)v6 accessory];
      double v18 = [v17 home];
      objc_initWeak((id *)buf, v6);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __47__HMDAppleMediaProfile__updateRefreshPlayback___block_invoke;
      v21[3] = &unk_264A2E9D0;
      objc_copyWeak(&v23, (id *)buf);
      id v22 = v4;
      [v18 redispatchMediaReadRequests:v10 viaDevice:v20 completion:v21];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      [v4 respondWithError:v10];
    }
  }
  return 1;
}

void __47__HMDAppleMediaProfile__updateRefreshPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  v5 = *(void **)(a1 + 32);
  if (WeakRetained)
  {
    [WeakRetained _handleMediaResponses:v7 message:v5];
  }
  else
  {
    v6 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v5 respondWithError:v6];
  }
}

- (BOOL)_updatePlayback:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDAppleMediaProfile;
  if (![(HMDMediaProfile *)&v23 _updatePlayback:v4])
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v26 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@No local session for mediaProfile - attempting to redispatch the command to resident/device", buf, 0xCu);
    }
    uint64_t v10 = *MEMORY[0x263F0D1A8];
    id v11 = [v4 numberForKey:*MEMORY[0x263F0D1A8]];
    if (v11)
    {
      id v22 = 0;
      BOOL v12 = __lookupDeviceForRemoteCommands(v7, &v22);
      id v13 = v22;
      if (!v12)
      {
        BOOL v5 = 0;
        goto LABEL_11;
      }
      uint64_t v14 = +[HMDMediaPropertyWriteRequest writeRequestWithProperty:v10 value:v11 mediaProfile:v7];
      uint64_t v15 = [(HMDAccessoryProfile *)v7 accessory];
      uint64_t v16 = [v15 home];
      objc_initWeak((id *)buf, v7);
      long long v24 = v14;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __40__HMDAppleMediaProfile__updatePlayback___block_invoke;
      v19[3] = &unk_264A2E9D0;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v4;
      [v16 redispatchMediaWriteRequests:v17 viaDevice:v13 completion:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      [v4 respondWithError:v13];
    }
    BOOL v5 = 1;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = 1;
LABEL_12:

  return v5;
}

void __40__HMDAppleMediaProfile__updatePlayback___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  BOOL v5 = *(void **)(a1 + 32);
  if (WeakRetained)
  {
    [WeakRetained _handleMediaResponses:v7 message:v5];
  }
  else
  {
    v6 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v5 respondWithError:v6];
  }
}

- (void)setMediaSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDMediaProfile *)self mediaSession];
  char v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDAppleMediaProfile;
    [(HMDMediaProfile *)&v11 setMediaSession:v4];
    os_unfair_lock_lock_with_options();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSystem);
    [WeakRetained setMediaSession:v4];

    os_unfair_lock_unlock(&self->super._lock.lock);
    id v8 = [(HMDAppleMediaProfile *)self controller];
    BOOL v9 = [v8 response];

    if (v9)
    {
      uint64_t v10 = [(HMDAppleMediaProfile *)self controller];
      [(HMDAppleMediaProfile *)self didFinishLoadingRequestForController:v10];
    }
  }
}

- (HMDMediaSystem)mediaSystem
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSystem);
  os_unfair_lock_unlock(&p_lock->lock);
  return (HMDMediaSystem *)WeakRetained;
}

- (void)setMediaSystem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x230FBD990]();
  char v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543874;
    objc_super v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting media system %@ on profile %@", (uint8_t *)&v10, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&v6->_mediaSystem, v4);
  os_unfair_lock_unlock(&v6->super._lock.lock);
  BOOL v9 = [(HMDAccessoryProfile *)v6 msgDispatcher];
  [(HMDAppleMediaProfile *)v6 configureWithMessageDispatcher:v9 configurationTracker:0];
}

- (HMDAppleMediaAccessory)mediaAccessory
{
  v2 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return (HMDAppleMediaAccessory *)v4;
}

- (void)registerForMessages
{
  v10[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaProfile;
  [(HMDMediaProfile *)&v9 registerForMessages];
  v3 = [(HMDAccessoryProfile *)self msgDispatcher];
  id v4 = [(HMDAccessoryProfile *)self accessory];
  BOOL v5 = [v4 home];
  char v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:0 remoteAccessRequired:0];
  v10[0] = v6;
  id v7 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v10[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [v3 registerForMessage:@"HMDMediaProfileSetPowerRequestKey" receiver:self policies:v8 selector:sel__handleSetPower_];
}

- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    dispatch_group_enter(v7);
  }
  objc_super v9 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMDAppleMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v13 = v6;
  __int16 v14 = v8;
  uint64_t v15 = self;
  int v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __76__HMDAppleMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)HMDAppleMediaProfile;
  objc_msgSendSuper2(&v5, sel_configureWithMessageDispatcher_configurationTracker_, v3, v2);
  id v4 = *(NSObject **)(a1 + 40);
  if (v4) {
    dispatch_group_leave(v4);
  }
}

- (HMDAppleMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDAppleMediaProfile;
  id v11 = [(HMDMediaProfile *)&v17 initWithAccessory:v10 uniqueIdentifier:a4 services:a5 workQueue:a6];
  if (v11 && [v10 isCurrentAccessory])
  {
    uint64_t v12 = objc_opt_new();
    controller = v11->_controller;
    v11->_controller = (MPRequestResponseController *)v12;

    __int16 v14 = objc_opt_new();
    uint64_t v15 = [MEMORY[0x263F54818] deviceActivePlayerPath];
    [v14 setPlayerPath:v15];

    [(MPRequestResponseController *)v11->_controller setRequest:v14];
    [(MPRequestResponseController *)v11->_controller setDelegate:v11];
    [(MPRequestResponseController *)v11->_controller beginAutomaticResponseLoading];
  }
  return v11;
}

@end