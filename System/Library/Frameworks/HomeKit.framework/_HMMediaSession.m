@interface _HMMediaSession
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAudioControl)audioControl;
- (NSString)mediaUniqueIdentifier;
- (NSString)routeUID;
- (NSUUID)messageTargetUUID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (_HMMediaSession)initWithUUID:(id)a3 routeUID:(id)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7 audioControl:(id)a8 mediaUniqueIdentifier:(id)a9 sleepWakeState:(unint64_t)a10;
- (_HMMediaSessionDelegate)delegate;
- (id)messageDestination;
- (int64_t)playbackState;
- (int64_t)repeatState;
- (int64_t)shuffleState;
- (unint64_t)hash;
- (unint64_t)sleepWakeState;
- (void)_handleSessionPlaybackUpdated:(id)a3;
- (void)_handleSessionRouteUIDUpdated:(id)a3;
- (void)_notifyDelegateOfUpdatedMediaState;
- (void)_notifyDelegateOfUpdatedPlaybackState:(int64_t)a3;
- (void)_notifyDelegateOfUpdatedRouteUID:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_updateMediaState:(id)a3 completion:(id)a4;
- (void)refreshPlaybackStateWithCompletionHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaUniqueIdentifier:(id)a3;
- (void)setMessageTargetUUID:(id)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setPlaybackState:(int64_t)a3 completionHandler:(id)a4;
- (void)setRepeatState:(int64_t)a3;
- (void)setRouteUID:(id)a3;
- (void)setShuffleState:(int64_t)a3;
- (void)setSleepWakeState:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)updateMediaState:(id)a3;
- (void)updatePlaybackState:(id)a3;
@end

@implementation _HMMediaSession

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioControl, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mediaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setDelegate:(id)a3
{
}

- (_HMMediaSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMMediaSessionDelegate *)WeakRetained;
}

- (HMAudioControl)audioControl
{
  return (HMAudioControl *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)uuid
{
  return self->_uuid;
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
  if (v6)
  {
    v7 = [(_HMMediaSession *)self routeUID];
    v8 = [v6 routeUID];
    char v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      v10 = [v6 routeUID];
      [(_HMMediaSession *)self setRouteUID:v10];

      v11 = [(_HMMediaSession *)self context];
      v12 = [v11 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38___HMMediaSession_mergeFromNewObject___block_invoke;
      block[3] = &unk_1E5945628;
      block[4] = self;
      id v34 = v6;
      dispatch_async(v12, block);
    }
    int64_t v13 = [(_HMMediaSession *)self playbackState];
    uint64_t v14 = [v6 playbackState];
    BOOL v15 = v13 != v14;
    if (v13 != v14)
    {
      -[_HMMediaSession setPlaybackState:](self, "setPlaybackState:", [v6 playbackState]);
      v16 = [(_HMMediaSession *)self context];
      v17 = [v16 queue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __38___HMMediaSession_mergeFromNewObject___block_invoke_2;
      v32[3] = &unk_1E59452E8;
      v32[4] = self;
      dispatch_async(v17, v32);
    }
    int64_t v18 = [(_HMMediaSession *)self shuffleState];
    if (v18 != [v6 shuffleState])
    {
      -[_HMMediaSession setShuffleState:](self, "setShuffleState:", [v6 shuffleState]);
      BOOL v15 = 1;
    }
    int64_t v19 = [(_HMMediaSession *)self repeatState];
    if (v19 != [v6 repeatState])
    {
      -[_HMMediaSession setRepeatState:](self, "setRepeatState:", [v6 repeatState]);
      BOOL v15 = 1;
    }
    v20 = [(_HMMediaSession *)self mediaUniqueIdentifier];
    v21 = [v6 mediaUniqueIdentifier];
    char v22 = HMFEqualObjects();

    if ((v22 & 1) == 0)
    {
      v23 = [v6 mediaUniqueIdentifier];
      [(_HMMediaSession *)self setMediaUniqueIdentifier:v23];

      BOOL v15 = 1;
    }
    char v24 = v9 ^ 1;
    unint64_t v25 = [(_HMMediaSession *)self sleepWakeState];
    if (v25 == [v6 sleepWakeState])
    {
      if (!v15)
      {
        char v26 = 0;
LABEL_21:
        char v27 = v26 | v24;
        goto LABEL_22;
      }
    }
    else
    {
      -[_HMMediaSession setSleepWakeState:](self, "setSleepWakeState:", [v6 sleepWakeState]);
    }
    v28 = [(_HMMediaSession *)self context];
    v29 = [v28 queue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __38___HMMediaSession_mergeFromNewObject___block_invoke_3;
    v31[3] = &unk_1E59452E8;
    v31[4] = self;
    dispatch_async(v29, v31);

    char v26 = 1;
    goto LABEL_21;
  }
  char v27 = 0;
LABEL_22:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMMediaSession *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      v7 = [(_HMMediaSession *)self uuid];
      v8 = [(_HMMediaSession *)v6 uuid];
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
  v2 = [(_HMMediaSession *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)_handleSessionRouteUIDUpdated:(id)a3
{
  id v5 = [a3 stringForKey:@"route-uid"];
  id v4 = [(_HMMediaSession *)self routeUID];
  if ((HMFEqualObjects() & 1) == 0)
  {
    [(_HMMediaSession *)self setRouteUID:v5];
    [(_HMMediaSession *)self _notifyDelegateOfUpdatedRouteUID:v5];
  }
}

- (void)_notifyDelegateOfUpdatedRouteUID:(id)a3
{
  id v4 = a3;
  id v5 = [(_HMMediaSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(_HMMediaSession *)self delegate];
    v8 = [(_HMMediaSession *)self context];
    char v9 = [v8 delegateCaller];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52___HMMediaSession__notifyDelegateOfUpdatedRouteUID___block_invoke;
    v11[3] = &unk_1E5945650;
    id v12 = v7;
    int64_t v13 = self;
    id v14 = v4;
    id v10 = v7;
    [v9 invokeBlock:v11];
  }
}

- (void)updateMediaState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HMMediaSession *)self context];
  char v6 = v5;
  if (v5)
  {
    v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36___HMMediaSession_updateMediaState___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v15 = v11;
      __int16 v16 = 2080;
      v17 = "-[_HMMediaSession updateMediaState:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)updatePlaybackState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HMMediaSession *)self context];
  char v6 = v5;
  if (v5)
  {
    v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39___HMMediaSession_updatePlaybackState___block_invoke;
    v12[3] = &unk_1E5945628;
    id v13 = v4;
    id v14 = self;
    dispatch_async(v7, v12);
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[_HMMediaSession updatePlaybackState:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)_updateMediaState:(id)a3 completion:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v56 = a4;
  uint64_t v7 = objc_msgSend(v6, "hmf_numberForKey:", @"pb-state");
  v55 = (void *)v7;
  if (v7
    && (v8 = (void *)v7,
        int64_t v9 = [(_HMMediaSession *)self playbackState],
        uint64_t v10 = [v8 unsignedIntegerValue],
        v9 != v10))
  {
    uint64_t v12 = v10;
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    BOOL v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v59 = v16;
      __int16 v60 = 2048;
      int64_t v61 = v9;
      __int16 v62 = 2048;
      uint64_t v63 = v12;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@_updateMediaState playback state changed from %tu to %tu", buf, 0x20u);
    }
    [(_HMMediaSession *)v14 setPlaybackState:v12];
    [(_HMMediaSession *)v14 _notifyDelegateOfUpdatedPlaybackState:v12];
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  __int16 v17 = objc_msgSend(v6, "hmf_numberForKey:", @"ms-shuffle");
  if (v17)
  {
    int64_t v18 = [(_HMMediaSession *)self shuffleState];
    uint64_t v19 = [v17 unsignedIntegerValue];
    if (v18 != v19)
    {
      [(_HMMediaSession *)self setShuffleState:v19];
      int v11 = 1;
    }
  }
  v20 = objc_msgSend(v6, "hmf_numberForKey:", @"ms-repeat");
  if (v20)
  {
    int64_t v21 = [(_HMMediaSession *)self repeatState];
    uint64_t v22 = [v20 unsignedIntegerValue];
    if (v21 != v22)
    {
      [(_HMMediaSession *)self setRepeatState:v22];
      int v11 = 1;
    }
  }
  v23 = objc_msgSend(v6, "hmf_numberForKey:", @"ms-volume");
  if (v23)
  {
    char v24 = [(_HMMediaSession *)self audioControl];
    [v24 volume];
    float v26 = v25;

    [v23 floatValue];
    if (vabds_f32(v26, v27) > 0.0001)
    {
      v28 = [(_HMMediaSession *)self audioControl];
      [v23 floatValue];
      objc_msgSend(v28, "setVolume:");

      int v11 = 1;
    }
  }
  v29 = objc_msgSend(v6, "hmf_stringForKey:", @"ms-mediaid");
  if (v29)
  {
    v30 = [(_HMMediaSession *)self mediaUniqueIdentifier];
    if (([v30 isEqualToString:v29] & 1) == 0)
    {
      [(_HMMediaSession *)self setMediaUniqueIdentifier:v29];
      int v11 = 1;
    }
  }
  v54 = v17;
  v31 = objc_msgSend(v6, "hmf_numberForKey:", @"ms-muted");
  if (v31)
  {
    v32 = [(_HMMediaSession *)self audioControl];
    int v33 = [v32 isMuted];

    if (v33 != [v31 BOOLValue])
    {
      id v34 = (void *)MEMORY[0x19F3A64A0]();
      v35 = self;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = v52 = v20;
        v38 = HMFBooleanToString();
        [v31 BOOLValue];
        HMFBooleanToString();
        v39 = v53 = v34;
        *(_DWORD *)buf = 138543874;
        v59 = v37;
        __int16 v60 = 2112;
        int64_t v61 = (int64_t)v38;
        __int16 v62 = 2112;
        uint64_t v63 = (uint64_t)v39;
        _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_INFO, "%{public}@_updateMediaState muted changed from %@ to %@", buf, 0x20u);

        id v34 = v53;
        v20 = v52;
      }

      v40 = [(_HMMediaSession *)v35 audioControl];
      objc_msgSend(v40, "setMuted:", objc_msgSend(v31, "BOOLValue"));

      v41 = [(_HMMediaSession *)v35 audioControl];
      uint64_t v42 = [v31 BOOLValue];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __48___HMMediaSession__updateMediaState_completion___block_invoke;
      v57[3] = &unk_1E5945188;
      v57[4] = v35;
      [v41 updateMuted:v42 completionHandler:v57];

      int v11 = 1;
    }
  }
  v43 = objc_msgSend(v6, "hmf_numberForKey:", @"HMMediaSessionSleepWakeStateMessageKey", v52);
  if (v43
    && (unint64_t v44 = [(_HMMediaSession *)self sleepWakeState],
        uint64_t v45 = [v43 unsignedIntegerValue],
        v44 != v45))
  {
    [(_HMMediaSession *)self setSleepWakeState:v45];
    if (!v56)
    {
LABEL_34:
      [(_HMMediaSession *)self _notifyDelegateOfUpdatedMediaState];
      goto LABEL_35;
    }
  }
  else if (!v56)
  {
    if (!v11) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  v46 = (void *)MEMORY[0x19F3A64A0]();
  v47 = self;
  v48 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v59 = v49;
    __int16 v60 = 2112;
    int64_t v61 = (int64_t)v55;
    _os_log_impl(&dword_19D1A8000, v48, OS_LOG_TYPE_INFO, "%{public}@_updateMediaState calling completion with state: %@", buf, 0x16u);
  }
  v50 = [(_HMMediaSession *)v47 context];
  v51 = [v50 delegateCaller];
  [v51 callCompletion:v56 error:0];

LABEL_35:
}

- (void)_handleSessionPlaybackUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(_HMMediaSession *)self context];
  id v9 = [v5 pendingRequests];

  id v6 = [v4 identifier];
  uint64_t v7 = [v9 removeCompletionBlockForIdentifier:v6];

  v8 = [v4 messagePayload];

  [(_HMMediaSession *)self _updateMediaState:v8 completion:v7];
}

- (void)_notifyDelegateOfUpdatedMediaState
{
  unint64_t v3 = [(_HMMediaSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_HMMediaSession *)self delegate];
    id v6 = [(_HMMediaSession *)self context];
    uint64_t v7 = [v6 delegateCaller];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___HMMediaSession__notifyDelegateOfUpdatedMediaState__block_invoke;
    v9[3] = &unk_1E5945628;
    v9[4] = self;
    id v10 = v5;
    id v8 = v5;
    [v7 invokeBlock:v9];
  }
}

- (void)_notifyDelegateOfUpdatedPlaybackState:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(_HMMediaSession *)self delegate];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    if ((unint64_t)(a3 - 1) > 5) {
      id v10 = @"Unknown";
    }
    else {
      id v10 = off_1E593FE20[a3 - 1];
    }
    int v11 = v10;
    *(_DWORD *)buf = 138543874;
    v23 = v9;
    __int16 v24 = 2112;
    float v25 = v11;
    __int16 v26 = 2112;
    float v27 = v5;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notify client of did update playback state: %@ delegate: %@", buf, 0x20u);
  }
  uint64_t v12 = [(_HMMediaSession *)v7 context];
  id v13 = [(__CFString *)v12 delegateCaller];
  if (v13)
  {
    if (objc_opt_respondsToSelector())
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57___HMMediaSession__notifyDelegateOfUpdatedPlaybackState___block_invoke;
      v18[3] = &unk_1E5945160;
      id v19 = v5;
      v20 = v7;
      int64_t v21 = a3;
      [v13 invokeBlock:v18];
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v15 = v7;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      __int16 v24 = 2112;
      float v25 = v12;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of did update playback state due to no delegate caller from context: %@", buf, 0x16u);
    }
  }
}

- (void)refreshPlaybackStateWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HMMediaSession *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMMediaSession refreshPlaybackStateWithCompletionHandler:]", @"completionHandler"];
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      __int16 v24 = 2112;
      float v25 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v21 = v4;
    id v20 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      __int16 v24 = 2080;
      float v25 = "-[_HMMediaSession refreshPlaybackStateWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

- (void)setPlaybackState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(_HMMediaSession *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMMediaSession setPlaybackState:completionHandler:]", @"completionHandler"];
    __int16 v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke;
    block[3] = &unk_1E5945110;
    int64_t v24 = a3;
    block[4] = self;
    id v23 = v6;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    int v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v13;
      __int16 v27 = 2080;
      uint64_t v28 = "-[_HMMediaSession setPlaybackState:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(_HMMediaSession *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSUUID)messageTargetUUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_messageTargetUUID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSleepWakeState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sleepWakeState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)sleepWakeState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t sleepWakeState = self->_sleepWakeState;
  os_unfair_lock_unlock(p_lock);
  return sleepWakeState;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  uint64_t v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setRouteUID:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  routeUID = self->_routeUID;
  self->_routeUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)routeUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_routeUID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setMediaUniqueIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  mediaUniqueIdentifier = self->_mediaUniqueIdentifier;
  self->_mediaUniqueIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)mediaUniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mediaUniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRepeatState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_repeatState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)repeatState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t repeatState = self->_repeatState;
  os_unfair_lock_unlock(p_lock);
  return repeatState;
}

- (void)setShuffleState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_shuffleState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)shuffleState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t shuffleState = self->_shuffleState;
  os_unfair_lock_unlock(p_lock);
  return shuffleState;
}

- (void)setPlaybackState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_playbackState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)playbackState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t playbackState = self->_playbackState;
  os_unfair_lock_unlock(p_lock);
  return playbackState;
}

- (void)setMessageTargetUUID:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  messageTargetUUID = self->_messageTargetUUID;
  self->_messageTargetUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setContext:(id)a3
{
  id v4 = (_HMContext *)a3;
  os_unfair_lock_lock_with_options();
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);

  [(_HMMediaSession *)self _registerNotificationHandlers];
}

- (_HMContext)context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_context;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setUuid:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  uuid = self->_uuid;
  self->_uuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_registerNotificationHandlers
{
  id v3 = [(_HMMediaSession *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMMS.up" receiver:self selector:sel__handleSessionPlaybackUpdated_];

  id v6 = [(_HMMediaSession *)self context];
  id v5 = [v6 messageDispatcher];
  [v5 registerForMessage:@"HMMS.ur" receiver:self selector:sel__handleSessionRouteUIDUpdated_];
}

- (_HMMediaSession)initWithUUID:(id)a3 routeUID:(id)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7 audioControl:(id)a8 mediaUniqueIdentifier:(id)a9 sleepWakeState:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v23 = a8;
  id v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)_HMMediaSession;
  id v19 = [(_HMMediaSession *)&v24 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uuid, a3);
    objc_storeStrong((id *)&v20->_routeUID, a4);
    v20->_int64_t playbackState = a5;
    v20->_int64_t shuffleState = a6;
    v20->_int64_t repeatState = a7;
    objc_storeStrong((id *)&v20->_audioControl, a8);
    objc_storeStrong((id *)&v20->_mediaUniqueIdentifier, a9);
    v20->_unint64_t sleepWakeState = a10;
  }

  return v20;
}

@end