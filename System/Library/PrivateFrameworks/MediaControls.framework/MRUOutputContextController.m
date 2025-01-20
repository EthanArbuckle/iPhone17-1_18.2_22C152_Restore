@interface MRUOutputContextController
- (AVOutputContext)outputContext;
- (AVOutputDevice)outputDevice;
- (MRUOutputContextController)initWithOutputContextType:(int64_t)a3;
- (MRUOutputContextControllerDelegate)delegate;
- (id)associatedOutputContext;
- (void)_setOutputDevice:(id)a3 context:(id)a4 completion:(id)a5;
- (void)initializeOutputContextWithCompletion:(id)a3;
- (void)mediaServicesWereLostNotification:(id)a3;
- (void)mediaServicesWereResetNotification:(id)a3;
- (void)outputDeviceChangedNotification:(id)a3;
- (void)registerNotificationsForOutputContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOutputContext:(id)a3;
- (void)setOutputDevice:(id)a3 completion:(id)a4;
- (void)unregisterNotificationsForOutputContext:(id)a3;
@end

@implementation MRUOutputContextController

- (MRUOutputContextController)initWithOutputContextType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRUOutputContextController;
  v4 = [(MRUOutputContextController *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_outputContextType = a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_mediaServicesWereLostNotification_ name:*MEMORY[0x1E4F15030] object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel_mediaServicesWereResetNotification_ name:*MEMORY[0x1E4F15048] object:0];

    [(MRUOutputContextController *)v5 initializeOutputContextWithCompletion:0];
  }
  return v5;
}

- (AVOutputDevice)outputDevice
{
  v2 = [(MRUOutputContextController *)self outputContext];
  v3 = [v2 outputDevice];

  return (AVOutputDevice *)v3;
}

- (void)setOutputContext:(id)a3
{
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_outputContext)
  {
    -[MRUOutputContextController unregisterNotificationsForOutputContext:](self, "unregisterNotificationsForOutputContext:");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MRUOutputContextController_setOutputContext___block_invoke;
    block[3] = &unk_1E5F0D7F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_storeStrong((id *)&self->_outputContext, a3);
  if (self->_outputContext)
  {
    -[MRUOutputContextController registerNotificationsForOutputContext:](self, "registerNotificationsForOutputContext:");
    v7 = [(AVOutputContext *)self->_outputContext outputDevice];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__MRUOutputContextController_setOutputContext___block_invoke_2;
    v9[3] = &unk_1E5F0D8E8;
    v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  os_unfair_lock_unlock(p_lock);
}

void __47__MRUOutputContextController_setOutputContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 outputContextController:*(void *)(a1 + 32) didChangeOutputDevice:0];
}

void __47__MRUOutputContextController_setOutputContext___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 outputContextController:*(void *)(a1 + 32) didChangeOutputDevice:*(void *)(a1 + 40)];
}

- (AVOutputContext)outputContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_outputContext;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setOutputDevice:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p>.setOutputDevice", objc_opt_class(), self];
  objc_super v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v8, v11];
  v13 = v12;
  if (v6) {
    [v12 appendFormat:@" for %@", v6];
  }
  v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v13;
    _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke;
  aBlock[3] = &unk_1E5F0F7E8;
  id v15 = v6;
  id v27 = v15;
  id v28 = v8;
  id v29 = v11;
  id v30 = v9;
  id v31 = v7;
  id v16 = v7;
  id v17 = v9;
  id v18 = v11;
  id v19 = v8;
  v20 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_3;
  v23[3] = &unk_1E5F0F810;
  v23[4] = self;
  id v24 = v15;
  id v25 = v20;
  id v21 = v20;
  id v22 = v15;
  [(MRUOutputContextController *)self initializeOutputContextWithCompletion:v23];
}

void __57__MRUOutputContextController_setOutputDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v4 = [NSNumber numberWithInteger:a2];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = _MRLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [NSNumber numberWithInteger:a2];
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v41 = v8;
      __int16 v42 = 2114;
      uint64_t v43 = v9;
      __int16 v44 = 2112;
      v45 = v10;
      __int16 v46 = 2114;
      uint64_t v47 = v11;
      __int16 v48 = 2048;
      uint64_t v49 = v13;
      v14 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v15 = v6;
      uint32_t v16 = 52;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      id v10 = [NSNumber numberWithInteger:a2];
      v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = v24;
      __int16 v42 = 2114;
      uint64_t v43 = v25;
      __int16 v44 = 2112;
      v45 = v10;
      __int16 v46 = 2048;
      uint64_t v47 = v26;
      v14 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      id v15 = v6;
      uint32_t v16 = 42;
    }
    _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
  }
  else
  {
    if (v5)
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      id v19 = *(void **)(a1 + 32);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = v18;
      __int16 v42 = 2114;
      uint64_t v43 = v17;
      __int16 v44 = 2114;
      v45 = v19;
      __int16 v46 = 2048;
      uint64_t v47 = v20;
      id v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v22 = v6;
      uint32_t v23 = 42;
    }
    else
    {
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v27;
      __int16 v42 = 2114;
      uint64_t v43 = v28;
      __int16 v44 = 2048;
      v45 = v29;
      id v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v22 = v6;
      uint32_t v23 = 32;
    }
    _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
  }

LABEL_15:
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_23;
  v36 = &unk_1E5F0D7D0;
  id v37 = *(id *)(a1 + 32);
  uint64_t v39 = a2;
  id v38 = *(id *)(a1 + 56);
  MRAnalyticsSendEvent();
  if (*(void *)(a1 + 64))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_2;
    block[3] = &unk_1E5F0F7C0;
    id v31 = *(id *)(a1 + 64);
    uint64_t v32 = a2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

id __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_23(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "deviceSubType"));
  [v2 setObject:v3 forKeyedSubscript:@"destination_device_sub_type"];

  v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"error_code"];

  uint64_t v5 = NSNumber;
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  BOOL v7 = [v5 numberWithDouble:-v6];
  [v2 setObject:v7 forKeyedSubscript:@"duration"];

  return v2;
}

uint64_t __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _setOutputDevice:*(void *)(a1 + 40) context:a2 completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_setOutputDevice:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = [v9 outputDevice];
  char v12 = [v11 isEqual:v8];

  if (v12)
  {
    v10[2](v10, 0);
  }
  else
  {
    uint64_t v13 = _MPAVLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ setting output device: %{public}@ for context: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__MRUOutputContextController__setOutputDevice_context_completion___block_invoke;
    v14[3] = &unk_1E5F0F838;
    objc_copyWeak(&v17, (id *)buf);
    id v15 = v8;
    uint32_t v16 = v10;
    [v9 setOutputDevice:v15 options:0 completionHandler:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __66__MRUOutputContextController__setOutputDevice_context_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [v3 status];
  if (v5 == 3)
  {
    double v6 = _MPAVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = [WeakRetained outputContext];
      int v17 = 138543874;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      __int16 v22 = v13;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed setting output device: %{public}@ for context: %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
  else if (v5 == 4)
  {
    double v6 = _MPAVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [WeakRetained outputContext];
      id v10 = [v3 cancellationReason];
      int v17 = 138544130;
      uint64_t v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      __int16 v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled setting output device: %{public}@ for context: %{public}@ with reason: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
  }
  else
  {
    double v6 = _MPAVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = *(void *)(a1 + 32);
      uint32_t v16 = [WeakRetained outputContext];
      int v17 = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      __int16 v22 = v16;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ success setting output device: %{public}@ for context: %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)outputDeviceChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = [(MRUOutputContextController *)self outputDevice];
  uint64_t v5 = _MPAVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [(MRUOutputContextController *)self outputContext];
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@ observed output device changed %@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__MRUOutputContextController_outputDeviceChangedNotification___block_invoke;
  v8[3] = &unk_1E5F0D8E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __62__MRUOutputContextController_outputDeviceChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 outputContextController:*(void *)(a1 + 32) didChangeOutputDevice:*(void *)(a1 + 40)];
}

- (id)associatedOutputContext
{
  int64_t outputContextType = self->_outputContextType;
  switch(outputContextType)
  {
    case 2:
      self = [MEMORY[0x1E4F165D0] sharedAudioPresentationOutputContext];
      break;
    case 1:
      self = [MEMORY[0x1E4F165D0] sharedSystemScreenContext];
      break;
    case 0:
      self = [MEMORY[0x1E4F165D0] sharedSystemAudioContext];
      break;
  }

  return self;
}

- (void)registerNotificationsForOutputContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel_outputDeviceChangedNotification_ name:*MEMORY[0x1E4F15F08] object:v5];
}

- (void)unregisterNotificationsForOutputContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F15F08] object:v5];
}

- (void)initializeOutputContextWithCompletion:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  id v5 = [(MRUOutputContextController *)self outputContext];
  if (v5)
  {
    if (v4) {
      v4[2](v4, v5, 0);
    }
  }
  else
  {
    unint64_t outputContextType = self->_outputContextType;
    id v7 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p>.initializeOutputContextWithCompletion", objc_opt_class(), self];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];

    uint64_t v11 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v7, v10];
    __int16 v12 = v11;
    if (outputContextType <= 2) {
      [(__CFString *)v11 appendFormat:@" for %@", off_1E5F0F8E8[outputContextType]];
    }
    uint64_t v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v12;
      _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke;
    aBlock[3] = &unk_1E5F0F860;
    unint64_t v37 = outputContextType;
    id v22 = v7;
    id v33 = v22;
    id v14 = v10;
    id v34 = v14;
    id v23 = v8;
    id v35 = v23;
    v36 = v4;
    uint64_t v15 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_44;
    v28[3] = &unk_1E5F0F888;
    objc_copyWeak(&v30, &location);
    id v16 = v15;
    id v29 = v16;
    int v17 = (uint64_t (**)(void))_Block_copy(v28);
    if (initializeOutputContextWithCompletion__onceToken != -1) {
      dispatch_once(&initializeOutputContextWithCompletion__onceToken, &__block_literal_global_33);
    }
    if ((v17[2](v17) & 1) == 0)
    {
      uint64_t v18 = _MPAVLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = @"SharedSystemAudio";
        if (outputContextType == 2) {
          __int16 v19 = @"SharedAudioPresentation";
        }
        if (outputContextType == 1) {
          __int16 v19 = @"SharedSystemScreen";
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v19;
        _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ unavailable. Retrying", buf, 0xCu);
      }

      dispatch_time_t v20 = dispatch_time(0, 1000000000);
      __int16 v21 = initializeOutputContextWithCompletion__workerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_47;
      block[3] = &unk_1E5F0F8B0;
      uint64_t v25 = v17;
      unint64_t v27 = outputContextType;
      id v26 = v16;
      dispatch_after(v20, v21, block);
    }
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  unint64_t v8 = a1[8];
  if (v5 && !v6)
  {
    if (v8 <= 2)
    {
      id v9 = _MRLogForCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      uint64_t v12 = a1[8];
      uint64_t v13 = @"SharedSystemAudio";
      if (v12 == 2) {
        uint64_t v13 = @"SharedAudioPresentation";
      }
      if (v12 == 1) {
        id v14 = @"SharedSystemScreen";
      }
      else {
        id v14 = v13;
      }
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:a1[6]];
      int v39 = 138544386;
      uint64_t v40 = v10;
      __int16 v41 = 2114;
      uint64_t v42 = v11;
      __int16 v43 = 2112;
      __int16 v44 = v5;
      __int16 v45 = 2114;
      __int16 v46 = v14;
      __int16 v47 = 2048;
      uint64_t v48 = v16;
      int v17 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      uint64_t v18 = v9;
      uint32_t v19 = 52;
      goto LABEL_35;
    }
    id v9 = _MRLogForCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    uint64_t v26 = a1[4];
    uint64_t v27 = a1[5];
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceDate:a1[6]];
    int v39 = 138544130;
    uint64_t v40 = v26;
    __int16 v41 = 2114;
    uint64_t v42 = v27;
    __int16 v43 = 2112;
    __int16 v44 = v5;
    __int16 v45 = 2048;
    __int16 v46 = v28;
    int v17 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_30:
    uint64_t v18 = v9;
    uint32_t v19 = 42;
LABEL_35:
    _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v39, v19);
LABEL_36:

    goto LABEL_37;
  }
  if (!v6)
  {
    if (v8 > 2)
    {
      id v9 = _MRLogForCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      uint64_t v35 = a1[4];
      uint64_t v36 = a1[5];
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:a1[6]];
      int v39 = 138543874;
      uint64_t v40 = v35;
      __int16 v41 = 2114;
      uint64_t v42 = v36;
      __int16 v43 = 2048;
      __int16 v44 = v37;
      int v17 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v18 = v9;
      uint32_t v19 = 32;
      goto LABEL_35;
    }
    id v9 = _MRLogForCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    uint64_t v29 = a1[4];
    uint64_t v30 = a1[5];
    uint64_t v31 = a1[8];
    uint64_t v32 = @"SharedSystemAudio";
    if (v31 == 2) {
      uint64_t v32 = @"SharedAudioPresentation";
    }
    if (v31 == 1) {
      id v33 = @"SharedSystemScreen";
    }
    else {
      id v33 = v32;
    }
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceDate:a1[6]];
    int v39 = 138544130;
    uint64_t v40 = v29;
    __int16 v41 = 2114;
    uint64_t v42 = v30;
    __int16 v43 = 2114;
    __int16 v44 = v33;
    __int16 v45 = 2048;
    __int16 v46 = v34;
    int v17 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_30;
  }
  if (v8 <= 2)
  {
    id v9 = _MRLogForCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    uint64_t v20 = a1[4];
    uint64_t v21 = a1[5];
    uint64_t v22 = a1[8];
    id v23 = @"SharedSystemAudio";
    if (v22 == 2) {
      id v23 = @"SharedAudioPresentation";
    }
    if (v22 == 1) {
      uint64_t v24 = @"SharedSystemScreen";
    }
    else {
      uint64_t v24 = v23;
    }
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceDate:a1[6]];
    int v39 = 138544386;
    uint64_t v40 = v20;
    __int16 v41 = 2114;
    uint64_t v42 = v21;
    __int16 v43 = 2114;
    __int16 v44 = v7;
    __int16 v45 = 2114;
    __int16 v46 = v24;
    __int16 v47 = 2048;
    uint64_t v48 = v25;
    _os_log_error_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
    goto LABEL_36;
  }
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_cold_1(a1, (uint64_t)v7, v9);
  }
LABEL_37:

  uint64_t v38 = a1[7];
  if (v38) {
    (*(void (**)(uint64_t, __CFString *, __CFString *))(v38 + 16))(v38, v5, v7);
  }
}

BOOL __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained associatedOutputContext];
    BOOL v5 = v4 != 0;
    if (v4)
    {
      [v3 setOutputContext:v4];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_2()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mediaremote.MRUOutputContextController", v2);
  v1 = (void *)initializeOutputContextWithCompletion__workerQueue;
  initializeOutputContextWithCompletion__workerQueue = (uint64_t)v0;
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_47(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    id v2 = _MPAVLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_47_cold_1(a1, v2);
    }

    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    v4 = initializeOutputContextWithCompletion__workerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_48;
    block[3] = &unk_1E5F0F8B0;
    id v5 = *(id *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v11 = v6;
    id v10 = v7;
    dispatch_after(v3, v4, block);
  }
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_48(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
    dispatch_time_t v3 = (void *)[v2 initWithDomain:*MEMORY[0x1E4F77398] code:32 userInfo:0];
    v4 = _MPAVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_48_cold_1(a1, v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)mediaServicesWereLostNotification:(id)a3
{
  v4 = _MPAVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "Media services were Lost. Clearing context controller", v5, 2u);
  }

  [(MRUOutputContextController *)self setOutputContext:0];
}

- (void)mediaServicesWereResetNotification:(id)a3
{
  v4 = _MPAVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "Media services were reset. Rebuilding context controller", v5, 2u);
  }

  [(MRUOutputContextController *)self setOutputContext:0];
  [(MRUOutputContextController *)self initializeOutputContextWithCompletion:0];
}

- (MRUOutputContextControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUOutputContextControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_outputContext, 0);
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  unint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:a1[6]];
  int v10 = 138544130;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_1AE7DF000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_47_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  dispatch_time_t v3 = @"SharedSystemAudio";
  if (v2 == 2) {
    dispatch_time_t v3 = @"SharedAudioPresentation";
  }
  if (v2 == 1) {
    v4 = @"SharedSystemScreen";
  }
  else {
    v4 = v3;
  }
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1AE7DF000, a2, OS_LOG_TYPE_ERROR, "%{public}@ still unavailable after retry. Retrying with longer backoff", (uint8_t *)&v5, 0xCu);
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_48_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  dispatch_time_t v3 = @"SharedSystemAudio";
  if (v2 == 2) {
    dispatch_time_t v3 = @"SharedAudioPresentation";
  }
  if (v2 == 1) {
    v4 = @"SharedSystemScreen";
  }
  else {
    v4 = v3;
  }
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1AE7DF000, a2, OS_LOG_TYPE_FAULT, "%{public}@ still unavailable after multiple retries. Giving up", (uint8_t *)&v5, 0xCu);
}

@end