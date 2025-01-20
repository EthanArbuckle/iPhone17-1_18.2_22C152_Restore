@interface HMMediaProfile
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessorySettings)settings;
- (HMHome)containerHome;
- (HMMediaProfile)init;
- (HMMediaProfile)initWithMediaProfile:(id)a3;
- (HMMediaProfileDelegate)delegate;
- (HMMediaSession)mediaSession;
- (NSString)routeUID;
- (NSUUID)containerUUID;
- (unint64_t)capability;
- (void)fetchAccessorySleepWakeStateWithCompletion:(id)a3;
- (void)mediaProfile:(id)a3 didUpdateMediaSession:(id)a4;
- (void)refreshStateWithCompletionHandler:(id)a3;
- (void)setCapability:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMMediaProfile

void __56___HMMediaProfile__notifyDelegateOfUpdatedMediaSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mediaProfile:*(void *)(a1 + 32) didUpdateMediaSession:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_routeUID, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMMediaProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMMediaProfileDelegate *)WeakRetained;
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@nil completion handler", (uint8_t *)&v18, 0xCu);
    }
    id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v17);
  }
  v5 = (void (**)(void, void))v4;
  v6 = [(HMMediaProfile *)self mediaSession];
  v7 = v6;
  if (v6)
  {
    [v6 refreshPlaybackStateWithCompletionHandler:v5];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine media session", (uint8_t *)&v18, 0xCu);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void *))v5)[2](v5, v12);
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 mediaSession];
    v9 = [(HMMediaProfile *)self mediaSession];
    char v10 = [v9 mergeFromNewObject:v8];

    unint64_t v11 = [(HMMediaProfile *)self capability];
    if (v11 != [v7 capability])
    {
      -[HMMediaProfile setCapability:](self, "setCapability:", [v7 capability]);
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)fetchAccessorySleepWakeStateWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v29 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMMediaProfile fetchAccessorySleepWakeStateWithCompletion:]", @"completion"];
    v30 = (void *)MEMORY[0x19F3A64A0]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v33;
      __int16 v41 = 2112;
      uint64_t v42 = v29;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v29 userInfo:0];
    objc_exception_throw(v34);
  }
  v5 = (void (**)(void, void, void))v4;
  id v6 = [(HMAccessoryProfile *)self accessory];
  if (v6)
  {
    v7 = [(HMAccessoryProfile *)self accessoryProfile];
    v8 = [v7 context];

    v9 = [v8 messageDispatcher];
    if (v9)
    {
      char v10 = [v6 category];
      unint64_t v11 = [v10 categoryType];
      char v12 = [v11 isEqualToString:@"F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"];

      if (v12)
      {
        id v13 = objc_alloc(MEMORY[0x1E4F65488]);
        v14 = [v6 messageTargetUUID];
        v15 = (void *)[v13 initWithTarget:v14];

        v16 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMFetchAppleMediaAccessorySleepWakeStateMessage" destination:v15 payload:0];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke;
        v35[3] = &unk_1E5945510;
        id v36 = v8;
        v37 = self;
        v38 = v5;
        [v16 setResponseHandler:v35];
        id v17 = (void *)[v16 copy];
        [v9 sendMessage:v17];

LABEL_14:
        goto LABEL_15;
      }
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = 3;
    }
    else
    {
      v22 = (void *)MEMORY[0x19F3A64A0]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v40 = v25;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v8;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch sleep wake state due to no message dispatcher given by context: %@", buf, 0x16u);
      }
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = 21;
    }
    v28 = [v26 hmErrorWithCode:v27];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v28);

    goto LABEL_14;
  }
  int v18 = (void *)MEMORY[0x19F3A64A0]();
  v19 = self;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v40 = v21;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch sleep wake state due to no accessory on media profile", buf, 0xCu);
  }
  v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
  ((void (**)(void, void, void *))v5)[2](v5, 0, v8);
LABEL_15:
}

void __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) delegateCaller];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke_2;
  v12[3] = &unk_1E5944360;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  [v7 invokeBlock:v12];
}

void __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = *(void **)(a1 + 32);
      int v18 = 138543618;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@Fetch accessory SleepWake state request message responded with error: %@", (uint8_t *)&v18, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 48), "hmf_numberForKey:", @"HMFetchAppleMediaAccessorySleepWakeStateKey");
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        int v18 = 138543618;
        v19 = v11;
        __int16 v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetch accessory SleepWake state request message responded with result: %@", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = v7;
      id v15 = v14;
      if (v13)
      {
        if ([v14 unsignedIntValue] == 2) {
          uint64_t v13 = 2;
        }
        else {
          uint64_t v13 = [v15 unsignedIntValue] == 1;
        }
      }

      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, v13, *(void *)(a1 + 32));
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 56);
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
    }
  }
}

- (void)mediaProfile:(id)a3 didUpdateMediaSession:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMMediaProfile *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(HMMediaProfile *)self delegate];
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v14;
      __int16 v52 = 2112;
      id v53 = v7;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media session: %@", buf, 0x16u);
    }
    id v15 = [(HMAccessoryProfile *)v12 accessoryProfile];
    uint64_t v16 = [v15 context];
    id v17 = [v16 delegateCaller];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke;
    v45[3] = &unk_1E5945650;
    id v46 = v10;
    v47 = v12;
    id v48 = v7;
    id v18 = v10;
    [v17 invokeBlock:v45];
  }
  v19 = [(HMMediaProfile *)self delegate];
  if ([v19 conformsToProtocol:&unk_1EEF690C8]) {
    __int16 v20 = v19;
  }
  else {
    __int16 v20 = 0;
  }
  id v21 = v20;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v25;
      __int16 v52 = 2112;
      id v53 = v7;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Notifying media object of updated media session: %@", buf, 0x16u);
    }
    v26 = [(HMAccessoryProfile *)v23 accessoryProfile];
    uint64_t v27 = [v26 context];
    v28 = [v27 delegateCaller];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke_65;
    v41[3] = &unk_1E5945650;
    id v42 = v21;
    uint64_t v43 = v23;
    id v44 = v7;
    [v28 invokeBlock:v41];
  }
  uint64_t v29 = [(HMAccessoryProfile *)self accessory];
  v30 = [v29 home];
  v31 = [v30 mediaSystems];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v32 = v31;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v38;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v32);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v36++), "updateMediaSession:forMediaProfile:", v7, self, (void)v37);
      }
      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v34);
  }
}

uint64_t __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaProfile:*(void *)(a1 + 40) didUpdateMediaSession:*(void *)(a1 + 48)];
}

uint64_t __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke_65(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaObject:*(void *)(a1 + 40) didUpdateMediaSession:*(void *)(a1 + 48)];
}

- (NSUUID)containerUUID
{
  id v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 accessory];

  id v6 = [v5 uuid];

  return (NSUUID *)v6;
}

- (HMHome)containerHome
{
  id v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 accessory];

  id v6 = [v5 containerHome];

  return (HMHome *)v6;
}

- (void)setCapability:(unint64_t)a3
{
  id v4 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 setCapability:a3];
}

- (unint64_t)capability
{
  id v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unint64_t v5 = [v4 capability];
  return v5;
}

- (NSString)routeUID
{
  id v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unint64_t v5 = [v4 routeUID];

  return (NSString *)v5;
}

- (HMMediaSession)mediaSession
{
  id v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unint64_t v5 = [v4 mediaSession];

  return (HMMediaSession *)v5;
}

- (HMAccessorySettings)settings
{
  id v2 = [(HMAccessoryProfile *)self accessory];
  id v3 = [v2 settings];

  return (HMAccessorySettings *)v3;
}

- (HMMediaProfile)initWithMediaProfile:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMMediaProfile;
  unint64_t v5 = [(HMAccessoryProfile *)&v7 initWithAccessoryProfile:v4];
  if (v5) {
    [v4 setDelegate:v5];
  }

  return v5;
}

- (HMMediaProfile)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end