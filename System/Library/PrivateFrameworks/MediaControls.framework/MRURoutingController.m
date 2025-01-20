@interface MRURoutingController
+ (id)symbolNameForOutputDevice:(id)a3;
- (AVOutputDevice)selectedOutputDevice;
- (MRUDiscoverySessionController)discoverySessionController;
- (MRUOutputContextController)outputContextController;
- (MRURoutingController)init;
- (MRURoutingControllerDelegate)delegate;
- (NSArray)availableOutputDevices;
- (NSMutableSet)busyIdentifiers;
- (id)outputDeviceForID:(id)a3;
- (void)addBusyIdentifier:(id)a3;
- (void)outputContextController:(id)a3 didChangeOutputDevice:(id)a4;
- (void)pairingHandlerNotification:(id)a3;
- (void)removeBusyIdentifier:(id)a3;
- (void)selectOutputDevice:(id)a3 completion:(id)a4;
- (void)setBusyIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoverySessionController:(id)a3;
- (void)setOutputContextController:(id)a3;
- (void)setOutputDevice:(id)a3 completion:(id)a4;
- (void)startDetailedDiscovery;
- (void)stopDetailedDiscovery;
- (void)updateAvailableOutputDevices;
- (void)updateSelectedOutputDevice;
@end

@implementation MRURoutingController

- (MRURoutingController)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRURoutingController;
  v2 = [(MRURoutingController *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    busyIdentifiers = v2->_busyIdentifiers;
    v2->_busyIdentifiers = v3;

    v5 = [[MRUDiscoverySessionController alloc] initWithDeviceFeatures:1];
    discoverySessionController = v2->_discoverySessionController;
    v2->_discoverySessionController = v5;

    [(MRUDiscoverySessionController *)v2->_discoverySessionController setDelegate:v2];
    v7 = [[MRUOutputContextController alloc] initWithOutputContextType:0];
    outputContextController = v2->_outputContextController;
    v2->_outputContextController = v7;

    [(MRUOutputContextController *)v2->_outputContextController setDelegate:v2];
    MRMediaRemoteSetWantsRouteChangeNotifications();
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_pairingHandlerNotification_ name:*MEMORY[0x1E4F77800] object:0];

    [(MRURoutingController *)v2 updateSelectedOutputDevice];
  }
  return v2;
}

+ (id)symbolNameForOutputDevice:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = (const void *)MRAVOutputDeviceCreateFromAVOutputDevice();
    id v5 = objc_alloc(MEMORY[0x1E4F31830]);
    v22[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v7 = (void *)[v5 initWithOutputDevices:v6];

    CFRelease(v4);
    v8 = [MEMORY[0x1E4F31850] _symbolNameForRoute:v7];
    v9 = _MPAVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      objc_super v11 = [v3 deviceID];
      v12 = [v3 modelID];
      int v14 = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      __int16 v18 = 2114;
      v19 = v12;
      __int16 v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ imageForRoute: %{public}@ | model: %{public}@ | symbol: %{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)selectOutputDevice:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 deviceID];
  if (v8 && ([(NSMutableSet *)self->_busyIdentifiers containsObject:v8] & 1) == 0)
  {
    [(MRURoutingController *)self addBusyIdentifier:v8];
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
        _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ start routing to device %{public}@", buf, 0x16u);
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
      [(MRURoutingController *)self setOutputDevice:v6 completion:v7];
    }
  }
}

void __54__MRURoutingController_selectOutputDevice_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__MRURoutingController_selectOutputDevice_completion___block_invoke_2;
  v4[3] = &unk_1E5F0DD38;
  id v5 = v3;
  id v6 = *(id *)(a1 + 40);
  [WeakRetained setOutputDevice:v5 completion:v4];
}

uint64_t __54__MRURoutingController_selectOutputDevice_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) deviceID];
  MRMediaRemoteUnregisterPairingHandler();

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setOutputDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  outputContextController = self->_outputContextController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MRURoutingController_setOutputDevice_completion___block_invoke;
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

void __51__MRURoutingController_setOutputDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [*(id *)(a1 + 32) deviceID];
  [WeakRetained removeBusyIdentifier:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

- (void)startDetailedDiscovery
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _MPAVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = objc_opt_class();
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ start detailed discovery", (uint8_t *)&v4, 0xCu);
  }

  [(MRUDiscoverySessionController *)self->_discoverySessionController startDetailedDiscovery];
}

- (void)stopDetailedDiscovery
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = _MPAVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = objc_opt_class();
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stop detailed discovery", (uint8_t *)&v4, 0xCu);
  }

  [(MRUDiscoverySessionController *)self->_discoverySessionController stopDetailedDiscovery];
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
  block[2] = __51__MRURoutingController_pairingHandlerNotification___block_invoke;
  block[3] = &unk_1E5F0DDD8;
  block[4] = self;
  id v15 = v6;
  BOOL v16 = v9 != 1;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__MRURoutingController_pairingHandlerNotification___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) outputDeviceForID:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) delegate];
  if (v5)
  {
    id v3 = [*(id *)(a1 + 32) busyIdentifiers];
    if ([(MRUMirroringAuthorizationRequest *)v3 containsObject:*(void *)(a1 + 40)])
    {
      char v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) == 0) {
        goto LABEL_6;
      }
      id v3 = [(MRUPairingAuthorizationRequest *)[MRUMirroringAuthorizationRequest alloc] initWithOutputDevice:v5 inputType:*(void *)(a1 + 48)];
      [v2 routingController:*(void *)(a1 + 32) didReceiveAuthorizationRequest:v3];
    }
  }
LABEL_6:
}

- (void)outputContextController:(id)a3 didChangeOutputDevice:(id)a4
{
  id v5 = objc_msgSend(a4, "deviceID", a3);
  [(MRURoutingController *)self removeBusyIdentifier:v5];

  [(MRURoutingController *)self updateSelectedOutputDevice];
}

- (void)updateSelectedOutputDevice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUOutputContextController *)self->_outputContextController outputDevice];
  if (([v3 isEqual:self->_selectedOutputDevice] & 1) == 0)
  {
    char v4 = _MPAVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = [v3 deviceID];
      id v7 = [(AVOutputDevice *)self->_selectedOutputDevice deviceID];
      int v9 = 138543874;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v6;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ update selected output device: %{public}@ | previous: %{public}@", (uint8_t *)&v9, 0x20u);
    }
    objc_storeStrong((id *)&self->_selectedOutputDevice, v3);
    v8 = [(MRURoutingController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 routingController:self didChangeOutputDevice:v3];
    }
  }
}

- (void)updateAvailableOutputDevices
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v4 = [(MRUDiscoverySessionController *)self->_discoverySessionController availableOutputDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 deviceID];
        if (v10)
        {
          __int16 v11 = (void *)v10;
          uint64_t v12 = [v9 deviceType];

          if (v12) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }

  __int16 v13 = (NSArray *)[v3 copy];
  availableOutputDevices = self->_availableOutputDevices;
  self->_availableOutputDevices = v13;

  uint64_t v15 = _MPAVLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    uint64_t v25 = v3;
    _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ update audio output devices: %{public}@", buf, 0x16u);
  }

  id v17 = [(MRURoutingController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v17 routingController:self didChangeAvailableOutputDevices:v3];
  }
}

- (void)addBusyIdentifier:(id)a3
{
  if (a3)
  {
    -[NSMutableSet addObject:](self->_busyIdentifiers, "addObject:");
    id v5 = [(MRURoutingController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained routingController:self didUpdateBusyIdenifiers:self->_busyIdentifiers];
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
  char v4 = [(MRURoutingController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained routingController:self didUpdateBusyIdenifiers:self->_busyIdentifiers];
  }
}

- (id)outputDeviceForID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRURoutingController *)self availableOutputDevices];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MRURoutingController_outputDeviceForID___block_invoke;
  v9[3] = &unk_1E5F0DE00;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "msv_firstWhere:", v9);

  return v7;
}

uint64_t __42__MRURoutingController_outputDeviceForID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 deviceID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (MRURoutingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRURoutingControllerDelegate *)WeakRetained;
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

- (MRUDiscoverySessionController)discoverySessionController
{
  return self->_discoverySessionController;
}

- (void)setDiscoverySessionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverySessionController, 0);
  objc_storeStrong((id *)&self->_outputContextController, 0);
  objc_storeStrong((id *)&self->_busyIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_selectedOutputDevice, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end