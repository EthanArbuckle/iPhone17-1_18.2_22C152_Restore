@interface HMDHAPMediaProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)_updateAudioControl:(id)a3;
- (BOOL)_updatePlayback:(id)a3;
- (BOOL)_updateRefreshPlayback:(id)a3;
- (HMDCharacteristic)smartSpeakerCurrentMediaStateCharacteristic;
- (HMDCharacteristic)smartSpeakerVolumeCharacteristic;
- (HMDHAPMediaProfile)initWithMediaServices:(id)a3;
- (NSString)clientIdentifier;
- (id)_allCharacteristicsToMonitor;
- (id)_mediaSessionStateFromProfile;
- (id)_smartSpeakerAirPlayEnableCharacteristic;
- (id)_smartSpeakerAirPlayEnableReadRequest;
- (id)_smartSpeakerCurrentMediaStateReadRequest;
- (id)_smartSpeakerMutedCharacteristic;
- (id)_smartSpeakerMutedReadRequest;
- (id)_smartSpeakerMutedWriteRequestWithMuted:(id)a3;
- (id)_smartSpeakerService;
- (id)_smartSpeakerTargetMediaStateCharacteristic;
- (id)_smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:(id)a3;
- (id)_smartSpeakerVolumeReadRequest;
- (id)_smartSpeakerVolumeWriteRequestWithVolumePercentage:(id)a3;
- (id)mediaSessionFromProfile;
- (id)playStateWriteRequestWithPlaybackState:(int64_t)a3;
- (int64_t)airPlayEnable;
- (unint64_t)capability;
- (void)_disableCharacteristicNotifications;
- (void)_handleCharacteristicChanges:(id)a3;
- (void)_notifyProfileSettingsUpdated:(id)a3;
- (void)_setCharacteristicNotifications:(BOOL)a3;
- (void)_updateCharacteristicChanges;
- (void)_updateCurrentMediaState:(id)a3 volumePercentage:(id)a4 muted:(id)a5 enable:(id)a6 message:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleCharacteristicsUpdated:(id)a3;
- (void)handleHomeCharacteristicValuesChanged:(id)a3;
- (void)handlePrimaryResidentChanged:(id)a3;
- (void)handleResidentAdded:(id)a3;
- (void)registerForNotifications;
- (void)setAirPlayEnable:(int64_t)a3;
- (void)setEnable:(int64_t)a3 completionHandler:(id)a4;
- (void)updateMediaSessionState:(id)a3 usingCharacteristics:(id)a4;
- (void)updateMediaSessionState:(id)a3 usingServices:(id)a4;
@end

@implementation HMDHAPMediaProfile

- (void).cxx_destruct
{
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEnable:(int64_t)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    v8 = [(HMDAccessoryProfile *)self accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      v11 = [(HMDHAPMediaProfile *)self _smartSpeakerAirPlayEnableCharacteristic];
      if (!v11) {
        goto LABEL_12;
      }
      v12 = [NSNumber numberWithInteger:a3 == 1];
      v13 = [v11 authorizationData];
      v14 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v11 value:v12 authorizationData:v13 type:0];

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        v16 = [(HMDAccessoryProfile *)self workQueue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __50__HMDHAPMediaProfile_setEnable_completionHandler___block_invoke;
        v26[3] = &unk_264A29D48;
        objc_copyWeak(v29, location);
        id v17 = v14;
        id v27 = v17;
        id v28 = v6;
        v29[1] = (id)a3;
        [v10 writeCharacteristicValues:v15 source:7 queue:v16 completionHandler:v26];

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x230FBD990]();
        v19 = self;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = HMFGetLogIdentifier();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set AirPlay Enable] failed to create AirPlay enable write request", (uint8_t *)location, 0xCu);
        }
        id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        if (v6) {
          (*((void (**)(id, id))v6 + 2))(v6, v17);
        }
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set AirPlay Enable] accessory not part of profile", (uint8_t *)location, 0xCu);
      }
      v11 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      if (v6) {
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
      }
    }
  }
  else
  {
    v7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v7);
    }
  }
}

void __50__HMDHAPMediaProfile_setEnable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v35 = (void *)a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v34 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = 0;
      uint64_t v8 = *(void *)v39;
      do
      {
        uint64_t v9 = 0;
        uint64_t v36 = v6;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
          v11 = objc_msgSend(v10, "error", v34);

          if (v11)
          {
            uint64_t v12 = [v10 error];

            v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = WeakRetained;
            v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              uint64_t v16 = v8;
              v18 = id v17 = WeakRetained;
              v19 = [v10 request];
              v20 = [v10 error];
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              __int16 v46 = 2112;
              v47 = v19;
              __int16 v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              id WeakRetained = v17;
              uint64_t v8 = v16;
              uint64_t v6 = v36;
            }

            v7 = (void *)v12;
          }
          else
          {
            v21 = [v10 request];
            v22 = [v21 characteristic];
            v23 = [v22 type];
            int v24 = [v23 isEqual:@"0000025B-0000-1000-8000-0026BB765291"];

            if (v24)
            {
              [WeakRetained setAirPlayEnable:v35[7]];
              v42 = @"settings-airplay";
              v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(WeakRetained, "airPlayEnable"));
              v43 = v25;
              v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

              [WeakRetained _notifyProfileSettingsUpdated:v26];
            }
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    uint64_t v33 = v35[5];
    if (v33) {
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    }
    id v3 = v34;
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = WeakRetained;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      __int16 v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);
    }
    v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    uint64_t v32 = v35[5];
    if (v32) {
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
    }
  }
}

- (void)_notifyProfileSettingsUpdated:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"HMDHAPMediaProfileUpdatedNotification" object:self userInfo:v5];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDHAPMediaProfile;
  [(HMDMediaProfile *)&v7 encodeWithCoder:v4];
  id v5 = [(HMDMediaProfile *)self mediaSession];

  if (!v5)
  {
    uint64_t v6 = [(HMDHAPMediaProfile *)self mediaSessionFromProfile];
    [v4 encodeObject:v6 forKey:*MEMORY[0x263F0D148]];
  }
}

- (void)_updateCurrentMediaState:(id)a3 volumePercentage:(id)a4 muted:(id)a5 enable:(id)a6 message:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12 || v13 || v14 || v15)
  {
    id v17 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    v18 = v17;
    if (v12) {
      [v17 setValue:v12 forKey:*MEMORY[0x263F0D1A8]];
    }
    if (v13) {
      [v18 setValue:v13 forKey:*MEMORY[0x263F0D220]];
    }
    if (v14) {
      [v18 setValue:v14 forKey:*MEMORY[0x263F0D198]];
    }
    long long v41 = v18;
    v19 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    if (v15)
    {
      uint64_t v20 = [v15 integerValue];
      uint64_t v21 = v20 == 1 ? 1 : -1;
      uint64_t v22 = v20 ? v21 : 0;
      if ([(HMDHAPMediaProfile *)self airPlayEnable] != v22)
      {
        [(HMDHAPMediaProfile *)self setAirPlayEnable:v22];
        v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHAPMediaProfile airPlayEnable](self, "airPlayEnable"));
        [v19 setValue:v23 forKey:@"settings-airplay"];
      }
    }
    long long v39 = v19;
    id v40 = v15;
    int v24 = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v43 = v27;
      __int16 v44 = 2112;
      id v45 = v12;
      __int16 v46 = 2112;
      id v47 = v13;
      __int16 v48 = 2112;
      id v49 = v14;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Notifying XPC clients of updated current media state %@, volume %@, muted %@", buf, 0x2Au);
    }
    id v28 = objc_alloc(MEMORY[0x263F42570]);
    v29 = [(HMDAccessoryProfile *)v25 uniqueIdentifier];
    v30 = (void *)[v28 initWithTarget:v29];

    v31 = (void *)MEMORY[0x263F42590];
    uint64_t v32 = *MEMORY[0x263F0D1B0];
    uint64_t v33 = (void *)[v41 copy];
    id v34 = [v31 messageWithName:v32 destination:v30 payload:v33];

    id v35 = v16;
    uint64_t v36 = [v16 identifier];
    if (v36) {
      [v34 setIdentifier:v36];
    }
    [v34 setRequiresSPIEntitlement];
    v37 = [(HMDAccessoryProfile *)v25 msgDispatcher];
    long long v38 = (void *)[v34 copy];
    [v37 sendMessage:v38 completionHandler:0];

    [(HMDHAPMediaProfile *)v25 _notifyProfileSettingsUpdated:v39];
    id v16 = v35;
    id v15 = v40;
  }
}

- (BOOL)_updateAudioControl:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HMDHAPMediaProfile;
  if (![(HMDMediaProfile *)&v36 _updateAudioControl:v4])
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    objc_super v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v38 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@No local media session for hapMediaProfile", buf, 0xCu);
    }
    uint64_t v10 = [v4 numberForKey:*MEMORY[0x263F0D178]];
    uint64_t v11 = [v4 numberForKey:*MEMORY[0x263F0D160]];
    if (v10 | v11)
    {
      id v12 = [(HMDAccessoryProfile *)v7 accessory];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;

      if (!v14)
      {
        id v17 = (void *)MEMORY[0x230FBD990]();
        v18 = v7;
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v38 = v20;
          __int16 v39 = 2112;
          id v40 = v18;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Updating Audio Control] accessory not part of profile (%@)", buf, 0x16u);
        }
        id v14 = 0;
        BOOL v5 = 0;
        goto LABEL_33;
      }
      id v15 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
      if (v10)
      {
        id v16 = [(HMDHAPMediaProfile *)v7 _smartSpeakerVolumeWriteRequestWithVolumePercentage:v10];
        if (v16)
        {
          [v15 addObject:v16];
        }
        else
        {
          context = (void *)MEMORY[0x230FBD990]();
          uint64_t v21 = v7;
          uint64_t v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            long long v38 = v23;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Updating Audio Control] smart speaker volume is not available", buf, 0xCu);
          }
        }
      }
      if (v11)
      {
        int v24 = [(HMDHAPMediaProfile *)v7 _smartSpeakerMutedWriteRequestWithMuted:v11];
        if (v24)
        {
          [v15 addObject:v24];
        }
        else
        {
          context = (void *)MEMORY[0x230FBD990]();
          v25 = v7;
          v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            long long v38 = v27;
            _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Updating Audio Control] smart speaker muted is not available", buf, 0xCu);
          }
        }
      }
      if (objc_msgSend(v15, "count", context))
      {
        objc_initWeak((id *)buf, v7);
        id v28 = [(HMDAccessoryProfile *)v7 workQueue];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __42__HMDHAPMediaProfile__updateAudioControl___block_invoke;
        v32[3] = &unk_264A29D20;
        objc_copyWeak(&v35, (id *)buf);
        id v33 = v15;
        id v34 = v4;
        [v14 writeCharacteristicValues:v33 source:7 message:v34 queue:v28 completionHandler:v32];

        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v29 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
        [v4 respondWithError:v29];
      }
    }
    else
    {
      id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      [v4 respondWithError:v14];
    }
    BOOL v5 = 1;
LABEL_33:

    goto LABEL_34;
  }
  BOOL v5 = 1;
LABEL_34:

  return v5;
}

void __42__HMDHAPMediaProfile__updateAudioControl___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 count])
  {
    uint64_t v30 = a1;
    id v31 = v3;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      objc_super v7 = 0;
      uint64_t v8 = *(void *)v35;
      do
      {
        uint64_t v9 = 0;
        uint64_t v32 = v6;
        do
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
          uint64_t v11 = objc_msgSend(v10, "error", v30);

          if (v11)
          {
            uint64_t v12 = [v10 error];

            id v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = WeakRetained;
            id v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              uint64_t v16 = v8;
              v18 = id v17 = WeakRetained;
              v19 = [v10 value];
              uint64_t v20 = [v10 error];
              *(_DWORD *)buf = 138543874;
              __int16 v39 = v18;
              __int16 v40 = 2112;
              uint64_t v41 = v19;
              __int16 v42 = 2112;
              v43 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write value %@ failed with error %@", buf, 0x20u);

              id WeakRetained = v17;
              uint64_t v8 = v16;
              uint64_t v6 = v32;
            }

            objc_super v7 = (void *)v12;
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v6);
    }
    else
    {
      objc_super v7 = 0;
    }

    id v28 = [*(id *)(v30 + 40) responseHandler];

    if (v28)
    {
      v29 = [*(id *)(v30 + 40) responseHandler];
      ((void (**)(void, void *, void))v29)[2](v29, v7, 0);
    }
    id v3 = v31;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = WeakRetained;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = uint64_t v24 = a1;
      v26 = *(void **)(v24 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v25;
      __int16 v40 = 2112;
      uint64_t v41 = v26;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid response with write values %@", buf, 0x16u);

      a1 = v24;
    }

    id v27 = *(void **)(a1 + 40);
    objc_super v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    [v27 respondWithError:v7];
  }
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  id v4 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDHAPMediaProfile_handlePrimaryResidentChanged___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __51__HMDHAPMediaProfile_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 home];
  id v4 = [v3 residentDeviceManager];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v22 = v4;
  uint64_t v5 = [v4 residentDevices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v23 = v1;
    uint64_t v24 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [v10 device];
        if ([v11 isCurrentDevice])
        {
          uint64_t v12 = [v10 capabilities];
          int v13 = [v12 supportsSiriEndpointSetup];

          if (v13)
          {
            int v14 = [v10 isConfirmed];
            id v15 = (void *)MEMORY[0x230FBD990]();
            id v16 = *(id *)(v1 + 32);
            id v17 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = HMFGetLogIdentifier();
              HMFBooleanToString();
              uint64_t v20 = v19 = v8;
              *(_DWORD *)buf = 138543618;
              uint64_t v30 = v18;
              __int16 v31 = 2112;
              uint64_t v32 = v20;
              _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Current device is primary:%@ and does not support home hub", buf, 0x16u);

              uint64_t v8 = v19;
              uint64_t v1 = v23;
              uint64_t v5 = v24;
            }

            uint64_t v21 = *(void **)(v1 + 32);
            if (v14) {
              [v21 _setCharacteristicNotifications:1];
            }
            else {
              [v21 _disableCharacteristicNotifications];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)handleResidentAdded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HMDHAPMediaProfile_handleResidentAdded___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__HMDHAPMediaProfile_handleResidentAdded___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = [v4 device];
    id v6 = v5;
    if (v5 && [v5 isCurrentDevice])
    {
      uint64_t v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        uint64_t v11 = [*(id *)(a1 + 32) name];
        uint64_t v12 = [v6 identifier];
        int v13 = [v12 UUIDString];
        int v14 = 138543874;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v11;
        __int16 v18 = 2112;
        uint64_t v19 = v13;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Current device was added as a resident device (%@ / %@) notification.", (uint8_t *)&v14, 0x20u);
      }
      [*(id *)(a1 + 40) _setCharacteristicNotifications:1];
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (void)_disableCharacteristicNotifications
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHAPMediaProfile *)self _allCharacteristicsToMonitor];
  if ([v3 count])
  {
    id v4 = [(HMDAccessoryProfile *)self accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;

    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Disabling notifications for characteristics :%@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = [(HMDHAPMediaProfile *)v8 clientIdentifier];
    [v6 enableNotification:0 forCharacteristics:v3 message:0 clientIdentifier:v11];
  }
}

- (void)_setCharacteristicNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HMDAccessoryProfile *)self accessory];
  id v6 = [v5 home];
  int v7 = [v6 currentDeviceSupportsSidekickSettings];

  if (v7)
  {
    id v8 = [(HMDHAPMediaProfile *)self _allCharacteristicsToMonitor];
    if ([v8 count])
    {
      uint64_t v9 = [(HMDAccessoryProfile *)self accessory];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      int v12 = (void *)MEMORY[0x230FBD990]();
      int v13 = self;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        uint64_t v16 = @"Disable";
        int v18 = 138543874;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        if (v3) {
          uint64_t v16 = @"Enable";
        }
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        uint64_t v23 = v8;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@%@ notifications for characteristics: %@", (uint8_t *)&v18, 0x20u);
      }
      id v17 = [(HMDHAPMediaProfile *)v13 clientIdentifier];
      [v11 enableNotification:v3 forCharacteristics:v8 message:0 clientIdentifier:v17];
    }
  }
}

- (id)_allCharacteristicsToMonitor
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  id v4 = [(HMDHAPMediaProfile *)self _smartSpeakerAirPlayEnableCharacteristic];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (void)handleCharacteristicsUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDHAPMediaProfile_handleCharacteristicsUpdated___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__HMDHAPMediaProfile_handleCharacteristicsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _updateCharacteristicChanges];
}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDHAPMediaProfile_handleAccessoryConfigured___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__HMDHAPMediaProfile_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) _updateCharacteristicChanges];
  return [*(id *)(a1 + 32) _setCharacteristicNotifications:1];
}

- (void)handleHomeCharacteristicValuesChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  if ([v6 count])
  {
    int v7 = [(HMDAccessoryProfile *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke;
    block[3] = &unk_264A2F820;
    id v18 = v6;
    uint64_t v19 = self;
    dispatch_async(v7, block);

    int v8 = v18;
  }
  else
  {
    uint64_t v9 = [v4 userInfo];
    int v8 = objc_msgSend(v9, "hmf_dictionaryForKey:", @"kModifiedCharacteristicsForAccessoryKey");

    __int16 v10 = [(HMDAccessoryProfile *)self accessory];
    id v11 = [v10 uuid];
    uint64_t v12 = [v11 UUIDString];
    int v13 = objc_msgSend(v8, "hmf_dictionaryForKey:", v12);

    if (v13)
    {
      __int16 v14 = [(HMDAccessoryProfile *)self workQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke_2;
      v15[3] = &unk_264A2F820;
      v15[4] = self;
      id v16 = v13;
      dispatch_async(v14, v15);
    }
  }
}

void __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(v1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v29;
    uint64_t v20 = *(void *)v29;
    uint64_t v21 = v1;
    do
    {
      uint64_t v5 = 0;
      uint64_t v22 = v3;
      do
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        int v7 = [*(id *)(v1 + 40) accessory];
        int v8 = [v6 accessory];
        int v9 = HMFEqualObjects();

        if (v9)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          __int16 v10 = [*(id *)(v1 + 40) services];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) instanceID];
                id v16 = [v6 service];
                id v17 = [v16 instanceID];
                int v18 = HMFEqualObjects();

                if (v18)
                {
                  [v19 addObject:v6];
                  goto LABEL_17;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_17:

          uint64_t v4 = v20;
          uint64_t v1 = v21;
          uint64_t v3 = v22;
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v3);
  }

  [*(id *)(v1 + 40) _handleCharacteristicChanges:v19];
}

void __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke_2(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v34 = [MEMORY[0x263EFF980] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v30 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v44;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v6;
        uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * v6);
        int v7 = objc_msgSend(v5, "numberFromString:");
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v32 = [*(id *)(v30 + 32) services];
        uint64_t v8 = [v32 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v40;
          uint64_t v28 = *(void *)v40;
          do
          {
            uint64_t v11 = 0;
            uint64_t v31 = v9;
            do
            {
              if (*(void *)v40 != v10) {
                objc_enumerationMutation(v32);
              }
              uint64_t v12 = [*(id *)(*((void *)&v39 + 1) + 8 * v11) instanceID];
              int v13 = HMFEqualObjects();

              if (v13)
              {
                uint64_t v33 = v11;
                __int16 v14 = objc_msgSend(*(id *)(v30 + 40), "hmf_dictionaryForKey:", v29);
                long long v35 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v47 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v36;
                  do
                  {
                    for (uint64_t i = 0; i != v16; ++i)
                    {
                      if (*(void *)v36 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                      uint64_t v20 = [v5 numberFromString:v19];
                      uint64_t v21 = [v4 findCharacteristic:v20 forService:v7];
                      if (v21)
                      {
                        uint64_t v22 = objc_msgSend(v14, "hmf_dictionaryForKey:", v19);
                        uint64_t v23 = objc_msgSend(v22, "hmf_dataForKey:", @"kCharacteristicErrorDataKey");
                        if (v23) {

                        }
                        else {
                          [v34 addObject:v21];
                        }
                      }
                    }
                    uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v47 count:16];
                  }
                  while (v16);
                }

                uint64_t v10 = v28;
                uint64_t v9 = v31;
                uint64_t v11 = v33;
              }
              ++v11;
            }
            while (v11 != v9);
            uint64_t v9 = [v32 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v26);
  }

  if ([v34 count]) {
    [*(id *)(v30 + 32) _handleCharacteristicChanges:v34];
  }
}

- (void)_updateCharacteristicChanges
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(HMDAccessoryProfile *)self services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) characteristics];
        [v3 addObjectsFromArray:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(HMDHAPMediaProfile *)self _handleCharacteristicChanges:v3];
}

- (void)_handleCharacteristicChanges:(id)a3
{
  uint64_t v31 = self;
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v3)
  {
    id v32 = 0;
    id v34 = 0;
    long long v35 = 0;
    uint64_t v5 = 0;
    goto LABEL_35;
  }
  uint64_t v4 = v3;
  id v32 = 0;
  id v34 = 0;
  long long v35 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v38;
  uint64_t v7 = *MEMORY[0x263F0C0C0];
  uint64_t v8 = *MEMORY[0x263F0C5A0];
  uint64_t v33 = *MEMORY[0x263F0C290];
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v38 != v6) {
        objc_enumerationMutation(obj);
      }
      long long v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
      long long v11 = objc_msgSend(v10, "type", v31);
      int v12 = [v11 isEqualToString:v7];

      if (v12)
      {
        long long v13 = [v10 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v14 = v13;
        }
        else {
          __int16 v14 = 0;
        }
        id v15 = v14;

        uint64_t v16 = NSNumber;
        unint64_t v17 = [v15 integerValue] - 1;
        if (v17 > 4) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = qword_2303E49C8[v17];
        }
        [v16 numberWithInteger:v18];
        uint64_t v5 = v23 = v5;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v19 = [v10 type];
      int v20 = [v19 isEqualToString:v8];

      if (v20)
      {
        uint64_t v21 = [v10 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = 0;
        }
        id v15 = v22;

        __percentageForCharacteristicValue(0, v15);
        long long v35 = v23 = v35;
        goto LABEL_19;
      }
      long long v24 = [v10 type];
      int v25 = [v24 isEqualToString:v33];

      if (v25)
      {
        uint64_t v23 = [v10 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v26 = v23;
        }
        else {
          uint64_t v26 = 0;
        }
        id v15 = v34;
        id v34 = v26;
        goto LABEL_19;
      }
      uint64_t v27 = [v10 type];
      int v28 = [v27 isEqualToString:@"0000025B-0000-1000-8000-0026BB765291"];

      if (v28)
      {
        uint64_t v23 = [v10 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v29 = v23;
        }
        else {
          uint64_t v29 = 0;
        }
        id v15 = v32;
        id v32 = v29;
        goto LABEL_19;
      }
LABEL_20:
      ++v9;
    }
    while (v4 != v9);
    uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    uint64_t v4 = v30;
  }
  while (v30);
LABEL_35:
  -[HMDHAPMediaProfile _updateCurrentMediaState:volumePercentage:muted:enable:message:](v31, "_updateCurrentMediaState:volumePercentage:muted:enable:message:", v5, v35, v34, v32, 0, v31);
}

- (void)updateMediaSessionState:(id)a3 usingCharacteristics:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    uint64_t v10 = *MEMORY[0x263F0C0C0];
    uint64_t v11 = *MEMORY[0x263F0C5A0];
    uint64_t v33 = *MEMORY[0x263F0C290];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        __int16 v14 = [v13 type];
        int v15 = [v14 isEqualToString:v10];

        if (v15)
        {
          uint64_t v16 = [v13 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            unint64_t v17 = v16;
          }
          else {
            unint64_t v17 = 0;
          }
          id v18 = v17;

          uint64_t v19 = [v18 integerValue];
          if ((unint64_t)(v19 - 1) > 4) {
            uint64_t v20 = 1;
          }
          else {
            uint64_t v20 = qword_2303E49C8[v19 - 1];
          }
          [v5 setPlaybackState:v20];
        }
        else
        {
          uint64_t v21 = [v13 type];
          int v22 = [v21 isEqualToString:v11];

          if (v22)
          {
            uint64_t v23 = [v13 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              long long v24 = v23;
            }
            else {
              long long v24 = 0;
            }
            id v25 = v24;

            uint64_t v26 = __percentageForCharacteristicValue(0, v25);

            [v5 setVolume:v26];
          }
          else
          {
            uint64_t v27 = [v13 type];
            int v28 = [v27 isEqualToString:v33];

            if (v28)
            {
              uint64_t v29 = [v13 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v30 = v29;
              }
              else {
                uint64_t v30 = 0;
              }
              id v31 = v30;

              [v5 setMuted:v31];
            }
          }
        }
        ++v12;
      }
      while (v8 != v12);
      uint64_t v32 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v8 = v32;
    }
    while (v32);
  }
}

- (void)updateMediaSessionState:(id)a3 usingServices:(id)a4
{
  id v9 = a3;
  id v6 = objc_msgSend(a4, "na_filter:", &__block_literal_global_235600);
  if ([v6 count])
  {
    uint64_t v7 = [v6 firstObject];
    uint64_t v8 = [v7 characteristics];
    [(HMDHAPMediaProfile *)self updateMediaSessionState:v9 usingCharacteristics:v8];
  }
}

uint64_t __60__HMDHAPMediaProfile_updateMediaSessionState_usingServices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:@"00000228-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_mediaSessionStateFromProfile
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDAccessoryProfile *)self accessory];
  if (v3)
  {
    uint64_t v4 = [HMDMediaSessionState alloc];
    id v5 = [v3 identifier];
    id v6 = [(HMDMediaSessionState *)v4 initWithSessionIdentifier:v5];

    if ([v3 isReachable])
    {
      uint64_t v7 = [(HMDAccessoryProfile *)self services];
      [(HMDHAPMediaProfile *)self updateMediaSessionState:v6 usingServices:v7];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive media session state from profile due to no accessory", (uint8_t *)&v13, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)mediaSessionFromProfile
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDHAPMediaProfile *)self _mediaSessionStateFromProfile];
  if (v3)
  {
    uint64_t v4 = [HMDMediaSession alloc];
    uint64_t v12 = self;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    id v6 = [(HMDMediaSession *)v4 initWithEndpoint:0 mediaProfiles:v5 state:v3];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive media session from profile due to no media session state from profile", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_updateRefreshPlayback:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)HMDHAPMediaProfile;
  id v38 = a3;
  if (!-[HMDMediaProfile _updateRefreshPlayback:](&v50, sel__updateRefreshPlayback_))
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@No local media session for hapMediaProfile", buf, 0xCu);
    }
    uint64_t v8 = [(HMDAccessoryProfile *)v5 accessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v36 = v9;

    BOOL v37 = v36 != 0;
    if (v36)
    {
      long long v41 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
      uint64_t v34 = [(HMDHAPMediaProfile *)v5 _smartSpeakerAirPlayEnableReadRequest];
      if (v34)
      {
        [v41 addObject:v34];
      }
      else
      {
        __int16 v14 = (void *)MEMORY[0x230FBD990](0);
        uint64_t v15 = v5;
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          unint64_t v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v53 = v17;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker airplay enable state is not available", buf, 0xCu);
        }
      }
      objc_msgSend(v38, "arrayForKey:", *MEMORY[0x263F0D1B8], v34);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v47;
        uint64_t v20 = *MEMORY[0x263F0D1A8];
        uint64_t v21 = *MEMORY[0x263F0D220];
        uint64_t v39 = *MEMORY[0x263F0D198];
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v47 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if ([v23 isEqual:v20])
            {
              long long v24 = [(HMDHAPMediaProfile *)v5 _smartSpeakerCurrentMediaStateReadRequest];
              if (!v24)
              {
                id v25 = (void *)MEMORY[0x230FBD990]();
                uint64_t v26 = v5;
                uint64_t v27 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  int v28 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v53 = v28;
                  _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker current media state is not available", buf, 0xCu);
                }
LABEL_39:

                long long v24 = 0;
                goto LABEL_40;
              }
            }
            else if ([v23 isEqual:v21])
            {
              long long v24 = [(HMDHAPMediaProfile *)v5 _smartSpeakerVolumeReadRequest];
              if (!v24)
              {
                id v25 = (void *)MEMORY[0x230FBD990]();
                uint64_t v26 = v5;
                uint64_t v27 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v29 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v53 = v29;
                  _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker volume is not available", buf, 0xCu);
                }
                goto LABEL_39;
              }
            }
            else
            {
              if (![v23 isEqual:v39]) {
                continue;
              }
              long long v24 = [(HMDHAPMediaProfile *)v5 _smartSpeakerMutedReadRequest];
              if (!v24)
              {
                id v25 = (void *)MEMORY[0x230FBD990]();
                uint64_t v26 = v5;
                uint64_t v27 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v30 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v53 = v30;
                  _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker muted is not available", buf, 0xCu);
                }
                goto LABEL_39;
              }
            }
            [v41 addObject:v24];
LABEL_40:
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v18);
      }

      objc_initWeak((id *)buf, v5);
      id v31 = [(HMDAccessoryProfile *)v5 workQueue];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __45__HMDHAPMediaProfile__updateRefreshPlayback___block_invoke;
      v42[3] = &unk_264A29D20;
      objc_copyWeak(&v45, (id *)buf);
      id v32 = v41;
      id v43 = v32;
      id v44 = v38;
      [v36 readCharacteristicValues:v32 source:7 queue:v31 completionHandler:v42];

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = v5;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v53 = v13;
        __int16 v54 = 2112;
        v55 = v11;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] accessory not part of profile (%@)", buf, 0x16u);
      }
    }

    goto LABEL_45;
  }
  BOOL v37 = 1;
LABEL_45:

  return v37;
}

void __45__HMDHAPMediaProfile__updateRefreshPlayback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v56 = WeakRetained;
  if ([v3 count])
  {
    uint64_t v49 = a1;
    id v50 = v3;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (!v6)
    {
      uint64_t v8 = 0;
      id v51 = 0;
      id v53 = 0;
      v55 = 0;
      uint64_t v58 = 0;
      goto LABEL_43;
    }
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    id v51 = 0;
    id v53 = 0;
    v55 = 0;
    uint64_t v58 = 0;
    uint64_t v9 = *(void *)v60;
    uint64_t v57 = *MEMORY[0x263F0C0C0];
    uint64_t v54 = *MEMORY[0x263F0C5A0];
    uint64_t v52 = *MEMORY[0x263F0C290];
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v60 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v12 = [v11 error];

        if (!v12)
        {
          uint64_t v19 = [v11 request];
          uint64_t v20 = [v19 characteristic];

          uint64_t v21 = [v20 type];
          int v22 = [v21 isEqual:v57];

          if (v22)
          {
            uint64_t v23 = [v11 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              long long v24 = v23;
            }
            else {
              long long v24 = 0;
            }
            id v25 = v24;

            uint64_t v26 = NSNumber;
            unint64_t v27 = [v25 integerValue] - 1;
            if (v27 > 4) {
              uint64_t v28 = 1;
            }
            else {
              uint64_t v28 = qword_2303E49C8[v27];
            }
            [v26 numberWithInteger:v28];
            v58 = uint64_t v33 = (void *)v58;
            goto LABEL_34;
          }
          uint64_t v29 = [v20 type];
          int v30 = [v29 isEqual:v54];

          if (v30)
          {
            id v31 = [v11 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v32 = v31;
            }
            else {
              id v32 = 0;
            }
            id v25 = v32;

            __percentageForCharacteristicValue(v20, v25);
            v55 = uint64_t v33 = v55;
            goto LABEL_34;
          }
          uint64_t v34 = [v20 type];
          int v35 = [v34 isEqual:v52];

          if (v35)
          {
            uint64_t v33 = [v11 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v36 = v33;
            }
            else {
              id v36 = 0;
            }
            id v25 = v53;
            id v53 = v36;
            goto LABEL_34;
          }
          BOOL v37 = [v20 type];
          int v38 = [v37 isEqualToString:@"0000025B-0000-1000-8000-0026BB765291"];

          if (v38)
          {
            uint64_t v33 = [v11 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v39 = v33;
            }
            else {
              uint64_t v39 = 0;
            }
            id v25 = v51;
            id v51 = v39;
LABEL_34:
          }
          continue;
        }
        uint64_t v13 = [v11 error];

        __int16 v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = WeakRetained;
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          unint64_t v17 = HMFGetLogIdentifier();
          uint64_t v18 = [v11 error];
          *(_DWORD *)buf = 138543618;
          v65 = v17;
          __int16 v66 = 2112;
          v67 = v18;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Read failed with error %@", buf, 0x16u);

          id WeakRetained = v56;
        }

        uint64_t v8 = (void *)v13;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (!v7)
      {
LABEL_43:

        long long v46 = (void *)v58;
        [WeakRetained _updateCurrentMediaState:v58 volumePercentage:v55 muted:v53 enable:v51 message:*(void *)(v49 + 40)];
        long long v47 = [*(id *)(v49 + 40) responseHandler];

        if (v47)
        {
          long long v48 = [*(id *)(v49 + 40) responseHandler];
          ((void (**)(void, void *, void))v48)[2](v48, v8, 0);
        }
        id v3 = v50;
        goto LABEL_46;
      }
    }
  }
  long long v40 = (void *)MEMORY[0x230FBD990]();
  id v41 = WeakRetained;
  uint64_t v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    id v43 = HMFGetLogIdentifier();
    id v44 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v65 = v43;
    __int16 v66 = 2112;
    v67 = v44;
    _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    id WeakRetained = v56;
  }

  id v45 = *(void **)(a1 + 40);
  long long v46 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
  [v45 respondWithError:v46];
LABEL_46:
}

- (BOOL)_updatePlayback:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMDHAPMediaProfile;
  if ([(HMDMediaProfile *)&v30 _updatePlayback:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@No local media session for hapMediaProfile", buf, 0xCu);
    }
    uint64_t v10 = [v4 numberForKey:*MEMORY[0x263F0D1A8]];
    if (v10)
    {
      uint64_t v11 = [(HMDAccessoryProfile *)v7 accessory];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;

      if (v13)
      {
        __int16 v14 = [(HMDHAPMediaProfile *)v7 _smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:v10];
        BOOL v5 = v14 != 0;
        if (v14)
        {
          objc_initWeak((id *)buf, v7);
          id v31 = v14;
          id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
          uint64_t v16 = [(HMDAccessoryProfile *)v7 workQueue];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __38__HMDHAPMediaProfile__updatePlayback___block_invoke;
          v26[3] = &unk_264A29D20;
          objc_copyWeak(&v29, (id *)buf);
          id v27 = v14;
          id v28 = v4;
          [v13 writeCharacteristicValues:v15 source:7 message:v28 queue:v16 completionHandler:v26];

          objc_destroyWeak(&v29);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          uint64_t v21 = (void *)MEMORY[0x230FBD990]();
          int v22 = v7;
          uint64_t v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            long long v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v33 = v24;
            _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Update Playback] failed to create target media state write request", buf, 0xCu);
          }
        }
      }
      else
      {
        unint64_t v17 = (void *)MEMORY[0x230FBD990]();
        uint64_t v18 = v7;
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = v20;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Update Playback] accessory not part of profile", buf, 0xCu);
        }
        id v13 = 0;
        BOOL v5 = 0;
      }
    }
    else
    {
      id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      [v4 respondWithError:v13];
      BOOL v5 = 1;
    }
  }
  return v5;
}

void __38__HMDHAPMediaProfile__updatePlayback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([v3 count])
  {
    uint64_t v27 = a1;
    id v28 = v3;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v32;
      do
      {
        uint64_t v9 = 0;
        uint64_t v29 = v6;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
          uint64_t v11 = objc_msgSend(v10, "error", v27);

          if (v11)
          {
            uint64_t v12 = [v10 error];

            id v13 = (void *)MEMORY[0x230FBD990]();
            id v14 = WeakRetained;
            id v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              uint64_t v16 = v8;
              v18 = id v17 = WeakRetained;
              uint64_t v19 = [v10 request];
              uint64_t v20 = [v10 error];
              *(_DWORD *)buf = 138543874;
              id v36 = v18;
              __int16 v37 = 2112;
              int v38 = v19;
              __int16 v39 = 2112;
              long long v40 = v20;
              _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              id WeakRetained = v17;
              uint64_t v8 = v16;
              uint64_t v6 = v29;
            }

            uint64_t v7 = (void *)v12;
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    [*(id *)(v27 + 40) respondWithPayload:0 error:v7];
    id v3 = v28;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = WeakRetained;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      id v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v36 = v24;
      __int16 v37 = 2112;
      int v38 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);
    }
    uint64_t v26 = *(void **)(a1 + 40);
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:50];
    [v26 respondWithError:v7];
  }
}

- (int64_t)airPlayEnable
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  int64_t airPlayEnable = self->_airPlayEnable;
  os_unfair_lock_unlock(&p_lock->lock);
  return airPlayEnable;
}

- (void)setAirPlayEnable:(int64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t airPlayEnable = a3;
  os_unfair_lock_unlock(&p_lock->lock);
}

- (id)_smartSpeakerAirPlayEnableReadRequest
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self _smartSpeakerAirPlayEnableCharacteristic];
  if (v2)
  {
    id v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_smartSpeakerAirPlayEnableCharacteristic
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self _smartSpeakerService];
  id v3 = [v2 findCharacteristicWithType:@"0000025B-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)_smartSpeakerMutedWriteRequestWithMuted:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(HMDHAPMediaProfile *)self _smartSpeakerMutedCharacteristic];
  uint64_t v6 = (void *)v5;
  if (v4 | v5)
  {
    uint64_t v7 = [(id)v5 authorizationData];
    uint64_t v8 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v6 value:v4 authorizationData:v7 type:0];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_smartSpeakerMutedReadRequest
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self _smartSpeakerMutedCharacteristic];
  if (v2)
  {
    id v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_smartSpeakerMutedCharacteristic
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self _smartSpeakerService];
  id v3 = [v2 findCharacteristicWithType:*MEMORY[0x263F0C290]];

  return v3;
}

- (id)_smartSpeakerVolumeWriteRequestWithVolumePercentage:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(HMDHAPMediaProfile *)self smartSpeakerVolumeCharacteristic];
  uint64_t v6 = (void *)v5;
  if (v4 | v5)
  {
    uint64_t v7 = 0;
    if (v4 && v5)
    {
      [(id)v4 floatValue];
      float v9 = v8;
      uint64_t v10 = [v6 metadata];
      uint64_t v11 = [v10 minimumValue];
      if (v11)
      {
        uint64_t v12 = [v10 minimumValue];
        [v12 floatValue];
        float v14 = v13;
      }
      else
      {
        float v14 = 0.0;
      }

      uint64_t v16 = [v10 maximumValue];
      if (v16)
      {
        id v17 = [v10 maximumValue];
        [v17 floatValue];
        float v19 = v18;
      }
      else
      {
        float v19 = 100.0;
      }

      float v20 = v14 + (float)(v9 * (float)(v19 - v14));
      uint64_t v21 = [v10 stepValue];
      uint64_t v23 = v21;
      if (v21)
      {
        [v21 floatValue];
        float v20 = *(float *)&v22 * roundf(v20 / *(float *)&v22);
      }
      *(float *)&double v22 = v20;
      uint64_t v7 = [NSNumber numberWithFloat:v22];
    }
    long long v24 = [v6 authorizationData];
    id v15 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v6 value:v7 authorizationData:v24 type:0];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_smartSpeakerVolumeReadRequest
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self smartSpeakerVolumeCharacteristic];
  if (v2)
  {
    id v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (HMDCharacteristic)smartSpeakerVolumeCharacteristic
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self _smartSpeakerService];
  id v3 = [v2 findCharacteristicWithType:*MEMORY[0x263F0C5A0]];

  return (HMDCharacteristic *)v3;
}

- (id)_smartSpeakerCurrentMediaStateReadRequest
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self smartSpeakerCurrentMediaStateCharacteristic];
  if (v2)
  {
    id v3 = +[HMDCharacteristicRequest requestWithCharacteristic:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (HMDCharacteristic)smartSpeakerCurrentMediaStateCharacteristic
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self _smartSpeakerService];
  id v3 = [v2 findCharacteristicWithType:*MEMORY[0x263F0C0C0]];

  return (HMDCharacteristic *)v3;
}

- (id)_smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDHAPMediaProfile *)self _smartSpeakerTargetMediaStateCharacteristic];
  if (v5)
  {
    uint64_t v6 = NSNumber;
    unint64_t v7 = [v4 integerValue];
    if (v7 > 6) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_2303E4990[v7];
    }
    uint64_t v10 = [v6 numberWithInteger:v8];
    uint64_t v11 = [v5 authorizationData];
    float v9 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v5 value:v10 authorizationData:v11 type:0];
  }
  else
  {
    float v9 = 0;
  }

  return v9;
}

- (id)playStateWriteRequestWithPlaybackState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(HMDHAPMediaProfile *)self _smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:v4];

  return v5;
}

- (id)_smartSpeakerTargetMediaStateCharacteristic
{
  uint64_t v2 = [(HMDHAPMediaProfile *)self _smartSpeakerService];
  id v3 = [v2 findCharacteristicWithType:*MEMORY[0x263F0C518]];

  return v3;
}

- (id)_smartSpeakerService
{
  return [(HMDAccessoryProfile *)self findServiceWithType:@"00000228-0000-1000-8000-0026BB765291"];
}

- (unint64_t)capability
{
  return 1;
}

- (void)registerForNotifications
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HMDHAPMediaProfile;
  [(HMDMediaProfile *)&v17 registerForNotifications];
  id v3 = [(HMDAccessoryProfile *)self accessory];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 home];
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_handleHomeCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v4];

    unint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:self selector:sel_handleHomeCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsResponseReceivedNotification" object:v5];

    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:v4];

    float v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel_handleCharacteristicsUpdated_ name:@"kHMDNotificationCharacteristicsUpdated" object:v4];

    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel_handleResidentAdded_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];

    uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v12 = [v5 residentDeviceManager];
    [v11 addObserver:self selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:v12];
  }
  else
  {
    float v13 = (void *)MEMORY[0x230FBD990]();
    float v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      float v19 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Not registering for notifications as accessory is nil", buf, 0xCu);
    }
  }
}

- (HMDHAPMediaProfile)initWithMediaServices:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 accessory];
  if (v6)
  {
    unint64_t v7 = [(id)objc_opt_class() uniqueIdentifierFromAccessory:v6];
    v17.receiver = self;
    v17.super_class = (Class)HMDHAPMediaProfile;
    uint64_t v8 = [(HMDAccessoryProfile *)&v17 initWithAccessory:v6 uniqueIdentifier:v7 services:v4];
    float v9 = v8;
    if (v8)
    {
      v8->_int64_t airPlayEnable = -1;
      uint64_t v10 = [NSString stringWithFormat:@"%@.HMDHAPMediaProfile.%@", @"com.apple.HomeKitDaemon.Local", v7];
      clientIdentifier = v9->_clientIdentifier;
      v9->_clientIdentifier = (NSString *)v10;
    }
    self = v9;

    uint64_t v12 = self;
  }
  else
  {
    float v13 = (void *)MEMORY[0x230FBD990]();
    float v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      float v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v5;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create media profile, cannot determine accessory from services %@", buf, 0x16u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end