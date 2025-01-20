@interface MRUDiscoverySessionController
- (AVOutputDeviceDiscoverySession)outputDeviceDiscoverySession;
- (BOOL)detailedDiscovery;
- (BOOL)isExternalOutputDeviceAvailable;
- (BOOL)needsUpdate;
- (BOOL)sortDeviceToTop:(id)a3;
- (MRUDiscoverySessionController)init;
- (MRUDiscoverySessionController)initWithDeviceFeatures:(unint64_t)a3;
- (MRUDiscoverySessionControllerDelegate)delegate;
- (NSArray)availableOutputDevices;
- (NSArray)cachedAvailableOutputDevices;
- (id)filterAndSortOutputDevices:(id)a3;
- (void)availableOutputDevicesChangedNotification:(id)a3;
- (void)dealloc;
- (void)setAvailableOutputDevices:(id)a3;
- (void)setCachedAvailableOutputDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailedDiscovery:(BOOL)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setOutputDeviceDiscoverySession:(id)a3;
- (void)startDetailedDiscovery;
- (void)stopDetailedDiscovery;
- (void)updateDiscoveryMode;
- (void)updateOutputDevicesForAvailableOutputDevices:(id)a3;
- (void)updateOutputDevicesIfNeeded;
- (void)updateOutputDevicesImmediately;
@end

@implementation MRUDiscoverySessionController

- (MRUDiscoverySessionController)init
{
  return [(MRUDiscoverySessionController *)self initWithDeviceFeatures:0xFFFFLL];
}

- (MRUDiscoverySessionController)initWithDeviceFeatures:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MRUDiscoverySessionController;
  v4 = [(MRUDiscoverySessionController *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_needsUpdate = 0;
    uint64_t v6 = [MEMORY[0x1E4F1C978] array];
    availableOutputDevices = v5->_availableOutputDevices;
    v5->_availableOutputDevices = (NSArray *)v6;

    objc_initWeak(&location, v5);
    v8 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MRUDiscoverySessionController_initWithDeviceFeatures___block_invoke;
    block[3] = &unk_1E5F0E4F8;
    v11[1] = (id)a3;
    objc_copyWeak(v11, &location);
    dispatch_async(v8, block);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __56__MRUDiscoverySessionController_initWithDeviceFeatures___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F153E0] auxiliarySession];
  uint64_t v3 = *MEMORY[0x1E4F14F98];
  id v15 = 0;
  char v4 = [v2 setCategory:v3 error:&v15];
  id v5 = v15;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = _MPAVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v5;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "Audio session category failed: %{public}@ (AirPlay devices may be missed)", buf, 0xCu);
    }
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F165E8]) initWithDeviceFeatures:*(void *)(a1 + 40)];
  [v7 setTargetAudioSession:v2];
  v8 = [v7 availableOutputDevices];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __56__MRUDiscoverySessionController_initWithDeviceFeatures___block_invoke_3;
  v11[3] = &unk_1E5F0E4D0;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v14);
}

void __56__MRUDiscoverySessionController_initWithDeviceFeatures___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setOutputDeviceDiscoverySession:*(void *)(a1 + 32)];
    [v3 updateDiscoveryMode];
    [v3 updateOutputDevicesForAvailableOutputDevices:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(AVOutputDeviceDiscoverySession *)self->_outputDeviceDiscoverySession setDiscoveryMode:0];
  v3.receiver = self;
  v3.super_class = (Class)MRUDiscoverySessionController;
  [(MRUDiscoverySessionController *)&v3 dealloc];
}

- (BOOL)isExternalOutputDeviceAvailable
{
  return [(AVOutputDeviceDiscoverySession *)self->_outputDeviceDiscoverySession devicePresenceDetected];
}

- (void)startDetailedDiscovery
{
  [(MRUDiscoverySessionController *)self setDetailedDiscovery:1];

  [(MRUDiscoverySessionController *)self updateDiscoveryMode];
}

- (void)stopDetailedDiscovery
{
  [(MRUDiscoverySessionController *)self setDetailedDiscovery:0];

  [(MRUDiscoverySessionController *)self updateDiscoveryMode];
}

- (void)availableOutputDevicesChangedNotification:(id)a3
{
  if (!self->_needsUpdate)
  {
    self->_needsUpdate = 1;
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MRUDiscoverySessionController_availableOutputDevicesChangedNotification___block_invoke;
    block[3] = &unk_1E5F0D7F8;
    void block[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__MRUDiscoverySessionController_availableOutputDevicesChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) needsUpdate];
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 updateOutputDevicesIfNeeded];
  }
  return result;
}

- (void)updateDiscoveryMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL detailedDiscovery = self->_detailedDiscovery;
  dispatch_time_t v4 = _MPAVLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (detailedDiscovery)
  {
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = [(AVOutputDeviceDiscoverySession *)self->_outputDeviceDiscoverySession discoveryMode];
      int v11 = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ starting detailed discovery, previous: %li", (uint8_t *)&v11, 0x16u);
    }

    [(AVOutputDeviceDiscoverySession *)self->_outputDeviceDiscoverySession setDiscoveryMode:2];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel_availableOutputDevicesChangedNotification_ name:*MEMORY[0x1E4F15F60] object:0];
  }
  else
  {
    if (v5)
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [(AVOutputDeviceDiscoverySession *)self->_outputDeviceDiscoverySession discoveryMode];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stoping detailed discovery, previous: %li", (uint8_t *)&v11, 0x16u);
    }

    [(AVOutputDeviceDiscoverySession *)self->_outputDeviceDiscoverySession setDiscoveryMode:0];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self name:*MEMORY[0x1E4F15F60] object:0];
  }
}

- (void)updateOutputDevicesIfNeeded
{
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    [(MRUDiscoverySessionController *)self updateOutputDevicesImmediately];
  }
}

- (void)updateOutputDevicesImmediately
{
  objc_super v3 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRUDiscoverySessionController_updateOutputDevicesImmediately__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __63__MRUDiscoverySessionController_updateOutputDevicesImmediately__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) outputDeviceDiscoverySession];
  id v7 = [v2 availableOutputDevices];

  objc_super v3 = [*(id *)(a1 + 32) cachedAvailableOutputDevices];
  uint64_t v4 = [v3 count];
  if (v4 != [v7 count])
  {

    goto LABEL_5;
  }
  BOOL v5 = [*(id *)(a1 + 32) cachedAvailableOutputDevices];
  char v6 = [v7 isEqual:v5];

  if ((v6 & 1) == 0)
  {
LABEL_5:
    [*(id *)(a1 + 32) setCachedAvailableOutputDevices:v7];
    [*(id *)(a1 + 32) updateOutputDevicesForAvailableOutputDevices:v7];
  }
}

- (void)updateOutputDevicesForAvailableOutputDevices:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(MRUDiscoverySessionController *)self filterAndSortOutputDevices:v4];
  char v6 = _MPAVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 count];
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received output devices: #%ld %{public}@", buf, 0x20u);
  }

  id v7 = _MPAVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 count];
    *(_DWORD *)buf = 138543874;
    __int16 v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ updating to output devices: #%ld %{public}@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__MRUDiscoverySessionController_updateOutputDevicesForAvailableOutputDevices___block_invoke;
  v10[3] = &unk_1E5F0D8E8;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __78__MRUDiscoverySessionController_updateOutputDevicesForAvailableOutputDevices___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAvailableOutputDevices:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 mirroringDiscoverySessionController:*(void *)(a1 + 32) didChangeAvailableOutputDevices:*(void *)(a1 + 40)];
}

- (id)filterAndSortOutputDevices:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MRUDiscoverySessionController_filterAndSortOutputDevices___block_invoke;
  v5[3] = &unk_1E5F0E520;
  v5[4] = self;
  objc_super v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

uint64_t __60__MRUDiscoverySessionController_filterAndSortOutputDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) sortDeviceToTop:v5]
    && ![*(id *)(a1 + 32) sortDeviceToTop:v6])
  {
    uint64_t v9 = -1;
  }
  else if ([*(id *)(a1 + 32) sortDeviceToTop:v6] {
         && ![*(id *)(a1 + 32) sortDeviceToTop:v5])
  }
  {
    uint64_t v9 = 1;
  }
  else
  {
    id v7 = [v5 name];
    uint64_t v8 = [v6 name];
    uint64_t v9 = [v7 compare:v8 options:577];

    if (!v9)
    {
      uint64_t v10 = [v5 deviceID];
      id v11 = [v6 deviceID];
      uint64_t v9 = [v10 compare:v11 options:577];
    }
  }

  return v9;
}

- (BOOL)sortDeviceToTop:(id)a3
{
  return (unint64_t)[a3 deviceType] > 1;
}

- (MRUDiscoverySessionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUDiscoverySessionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (void)setAvailableOutputDevices:(id)a3
{
}

- (AVOutputDeviceDiscoverySession)outputDeviceDiscoverySession
{
  return self->_outputDeviceDiscoverySession;
}

- (void)setOutputDeviceDiscoverySession:(id)a3
{
}

- (NSArray)cachedAvailableOutputDevices
{
  return self->_cachedAvailableOutputDevices;
}

- (void)setCachedAvailableOutputDevices:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (BOOL)detailedDiscovery
{
  return self->_detailedDiscovery;
}

- (void)setDetailedDiscovery:(BOOL)a3
{
  self->_BOOL detailedDiscovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableOutputDevices, 0);
  objc_storeStrong((id *)&self->_outputDeviceDiscoverySession, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end