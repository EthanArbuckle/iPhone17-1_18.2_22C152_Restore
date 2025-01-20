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
- (id)payloadForUpdatedPlaybackState:(void *)a3 shuffleStateNumber:(void *)a4 repeatStateNumber:(void *)a5 volume:(void *)a6 mediaUniqueIdentifier:;
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
  v69[2] = *MEMORY[0x1E4F143B8];
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
        id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
        v63[0] = *MEMORY[0x1E4F96FE8];
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
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:6];
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
        char v19 = [v18 isEqual:*MEMORY[0x1E4F2C198]];

        v58 = v4;
        v59 = v17;
        if (v19)
        {
          v20 = (id *)MEMORY[0x1E4F970F0];
          v21 = (id *)MEMORY[0x1E4F97190];
          goto LABEL_25;
        }
        v26 = [v17 categoryType];
        char v27 = [v26 isEqual:*MEMORY[0x1E4F2C1D0]];

        if (v27)
        {
          v20 = (id *)MEMORY[0x1E4F97130];
        }
        else
        {
          v29 = [v17 categoryType];
          char v30 = [v29 isEqual:*MEMORY[0x1E4F2C188]];

          if (v30)
          {
            v20 = (id *)MEMORY[0x1E4F970F0];
            v21 = (id *)MEMORY[0x1E4F97188];
            goto LABEL_25;
          }
          v31 = [v17 categoryType];
          char v32 = [v31 isEqual:*MEMORY[0x1E4F2C218]];

          if ((v32 & 1) == 0)
          {
            v33 = [v16 siriEndpointProfile];

            if (!v33)
            {
              id v55 = v16;
              v38 = (void *)MEMORY[0x1D9452090]();
              v39 = self;
              v40 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v41;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v17;
                _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@MediaProfile with invalid accessory category: %@", buf, 0x16u);
              }
              v57 = 0;
              id v34 = 0;
              id v16 = v55;
              goto LABEL_31;
            }
          }
          v20 = (id *)MEMORY[0x1E4F970F0];
        }
        v21 = (id *)MEMORY[0x1E4F971B0];
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
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
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
            v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v69 count:2];
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
  v22 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of service is nil: service.accessory.home %@  service.accessory.home.name %@  service.name %@", buf, 0x2Au);
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
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaProfile;
  [(HMDAccessoryProfile *)&v22 encodeWithCoder:v4];
  v5 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  v6 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  id v7 = v5;
  objc_msgSend(v6, "getUUIDBytes:", objc_msgSend(v7, "mutableBytes"));

  id v8 = (void *)MEMORY[0x1E4F29128];
  v9 = +[HMDMediaProfile namespace];
  v10 = objc_msgSend(v8, "hmf_UUIDWithNamespace:data:", v9, v7);

  v11 = [v10 UUIDString];
  [v4 encodeObject:v11 forKey:*MEMORY[0x1E4F2D960]];

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
        char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
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
  [v4 encodeObject:v12 forKey:*MEMORY[0x1E4F2D958]];
  v20 = [v14 identifier];
  [v4 encodeObject:v20 forKey:*MEMORY[0x1E4F2D950]];

  unint64_t v21 = [(HMDMediaProfile *)self capability];
  [v4 encodeInteger:v21 forKey:*MEMORY[0x1E4F2D948]];
}

- (void)sessionAudioControlUpdated:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v4 = [v29 userInfo];
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    __int16 v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@sessionAudioControlUpdated %@", buf, 0x16u);
  }
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2D9E8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 messageIdentifier];
  uint64_t v13 = *MEMORY[0x1E4F2D988];
  id v14 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x1E4F2D988]);
  uint64_t v15 = *MEMORY[0x1E4F2D970];
  id v16 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x1E4F2D970]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v18 = v17;
  if (v14) {
    [v17 setValue:v14 forKey:v13];
  }
  if (v16) {
    [v18 setValue:v16 forKey:v15];
  }
  char v19 = (void *)MEMORY[0x1D9452090]();
  v20 = v6;
  unint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_super v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Notify clients of updated audio control state", buf, 0xCu);
  }
  v23 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2D978] identifier:v12 messagePayload:v18];
  id v24 = objc_alloc(MEMORY[0x1E4F65488]);
  v25 = [(HMDAccessoryProfile *)v20 uniqueIdentifier];
  v26 = (void *)[v24 initWithTarget:v25];
  [v23 setDestination:v26];

  char v27 = [(HMDAccessoryProfile *)v20 msgDispatcher];
  v28 = (void *)[v23 copy];
  [v27 sendMessage:v28 completionHandler:0];
}

- (void)handleSessionVolumeUpdatedNotification:(id)a3
{
  v32[7] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  v5 = [(HMDMediaProfile *)self mediaSession];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F777F8]];

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
    id v7 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x1E4F77828]);
    if (v7)
    {
      id v11 = [v5 state];

      if (v11)
      {
        v12 = [v5 state];
        uint64_t v13 = [v12 mediaUniqueIdentifier];
        id v14 = (void *)v13;
        uint64_t v15 = &stru_1F2C9F1A8;
        if (v13) {
          uint64_t v15 = (__CFString *)v13;
        }
        id v16 = v15;

        v31[0] = *MEMORY[0x1E4F2DA18];
        char v30 = [v5 uuid];
        id v29 = [v30 UUIDString];
        v32[0] = v29;
        v31[1] = *MEMORY[0x1E4F2D9B8];
        id v17 = NSNumber;
        v28 = [v5 state];
        char v27 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v28, "playbackState"));
        v32[1] = v27;
        v31[2] = *MEMORY[0x1E4F2DA10];
        v18 = NSNumber;
        char v19 = [v5 state];
        v20 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "shuffleState"));
        v32[2] = v20;
        v31[3] = *MEMORY[0x1E4F2D9E0];
        unint64_t v21 = NSNumber;
        objc_super v22 = [v5 state];
        v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "repeatState"));
        uint64_t v24 = *MEMORY[0x1E4F2DA20];
        v32[3] = v23;
        v32[4] = v7;
        uint64_t v25 = *MEMORY[0x1E4F2D9A0];
        v31[4] = v24;
        v31[5] = v25;
        v31[6] = @"force-notify";
        v32[5] = v16;
        v32[6] = MEMORY[0x1E4F1CC38];
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:7];

        [(HMDMediaProfile *)self handleSessionUpdatedNotification:v26];
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

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"session-state-changed"];
  [(HMDMediaProfile *)self handleSessionUpdatedNotification:v5];
}

- (void)handleSessionUpdatedNotification:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x1E4F2DA18]);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  id v7 = [(HMDMediaProfile *)self mediaSession];
  id v8 = [v7 uuid];
  char v9 = HMFEqualObjects();

  if (v9)
  {
    LODWORD(v10) = objc_msgSend(v4, "hmf_BOOLForKey:", @"force-notify");
    id v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2D9E8]];
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
    id v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      v18 = &stru_1F2C9F1A8;
      int v26 = 138543874;
      char v27 = v17;
      __int16 v28 = 2112;
      if (v10) {
        v18 = @" - force notifying clients on remote notification";
      }
      id v29 = v5;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Got a playback state update for media session %@%@", (uint8_t *)&v26, 0x20u);
    }
    [(HMDMediaProfile *)v15 _sessionPlaybackStateUpdated:v4 notifyXPCClients:v10];
  }
  else
  {
    char v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    unint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_super v22 = HMFGetLogIdentifier();
      v23 = [(HMDMediaProfile *)v20 mediaSession];
      uint64_t v24 = [v23 uuid];
      uint64_t v25 = [v24 UUIDString];
      int v26 = 138544130;
      char v27 = v22;
      __int16 v28 = 2112;
      id v29 = v5;
      __int16 v30 = 2112;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Media session %@ playback notification does not match our media session:%@ ui:%@", (uint8_t *)&v26, 0x2Au);
    }
  }
}

- (void)_handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDAccessoryProfile *)v12 accessory];
    *(_DWORD *)buf = 138543618;
    v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@The accessory %@ does not support _handleSetValue:", buf, 0x16u);
  }
  if (v10)
  {
    id v16 = +[HMDMediaPropertyRequest requestWithProperty:v9 mediaProfile:v12];
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v18 = +[HMDMediaPropertyResponse responseWithRequest:v16 error:v17];

    unint64_t v21 = v18;
    char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
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
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HMDMediaProfile_handleSetValue_withRequestProperty_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E6A18398;
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
  id v8 = objc_msgSend(a3, "hmf_numberForKey:", *MEMORY[0x1E4F2D9B8]);
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
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(v5, "hmf_numberForKey:", @"session-state-changed");
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    [v6 BOOLValue];
    HMFBooleanToString();
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v154 = v10;
    __int16 v155 = 2112;
    v156 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@_sessionPlaybackStateUpdated with HMDMediaProfileHasMediaSessionStateChangedKey: %@", buf, 0x16u);
  }
  v143 = v6;
  if (v6) {
    unsigned __int8 v12 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v12 = 0;
  }
  unsigned __int8 v152 = v12;
  v142 = [(HMDMediaProfile *)v8 mediaSession];
  id v13 = [v142 state];
  id v14 = [(HMDAccessoryProfile *)v8 accessory];
  v150 = [v14 home];
  v145 = v14;
  if (v13)
  {
    BOOL v136 = 1;
  }
  else
  {
    id v15 = v14;
    if (v8)
    {
      id v16 = objc_msgSend(v5, "hmf_stringForKey:", *MEMORY[0x1E4F2D990]);
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

    id v13 = [v150 mediaSessionStateWithIdentifier:v16];
    BOOL v136 = v13 != 0;
    if (!v13)
    {
      id v134 = v5;
      id v21 = v150;
      id v22 = v15;
      v23 = v16;
      if (v8)
      {
        __int16 v24 = (void *)MEMORY[0x1D9452090]();
        uint64_t v25 = v8;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          char v27 = HMFGetLogIdentifier();
          __int16 v28 = [v22 identifier];
          *(_DWORD *)buf = 138543874;
          v154 = v27;
          __int16 v155 = 2112;
          v156 = v23;
          __int16 v157 = 2112;
          v158 = v28;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating a media session state for a remote session (sessionIdentifier %@; accessoryIdentifier %@) update",
            buf,
            0x20u);
        }
        id v13 = [[HMDMediaSessionState alloc] initWithSessionIdentifier:v23];
        [v21 addMediaSessionState:v13];
      }
      else
      {
        id v13 = 0;
      }

      unsigned __int8 v152 = 1;
      id v5 = v134;
    }
  }
  v149 = [(HMDMediaProfile *)v8 parseAndSetPlaybackStateFromResponsePayload:v5 mediaSessionState:v13 outDidUpdateMediaSessionState:&v152];
  id v29 = v13;
  __int16 v30 = v29;
  v31 = (void *)MEMORY[0x1E4F2D9E0];
  __int16 v32 = (void *)MEMORY[0x1E4F2DA20];
  id v33 = (void *)MEMORY[0x1E4F2D9A0];
  if (v8)
  {
    uint64_t v34 = objc_msgSend(v5, "hmf_numberForKey:", *MEMORY[0x1E4F2DA10]);
    uint64_t v35 = [v34 unsignedIntegerValue];
    v151 = v34;
    if (v34)
    {
      uint64_t v36 = v35;
      if (v35 != [(HMDMediaSessionState *)v30 shuffleState])
      {
        [(HMDMediaSessionState *)v30 setShuffleState:v36];
        unsigned __int8 v152 = 1;
      }
    }
    else
    {
      v151 = 0;
    }

    v37 = v30;
    v38 = objc_msgSend(v5, "hmf_numberForKey:", *v31);
    uint64_t v39 = [v38 unsignedIntegerValue];
    if (v38)
    {
      uint64_t v40 = v39;
      if (v39 != [(HMDMediaSessionState *)v37 repeatState])
      {
        [(HMDMediaSessionState *)v37 setRepeatState:v40];
        unsigned __int8 v152 = 1;
      }
    }

    v41 = v37;
    v42 = objc_msgSend(v5, "hmf_numberForKey:", *v32);
    if (v42)
    {
      uint64_t v43 = [(HMDMediaSessionState *)v41 volume];
      if (!v43) {
        goto LABEL_29;
      }
      id v44 = (void *)v43;
      [v42 floatValue];
      float v46 = v45;
      id v47 = [(HMDMediaSessionState *)v41 volume];
      [v47 floatValue];
      float v49 = vabds_f32(v46, v48);
      float v50 = *MEMORY[0x1E4F2EC18];

      if (v49 > v50)
      {
LABEL_29:
        [(HMDMediaSessionState *)v41 setVolume:v42];
        unsigned __int8 v152 = 1;
      }
    }

    char v51 = v41;
    v52 = objc_msgSend(v5, "hmf_stringForKey:", *v33);
    if (v52)
    {
      v53 = [(HMDMediaSessionState *)v51 mediaUniqueIdentifier];
      char v54 = [v52 isEqualToString:v53];

      if ((v54 & 1) == 0)
      {
        [(HMDMediaSessionState *)v51 setMediaUniqueIdentifier:v52];
        unsigned __int8 v152 = 1;
      }
    }
  }
  else
  {

    v123 = v30;
    v124 = v123;

    v125 = v124;
    v42 = 0;
    v151 = 0;
    v38 = 0;
    v52 = 0;
  }
  v144 = v30;

  id v55 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2D9E8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v56 = v55;
  }
  else {
    id v56 = 0;
  }
  id v57 = v56;

  [v57 messageIdentifier];
  v148 = v147 = v57;
  if (v152) {
    BOOL v58 = 0;
  }
  else {
    BOOL v58 = v57 == 0;
  }
  int v59 = !v58;
  v60 = @", state has not changed so not notifying clients";
  if (!v58) {
    v60 = @"state has changed, notifying clients";
  }
  v146 = v60;
  v61 = (void *)MEMORY[0x1D9452090]();
  v62 = v8;
  v63 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    v64 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138545154;
    v154 = v64;
    __int16 v155 = 2112;
    v156 = v146;
    __int16 v157 = 2112;
    v158 = v149;
    __int16 v159 = 2112;
    v160 = v151;
    __int16 v161 = 2112;
    v162 = v38;
    __int16 v163 = 2112;
    v164 = v42;
    __int16 v165 = 2112;
    v166 = v52;
    __int16 v167 = 2112;
    v168 = v148;
    _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_INFO, "%{public}@_sessionPlaybackStateUpdated, %@, p:%@ s:%@ r:%@ v:%@ m:%@, requestMessageID: %@", buf, 0x52u);
  }
  __int16 v65 = v149;
  if (v59)
  {
    int v66 = v152;
    if (v152)
    {
      if (v8)
      {
        __int16 v67 = -[HMDMediaProfile payloadForUpdatedPlaybackState:shuffleStateNumber:repeatStateNumber:volume:mediaUniqueIdentifier:](v62, v149, v151, v38, v42, v52);
        v68 = [(HMDMediaProfile *)v62 notificationCenter];
        [v68 postNotificationName:@"HMDMediaProfileHasMediaSessionStateChangedNotificationName" object:v62 userInfo:v67];

        int v66 = v152;
      }
      BOOL v69 = v66 != 0;
    }
    else
    {
      BOOL v69 = 0;
    }
    id v135 = v5;
    if (a4 || v69)
    {
      if (v8)
      {
        id v71 = v148;
        v72 = -[HMDMediaProfile payloadForUpdatedPlaybackState:shuffleStateNumber:repeatStateNumber:volume:mediaUniqueIdentifier:](v62, v149, v151, v38, v42, v52);
        v73 = (void *)MEMORY[0x1E4F654B0];
        uint64_t v74 = *MEMORY[0x1E4F2D9C0];
        v75 = (void *)[v72 copy];
        v76 = [v73 entitledMessageWithName:v74 identifier:v71 messagePayload:v75];

        id v77 = objc_alloc(MEMORY[0x1E4F65488]);
        v78 = [(HMDAccessoryProfile *)v62 uniqueIdentifier];
        v79 = (void *)[v77 initWithTarget:v78];
        [v76 setDestination:v79];

        v80 = [(HMDAccessoryProfile *)v62 msgDispatcher];
        v81 = (void *)[v76 copy];
        [v80 sendMessage:v81];

        __int16 v65 = v149;
        int v66 = v152;
      }
      BOOL v70 = v66 == 0;
      id v5 = v135;
    }
    else
    {
      BOOL v70 = 1;
    }
    BOOL v82 = v136;
    if (v65) {
      BOOL v82 = 0;
    }
    if (v42) {
      BOOL v82 = 0;
    }
    if (v52) {
      BOOL v82 = 0;
    }
    if (v151) {
      BOOL v82 = 0;
    }
    if (v38) {
      BOOL v82 = 0;
    }
    if (!v70 && !v82)
    {
      int v83 = [v145 isCurrentAccessory];
      if (v145)
      {
        if (v83 && v150 && v8)
        {
          v84 = (objc_class *)MEMORY[0x1E4F2E590];
          id v137 = v150;
          id v140 = v145;
          v85 = v144;
          id v131 = [v84 alloc];
          v128 = [(HMDMediaSessionState *)v85 mediaUniqueIdentifier];
          v86 = [(HMDMediaSessionState *)v85 volume];
          [v86 doubleValue];
          double v88 = v87;
          uint64_t v89 = [(HMDMediaSessionState *)v85 playbackState];
          uint64_t v90 = [(HMDMediaSessionState *)v85 shuffleState];
          uint64_t v91 = [(HMDMediaSessionState *)v85 repeatState];

          v132 = (void *)[v131 initWithMediaIdentifier:v128 volume:v89 playbackState:v90 shuffleState:v91 repeatState:v88];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v93 = v92;
          id v94 = objc_alloc(MEMORY[0x1E4F69F48]);
          v95 = [v140 uuid];
          v96 = [v95 UUIDString];
          v129 = (void *)[v94 initWithSource:v96 cachePolicy:2 combineType:2 timestamp:v93];

          id v97 = objc_alloc(MEMORY[0x1E4F69F38]);
          v98 = [v132 protoData];
          v126 = (void *)[v97 initWithEventData:v98 metadata:v129];

          v99 = (void *)MEMORY[0x1E4F2E580];
          uint64_t v100 = *MEMORY[0x1E4F2C378];
          v101 = [v137 uuid];

          v102 = [v140 uuid];

          v103 = [v99 topicFromSuffixID:v100 homeUUID:v101 accessoryUUID:v102];

          id v5 = v135;
          v104 = [(HMDMediaProfile *)v62 eventForwarder];
          [v104 forwardEvent:v126 topic:v103 completion:0];

          __int16 v65 = v149;
        }
      }
    }
    if (!v147
      || ([v150 primaryResident],
          v105 = objc_claimAutoreleasedReturnValue(),
          [v105 device],
          v106 = objc_claimAutoreleasedReturnValue(),
          int v107 = [v106 isCurrentDevice],
          v106,
          v105,
          v107))
    {
      id v141 = v65;
      id v138 = v151;
      id v133 = v38;
      id v130 = v42;
      id v127 = v52;
      if (v8)
      {
        v108 = v65;
        id v109 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v110 = [MEMORY[0x1E4F1C9C8] date];
        if (v108)
        {
          v111 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x1E4F2D9B8] mediaProfile:v62];
          v112 = +[HMDMediaPropertyResponse responseWithRequest:v111 value:v141 updatedTime:v110];
          [v109 addObject:v112];
        }
        if (v151)
        {
          v113 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x1E4F2DA10] mediaProfile:v62];
          v114 = +[HMDMediaPropertyResponse responseWithRequest:v113 value:v138 updatedTime:v110];
          [v109 addObject:v114];
        }
        if (v38)
        {
          v115 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x1E4F2D9E0] mediaProfile:v62];
          v116 = +[HMDMediaPropertyResponse responseWithRequest:v115 value:v133 updatedTime:v110];
          [v109 addObject:v116];
        }
        if (v42)
        {
          v117 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x1E4F2DA20] mediaProfile:v62];
          v118 = +[HMDMediaPropertyResponse responseWithRequest:v117 value:v130 updatedTime:v110];
          [v109 addObject:v118];
        }
        if (v52)
        {
          v119 = +[HMDMediaPropertyRequest requestWithProperty:*MEMORY[0x1E4F2D9A0] mediaProfile:v62];
          v120 = +[HMDMediaPropertyResponse responseWithRequest:v119 value:v127 updatedTime:v110];
          [v109 addObject:v120];
        }
        v121 = (void *)[v109 copy];
      }
      else
      {
        v121 = 0;
      }

      id v5 = v135;
      __int16 v65 = v149;
      if ([v121 count])
      {
        v122 = (void *)[v121 copy];
        [v150 notifyRemoteUsersOfChangedProperties:v122 requestMessageInformation:v147];
      }
    }
  }
}

- (id)payloadForUpdatedPlaybackState:(void *)a3 shuffleStateNumber:(void *)a4 repeatStateNumber:(void *)a5 volume:(void *)a6 mediaUniqueIdentifier:
{
  id v11 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = a2;
  id v17 = (void *)[[v11 alloc] initWithCapacity:7];
  id v18 = [a1 uniqueIdentifier];
  int v19 = [v18 UUIDString];
  [v17 setValue:v19 forKey:*MEMORY[0x1E4F2DA18]];

  [v17 setValue:v16 forKey:*MEMORY[0x1E4F2D9B8]];
  [v17 setValue:v15 forKey:*MEMORY[0x1E4F2DA10]];

  [v17 setValue:v14 forKey:*MEMORY[0x1E4F2D9E0]];
  [v17 setValue:v13 forKey:*MEMORY[0x1E4F2DA20]];

  [v17 setValue:v12 forKey:*MEMORY[0x1E4F2D9A0]];
  uint64_t v20 = (void *)[v17 copy];

  return v20;
}

- (void)updateWithResponses:(id)a3 requestMessageInformation:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(HMDAccessoryProfile *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMDMediaProfile_updateWithResponses_requestMessageInformation___block_invoke;
    block[3] = &unk_1E6A19668;
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Skipping updating media profile due to empty response array", buf, 0xCu);
    }
  }
}

void __65__HMDMediaProfile_updateWithResponses_requestMessageInformation___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating media profile with responses %@", buf, 0x16u);
    }
    id v7 = *(void **)(a1 + 32);
  }
  else
  {
    id v7 = 0;
  }
  id v8 = (void *)MEMORY[0x1E4F1CA60];
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
    uint64_t v15 = *MEMORY[0x1E4F2D990];
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
            v23 = v22;
          }
          else {
            v23 = 0;
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
    [v32 setValue:*(void *)(v31 + 48) forKey:*MEMORY[0x1E4F2D9E8]];
    [v32 setValue:v13 forKey:*MEMORY[0x1E4F2D990]];
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMDMediaProfile__handleMediaResponses_message___block_invoke;
  block[3] = &unk_1E6A19668;
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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
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
  uint64_t v36 = *MEMORY[0x1E4F2D9E8];
  uint64_t v3 = *MEMORY[0x1E4F2D9B8];
  uint64_t v32 = *(void *)v49;
  uint64_t v33 = v1;
  uint64_t v40 = *MEMORY[0x1E4F2D990];
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
      char v54 = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
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
          v23 = [v22 property];
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
    id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
    [v5 respondWithError:v4];
  }
}

- (BOOL)_updateAudioControl:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaProfile *)self mediaSession];
  id v6 = v5;
  if (v5)
  {
    [v5 handleMediaSessionSetAudioControl:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@No session for mediaProfile", (uint8_t *)&v12, 0xCu);
    }
  }

  return v6 != 0;
}

- (void)_handleRefreshPlayback:(id)a3
{
  id v5 = a3;
  if (!-[HMDMediaProfile _updateRefreshPlayback:](self, "_updateRefreshPlayback:"))
  {
    id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
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
    id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDAccessoryProfile *)self accessory];
  id v4 = [v3 home];
  id v5 = [v4 eventForwarder];

  if (!v5)
  {
    int v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get event forwarder for accessory: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  return (HMEEventForwarder *)v5;
}

- (void)unregisterForNotifications
{
  uint64_t v3 = [(HMDMediaProfile *)self notificationCenter];
  [v3 removeObserver:self name:@"HMDMediaSessionDidUpdatePlaybackStateNotification" object:0];

  id v4 = [(HMDMediaProfile *)self notificationCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F77820] object:0];
}

- (void)registerForNotifications
{
  uint64_t v3 = [(HMDMediaProfile *)self notificationCenter];
  [v3 addObserver:self selector:sel_handleSessionPlaybackStateUpdatedNotification_ name:@"HMDMediaSessionDidUpdatePlaybackStateNotification" object:0];

  id v4 = [(HMDMediaProfile *)self notificationCenter];
  [v4 addObserver:self selector:sel_handleSessionVolumeUpdatedNotification_ name:*MEMORY[0x1E4F77820] object:0];
}

- (void)registerForMessages
{
  v10[2] = *MEMORY[0x1E4F143B8];
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
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  [v3 registerForMessage:*MEMORY[0x1E4F2DA00] receiver:self policies:v8 selector:sel__handleSetPlayback_];
  [v3 registerForMessage:*MEMORY[0x1E4F2D9D0] receiver:self policies:v8 selector:sel__handleRefreshPlayback_];
  [v3 registerForMessage:*MEMORY[0x1E4F2D9F8] receiver:self policies:v8 selector:sel__handleMediaSessionSetAudioControl_];
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HMDMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke;
  block[3] = &unk_1E6A19668;
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
  uint64_t v10 = (void *)MEMORY[0x1E4F28EB8];
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
  if (logCategory__hmf_once_t0_164278 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_164278, &__block_literal_global_15_164279);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_164280;
  return v2;
}

uint64_t __30__HMDMediaProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_164280;
  logCategory__hmf_once_v1_164280 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)uniqueIdentifierFromAccessory:(id)a3
{
  id v4 = [a3 uuid];
  objc_super v5 = [a1 uniqueIdentifierFromAccessoryUUID:v4];

  return v5;
}

+ (id)uniqueIdentifierFromAccessoryUUID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [(id)objc_opt_class() namespace];
  id v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v7, v5);

  return v8;
}

+ (id)sessionNamespace
{
  if (sessionNamespace_onceToken != -1) {
    dispatch_once(&sessionNamespace_onceToken, &__block_literal_global_12_164285);
  }
  uint64_t v2 = (void *)sessionNamespace_sessionNamespace;
  return v2;
}

uint64_t __35__HMDMediaProfile_sessionNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B93C6A7F-75EF-4A55-B3BC-8C09CACC301C"];
  uint64_t v1 = sessionNamespace_sessionNamespace;
  sessionNamespace_sessionNamespace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)namespace
{
  if (namespace_onceToken_164290 != -1) {
    dispatch_once(&namespace_onceToken_164290, &__block_literal_global_164291);
  }
  uint64_t v2 = (void *)namespace_namespace_164292;
  return v2;
}

uint64_t __28__HMDMediaProfile_namespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7B3B12CE-F1D8-49D9-A573-4AB2D944B077"];
  uint64_t v1 = namespace_namespace_164292;
  namespace_namespace_164292 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end