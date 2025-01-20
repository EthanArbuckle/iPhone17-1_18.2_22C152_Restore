@interface COAlarmService
+ (BOOL)_isAllowedClient:(id)a3;
+ (id)serviceWithDelegate:(id)a3;
- (BOOL)_applicableToCluster:(id)a3;
- (COAlarmService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5;
- (COSignalsClientObserverSet)observers;
- (id)_newClientForConnection:(id)a3;
- (void)_addOnAdded:(id)a3;
- (void)_addOnRemoved:(id)a3;
- (void)_clientLost:(id)a3;
- (void)_completeDispatchabilityStallActivity:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_didResetAlarmAddOn:(id)a3;
- (void)_didStopCanDispatchUpdate:(id)a3;
- (void)_postCanDispatchChanged:(BOOL)a3 forAccessory:(id)a4 toObserver:(id)a5;
- (void)_postCanDispatchChangedAddOn:(id)a3;
- (void)_postNotificationName:(id)a3 connection:(id)a4 userInfo:(id)a5;
- (void)_postNotificationName:(id)a3 forAccessory:(id)a4 toAddOn:(id)a5;
- (void)_postNotificationName:(id)a3 forAlarms:(id)a4 toAddOn:(id)a5 requiresUserInfo:(BOOL)a6;
- (void)addAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6;
- (void)addObserverForNotificationName:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 constraints:(id)a6 withCallback:(id)a7;
- (void)alarmAddOn:(id)a3 didAddAlarms:(id)a4;
- (void)alarmAddOn:(id)a3 didChangeAlarms:(id)a4;
- (void)alarmAddOn:(id)a3 didChangeFiringAlarms:(id)a4;
- (void)alarmAddOn:(id)a3 didDismissAlarms:(id)a4;
- (void)alarmAddOn:(id)a3 didFireAlarms:(id)a4;
- (void)alarmAddOn:(id)a3 didRemoveAlarms:(id)a4;
- (void)alarmAddOn:(id)a3 didUpdateAlarms:(id)a4;
- (void)alarmAddOn:(id)a3 resetAccesory:(id)a4;
- (void)alarmsAsAccessory:(id)a3 asInstance:(id)a4 forAccessories:(id)a5 callback:(id)a6;
- (void)alarmsAsAccessory:(id)a3 asInstance:(id)a4 withCallback:(id)a5;
- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5;
- (void)didChangeCompositionForAlarmAddOn:(id)a3;
- (void)didResetAlarmAddOn:(id)a3;
- (void)dismissAlarmWithIdentifier:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6;
- (void)removeAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6;
- (void)removeObserverForNotificationName:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6;
- (void)snoozeAlarmWithIdentifier:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6;
- (void)updateAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6;
@end

@implementation COAlarmService

+ (id)serviceWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(COAlarmAddOnListenerProvider);
  v6 = objc_alloc_init(COAlarmAddOnProvider);
  v7 = (void *)[objc_alloc((Class)a1) initWithListenerProvider:v5 addOnProvider:v6 delegate:v4];

  return v7;
}

- (COAlarmService)initWithListenerProvider:(id)a3 addOnProvider:(id)a4 delegate:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)COAlarmService;
  v5 = [(COService *)&v9 initWithListenerProvider:a3 addOnProvider:a4 delegate:a5];
  if (v5)
  {
    v6 = objc_alloc_init(COSignalsClientObserverSet);
    observers = v5->_observers;
    v5->_observers = v6;

    [(COService *)v5 _serviceReady];
  }
  return v5;
}

+ (BOOL)_isAllowedClient:(id)a3
{
  id v3 = a3;
  id v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[COAlarmService _isAllowedClient:]((uint64_t)v3, v4);
  }

  return 1;
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)COAlarmService;
  id v4 = a3;
  [(COService *)&v13 _configureServiceInterfacesOnConnection:v4];
  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D3F9218];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0, v13.receiver, v13.super_class);
  [v5 setClasses:v8 forSelector:sel_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback_ argumentIndex:3 ofReply:0];
  objc_super v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);

  [v5 setClasses:v11 forSelector:sel_alarmsAsAccessory_asInstance_forAccessories_callback_ argumentIndex:2 ofReply:0];
  [v4 setExportedInterface:v5];
  [v4 setExportedObject:self];
  v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D409628];

  [v4 setRemoteObjectInterface:v12];
}

- (id)_newClientForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [[COAlarmServiceClient alloc] initWithConnection:v3];

  return v4;
}

- (void)_clientLost:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)COAlarmService;
  [(COService *)&v19 _clientLost:v4];
  v5 = [(COAlarmService *)self observers];
  v6 = [v4 connection];
  uint64_t v7 = [v5 clientObserversForXPCConnection:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "removeClientObserver:forNotificationName:", v13, 0, (void)v15);
        [(COAlarmService *)self _didStopCanDispatchUpdate:v13];
        v14 = [v13 cluster];
        [(COService *)self _releaseAssertionForCluster:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_addOnAdded:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setDelegate:self];
  v5 = [v4 homekit];
  v6 = [v5 currentAccessory];
  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F33F88]) initWithHomeKitAccessory:v6];
    if (v7)
    {
      id v8 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v11 = self;
        __int16 v12 = 2112;
        objc_super v13 = v6;
        _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p AlarmService added secondary cluster for accessory %@", buf, 0x16u);
      }

      [v4 establishSecondaryClusterForAccessory:v7];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)COAlarmService;
  [(COService *)&v9 _addOnAdded:v4];
}

- (void)_addOnRemoved:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COAlarmService;
  id v3 = a3;
  [(COService *)&v4 _addOnRemoved:v3];
  objc_msgSend(v3, "setDelegate:", 0, v4.receiver, v4.super_class);
}

- (BOOL)_applicableToCluster:(id)a3
{
  id v3 = [a3 label];
  char v4 = [v3 isEqual:*MEMORY[0x263F33DB0]];

  return v4;
}

- (void)_postNotificationName:(id)a3 connection:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke;
  v18[3] = &unk_2645CC258;
  v18[4] = self;
  id v10 = v9;
  id v19 = v10;
  id v11 = a5;
  __int16 v12 = [v10 remoteObjectProxyWithErrorHandler:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82;
  v15[3] = &unk_2645CD618;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v13 = v8;
  id v14 = v10;
  [v12 postNotificationName:v13 withUserInfo:v11 callback:v15];
}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_cold_1();
  }
}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82_cold_1();
    }
  }
}

- (void)_postNotificationName:(id)a3 forAlarms:(id)a4 toAddOn:(id)a5 requiresUserInfo:(BOOL)a6
{
  BOOL v37 = a6;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = [v11 homekit];
  v31 = [v11 homehub];
  v32 = v12;
  v30 = [v12 currentAccessory];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v33 = self;
  id v13 = [(COAlarmService *)self observers];
  v34 = v9;
  id v14 = [v13 clientObserversForNotificationName:v9];

  id obj = v14;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v45;
    uint64_t v36 = *MEMORY[0x263F55CB0];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v20 = [v19 connection];
        uint64_t v21 = [v19 constraints];
        if (v21)
        {
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke_2;
          v38[3] = &unk_2645CD640;
          id v39 = v11;
          id v40 = v21;
          v22 = [v10 indexesOfObjectsPassingTest:v38];

          v23 = v39;
        }
        else
        {
          v23 = objc_msgSend(v20, "co_PeerInstance");
          if (v23)
          {
            id v24 = [v31 accessoryForPeerInstance:v23 usingHomeKitAdapter:v32];
          }
          else
          {
            id v24 = v30;
          }
          v25 = v24;
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke;
          v41[3] = &unk_2645CD640;
          id v42 = v11;
          id v43 = v25;
          id v26 = v25;
          v22 = [v10 indexesOfObjectsPassingTest:v41];
        }
        if ([v22 count])
        {
          v27 = NSDictionary;
          v28 = [v10 objectsAtIndexes:v22];
          v29 = [v27 dictionaryWithObject:v28 forKey:v36];
        }
        else
        {
          v29 = 0;
        }
        if (!v37 || v29) {
          [(COAlarmService *)v33 _postNotificationName:v34 connection:v20 userInfo:v29];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v16);
  }
}

uint64_t __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isAlarm:a2 targetingAccessory:*(void *)(a1 + 40)];
}

uint64_t __75__COAlarmService__postNotificationName_forAlarms_toAddOn_requiresUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  v5 = [v3 allObjects];
  uint64_t v6 = [v2 _isAlarm:v4 targetingAccessoryIdentifiers:v5];

  return v6;
}

- (void)_postNotificationName:(id)a3 forAccessory:(id)a4 toAddOn:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = self;
  id v10 = [(COAlarmService *)self observers];
  v22 = v7;
  id v11 = [v10 clientObserversForNotificationName:v7];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v17 = [v16 accessory];
        long long v18 = v17;
        if (v8)
        {
          id v19 = [v17 uniqueIdentifier];
          int v20 = [v19 isEqual:v8];

          if (v20)
          {
            uint64_t v21 = [v16 connection];
            [(COAlarmService *)v9 _postNotificationName:v22 connection:v21 userInfo:0];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)_postCanDispatchChanged:(BOOL)a3 forAccessory:(id)a4 toObserver:(id)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if ([v9 canDispatch] != v6)
  {
    [v9 setCanDispatch:v6];
    id v10 = [v9 connection];
    uint64_t v21 = *MEMORY[0x263F33D00];
    id v19 = v8;
    id v11 = [NSNumber numberWithBool:v6];
    int v20 = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v22[0] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

    if (v6)
    {
      [(COAlarmService *)self _completeDispatchabilityStallActivity:v9];
    }
    else
    {
      uint64_t v14 = [v9 dispatchabilityStallActivity];
      if (v14)
      {
      }
      else if ([v9 dispatchabilityStallCount])
      {
        uint64_t v15 = [(COService *)self clientForConnection:v10];
        uint64_t v16 = v15;
        if (v15)
        {
          uint64_t v17 = [v15 clientLifetimeActivity];
        }
        else
        {
          uint64_t v17 = 0;
        }
        long long v18 = +[CONetworkActivityFactory activityWithLabel:7 parentActivity:v17];
        [v9 setDispatchabilityStallActivity:v18];
        nw_activity_activate();
      }
    }
    [(COAlarmService *)self _postNotificationName:*MEMORY[0x263F33D58] connection:v10 userInfo:v13];
  }
}

- (void)_postCanDispatchChangedAddOn:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COAlarmService *)self observers];
  uint64_t v14 = *MEMORY[0x263F33D58];
  BOOL v6 = objc_msgSend(v5, "clientObserversForNotificationName:");

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 accessory];
        if (v12)
        {
          objc_initWeak(&location, self);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __47__COAlarmService__postCanDispatchChangedAddOn___block_invoke;
          v15[3] = &unk_2645CD668;
          objc_copyWeak(&v18, &location);
          id v16 = v12;
          uint64_t v17 = v11;
          [v4 canDispatchAsAccessory:v16 asInstance:0 reply:v15];

          objc_destroyWeak(&v18);
          objc_destroyWeak(&location);
        }
        else
        {
          uint64_t v13 = [v11 connection];
          [(COAlarmService *)self _postNotificationName:v14 connection:v13 userInfo:0];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

void __47__COAlarmService__postCanDispatchChangedAddOn___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    [WeakRetained _postCanDispatchChanged:a2 forAccessory:v4 toObserver:*(void *)(a1 + 40)];
  }
}

- (void)_completeDispatchabilityStallActivity:(id)a3
{
  id v4 = a3;
  id v3 = [v4 dispatchabilityStallActivity];
  if (v3)
  {
    nw_activity_complete_with_reason();
    objc_msgSend(v4, "setDispatchabilityStallCount:", objc_msgSend(v4, "dispatchabilityStallCount") + 1);
    [v4 setDispatchabilityStallActivity:0];
  }
}

- (void)_didStopCanDispatchUpdate:(id)a3
{
  id v8 = a3;
  id v4 = [v8 connection];
  v5 = [(COService *)self clientForConnection:v4];

  [(COAlarmService *)self _completeDispatchabilityStallActivity:v8];
  uint64_t v6 = [v8 dispatchabilityStallCount];
  if (v6)
  {
    if (v6 == 1)
    {
      if ([v8 canDispatch]) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 3;
      }
    }
    else
    {
      uint64_t v7 = 3;
    }
    [v5 donateClientLifetimeActivityCompletionReason:v7];
  }
}

- (void)alarmsAsAccessory:(id)a3 asInstance:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(COService *)self currentClient];
  uint64_t v12 = [v11 connection];
  objc_msgSend(v12, "co_SetPeerInstance:", v10);

  uint64_t v13 = _ClusterForAccessory(v8);
  [(COService *)self _takeAssertionForCluster:v13];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke;
  v24[3] = &unk_2645CD690;
  id v25 = v13;
  id v26 = v9;
  v24[4] = self;
  id v14 = v13;
  id v15 = v9;
  id v16 = (void *)MEMORY[0x223C8B4A0](v24);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_3;
  v20[3] = &unk_2645CD6B8;
  id v21 = v8;
  id v22 = v11;
  id v23 = v16;
  id v17 = v16;
  id v18 = v11;
  id v19 = v8;
  [(COService *)self _addOnForCluster:v14 completion:v20];
}

void __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __60__COAlarmService_alarmsAsAccessory_asInstance_withCallback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v6 alarmsAsAccessory:a1[4] fromClient:a1[5] withCallback:a1[6]];
  }
  else
  {
    uint64_t v4 = a1[6];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

- (void)alarmsAsAccessory:(id)a3 asInstance:(id)a4 forAccessories:(id)a5 callback:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(COService *)self currentClient];
  uint64_t v13 = _ClusterForAccessory(v9);
  [(COService *)self _takeAssertionForCluster:v13];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke;
  v26[3] = &unk_2645CD6E0;
  id v27 = v13;
  id v28 = v11;
  v26[4] = self;
  id v14 = v13;
  id v15 = v11;
  id v16 = (void *)MEMORY[0x223C8B4A0](v26);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_3;
  v21[3] = &unk_2645CD708;
  id v22 = v9;
  id v23 = v10;
  id v24 = v12;
  id v25 = v16;
  id v17 = v16;
  id v18 = v12;
  id v19 = v10;
  id v20 = v9;
  [(COService *)self _addOnForCluster:v14 completion:v21];
}

void __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __71__COAlarmService_alarmsAsAccessory_asInstance_forAccessories_callback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v6 alarmsForAccessories:a1[5] fromClient:a1[6] callback:a1[7]];
  }
  else
  {
    uint64_t v4 = a1[7];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

- (void)addAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(COService *)self currentClient];
  id v15 = [v14 connection];
  objc_msgSend(v15, "co_SetPeerInstance:", v13);

  id v16 = _ClusterForAccessory(v11);
  [(COService *)self _takeAssertionForCluster:v16];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke;
  v29[3] = &unk_2645CD730;
  id v30 = v16;
  id v31 = v12;
  v29[4] = self;
  id v17 = v16;
  id v18 = v12;
  id v19 = (void *)MEMORY[0x223C8B4A0](v29);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_3;
  v24[3] = &unk_2645CD708;
  id v25 = v11;
  id v26 = v10;
  id v27 = v14;
  id v28 = v19;
  id v20 = v19;
  id v21 = v14;
  id v22 = v10;
  id v23 = v11;
  [(COService *)self _addOnForCluster:v17 completion:v24];
}

void __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __63__COAlarmService_addAlarm_asAccessory_asInstance_withCallback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v6 addAlarm:a1[5] asAccessory:a1[4] fromClient:a1[6] withCallback:a1[7]];
  }
  else
  {
    uint64_t v4 = a1[7];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)updateAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(COService *)self currentClient];
  id v15 = [v14 connection];
  objc_msgSend(v15, "co_SetPeerInstance:", v13);

  id v16 = _ClusterForAccessory(v11);
  [(COService *)self _takeAssertionForCluster:v16];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke;
  v29[3] = &unk_2645CD730;
  id v30 = v16;
  id v31 = v12;
  v29[4] = self;
  id v17 = v16;
  id v18 = v12;
  id v19 = (void *)MEMORY[0x223C8B4A0](v29);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_3;
  v24[3] = &unk_2645CD708;
  id v25 = v11;
  id v26 = v10;
  id v27 = v14;
  id v28 = v19;
  id v20 = v19;
  id v21 = v14;
  id v22 = v10;
  id v23 = v11;
  [(COService *)self _addOnForCluster:v17 completion:v24];
}

void __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __66__COAlarmService_updateAlarm_asAccessory_asInstance_withCallback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v6 updateAlarm:a1[5] asAccessory:a1[4] fromClient:a1[6] withCallback:a1[7]];
  }
  else
  {
    uint64_t v4 = a1[7];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)removeAlarm:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(COService *)self currentClient];
  id v15 = [v14 connection];
  objc_msgSend(v15, "co_SetPeerInstance:", v13);

  id v16 = _ClusterForAccessory(v11);
  [(COService *)self _takeAssertionForCluster:v16];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke;
  v29[3] = &unk_2645CD730;
  id v30 = v16;
  id v31 = v12;
  v29[4] = self;
  id v17 = v16;
  id v18 = v12;
  id v19 = (void *)MEMORY[0x223C8B4A0](v29);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_3;
  v24[3] = &unk_2645CD708;
  id v25 = v11;
  id v26 = v10;
  id v27 = v14;
  id v28 = v19;
  id v20 = v19;
  id v21 = v14;
  id v22 = v10;
  id v23 = v11;
  [(COService *)self _addOnForCluster:v17 completion:v24];
}

void __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __66__COAlarmService_removeAlarm_asAccessory_asInstance_withCallback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v6 removeAlarm:a1[5] asAccessory:a1[4] fromClient:a1[6] withCallback:a1[7]];
  }
  else
  {
    uint64_t v4 = a1[7];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)snoozeAlarmWithIdentifier:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(COService *)self currentClient];
  id v13 = _ClusterForAccessory(v10);
  [(COService *)self _takeAssertionForCluster:v13];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke;
  v26[3] = &unk_2645CD730;
  id v27 = v13;
  id v28 = v11;
  v26[4] = self;
  id v14 = v13;
  id v15 = v11;
  id v16 = (void *)MEMORY[0x223C8B4A0](v26);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3;
  v21[3] = &unk_2645CD708;
  id v22 = v10;
  id v23 = v9;
  id v24 = v12;
  id v25 = v16;
  id v17 = v16;
  id v18 = v12;
  id v19 = v9;
  id v20 = v10;
  [(COService *)self _addOnForCluster:v14 completion:v21];
}

void __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __80__COAlarmService_snoozeAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v6 snoozeAlarmWithIdentifier:a1[5] fromClient:a1[6] withCallback:a1[7]];
  }
  else
  {
    uint64_t v4 = a1[7];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)dismissAlarmWithIdentifier:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(COService *)self currentClient];
  id v13 = _ClusterForAccessory(v10);
  [(COService *)self _takeAssertionForCluster:v13];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke;
  v26[3] = &unk_2645CD730;
  id v27 = v13;
  id v28 = v11;
  v26[4] = self;
  id v14 = v13;
  id v15 = v11;
  id v16 = (void *)MEMORY[0x223C8B4A0](v26);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3;
  v21[3] = &unk_2645CD708;
  id v22 = v10;
  id v23 = v9;
  id v24 = v12;
  id v25 = v16;
  id v17 = v16;
  id v18 = v12;
  id v19 = v9;
  id v20 = v10;
  [(COService *)self _addOnForCluster:v14 completion:v21];
}

void __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __81__COAlarmService_dismissAlarmWithIdentifier_asAccessory_asInstance_withCallback___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v6 dismissAlarmWithIdentifier:a1[5] fromClient:a1[6] withCallback:a1[7]];
  }
  else
  {
    uint64_t v4 = a1[7];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)addObserverForNotificationName:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 constraints:(id)a6 withCallback:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void))a7;
  id v16 = a5;
  id v17 = v13;
  id v18 = v16;
  id v19 = [(COService *)self currentClient];
  id v20 = [v19 connection];
  objc_msgSend(v20, "co_SetPeerInstance:", v18);

  id v21 = _ClusterForAccessory(v17);
  [(COService *)self _takeAssertionForCluster:v21];
  id v22 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v41 = v19;
    __int16 v42 = 2112;
    id v43 = v12;
    _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "%p serving request to observe %@", buf, 0x16u);
  }

  id v23 = [(COAlarmService *)self observers];
  uint64_t v36 = v19;
  if (v14)
  {
    id v24 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[COAlarmService addObserverForNotificationName:asAccessory:asInstance:constraints:withCallback:]((uint64_t)v19, (uint64_t)v14, v24);
    }

    id v25 = [[COSignalsClientObserver alloc] initWithConnection:v20 asAccessory:v17 constraints:v14 cluster:v21];
  }
  else
  {
    id v25 = [[COSignalsClientObserver alloc] initWithConnection:v20 cluster:v21];
  }
  id v26 = v25;
  if ([v12 isEqualToString:*MEMORY[0x263F33D58]])
  {
    id v27 = [(COSignalsClientObserver *)v26 dispatchabilityStallActivity];
    if (v27)
    {
LABEL_12:

      goto LABEL_13;
    }
    if (![(COSignalsClientObserver *)v26 canDispatch])
    {
      [v36 clientLifetimeActivity];
      id v28 = v34 = v17;
      id v27 = +[CONetworkActivityFactory activityWithLabel:7 parentActivity:v28];

      id v17 = v34;
      [(COSignalsClientObserver *)v26 setDispatchabilityStallActivity:v27];
      nw_activity_activate();
      goto LABEL_12;
    }
  }
LABEL_13:
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled] && objc_msgSend(v14, "count"))
  {
    v35 = v17;
    v29 = [v23 constraints];
    id v30 = (id)[v14 mutableCopy];
    [v30 minusSet:v29];
    if ([v30 count])
    {
      v33 = v29;
      id v31 = (void *)[v29 mutableCopy];

      [v31 unionSet:v14];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __97__COAlarmService_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback___block_invoke;
      v37[3] = &unk_2645CD758;
      id v38 = v35;
      id v32 = v31;
      v29 = v33;
      id v30 = v32;
      id v39 = v32;
      [(COService *)self _addOnForCluster:v21 completion:v37];
    }
    id v17 = v35;
  }
  [v23 addClientObserver:v26 forNotificationName:v12];
  v15[2](v15, 0);
}

void __97__COAlarmService_addObserverForNotificationName_asAccessory_asInstance_constraints_withCallback___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = a2;
    [v4 establishSecondaryClusterForAccessory:v3];
    [v4 setInterests:*(void *)(a1 + 40) asAccessory:*(void *)(a1 + 32) withCallback:&__block_literal_global_8];
  }
}

- (void)removeObserverForNotificationName:(id)a3 asAccessory:(id)a4 asInstance:(id)a5 withCallback:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(COService *)self currentClient];
  uint64_t v13 = [v12 connection];
  id v14 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v47 = v12;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p serving request to stop observing %@", buf, 0x16u);
  }
  id v32 = v12;

  id v15 = [(COAlarmService *)self observers];
  id v33 = v11;
  id v16 = v10;
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    v34 = [v15 constraints];
  }
  else
  {
    v34 = 0;
  }
  id v31 = (void *)v13;
  id v17 = [v15 clientObserversForXPCConnection:v13];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    uint64_t v21 = *MEMORY[0x263F33D58];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        [v15 removeClientObserver:v23 forNotificationName:v9];
        if ([v9 isEqualToString:v21]) {
          [(COAlarmService *)self _didStopCanDispatchUpdate:v23];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v19);
  }
  id v24 = v33;
  (*((void (**)(id, void))v33 + 2))(v33, 0);
  id v25 = _ClusterForAccessory(v16);
  if ([MEMORY[0x263F33F80] isGlobalMessagingEnabled])
  {
    id v26 = [v15 constraints];
    if (([v26 isEqual:v34] & 1) == 0)
    {
      [(COService *)self _takeAssertionForCluster:v25];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke;
      v39[3] = &unk_2645CAE80;
      v39[4] = self;
      id v27 = v25;
      id v40 = v27;
      id v28 = (void *)MEMORY[0x223C8B4A0](v39);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_3;
      v35[3] = &unk_2645CD6B8;
      id v36 = v16;
      id v37 = v26;
      id v38 = v28;
      id v29 = v28;
      id v30 = v27;
      id v24 = v33;
      [(COService *)self _addOnForCluster:v30 completion:v35];
    }
  }
  [(COService *)self _releaseAssertionForCluster:v25];
}

void __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __88__COAlarmService_removeObserverForNotificationName_asAccessory_asInstance_withCallback___block_invoke_3(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    id v4 = a2;
    [v4 establishSecondaryClusterForAccessory:v3];
    [v4 setInterests:a1[5] asAccessory:a1[4] withCallback:a1[6]];
  }
}

- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _ClusterForAccessory(v8);
  [(COService *)self _takeAssertionForCluster:v11];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  void v22[2] = __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke;
  v22[3] = &unk_2645CD780;
  id v23 = v11;
  id v24 = v10;
  v22[4] = self;
  id v12 = v11;
  id v13 = v10;
  id v14 = (void *)MEMORY[0x223C8B4A0](v22);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_3;
  v18[3] = &unk_2645CD6B8;
  id v19 = v8;
  id v20 = v9;
  id v21 = v14;
  id v15 = v14;
  id v16 = v9;
  id v17 = v8;
  [(COService *)self _addOnForCluster:v12 completion:v18];
}

void __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_2;
  v4[3] = &unk_2645CAE80;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertionForCluster:*(void *)(a1 + 40)];
}

void __58__COAlarmService_canDispatchAsAccessory_asInstance_reply___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 establishSecondaryClusterForAccessory:a1[4]];
    [v4 canDispatchAsAccessory:a1[4] asInstance:a1[5] reply:a1[6]];
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)alarmAddOn:(id)a3 didAddAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__COAlarmService_alarmAddOn_didAddAlarms___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __42__COAlarmService_alarmAddOn_didAddAlarms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D18] forAlarms:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48) requiresUserInfo:0];
}

- (void)alarmAddOn:(id)a3 didRemoveAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__COAlarmService_alarmAddOn_didRemoveAlarms___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __45__COAlarmService_alarmAddOn_didRemoveAlarms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D38] forAlarms:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48) requiresUserInfo:0];
}

- (void)alarmAddOn:(id)a3 didUpdateAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__COAlarmService_alarmAddOn_didUpdateAlarms___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __45__COAlarmService_alarmAddOn_didUpdateAlarms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D40] forAlarms:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48) requiresUserInfo:0];
}

- (void)alarmAddOn:(id)a3 didChangeAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__COAlarmService_alarmAddOn_didChangeAlarms___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __45__COAlarmService_alarmAddOn_didChangeAlarms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D28] forAlarms:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48) requiresUserInfo:0];
}

- (void)alarmAddOn:(id)a3 didFireAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__COAlarmService_alarmAddOn_didFireAlarms___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __43__COAlarmService_alarmAddOn_didFireAlarms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D10] forAlarms:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48) requiresUserInfo:1];
}

- (void)alarmAddOn:(id)a3 didDismissAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__COAlarmService_alarmAddOn_didDismissAlarms___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __46__COAlarmService_alarmAddOn_didDismissAlarms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D68] forAlarms:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48) requiresUserInfo:1];
}

- (void)alarmAddOn:(id)a3 didChangeFiringAlarms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__COAlarmService_alarmAddOn_didChangeFiringAlarms___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __51__COAlarmService_alarmAddOn_didChangeFiringAlarms___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D60] forAlarms:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48) requiresUserInfo:1];
}

- (void)alarmAddOn:(id)a3 resetAccesory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COService *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__COAlarmService_alarmAddOn_resetAccesory___block_invoke;
  block[3] = &unk_2645CAEF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __43__COAlarmService_alarmAddOn_resetAccesory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotificationName:*MEMORY[0x263F33D80] forAccessory:*(void *)(a1 + 40) toAddOn:*(void *)(a1 + 48)];
}

- (void)didResetAlarmAddOn:(id)a3
{
  id v4 = a3;
  id v5 = [(COService *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__COAlarmService_didResetAlarmAddOn___block_invoke;
  v7[3] = &unk_2645CAE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__COAlarmService_didResetAlarmAddOn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didResetAlarmAddOn:*(void *)(a1 + 40)];
}

- (void)didChangeCompositionForAlarmAddOn:(id)a3
{
  id v4 = a3;
  id v5 = [(COService *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__COAlarmService_didChangeCompositionForAlarmAddOn___block_invoke;
  v7[3] = &unk_2645CAE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__COAlarmService_didChangeCompositionForAlarmAddOn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postCanDispatchChangedAddOn:*(void *)(a1 + 40)];
}

- (void)_didResetAlarmAddOn:(id)a3
{
}

- (COSignalsClientObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

+ (void)_isAllowedClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "alarms service allowing %@", (uint8_t *)&v2, 0xCu);
}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_7();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_2217C1000, v1, OS_LOG_TYPE_ERROR, "%p -> %p remote failed %@ ", v2, 0x20u);
}

void __60__COAlarmService__postNotificationName_connection_userInfo___block_invoke_82_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_7();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_2217C1000, v3, OS_LOG_TYPE_ERROR, "%p -> %p %@ post failed %@ ", v4, 0x2Au);
}

- (void)addObserverForNotificationName:(os_log_t)log asAccessory:asInstance:constraints:withCallback:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "%p observing constrained to %@", (uint8_t *)&v3, 0x16u);
}

@end