@interface HMAudioControl
- (BOOL)isMuted;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAudioControl)initWithMediaSession:(id)a3;
- (HMAudioControlDelegate)delegate;
- (HMMediaSession)mediaSession;
- (NSUUID)uniqueIdentifier;
- (_HMAudioControl)audioControl;
- (float)volume;
- (void)__configureWithContext:(id)a3;
- (void)_unconfigure;
- (void)audioControl:(id)a3 didUpdateMuted:(BOOL)a4;
- (void)audioControl:(id)a3 didUpdateVolume:(float)a4;
- (void)setAudioControl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaSession:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)updateMuted:(BOOL)a3 completionHandler:(id)a4;
- (void)updateVolume:(float)a3 completionHandler:(id)a4;
@end

@implementation HMAudioControl

uint64_t __46___HMAudioControl__handleAudioControlUpdated___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) audioControl:*(void *)(a1 + 40) didUpdateVolume:a2];
}

uint64_t __46___HMAudioControl__handleAudioControlUpdated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) audioControl:*(void *)(a1 + 40) didUpdateMuted:*(unsigned __int8 *)(a1 + 48)];
}

void __49___HMAudioControl_updateMuted_completionHandler___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"muted";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v14[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v4 = (void *)MEMORY[0x1E4F654B0];
  v5 = [*(id *)(a1 + 32) messageDestination];
  v6 = [v4 messageWithName:@"HMAC.sa" destination:v5 payload:v3];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___HMAudioControl_updateMuted_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5941728;
  objc_copyWeak(&v10, &location);
  char v11 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  [v6 setResponseHandler:v8];
  v7 = [*(id *)(a1 + 40) messageDispatcher];
  [v7 sendMessage:v6 completionHandler:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49___HMAudioControl_updateMuted_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      v12 = HMFBooleanToString();
      int v15 = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set the mute state to %@", (uint8_t *)&v15, 0x16u);
    }
    [v9 setMuted:*(unsigned __int8 *)(a1 + 48)];
  }
  v13 = [WeakRetained context];
  v14 = [v13 delegateCaller];
  [v14 callCompletion:*(void *)(a1 + 32) error:v5];
}

void __50___HMAudioControl_updateVolume_completionHandler___block_invoke(uint64_t a1, double a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14 = @"volume";
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  v3 = [NSNumber numberWithFloat:a2];
  v15[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  id v5 = (void *)MEMORY[0x1E4F654B0];
  id v6 = [*(id *)(a1 + 32) messageDestination];
  v7 = [v5 messageWithName:@"HMAC.sa" destination:v6 payload:v4];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___HMAudioControl_updateVolume_completionHandler___block_invoke_2;
  v9[3] = &unk_1E593F290;
  objc_copyWeak(&v11, &location);
  int v12 = *(_DWORD *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v7 setResponseHandler:v9];
  v8 = [*(id *)(a1 + 40) messageDispatcher];
  [v8 sendMessage:v7 completionHandler:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50___HMAudioControl_updateVolume_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      LODWORD(v12) = *(_DWORD *)(a1 + 48);
      v13 = [NSNumber numberWithFloat:v12];
      int v17 = 138543618;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set the volume to %@", (uint8_t *)&v17, 0x16u);
    }
    LODWORD(v14) = *(_DWORD *)(a1 + 48);
    [v9 setVolume:v14];
  }
  int v15 = [WeakRetained context];
  v16 = [v15 delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 32) error:v5];
}

void __38___HMAudioControl_mergeFromNewObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E593F268;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  int v7 = *(_DWORD *)(a1 + 48);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __38___HMAudioControl_mergeFromNewObject___block_invoke_27(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke_2_28;
  v6[3] = &unk_1E5944D60;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  char v9 = *(unsigned char *)(a1 + 48);
  [v3 invokeBlock:v6];
}

uint64_t __38___HMAudioControl_mergeFromNewObject___block_invoke_2_28(uint64_t a1)
{
  return [*(id *)(a1 + 32) audioControl:*(void *)(a1 + 40) didUpdateMuted:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __38___HMAudioControl_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    LODWORD(v6) = *(_DWORD *)(a1 + 48);
    id v7 = [NSNumber numberWithFloat:v6];
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateVolume : %@", (uint8_t *)&v10, 0x16u);
  }
  LODWORD(v8) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 40) audioControl:*(void *)(a1 + 32) didUpdateVolume:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioControl, 0);
  objc_destroyWeak((id *)&self->_mediaSession);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAudioControl:(id)a3
{
}

- (_HMAudioControl)audioControl
{
  return self->_audioControl;
}

- (void)setMediaSession:(id)a3
{
}

- (HMMediaSession)mediaSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSession);

  return (HMMediaSession *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMAudioControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMAudioControlDelegate *)WeakRetained;
}

- (void)audioControl:(id)a3 didUpdateMuted:(BOOL)a4
{
  double v6 = [(HMAudioControl *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(HMAudioControl *)self delegate];
    char v9 = [(HMAudioControl *)self audioControl];
    int v10 = [v9 context];
    id v11 = [v10 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__HMAudioControl_audioControl_didUpdateMuted___block_invoke;
    v13[3] = &unk_1E5944D60;
    id v14 = v8;
    int v15 = self;
    BOOL v16 = a4;
    id v12 = v8;
    [v11 invokeBlock:v13];
  }
}

uint64_t __46__HMAudioControl_audioControl_didUpdateMuted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) audioControl:*(void *)(a1 + 40) didUpdateMuted:*(unsigned __int8 *)(a1 + 48)];
}

- (void)audioControl:(id)a3 didUpdateVolume:(float)a4
{
  double v6 = [(HMAudioControl *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(HMAudioControl *)self delegate];
    char v9 = [(HMAudioControl *)self audioControl];
    int v10 = [v9 context];
    id v11 = [v10 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__HMAudioControl_audioControl_didUpdateVolume___block_invoke;
    v13[3] = &unk_1E593F268;
    id v14 = v8;
    int v15 = self;
    float v16 = a4;
    id v12 = v8;
    [v11 invokeBlock:v13];
  }
}

uint64_t __47__HMAudioControl_audioControl_didUpdateVolume___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) audioControl:*(void *)(a1 + 40) didUpdateVolume:a2];
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
    char v7 = [(HMAudioControl *)self audioControl];
    double v8 = [v6 audioControl];
    char v9 = [v7 mergeFromNewObject:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)updateMuted:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HMAudioControl *)self audioControl];
  [v7 updateMuted:v4 completionHandler:v6];
}

- (void)updateVolume:(float)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  if (a3 < 0.0 || a3 > 1.0)
  {
    char v9 = (void *)MEMORY[0x19F3A64A0]();
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      float v16 = v13;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Volume must be between 0.0 - 1.0", buf, 0xCu);
    }
    objc_exception_throw( (id) *MEMORY[0x1E4F1C4A8]);
  }
  id v7 = [(HMAudioControl *)self audioControl];
  *(float *)&double v8 = a3;
  [v7 updateVolume:v14 completionHandler:v8];
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HMAudioControl *)self audioControl];
  [v4 setMuted:v3];
}

- (BOOL)isMuted
{
  v2 = [(HMAudioControl *)self audioControl];
  char v3 = [v2 isMuted];

  return v3;
}

- (void)setVolume:(float)a3
{
  id v5 = [(HMAudioControl *)self audioControl];
  *(float *)&double v4 = a3;
  [v5 setVolume:v4];
}

- (float)volume
{
  v2 = [(HMAudioControl *)self audioControl];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(HMAudioControl *)self audioControl];
  float v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (void)_unconfigure
{
  id v2 = [(HMAudioControl *)self audioControl];
  [v2 _unconfigure];
}

- (void)__configureWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAudioControl *)self audioControl];
  objc_msgSend(v5, "__configureWithContext:", v4);
}

- (HMAudioControl)initWithMediaSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAudioControl;
  id v5 = [(HMAudioControl *)&v9 init];
  if (v5)
  {
    id v6 = [[_HMAudioControl alloc] initWithMediaSession:v4];
    audioControl = v5->_audioControl;
    v5->_audioControl = v6;

    [(_HMAudioControl *)v5->_audioControl setDelegate:v5];
  }

  return v5;
}

@end