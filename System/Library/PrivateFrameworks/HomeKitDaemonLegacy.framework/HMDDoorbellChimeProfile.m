@interface HMDDoorbellChimeProfile
- (HMDDoorbellChimeProfile)initWithAppleMediaAccessory:(id)a3;
- (NSDate)lastChimeDate;
- (NSString)lastPersonIdentificationText;
- (NSUUID)lastAccessoryUUID;
- (id)doorbellMessagePayloadWithChimeMode:(int64_t)a3 chimeDate:(id)a4 personIdentificationText:(id)a5 accessoryUUID:(id)a6;
- (int64_t)lastChimeMode;
- (void)handleDoorbellChimeMessage:(id)a3;
- (void)registerForMessages;
- (void)sendDoorbellChimeMessageWithChimeMode:(int64_t)a3 chimeDate:(id)a4 personIdentificationText:(id)a5 accessoryUUID:(id)a6;
- (void)setLastAccessoryUUID:(id)a3;
- (void)setLastChimeDate:(id)a3;
- (void)setLastChimeMode:(int64_t)a3;
- (void)setLastPersonIdentificationText:(id)a3;
@end

@implementation HMDDoorbellChimeProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_lastPersonIdentificationText, 0);
  objc_storeStrong((id *)&self->_lastChimeDate, 0);
}

- (void)setLastAccessoryUUID:(id)a3
{
}

- (NSUUID)lastAccessoryUUID
{
  return self->_lastAccessoryUUID;
}

- (void)setLastPersonIdentificationText:(id)a3
{
}

- (NSString)lastPersonIdentificationText
{
  return self->_lastPersonIdentificationText;
}

- (void)setLastChimeDate:(id)a3
{
}

- (NSDate)lastChimeDate
{
  return self->_lastChimeDate;
}

- (void)setLastChimeMode:(int64_t)a3
{
  self->_lastChimeMode = a3;
}

- (int64_t)lastChimeMode
{
  return self->_lastChimeMode;
}

- (id)doorbellMessagePayloadWithChimeMode:(int64_t)a3 chimeDate:(id)a4 personIdentificationText:(id)a5 accessoryUUID:(id)a6
{
  v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [v9 dictionary];
  v14 = [NSNumber numberWithInteger:a3];
  [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2D130]];

  [v13 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2D120]];
  [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2D138]];

  v15 = [v10 UUIDString];

  [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2D118]];
  v16 = (void *)[v13 copy];

  return v16;
}

- (void)handleDoorbellChimeMessage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if ([v7 isCurrentAccessory])
    {
      v8 = [v4 messagePayload];
      v9 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v10 = *MEMORY[0x1E4F2D130];
      id v11 = objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x1E4F2D130]);
      [v9 setObject:v11 forKeyedSubscript:v10];

      uint64_t v12 = *MEMORY[0x1E4F2D120];
      v13 = objc_msgSend(v8, "hmf_dateForKey:", *MEMORY[0x1E4F2D120]);
      [v9 setObject:v13 forKeyedSubscript:v12];

      uint64_t v14 = *MEMORY[0x1E4F2D138];
      v15 = objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x1E4F2D138]);
      [v9 setObject:v15 forKeyedSubscript:v14];

      uint64_t v16 = *MEMORY[0x1E4F2D118];
      v17 = objc_msgSend(v8, "hmf_UUIDForKey:", *MEMORY[0x1E4F2D118]);
      [v9 setObject:v17 forKeyedSubscript:v16];

      id v18 = objc_alloc(MEMORY[0x1E4F65480]);
      uint64_t v19 = *MEMORY[0x1E4F2D128];
      id v20 = objc_alloc(MEMORY[0x1E4F65488]);
      v21 = [(HMDAccessoryProfile *)self uniqueIdentifier];
      v22 = (void *)[v20 initWithTarget:v21];
      v23 = (void *)[v18 initWithName:v19 destination:v22 payload:v9];

      v24 = (void *)MEMORY[0x1D9452090]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = HMFGetLogIdentifier();
        v28 = [v7 uuid];
        int v36 = 138543618;
        v37 = v27;
        __int16 v38 = 2112;
        v39 = v28;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying framework to chime on current accessory - %@", (uint8_t *)&v36, 0x16u);
      }
      v29 = [(HMDAccessoryProfile *)v25 msgDispatcher];
      [v29 sendMessage:v23];

      v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v31 = (void *)[v9 copy];
      [v30 postNotificationName:@"HMDDoorbellShouldChimeNotification" object:v25 userInfo:v31];
    }
    else
    {
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        int v36 = 138543362;
        v37 = v35;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Asked to chime on non-current accessory", (uint8_t *)&v36, 0xCu);
      }
    }
  }
}

- (void)sendDoorbellChimeMessageWithChimeMode:(int64_t)a3 chimeDate:(id)a4 personIdentificationText:(id)a5 accessoryUUID:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v46 = a5;
  id v11 = a6;
  uint64_t v12 = [(HMDAccessoryProfile *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (!v14) {
    goto LABEL_22;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMDDoorbellChimeProfile *)self lastChimeMode] == a3)
  {
    uint64_t v16 = [(HMDDoorbellChimeProfile *)self lastChimeDate];
    if (v16)
    {
      v17 = [(HMDDoorbellChimeProfile *)self lastChimeDate];
      [v10 timeIntervalSinceDate:v17];
      if (fabs(v18) < 1.0
        && ([(HMDDoorbellChimeProfile *)self lastPersonIdentificationText],
            uint64_t v19 = objc_claimAutoreleasedReturnValue(),
            int v20 = HMFEqualObjects(),
            v19,
            v20))
      {
        v21 = [(HMDDoorbellChimeProfile *)self lastAccessoryUUID];
        int v22 = objc_msgSend(v11, "hmf_isEqualToUUID:", v21);

        if (v22)
        {
          v23 = (void *)MEMORY[0x1D9452090]();
          v24 = self;
          HMFGetOSLogHandle();
          v25 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544386;
            v48 = v26;
            __int16 v49 = 2048;
            int64_t v50 = a3;
            __int16 v51 = 2112;
            id v52 = v10;
            __int16 v53 = 2112;
            id v54 = v46;
            __int16 v55 = 2112;
            id v56 = v11;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Ignoring chime (mode: %ld) that is duplicate of previous chime, date: %@, text: %@, accessoryUUID: %@", buf, 0x34u);
          }
          os_unfair_lock_unlock(p_lock);
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
  }
  [(HMDDoorbellChimeProfile *)self setLastChimeMode:a3];
  [(HMDDoorbellChimeProfile *)self setLastChimeDate:v10];
  [(HMDDoorbellChimeProfile *)self setLastPersonIdentificationText:v46];
  [(HMDDoorbellChimeProfile *)self setLastAccessoryUUID:v11];
  os_unfair_lock_unlock(&self->_lock);
  v27 = [(HMDDoorbellChimeProfile *)self doorbellMessagePayloadWithChimeMode:a3 chimeDate:v10 personIdentificationText:v46 accessoryUUID:v11];
  if ([v14 isCurrentAccessory])
  {
    id v28 = objc_alloc(MEMORY[0x1E4F65480]);
    id v29 = objc_alloc(MEMORY[0x1E4F65488]);
    v30 = [(HMDAccessoryProfile *)self uniqueIdentifier];
    uint64_t v31 = *MEMORY[0x1E4F2D128];
    v32 = (void *)[v29 initWithTarget:v30];
    v33 = (void *)[v28 initWithName:v31 destination:v32 payload:v27];

    [(HMDDoorbellChimeProfile *)self handleDoorbellChimeMessage:v33];
  }
  else
  {
    v34 = [v14 device];
    if (v34)
    {
      v35 = [HMDRemoteDeviceMessageDestination alloc];
      int v36 = [(HMDAccessoryProfile *)self uniqueIdentifier];
      v37 = [(HMDRemoteDeviceMessageDestination *)v35 initWithTarget:v36 device:v34];

      __int16 v38 = [HMDRemoteMessage alloc];
      v45 = [(HMDRemoteMessage *)v38 initWithName:*MEMORY[0x1E4F2D128] destination:v37 payload:v27];
      context = (void *)MEMORY[0x1D9452090]();
      v39 = self;
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = HMFGetLogIdentifier();
        v42 = [v14 uuid];
        *(_DWORD *)buf = 138543618;
        v48 = v41;
        __int16 v49 = 2112;
        int64_t v50 = (int64_t)v42;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying remote device to chime - %@", buf, 0x16u);
      }
      v43 = [(HMDAccessoryProfile *)v39 msgDispatcher];
      [v43 sendMessage:v45];
    }
  }

LABEL_22:
}

- (void)registerForMessages
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryProfile *)self accessory];
  uint64_t v5 = [v4 home];
  v6 = (void *)v5;
  if (v4 && v5)
  {
    if ([v4 isCurrentAccessory])
    {
      id v7 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
      v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:3 remoteAccessRequired:0];
      v9 = [(HMDAccessoryProfile *)self msgDispatcher];
      uint64_t v10 = *MEMORY[0x1E4F2D128];
      v16[0] = v7;
      v16[1] = v8;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      [v9 registerForMessage:v10 receiver:self policies:v11 selector:sel_handleDoorbellChimeMessage_];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      double v18 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", buf, 0xCu);
    }
  }
}

- (HMDDoorbellChimeProfile)initWithAppleMediaAccessory:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v5 uuid];
  v13[0] = @"33D815E0-BC5F-4CF3-BB38-BC185A8C53ED";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v8 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:withSalts:", v6, v7);

  v9 = [v5 workQueue];
  v12.receiver = self;
  v12.super_class = (Class)HMDDoorbellChimeProfile;
  uint64_t v10 = [(HMDAccessoryProfile *)&v12 initWithAccessory:v5 uniqueIdentifier:v8 services:0 workQueue:v9];

  return v10;
}

@end