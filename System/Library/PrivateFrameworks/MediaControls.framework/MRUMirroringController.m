@interface MRUMirroringController
+ (id)mirroringControllerWithAudioRoutingSupport;
+ (id)symbolNameForOutputDevice:(id)a3;
- (AVOutputDevice)selectedAudioOutputDevice;
- (AVOutputDevice)selectedOutputDevice;
- (BOOL)tetheredDisplayPortModeEnabled;
- (MRUDiscoverySessionController)audioDiscoverySessionController;
- (MRUDiscoverySessionController)outputDeviceDiscoverySessionController;
- (MRUMirroringController)init;
- (MRUMirroringControllerDelegate)delegate;
- (MRUOutputContextController)audioContextController;
- (MRUOutputContextController)outputContextController;
- (NSArray)availableAudioOutputDevices;
- (NSArray)availableOutputDevices;
- (NSMutableSet)busyIdentifiers;
- (id)outputDeviceForID:(id)a3;
- (void)addBusyIdentifier:(id)a3;
- (void)mirrorToOutputDevice:(id)a3 completion:(id)a4;
- (void)mirroringDiscoverySessionController:(id)a3 didChangeAvailableOutputDevices:(id)a4;
- (void)outputContextController:(id)a3 didChangeOutputDevice:(id)a4;
- (void)pairingHandlerNotification:(id)a3;
- (void)removeBusyIdentifier:(id)a3;
- (void)selectAudioOutputDevice:(id)a3 completion:(id)a4;
- (void)setAudioContextController:(id)a3;
- (void)setAudioDiscoverySessionController:(id)a3;
- (void)setBusyIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOutputContextController:(id)a3;
- (void)setOutputDeviceDiscoverySessionController:(id)a3;
- (void)setTetheredDisplayPortModeEnabled:(BOOL)a3;
- (void)startDetailedDiscovery;
- (void)startMirroringToOutputDevice:(id)a3 completion:(id)a4;
- (void)stopDetailedDiscovery;
- (void)stopMirroringWithCompletion:(id)a3;
- (void)updateAvailableAudioOutputDevices;
- (void)updateAvailableOutputDevices;
- (void)updateSelectedAudioOutputDevice;
- (void)updateSelectedOutputDevice;
@end

@implementation MRUMirroringController

- (MRUMirroringController)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRUMirroringController;
  v2 = [(MRUMirroringController *)&v11 init];
  if (v2)
  {
    v2->_tetheredDisplayPortModeEnabled = CFPreferencesGetAppBooleanValue(@"EnableTetheredDisplayPortMode", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0) != 0;
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    busyIdentifiers = v2->_busyIdentifiers;
    v2->_busyIdentifiers = v3;

    v5 = [[MRUDiscoverySessionController alloc] initWithDeviceFeatures:2];
    outputDeviceDiscoverySessionController = v2->_outputDeviceDiscoverySessionController;
    v2->_outputDeviceDiscoverySessionController = v5;

    [(MRUDiscoverySessionController *)v2->_outputDeviceDiscoverySessionController setDelegate:v2];
    v7 = [[MRUOutputContextController alloc] initWithOutputContextType:1];
    outputContextController = v2->_outputContextController;
    v2->_outputContextController = v7;

    [(MRUOutputContextController *)v2->_outputContextController setDelegate:v2];
    MRMediaRemoteSetWantsRouteChangeNotifications();
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_pairingHandlerNotification_ name:*MEMORY[0x1E4F77800] object:0];

    [(MRUMirroringController *)v2 updateSelectedOutputDevice];
  }
  return v2;
}

+ (id)mirroringControllerWithAudioRoutingSupport
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [[MRUDiscoverySessionController alloc] initWithDeviceFeatures:1];
  [v2 setAudioDiscoverySessionController:v3];

  v4 = [v2 audioDiscoverySessionController];
  [v4 setDelegate:v2];

  v5 = [[MRUOutputContextController alloc] initWithOutputContextType:0];
  [v2 setAudioContextController:v5];

  v6 = [v2 audioContextController];
  [v6 setDelegate:v2];

  return v2;
}

+ (id)symbolNameForOutputDevice:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = (const void *)MRAVOutputDeviceCreateFromAVOutputDevice();
    id v4 = objc_alloc(MEMORY[0x1E4F31830]);
    v9[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v6 = (void *)[v4 initWithOutputDevices:v5];

    CFRelease(v3);
    v7 = [MEMORY[0x1E4F31850] _symbolNameForRoute:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)startMirroringToOutputDevice:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 deviceID];
  if (v8 && ([(NSMutableSet *)self->_busyIdentifiers containsObject:v8] & 1) == 0)
  {
    [(MRUMirroringController *)self addBusyIdentifier:v8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      objc_super v11 = _MPAVLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_opt_class();
        v13 = [v6 deviceID];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v12;
        __int16 v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ start mirroring to device %{public}@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      id v14 = MEMORY[0x1E4F14428];
      objc_copyWeak(&v17, (id *)buf);
      id v15 = v6;
      id v16 = v7;
      MRMediaRemoteRegisterPairingHandler();

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(MRUMirroringController *)self mirrorToOutputDevice:v6 completion:v7];
    }
  }
}

void __66__MRUMirroringController_startMirroringToOutputDevice_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MRUMirroringController_startMirroringToOutputDevice_completion___block_invoke_2;
  v4[3] = &unk_1E5F0DD38;
  id v5 = v3;
  id v6 = *(id *)(a1 + 40);
  [WeakRetained mirrorToOutputDevice:v5 completion:v4];
}

uint64_t __66__MRUMirroringController_startMirroringToOutputDevice_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceID];
  MRMediaRemoteUnregisterPairingHandler();

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)mirrorToOutputDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  outputContextController = self->_outputContextController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__MRUMirroringController_mirrorToOutputDevice_completion___block_invoke;
  v11[3] = &unk_1E5F0DD88;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(MRUOutputContextController *)outputContextController setOutputDevice:v9 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__MRUMirroringController_mirrorToOutputDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [*(id *)(a1 + 32) deviceID];
  [WeakRetained removeBusyIdentifier:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

- (void)stopMirroringWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _MPAVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(MRUMirroringController *)self selectedOutputDevice];
    v8 = [v7 deviceID];
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ stop mirroring to device %{public}@", buf, 0x16u);
  }
  outputContextController = self->_outputContextController;
  id v10 = [MEMORY[0x1E4F165D8] sharedLocalDevice];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MRUMirroringController_stopMirroringWithCompletion___block_invoke;
  v12[3] = &unk_1E5F0DDB0;
  id v13 = v4;
  id v11 = v4;
  [(MRUOutputContextController *)outputContextController setOutputDevice:v10 completion:v12];
}

uint64_t __54__MRUMirroringController_stopMirroringWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)selectAudioOutputDevice:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _MPAVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [(MRUMirroringController *)self selectedOutputDevice];
    id v11 = [v10 deviceID];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ change audio destination to %{public}@", buf, 0x16u);
  }
  id v12 = [v6 deviceID];
  if (v12 && ([(NSMutableSet *)self->_busyIdentifiers containsObject:v12] & 1) == 0)
  {
    [(MRUMirroringController *)self addBusyIdentifier:v12];
    objc_initWeak((id *)buf, self);
    audioContextController = self->_audioContextController;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__MRUMirroringController_selectAudioOutputDevice_completion___block_invoke;
    v14[3] = &unk_1E5F0DD88;
    objc_copyWeak(&v17, (id *)buf);
    id v15 = v6;
    id v16 = v7;
    [(MRUOutputContextController *)audioContextController setOutputDevice:v15 completion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __61__MRUMirroringController_selectAudioOutputDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [*(id *)(a1 + 32) deviceID];
  [WeakRetained removeBusyIdentifier:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

- (void)startDetailedDiscovery
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _MPAVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = objc_opt_class();
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ start detailed discovery", (uint8_t *)&v4, 0xCu);
  }

  [(MRUDiscoverySessionController *)self->_outputDeviceDiscoverySessionController startDetailedDiscovery];
  [(MRUDiscoverySessionController *)self->_audioDiscoverySessionController startDetailedDiscovery];
}

- (void)stopDetailedDiscovery
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _MPAVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = objc_opt_class();
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stop detailed discovery", (uint8_t *)&v4, 0xCu);
  }

  [(MRUDiscoverySessionController *)self->_outputDeviceDiscoverySessionController stopDetailedDiscovery];
  [(MRUDiscoverySessionController *)self->_audioDiscoverySessionController stopDetailedDiscovery];
}

- (void)pairingHandlerNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F77808]];

  id v7 = [v4 userInfo];

  v8 = [v7 objectForKeyedSubscript:@"inputType"];
  uint64_t v9 = [v8 integerValue];

  id v10 = _MPAVLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    busyIdentifiers = self->_busyIdentifiers;
    *(_DWORD *)buf = 138544130;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    __int16 v20 = v6;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    v24 = busyIdentifiers;
    _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received pairing request for %{public}@ | inputType: %li | requests: %{public}@", buf, 0x2Au);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MRUMirroringController_pairingHandlerNotification___block_invoke;
  block[3] = &unk_1E5F0DDD8;
  block[4] = self;
  id v15 = v6;
  BOOL v16 = v9 != 1;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53__MRUMirroringController_pairingHandlerNotification___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) outputDeviceForID:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  if (v5)
  {
    v3 = [*(id *)(a1 + 32) busyIdentifiers];
    if ([(MRUMirroringAuthorizationRequest *)v3 containsObject:*(void *)(a1 + 40)])
    {
      char v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) == 0) {
        goto LABEL_6;
      }
      v3 = [(MRUPairingAuthorizationRequest *)[MRUMirroringAuthorizationRequest alloc] initWithOutputDevice:v5 inputType:*(void *)(a1 + 48)];
      [v2 mirroringController:*(void *)(a1 + 32) didReceiveAuthorizationRequest:v3];
    }
  }
LABEL_6:
}

- (void)outputContextController:(id)a3 didChangeOutputDevice:(id)a4
{
  uint64_t v6 = (MRUOutputContextController *)a3;
  id v7 = [a4 deviceID];
  [(MRUMirroringController *)self removeBusyIdentifier:v7];

  outputContextController = self->_outputContextController;
  if (outputContextController == v6)
  {
    [(MRUMirroringController *)self updateSelectedOutputDevice];
  }
  else
  {
    [(MRUMirroringController *)self updateSelectedAudioOutputDevice];
    [(MRUMirroringController *)self updateAvailableAudioOutputDevices];
  }
}

- (void)mirroringDiscoverySessionController:(id)a3 didChangeAvailableOutputDevices:(id)a4
{
  if (self->_outputDeviceDiscoverySessionController == a3) {
    [(MRUMirroringController *)self updateAvailableOutputDevices];
  }
  else {
    [(MRUMirroringController *)self updateAvailableAudioOutputDevices];
  }
}

- (void)updateSelectedOutputDevice
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(MRUOutputContextController *)self->_outputContextController outputDevice];
  if (self->_tetheredDisplayPortModeEnabled)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F165D8] sharedLocalDevice];
    if ([v3 isEqual:v5]) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v3;
    }
    id v4 = v6;

    v3 = (void *)v5;
  }

  if (([v4 isEqual:self->_selectedOutputDevice] & 1) == 0)
  {
    id v7 = _MPAVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [v4 deviceID];
      id v10 = [(AVOutputDevice *)self->_selectedOutputDevice deviceID];
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ update selected output device: %{public}@ | previous: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    objc_storeStrong((id *)&self->_selectedOutputDevice, v4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mirroringController:self didChangeOutputDevice:v4];
  }
}

- (void)updateSelectedAudioOutputDevice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(MRUOutputContextController *)self->_audioContextController outputDevice];
  if (([v3 isEqual:self->_selectedAudioOutputDevice] & 1) == 0)
  {
    id v4 = _MPAVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = [v3 deviceID];
      id v7 = [(AVOutputDevice *)self->_selectedAudioOutputDevice deviceID];
      int v9 = 138543874;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      int v12 = v6;
      __int16 v13 = 2114;
      __int16 v14 = v7;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ update selected audio output device: %{public}@ | previous: %{public}@", (uint8_t *)&v9, 0x20u);
    }
    objc_storeStrong((id *)&self->_selectedAudioOutputDevice, v3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained mirroringController:self didChangeAudioOutputDevice:v3];
    }
  }
}

- (void)updateAvailableOutputDevices
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F165D8] sharedLocalDevice];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(MRUDiscoverySessionController *)self->_outputDeviceDiscoverySessionController availableOutputDevices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v10 isEqual:v3] & 1) == 0)
        {
          __int16 v11 = [v10 deviceID];

          if (v11) {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  int v12 = (NSArray *)[v4 copy];
  availableOutputDevices = self->_availableOutputDevices;
  self->_availableOutputDevices = v12;

  __int16 v14 = _MPAVLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v15;
    __int16 v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ update output devices: %{public}@", buf, 0x16u);
  }

  __int16 v16 = [(MRUMirroringController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v16 mirroringController:self didChangeAvailableOutputDevices:self->_availableOutputDevices];
  }
}

- (void)updateAvailableAudioOutputDevices
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(MRUDiscoverySessionController *)self->_audioDiscoverySessionController availableOutputDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        uint64_t v10 = [v9 deviceID];
        if (v10)
        {
          __int16 v11 = (void *)v10;
          int v12 = [(MRUMirroringController *)self selectedOutputDevice];
          if (([v9 isEqual:v12] & 1) != 0
            || [v9 deviceType] == 1
            || [v9 deviceType] == 3)
          {

LABEL_11:
            [v3 addObject:v9];
            goto LABEL_12;
          }
          uint64_t v13 = [v9 deviceType];

          if (v13 == 4) {
            goto LABEL_11;
          }
        }
LABEL_12:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }

  uint64_t v15 = (NSArray *)[v3 copy];
  availableAudioOutputDevices = self->_availableAudioOutputDevices;
  self->_availableAudioOutputDevices = v15;

  long long v17 = _MPAVLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    v27 = v3;
    _os_log_impl(&dword_1AE7DF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ update audio output devices: %{public}@", buf, 0x16u);
  }

  long long v19 = [(MRUMirroringController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v19 mirroringController:self didChangeAvailableOutputDevices:self->_availableAudioOutputDevices];
  }
}

- (void)addBusyIdentifier:(id)a3
{
  if (a3)
  {
    -[NSMutableSet addObject:](self->_busyIdentifiers, "addObject:");
    id v5 = [(MRUMirroringController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained mirroringController:self didUpdateBusyIdenifiers:self->_busyIdentifiers];
    }
  }
}

- (void)removeBusyIdentifier:(id)a3
{
  id v6 = a3;
  if ([(NSMutableSet *)self->_busyIdentifiers count] == 1)
  {
    [(NSMutableSet *)self->_busyIdentifiers removeAllObjects];
  }
  else if (v6)
  {
    [(NSMutableSet *)self->_busyIdentifiers removeObject:v6];
  }
  id v4 = [(MRUMirroringController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mirroringController:self didUpdateBusyIdenifiers:self->_busyIdentifiers];
  }
}

- (id)outputDeviceForID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUMirroringController *)self availableOutputDevices];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __44__MRUMirroringController_outputDeviceForID___block_invoke;
  v9[3] = &unk_1E5F0DE00;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "msv_firstWhere:", v9);

  return v7;
}

uint64_t __44__MRUMirroringController_outputDeviceForID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 deviceID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (MRUMirroringControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUMirroringControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVOutputDevice)selectedOutputDevice
{
  return self->_selectedOutputDevice;
}

- (NSArray)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (AVOutputDevice)selectedAudioOutputDevice
{
  return self->_selectedAudioOutputDevice;
}

- (NSArray)availableAudioOutputDevices
{
  return self->_availableAudioOutputDevices;
}

- (NSMutableSet)busyIdentifiers
{
  return self->_busyIdentifiers;
}

- (void)setBusyIdentifiers:(id)a3
{
}

- (MRUOutputContextController)outputContextController
{
  return self->_outputContextController;
}

- (void)setOutputContextController:(id)a3
{
}

- (MRUDiscoverySessionController)outputDeviceDiscoverySessionController
{
  return self->_outputDeviceDiscoverySessionController;
}

- (void)setOutputDeviceDiscoverySessionController:(id)a3
{
}

- (MRUOutputContextController)audioContextController
{
  return self->_audioContextController;
}

- (void)setAudioContextController:(id)a3
{
}

- (MRUDiscoverySessionController)audioDiscoverySessionController
{
  return self->_audioDiscoverySessionController;
}

- (void)setAudioDiscoverySessionController:(id)a3
{
}

- (BOOL)tetheredDisplayPortModeEnabled
{
  return self->_tetheredDisplayPortModeEnabled;
}

- (void)setTetheredDisplayPortModeEnabled:(BOOL)a3
{
  self->_tetheredDisplayPortModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDiscoverySessionController, 0);
  objc_storeStrong((id *)&self->_audioContextController, 0);
  objc_storeStrong((id *)&self->_outputDeviceDiscoverySessionController, 0);
  objc_storeStrong((id *)&self->_outputContextController, 0);
  objc_storeStrong((id *)&self->_busyIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableAudioOutputDevices, 0);
  objc_storeStrong((id *)&self->_selectedAudioOutputDevice, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_selectedOutputDevice, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end