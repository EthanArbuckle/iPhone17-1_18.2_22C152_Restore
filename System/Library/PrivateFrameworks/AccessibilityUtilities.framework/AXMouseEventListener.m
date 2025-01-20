@interface AXMouseEventListener
+ (id)_mouseMatching;
+ (id)sharedInstance;
- (BOOL)_handleMouseButtonEvent:(id)a3;
- (BOOL)currentDevicesHaveAssistiveTouchCustomActions;
- (id)_init;
- (id)discoveredMouseDevices;
- (void)_finishHandlingMouseButtonEvent:(id)a3 buttonMask:(double)a4 creatorHIDServiceClient:(__IOHIDServiceClient *)a5;
- (void)addObserver:(id)a3;
- (void)beginFilteringButtonEvents;
- (void)dealloc;
- (void)deviceMonitorDidDetectDeviceEvent:(id)a3;
- (void)endFilteringButtonEvents;
- (void)mouseSettingsDidChange;
- (void)removeObserver:(id)a3;
@end

@implementation AXMouseEventListener

+ (id)_mouseMatching
{
  return &unk_1EDC63318;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_43);
  }
  v2 = (void *)sharedInstance__Shared;

  return v2;
}

uint64_t __38__AXMouseEventListener_sharedInstance__block_invoke()
{
  id v0 = [[AXMouseEventListener alloc] _init];
  uint64_t v1 = sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_init
{
  v21.receiver = self;
  v21.super_class = (Class)AXMouseEventListener;
  v2 = [(AXMouseEventListener *)&v21 init];
  v3 = v2;
  if (v2)
  {
    v2->_cachedMouseDevicesLock._os_unfair_lock_opaque = 0;
    v2->_observerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = [AXDeviceMonitor alloc];
    v7 = [(id)objc_opt_class() _mouseMatching];
    v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    uint64_t v9 = [(AXDeviceMonitor *)v6 initWithMatchingMultiple:v7 callbackRunLoop:v8];
    deviceMonitor = v3->_deviceMonitor;
    v3->_deviceMonitor = (AXDeviceMonitor *)v9;

    [(AXDeviceMonitor *)v3->_deviceMonitor setDelegate:v3];
    [(AXDeviceMonitor *)v3->_deviceMonitor begin];
    v11 = [[AXEventProcessor alloc] initWithHIDTapIdentifier:@"AXMouseEventListener" HIDEventTapPriority:70 systemEventTapIdentifier:0 systemEventTapPriority:0];
    eventProcessor = v3->_eventProcessor;
    v3->_eventProcessor = v11;

    [(AXEventProcessor *)v3->_eventProcessor setHIDEventFilterMask:16];
    objc_initWeak(&location, v3);
    v13 = v3->_eventProcessor;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __29__AXMouseEventListener__init__block_invoke;
    v18[3] = &unk_1E5588878;
    objc_copyWeak(&v19, &location);
    [(AXEventProcessor *)v13 setHIDEventHandler:v18];
    v14 = +[AXSettings sharedInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __29__AXMouseEventListener__init__block_invoke_2;
    v16[3] = &unk_1E5586A10;
    objc_copyWeak(&v17, &location);
    [v14 registerUpdateBlock:v16 forRetrieveSelector:sel_assistiveTouchMouseCustomizedClickActions withListener:v3];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __29__AXMouseEventListener__init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 3200)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v5 = [WeakRetained _handleMouseButtonEvent:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __29__AXMouseEventListener__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained mouseSettingsDidChange];
}

- (void)dealloc
{
  [(AXEventProcessor *)self->_eventProcessor cleanup];
  [(AXMouseEventListener *)self endFilteringButtonEvents];
  [(AXDeviceMonitor *)self->_deviceMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AXMouseEventListener;
  [(AXMouseEventListener *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_observerLock);
  [(NSHashTable *)self->_observers addObject:v5];
  os_unfair_lock_unlock(&self->_observerLock);
  if (objc_opt_respondsToSelector())
  {
    os_unfair_lock_lock(&self->_cachedMouseDevicesLock);
    NSUInteger v4 = [(NSSet *)self->_cachedMouseDevices count];
    os_unfair_lock_unlock(&self->_cachedMouseDevicesLock);
    if (v4) {
      [v5 mouseDevicesChanged:self];
    }
  }
}

- (void)removeObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (id)discoveredMouseDevices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_cachedMouseDevicesLock = &self->_cachedMouseDevicesLock;
  os_unfair_lock_lock(&self->_cachedMouseDevicesLock);
  cachedMouseDevices = self->_cachedMouseDevices;
  os_unfair_lock_unlock(p_cachedMouseDevicesLock);
  if (!cachedMouseDevices)
  {
    id v5 = [(AXDeviceMonitor *)self->_deviceMonitor copyDevices];
    v6 = [MEMORY[0x1E4F1CA80] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(const void **)(*((void *)&v18 + 1) + 8 * i);
          CFTypeID v13 = CFGetTypeID(v12);
          if (v13 == IOHIDDeviceGetTypeID())
          {
            v14 = +[AXCustomizableMouse mouseForHIDDevice:](AXCustomizableMouse, "mouseForHIDDevice:", v12, (void)v18);
            if (v14 && ![(NSSet *)v6 containsObject:v14]) {
              [(NSSet *)v6 addObject:v14];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    os_unfair_lock_lock(p_cachedMouseDevicesLock);
    v15 = self->_cachedMouseDevices;
    self->_cachedMouseDevices = v6;

    os_unfair_lock_unlock(p_cachedMouseDevicesLock);
  }
  os_unfair_lock_lock(p_cachedMouseDevicesLock);
  v16 = [(NSSet *)self->_cachedMouseDevices allObjects];
  os_unfair_lock_unlock(p_cachedMouseDevicesLock);

  return v16;
}

- (void)beginFilteringButtonEvents
{
}

- (void)endFilteringButtonEvents
{
  if ([(AXEventProcessor *)self->_eventProcessor isHandlingHIDEvents])
  {
    eventProcessor = self->_eventProcessor;
    [(AXEventProcessor *)eventProcessor endHandlingHIDEventsForReason:@"Filtering mouse events for AXMouseEventListener"];
  }
}

- (BOOL)currentDevicesHaveAssistiveTouchCustomActions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(AXMouseEventListener *)self discoveredMouseDevices];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) customActionsRequireAssistiveTouch])
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

- (void)mouseSettingsDidChange
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [(AXMouseEventListener *)self discoveredMouseDevices];
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v3)
  {
    id v22 = obj;
LABEL_35:

    return;
  }
  uint64_t v4 = v3;
  char v5 = 0;
  uint64_t v6 = *(void *)v36;
  v28 = self;
  p_cachedMouseDevicesLock = &self->_cachedMouseDevicesLock;
  long long v8 = obj;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v36 != v6) {
        objc_enumerationMutation(v8);
      }
      long long v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "identifier", v28);
      uint64_t v12 = +[AXCustomizableMouse _existingMouseForIdentifier:vendorId:productId:](AXCustomizableMouse, "_existingMouseForIdentifier:vendorId:productId:", v11, [v10 vendorId], objc_msgSend(v10, "productId"));

      if ([v10 hasCustomActions]) {
        BOOL v13 = v12 == 0;
      }
      else {
        BOOL v13 = 0;
      }
      if (v13)
      {
        long long v19 = ASTLogMouse();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18D308000, v19, OS_LOG_TYPE_INFO, "device removed all custom actions", buf, 2u);
        }

        char v5 = 1;
      }
      else if (v12)
      {
        os_unfair_lock_lock(p_cachedMouseDevicesLock);
        v14 = [v12 buttonMap];
        v15 = [v10 buttonMap];
        char v16 = [v14 isEqualToDictionary:v15];

        if ((v16 & 1) == 0)
        {
          id v17 = ASTLogMouse();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18D308000, v17, OS_LOG_TYPE_INFO, "device updated custom actions", buf, 2u);
          }

          long long v18 = [v12 buttonMap];
          [v10 setButtonMap:v18];

          char v5 = 1;
        }
        os_unfair_lock_unlock(p_cachedMouseDevicesLock);
        long long v8 = obj;
      }
    }
    uint64_t v4 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  }
  while (v4);

  if (v5)
  {
    os_unfair_lock_lock(&v28->_observerLock);
    long long v20 = [(NSHashTable *)v28->_observers allObjects];
    os_unfair_lock_unlock(&v28->_observerLock);
    long long v21 = ASTLogMouse();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v21, OS_LOG_TYPE_INFO, "notifying observers that custom actions did change", buf, 2u);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v27 mouseCustomActionsDidChange:v28];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v24);
    }

    goto LABEL_35;
  }
}

- (void)deviceMonitorDidDetectDeviceEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_cachedMouseDevicesLock = &self->_cachedMouseDevicesLock;
  os_unfair_lock_lock(&self->_cachedMouseDevicesLock);
  cachedMouseDevices = self->_cachedMouseDevices;
  self->_cachedMouseDevices = 0;

  os_unfair_lock_unlock(p_cachedMouseDevicesLock);
  os_unfair_lock_lock(&self->_observerLock);
  uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(&self->_observerLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "mouseDevicesChanged:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)_handleMouseButtonEvent:(id)a3
{
  id v4 = a3;
  char v5 = [v4 pointerControllerInfo];
  uint64_t v6 = [v4 creatorHIDServiceClient];
  BOOL v7 = 0;
  if (v5)
  {
    uint64_t v8 = v6;
    if (v6)
    {
      [v5 pointerButtonMask];
      if (v9 != 0.0
        && (double v10 = v9, [v5 pointerButtonNumber], (uint64_t)v11 == 1)
        && ([v5 pointerButtonClickCount], (uint64_t)v12))
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __48__AXMouseEventListener__handleMouseButtonEvent___block_invoke;
        v14[3] = &unk_1E55889A8;
        v14[4] = self;
        id v15 = v4;
        double v16 = v10;
        uint64_t v17 = v8;
        dispatch_async(MEMORY[0x1E4F14428], v14);

        BOOL v7 = 1;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }

  return v7;
}

uint64_t __48__AXMouseEventListener__handleMouseButtonEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishHandlingMouseButtonEvent:*(void *)(a1 + 40) buttonMask:*(void *)(a1 + 56) creatorHIDServiceClient:*(double *)(a1 + 48)];
}

- (void)_finishHandlingMouseButtonEvent:(id)a3 buttonMask:(double)a4 creatorHIDServiceClient:(__IOHIDServiceClient *)a5
{
  uint64_t v6 = 0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  while (((a4 >> v6) & 1) == 0)
  {
    if (++v6 == 65534) {
      return;
    }
  }
  BOOL v7 = +[AXCustomizableMouse mouseForHIDServiceClient:a5];
  if (v7)
  {
    os_unfair_lock_lock(&self->_observerLock);
    uint64_t v8 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_observerLock);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "mouseEventListener:customizableMouse:interceptedMouseButton:", self, v7, v6 + 1, (void)v15);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedMouseDevices, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);

  objc_storeStrong((id *)&self->_deviceMonitor, 0);
}

@end