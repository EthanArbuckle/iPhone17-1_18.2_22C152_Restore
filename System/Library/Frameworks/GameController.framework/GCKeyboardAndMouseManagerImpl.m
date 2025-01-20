@interface GCKeyboardAndMouseManagerImpl
- (BOOL)addDeviceWithServiceRef:(__IOHIDServiceClient *)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3;
- (GCKeyboard)coalescedKeyboard;
- (GCKeyboardAndMouseManagerImpl)initWithQueue:(id)a3;
- (GCMouse)currentMouse;
- (id)keyboardHIDServices;
- (id)mice;
- (uint64_t)handleHIDEvent:(uint64_t)a3 atTimestamp:(void *)a4 forSubject:;
- (void)_onqueue_addMouse:(uint64_t)a1;
- (void)_onqueue_publishKeyboard:(uint64_t)a1;
- (void)_onqueue_publishMouse:(uint64_t)a1;
- (void)_onqueue_refreshKeyboards;
- (void)_onqueue_removeMouse:(uint64_t)a1;
- (void)_onqueue_unpublishKeyboard:(uint64_t)a1;
- (void)_onqueue_unpublishMouse:(uint64_t)a1;
- (void)removeDeviceWithServiceRef:(__IOHIDServiceClient *)a3;
- (void)setCurrentMouse:(id)a3;
- (void)setKeyboardHIDServices:(void *)a1;
- (void)updateCurrentMouseAfterDisconnecting:(void *)a1;
@end

@implementation GCKeyboardAndMouseManagerImpl

- (GCKeyboardAndMouseManagerImpl)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GCKeyboardAndMouseManagerImpl;
  v6 = [(GCKeyboardAndMouseManager *)&v15 initWithQueue:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_devicesQueue, a3);
    uint64_t v8 = objc_opt_new();
    hidServiceSubjects = v7->_hidServiceSubjects;
    v7->_hidServiceSubjects = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSSet set];
    keyboardHIDServices = v7->_keyboardHIDServices;
    v7->_keyboardHIDServices = (NSSet *)v10;

    uint64_t v12 = objc_opt_new();
    mice = v7->_mice;
    v7->_mice = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (void)_onqueue_refreshKeyboards
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_devicesQueue);
  id v4 = objc_getProperty(self, v3, 40, 1);
  if (![v4 count]) {
    goto LABEL_15;
  }
  id v5 = objc_alloc_init((Class)&off_26D2B4AE0);
  v6 = +[_GCControllerManager sharedInstance];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
        v13 = [_GCKeyboardEventHIDAdapter alloc];
        v14 = -[_GCKeyboardEventHIDAdapter initWithSource:service:](v13, "initWithSource:service:", v6, v12, (void)v20);
        [v5 addObject:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if ((unint64_t)[v5 count] < 2)
  {
    objc_super v15 = [v5 firstObject];
  }
  else
  {
    objc_super v15 = [[_GCKeyboardEventFusion alloc] initWithSources:v5];
  }
  v16 = v15;

  if (!v16)
  {
LABEL_15:
    coalescedKeyboard = self->_coalescedKeyboard;
    if (!coalescedKeyboard)
    {
      v16 = 0;
      goto LABEL_19;
    }
    v17 = coalescedKeyboard;
    -[GCKeyboardAndMouseManagerImpl _onqueue_unpublishKeyboard:]((uint64_t)self, v17);
    objc_setProperty_atomic(self, sel_coalescedKeyboard, 0, 48);
    v16 = 0;
    goto LABEL_17;
  }
  if (!self->_coalescedKeyboard)
  {
    v17 = objc_alloc_init(GCKeyboard);
    objc_setProperty_atomic(self, sel_coalescedKeyboard, v17, 48);
    -[GCKeyboardAndMouseManagerImpl _onqueue_publishKeyboard:]((uint64_t)self, v17);
LABEL_17:
  }
LABEL_19:
  v19 = [(GCKeyboard *)self->_coalescedKeyboard keyboardInput];
  [v19 setKeyboardEventSource:v16];
}

- (id)keyboardHIDServices
{
  if (result) {
    return objc_getProperty(result, a2, 40, 1);
  }
  return result;
}

- (void)_onqueue_publishKeyboard:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __58__GCKeyboardAndMouseManagerImpl__onqueue_publishKeyboard___block_invoke;
    block[3] = &unk_26D22A8C0;
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_onqueue_unpublishKeyboard:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __60__GCKeyboardAndMouseManagerImpl__onqueue_unpublishKeyboard___block_invoke;
    block[3] = &unk_26D22A8C0;
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void __58__GCKeyboardAndMouseManagerImpl__onqueue_publishKeyboard___block_invoke(uint64_t a1)
{
  v2 = _gc_log_keyboard_and_mouse();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCKeyboardDidConnectNotification for keyboard.", v4, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"GCKeyboardDidConnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __60__GCKeyboardAndMouseManagerImpl__onqueue_unpublishKeyboard___block_invoke(uint64_t a1)
{
  v2 = _gc_log_keyboard_and_mouse();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCKeyboardDidDisconnectNotification for keyboard.", v4, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"GCKeyboardDidDisconnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (id)mice
{
  id v3 = objc_opt_new();
  id v4 = self->_mice;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)self->_mice allValues];
  [v3 addObjectsFromArray:v5];

  objc_sync_exit(v4);

  return v3;
}

- (GCMouse)currentMouse
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_currentMouse;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentMouse:(id)a3
{
  id v5 = (GCMouse *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_currentMouse = &v6->_currentMouse;
  currentMouse = v6->_currentMouse;
  if (currentMouse != v5)
  {
    if (currentMouse)
    {
      uint64_t v9 = _gc_log_keyboard_and_mouse();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCKeyboardAndMouseManagerImpl setCurrentMouse:]((uint64_t)&v6->_currentMouse, v9, v10, v11, v12, v13, v14, v15);
      }

      v16 = +[NSNotificationCenter defaultCenter];
      [v16 postNotificationName:@"GCMouseDidStopBeingCurrentNotification" object:*p_currentMouse userInfo:0];
    }
    objc_storeStrong((id *)&v6->_currentMouse, a3);
    v17 = _gc_log_keyboard_and_mouse();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[GCKeyboardAndMouseManagerImpl setCurrentMouse:]((uint64_t)&v6->_currentMouse, v17, v18, v19, v20, v21, v22, v23);
    }

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 postNotificationName:@"GCMouseDidBecomeCurrentNotification" object:*p_currentMouse userInfo:0];
  }
  objc_sync_exit(v6);
}

- (void)updateCurrentMouseAfterDisconnecting:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = objc_msgSend(a1, "mice", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
          if (v10 != v3)
          {
            uint64_t v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) mouseInput];
            [v11 lastEventTimestamp];
            double v13 = v12;
            uint64_t v14 = [v7 mouseInput];
            [v14 lastEventTimestamp];
            double v16 = v15;

            if (v13 >= v16)
            {
              id v17 = v10;

              id v7 = v17;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    id v18 = [a1 currentMouse];

    if (v18 == v3) {
      [a1 setCurrentMouse:v7];
    }
  }
}

- (void)_onqueue_addMouse:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v4 = [*(id *)(a1 + 24) objectForKey:v3];

    if (v4)
    {
      uint64_t v5 = _gc_log_keyboard_and_mouse();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:].cold.4();
      }
    }
    else
    {
      uint64_t v5 = [v3 registryID];
      id v6 = *(id *)(a1 + 16);
      objc_sync_enter(v6);
      id v7 = [*(id *)(a1 + 16) objectForKey:v5];
      objc_sync_exit(v6);

      if (v7)
      {
        uint64_t v8 = (__IOHIDServiceClient *)[v3 service];
        if ((serviceMatchesUsageAndUsagePage(v8, 13, 12) & 1) != 0
          || serviceMatchesUsageAndUsagePage(v8, 13, 5))
        {
          uint64_t v9 = _gc_log_keyboard_and_mouse();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:]();
          }
          uint64_t v10 = 1;
        }
        else
        {
          uint64_t v9 = _gc_log_keyboard_and_mouse();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:]();
          }
          uint64_t v10 = 5;
        }

        uint64_t v11 = IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)[v3 service], @"Product");
        double v12 = [[GCMouse alloc] initWithName:v11 additionalButtons:v10];
        double v13 = [(GCMouse *)v12 mouseInput];
        [v13 setButtonEventSource:v7];
        [v13 setScrollEventSource:v7];
        [v13 setDigitizerEventSource:v7];
        [v13 setPointerEventSource:v7];
        id v14 = *(id *)(a1 + 24);
        objc_sync_enter(v14);
        [*(id *)(a1 + 24) setObject:v12 forKey:v3];
        objc_sync_exit(v14);

        -[GCKeyboardAndMouseManagerImpl _onqueue_publishMouse:](a1, v12);
      }
      else
      {
        uint64_t v11 = _gc_log_keyboard_and_mouse();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:]();
        }
      }
    }
  }
}

- (void)_onqueue_publishMouse:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __55__GCKeyboardAndMouseManagerImpl__onqueue_publishMouse___block_invoke;
    v5[3] = &unk_26D22A8E8;
    id v6 = v3;
    uint64_t v7 = a1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)_onqueue_removeMouse:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v4 = [*(id *)(a1 + 24) objectForKey:v6];
    if (v4)
    {
      id v5 = *(id *)(a1 + 24);
      objc_sync_enter(v5);
      [*(id *)(a1 + 24) removeObjectForKey:v6];
      objc_sync_exit(v5);

      -[GCKeyboardAndMouseManagerImpl _onqueue_unpublishMouse:](a1, v4);
    }

    id v3 = v6;
  }
}

- (void)_onqueue_unpublishMouse:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __57__GCKeyboardAndMouseManagerImpl__onqueue_unpublishMouse___block_invoke;
    v5[3] = &unk_26D22A8E8;
    id v6 = v3;
    uint64_t v7 = a1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

void __55__GCKeyboardAndMouseManagerImpl__onqueue_publishMouse___block_invoke(uint64_t a1)
{
  v2 = _gc_log_keyboard_and_mouse();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCMouseDidConnectNotification for %@.", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setCurrentMouse:*(void *)(a1 + 32)];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"GCMouseDidConnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __57__GCKeyboardAndMouseManagerImpl__onqueue_unpublishMouse___block_invoke(uint64_t a1)
{
  v2 = _gc_log_keyboard_and_mouse();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCMouseDidDisconnectNotification for %@.", (uint8_t *)&v5, 0xCu);
  }

  -[GCKeyboardAndMouseManagerImpl updateCurrentMouseAfterDisconnecting:](*(void **)(a1 + 40), *(void **)(a1 + 32));
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"GCMouseDidDisconnectNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (BOOL)addDeviceWithServiceRef:(__IOHIDServiceClient *)a3
{
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    uint64_t v6 = dispatch_get_current_queue();
    uint64_t v7 = (void *)[objc_alloc((Class)&off_26D2AD0D0) initWithService:a3 queue:v6];
    uint64_t v8 = v7;
    if (v7 && ([v7 registryID], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      hidServiceSubjects = self->_hidServiceSubjects;
      uint64_t v11 = [v8 registryID];
      double v12 = [(NSMutableDictionary *)hidServiceSubjects objectForKey:v11];

      if (!v12)
      {
        LODWORD(v5) = isDeviceKeyboard(a3);
        unsigned int v16 = isDeviceMouse(a3);
        unsigned int v18 = v16;
        if ((v5 & 1) != 0 || v16)
        {
          long long v19 = [v8 registryID];
          long long v20 = objc_opt_new();
          long long v21 = self->_hidServiceSubjects;
          objc_sync_enter(v21);
          [(NSMutableDictionary *)self->_hidServiceSubjects setObject:v20 forKey:v19];
          objc_sync_exit(v21);

          long long v22 = _gc_log_keyboard_and_mouse();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v32 = (__IOHIDServiceClient *)v8;
            __int16 v33 = 1024;
            int v34 = (int)v5;
            __int16 v35 = 1024;
            unsigned int v36 = v18;
            _os_log_impl(&dword_220998000, v22, OS_LOG_TYPE_INFO, "Now tracking %@. Is Keyboard(%{BOOL}d), Mouse(%{BOOL}d)", buf, 0x18u);
          }

          if ((v5 & v18) == 1)
          {
            uint64_t v23 = _gc_log_keyboard_and_mouse();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              -[GCKeyboardAndMouseManagerImpl addDeviceWithServiceRef:]();
            }
          }
        }
        if (v5)
        {
          id v24 = objc_getProperty(self, v17, 40, 1);
          if (([v24 containsObject:v8] & 1) == 0)
          {
            v25 = [v24 setByAddingObject:v8];
            objc_setProperty_atomic_copy(self, v26, v25, 40);

            devicesQueue = self->_devicesQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke;
            block[3] = &unk_26D22A8C0;
            void block[4] = self;
            dispatch_barrier_async(devicesQueue, block);
          }
        }
        if (v18)
        {
          int v5 = self->_devicesQueue;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke_2;
          v28[3] = &unk_26D22A8E8;
          v28[4] = self;
          id v29 = v8;
          dispatch_barrier_async(v5, v28);

          LOBYTE(v5) = 1;
        }
        goto LABEL_13;
      }
      double v13 = _gc_log_keyboard_and_mouse();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[GCKeyboardAndMouseManagerImpl addDeviceWithServiceRef:]();
      }
    }
    else
    {
      id v14 = _gc_log_keyboard_and_mouse();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = a3;
        _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_DEFAULT, "#WARNING Ignoring added HID Service because it returned an invalid registryID:\n%@", buf, 0xCu);
      }
    }
    LOBYTE(v5) = 0;
LABEL_13:

    return (char)v5;
  }
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (void)setKeyboardHIDServices:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic_copy(a1, newValue, newValue, 40);
  }
}

uint64_t __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshKeyboards");
}

void __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke_2(uint64_t a1)
{
}

- (void)removeDeviceWithServiceRef:(__IOHIDServiceClient *)a3
{
  int v5 = (void *)[objc_alloc((Class)&off_26D2AD0D0) initWithService:a3];
  uint64_t v6 = v5;
  if (v5 && ([v5 registryID], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    hidServiceSubjects = self->_hidServiceSubjects;
    uint64_t v9 = [v6 registryID];
    uint64_t v10 = [(NSMutableDictionary *)hidServiceSubjects objectForKey:v9];

    if (v10)
    {
      double v12 = [v6 registryID];
      double v13 = self->_hidServiceSubjects;
      objc_sync_enter(v13);
      [(NSMutableDictionary *)self->_hidServiceSubjects removeObjectForKey:v12];
      objc_sync_exit(v13);

      id v14 = _gc_log_keyboard_and_mouse();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = (__IOHIDServiceClient *)v6;
        _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_INFO, "No longer tracking %@", buf, 0xCu);
      }
    }
    double v15 = objc_getProperty(self, v11, 40, 1);
    if ([v15 containsObject:v6])
    {
      unsigned int v16 = [v15 gc_setByRemovingObject:v6];
      objc_setProperty_atomic_copy(self, v17, v16, 40);

      devicesQueue = self->_devicesQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke;
      block[3] = &unk_26D22A8C0;
      void block[4] = self;
      dispatch_barrier_async(devicesQueue, block);
    }
    long long v19 = self->_devicesQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke_2;
    v20[3] = &unk_26D22A8E8;
    v20[4] = self;
    id v21 = v6;
    dispatch_barrier_async(v19, v20);
  }
  else
  {
    double v15 = _gc_log_keyboard_and_mouse();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = a3;
      _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_DEFAULT, "#WARNING Ignoring removed HID Service because it returned an invalid registryID:\n%@", buf, 0xCu);
    }
  }
}

uint64_t __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshKeyboards");
}

void __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke_2(uint64_t a1)
{
}

- (uint64_t)handleHIDEvent:(uint64_t)a3 atTimestamp:(void *)a4 forSubject:
{
  uint64_t v6 = a4;
  if (!a1) {
    goto LABEL_20;
  }
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    CFArrayRef v8 = Children;
    CFIndex Count = CFArrayGetCount(Children);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      int v11 = 0;
      for (CFIndex i = 0; i != v10; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, i);
        v11 |= -[GCKeyboardAndMouseManagerImpl handleHIDEvent:atTimestamp:forSubject:](a1, ValueAtIndex, a3, v6);
      }
      if (v11) {
        goto LABEL_19;
      }
    }
  }
  int Type = IOHIDEventGetType();
  a1 = 0;
  if (Type > 10)
  {
    if (Type == 11)
    {
      unsigned int v18 = objc_opt_new();
      [v18 setTimestamp:a3];
      IOHIDEventGetFloatValue();
      *(float *)&double v23 = v23;
      [v18 setX:v23];
      IOHIDEventGetFloatValue();
      *(float *)&double v24 = v24;
      [v18 setY:v24];
      -[_GCKeyboardAndMouseEventSubject publishDigitizerEvent:](v6, v18);
    }
    else
    {
      if (Type != 17) {
        goto LABEL_20;
      }
      unsigned int v18 = objc_opt_new();
      [v18 setTimestamp:a3];
      long long v19 = BKSHIDEventGetPointerAttributes();
      long long v20 = v19;
      if (v19)
      {
        [v19 unacceleratedRelativePositionX];
        *(float *)&double v21 = v21;
        [v18 setX:v21];
        [v20 unacceleratedRelativePositionY];
        *(float *)&double v22 = v22;
        [v18 setY:v22];
      }
      -[_GCKeyboardAndMouseEventSubject publishPointerEvent:](v6, v18);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (Type == 2)
  {
    unsigned int v18 = objc_opt_new();
    [v18 setTimestamp:a3];
    [v18 setMask:IOHIDEventGetIntegerValue()];
    -[_GCKeyboardAndMouseEventSubject publishButtonEvent:](v6, v18);
    goto LABEL_18;
  }
  if (Type == 6)
  {
    IOHIDEventGetFloatValue();
    uint64_t v16 = v15;
    IOHIDEventGetFloatValue();
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __71__GCKeyboardAndMouseManagerImpl_handleHIDEvent_atTimestamp_forSubject___block_invoke;
    v26[3] = &unk_26D22AA88;
    uint64_t v28 = v16;
    uint64_t v29 = v17;
    uint64_t v30 = a3;
    v27 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);

LABEL_19:
    a1 = 1;
  }
LABEL_20:

  return a1;
}

void __71__GCKeyboardAndMouseManagerImpl_handleHIDEvent_atTimestamp_forSubject___block_invoke(uint64_t a1)
{
  v2 = +[UIApplication sharedApplication];
  id v22 = [v2 keyWindow];

  uint64_t v3 = [v22 windowScene];
  uint64_t v4 = [v3 interfaceOrientation];

  int v5 = [v22 screen];
  uint64_t v6 = [v5 fixedCoordinateSpace];
  objc_msgSend(v22, "convertPoint:toCoordinateSpace:", v6, CGPointZero.x, CGPointZero.y);
  double v8 = v7;
  double v10 = v9;

  int v11 = [v22 screen];
  double v12 = [v11 fixedCoordinateSpace];
  objc_msgSend(v22, "convertPoint:toCoordinateSpace:", v12, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v14 = v13;
  double v16 = v15;

  if ((unint64_t)(v4 - 1) >= 2) {
    double v17 = v14 - v8;
  }
  else {
    double v17 = v8 - v14;
  }
  if ((unint64_t)(v4 - 1) >= 2) {
    double v18 = v16 - v10;
  }
  else {
    double v18 = v10 - v16;
  }
  long long v19 = objc_opt_new();
  [v19 setTimestamp:*(void *)(a1 + 56)];
  *(float *)&double v20 = v17;
  [v19 setX:v20];
  *(float *)&double v21 = v18;
  [v19 setY:v21];
  -[_GCKeyboardAndMouseEventSubject publishScrollEvent:](*(void **)(a1 + 32), v19);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3
{
  int Type = IOHIDEventGetType();
  uint64_t SenderID = IOHIDEventGetSenderID();
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  if (Type == 11 && _DescendantPointerEvent((uint64_t)a3)) {
    uint64_t SenderID = IOHIDEventGetSenderID();
  }
  double v8 = self->_hidServiceSubjects;
  objc_sync_enter(v8);
  hidServiceSubjects = self->_hidServiceSubjects;
  double v10 = +[NSNumber numberWithUnsignedLongLong:SenderID];
  int v11 = [(NSMutableDictionary *)hidServiceSubjects objectForKey:v10];

  objc_sync_exit(v8);
  if (v11 && IOHIDEventGetType() == 11) {
    char v12 = -[GCKeyboardAndMouseManagerImpl handleHIDEvent:atTimestamp:forSubject:]((uint64_t)self, (uint64_t)a3, TimeStamp, v11);
  }
  else {
    char v12 = 0;
  }

  return v12;
}

- (GCKeyboard)coalescedKeyboard
{
  return (GCKeyboard *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedKeyboard, 0);
  objc_storeStrong((id *)&self->_keyboardHIDServices, 0);
  objc_storeStrong((id *)&self->_currentMouse, 0);
  objc_storeStrong((id *)&self->_mice, 0);
  objc_storeStrong((id *)&self->_hidServiceSubjects, 0);

  objc_storeStrong((id *)&self->_devicesQueue, 0);
}

- (void)setCurrentMouse:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setCurrentMouse:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_onqueue_addMouse:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_220998000, v0, v1, "#NOTE Not currently tracking added mouse HID service %@.  It may have already disconnected.", v2, v3, v4, v5, v6);
}

- (void)_onqueue_addMouse:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_220998000, v0, v1, "%@ is Magic mouse or Magic trackpad!", v2, v3, v4, v5, v6);
}

- (void)_onqueue_addMouse:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_220998000, v0, v1, "%@ is normal mouse device!", v2, v3, v4, v5, v6);
}

- (void)_onqueue_addMouse:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_220998000, v0, v1, "#NOTE Added HID service %@ is already tracked as a mouse.", v2, v3, v4, v5, v6);
}

- (void)addDeviceWithServiceRef:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_220998000, v0, v1, "HID Service has both keyboard and mouse profiles at the same time:\n%@", v2, v3, v4, v5, v6);
}

- (void)addDeviceWithServiceRef:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_220998000, v0, v1, "#NOTE Already tracking HID service: %@", v2, v3, v4, v5, v6);
}

@end