@interface AXPointerDeviceManager
+ (id)sharedInstance;
- (BOOL)containsDragLockCompatibleDevice;
- (BOOL)containsTrackpad;
- (NSArray)connectedDevices;
- (id)_init;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)mousePointerDevicesDidConnect:(id)a3;
- (void)mousePointerDevicesDidDisconnect:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sendUpdateToObservers;
@end

@implementation AXPointerDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_20);
  }
  v2 = (void *)sharedInstance_deviceManager;

  return v2;
}

uint64_t __40__AXPointerDeviceManager_sharedInstance__block_invoke()
{
  sharedInstance_deviceManager = [[AXPointerDeviceManager alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)AXPointerDeviceManager;
  v2 = [(AXPointerDeviceManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_devicesLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    lock_cachedMousePointerDevices = v3->_lock_cachedMousePointerDevices;
    v3->_lock_cachedMousePointerDevices = (NSMutableSet *)v4;

    v3->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v6;

    v8 = [MEMORY[0x1E4F4F350] sharedInstance];
    uint64_t v9 = [v8 addPointerDeviceObserver:v3];
    pointerDeviceObserverAssertion = v3->_pointerDeviceObserverAssertion;
    v3->_pointerDeviceObserverAssertion = (BSInvalidatable *)v9;
  }
  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pointerDeviceObserverAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AXPointerDeviceManager;
  [(AXPointerDeviceManager *)&v3 dealloc];
}

- (NSArray)connectedDevices
{
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  uint64_t v4 = [(NSMutableSet *)self->_lock_cachedMousePointerDevices allObjects];
  os_unfair_lock_unlock(p_devicesLock);

  return (NSArray *)v4;
}

- (BOOL)containsTrackpad
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(AXPointerDeviceManager *)self connectedDevices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "senderDescriptor", (void)v9);
        uint64_t v7 = [v6 hardwareType];

        if (v7 == 9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsDragLockCompatibleDevice
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(AXPointerDeviceManager *)self connectedDevices];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "supportsDragLock", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)sendUpdateToObservers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v4 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  id v5 = [(AXPointerDeviceManager *)self connectedDevices];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "connectedPointerDevicesDidChange:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  p_devicesLock = &self->_devicesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_devicesLock);
  [(NSMutableSet *)self->_lock_cachedMousePointerDevices unionSet:v5];

  os_unfair_lock_unlock(p_devicesLock);

  [(AXPointerDeviceManager *)self sendUpdateToObservers];
}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  p_devicesLock = &self->_devicesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_devicesLock);
  [(NSMutableSet *)self->_lock_cachedMousePointerDevices minusSet:v5];

  os_unfair_lock_unlock(p_devicesLock);

  [(AXPointerDeviceManager *)self sendUpdateToObservers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_cachedMousePointerDevices, 0);

  objc_storeStrong((id *)&self->_pointerDeviceObserverAssertion, 0);
}

@end