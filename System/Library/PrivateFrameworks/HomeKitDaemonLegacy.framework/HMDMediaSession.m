@interface HMDMediaSession
+ (BOOL)supportsSecureCoding;
+ (Class)mediaPropertyValueTypeWithMessageKey:(id)a3;
+ (NSArray)mediaPropertyMessageKeys;
+ (id)logCategory;
+ (id)sessionForCurrentAccessoryWithSessionIdentifier:(id)a3 mediaProfile:(id)a4;
- (BOOL)isConnected;
- (BOOL)isCurrentAccessorySession;
- (BOOL)isEqual:(id)a3;
- (HMDMediaEndpoint)endpoint;
- (HMDMediaSession)initWithCoder:(id)a3;
- (HMDMediaSessionState)state;
- (HMFTimer)setPlaybackStateTimer;
- (NSArray)mediaProfiles;
- (NSMutableArray)setPlaybackStateCompletionHandlers;
- (NSString)logID;
- (NSString)sessionIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_initWithEndpoint:(id)a3 mediaProfiles:(id)a4 state:(id)a5;
- (id)_initWithMediaProfiles:(id)a3 state:(id)a4;
- (id)dumpState;
- (unint64_t)hash;
- (void)_getPlaybackStateWithCompletion:(id)a3;
- (void)_handleGetPlaybackState:(id)a3;
- (void)_handleMediaSessionSetAudioControl:(id)a3;
- (void)_handleMediaUpdateMuted:(id)a3;
- (void)_handleMediaUpdateVolume:(id)a3;
- (void)_handleSetPlayback:(id)a3;
- (void)_invokePendingSetPlaybackStateBlocksOfError:(id)a3;
- (void)_notifyClientsOfUpdatedVolume:(id)a3 muted:(id)a4 inResponseToMessage:(id)a5;
- (void)_postNotificationOfMediaStateUpdate;
- (void)_postNotificationOfMediaStateUpdateWithPayload:(id)a3;
- (void)_postNotificationOfMediaStateUpdateWithRequestMessageInformation:(id)a3;
- (void)_queueSetPlaybackStateCompletion:(id)a3;
- (void)_registerForSessionUpdates:(BOOL)a3;
- (void)_setPlaybackState:(int64_t)a3 completion:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleMediaPlaybackStateNotification:(id)a3;
- (void)handleMediaSessionSetAudioControl:(id)a3;
- (void)handleRefreshPlayback:(id)a3;
- (void)handleSetPlayback:(id)a3;
- (void)readProperties:(id)a3 completion:(id)a4;
- (void)registerForSessionUpdates:(BOOL)a3;
- (void)setConnected:(BOOL)a3;
- (void)setCurrentAccessorySession:(BOOL)a3;
- (void)setEndpoint:(id)a3;
- (void)setLogID:(id)a3;
- (void)setSetPlaybackStateCompletionHandlers:(id)a3;
- (void)setSetPlaybackStateTimer:(id)a3;
- (void)setState:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateEndpoint:(id)a3;
- (void)updateWithResponses:(id)a3 requestMessageInformation:(id)a4;
- (void)writeProperties:(id)a3 completion:(id)a4;
@end

@implementation HMDMediaSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPlaybackStateTimer, 0);
  objc_storeStrong((id *)&self->_setPlaybackStateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

- (void)setSetPlaybackStateTimer:(id)a3
{
}

- (HMFTimer)setPlaybackStateTimer
{
  return self->_setPlaybackStateTimer;
}

- (void)setSetPlaybackStateCompletionHandlers:(id)a3
{
}

- (NSMutableArray)setPlaybackStateCompletionHandlers
{
  return self->_setPlaybackStateCompletionHandlers;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setLogID:(id)a3
{
}

- (NSString)logID
{
  return self->_logID;
}

- (void)setCurrentAccessorySession:(BOOL)a3
{
  self->_currentAccessorySession = a3;
}

- (BOOL)isCurrentAccessorySession
{
  return self->_currentAccessorySession;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void)setState:(id)a3
{
}

- (HMDMediaSessionState)state
{
  return self->_state;
}

- (void)setEndpoint:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMediaSession *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__HMDMediaSession_timerDidFire___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __32__HMDMediaSession_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) setPlaybackStateTimer];

  if (v2 == v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 40) setSetPlaybackStateTimer:0]);
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Timed out waiting for media playback state notification - reading the state explicitly...", buf, 0xCu);
    }
    v9 = *(void **)(a1 + 40);
    id v8 = (id *)(a1 + 40);
    v10 = [v9 state];
    v11 = (void *)[v10 playbackState];

    objc_initWeak((id *)buf, *v8);
    id v12 = *v8;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__HMDMediaSession_timerDidFire___block_invoke_74;
    v13[3] = &unk_1E6A0DC30;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = v11;
    [v12 _getPlaybackStateWithCompletion:v13];
    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
}

void __32__HMDMediaSession_timerDidFire___block_invoke_74(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _invokePendingSetPlaybackStateBlocksOfError:v6];

  if (!v6 && *(void *)(a1 + 40) != a3) {
    [WeakRetained _postNotificationOfMediaStateUpdate];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v12 = [(HMDMediaSession *)self state];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "playbackState"));
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2D9B0]];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "shuffleState"));
  [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2DA08]];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "repeatState"));
  [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F2D9D8]];

  id v8 = [v12 volume];
  [v4 encodeObject:v8 forKey:*MEMORY[0x1E4F2D980]];

  v9 = [v12 muted];
  [v4 encodeObject:v9 forKey:*MEMORY[0x1E4F2D968]];

  v10 = [v12 mediaUniqueIdentifier];
  [v4 encodeObject:v10 forKey:*MEMORY[0x1E4F2D998]];

  v11 = [(HMDMediaSession *)self sessionIdentifier];
  [v4 encodeObject:v11 forKey:*MEMORY[0x1E4F2D9F0]];
}

- (HMDMediaSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)isConnected
{
  v2 = [(HMDMediaSession *)self endpoint];
  char v3 = [v2 isConnected];

  return v3;
}

- (void)writeProperties:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDMediaSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __46__HMDMediaSession_writeProperties_completion___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  group = dispatch_group_create();
  uint64_t v27 = a1;
  v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v2)
  {
    uint64_t v25 = *(void *)v36;
    uint64_t v4 = *MEMORY[0x1E4F2D9B8];
    *(void *)&long long v3 = 138543618;
    long long v22 = v3;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "property", v22);
        int v8 = [v7 isEqual:v4];

        if (v8)
        {
          id v9 = (void *)MEMORY[0x1D9452090]();
          id v10 = *(id *)(v27 + 40);
          v11 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = HMFGetLogIdentifier();
            v13 = [v6 value];
            *(_DWORD *)buf = v22;
            v40 = v12;
            __int16 v41 = 2112;
            v42 = v13;
            _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting playback state received from remote %@", buf, 0x16u);
          }
          id v14 = [*(id *)(v27 + 40) state];
          v15 = (void *)[v14 playbackState];

          v16 = [v6 value];
          uint64_t v17 = [v16 unsignedIntegerValue];

          dispatch_group_enter(group);
          objc_initWeak((id *)buf, *(id *)(v27 + 40));
          v18 = *(void **)(v27 + 40);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke_68;
          v31[3] = &unk_1E6A0DD20;
          objc_copyWeak(v34, (id *)buf);
          v31[4] = v6;
          v34[1] = v15;
          id v32 = v23;
          v33 = group;
          [v18 _setPlaybackState:v17 completion:v31];

          objc_destroyWeak(v34);
          objc_destroyWeak((id *)buf);
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v2);
  }

  v19 = [*(id *)(v27 + 40) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke_69;
  block[3] = &unk_1E6A19530;
  id v20 = *(id *)(v27 + 48);
  id v29 = v23;
  id v30 = v20;
  id v21 = v23;
  dispatch_group_notify(group, v19, block);
}

void __46__HMDMediaSession_writeProperties_completion___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke_2;
    v11[3] = &unk_1E6A0DCF8;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v12 = v7;
    uint64_t v13 = v8;
    uint64_t v10 = *(void *)(a1 + 64);
    id v14 = v5;
    uint64_t v17 = v10;
    id v15 = v9;
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v6, v11);
  }
}

uint64_t __46__HMDMediaSession_writeProperties_completion___block_invoke_69(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __46__HMDMediaSession_writeProperties_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", *(void *)(a1 + 40));
  }
  else
  {
    id v3 = [*(id *)(a1 + 48) state];
    uint64_t v4 = [v3 playbackState];

    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 48);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@responding to set playback with state %ld", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [NSNumber numberWithInteger:v4];
    v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v2 = +[HMDMediaPropertyResponse responseWithRequest:v9 value:v10 updatedTime:v11];

    if (*(void *)(a1 + 72) != v4) {
      [*(id *)(a1 + 48) _postNotificationOfMediaStateUpdate];
    }
  }
  [*(id *)(a1 + 56) addObject:v2];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)readProperties:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDMediaSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDMediaSession_readProperties_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__HMDMediaSession_readProperties_completion___block_invoke(id *a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  group = dispatch_group_create();
  v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[4], "count"));
  v47 = [MEMORY[0x1E4F1C9C8] date];
  objc_initWeak(&location, a1[5]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = a1[4];
  uint64_t v2 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v2)
  {
    uint64_t v48 = *(void *)v60;
    uint64_t v3 = *MEMORY[0x1E4F2D9B8];
    uint64_t v44 = *MEMORY[0x1E4F2DA10];
    uint64_t v43 = *MEMORY[0x1E4F2D9E0];
    uint64_t v42 = *MEMORY[0x1E4F2DA20];
    uint64_t v41 = *MEMORY[0x1E4F2D9A0];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v60 != v48) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v59 + 1) + 8 * v4);
        id v6 = objc_msgSend(v5, "property", v41);
        int v7 = [v6 isEqual:v3];

        if (v7)
        {
          uint64_t v8 = [a1[5] state];
          id v9 = (void *)[v8 playbackState];

          dispatch_group_enter(group);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __45__HMDMediaSession_readProperties_completion___block_invoke_2;
          aBlock[3] = &unk_1E6A0DCD0;
          objc_copyWeak(v58, &location);
          v54 = group;
          v55 = v5;
          id v56 = v47;
          v58[1] = v9;
          id v57 = v46;
          id v10 = (void (**)(void *, void, void *))_Block_copy(aBlock);
          if ([a1[5] isCurrentAccessorySession]) {
            [a1[5] _getPlaybackStateWithCompletion:v10];
          }
          else {
            v10[2](v10, 0, v9);
          }

          objc_destroyWeak(v58);
        }
        else
        {
          v11 = [v5 property];
          int v12 = [v11 isEqual:v44];

          if (v12)
          {
            uint64_t v13 = NSNumber;
            id v14 = [a1[5] state];
            uint64_t v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "shuffleState"));
            uint64_t v16 = +[HMDMediaPropertyResponse responseWithRequest:v5 value:v15 updatedTime:v47];

            [v46 addObject:v16];
          }
          else
          {
            uint64_t v17 = [v5 property];
            int v18 = [v17 isEqual:v43];

            if (v18)
            {
              v19 = NSNumber;
              id v20 = [a1[5] state];
              id v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "repeatState"));
              long long v22 = +[HMDMediaPropertyResponse responseWithRequest:v5 value:v21 updatedTime:v47];

              [v46 addObject:v22];
            }
            else
            {
              v23 = [v5 property];
              int v24 = [v23 isEqual:v42];

              if (v24)
              {
                uint64_t v25 = [a1[5] state];
                v26 = [v25 volume];

                if (v26)
                {
                  uint64_t v27 = [a1[5] state];
                  v28 = [v27 volume];
                  id v29 = +[HMDMediaPropertyResponse responseWithRequest:v5 value:v28 updatedTime:v47];

                  [v46 addObject:v29];
                }
              }
              else
              {
                id v30 = [v5 property];
                int v31 = [v30 isEqual:v41];

                if (v31)
                {
                  id v32 = [a1[5] state];
                  v33 = [v32 mediaUniqueIdentifier];

                  if (v33)
                  {
                    v34 = [a1[5] state];
                    long long v35 = [v34 mediaUniqueIdentifier];
                    long long v36 = +[HMDMediaPropertyResponse responseWithRequest:v5 value:v35 updatedTime:v47];

                    [v46 addObject:v36];
                  }
                }
              }
            }
          }
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v37 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      uint64_t v2 = v37;
    }
    while (v37);
  }

  long long v38 = [a1[5] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDMediaSession_readProperties_completion___block_invoke_3;
  block[3] = &unk_1E6A19530;
  id v39 = a1[6];
  id v51 = v46;
  id v52 = v39;
  id v40 = v46;
  dispatch_group_notify(group, v38, block);

  objc_destroyWeak(&location);
}

void __45__HMDMediaSession_readProperties_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v9)
    {
      int v7 = +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", *(void *)(a1 + 40));
    }
    else
    {
      uint64_t v8 = [NSNumber numberWithInteger:a3];
      int v7 = +[HMDMediaPropertyResponse responseWithRequest:v6 value:v8 updatedTime:*(void *)(a1 + 48)];

      if (*(void *)(a1 + 72) != a3) {
        [WeakRetained _postNotificationOfMediaStateUpdate];
      }
    }
    [*(id *)(a1 + 56) addObject:v7];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

uint64_t __45__HMDMediaSession_readProperties_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (NSArray)mediaProfiles
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableSet *)self->_mediaProfiles allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)updateEndpoint:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_endpoint = &self->_endpoint;
  uint64_t v8 = self->_endpoint;
  id v9 = [(HMDMediaEndpoint *)v8 sessionIdentifier];
  id v10 = [v5 sessionIdentifier];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    objc_storeStrong((id *)p_endpoint, a3);
    int v12 = (void *)MEMORY[0x1D9452090]();
    HMFGetOSLogHandle();
    uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      int v18 = v8;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@MediaSession endpoint %@ changed to %@", (uint8_t *)&v15, 0x20u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (HMDMediaEndpoint)endpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_endpoint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)registerForSessionUpdates:(BOOL)a3
{
  id v5 = [(HMDMediaSession *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__HMDMediaSession_registerForSessionUpdates___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __45__HMDMediaSession_registerForSessionUpdates___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForSessionUpdates:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleMediaUpdateMuted:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F2D970];
  id v4 = a3;
  id v7 = [v4 numberForKey:v3];
  if (v7) {
    uint64_t v5 = 48;
  }
  else {
    uint64_t v5 = 20;
  }
  uint64_t v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v5];
  [v4 respondWithError:v6];
}

- (void)_handleMediaUpdateVolume:(id)a3
{
  id v10 = a3;
  uint64_t v3 = [v10 numberForKey:*MEMORY[0x1E4F2D988]];
  id v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    if (v5 >= 0.0 && v5 <= 1.0) {
      uint64_t v8 = 48;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = 20;
  }
  id v9 = [v6 hmErrorWithCode:v8];
  [v10 respondWithError:v9];
}

- (void)_handleMediaSessionSetAudioControl:(id)a3
{
  id v10 = a3;
  id v4 = [v10 messagePayload];
  uint64_t v5 = *MEMORY[0x1E4F2D988];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F2D988]];

  if (v6)
  {
    [(HMDMediaSession *)self _handleMediaUpdateVolume:v10];
  }
  else
  {
    id v7 = [v10 messagePayload];
    uint64_t v8 = [v7 objectForKey:v5];

    if (v8)
    {
      [(HMDMediaSession *)self _handleMediaUpdateMuted:v10];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v10 respondWithError:v9];
    }
  }
}

- (void)handleMediaSessionSetAudioControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDMediaSession *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HMDMediaSession_handleMediaSessionSetAudioControl___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__HMDMediaSession_handleMediaSessionSetAudioControl___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMediaSessionSetAudioControl:*(void *)(a1 + 40)];
}

- (void)_notifyClientsOfUpdatedVolume:(id)a3 muted:(id)a4 inResponseToMessage:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v28 = *MEMORY[0x1E4F2DA18];
  int v12 = [(HMDMediaSession *)self uuid];
  uint64_t v13 = [v12 UUIDString];
  v29[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  int v15 = [v11 dictionaryWithDictionary:v14];

  if (v10)
  {
    uint64_t v16 = [[HMDMediaSessionRequestMessageInformation alloc] initWithMessage:v10];
    [v15 setObject:v16 forKey:*MEMORY[0x1E4F2D9E8]];
  }
  if (v8) {
    [v15 setObject:v8 forKey:*MEMORY[0x1E4F2D988]];
  }
  if (v9) {
    [v15 setObject:v9 forKey:*MEMORY[0x1E4F2D970]];
  }
  __int16 v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 postNotificationName:@"HMDMediaSessionDidUpdateAudioControlNotification" object:self userInfo:v15];

  int v18 = (void *)MEMORY[0x1D9452090]();
  __int16 v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    int v22 = 138543874;
    v23 = v21;
    __int16 v24 = 2112;
    uint64_t v25 = @"HMDMediaSessionDidUpdateAudioControlNotification";
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Sending internal notification %@ with payload %@", (uint8_t *)&v22, 0x20u);
  }
}

- (void)handleSetPlayback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDMediaSession *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HMDMediaSession_handleSetPlayback___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__HMDMediaSession_handleSetPlayback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSetPlayback:*(void *)(a1 + 40)];
}

- (void)_handleSetPlayback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:*MEMORY[0x1E4F2D9B8]];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__HMDMediaSession__handleSetPlayback___block_invoke;
    v9[3] = &unk_1E6A17758;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [(HMDMediaSession *)self _setPlaybackState:v7 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v8];
  }
}

void __38__HMDMediaSession__handleSetPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = v8;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];

    id v4 = (id)v5;
  }
  id v6 = *(void **)(a1 + 32);
  id v9 = v4;
  if (v4)
  {
    [v6 respondWithError:v4];
  }
  else
  {
    if (v6) {
      uint64_t v7 = [[HMDMediaSessionRequestMessageInformation alloc] initWithMessage:*(void *)(a1 + 32)];
    }
    else {
      uint64_t v7 = 0;
    }
    [WeakRetained _postNotificationOfMediaStateUpdateWithRequestMessageInformation:v7];
    [*(id *)(a1 + 32) respondWithSuccess];
  }
}

- (void)_setPlaybackState:(int64_t)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void (**)(void, void))v6;
  if (a3 == 1)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    uint64_t v8 = 1;
LABEL_5:
    [(HMDMediaSession *)self _queueSetPlaybackStateCompletion:v6];
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HMDMediaSession__setPlaybackState_completion___block_invoke;
    aBlock[3] = &unk_1E6A0DC58;
    objc_copyWeak(v37, &location);
    v37[1] = (id)a3;
    id v9 = _Block_copy(aBlock);
    if ([(HMDMediaSession *)self isCurrentAccessorySession])
    {
      BOOL v10 = MRMediaRemoteGetLocalOrigin() == 0;
      id v11 = (void *)MEMORY[0x1D9452090]();
      int v12 = self;
      if (v10)
      {
        HMFGetOSLogHandle();
        uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v40 = v26;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up local origin for currentAccessory to set playback state", buf, 0xCu);
        }
        if (v7)
        {
          uint64_t v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2005];
          uint64_t v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4 description:@"Cannot lookup origin" reason:@"Cannot lookup origin" suggestion:0 underlyingError:v27];
          ((void (**)(void, void *))v7)[2](v7, v28);
        }
      }
      else
      {
        HMFGetOSLogHandle();
        uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v40 = v14;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Attempting to set the playback state command with mediaRemote to local origin", buf, 0xCu);
        }
        int v15 = [(HMDMediaSession *)v12 workQueue];
        uint64_t v31 = MEMORY[0x1E4F143A8];
        uint64_t v32 = 3221225472;
        v33 = __48__HMDMediaSession__setPlaybackState_completion___block_invoke_55;
        v34 = &unk_1E6A0DC80;
        id v35 = v9;
        BOOL v16 = MRMediaRemoteSendCommandForOriginWithReply() == 0;

        if (v16)
        {
          __int16 v17 = (void *)MEMORY[0x1D9452090]();
          int v18 = v12;
          HMFGetOSLogHandle();
          __int16 v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v40 = v20;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Sending the command to mediaremote failed for mediaSession", buf, 0xCu);
          }
          uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2005];
          int v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:74 description:@"Media remote command send failure " reason:@"Media remote command send failure" suggestion:0 underlyingError:v21];
          [(HMDMediaSession *)v18 _invokePendingSetPlaybackStateBlocksOfError:v22];
        }
      }
    }
    else
    {
      __int16 v24 = [(HMDMediaSession *)self endpoint];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __48__HMDMediaSession__setPlaybackState_completion___block_invoke_63;
      v29[3] = &unk_1E6A0DCA8;
      v29[4] = self;
      id v30 = v9;
      [v24 setPlaybackState:v8 completionHandler:v29];
    }
    objc_destroyWeak(v37);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  if (v6)
  {
    v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    ((void (**)(void, void *))v7)[2](v7, v23);
  }
LABEL_18:
}

void __48__HMDMediaSession__setPlaybackState_completion___block_invoke(uint64_t a1, void *a2, const __CFArray *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = v5;
  uint64_t v8 = v7;
  uint64_t v31 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  }
  uint64_t v29 = a1;
  id v30 = v7;
  if (!a3 || v8)
  {
LABEL_15:
    if (v8) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v11 = Count;
    uint64_t v8 = 0;
    CFIndex v12 = 0;
    *(void *)&long long v10 = 138543618;
    long long v28 = v10;
    do
    {
      uint64_t v13 = CFArrayGetValueAtIndex(a3, v12);
      unsigned int v14 = [v13 unsignedIntegerValue];
      unsigned int v15 = v14;
      if (v14 && v14 != 3)
      {
        BOOL v16 = (void *)MEMORY[0x1D9452090]();
        id v17 = v31;
        int v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          __int16 v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v28;
          v33 = v19;
          __int16 v34 = 2048;
          uint64_t v35 = v15;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Locally setting playback state failed with status: %ld", buf, 0x16u);
        }
        id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2005];
        uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:74 description:@"Media remote command failure " reason:@"Media remote command failure" suggestion:0 underlyingError:v20];

        uint64_t v8 = (void *)v21;
      }

      if (v15 != 3 && v15) {
        break;
      }
      ++v12;
    }
    while (v11 != v12);
    goto LABEL_15;
  }
LABEL_16:
  int v22 = (void *)MEMORY[0x1D9452090]();
  id v23 = v31;
  __int16 v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    uint64_t v26 = *(void *)(v29 + 40);
    *(_DWORD *)buf = 138543618;
    v33 = v25;
    __int16 v34 = 2048;
    uint64_t v35 = v26;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Set plaback state to %ld on successfully sending mediaremote command", buf, 0x16u);
  }
  uint64_t v27 = [v23 state];
  [v27 setPlaybackState:*(void *)(v29 + 40)];

  uint64_t v8 = 0;
LABEL_19:
  objc_msgSend(v31, "_invokePendingSetPlaybackStateBlocksOfError:", v8, v28);
}

uint64_t __48__HMDMediaSession__setPlaybackState_completion___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__HMDMediaSession__setPlaybackState_completion___block_invoke_63(uint64_t a1, void *a2, const void *a3)
{
  id v5 = a2;
  if (a3) {
    CFRetain(a3);
  }
  id v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDMediaSession__setPlaybackState_completion___block_invoke_2;
  block[3] = &unk_1E6A181A0;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  CFIndex v12 = a3;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __48__HMDMediaSession__setPlaybackState_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)_queueSetPlaybackStateCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    aBlock = v4;
    id v5 = [(HMDMediaSession *)self setPlaybackStateCompletionHandlers];
    id v6 = _Block_copy(aBlock);
    [v5 addObject:v6];

    id v7 = [(HMDMediaSession *)self setPlaybackStateTimer];

    id v4 = aBlock;
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F65530] sharedPreferences];
      id v9 = [v8 preferenceForKey:@"playbackStateTimeout"];
      id v10 = [v9 numberValue];

      double v11 = (double)[v10 unsignedIntValue];
      CFIndex v12 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:v11];
      [(HMDMediaSession *)self setSetPlaybackStateTimer:v12];

      uint64_t v13 = [(HMDMediaSession *)self setPlaybackStateTimer];
      [v13 setDelegate:self];

      unsigned int v14 = [(HMDMediaSession *)self setPlaybackStateTimer];
      [v14 resume];

      id v4 = aBlock;
    }
  }
}

- (void)_invokePendingSetPlaybackStateBlocksOfError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaSession *)self setPlaybackStateTimer];

  if (v5)
  {
    id v6 = [(HMDMediaSession *)self setPlaybackStateTimer];
    [v6 suspend];

    [(HMDMediaSession *)self setSetPlaybackStateTimer:0];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(HMDMediaSession *)self setPlaybackStateCompletionHandlers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  CFIndex v12 = [(HMDMediaSession *)self setPlaybackStateCompletionHandlers];
  [v12 removeAllObjects];
}

- (void)updateWithResponses:(id)a3 requestMessageInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDMediaSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDMediaSession_updateWithResponses_requestMessageInformation___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__HMDMediaSession_updateWithResponses_requestMessageInformation___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v71 = v5;
    __int16 v72 = 2112;
    uint64_t v73 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating media session with responses %@", buf, 0x16u);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v64 = [v7 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v64)
  {
    int v8 = 0;
    uint64_t v63 = *(void *)v66;
    uint64_t v62 = *MEMORY[0x1E4F2D9B8];
    uint64_t v61 = *MEMORY[0x1E4F2DA10];
    uint64_t v60 = *MEMORY[0x1E4F2D9E0];
    uint64_t v59 = *MEMORY[0x1E4F2DA20];
    id obj = v7;
    uint64_t v58 = *MEMORY[0x1E4F2D9A0];
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v66 != v63) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "request", obj);
        id v12 = [v11 property];
        if ([v12 isEqual:v62])
        {
          id v13 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v14 = v13;
          }
          else {
            long long v14 = 0;
          }
          id v15 = v14;

          if (v15)
          {
            long long v16 = [*(id *)(a1 + 32) state];
            uint64_t v17 = [v16 playbackState];

            uint64_t v18 = [v15 unsignedIntegerValue];
            __int16 v19 = [*(id *)(a1 + 32) state];
            [v19 setPlaybackState:v18];

            [*(id *)(a1 + 32) _invokePendingSetPlaybackStateBlocksOfError:0];
            id v20 = [v10 error];
            if (v20) {
              BOOL v21 = 1;
            }
            else {
              BOOL v21 = v17 == v18;
            }
            int v22 = !v21;

            v8 |= v22;
          }
        }
        if ([v12 isEqual:v61])
        {
          id v23 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v24 = v23;
          }
          else {
            __int16 v24 = 0;
          }
          id v25 = v24;

          if (v25)
          {
            uint64_t v26 = [*(id *)(a1 + 32) state];
            uint64_t v27 = [v26 shuffleState];

            uint64_t v28 = [v25 unsignedIntegerValue];
            uint64_t v29 = [*(id *)(a1 + 32) state];
            [v29 setShuffleState:v28];

            id v30 = [v10 error];
            if (v30) {
              BOOL v31 = 1;
            }
            else {
              BOOL v31 = v27 == v28;
            }
            int v32 = !v31;

            v8 |= v32;
          }
        }
        if ([v12 isEqual:v60])
        {
          v33 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v34 = v33;
          }
          else {
            __int16 v34 = 0;
          }
          id v35 = v34;

          if (v35)
          {
            uint64_t v36 = [*(id *)(a1 + 32) state];
            uint64_t v37 = [v36 repeatState];

            uint64_t v38 = [v35 unsignedIntegerValue];
            id v39 = [*(id *)(a1 + 32) state];
            [v39 setRepeatState:v38];

            id v40 = [v10 error];
            if (v40) {
              BOOL v41 = 1;
            }
            else {
              BOOL v41 = v37 == v38;
            }
            int v42 = !v41;

            v8 |= v42;
          }
        }
        if ([v12 isEqual:v59])
        {
          uint64_t v43 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v44 = v43;
          }
          else {
            uint64_t v44 = 0;
          }
          id v45 = v44;

          if (v45)
          {
            v46 = [*(id *)(a1 + 32) state];
            v47 = [v46 volume];

            uint64_t v48 = [*(id *)(a1 + 32) state];
            [v48 setVolume:v45];

            v49 = [v10 error];
            if (v49) {

            }
            else {
              v8 |= HMFEqualObjects() ^ 1;
            }
          }
        }
        if ([v12 isEqual:v58])
        {
          v50 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v51 = v50;
          }
          else {
            id v51 = 0;
          }
          id v52 = v51;

          if (v52)
          {
            v53 = [*(id *)(a1 + 32) state];
            v54 = [v53 mediaUniqueIdentifier];

            v55 = [*(id *)(a1 + 32) state];
            [v55 setMediaUniqueIdentifier:v52];

            id v56 = [v10 error];
            if (v56) {

            }
            else {
              v8 |= HMFEqualObjects() ^ 1;
            }
          }
        }
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v64);

    if (v8) {
      [*(id *)(a1 + 32) _postNotificationOfMediaStateUpdateWithRequestMessageInformation:*(void *)(a1 + 48)];
    }
  }
  else
  {
  }
}

- (void)_postNotificationOfMediaStateUpdateWithPayload:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24[0] = *MEMORY[0x1E4F2D9B8];
  id v5 = NSNumber;
  uint64_t v6 = [(HMDMediaSession *)self state];
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "playbackState"));
  v25[0] = v7;
  v24[1] = *MEMORY[0x1E4F2DA18];
  int v8 = [(HMDMediaSession *)self uuid];
  id v9 = [v8 UUIDString];
  v25[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (v4) {
    uint64_t v12 = [v11 addEntriesFromDictionary:v4];
  }
  id v13 = (void *)MEMORY[0x1D9452090](v12);
  long long v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    long long v16 = HMFGetLogIdentifier();
    int v18 = 138543874;
    __int16 v19 = v16;
    __int16 v20 = 2112;
    BOOL v21 = @"HMDMediaSessionDidUpdatePlaybackStateNotification";
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending internal notification %@ with payload %@", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 postNotificationName:@"HMDMediaSessionDidUpdatePlaybackStateNotification" object:v14 userInfo:v11];
}

- (void)_postNotificationOfMediaStateUpdateWithRequestMessageInformation:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x1E4F2D9E8];
    v8[0] = a3;
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    uint64_t v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(HMDMediaSession *)self _postNotificationOfMediaStateUpdateWithPayload:v6];
}

- (void)_postNotificationOfMediaStateUpdate
{
}

- (void)_registerForSessionUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(HMDMediaSession *)self isCurrentAccessorySession])
  {
    id v5 = [(HMDMediaSession *)self endpoint];
    [v5 registerForNowPlayingUpdates:v3];
  }
  if (v3)
  {
    [(HMDMediaSession *)self _handleGetPlaybackState:0];
  }
}

- (void)handleMediaPlaybackStateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaSession *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  BOOL v3 = (void *)[v2 playbackState];

  id v4 = objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", *MEMORY[0x1E4F77830]);
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 unsignedIntValue];
    if (v6 > 5) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = qword_1D54D4460[v6];
    }
    id v9 = [*(id *)(a1 + 32) state];
    [v9 setPlaybackState:v7];

    [*(id *)(a1 + 32) _invokePendingSetPlaybackStateBlocksOfError:0];
    if (v3 != (void *)v7)
    {
      id v10 = *(void **)(a1 + 32);
      id v15 = @"force-notify";
      v16[0] = MEMORY[0x1E4F1CC38];
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      [v10 _postNotificationOfMediaStateUpdateWithPayload:v11];
    }
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v8 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke_2;
    v12[3] = &unk_1E6A0DC30;
    objc_copyWeak(v13, &location);
    v13[1] = v3;
    [v8 _getPlaybackStateWithCompletion:v12];
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _invokePendingSetPlaybackStateBlocksOfError:v6];

  if (!v6 && *(void *)(a1 + 40) != a3) {
    [WeakRetained _postNotificationOfMediaStateUpdate];
  }
}

- (void)handleRefreshPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaSession *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__HMDMediaSession_handleRefreshPlayback___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__HMDMediaSession_handleRefreshPlayback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleGetPlaybackState:*(void *)(a1 + 40)];
}

- (void)_handleGetPlaybackState:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__HMDMediaSession__handleGetPlaybackState___block_invoke;
  v6[3] = &unk_1E6A0DC08;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HMDMediaSession *)self _getPlaybackStateWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__HMDMediaSession__handleGetPlaybackState___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v3) {
      goto LABEL_3;
    }
  }
  else if (!v3)
  {
    BOOL v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    if (!v3)
    {
LABEL_3:
      if (*(void *)(a1 + 32)) {
        BOOL v3 = [[HMDMediaSessionRequestMessageInformation alloc] initWithMessage:*(void *)(a1 + 32)];
      }
      else {
        BOOL v3 = 0;
      }
      [WeakRetained _postNotificationOfMediaStateUpdateWithRequestMessageInformation:v3];
      [*(id *)(a1 + 32) respondWithSuccess];
      goto LABEL_10;
    }
  }
  [*(id *)(a1 + 32) respondWithError:v3];
LABEL_10:
}

- (void)_getPlaybackStateWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6A0DB68;
  objc_copyWeak(&v27, &location);
  id v5 = v4;
  id v26 = v5;
  id v6 = _Block_copy(aBlock);
  if ([(HMDMediaSession *)self isCurrentAccessorySession])
  {
    BOOL v7 = MRMediaRemoteGetLocalOrigin() == 0;
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    if (v7)
    {
      HMFGetOSLogHandle();
      long long v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v30 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up local origin for currentAccessory to get playback state", buf, 0xCu);
      }
      if (v5)
      {
        long long v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2005];
        uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4 description:@"Cannot lookup origin" reason:@"Cannot lookup origin" suggestion:0 underlyingError:v16];
        (*((void (**)(id, void *, void))v5 + 2))(v5, v17, 0);
      }
    }
    else
    {
      HMFGetOSLogHandle();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v30 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempting to locally read the playback state from media remote", buf, 0xCu);
      }
      uint64_t v12 = [(HMDMediaSession *)v9 workQueue];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      __int16 v22 = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_40;
      id v23 = &unk_1E6A0DB90;
      id v24 = v6;
      MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();
    }
  }
  else
  {
    id v13 = [(HMDMediaSession *)self endpoint];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_2;
    v18[3] = &unk_1E6A0DBE0;
    v18[4] = self;
    id v19 = v6;
    [v13 getPlaybackStateWithCompletionHandler:v18];
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v7 = WeakRetained;
  if (v5)
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (a3 > 5) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = qword_1D54D4460[a3];
    }
    id v9 = [WeakRetained state];
    [v9 setPlaybackState:v8];

    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v7;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      long long v16 = v13;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Locally read the playback state as: %tu", (uint8_t *)&v15, 0x16u);
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v5, v8);
  }
}

uint64_t __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_3;
  block[3] = &unk_1E6A0DBB8;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  int v12 = a3;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (id)dumpState
{
  BOOL v3 = NSString;
  id v4 = [(HMDMediaSession *)self uuid];
  id v5 = [v4 UUIDString];
  id v6 = [(HMDMediaSession *)self sessionIdentifier];
  id v7 = [(HMDMediaSession *)self state];
  [v7 playbackState];
  id v8 = playbackStateAsString();
  id v9 = [(HMDMediaSession *)self endpoint];
  id v10 = [v3 stringWithFormat:@"MediaSession uuid: %@, sessionIdentifier: %@, playbackState: %@, endpoint: %@", v5, v6, v8, v9];

  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:*MEMORY[0x1E4F64EA0]];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDMediaSession *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMDMediaSession *)self uuid];
      id v8 = [(HMDMediaSession *)v6 uuid];
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
  uint64_t v2 = [(HMDMediaSession *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  unint64_t v3 = [(HMDMediaSession *)self setPlaybackStateTimer];
  [v3 suspend];

  [(HMDMediaSession *)self setSetPlaybackStateTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaSession;
  [(HMDMediaSession *)&v4 dealloc];
}

- (id)_initWithMediaProfiles:(id)a3 state:(id)a4
{
  return [(HMDMediaSession *)self _initWithEndpoint:0 mediaProfiles:a3 state:a4];
}

- (id)_initWithEndpoint:(id)a3 mediaProfiles:(id)a4 state:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11) {
    _HMFPreconditionFailure();
  }
  int v12 = v11;
  v36.receiver = self;
  v36.super_class = (Class)HMDMediaSession;
  id v13 = [(HMDMediaSession *)&v36 init];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
    mediaProfiles = v13->_mediaProfiles;
    v13->_mediaProfiles = (NSMutableSet *)v14;

    objc_storeStrong((id *)&v13->_state, a5);
    uint64_t v16 = [v12 sessionIdentifier];
    sessionIdentifier = v13->_sessionIdentifier;
    v13->_sessionIdentifier = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F29128];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
    v37[0] = v13->_sessionIdentifier;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v21 = objc_msgSend(v18, "hm_deriveUUIDFromBaseUUID:withSalts:", v19, v20);
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v21;

    id v23 = NSString;
    id v24 = v13->_sessionIdentifier;
    id v25 = [(NSUUID *)v13->_uuid UUIDString];
    uint64_t v26 = [v23 stringWithFormat:@"%@/%@", v24, v25];
    logID = v13->_logID;
    v13->_logID = (NSString *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    setPlaybackStateCompletionHandlers = v13->_setPlaybackStateCompletionHandlers;
    v13->_setPlaybackStateCompletionHandlers = (NSMutableArray *)v28;

    HMDispatchQueueNameString();
    id v30 = objc_claimAutoreleasedReturnValue();
    uint64_t v31 = (const char *)[v30 UTF8String];
    int v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v33 = dispatch_queue_create(v31, v32);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v33;

    objc_storeStrong((id *)&v13->_endpoint, a3);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)mediaPropertyValueTypeWithMessageKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F2D9B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DA10]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2D9E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DA20]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x1E4F2D9A0]])
  {
    objc_super v4 = objc_opt_class();
  }
  else
  {
    objc_super v4 = 0;
  }

  return (Class)v4;
}

+ (NSArray)mediaPropertyMessageKeys
{
  void v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2DA10];
  v6[0] = *MEMORY[0x1E4F2D9B8];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F2DA20];
  v6[2] = *MEMORY[0x1E4F2D9E0];
  v6[3] = v3;
  void v6[4] = *MEMORY[0x1E4F2D9A0];
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  return (NSArray *)v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_86955 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_86955, &__block_literal_global_86956);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v2_86957;
  return v2;
}

uint64_t __30__HMDMediaSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_86957;
  logCategory__hmf_once_v2_86957 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sessionForCurrentAccessoryWithSessionIdentifier:(id)a3 mediaProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__HMDMediaSession_sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile___block_invoke;
  v12[3] = &unk_1E6A197C8;
  id v13 = v5;
  id v14 = v6;
  uint64_t v7 = sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__onceToken;
  id v8 = v6;
  id v9 = v5;
  if (v7 != -1) {
    dispatch_once(&sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__onceToken, v12);
  }
  id v10 = (id)sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory;

  return v10;
}

void __80__HMDMediaSession_sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[HMDMediaSessionState alloc] initWithSessionIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = [HMDMediaSession alloc];
  v7[0] = *(void *)(a1 + 40);
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v5 = [(HMDMediaSession *)v3 _initWithMediaProfiles:v4 state:v2];
  id v6 = (void *)sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory;
  sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory = v5;

  *(unsigned char *)(sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory + 25) = 1;
}

@end