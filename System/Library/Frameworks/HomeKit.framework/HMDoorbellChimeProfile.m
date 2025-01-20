@interface HMDoorbellChimeProfile
+ (id)logCategory;
- (HMDoorbellChimeProfile)initWithDoorbellChimeProfile:(id)a3;
- (HMDoorbellChimeProfileDelegate)delegate;
- (void)didReceiveDoorbellChimeMessage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDoorbellChimeProfile

uint64_t __38___HMDoorbellChimeProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3;
  logCategory__hmf_once_v3 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
}

- (void)didReceiveDoorbellChimeMessage:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 messagePayload];
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "hmf_numberForKey:", @"HM.doorbell.chime.mode");
    v8 = objc_msgSend(v6, "hmf_dateForKey:", @"HM.doorbell.chime.date");
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    v12 = v11;
    if (v7 && v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v59 = v13;
        __int16 v60 = 2048;
        uint64_t v61 = [v7 integerValue];
        __int16 v62 = 2112;
        v63 = v8;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Received message to chime (mode %ld) on %@", buf, 0x20u);
      }
      uint64_t v14 = [v7 integerValue];
      v15 = [(HMDoorbellChimeProfile *)v10 delegate];
      if ((unint64_t)(v14 - 2) >= 2)
      {
        if (v14 == 1)
        {
          if (objc_opt_respondsToSelector())
          {
            v26 = (void *)MEMORY[0x19F3A64A0]();
            v27 = v10;
            v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v59 = v29;
              __int16 v60 = 2112;
              uint64_t v61 = (uint64_t)v15;
              _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate: %@ of chime", buf, 0x16u);
            }
            v30 = [(HMAccessoryProfile *)v27 accessoryProfile];
            v31 = [v30 context];
            v32 = [v31 delegateCaller];
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke;
            v53[3] = &unk_1E5941EF0;
            id v54 = v15;
            v55 = v27;
            uint64_t v57 = 1;
            id v56 = v8;
            [v32 invokeBlock:v53];
          }
        }
        else
        {
          v33 = (void *)MEMORY[0x19F3A64A0]();
          v34 = v10;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = HMFGetLogIdentifier();
            uint64_t v37 = [v7 integerValue];
            *(_DWORD *)buf = 138543618;
            v59 = v36;
            __int16 v60 = 2048;
            uint64_t v61 = v37;
            _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unknown chime mode (%ld)", buf, 0x16u);
          }
        }
      }
      else
      {
        v16 = objc_msgSend(v6, "hmf_stringForKey:", @"HM.doorbell.chime.personText");
        if (v16)
        {
          if (objc_opt_respondsToSelector())
          {
            context = (void *)MEMORY[0x19F3A64A0]();
            v17 = v10;
            v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v42 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v59 = v42;
              __int16 v60 = 2112;
              uint64_t v61 = (uint64_t)v15;
              __int16 v62 = 2048;
              v63 = v7;
              _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate: %@ of chime (%ld) with person identification text", buf, 0x20u);
            }
            contexta = [(HMAccessoryProfile *)v17 accessoryProfile];
            v19 = [contexta context];
            v20 = [v19 delegateCaller];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke_82;
            v46[3] = &unk_1E593E850;
            id v47 = v15;
            v48 = v17;
            uint64_t v52 = v14;
            id v49 = v8;
            id v50 = v16;
            id v51 = v7;
            [v20 invokeBlock:v46];
          }
        }
        else
        {
          v38 = (void *)MEMORY[0x19F3A64A0]();
          v39 = v10;
          v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = contextb = v38;
            *(_DWORD *)buf = 138543874;
            v59 = v41;
            __int16 v60 = 2048;
            uint64_t v61 = (uint64_t)v7;
            __int16 v62 = 2112;
            v63 = v8;
            _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@No person identification text in spoken message, mode: %ld, date: %@", buf, 0x20u);

            v38 = contextb;
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v59 = v25;
        __int16 v60 = 2048;
        uint64_t v61 = [v7 integerValue];
        __int16 v62 = 2112;
        v63 = v8;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@No chime mode (%ld) or date (%@) in chime message", buf, 0x20u);
      }
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v59 = v24;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@No message payload for chime message", buf, 0xCu);
    }
  }
}

void __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) doorbellChimeProfile:*(void *)(a1 + 40) didChimeWithMode:*(void *)(a1 + 56) chimeDate:*(void *)(a1 + 48)]);
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notified delegate: %@ of chime", (uint8_t *)&v7, 0x16u);
  }
}

void __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke_82(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) doorbellChimeProfile:*(void *)(a1 + 40) didChimeWithMode:*(void *)(a1 + 72) chimeDate:*(void *)(a1 + 48) personIdentificationText:*(void *)(a1 + 56)]);
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 64);
    int v8 = 138543874;
    __int16 v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notified delegate: %@ of chime (%ld) with person identification text", (uint8_t *)&v8, 0x20u);
  }
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDoorbellChimeProfileDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HMDoorbellChimeProfileDelegate *)WeakRetained;
}

- (HMDoorbellChimeProfile)initWithDoorbellChimeProfile:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDoorbellChimeProfile;
  id v5 = [(HMAccessoryProfile *)&v7 initWithAccessoryProfile:v4];
  if (v5) {
    [v4 setDelegate:v5];
  }

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1) {
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_84);
  }
  v2 = (void *)logCategory__hmf_once_v16;

  return v2;
}

uint64_t __37__HMDoorbellChimeProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v16;
  logCategory__hmf_once_v16 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end