@interface HMDMediaProfile
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)namespace;
+ (id)sessionNamespace;
+ (id)uniqueIdentifierFromAccessory:(id)a3;
+ (id)uniqueIdentifierFromAccessoryUUID:(id)a3;
- (BOOL)_updateAudioControl:(id)a3;
- (BOOL)_updatePlayback:(id)a3;
- (BOOL)_updateRefreshPlayback:(id)a3;
- (HMDMediaProfile)initWithAccessory:(id)a3;
- (HMDMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6;
- (HMDMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6 notificationCenter:(id)a7;
- (HMDMediaSession)mediaSession;
- (HMEEventForwarder)eventForwarder;
- (NSDictionary)assistantObject;
- (NSNotificationCenter)notificationCenter;
- (NSString)description;
- (NSString)mediaRouteID;
- (NSString)urlString;
- (id)parseAndSetPlaybackStateFromResponsePayload:(id)a3 mediaSessionState:(id)a4 outDidUpdateMediaSessionState:(BOOL *)a5;
- (id)payloadForUpdatedPlaybackState:(void *)a3 shuffleStateNumber:(void *)a4 repeatStateNumber:(void *)a5 volume:(void *)a6 sleepWakeStateNumber:(void *)a7 mediaUniqueIdentifier:;
- (unint64_t)capability;
- (void)_handleMediaResponses:(id)a3 message:(id)a4;
- (void)_handleMediaSessionSetAudioControl:(id)a3;
- (void)_handleRefreshPlayback:(id)a3;
- (void)_handleSetPlayback:(id)a3;
- (void)_handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5;
- (void)_sessionPlaybackStateUpdated:(id)a3 notifyXPCClients:(BOOL)a4;
- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)handleSessionPlaybackStateUpdatedNotification:(id)a3;
- (void)handleSessionUpdatedNotification:(id)a3;
- (void)handleSessionVolumeUpdatedNotification:(id)a3;
- (void)handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5;
- (void)registerForMessages;
- (void)registerForNotifications;
- (void)sessionAudioControlUpdated:(id)a3;
- (void)setMediaSession:(id)a3;
- (void)unregisterForNotifications;
- (void)updateWithResponses:(id)a3 requestMessageInformation:(id)a4;
@end

@implementation HMDMediaProfile

- (NSDictionary)assistantObject
{
  v69[2] = *MEMORY[0x263EF8340];
  v3 = [(HMDAccessoryProfile *)self accessory];
  v4 = [v3 name];
  v5 = [v3 home];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 name];

    if (v7)
    {
      if (v4)
      {
        id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
        v63[0] = *MEMORY[0x263F655E8];
        v62[0] = @"objectType";
        v62[1] = @"objectIdentifier";
        v9 = [(HMDMediaProfile *)self urlString];
        v63[1] = v9;
        v62[2] = @"objectHome";
        v10 = [v6 name];
        v63[2] = v10;
        v62[3] = @"objectHomeIdentifier";
        v11 = [v6 urlString];
        v63[3] = v11;
        v63[4] = self;
        v62[4] = @"objectReference";
        v62[5] = @"objectName";
        v63[5] = v4;
        v12 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:6];
        v13 = (void *)[v8 initWithDictionary:v12];

        id v14 = v3;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v15 = v14;
        }
        else {
          v15 = 0;
        }
        id v16 = v15;

        v17 = [v14 category];
        v18 = [v17 categoryType];
        char v19 = [v18 isEqual:*MEMORY[0x263F0B030]];

        v58 = v4;
        v59 = v17;
        if (v19)
        {
          v20 = (id *)MEMORY[0x263F65638];
          v21 = (id *)MEMORY[0x263F656E8];
          goto LABEL_25;
        }
        v26 = [v17 categoryType];
        char v27 = [v26 isEqual:*MEMORY[0x263F0B0A0]];

        if (v27)
        {
          v20 = (id *)MEMORY[0x263F65678];
        }
        else
        {
          v29 = [v17 categoryType];
          char v30 = [v29 isEqual:*MEMORY[0x263F0B010]];

          if (v30)
          {
            v20 = (id *)MEMORY[0x263F65638];
            v21 = (id *)MEMORY[0x263F656D0];
            goto LABEL_25;
          }
          v31 = [v17 categoryType];
          char v32 = [v31 isEqual:*MEMORY[0x263F0B130]];

          if ((v32 & 1) == 0)
          {
            v33 = [v16 siriEndpointProfile];

            if (!v33)
            {
              id v55 = v16;
              v38 = (void *)MEMORY[0x230FBD990]();
              v39 = self;
              v40 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v41;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v17;
                _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@MediaProfile with invalid accessory category: %@", buf, 0x16u);
              }
              v57 = 0;
              id v34 = 0;
              id v16 = v55;
              goto LABEL_31;
            }
          }
          v20 = (id *)MEMORY[0x263F65638];
        }
        v21 = (id *)MEMORY[0x263F657C8];
LABEL_25:
        id v34 = *v21;
        id v35 = *v20;
        v57 = v35;
        if (v34)
        {
          v36 = v59;
          if (v35)
          {
            v60[0] = @"objectServiceType";
            v60[1] = @"objectServiceSubType";
            v61[0] = v34;
            v61[1] = v35;
            v37 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
            [v13 addEntriesFromDictionary:v37];
          }
          goto LABEL_32;
        }
LABEL_31:
        v36 = v59;
LABEL_32:
        v42 = [v14 name];
        [v13 setObject:v42 forKey:@"objectAccessory"];

        v43 = [v14 urlString];
        [v13 setObject:v43 forKey:@"objectAccessoryIdentifier"];

        id v44 = v14;
        v45 = [v44 room];
        v46 = [v45 name];
        if (v46)
        {
          id v56 = v34;
          id v47 = v16;
          v48 = v13;
          v49 = [v44 home];
          v50 = [v49 name];
          char v51 = [v46 isEqualToString:v50];

          if (v51)
          {
            v52 = 0;
          }
          else
          {
            *(void *)buf = v46;
            v69[0] = @"objectRoom";
            v69[1] = @"objectRoomIdentifier";
            v53 = [v45 urlString];
            *(void *)&buf[8] = v53;
            v52 = [NSDictionary dictionaryWithObjects:buf forKeys:v69 count:2];
          }
          v13 = v48;
          id v16 = v47;
          v36 = v59;
          id v34 = v56;
        }
        else
        {
          v52 = 0;
        }

        if (v52) {
          [v13 addEntriesFromDictionary:v52];
        }
        v28 = (void *)[v13 copy];

        v4 = v58;
        goto LABEL_41;
      }
    }
  }
  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v25 = [v6 name];
    }
    else
    {
      v25 = 0;
    }
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    __int16 v65 = 2112;
    v66 = v25;
    __int16 v67 = 2112;
    v68 = v4;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of service is nil: service.accessory.home %@  service.accessory.home.name %@  service.name %@", buf, 0x2Au);
    if (v6) {
  }
    }
  v28 = 0;
LABEL_41:

  return (NSDictionary *)v28;
}

- (NSString)urlString
{
  v2 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)description
{
  v3 = [(HMDAccessoryProfile *)self accessory];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v3 name];
  id v8 = [v3 identifier];
  v9 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  v10 = [v4 stringWithFormat:@"%@<name %@ identifier %@ uniqueIdentifier %@>", v6, v7, v8, v9];

  return (NSString *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaProfile;
  [(HMDAccessoryProfile *)&v22 encodeWithCoder:v4];
  v5 = [MEMORY[0x263EFF990] dataWithLength:16];
  v6 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  id v7 = v5;
  objc_msgSend(v6, "getUUIDBytes:", objc_msgSend(v7, "mutableBytes"));

  id v8 = (void *)MEMORY[0x263F08C38];
  v9 = +[HMDMediaProfile namespace];
  v10 = objc_msgSend(v8, "hmf_UUIDWithNamespace:data:", v9, v7);

  v11 = [v10 UUIDString];
  [v4 encodeObject:v11 forKey:*MEMORY[0x263F0D150]];

  v12 = [(HMDMediaProfile *)self mediaSession];
  v13 = [(HMDAccessoryProfile *)self accessory];
  id v14 = v13;
  if (v13)
  {
    v15 = [v13 home];
    id v16 = [v14 identifier];
    v17 = [v15 mediaSessionStateWithIdentifier:v16];

    if (!v12 && v17)
    {
      if (objc_msgSend(v4, "hmd_isForXPCTransport"))
      {
        v18 = [HMDMediaSession alloc];
        v23[0] = self;
        char v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
        v12 = [(HMDMediaSession *)v18 initWithEndpoint:0 mediaProfiles:v19 state:v17];
      }
      else
      {
        v12 = 0;
      }
    }
  }
  else
  {
    v17 = 0;
  }
  [v4 encodeObject:v12 forKey:*MEMORY[0x263F0D148]];
  v20 = [v14 identifier];
  [v4 encodeObject:v20 forKey:*MEMORY[0x263F0D140]];

  unint64_t v21 = [(HMDMediaProfile *)self capability];
  [v4 encodeInteger:v21 forKey:*MEMORY[0x263F0D138]];
}

- (void)sessionAudioControlUpdated:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v4 = [v29 userInfo];
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    __int16 v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@sessionAudioControlUpdated %@", buf, 0x16u);
  }
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0D1D8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 messageIdentifier];
  uint64_t v13 = *MEMORY[0x263F0D178];
  id v14 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x263F0D178]);
  uint64_t v15 = *MEMORY[0x263F0D160];
  id v16 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x263F0D160]);
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v18 = v17;
  if (v14) {
    [v17 setValue:v14 forKey:v13];
  }
  if (v16) {
    [v18 setValue:v16 forKey:v15];
  }
  char v19 = (void *)MEMORY[0x230FBD990]();
  v20 = v6;
  unint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_super v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v22;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Notify clients of updated audio control state", buf, 0xCu);
  }
  v23 = [MEMORY[0x263F42590] entitledMessageWithName:*MEMORY[0x263F0D168] identifier:v12 messagePayload:v18];
  id v24 = objc_alloc(MEMORY[0x263F42570]);
  v25 = [(HMDAccessoryProfile *)v20 uniqueIdentifier];
  v26 = (void *)[v24 initWithTarget:v25];
  [v23 setDestination:v26];

  char v27 = [(HMDAccessoryProfile *)v20 msgDispatcher];
  v28 = (void *)[v23 copy];
  [v27 sendMessage:v28 completionHandler:0];
}

- (void)handleSessionVolumeUpdatedNotification:(id)a3
{
  v37[8] = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  v5 = [(HMDMediaProfile *)self mediaSession];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F54DD8]];

  id v7 = [v5 uuid];
  id v8 = [v7 UUIDString];
  v9 = v8;
  if (!v8 || !v6)
  {

LABEL_10:
    goto LABEL_11;
  }
  int IsLocalOrigin = MROriginIsLocalOrigin();

  if (IsLocalOrigin)
  {
    id v7 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x263F54DF0]);
    if (v7)
    {
      id v11 = [v5 state];

      if (v11)
      {
        v12 = [v5 state];
        uint64_t v13 = [v12 mediaUniqueIdentifier];
        id v14 = (void *)v13;
        uint64_t v15 = &stru_26E2EB898;
        if (v13) {
          uint64_t v15 = (__CFString *)v13;
        }
        id v16 = v15;

        v36[0] = *MEMORY[0x263F0D218];
        id v35 = [v5 uuid];
        uint64_t v34 = [v35 UUIDString];
        v37[0] = v34;
        v36[1] = *MEMORY[0x263F0D1A8];
        id v17 = NSNumber;
        v33 = [v5 state];
        __int16 v32 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v33, "playbackState"));
        v37[1] = v32;
        v36[2] = *MEMORY[0x263F0D200];
        v18 = NSNumber;
        v31 = [v5 state];
        char v30 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v31, "shuffleState"));
        v37[2] = v30;
        v36[3] = *MEMORY[0x263F0D1D0];
        char v19 = NSNumber;
        v20 = [v5 state];
        unint64_t v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "repeatState"));
        uint64_t v22 = *MEMORY[0x263F0D220];
        v37[3] = v21;
        v37[4] = v7;
        uint64_t v23 = *MEMORY[0x263F0D190];
        v36[4] = v22;
        v36[5] = v23;
        v37[5] = v16;
        v37[6] = MEMORY[0x263EFFA88];
        id v24 = v16;
        uint64_t v25 = *MEMORY[0x263F0D210];
        v36[6] = @"force-notify";
        v36[7] = v25;
        v26 = NSNumber;
        char v27 = [v5 state];
        v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "sleepWakeState"));
        v37[7] = v28;
        id v29 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:8];

        [(HMDMediaProfile *)self handleSessionUpdatedNotification:v29];
      }
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)handleSessionPlaybackStateUpdatedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = (id)[v4 mutableCopy];

  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"session-state-changed"];
  [(HMDMediaProfile *)self handleSessionUpdatedNotification:v5];
}

- (void)handleSessionUpdatedNotification:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x263F0D218]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
  id v7 = [(HMDMediaProfile *)self mediaSession];
  id v8 = [v7 uuid];
  char v9 = HMFEqualObjects();

  if (v9)
  {
    LODWORD(v10) = objc_msgSend(v4, "hmf_BOOLForKey:", @"force-notify");
    id v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0D1D8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v10;
    }
    id v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      v18 = &stru_26E2EB898;
      int v26 = 138543874;
      char v27 = v17;
      __int16 v28 = 2112;
      if (v10) {
        v18 = @" - force notifying clients on remote notification";
      }
      id v29 = v5;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Got a playback state update for media session %@%@", (uint8_t *)&v26, 0x20u);
    }
    [(HMDMediaProfile *)v15 _sessionPlaybackStateUpdated:v4 notifyXPCClients:v10];
  }
  else
  {
    char v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    unint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = [(HMDMediaProfile *)v20 mediaSession];
      id v24 = [v23 uuid];
      uint64_t v25 = [v24 UUIDString];
      int v26 = 138544130;
      char v27 = v22;
      __int16 v28 = 2112;
      id v29 = v5;
      __int16 v30 = 2112;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Media session %@ playback notification does not match our media session:%@ ui:%@", (uint8_t *)&v26, 0x2Au);
    }
  }
}

- (void)_handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDAccessoryProfile *)v12 accessory];
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@The accessory %@ does not support _handleSetValue:", buf, 0x16u);
  }
  if (v10)
  {
    id v16 = +[HMDMediaPropertyRequest requestWithProperty:v9 mediaProfile:v12];
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v18 = +[HMDMediaPropertyResponse responseWithRequest:v16 error:v17];

    unint64_t v21 = v18;
    char v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    v20 = +[HMDMediaPropertyResponse serializeResponses:v19];
    v10[2](v10, 0, v20);
  }
}

- (void)handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryProfile *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__HMDMediaProfile_handleSetValue_withRequestProperty_withCompletionHandler___block_invoke;
  v15[3] = &unk_264A2EE30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __76__HMDMediaProfile_handleSetValue_withRequestProperty_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSetValue:*(void *)(a1 + 40) withRequestProperty:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 56)];
}

- (id)parseAndSetPlaybackStateFromResponsePayload:(id)a3 mediaSessionState:(id)a4 outDidUpdateMediaSessionState:(BOOL *)a5
{
  id v7 = a4;
  id v8 = objc_msgSend(a3, "hmf_numberForKey:", *MEMORY[0x263F0D1A8]);
  uint64_t v9 = [v8 unsignedIntegerValue];
  if (v8)
  {
    uint64_t v10 = v9;
    if (v9 != [v7 playbackState])
    {
      [v7 setPlaybackState:v10];
      *a5 = 1;
    }
  }

  return v8;
}

- (void)_sessionPlaybackStateUpdated:(id)a3 notifyXPCClients:(BOOL)a4
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_msgSend(v5, "hmf_numberForKey:", @"session-state-changed");
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    [v6 BOOLValue];
    HMFBooleanToString();
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v163 = v10;
    __int16 v164 = 2112;
    v165 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@_sessionPlaybackStateUpdated with HMDMediaProfileHasMediaSessionStateChangedKey: %@", buf, 0x16u);
  }
  if (v6) {
    unsigned __int8 v12 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v12 = 0;
  }
  unsigned __int8 v161 = v12;
  v149 = [(HMDMediaProfile *)v8 mediaSession];
  id v13 = [v149 state];
  id v14 = [(HMDAccessoryProfile *)v8 accessory];
  v155 = [v14 home];
  v151 = v14;
  if (v13)
  {
    BOOL v143 = 1;
  }
  else
  {
    id v15 = v14;
    if (v8)
    {
      id v16 = objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x263F0D180]);
      id v17 = [(HMDAccessoryProfile *)v8 uniqueIdentifier];
      id v18 = [v17 UUIDString];
      int v19 = [v16 isEqualToString:v18];

      if (v19)
      {
        uint64_t v20 = [v15 identifier];

        id v16 = (void *)v20;
      }
    }
    else
    {
      id v16 = 0;
    }

    id v13 = [v155 mediaSessionStateWithIdentifier:v16];
    BOOL v143 = v13 != 0;
    if (!v13)
    {
      id v21 = v155;
      id v22 = v15;
      uint64_t v23 = v16;
      if (v8)
      {
        __int16 v24 = (void *)MEMORY[0x230FBD990]();
        uint64_t v25 = v8;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          char v27 = v141 = v6;
          [v22 identifier];
          __int16 v28 = v159 = v22;
          *(_DWORD *)buf = 138543874;
          v163 = v27;
          __int16 v164 = 2112;
          v165 = v23;
          __int16 v166 = 2112;
          v167 = v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating a media session state for a remote session (sessionIdentifier %@; accessoryIdentifier %@) update",
            buf,
            0x20u);

          id v22 = v159;
          v6 = v141;
        }

        id v13 = [[HMDMediaSessionState alloc] initWithSessionIdentifier:v23];
        [v21 addMediaSessionState:v13];
      }
      else
      {
        id v13 = 0;
      }

      unsigned __int8 v161 = 1;
      id v14 = v151;
    }
  }
  v156 = [(HMDMediaProfile *)v8 parseAndSetPlaybackStateFromResponsePayload:v5 mediaSessionState:v13 outDidUpdateMediaSessionState:&v161];
  id v29 = v13;
  __int16 v30 = v29;
  v31 = (void *)MEMORY[0x263F0D1D0];
  __int16 v32 = (void *)MEMORY[0x263F0D220];
  id v33 = (void *)MEMORY[0x263F0D190];
  if (v8)
  {
    uint64_t v34 = objc_msgSend(v5, "hmf_numberForKey:", *MEMORY[0x263F0D200]);
    uint64_t v35 = [v34 unsignedIntegerValue];
    v158 = v34;
    if (v34)
    {
      uint64_t v36 = v35;
      if (v35 != [(HMDMediaSessionState *)v30 shuffleState])
      {
        [(HMDMediaSessionState *)v30 setShuffleState:v36];
        unsigned __int8 v161 = 1;
      }
    }
    else
    {
      v158 = 0;
    }

    v37 = v30;
    v38 = objc_msgSend(v5, "hmf_numberForKey:", *v31);
    uint64_t v39 = [v38 unsignedIntegerValue];
    v157 = v38;
    if (v38)
    {
      uint64_t v40 = v39;
      if (v39 != [(HMDMediaSessionState *)v37 repeatState])
      {
        [(HMDMediaSessionState *)v37 setRepeatState:v40];
        unsigned __int8 v161 = 1;
      }
    }
    else
    {
      v157 = 0;
    }

    v41 = v37;
    v160 = objc_msgSend(v5, "hmf_numberForKey:", *v32);
    if (v160)
    {
      uint64_t v42 = [(HMDMediaSessionState *)v41 volume];
      if (!v42) {
        goto LABEL_30;
      }
      v43 = (void *)v42;
      [v160 floatValue];
      float v45 = v44;
      v46 = [(HMDMediaSessionState *)v41 volume];
      [v46 floatValue];
      float v48 = vabds_f32(v45, v47);
      float v49 = *MEMORY[0x263F0E928];

      if (v48 > v49)
      {
LABEL_30:
        [(HMDMediaSessionState *)v41 setVolume:v160];
        unsigned __int8 v161 = 1;
      }
    }
    else
    {
      v160 = 0;
    }

    v50 = v41;
    char v51 = objc_msgSend(v5, "hmf_stringForKey:", *v33);
    if (v51)
    {
      v52 = [(HMDMediaSessionState *)v50 mediaUniqueIdentifier];
      char v53 = [v51 isEqualToString:v52];

      if ((v53 & 1) == 0)
      {
        [(HMDMediaSessionState *)v50 setMediaUniqueIdentifier:v51];
        unsigned __int8 v161 = 1;
      }
    }

    v54 = v50;
    id v55 = objc_msgSend(v5, "hmf_numberForKey:", *MEMORY[0x263F0D210]);
    uint64_t v56 = [v55 unsignedIntegerValue];
    if (v55)
    {
      uint64_t v57 = v56;
      if (v56 != [(HMDMediaSessionState *)v54 sleepWakeState])
      {
        [(HMDMediaSessionState *)v54 setSleepWakeState:v57];
        unsigned __int8 v161 = 1;
      }
    }
  }
  else
  {

    v129 = v30;
    v130 = v129;

    v131 = v130;
    v132 = v131;
    char v51 = 0;
    v157 = 0;
    v158 = 0;
    v160 = 0;
    id v55 = 0;
  }
  v150 = v30;

  v58 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0D1D8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v59 = v58;
  }
  else {
    v59 = 0;
  }
  id v60 = v59;

  [v60 messageIdentifier];
  v154 = v153 = v60;
  if (v161) {
    BOOL v61 = 0;
  }
  else {
    BOOL v61 = v60 == 0;
  }
  int v62 = !v61;
  v63 = @", state has not changed so not notifying clients";
  if (!v61) {
    v63 = @"state has changed, notifying clients";
  }
  v152 = v63;
  v64 = (void *)MEMORY[0x230FBD990]();
  __int16 v65 = v8;
  v66 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    __int16 v67 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138545410;
    v163 = v67;
    __int16 v164 = 2112;
    v165 = v152;
    __int16 v166 = 2112;
    v167 = v156;
    __int16 v168 = 2112;
    v169 = v158;
    __int16 v170 = 2112;
    v171 = v157;
    __int16 v172 = 2112;
    v173 = v160;
    __int16 v174 = 2112;
    v175 = v51;
    __int16 v176 = 2112;
    v177 = v154;
    __int16 v178 = 2112;
    v179 = v55;
    _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_INFO, "%{public}@_sessionPlaybackStateUpdated, %@, p:%@ s:%@ r:%@ v:%@ m:%@, requestMessageID: %@, sleepWakeState: %@", buf, 0x5Cu);

    id v14 = v151;
  }

  if (v62)
  {
    int v68 = v161;
    if (v161)
    {
      v69 = v156;
      if (v8)
      {
        v70 = -[HMDMediaProfile payloadForUpdatedPlaybackState:shuffleStateNumber:repeatStateNumber:volume:sleepWakeStateNumber:mediaUniqueIdentifier:](v65, v156, v158, v157, v160, v55, v51);
        v71 = [(HMDMediaProfile *)v65 notificationCenter];
        [v71 postNotificationName:HMDMediaProfileHasMediaSessionStateChangedNotificationName object:v65 userInfo:v70];

        int v68 = v161;
      }
      BOOL v72 = v68 != 0;
    }
    else
    {
      BOOL v72 = 0;
      v69 = v156;
    }
    v142 = v6;
    if (a4 || v72)
    {
      if (v8)
      {
        id v74 = v154;
        v75 = -[HMDMediaProfile payloadForUpdatedPlaybackState:shuffleStateNumber:repeatStateNumber:volume:sleepWakeStateNumber:mediaUniqueIdentifier:](v65, v69, v158, v157, v160, v55, v51);
        v76 = (void *)MEMORY[0x263F42590];
        uint64_t v77 = *MEMORY[0x263F0D1B0];
        v78 = (void *)[v75 copy];
        v79 = [v76 entitledMessageWithName:v77 identifier:v74 messagePayload:v78];

        id v80 = objc_alloc(MEMORY[0x263F42570]);
        v81 = [(HMDAccessoryProfile *)v65 uniqueIdentifier];
        v82 = (void *)[v80 initWithTarget:v81];
        [v79 setDestination:v82];

        v83 = [(HMDAccessoryProfile *)v65 msgDispatcher];
        v84 = (void *)[v79 copy];
        [v83 sendMessage:v84];

        v69 = v156;
        int v68 = v161;
      }
      BOOL v73 = v68 == 0;
      v6 = v142;
      id v14 = v151;
    }
    else
    {
      BOOL v73 = 1;
    }
    BOOL v85 = v143;
    if (v69) {
      BOOL v85 = 0;
    }
    if (v160) {
      BOOL v85 = 0;
    }
    if (v51) {
      BOOL v85 = 0;
    }
    if (v158) {
      BOOL v85 = 0;
    }
    if (v157) {
      BOOL v85 = 0;
    }
    if (!v73 && !v85)
    {
      int v86 = [v14 isCurrentAccessory];
      if (v14)
      {
        if (v86 && v155 && v8)
        {
          v87 = (objc_class *)MEMORY[0x263F0DFB8];
          id v144 = v155;
          id v147 = v14;
          v88 = v150;
          id v138 = [v87 alloc];
          v135 = [(HMDMediaSessionState *)v88 mediaUniqueIdentifier];
          v89 = [(HMDMediaSessionState *)v88 volume];
          [v89 doubleValue];
          double v91 = v90;
          uint64_t v92 = [(HMDMediaSessionState *)v88 playbackState];
          uint64_t v93 = [(HMDMediaSessionState *)v88 shuffleState];
          uint64_t v94 = [(HMDMediaSessionState *)v88 repeatState];

          v139 = (void *)[v138 initWithMediaIdentifier:v135 volume:v92 playbackState:v93 shuffleState:v94 repeatState:v91];
          [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
          double v96 = v95;
          id v97 = objc_alloc(MEMORY[0x263F49390]);
          v98 = [v147 uuid];
          v99 = [v98 UUIDString];
          v136 = (void *)[v97 initWithSource:v99 cachePolicy:2 combineType:2 timestamp:v96];

          id v100 = objc_alloc(MEMORY[0x263F49380]);
          v101 = [v139 protoData];
          v133 = (void *)[v100 initWithEventData:v101 metadata:v136];

          v102 = (void *)MEMORY[0x263F0DFA8];
          uint64_t v103 = *MEMORY[0x263F0B2E8];
          v104 = [v144 uuid];

          v105 = [v147 uuid];

          v106 = [v102 topicFromSuffixID:v103 homeUUID:v104 accessoryUUID:v105];

          v6 = v142;
          id v14 = v151;
          v107 = [(HMDMediaProfile *)v65 eventForwarder];
          [v107 forwardEvent:v133 topic:v106 completion:0];
        }
      }
    }
    if (!v153
      || ([v155 primaryResident],
          v108 = objc_claimAutoreleasedReturnValue(),
          [v108 device],
          v109 = objc_claimAutoreleasedReturnValue(),
          int v110 = [v109 isCurrentDevice],
          v109,
          v108,
          v110))
    {
      id v148 = v156;
      id v145 = v158;
      id v140 = v157;
      id v137 = v160;
      id v111 = v55;
      id v134 = v51;
      v112 = v111;
      if (v8)
      {
        id v113 = objc_alloc_init(MEMORY[0x263EFF980]);
        v114 = [MEMORY[0x263EFF910] date];
        if (v156)
        {
          v115 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x263F0D1A8] mediaProfile:v65];
          v116 = +[HMDMediaPropertyResponse responseWithRequest:v115 value:v148 updatedTime:v114];
          [v113 addObject:v116];

          id v111 = v112;
        }
        if (v158)
        {
          v117 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x263F0D200] mediaProfile:v65];
          v118 = +[HMDMediaPropertyResponse responseWithRequest:v117 value:v145 updatedTime:v114];
          [v113 addObject:v118];

          id v111 = v112;
        }
        if (v157)
        {
          v119 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x263F0D1D0] mediaProfile:v65];
          v120 = +[HMDMediaPropertyResponse responseWithRequest:v119 value:v140 updatedTime:v114];
          [v113 addObject:v120];

          id v111 = v112;
        }
        if (v160)
        {
          v121 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x263F0D220] mediaProfile:v65];
          v122 = +[HMDMediaPropertyResponse responseWithRequest:v121 value:v137 updatedTime:v114];
          [v113 addObject:v122];

          id v111 = v112;
        }
        if (v51)
        {
          v123 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x263F0D190] mediaProfile:v65];
          v124 = +[HMDMediaPropertyResponse responseWithRequest:v123 value:v134 updatedTime:v114];
          [v113 addObject:v124];

          id v111 = v112;
        }
        if (v111)
        {
          v125 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x263F0D210] mediaProfile:v65];
          v126 = +[HMDMediaPropertyResponse responseWithRequest:v125 value:v111 updatedTime:v114];
          [v113 addObject:v126];
        }
        v127 = objc_msgSend(v113, "copy", v134);
      }
      else
      {
        v127 = 0;
      }

      v6 = v142;
      id v14 = v151;
      if ([v127 count])
      {
        v128 = (void *)[v127 copy];
        [v155 notifyRemoteUsersOfChangedProperties:v128 requestMessageInformation:v153];
      }
    }
  }
}

- (id)payloadForUpdatedPlaybackState:(void *)a3 shuffleStateNumber:(void *)a4 repeatStateNumber:(void *)a5 volume:(void *)a6 sleepWakeStateNumber:(void *)a7 mediaUniqueIdentifier:
{
  id v13 = (objc_class *)MEMORY[0x263EFF9A0];
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = a2;
  uint64_t v20 = (void *)[[v13 alloc] initWithCapacity:7];
  id v21 = [a1 uniqueIdentifier];
  id v22 = [v21 UUIDString];
  [v20 setValue:v22 forKey:*MEMORY[0x263F0D218]];

  [v20 setValue:v19 forKey:*MEMORY[0x263F0D1A8]];
  [v20 setValue:v18 forKey:*MEMORY[0x263F0D200]];

  [v20 setValue:v17 forKey:*MEMORY[0x263F0D1D0]];
  [v20 setValue:v16 forKey:*MEMORY[0x263F0D220]];

  [v20 setValue:v14 forKey:*MEMORY[0x263F0D190]];
  [v20 setValue:v15 forKey:*MEMORY[0x263F0D210]];

  uint64_t v23 = (void *)[v20 copy];
  return v23;
}

- (void)updateWithResponses:(id)a3 requestMessageInformation:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(HMDAccessoryProfile *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__HMDMediaProfile_updateWithResponses_requestMessageInformation___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Skipping updating media profile due to empty response array", buf, 0xCu);
    }
  }
}

void __65__HMDMediaProfile_updateWithResponses_requestMessageInformation___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v5;
      __int16 v41 = 2112;
      uint64_t v42 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating media profile with responses %@", buf, 0x16u);
    }
    id v7 = *(void **)(a1 + 32);
  }
  else
  {
    id v7 = 0;
  }
  id v8 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v9 = [v7 count];
  if (*(void *)(a1 + 48)) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = v9;
  }
  [v8 dictionaryWithCapacity:v10];
  __int16 v32 = v31 = a1;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v35;
    uint64_t v15 = *MEMORY[0x263F0D180];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v18 = [v17 request];
        uint64_t v19 = [v18 property];
        uint64_t v20 = +[HMDMediaSession mediaPropertyMessageKeys];
        int v21 = [v20 containsObject:v19];

        if (v21)
        {
          id v22 = [v17 value];
          +[HMDMediaSession mediaPropertyValueTypeWithMessageKey:v19];
          if (objc_opt_isKindOfClass()) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = 0;
          }
          [v32 setValue:v23 forKey:v19];
        }
        __int16 v24 = [v18 property];
        int v25 = [v24 isEqual:v15];

        if (v25)
        {
          uint64_t v26 = [v17 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v27 = v26;
          }
          else {
            char v27 = 0;
          }
          id v28 = v27;

          id v13 = v28;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }

  if ([v32 count])
  {
    [v32 setValue:*(void *)(v31 + 48) forKey:*MEMORY[0x263F0D1D8]];
    [v32 setValue:v13 forKey:*MEMORY[0x263F0D180]];
    id v29 = *(void **)(v31 + 40);
    __int16 v30 = (void *)[v32 copy];
    [v29 _sessionPlaybackStateUpdated:v30 notifyXPCClients:1];
  }
}

- (void)_handleMediaResponses:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMDMediaProfile__handleMediaResponses_message___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __49__HMDMediaProfile__handleMediaResponses_message___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v56 = *MEMORY[0x263EF8340];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v37 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (!v37) {
    goto LABEL_28;
  }
  uint64_t v2 = *(void *)v49;
  uint64_t v36 = *MEMORY[0x263F0D1D8];
  uint64_t v3 = *MEMORY[0x263F0D1A8];
  uint64_t v32 = *(void *)v49;
  uint64_t v33 = v1;
  uint64_t v40 = *MEMORY[0x263F0D180];
  do
  {
    for (uint64_t i = 0; i != v37; ++i)
    {
      uint64_t v5 = v2;
      if (*(void *)v49 != v2) {
        objc_enumerationMutation(obj);
      }
      __int16 v41 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      id v6 = [v41 firstObject];
      id v7 = [v6 request];
      id v8 = [v7 mediaProfile];
      id v9 = [v8 uniqueIdentifier];
      [*(id *)(v1 + 40) uniqueIdentifier];
      uint64_t v11 = v10 = v1;
      int v12 = [v9 isEqual:v11];

      uint64_t v1 = v10;
      id v13 = v6;

      uint64_t v2 = v5;
      if (!v12) {
        goto LABEL_26;
      }
      uint64_t v35 = i;
      id v14 = [[HMDMediaSessionRequestMessageInformation alloc] initWithMessage:*(void *)(v10 + 48)];
      uint64_t v53 = v36;
      v54 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v43 = (void *)[v15 mutableCopy];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v16 = v41;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (!v17)
      {

        goto LABEL_25;
      }
      uint64_t v18 = v17;
      long long v34 = v14;
      char v39 = 0;
      uint64_t v19 = *(void *)v45;
      uint64_t v42 = *(void *)v45;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          id v22 = [v21 request];
          uint64_t v23 = [v22 property];
          int v24 = [v23 isEqual:v3];

          if (v24)
          {
            int v25 = [v21 error];
            if (v25)
            {

LABEL_30:
              __int16 v30 = *(void **)(v33 + 48);
              uint64_t v31 = [v21 error];
              [v30 respondWithError:v31];

              return;
            }
            uint64_t v26 = [v21 value];

            if (!v26) {
              goto LABEL_30;
            }
            char v27 = [v21 value];
            [v43 setObject:v27 forKey:v3];
            char v39 = 1;
            goto LABEL_18;
          }
          id v28 = [v22 property];
          int v29 = [v28 isEqual:v40];

          if (v29)
          {
            char v27 = [v21 value];
            [v43 setObject:v27 forKey:v40];
            uint64_t v19 = v42;
LABEL_18:

            goto LABEL_20;
          }
          uint64_t v19 = v42;
LABEL_20:
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v18) {
          continue;
        }
        break;
      }

      uint64_t v1 = v33;
      id v14 = v34;
      if (v39) {
        [*(id *)(v33 + 40) _sessionPlaybackStateUpdated:v43 notifyXPCClients:1];
      }
LABEL_25:

      uint64_t v2 = v32;
      uint64_t i = v35;
LABEL_26:
    }
    uint64_t v37 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  }
  while (v37);
LABEL_28:

  [*(id *)(v1 + 48) respondWithSuccess];
}

- (void)_handleMediaSessionSetAudioControl:(id)a3
{
  id v5 = a3;
  if (!-[HMDMediaProfile _updateAudioControl:](self, "_updateAudioControl:"))
  {
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v5 respondWithError:v4];
  }
}

- (BOOL)_updateAudioControl:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMediaProfile *)self mediaSession];
  id v6 = v5;
  if (v5)
  {
    [v5 handleMediaSessionSetAudioControl:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@No session for mediaProfile", (uint8_t *)&v12, 0xCu);
    }
  }

  return v6 != 0;
}

- (void)_handleRefreshPlayback:(id)a3
{
  id v5 = a3;
  if (!-[HMDMediaProfile _updateRefreshPlayback:](self, "_updateRefreshPlayback:"))
  {
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v5 respondWithError:v4];
  }
}

- (BOOL)_updateRefreshPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaProfile *)self mediaSession];
  int v6 = [v5 isConnected];
  if (v6) {
    [v5 handleRefreshPlayback:v4];
  }

  return v6;
}

- (void)_handleSetPlayback:(id)a3
{
  id v5 = a3;
  if (!-[HMDMediaProfile _updatePlayback:](self, "_updatePlayback:"))
  {
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v5 respondWithError:v4];
  }
}

- (BOOL)_updatePlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaProfile *)self mediaSession];
  int v6 = [v5 isConnected];
  if (v6) {
    [v5 handleSetPlayback:v4];
  }

  return v6;
}

- (void)setMediaSession:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_mediaSession = &self->_mediaSession;
  if ((HMFEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_mediaSession, a3);
  }
  os_unfair_lock_unlock(&p_lock->lock);
}

- (HMDMediaSession)mediaSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mediaSession;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (unint64_t)capability
{
  return 0;
}

- (HMEEventForwarder)eventForwarder
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDAccessoryProfile *)self accessory];
  id v4 = [v3 home];
  id v5 = [v4 eventForwarder];

  if (!v5)
  {
    int v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get event forwarder for accessory: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  return (HMEEventForwarder *)v5;
}

- (void)unregisterForNotifications
{
  uint64_t v3 = [(HMDMediaProfile *)self notificationCenter];
  [v3 removeObserver:self name:@"HMDMediaSessionDidUpdatePlaybackStateNotification" object:0];

  id v4 = [(HMDMediaProfile *)self notificationCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F54DE8] object:0];
}

- (void)registerForNotifications
{
  uint64_t v3 = [(HMDMediaProfile *)self notificationCenter];
  [v3 addObserver:self selector:sel_handleSessionPlaybackStateUpdatedNotification_ name:@"HMDMediaSessionDidUpdatePlaybackStateNotification" object:0];

  id v4 = [(HMDMediaProfile *)self notificationCenter];
  [v4 addObserver:self selector:sel_handleSessionVolumeUpdatedNotification_ name:*MEMORY[0x263F54DE8] object:0];
}

- (void)registerForMessages
{
  v10[2] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaProfile;
  [(HMDAccessoryProfile *)&v9 registerForMessages];
  uint64_t v3 = [(HMDAccessoryProfile *)self msgDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v10[0] = v4;
  id v5 = [(HMDAccessoryProfile *)self accessory];
  int v6 = [v5 home];
  id v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:0 remoteAccessRequired:0];
  v10[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  [v3 registerForMessage:*MEMORY[0x263F0D1F0] receiver:self policies:v8 selector:sel__handleSetPlayback_];
  [v3 registerForMessage:*MEMORY[0x263F0D1C0] receiver:self policies:v8 selector:sel__handleRefreshPlayback_];
  [v3 registerForMessage:*MEMORY[0x263F0D1E8] receiver:self policies:v8 selector:sel__handleMediaSessionSetAudioControl_];
  [(HMDMediaProfile *)self unregisterForNotifications];
  [(HMDMediaProfile *)self registerForNotifications];
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
  block[2] = __71__HMDMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v13 = v6;
  uint64_t v14 = v8;
  uint64_t v15 = self;
  uint64_t v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __71__HMDMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)HMDMediaProfile;
  objc_msgSendSuper2(&v5, sel_configureWithMessageDispatcher_configurationTracker_, v3, v2);
  id v4 = *(NSObject **)(a1 + 40);
  if (v4) {
    dispatch_group_leave(v4);
  }
}

- (HMDMediaProfile)initWithAccessory:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(id)objc_opt_class() uniqueIdentifierFromAccessory:v4];
  id v6 = [(HMDAccessoryProfile *)self initWithAccessory:v4 uniqueIdentifier:v5 services:0];

  return v6;
}

- (HMDMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x263F08A00];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 defaultCenter];
  id v16 = [(HMDMediaProfile *)self initWithAccessory:v14 uniqueIdentifier:v13 services:v12 workQueue:v11 notificationCenter:v15];

  return v16;
}

- (HMDMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6 notificationCenter:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HMDMediaProfile;
  id v14 = [(HMDAccessoryProfile *)&v17 initWithAccessory:a3 uniqueIdentifier:a4 services:a5 workQueue:a6];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_lock.lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_notificationCenter, a7);
  }

  return v15;
}

- (NSString)mediaRouteID
{
  uint64_t v2 = [(HMDAccessoryProfile *)self accessory];
  uint64_t v3 = [v2 identifier];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_234572 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_234572, &__block_literal_global_15_234573);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_234574;
  return v2;
}

void __30__HMDMediaProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v1_234574;
  logCategory__hmf_once_v1_234574 = v0;
}

+ (id)uniqueIdentifierFromAccessory:(id)a3
{
  id v4 = [a3 uuid];
  objc_super v5 = [a1 uniqueIdentifierFromAccessoryUUID:v4];

  return v5;
}

+ (id)uniqueIdentifierFromAccessoryUUID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF990];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  id v6 = (void *)MEMORY[0x263F08C38];
  id v7 = [(id)objc_opt_class() namespace];
  id v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v7, v5);

  return v8;
}

+ (id)sessionNamespace
{
  if (sessionNamespace_onceToken != -1) {
    dispatch_once(&sessionNamespace_onceToken, &__block_literal_global_12_234579);
  }
  uint64_t v2 = (void *)sessionNamespace_sessionNamespace;
  return v2;
}

void __35__HMDMediaProfile_sessionNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B93C6A7F-75EF-4A55-B3BC-8C09CACC301C"];
  uint64_t v1 = (void *)sessionNamespace_sessionNamespace;
  sessionNamespace_sessionNamespace = v0;
}

+ (id)namespace
{
  if (namespace_onceToken_234584 != -1) {
    dispatch_once(&namespace_onceToken_234584, &__block_literal_global_234585);
  }
  uint64_t v2 = (void *)namespace_namespace_234586;
  return v2;
}

void __28__HMDMediaProfile_namespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"7B3B12CE-F1D8-49D9-A573-4AB2D944B077"];
  uint64_t v1 = (void *)namespace_namespace_234586;
  namespace_namespace_234586 = v0;
}

@end