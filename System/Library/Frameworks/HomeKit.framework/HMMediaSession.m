@interface HMMediaSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAudioControl)audioControl;
- (HMMediaProfile)mediaProfile;
- (HMMediaSession)initWithCoder:(id)a3;
- (HMMediaSession)initWithUUID:(id)a3 routeUID:(id)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7 mediaUniqueIdentifier:(id)a8 sleepWakeState:(unint64_t)a9;
- (HMMediaSessionDelegate)delegate;
- (NSString)description;
- (NSString)mediaUniqueIdentifier;
- (NSString)routeUID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMMediaSession)mediaSession;
- (id)messageTargetUUID;
- (id)playbackStateDescription;
- (int64_t)playbackState;
- (int64_t)repeatState;
- (int64_t)shuffleState;
- (unint64_t)hash;
- (unint64_t)sleepWakeState;
- (void)_unconfigure;
- (void)configure:(id)a3 messageTargetUUID:(id)a4;
- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4;
- (void)mediaSession:(id)a3 didUpdateRouteUID:(id)a4;
- (void)mediaSessionDidUpdate:(id)a3;
- (void)pauseWithCompletionHandler:(id)a3;
- (void)refreshPlaybackStateWithCompletionHandler:(id)a3;
- (void)resumeWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaProfile:(id)a3;
- (void)setMediaSession:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateMediaState:(id)a3;
- (void)updatePlaybackState:(id)a3;
- (void)updatePlaybackState:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation HMMediaSession

void __38___HMMediaSession_mergeFromNewObject___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) routeUID];
  [v1 _notifyDelegateOfUpdatedRouteUID:v2];
}

uint64_t __38___HMMediaSession_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 playbackState];

  return [v1 _notifyDelegateOfUpdatedPlaybackState:v2];
}

uint64_t __38___HMMediaSession_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedMediaState];
}

uint64_t __52___HMMediaSession__notifyDelegateOfUpdatedRouteUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSession:*(void *)(a1 + 40) didUpdateRouteUID:*(void *)(a1 + 48)];
}

uint64_t __36___HMMediaSession_updateMediaState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMediaState:*(void *)(a1 + 40) completion:0];
}

void __39___HMMediaSession_updatePlaybackState___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4 = @"pb-state";
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [*(id *)(a1 + 40) _updateMediaState:v3 completion:0];
}

void __48___HMMediaSession__updateMediaState_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Set muted returned error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __53___HMMediaSession__notifyDelegateOfUpdatedMediaState__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v5 = v16 = v2;
    v6 = [*(id *)(a1 + 32) uuid];
    uint64_t v7 = [*(id *)(a1 + 32) playbackState];
    uint64_t v8 = [*(id *)(a1 + 32) shuffleState];
    uint64_t v9 = [*(id *)(a1 + 32) repeatState];
    __int16 v10 = [*(id *)(a1 + 32) audioControl];
    [v10 volume];
    double v12 = v11;
    v13 = [*(id *)(a1 + 32) mediaUniqueIdentifier];
    uint64_t v14 = [*(id *)(a1 + 32) sleepWakeState];
    *(_DWORD *)buf = 138545154;
    v18 = v5;
    __int16 v19 = 2112;
    v20 = v6;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = v8;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    double v28 = v12;
    __int16 v29 = 2112;
    v30 = v13;
    __int16 v31 = 2048;
    uint64_t v32 = v14;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling delegate didUpdateMediaState %@ with state: p:%tu s:%tu r:%tu v:%f m:%@ sw:%tu", buf, 0x52u);

    uint64_t v2 = v16;
  }

  return [*(id *)(a1 + 40) mediaSessionDidUpdate:*(void *)(a1 + 32)];
}

uint64_t __57___HMMediaSession__notifyDelegateOfUpdatedPlaybackState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSession:*(void *)(a1 + 40) didUpdatePlaybackState:*(void *)(a1 + 48)];
}

void __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  v20[7] = *MEMORY[0x1E4F143B8];
  v20[0] = @"pb-state";
  v20[1] = @"ms-shuffle";
  v20[2] = @"ms-repeat";
  v20[3] = @"ms-volume";
  v20[4] = @"ms-mediaid";
  v20[5] = @"ms-muted";
  v20[6] = @"HMMediaSessionSleepWakeStateMessageKey";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:7];
  id v3 = (void *)MEMORY[0x1E4F654B0];
  v4 = [*(id *)(a1 + 32) messageDestination];
  v18 = @"property-list";
  __int16 v19 = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v6 = [v3 messageWithName:@"HMMS.rp" destination:v4 payload:v5];

  uint64_t v7 = [*(id *)(a1 + 32) context];
  uint64_t v8 = [v7 pendingRequests];

  uint64_t v9 = [v6 identifier];
  __int16 v10 = _Block_copy(*(const void **)(a1 + 48));
  [v8 addCompletionBlock:v10 forIdentifier:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E59450E8;
  id v15 = v8;
  id v16 = v9;
  id v17 = *(id *)(a1 + 40);
  id v11 = v9;
  id v12 = v8;
  [v6 setResponseHandler:v14];
  v13 = [*(id *)(a1 + 40) messageDispatcher];
  [v13 sendMessage:v6 completionHandler:0];
}

void __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 obj:0 error:v5];
  }
}

void __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  __int16 v21 = @"pb-state";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v22[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  uint64_t v4 = (void *)MEMORY[0x1E4F654B0];
  id v5 = [*(id *)(a1 + 32) messageDestination];
  v6 = [v4 messageWithName:@"HMMS.sp" destination:v5 payload:v3];

  id v7 = [*(id *)(a1 + 32) context];
  uint64_t v8 = [v7 pendingRequests];

  uint64_t v9 = [v6 identifier];
  __int16 v10 = _Block_copy(*(const void **)(a1 + 48));
  [v8 addCompletionBlock:v10 forIdentifier:v9];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke_2;
  id v17 = &unk_1E59450E8;
  id v18 = v8;
  id v19 = v9;
  id v20 = *(id *)(a1 + 40);
  id v11 = v9;
  id v12 = v8;
  [v6 setResponseHandler:&v14];
  v13 = objc_msgSend(*(id *)(a1 + 40), "messageDispatcher", v14, v15, v16, v17);
  [v13 sendMessage:v6 completionHandler:0];
}

void __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v3 removeCompletionBlockForIdentifier:v4];
  v6 = [*(id *)(a1 + 48) delegateCaller];
  [v6 callCompletion:v7 error:v5];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaProfile);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_mediaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_audioControl, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setMediaProfile:(id)a3
{
}

- (HMMediaProfile)mediaProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaProfile);

  return (HMMediaProfile *)WeakRetained;
}

- (void)setMediaSession:(id)a3
{
}

- (_HMMediaSession)mediaSession
{
  return self->_mediaSession;
}

- (void)setDelegate:(id)a3
{
}

- (HMMediaSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMMediaSessionDelegate *)WeakRetained;
}

- (HMAudioControl)audioControl
{
  return (HMAudioControl *)objc_getProperty(self, a2, 16, 1);
}

- (HMMediaSession)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ms.pb-state"];
  __int16 v23 = v4;
  if (v4) {
    uint64_t v5 = [v4 unsignedIntegerValue];
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ms.shuffle-state"];
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ms.repeat-state"];
  __int16 v10 = v9;
  if (v9) {
    uint64_t v11 = [v9 unsignedIntegerValue];
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ms.muid-state"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ms.route-uid"];
  uint64_t v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HMMediaSessionSleepWakeStateCodingKey"];
  uint64_t v15 = v14;
  if (v14) {
    uint64_t v14 = (void *)[v14 unsignedIntegerValue];
  }
  id v16 = [(HMMediaSession *)self initWithUUID:0 routeUID:v13 playbackState:v5 shuffleState:v8 repeatState:v11 mediaUniqueIdentifier:v12 sleepWakeState:v14];
  if (v16)
  {
    id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ac.volume"];
    if (v17)
    {
      id v18 = [(HMMediaSession *)v16 audioControl];
      [v17 floatValue];
      objc_msgSend(v18, "setVolume:");
    }
    id v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ac.muted"];
    if (v19)
    {
      id v20 = [(HMMediaSession *)v16 audioControl];
      objc_msgSend(v20, "setMuted:", objc_msgSend(v19, "BOOLValue"));
    }
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMMediaSession *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      id v7 = [(HMMediaSession *)self mediaSession];
      uint64_t v8 = [(HMMediaSession *)v6 mediaSession];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMMediaSession *)self mediaSession];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMMediaSession *)self mediaSession];
    uint64_t v8 = [v6 mediaSession];
    int v9 = [v7 mergeFromNewObject:v8];

    __int16 v10 = [(HMMediaSession *)self audioControl];
    uint64_t v11 = [v6 audioControl];
    int v12 = [v10 mergeFromNewObject:v11] | v9;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)mediaSession:(id)a3 didUpdateRouteUID:(id)a4
{
  id v5 = a4;
  id v6 = [(HMMediaSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(HMMediaSession *)self delegate];
    if ([v8 conformsToProtocol:&unk_1EEF70CE8]) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [(HMMediaSession *)self mediaSession];
    int v12 = [v11 context];
    v13 = [v12 delegateCaller];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__HMMediaSession_mediaSession_didUpdateRouteUID___block_invoke;
    v15[3] = &unk_1E5945650;
    id v16 = v10;
    id v17 = self;
    id v18 = v5;
    id v14 = v10;
    [v13 invokeBlock:v15];
  }
}

uint64_t __49__HMMediaSession_mediaSession_didUpdateRouteUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSession:*(void *)(a1 + 40) didUpdateRouteUID:*(void *)(a1 + 48)];
}

- (void)mediaSessionDidUpdate:(id)a3
{
  id v4 = [(HMMediaSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HMMediaSession *)self delegate];
    char v7 = [(HMMediaSession *)self mediaSession];
    uint64_t v8 = [v7 context];
    int v9 = [v8 delegateCaller];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__HMMediaSession_mediaSessionDidUpdate___block_invoke;
    v11[3] = &unk_1E5945628;
    id v12 = v6;
    v13 = self;
    id v10 = v6;
    [v9 invokeBlock:v11];
  }
}

uint64_t __40__HMMediaSession_mediaSessionDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSessionDidUpdate:*(void *)(a1 + 40)];
}

- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(HMMediaSession *)self delegate];
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    if ((unint64_t)(a4 - 1) > 5) {
      id v12 = @"Unknown";
    }
    else {
      id v12 = off_1E593FE20[a4 - 1];
    }
    v13 = v12;
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    double v28 = v13;
    __int16 v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notify client of did update playback state: %@ delegate: %@", buf, 0x20u);
  }
  id v14 = [(HMMediaSession *)v9 mediaSession];
  uint64_t v15 = [(__CFString *)v14 context];
  id v16 = [v15 delegateCaller];
  if (v16)
  {
    if (objc_opt_respondsToSelector())
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__HMMediaSession_mediaSession_didUpdatePlaybackState___block_invoke;
      v21[3] = &unk_1E5945160;
      id v22 = v7;
      __int16 v23 = v9;
      int64_t v24 = a4;
      [v16 invokeBlock:v21];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = v9;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      double v28 = v14;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of did update playback state due to no delegate caller from media session: %@ context: %@", buf, 0x20u);
    }
  }
}

uint64_t __54__HMMediaSession_mediaSession_didUpdatePlaybackState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSession:*(void *)(a1 + 40) didUpdatePlaybackState:*(void *)(a1 + 48)];
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  id v6 = [(HMMediaSession *)self routeUID];
  int64_t v7 = [(HMMediaSession *)self playbackState];
  uint64_t v8 = [(HMMediaSession *)self playbackStateDescription];
  int64_t v9 = [(HMMediaSession *)self shuffleState];
  int64_t v10 = [(HMMediaSession *)self repeatState];
  uint64_t v11 = [(HMMediaSession *)self mediaUniqueIdentifier];
  id v12 = [v3 stringWithFormat:@"%@<RouteUID %@ Playback State %lu (%@) Shuffle %lu Repeat %lu MediaUniqueIdentifier %@>", v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (void)updatePlaybackState:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(HMMediaSession *)self mediaSession];
  [v7 setPlaybackState:a3 completionHandler:v6];
}

- (void)refreshPlaybackStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSession *)self mediaSession];
  [v5 refreshPlaybackStateWithCompletionHandler:v4];
}

- (void)pauseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSession *)self mediaSession];
  [v5 setPlaybackState:2 completionHandler:v4];
}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSession *)self mediaSession];
  [v5 setPlaybackState:1 completionHandler:v4];
}

- (id)playbackStateDescription
{
  int64_t v2 = [(HMMediaSession *)self playbackState];
  if ((unint64_t)(v2 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_1E593FE20[v2 - 1];
  }
}

- (NSString)routeUID
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  unint64_t v3 = [v2 routeUID];

  return (NSString *)v3;
}

- (void)updateMediaState:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSession *)self mediaSession];
  [v5 updateMediaState:v4];
}

- (unint64_t)sleepWakeState
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  unint64_t v3 = [v2 sleepWakeState];

  return v3;
}

- (NSString)mediaUniqueIdentifier
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  unint64_t v3 = [v2 mediaUniqueIdentifier];

  return (NSString *)v3;
}

- (int64_t)repeatState
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  int64_t v3 = [v2 repeatState];

  return v3;
}

- (int64_t)shuffleState
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  int64_t v3 = [v2 shuffleState];

  return v3;
}

- (int64_t)playbackState
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  int64_t v3 = [v2 playbackState];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  int64_t v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSession *)self mediaSession];
  [v5 setUuid:v4];
}

- (NSUUID)uuid
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  int64_t v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (id)messageTargetUUID
{
  int64_t v2 = [(HMMediaSession *)self mediaSession];
  int64_t v3 = [v2 messageTargetUUID];

  return v3;
}

- (void)updatePlaybackState:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMediaSession *)self mediaSession];
  [v5 updatePlaybackState:v4];
}

- (void)_unconfigure
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(HMMediaSession *)self mediaSession];
  id v4 = [v3 context];

  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  uint64_t v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int64_t v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring mediaSession", (uint8_t *)&v13, 0xCu);
    }
    int64_t v10 = [(HMMediaSession *)v6 audioControl];
    [v10 _unconfigure];

    uint64_t v11 = [(HMMediaSession *)v6 mediaSession];
    [v11 setContext:0];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)configure:(id)a3 messageTargetUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  int64_t v9 = self;
  int64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring media session: %@ message target uuid: %@", (uint8_t *)&v15, 0x20u);
  }
  id v12 = [(HMMediaSession *)v9 mediaSession];
  [v12 setMessageTargetUUID:v7];

  int v13 = [(HMMediaSession *)v9 mediaSession];
  [v13 setContext:v6];

  id v14 = [(HMMediaSession *)v9 audioControl];
  objc_msgSend(v14, "__configureWithContext:", v6);
}

- (HMMediaSession)initWithUUID:(id)a3 routeUID:(id)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7 mediaUniqueIdentifier:(id)a8 sleepWakeState:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMMediaSession;
  id v18 = [(HMMediaSession *)&v26 init];
  if (v18)
  {
    if (v15)
    {
      __int16 v19 = (NSUUID *)v15;
    }
    else
    {
      __int16 v19 = [MEMORY[0x1E4F29128] UUID];
    }
    uuid = v18->_uuid;
    v18->_uuid = v19;

    uint64_t v21 = [[HMAudioControl alloc] initWithMediaSession:v18];
    audioControl = v18->_audioControl;
    v18->_audioControl = v21;

    __int16 v23 = [[_HMMediaSession alloc] initWithUUID:v15 routeUID:v16 playbackState:a5 shuffleState:a6 repeatState:a7 audioControl:v18->_audioControl mediaUniqueIdentifier:v17 sleepWakeState:a9];
    mediaSession = v18->_mediaSession;
    v18->_mediaSession = v23;

    [(_HMMediaSession *)v18->_mediaSession setDelegate:v18];
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end