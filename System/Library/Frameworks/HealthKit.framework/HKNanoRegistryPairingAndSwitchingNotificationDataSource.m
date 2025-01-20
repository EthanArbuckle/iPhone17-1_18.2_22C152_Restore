@interface HKNanoRegistryPairingAndSwitchingNotificationDataSource
- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)initWithPairedDeviceRegistry:(id)a3;
- (NRPairedDeviceRegistry)pairedDeviceRegistry;
- (id)_notificationCenter;
- (id)_pairingChangeNotifications;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (void)_pairingChangeNotifications;
- (void)registerObserverForDevicePairingChanges:(id)a3 block:(id)a4;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
- (void)unregisterObserverForDevicePairingChanges:(id)a3;
@end

@implementation HKNanoRegistryPairingAndSwitchingNotificationDataSource

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)initWithPairedDeviceRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKNanoRegistryPairingAndSwitchingNotificationDataSource;
  v6 = [(HKObserverBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pairedDeviceRegistry, a3);
  }

  return v7;
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
  {
    v3 = pairedDeviceRegistry;
  }
  else
  {
    uint64_t v8 = 0;
    objc_super v9 = &v8;
    uint64_t v10 = 0x2050000000;
    v4 = (void *)getNRPairedDeviceRegistryClass_softClass_0;
    uint64_t v11 = getNRPairedDeviceRegistryClass_softClass_0;
    if (!getNRPairedDeviceRegistryClass_softClass_0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getNRPairedDeviceRegistryClass_block_invoke_0;
      v7[3] = &unk_1E58BD760;
      v7[4] = &v8;
      __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)v7);
      v4 = (void *)v9[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v8, 8);
    v3 = [v5 sharedInstance];
  }

  return v3;
}

- (id)_notificationCenter
{
  return (id)[MEMORY[0x1E4F28EB8] defaultCenter];
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self _notificationCenter];
  objc_super v9 = [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self pairedDeviceRegistry];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__HKNanoRegistryPairingAndSwitchingNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
  v14[3] = &unk_1E58C0618;
  id v15 = v7;
  id v16 = v6;
  id v10 = v6;
  id v11 = v7;
  v12 = [v8 addObserverForName:v10 object:v9 queue:0 usingBlock:v14];

  return v12;
}

uint64_t __103__HKNanoRegistryPairingAndSwitchingNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyObserversOfChangeForKey:*(void *)(a1 + 40) newValue:a2];
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self _notificationCenter];
  uint64_t v8 = [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self pairedDeviceRegistry];
  [v9 removeObserver:v7 name:v6 object:v8];
}

- (id)_pairingChangeNotifications
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v2 = (id *)getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr;
  uint64_t v17 = getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr;
  if (!getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr)
  {
    v3 = (void *)NanoRegistryLibrary_0();
    v15[3] = (uint64_t)dlsym(v3, "NRPairedDeviceRegistryDeviceIsSetupNotification");
    getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr = v15[3];
    v2 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2) {
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications]();
  }
  id v4 = *v2;
  v18[0] = v4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v5 = (id *)getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr;
  uint64_t v17 = getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr;
  if (!getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr)
  {
    id v6 = (void *)NanoRegistryLibrary_0();
    v15[3] = (uint64_t)dlsym(v6, "NRPairedDeviceRegistryDeviceDidUnpairNotification");
    getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr = v15[3];
    id v5 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v5) {
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications]();
  }
  id v7 = *v5;
  v18[1] = v7;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v8 = (id *)getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr;
  uint64_t v17 = getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr;
  if (!getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr)
  {
    id v9 = (void *)NanoRegistryLibrary_0();
    v15[3] = (uint64_t)dlsym(v9, "NRPairedDeviceRegistryDeviceDidBecomeActive");
    getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr = v15[3];
    uint64_t v8 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v8) {
    -[HKNanoRegistryPairingAndSwitchingNotificationDataSource _pairingChangeNotifications]();
  }
  id v19 = *v8;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = v19;
  v12 = [v10 arrayWithObjects:v18 count:3];

  return v12;
}

- (void)registerObserverForDevicePairingChanges:(id)a3 block:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self _pairingChangeNotifications];
  uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __105__HKNanoRegistryPairingAndSwitchingNotificationDataSource_registerObserverForDevicePairingChanges_block___block_invoke;
        v14[3] = &unk_1E58C0640;
        id v15 = v7;
        [(HKObserverBridge *)self registerObserver:v6 forKey:v12 newValueHandler:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __105__HKNanoRegistryPairingAndSwitchingNotificationDataSource_registerObserverForDevicePairingChanges_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterObserverForDevicePairingChanges:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self _pairingChangeNotifications];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HKObserverBridge *)self unregisterObserver:v4 forKey:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

- (void)_pairingChangeNotifications
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRPairedDeviceRegistryDeviceDidBecomeActive(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKNanoRegistryPairingAndSwitchingNotificationDataSource.m", 24, @"%s", dlerror());

  __break(1u);
}

@end