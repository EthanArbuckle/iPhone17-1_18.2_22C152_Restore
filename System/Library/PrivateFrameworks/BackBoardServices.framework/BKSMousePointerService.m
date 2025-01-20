@interface BKSMousePointerService
+ (BOOL)supportsReadyToReceiveEventServiceProperty;
+ (id)new;
+ (id)sharedInstance;
- (BKSMousePointerDevicePreferences)globalDevicePreferences;
- (BKSMousePointerService)init;
- (CGPoint)globalPointerPosition;
- (CGPoint)normalizedGlobalPointerPosition;
- (id)_init;
- (id)_locked_infoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_locked_serverTarget;
- (id)_unlocked_serverTarget;
- (id)acquireButtonDownPointerRepositionAssertionForReason:(id)a3 contextRelativePointerPosition:(id)a4 onDisplay:(id)a5 restrictingToPID:(int)a6;
- (id)addPointerDeviceObserver:(id)a3;
- (id)addPointerPreferencesObserver:(id)a3;
- (id)pointerSuppressionAssertionOnDisplay:(id)a3 forReason:(id)a4 withOptionsMask:(unint64_t)a5;
- (id)preferencesForDevice:(id)a3;
- (id)requestGlobalMouseEventsForDisplay:(id)a3 targetContextID:(unsigned int)a4;
- (id)requestGlobalMouseEventsForDisplay:(id)a3 targetContextID:(unsigned int)a4 options:(id)a5;
- (id)suppressPointerEventsForReason:(id)a3;
- (void)_activateServerConnection;
- (void)_locked_pointingDevicesDidChange:(id)a3;
- (void)_locked_reactivateConnection;
- (void)_locked_sendCurrentAssertionParameters:(id)a3 forDisplayUUID:(id)a4;
- (void)_locked_setMousePointerDeviceObservationEnabled:(BOOL)a3;
- (void)_locked_setMousePointerPreferencesObservationEnabled:(BOOL)a3;
- (void)_locked_updateEventRoutesFromContext:(id)a3 forDisplayUUID:(id)a4;
- (void)_locked_updateObserver:(id)a3 withPointingDevices:(id)a4;
- (void)_locked_updateServerWithPointerDeviceObservationState;
- (void)_locked_updateServerWithPreferencesObservationState;
- (void)dealloc;
- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6;
- (void)pointerGlobalDevicePreferencesDidChange:(id)a3;
- (void)pointingDevicesDidChange:(id)a3;
- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(int)a6;
- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(double)a6 restrictingToPID:(int)a7;
- (void)setGlobalDevicePreferences:(id)a3;
- (void)setGlobalPointerPosition:(CGPoint)a3;
- (void)setPointerPosition:(CGPoint)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5;
- (void)setPreferences:(id)a3 forDevice:(id)a4;
@end

@implementation BKSMousePointerService

void __51__BKSMousePointerService__activateServerConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[BKSMousePointerServiceSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[BKSMousePointerServiceSessionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__BKSMousePointerService__activateServerConnection__block_invoke_2;
  v6[3] = &unk_1E5441590;
  v6[4] = *(void *)(a1 + 32);
  [v3 setInterruptionHandler:v6];
  [v3 setInvalidationHandler:&__block_literal_global_141];
}

uint64_t __40__BKSMousePointerService_sharedInstance__block_invoke()
{
  id v0 = [[BKSMousePointerService alloc] _init];
  uint64_t v1 = sharedInstance_service_4084;
  sharedInstance_service_4084 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_init
{
  v16.receiver = self;
  v16.super_class = (Class)BKSMousePointerService;
  v2 = [(BKSMousePointerService *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x1E4F4F730] serial];
    uint64_t v5 = BSDispatchQueueCreate();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E4F4F6E8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __31__BKSMousePointerService__init__block_invoke;
    v14[3] = &unk_1E5440EC8;
    v8 = v3;
    v15 = v8;
    uint64_t v9 = [v7 assertionWithIdentifier:@"suppressAllMouseEvents" stateDidChangeHandler:v14];
    suppressMouseEvents = v8->_suppressMouseEvents;
    v8->_suppressMouseEvents = (BSCompoundAssertion *)v9;

    v11 = v8->_suppressMouseEvents;
    v12 = BKLogMousePointer();
    [(BSCompoundAssertion *)v11 setLog:v12];

    [(BKSMousePointerService *)v8 _activateServerConnection];
  }
  return v3;
}

- (void)_activateServerConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = +[BKSMousePointerServiceSessionSpecification identifier];
  uint64_t v5 = +[BKSHIDServiceConnection clientConnectionForServiceWithName:v4];
  connection = self->_connection;
  self->_connection = v5;

  v7 = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__BKSMousePointerService__activateServerConnection__block_invoke;
  v11[3] = &unk_1E5441878;
  v11[4] = self;
  [(BSServiceConnection *)v7 configureConnection:v11];
  v8 = BKLogMousePointer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = self->_connection;
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl(&dword_18AA0B000, v8, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  v10 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  [(BSServiceConnection *)v10 activate];
}

- (void)_locked_updateServerWithPointerDeviceObservationState
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL isObservingDeviceConnection = self->_isObservingDeviceConnection;
  v4 = [(BKSMousePointerService *)self _locked_serverTarget];
  uint64_t v5 = [NSNumber numberWithBool:isObservingDeviceConnection];
  id v6 = [v4 setMousePointerDeviceObservationEnabled:v5];

  if (isObservingDeviceConnection) {
    [(BKSMousePointerService *)self _locked_pointingDevicesDidChange:v6];
  }
}

void __51__BKSMousePointerService_addPointerDeviceObserver___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    -[os_unfair_lock_s _locked_setMousePointerDeviceObservationEnabled:](v4, "_locked_setMousePointerDeviceObservationEnabled:", [v5 isActive]);
    os_unfair_lock_unlock(v4 + 4);
  }
}

- (void)_locked_setMousePointerDeviceObservationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_isObservingDeviceConnection != v3)
  {
    self->_BOOL isObservingDeviceConnection = v3;
    [(BKSMousePointerService *)self _locked_updateServerWithPointerDeviceObservationState];
  }
}

- (id)_locked_serverTarget
{
  os_unfair_lock_assert_owner(&self->_lock);
  connection = self->_connection;
  return (id)[(BSServiceConnection *)connection remoteTarget];
}

- (void)_locked_pointingDevicesDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (NSSet *)[v4 copy];
  attachedDevices = self->_attachedDevices;
  self->_attachedDevices = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = [(BSCompoundAssertion *)self->_deviceConnectionObservers context];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(BKSMousePointerService *)self _locked_updateObserver:*(void *)(*((void *)&v12 + 1) + 8 * v11++) withPointingDevices:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)addPointerDeviceObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_deviceConnectionObservers)
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x1E4F4F6E8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__BKSMousePointerService_addPointerDeviceObserver___block_invoke;
    v13[3] = &unk_1E54417B8;
    objc_copyWeak(&v14, &location);
    id v6 = [v5 assertionWithIdentifier:@"mouse-device-observers" stateDidChangeHandler:v13];
    deviceConnectionObservers = self->_deviceConnectionObservers;
    self->_deviceConnectionObservers = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  uint64_t v8 = objc_alloc_init(BKSMousePointerDeviceObserverInfo);
  [(BKSMousePointerDeviceObserverInfo *)v8 setObserver:v4];
  [(BKSMousePointerService *)self _locked_updateObserver:v8 withPointingDevices:self->_attachedDevices];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v9 = self->_deviceConnectionObservers;
  uint64_t v10 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v4];
  uint64_t v11 = [(BSCompoundAssertion *)v9 acquireForReason:v10 withContext:v8];

  return v11;
}

- (void)_locked_updateObserver:(id)a3 withPointingDevices:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = [v19 visibleDevices];
  uint64_t v8 = (void *)[v6 mutableCopy];
  if ([v7 count]) {
    [v8 minusSet:v7];
  }
  if ([v8 count])
  {
    uint64_t v9 = [v19 observer];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [v19 observer];
      [v11 mousePointerDevicesDidConnect:v8];
    }
  }
  long long v12 = (void *)[v7 mutableCopy];
  [v12 minusSet:v6];
  if ([v12 count])
  {
    long long v13 = [v19 observer];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      long long v15 = [v19 observer];
      [v15 mousePointerDevicesDidDisconnect:v12];
    }
  }
  objc_super v16 = [v19 observer];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [v19 observer];
    [v18 mousePointerDevicesDidChange:v6];
  }
  [v19 setVisibleDevices:v6];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4082 != -1) {
    dispatch_once(&sharedInstance_onceToken_4082, &__block_literal_global_4083);
  }
  v2 = (void *)sharedInstance_service_4084;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachedDevices, 0);
  objc_storeStrong((id *)&self->_suppressMouseEvents, 0);
  objc_storeStrong((id *)&self->_preferencesObservers, 0);
  objc_storeStrong((id *)&self->_deviceConnectionObservers, 0);
  objc_storeStrong((id *)&self->_displayUUIDToPerDisplayInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)pointerGlobalDevicePreferencesDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(BSCompoundAssertion *)self->_preferencesObservers context];
  v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "observer", (void)v14);
        [v13 mousePointerGlobalDevicePreferencesDidChange:v4];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)pointingDevicesDidChange:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [(BKSMousePointerService *)self _locked_pointingDevicesDidChange:v5];

  os_unfair_lock_unlock(p_lock);
}

void __51__BKSMousePointerService__activateServerConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = BKLogMousePointer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  objc_msgSend(v5, "_locked_pointingDevicesDidChange:", v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  [v3 activate];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_locked_reactivateConnection");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

void __51__BKSMousePointerService__activateServerConnection__block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = BKLogMousePointer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_DEFAULT, "Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_locked_reactivateConnection
{
  os_unfair_lock_assert_owner(&self->_lock);
  displayUUIDToPerDisplayInfo = self->_displayUUIDToPerDisplayInfo;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__BKSMousePointerService__locked_reactivateConnection__block_invoke;
  v4[3] = &unk_1E5440F88;
  v4[4] = self;
  [(NSMutableDictionary *)displayUUIDToPerDisplayInfo enumerateKeysAndObjectsUsingBlock:v4];
  [(BKSMousePointerService *)self _locked_updateServerWithPointerDeviceObservationState];
  [(BKSMousePointerService *)self _locked_updateServerWithPreferencesObservationState];
}

void __54__BKSMousePointerService__locked_reactivateConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 pointerSuppressionAssertion];
  if (v6) {
    objc_msgSend(*(id *)(a1 + 32), "_locked_sendCurrentAssertionParameters:forDisplayUUID:", v6, v8);
  }
  int v7 = [v5 globalEventsAssertion];
  if (v7) {
    objc_msgSend(*(id *)(a1 + 32), "_locked_updateEventRoutesFromContext:forDisplayUUID:", v7, v8);
  }
}

- (void)_locked_updateEventRoutesFromContext:(id)a3 forDisplayUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(BKSMousePointerService *)self _locked_serverTarget];
  id v8 = [v7 context];

  [v9 setGlobalPointerEventRoutes:v8 forDisplay:v6];
}

- (void)_locked_sendCurrentAssertionParameters:(id)a3 forDisplayUUID:(id)a4
{
  id v6 = a4;
  id v7 = [a3 context];
  objc_msgSend(v7, "bs_reduce:block:", &unk_1ED76C970, &__block_literal_global_133);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(BKSMousePointerService *)self _locked_serverTarget];
  [v8 applyAssertionParametersOnDisplay:v6 withOptionsMask:v9];
}

uint64_t __80__BKSMousePointerService__locked_sendCurrentAssertionParameters_forDisplayUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  uint64_t v7 = [v5 suppressionOptions];

  return [v4 numberWithUnsignedInteger:v7 | v6];
}

- (id)_locked_infoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v7 = [(NSMutableDictionary *)self->_displayUUIDToPerDisplayInfo objectForKeyedSubscript:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    uint64_t v7 = objc_alloc_init(BKSMousePointerPerDisplayInfo);
    displayUUIDToPerDisplayInfo = self->_displayUUIDToPerDisplayInfo;
    if (!displayUUIDToPerDisplayInfo)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v11 = self->_displayUUIDToPerDisplayInfo;
      self->_displayUUIDToPerDisplayInfo = v10;

      displayUUIDToPerDisplayInfo = self->_displayUUIDToPerDisplayInfo;
    }
    [(NSMutableDictionary *)displayUUIDToPerDisplayInfo setObject:v7 forKeyedSubscript:v6];
  }

  return v7;
}

- (void)_locked_setMousePointerPreferencesObservationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_isObservingPreferences != v3)
  {
    self->_isObservingPreferences = v3;
    [(BKSMousePointerService *)self _locked_updateServerWithPreferencesObservationState];
  }
}

- (void)_locked_updateServerWithPreferencesObservationState
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v4 = [(BKSMousePointerService *)self _locked_serverTarget];
  BOOL v3 = [NSNumber numberWithBool:self->_isObservingPreferences];
  [v4 setMousePointerPreferenceObservationEnabled:v3];
}

- (id)_unlocked_serverTarget
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPreferences:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  [v8 setPreferences:v7 forDevice:v6];
}

- (id)preferencesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  id v6 = [v5 preferencesForDevice:v4];

  return v6;
}

- (id)addPointerPreferencesObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_preferencesObservers)
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x1E4F4F6E8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__BKSMousePointerService_addPointerPreferencesObserver___block_invoke;
    v13[3] = &unk_1E54417B8;
    objc_copyWeak(&v14, &location);
    id v6 = [v5 assertionWithIdentifier:@"preferences-observers" stateDidChangeHandler:v13];
    preferencesObservers = self->_preferencesObservers;
    self->_preferencesObservers = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_lock);
  id v8 = objc_alloc_init(BKSMousePointerPreferencesObserverInfo);
  [(BKSMousePointerPreferencesObserverInfo *)v8 setObserver:v4];
  id v9 = self->_preferencesObservers;
  uint64_t v10 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v4];
  uint64_t v11 = [(BSCompoundAssertion *)v9 acquireForReason:v10 withContext:v8];

  return v11;
}

void __56__BKSMousePointerService_addPointerPreferencesObserver___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    -[os_unfair_lock_s _locked_setMousePointerPreferencesObservationEnabled:](v4, "_locked_setMousePointerPreferencesObservationEnabled:", [v5 isActive]);
    os_unfair_lock_unlock(v4 + 4);
  }
}

- (void)setGlobalDevicePreferences:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  [v5 setGlobalDevicePreferences:v4];
}

- (BKSMousePointerDevicePreferences)globalDevicePreferences
{
  id v2 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  BOOL v3 = [v2 globalDevicePreferences];

  return (BKSMousePointerDevicePreferences *)v3;
}

- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  [v14 getHitTestContextsAtPoint:v13 withAdditionalContexts:v12 onDisplay:v11 withCompletion:v10];
}

- (id)requestGlobalMouseEventsForDisplay:(id)a3 targetContextID:(unsigned int)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v6)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contextID != 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v27 = NSStringFromSelector(a2);
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      v39 = v27;
      __int16 v40 = 2114;
      v41 = v29;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2114;
      v45 = @"BKSMousePointerService.m";
      __int16 v46 = 1024;
      int v47 = 227;
      __int16 v48 = 2114;
      v49 = v26;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA44F7CLL);
  }
  id v11 = v10;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v13 = (__CFString *)v9;
  uint64_t v14 = [(__CFString *)v13 length];
  long long v15 = @"<main>";
  if (v14) {
    long long v15 = v13;
  }
  long long v16 = v15;

  long long v17 = [(BKSMousePointerService *)self _locked_infoForDisplayUUID:v16 createIfNeeded:1];
  v18 = [v17 globalEventsAssertion];
  if (!v18)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F4F6E8];
    v20 = [@"global-events:" stringByAppendingString:v16];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke;
    v36[3] = &unk_1E5440F18;
    v36[4] = self;
    v37 = v16;
    v18 = [v19 assertionWithIdentifier:v20 stateDidChangeHandler:v36];

    [v17 setGlobalEventsAssertion:v18];
  }
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke_2;
  v33 = &unk_1E5440F40;
  int v35 = v6;
  id v34 = v11;
  id v21 = v11;
  v22 = +[BKSMousePointerEventGlobalRoute build:&v30];
  os_unfair_lock_unlock(p_lock);
  v23 = [NSString stringWithFormat:@"display:%@ context:%X", v16, v6, v30, v31, v32, v33];
  v24 = [v18 acquireForReason:v23 withContext:v22];

  return v24;
}

void __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_locked_updateEventRoutesFromContext:forDisplayUUID:", v4, *(void *)(a1 + 40));

  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock(v5);
}

void __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 setContextID:v3];
  [v4 setOptions:*(void *)(a1 + 32)];
}

- (id)suppressPointerEventsForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_suppressMouseEvents acquireForReason:a3];
}

- (id)requestGlobalMouseEventsForDisplay:(id)a3 targetContextID:(unsigned int)a4
{
  return [(BKSMousePointerService *)self requestGlobalMouseEventsForDisplay:a3 targetContextID:*(void *)&a4 options:0];
}

- (id)pointerSuppressionAssertionOnDisplay:(id)a3 forReason:(id)a4 withOptionsMask:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    v23 = [NSString stringWithFormat:@"Suppression Options must suppress something"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(a2);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v34 = v24;
      __int16 v35 = 2114;
      v36 = v26;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2114;
      __int16 v40 = @"BKSMousePointerService.m";
      __int16 v41 = 1024;
      int v42 = 188;
      __int16 v43 = 2114;
      __int16 v44 = v23;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA45330);
  }
  id v11 = v10;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v12 = (__CFString *)v9;
  uint64_t v13 = [(__CFString *)v12 length];
  uint64_t v14 = @"<main>";
  if (v13) {
    uint64_t v14 = v12;
  }
  long long v15 = v14;

  long long v16 = [(BKSMousePointerService *)self _locked_infoForDisplayUUID:v15 createIfNeeded:1];
  long long v17 = [v16 pointerSuppressionAssertion];
  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v19 = [@"mouse-pointer-suppression:" stringByAppendingString:v15];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __89__BKSMousePointerService_pointerSuppressionAssertionOnDisplay_forReason_withOptionsMask___block_invoke;
    uint64_t v30 = &unk_1E5440F18;
    uint64_t v31 = self;
    v32 = v15;
    long long v17 = [v18 assertionWithIdentifier:v19 stateDidChangeHandler:&v27];

    objc_msgSend(v16, "setPointerSuppressionAssertion:", v17, v27, v28, v29, v30, v31);
  }
  v20 = objc_alloc_init(BKSMousePointerSuppressionAssertionDescriptor);
  [(BKSMousePointerSuppressionAssertionDescriptor *)v20 setSuppressionOptions:a5];
  os_unfair_lock_unlock(&self->_lock);
  id v21 = [v17 acquireForReason:v11 withContext:v20];

  return v21;
}

void __89__BKSMousePointerService_pointerSuppressionAssertionOnDisplay_forReason_withOptionsMask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_locked_sendCurrentAssertionParameters:forDisplayUUID:", v4, *(void *)(a1 + 40));

  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock(v5);
}

- (id)acquireButtonDownPointerRepositionAssertionForReason:(id)a3 contextRelativePointerPosition:(id)a4 onDisplay:(id)a5 restrictingToPID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v12)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"point != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v25 = NSStringFromSelector(a2);
      v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      *(_DWORD *)id location = 138544642;
      *(void *)&location[4] = v25;
      __int16 v33 = 2114;
      id v34 = v27;
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2114;
      v38 = @"BKSMousePointerService.m";
      __int16 v39 = 1024;
      int v40 = 168;
      __int16 v41 = 2114;
      int v42 = v24;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA456A8);
  }
  uint64_t v14 = v13;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  long long v16 = [MEMORY[0x1E4F29128] UUID];
  objc_initWeak((id *)location, self);
  id v17 = objc_alloc(MEMORY[0x1E4F4F838]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __137__BKSMousePointerService_acquireButtonDownPointerRepositionAssertionForReason_contextRelativePointerPosition_onDisplay_restrictingToPID___block_invoke;
  v28[3] = &unk_1E5440EF0;
  objc_copyWeak(&v31, (id *)location);
  id v18 = v16;
  id v29 = v18;
  id v19 = v14;
  id v30 = v19;
  v20 = (void *)[v17 initWithIdentifier:@"BKSMousePointerService.buttonDownReposition" forReason:v11 invalidationBlock:v28];
  if ((v6 & 0x80000000) != 0)
  {
    id v21 = 0;
  }
  else
  {
    id v21 = [NSNumber numberWithInt:v6];
  }
  v22 = [(BKSMousePointerService *)self _locked_serverTarget];
  [v22 acquireButtonDownPointerRepositionAssertionWithUniqueIdentifier:v18 forReason:v11 contextRelativePointerPosition:v12 onDisplay:v19 restrictingToPID:v21];

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)location);

  return v20;
}

void __137__BKSMousePointerService_acquireButtonDownPointerRepositionAssertionForReason_contextRelativePointerPosition_onDisplay_restrictingToPID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_msgSend(WeakRetained, "_unlocked_serverTarget");
  [v2 invalidateButtonDownPointerRepositionAssertionWithUniqueIdentifier:*(void *)(a1 + 32) onDisplay:*(void *)(a1 + 40)];
}

- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(double)a6 restrictingToPID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  if ((v7 & 0x80000000) != 0)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [NSNumber numberWithInt:v7];
  }
  long long v15 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  long long v16 = [NSNumber numberWithDouble:a6];
  [v15 setContextRelativePointerPosition:v17 withInitialVelocity:v12 onDisplay:v13 withDecelerationRate:v16 restrictingToPID:v14];
}

- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((v6 & 0x80000000) != 0)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [NSNumber numberWithInt:v6];
  }
  id v13 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  [v13 setContextRelativePointerPosition:v14 onDisplay:v10 withAnimationParameters:v11 restrictingToPID:v12];
}

- (void)setPointerPosition:(CGPoint)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  id v10 = a4;
  id v12 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  id v11 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", x, y);
  [v12 setPointerPosition:v11 onDisplay:v10 withAnimationParameters:v9];
}

- (void)setGlobalPointerPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  id v5 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", x, y);
  [v6 setGlobalPointerPosition:v5];
}

- (CGPoint)normalizedGlobalPointerPosition
{
  id v2 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  uint64_t v3 = [v2 normalizedGlobalPointerPosition];

  objc_msgSend(v3, "bs_CGPointValue");
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)globalPointerPosition
{
  id v2 = [(BKSMousePointerService *)self _unlocked_serverTarget];
  uint64_t v3 = [v2 globalPointerPosition];

  objc_msgSend(v3, "bs_CGPointValue");
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_connection)
  {
    double v4 = [NSString stringWithFormat:@"Must be invalidated before deallocation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      double v5 = NSStringFromSelector(a2);
      double v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      id v12 = v7;
      __int16 v13 = 2048;
      id v14 = self;
      __int16 v15 = 2114;
      long long v16 = @"BKSMousePointerService.m";
      __int16 v17 = 1024;
      int v18 = 127;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA45C54);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKSMousePointerService;
  [(BKSMousePointerService *)&v8 dealloc];
}

void __31__BKSMousePointerService__init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  double v5 = objc_msgSend(*(id *)(a1 + 32), "_locked_serverTarget");
  double v6 = NSNumber;
  uint64_t v7 = [v4 isActive];

  objc_super v8 = [v6 numberWithBool:v7];
  [v5 setSuppressAllEvents:v8];

  double v9 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock(v9);
}

- (BKSMousePointerService)init
{
  id v4 = [NSString stringWithFormat:@"init is unsupported -- use +sharedInstance instead"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    double v5 = NSStringFromSelector(a2);
    double v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    long long v16 = @"BKSMousePointerService.m";
    __int16 v17 = 1024;
    int v18 = 93;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  CGPoint result = (BKSMousePointerService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsReadyToReceiveEventServiceProperty
{
  return 1;
}

+ (id)new
{
  id v4 = [NSString stringWithFormat:@"+new is unsupported -- use +sharedInstance instead"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    double v5 = NSStringFromSelector(a2);
    double v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    long long v16 = @"BKSMousePointerService.m";
    __int16 v17 = 1024;
    int v18 = 88;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end