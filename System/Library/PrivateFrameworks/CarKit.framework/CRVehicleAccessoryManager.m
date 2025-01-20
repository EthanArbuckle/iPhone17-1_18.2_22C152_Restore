@interface CRVehicleAccessoryManager
+ (BOOL)_isValidAccessoryMacAddress:(id)a3;
+ (BOOL)_isVehicleAccessory:(id)a3;
+ (id)_certificateSerialNumberForAccessory:(id)a3;
+ (id)managerInfoDataCache;
+ (id)sharedInstance;
+ (id)vehicleAccessQueue;
- (CARObserverHashTable)observers;
- (CRVehicleAccessoryManager)init;
- (CRVehicleAccessoryManagerDelegate)vehicleAccessoryDelegate;
- (EAAccessoryManager)accessoryManager;
- (NSMutableDictionary)vehiclesBySerialNumber;
- (id)_vehicleForAccessory:(id)a3;
- (id)_vehicleInfoDataForAccessory:(id)a3;
- (id)connectedAccessories;
- (id)connectedVehicleAccessories;
- (id)vehicleAccessoryForCertificateSerial:(id)a3;
- (id)vehicleAccessoryForiAPConnectionIdentifier:(unint64_t)a3;
- (void)_primeConnectedVehicleAccessories;
- (void)_updateVehicle:(id)a3 usingAccessory:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleAccessoryConnect:(id)a3;
- (void)handleAccessoryDisconnect:(id)a3;
- (void)handleAccessoryInformationUpdate:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAccessoryManager:(id)a3;
- (void)setObservers:(id)a3;
- (void)setVehicleAccessoryDelegate:(id)a3;
- (void)setVehiclesBySerialNumber:(id)a3;
@end

@implementation CRVehicleAccessoryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_sInstance;
  return v2;
}

uint64_t __43__CRVehicleAccessoryManager_sharedInstance__block_invoke()
{
  sharedInstance_sInstance = objc_alloc_init(CRVehicleAccessoryManager);
  return MEMORY[0x1F41817F8]();
}

+ (id)vehicleAccessQueue
{
  if (vehicleAccessQueue_onceToken != -1) {
    dispatch_once(&vehicleAccessQueue_onceToken, &__block_literal_global_316);
  }
  v2 = (void *)vehicleAccessQueue___vehicleQueue;
  return v2;
}

void __47__CRVehicleAccessoryManager_vehicleAccessQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.carkit.vehicleAccessoryManager", v2);
  v1 = (void *)vehicleAccessQueue___vehicleQueue;
  vehicleAccessQueue___vehicleQueue = (uint64_t)v0;
}

+ (id)managerInfoDataCache
{
  if (managerInfoDataCache_onceToken != -1) {
    dispatch_once(&managerInfoDataCache_onceToken, &__block_literal_global_319_0);
  }
  v2 = (void *)managerInfoDataCache___dictionary;
  return v2;
}

uint64_t __49__CRVehicleAccessoryManager_managerInfoDataCache__block_invoke()
{
  managerInfoDataCache___dictionary = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)_isValidAccessoryMacAddress:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    int v4 = [v3 isEqualToString:@"00:00:00:00:00:00"] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)_isVehicleAccessory:(id)a3
{
  return [a3 supportsCarPlay];
}

+ (id)_certificateSerialNumberForAccessory:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3)
  {
    v5 = [v3 certData];
    v6 = v5;
    if (v5)
    {
      v5 = (void *)[v5 length];
      if (v5)
      {
        uint64_t v13 = 0;
        v14 = &v13;
        uint64_t v15 = 0x2020000000;
        v7 = (uint64_t (*)(void *))getMFAACreateCertificateSerialNumberSymbolLoc_ptr;
        v16 = getMFAACreateCertificateSerialNumberSymbolLoc_ptr;
        if (!getMFAACreateCertificateSerialNumberSymbolLoc_ptr)
        {
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __getMFAACreateCertificateSerialNumberSymbolLoc_block_invoke;
          v12[3] = &unk_1E5E3B130;
          v12[4] = &v13;
          __getMFAACreateCertificateSerialNumberSymbolLoc_block_invoke((uint64_t)v12);
          v7 = (uint64_t (*)(void *))v14[3];
        }
        _Block_object_dispose(&v13, 8);
        if (!v7)
        {
          v11 = (_Unwind_Exception *)-[CRCarPlayAppPolicyEvaluator effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:]();
          _Block_object_dispose(&v13, 8);
          _Unwind_Resume(v11);
        }
        v5 = (void *)v7(v6);
        if (!v5)
        {
          v8 = CarGeneralLogging();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            +[CRVehicleAccessoryManager _certificateSerialNumberForAccessory:](v8);
          }

          v5 = 0;
        }
      }
    }
    id v9 = v5;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (CRVehicleAccessoryManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)CRVehicleAccessoryManager;
  v2 = [(CRVehicleAccessoryManager *)&v12 init];
  if (v2)
  {
    id v3 = [[CARObserverHashTable alloc] initWithProtocol:&unk_1F0327540];
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(CRVehicleAccessoryManager *)v2 setVehiclesBySerialNumber:v5];

    v6 = [MEMORY[0x1E4F258F8] sharedAccessoryManager];
    [(CRVehicleAccessoryManager *)v2 setAccessoryManager:v6];

    v7 = [(CRVehicleAccessoryManager *)v2 accessoryManager];
    [v7 registerForLocalNotifications];

    objc_initWeak(&location, v2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__CRVehicleAccessoryManager_init__block_invoke;
    v9[3] = &unk_1E5E3AC10;
    objc_copyWeak(&v10, &location);
    dispatch_async(MEMORY[0x1E4F14428], v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__CRVehicleAccessoryManager_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v1);
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v6 selector:sel_handleAccessoryConnect_ name:*MEMORY[0x1E4F258C0] object:0];

    int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v6 selector:sel_handleAccessoryDisconnect_ name:*MEMORY[0x1E4F258C8] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v6 selector:sel_handleAccessoryInformationUpdate_ name:*MEMORY[0x1E4F258D8] object:0];

    [v6 _primeConnectedVehicleAccessories];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  int v4 = [(CRVehicleAccessoryManager *)self accessoryManager];
  [v4 unregisterForLocalNotifications];

  v5.receiver = self;
  v5.super_class = (Class)CRVehicleAccessoryManager;
  [(CRVehicleAccessoryManager *)&v5 dealloc];
}

- (void)setVehicleAccessoryDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj) {
      [(CRVehicleAccessoryManager *)self addObserver:obj];
    }
    id v6 = objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);
      [(CRVehicleAccessoryManager *)self removeObserver:v7];
    }
    objc_storeWeak((id *)&self->_vehicleAccessoryDelegate, obj);
    objc_super v5 = obj;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRVehicleAccessoryManager *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRVehicleAccessoryManager *)self observers];
  [v5 removeObserver:v4];
}

- (void)_primeConnectedVehicleAccessories
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(CRVehicleAccessoryManager *)self connectedAccessories];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(CRVehicleAccessoryManager *)self _vehicleForAccessory:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_vehicleForAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() _isVehicleAccessory:v4])
  {
    uint64_t v5 = [(id)objc_opt_class() _certificateSerialNumberForAccessory:v4];
    if (v5)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__2;
      v17 = __Block_byref_object_dispose__2;
      id v18 = 0;
      uint64_t v6 = [(id)objc_opt_class() vehicleAccessQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke;
      v10[3] = &unk_1E5E3B980;
      p_long long buf = &buf;
      v10[4] = self;
      uint64_t v5 = v5;
      long long v11 = v5;
      id v12 = v4;
      dispatch_sync(v6, v10);

      id v7 = *(id *)(*((void *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);

      goto LABEL_10;
    }
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CRVehicleAccessoryManager _vehicleForAccessory:]((uint64_t)v4, v8);
    }
  }
  else
  {
    uint64_t v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Accessory %@ does not support CarPlay", (uint8_t *)&buf, 0xCu);
    }
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

void __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) vehiclesBySerialNumber];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    id v7 = [v6 connectionID];
    uint64_t v8 = [v7 unsignedIntegerValue];
    uint64_t v9 = [*(id *)(a1 + 48) connectionID];

    if (v8 != v9)
    {
      long long v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      [v10 _updateVehicle:v12 usingAccessory:v11];
    }
  }
  else
  {
    uint64_t v13 = objc_alloc_init(CRVehicleAccessory);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCertificateSerialNumber:*(void *)(a1 + 40)];
    v16 = (uint64_t *)(a1 + 48);
    [*(id *)(a1 + 32) _updateVehicle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) usingAccessory:*(void *)(a1 + 48)];
    v17 = [*(id *)(a1 + 32) vehiclesBySerialNumber];
    [v17 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 40)];

    id v18 = CarGeneralLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke_cold_1(v16, v18);
    }
  }
}

- (void)_updateVehicle:(id)a3 usingAccessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 setAccessory:v7];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "connectionID"));
  [v6 setConnectionID:v8];

  uint64_t v9 = [(CRVehicleAccessoryManager *)self _vehicleInfoDataForAccessory:v6];
  [v6 setVehicleInfoDataCache:v9];

  [v6 _updateName];
  long long v10 = [v7 protocolStrings];
  if (v10) {
    [v6 setAccessoryProtocols:v10];
  }
  uint64_t v11 = [v7 macAddress];
  if ([(id)objc_opt_class() _isValidAccessoryMacAddress:v11])
  {
    uint64_t v12 = [v7 macAddress];
    [v6 setBluetoothAddress:v12];
  }
  else
  {
    [v6 setBluetoothAddress:0];
  }
  objc_msgSend(v6, "setTransportType:", +[CRVehicleAccessory _transportTypeForExternalAccessoryTransportType:](CRVehicleAccessory, "_transportTypeForExternalAccessoryTransportType:", objc_msgSend(v7, "transportType")));
  if (CRIsInternalInstall())
  {
    uint64_t v13 = [v7 modelNumber];
    if (v13) {
      [v6 setVehicleModelName:v13];
    }
  }
  objc_msgSend(v6, "setSupportsUSBCarPlay:", objc_msgSend(v7, "supportsUSBCarPlay"));
  objc_msgSend(v6, "setSupportsWirelessCarPlay:", objc_msgSend(v7, "supportsWirelessCarPlay"));
  if ([v7 supportsOOBBTPairing]) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = [v7 supportsOOBBTPairing2];
  }
  [v6 setSupportsWiredBluetoothPairing:v14];
  objc_msgSend(v6, "setSupportsCarPlayConnectionRequest:", objc_msgSend(v7, "supportsCarPlayConnectionRequest"));
  [v6 setSupportsBluetoothLE:0];
  unsigned int v15 = [v7 accessoryCapabilities];
  v16 = CarGeneralLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = @"NO";
    if ((v15 & 0x200000) != 0) {
      v17 = @"YES";
    }
    int v19 = 138543362;
    v20 = v17;
    _os_log_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_DEFAULT, "vehicle supports theme assets: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  [v6 setSupportsThemeAssets:(v15 >> 21) & 1];
  objc_msgSend(v6, "setSupportsEnhancedIntegration:", objc_msgSend(v7, "supportsCarPlayAppLinks"));
  id v18 = [v7 ppid];
  [v6 setPPID:v18];
}

- (id)_vehicleInfoDataForAccessory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 certificateSerialNumber];
  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() managerInfoDataCache];
    id v6 = [v5 objectForKey:v4];

    id v7 = CarGeneralLogging();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "Fetched Vehicle Info data from cache for %@", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v9 = v6;
    }
    else
    {
      if (v8)
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "Fetching Vehicle Info data from accessory for %@", (uint8_t *)&v16, 0xCu);
      }

      uint64_t v12 = [v3 accessory];
      uint64_t v13 = [v12 getVehicleInfoData];

      if (v13)
      {
        uint64_t v14 = [(id)objc_opt_class() managerInfoDataCache];
        [v14 setObject:v13 forKey:v4];
      }
      uint64_t v9 = v13;
    }
    long long v10 = v9;
    uint64_t v11 = v9;
  }
  else
  {
    long long v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_DEFAULT, "No available serial for Vehicle Info data request for %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)handleAccessoryConnect:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F258D0]];

  uint64_t v6 = [(CRVehicleAccessoryManager *)self _vehicleForAccessory:v5];
  id v7 = (void *)v6;
  if (v6)
  {
    BOOL v8 = (id *)v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke;
    v12[3] = &unk_1E5E3A800;
    v12[4] = self;
    uint64_t v9 = (void *)v6;
LABEL_5:
    v8[5] = v9;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    goto LABEL_6;
  }
  long long v10 = [v5 macAddress];

  if (v10)
  {
    BOOL v8 = (id *)v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke_2;
    v11[3] = &unk_1E5E3A800;
    v11[4] = self;
    uint64_t v9 = v5;
    goto LABEL_5;
  }
LABEL_6:
}

void __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 accessoryManager:*(void *)(a1 + 32) didConnectVehicleAccessory:*(void *)(a1 + 40)];
}

void __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) observers];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) macAddress];
  [v4 accessoryManager:v2 didConnectUnsupportedAccessoryWithBluetoothAddress:v3];
}

- (void)handleAccessoryDisconnect:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F258D0]];

  uint64_t v6 = [v5 connectionID];
  id v7 = [(id)objc_opt_class() vehicleAccessQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke;
  v8[3] = &unk_1E5E3B9A8;
  v8[4] = self;
  v8[5] = v6;
  dispatch_async(v7, v8);
}

void __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) vehiclesBySerialNumber];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      BOOL v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
      uint64_t v9 = [v8 connectionID];
      if (v9)
      {
        long long v10 = (void *)v9;
        uint64_t v11 = [v8 connectionID];
        uint64_t v12 = [v11 unsignedIntegerValue];
        uint64_t v13 = *(void *)(a1 + 40);

        if (v12 == v13) {
          break;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    id v14 = v8;

    if (!v14) {
      return;
    }
    [v14 setConnectionID:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke_2;
    v15[3] = &unk_1E5E3A800;
    v15[4] = *(void *)(a1 + 32);
    id v16 = v14;
    id v3 = v14;
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }
LABEL_13:
}

void __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 accessoryManager:*(void *)(a1 + 32) didDisconnectVehicleAccessory:*(void *)(a1 + 40)];
}

- (void)handleAccessoryInformationUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() vehicleAccessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke;
  v7[3] = &unk_1E5E3A800;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F258D0]];

  id v4 = [*(id *)(a1 + 40) _vehicleForAccessory:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 certificateSerialNumber];

    if (v6)
    {
      uint64_t v7 = [(id)objc_opt_class() managerInfoDataCache];
      id v8 = [v5 certificateSerialNumber];
      [v7 removeObjectForKey:v8];
    }
    uint64_t v9 = [*(id *)(a1 + 40) _vehicleInfoDataForAccessory:v5];
    [v5 setVehicleInfoDataCache:v9];

    if ([v5 _updateName])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke_2;
      v10[3] = &unk_1E5E3A800;
      v10[4] = *(void *)(a1 + 40);
      id v11 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v10);
    }
  }
}

void __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 accessoryManager:*(void *)(a1 + 32) didUpdateVehicleAccessory:*(void *)(a1 + 40)];
}

- (id)connectedAccessories
{
  id v2 = [(CRVehicleAccessoryManager *)self accessoryManager];
  id v3 = [v2 connectedAccessories];

  return v3;
}

- (id)connectedVehicleAccessories
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(CRVehicleAccessoryManager *)self connectedAccessories];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = -[CRVehicleAccessoryManager _vehicleForAccessory:](self, "_vehicleForAccessory:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)vehicleAccessoryForCertificateSerial:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v5 = [(id)objc_opt_class() vehicleAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CRVehicleAccessoryManager_vehicleAccessoryForCertificateSerial___block_invoke;
  block[3] = &unk_1E5E3B9D0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__CRVehicleAccessoryManager_vehicleAccessoryForCertificateSerial___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) vehiclesBySerialNumber];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)vehicleAccessoryForiAPConnectionIdentifier:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(CRVehicleAccessoryManager *)self connectedAccessories];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      if (objc_msgSend(v10, "connectionID", (void)v15) == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v12 = [(CRVehicleAccessoryManager *)self _vehicleForAccessory:v11];
  }
  else
  {
LABEL_9:

    id v11 = 0;
LABEL_12:
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (CRVehicleAccessoryManagerDelegate)vehicleAccessoryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);
  return (CRVehicleAccessoryManagerDelegate *)WeakRetained;
}

- (EAAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(id)a3
{
}

- (NSMutableDictionary)vehiclesBySerialNumber
{
  return self->_vehiclesBySerialNumber;
}

- (void)setVehiclesBySerialNumber:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_vehiclesBySerialNumber, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_destroyWeak((id *)&self->_vehicleAccessoryDelegate);
}

+ (void)_certificateSerialNumberForAccessory:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "Unable to get certificate serial data.", v1, 2u);
}

- (void)_vehicleForAccessory:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "Accessory %@ does not have a certificate serial number", (uint8_t *)&v2, 0xCu);
}

void __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_DEBUG, "Accessory %@ added to vehiclesBySerialNumber", (uint8_t *)&v3, 0xCu);
}

@end