@interface WFListeningModeDeviceAccessResource
+ (BOOL)isSingleton;
- (BOOL)supportedDevicesAreFetched;
- (NSArray)supportedDevices;
- (WFBluetoothSettingsClient)bluetoothClient;
- (WFListeningModeDeviceAccessResource)initWithDefinition:(id)a3;
- (id)availabilityCompletion;
- (id)localizedAccessResourceErrorString;
- (id)unavailableAccessResourceError;
- (os_unfair_lock_s)supportedDevicesLock;
- (unint64_t)status;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
- (void)makeSettingsClientIfNecessary;
- (void)setAvailabilityCompletion:(id)a3;
@end

@implementation WFListeningModeDeviceAccessResource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_availabilityCompletion, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
}

- (void)setAvailabilityCompletion:(id)a3
{
}

- (id)availabilityCompletion
{
  return self->_availabilityCompletion;
}

- (os_unfair_lock_s)supportedDevicesLock
{
  return self->_supportedDevicesLock;
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (WFBluetoothSettingsClient)bluetoothClient
{
  return self->_bluetoothClient;
}

- (BOOL)supportedDevicesAreFetched
{
  v2 = self;
  os_unfair_lock_lock(&self->_supportedDevicesLock);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__WFListeningModeDeviceAccessResource_supportedDevicesAreFetched__block_invoke;
  aBlock[3] = &unk_264E5EE70;
  aBlock[4] = v2;
  v3 = (void (**)(void))_Block_copy(aBlock);
  v4 = [(WFListeningModeDeviceAccessResource *)v2 supportedDevices];
  LOBYTE(v2) = v4 != 0;

  v3[2](v3);
  return (char)v2;
}

void __65__WFListeningModeDeviceAccessResource_supportedDevicesAreFetched__block_invoke(uint64_t a1)
{
}

- (void)makeSettingsClientIfNecessary
{
  if (![(WFListeningModeDeviceAccessResource *)self supportedDevicesAreFetched])
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke;
    v3[3] = &unk_264E56ED8;
    v3[4] = self;
    +[WFBluetoothSettingsClient createClientWithCompletionHandler:v3];
  }
}

void __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v8 = [*(id *)(a1 + 32) bluetoothClient];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke_176;
    v10[3] = &unk_264E56EB0;
    objc_copyWeak(&v11, (id *)location);
    v10[4] = *(void *)(a1 + 32);
    [v8 observePairedDevicesMatchingType:2 update:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WFListeningModeDeviceAccessResource makeSettingsClientIfNecessary]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_ERROR, "%s Error creating WFBluetoothSettingsClient: %{public}@", location, 0x16u);
    }
  }
}

void __68__WFListeningModeDeviceAccessResource_makeSettingsClientIfNecessary__block_invoke_176(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v3;
  id v6 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  [WeakRetained refreshAvailabilityWithNotification];
  uint64_t v7 = [WeakRetained status];
  v8 = [WeakRetained availabilityCompletion];

  if (v8)
  {
    uint64_t v9 = [WeakRetained availabilityCompletion];
    v10 = (void (**)(void, void, void))v9;
    if (v7 == 4)
    {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 0);
    }
    else
    {
      id v11 = [WeakRetained unavailableAccessResourceError];
      ((void (**)(void, void, void *))v10)[2](v10, 0, v11);
    }
    [WeakRetained setAvailabilityCompletion:0];
  }
}

- (id)localizedAccessResourceErrorString
{
  v2 = NSString;
  id v3 = WFLocalizedString(@"Your %@ has not connected to any devices that support Noise Control modes.");
  uint64_t v4 = [MEMORY[0x263F85258] currentDevice];
  v5 = [v4 localizedModel];
  id v6 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v5);

  return v6;
}

- (id)unavailableAccessResourceError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F87088];
  uint64_t v8 = *MEMORY[0x263F08320];
  uint64_t v4 = [(WFListeningModeDeviceAccessResource *)self localizedAccessResourceErrorString];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v2 errorWithDomain:v3 code:0 userInfo:v5];

  return v6;
}

- (unint64_t)status
{
  if ([(WFListeningModeDeviceAccessResource *)self supportedDevicesAreFetched])
  {
    p_supportedDevicesLock = &self->_supportedDevicesLock;
    os_unfair_lock_lock(&self->_supportedDevicesLock);
    uint64_t v4 = [(WFListeningModeDeviceAccessResource *)self supportedDevices];
    unint64_t v5 = 4 * ([v4 count] != 0);

    os_unfair_lock_unlock(p_supportedDevicesLock);
  }
  else
  {
    [(WFListeningModeDeviceAccessResource *)self makeSettingsClientIfNecessary];
    return 1;
  }
  return v5;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  if ([(WFListeningModeDeviceAccessResource *)self status] == 1)
  {
    [(WFListeningModeDeviceAccessResource *)self setAvailabilityCompletion:v6];
    [(WFListeningModeDeviceAccessResource *)self makeSettingsClientIfNecessary];
  }
  else if ([(WFListeningModeDeviceAccessResource *)self status] == 4)
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    unint64_t v5 = [(WFListeningModeDeviceAccessResource *)self unavailableAccessResourceError];
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v5);
  }
}

- (WFListeningModeDeviceAccessResource)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFListeningModeDeviceAccessResource;
  uint64_t v3 = [(WFAccessResource *)&v7 initWithDefinition:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_supportedDevicesLock._os_unfair_lock_opaque = 0;
    unint64_t v5 = v3;
  }

  return v4;
}

+ (BOOL)isSingleton
{
  return 1;
}

@end