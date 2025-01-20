@interface _HMAudioControl
- (BOOL)isMuted;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMMediaSession)mediaSession;
- (NSUUID)messageTargetUUID;
- (NSUUID)uniqueIdentifier;
- (_HMAudioControl)initWithMediaSession:(id)a3;
- (_HMAudioControlDelegate)delegate;
- (_HMContext)context;
- (float)volume;
- (id)messageDestination;
- (void)__configureWithContext:(id)a3;
- (void)_handleAudioControlUpdated:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_unconfigure;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)updateMuted:(BOOL)a3 completionHandler:(id)a4;
- (void)updateVolume:(float)a3 completionHandler:(id)a4;
@end

@implementation _HMAudioControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_mediaSession);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setDelegate:(id)a3
{
}

- (_HMAudioControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMAudioControlDelegate *)WeakRetained;
}

- (HMMediaSession)mediaSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSession);

  return (HMMediaSession *)WeakRetained;
}

- (void)_handleAudioControlUpdated:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_HMAudioControl *)self context];
  v6 = [v5 pendingRequests];

  v7 = [v4 identifier];
  v8 = [v6 removeCompletionBlockForIdentifier:v7];

  v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = _Block_copy(v8);
    *(_DWORD *)buf = 138543874;
    v42 = v12;
    __int16 v43 = 2112;
    id v44 = v4;
    __int16 v45 = 2112;
    v46 = v13;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that audio controls got updated : %@, %@", buf, 0x20u);
  }
  v14 = [(_HMAudioControl *)v10 delegate];
  v15 = [v4 numberForKey:@"volume"];
  if (v15)
  {
    [(_HMAudioControl *)v10 volume];
    float v17 = v16;
    [v15 floatValue];
    float v19 = v18;
    -[_HMAudioControl setVolume:](v10, "setVolume:");
    if (!v8 && v17 != v19 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = [(_HMAudioControl *)v10 delegate];
      v21 = [(_HMAudioControl *)v10 context];
      v22 = [v21 delegateCaller];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __46___HMAudioControl__handleAudioControlUpdated___block_invoke;
      v37[3] = &unk_1E593F268;
      id v38 = v20;
      v39 = v10;
      float v40 = v19;
      id v23 = v20;
      [v22 invokeBlock:v37];
    }
  }
  v24 = [v4 numberForKey:@"muted"];
  v25 = v24;
  if (v24
    && (uint64_t v26 = [v24 BOOLValue],
        int v27 = [(_HMAudioControl *)v10 isMuted],
        [(_HMAudioControl *)v10 setMuted:v26],
        !v8)
    && v26 != v27)
  {
    if (objc_opt_respondsToSelector())
    {
      v28 = [(_HMAudioControl *)v10 delegate];
      v32 = [(_HMAudioControl *)v10 context];
      v29 = [v32 delegateCaller];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __46___HMAudioControl__handleAudioControlUpdated___block_invoke_2;
      v33[3] = &unk_1E5944D60;
      v34 = v28;
      v35 = v10;
      char v36 = v26;
      id v30 = v28;
      [v29 invokeBlock:v33];

      v31 = v34;
LABEL_15:
    }
  }
  else if (v8)
  {
    id v30 = [(_HMAudioControl *)v10 context];
    v31 = [v30 delegateCaller];
    [v31 callCompletion:v8 error:0];
    goto LABEL_15;
  }
}

- (void)updateMuted:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(_HMAudioControl *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMAudioControl updateMuted:completionHandler:]", @"completionHandler"];
    float v16 = (void *)MEMORY[0x19F3A64A0]();
    float v17 = self;
    float v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      float v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49___HMAudioControl_updateMuted_completionHandler___block_invoke;
    block[3] = &unk_1E5941750;
    BOOL v24 = a3;
    block[4] = self;
    id v23 = v6;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v13;
      __int16 v27 = 2080;
      v28 = "-[_HMAudioControl updateMuted:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

- (void)updateVolume:(float)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(_HMAudioControl *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMAudioControl updateVolume:completionHandler:]", @"completionHandler"];
    float v16 = (void *)MEMORY[0x19F3A64A0]();
    float v17 = self;
    float v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      float v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50___HMAudioControl_updateVolume_completionHandler___block_invoke;
    block[3] = &unk_1E593F2B8;
    float v24 = a3;
    block[4] = self;
    id v23 = v6;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v13;
      __int16 v27 = 2080;
      v28 = "-[_HMAudioControl updateVolume:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
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
  if (v6)
  {
    v7 = [(_HMAudioControl *)self delegate];
    [v6 volume];
    float v9 = v8;
    [(_HMAudioControl *)self volume];
    BOOL v11 = *(float *)&v10 != v9;
    if (*(float *)&v10 != v9)
    {
      *(float *)&double v10 = v9;
      [(_HMAudioControl *)self setVolume:v10];
      if (objc_opt_respondsToSelector())
      {
        v12 = [(_HMAudioControl *)self context];
        v13 = [v12 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E593F268;
        block[4] = self;
        float v23 = v9;
        id v22 = v7;
        dispatch_async(v13, block);
      }
    }
    uint64_t v14 = [v6 isMuted];
    if (v14 != [(_HMAudioControl *)self isMuted])
    {
      [(_HMAudioControl *)self setMuted:v14];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [(_HMAudioControl *)self context];
        float v16 = [v15 queue];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke_27;
        v18[3] = &unk_1E5944D60;
        v18[4] = self;
        id v19 = v7;
        char v20 = v14;
        dispatch_async(v16, v18);
      }
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(_HMAudioControl *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(_HMAudioControl *)self mediaSession];
  id v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (void)setMuted:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_muted = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isMuted
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_muted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setVolume:(float)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_volume = a3;

  os_unfair_lock_unlock(p_lock);
}

- (float)volume
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  float volume = self->_volume;
  os_unfair_lock_unlock(p_lock);
  return volume;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v5 = (void *)MEMORY[0x1E4F29128];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSession);
    v7 = [WeakRetained uniqueIdentifier];
    objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:", v7);
    float v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    float v9 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v8;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  double v10 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)_unconfigure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    BOOL v11 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring audioControl", (uint8_t *)&v10, 0xCu);
  }
  v7 = [(_HMAudioControl *)v4 context];
  float v8 = [v7 messageDispatcher];
  [v8 deregisterReceiver:v4];

  [(_HMAudioControl *)v4 setContext:0];
  float v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:v4];
}

- (void)__configureWithContext:(id)a3
{
  [(_HMAudioControl *)self setContext:a3];

  [(_HMAudioControl *)self _registerNotificationHandlers];
}

- (void)_registerNotificationHandlers
{
  id v4 = [(_HMAudioControl *)self context];
  id v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"HMAC.ua" receiver:self selector:sel__handleAudioControlUpdated_];
}

- (_HMAudioControl)initWithMediaSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HMAudioControl;
  v5 = [(_HMAudioControl *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    v5->_muted = 0;
    v5->_float volume = 0.0;
    objc_storeWeak((id *)&v5->_mediaSession, v4);
  }

  return v6;
}

@end