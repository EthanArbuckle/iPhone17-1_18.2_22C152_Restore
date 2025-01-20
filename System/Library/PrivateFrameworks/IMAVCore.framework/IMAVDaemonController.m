@interface IMAVDaemonController
+ (id)sharedInstance;
- (BOOL)__isLocalObjectValidOnQueue:(id)a3;
- (BOOL)__isRemoteObjectValidOnQueue:(id)a3;
- (BOOL)_makeConnectionWithCompletionBlock:(id)a3;
- (BOOL)addListenerID:(id)a3;
- (BOOL)hasListenerForID:(id)a3;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)localObjectExists;
- (BOOL)remoteObjectExists;
- (BOOL)removeListenerID:(id)a3;
- (IMAVDaemonController)init;
- (IMAVDaemonListener)listener;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_cleanUpConnection;
- (void)_connectToDaemon;
- (void)_disconnectFromDaemon;
- (void)_listenerSetUpdated;
- (void)_localObjectCleanup;
- (void)_localObjectDiedNotification:(id)a3;
- (void)_noteSetupComplete;
- (void)_remoteObjectCleanup;
- (void)_remoteObjectDiedNotification:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)localObjectDiedNotification:(id)a3;
- (void)remoteObjectDiedNotification:(id)a3;
@end

@implementation IMAVDaemonController

+ (id)sharedInstance
{
  if (qword_26AB796B8 != -1) {
    dispatch_once(&qword_26AB796B8, &unk_26D85A6B0);
  }
  v2 = (void *)qword_26AB796E8;
  return v2;
}

- (IMAVDaemonController)init
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)IMAVDaemonController;
  v2 = [(IMAVDaemonController *)&v29 init];
  if (v2)
  {
    Main = CFRunLoopGetMain();
    memset(&context, 0, 72);
    context.perform = (void (__cdecl *)(void *))nullsub_1;
    v2->_runLoopSource = CFRunLoopSourceCreate(0, 0, &context);
    objc_opt_class();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v4 = (id)*MEMORY[0x263F4A4F0];
    uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v24, (uint64_t)v30, 16);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v4);
          }
          CFRunLoopAddSource(Main, v2->_runLoopSource, *(CFRunLoopMode *)(*((void *)&v24 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v10, (uint64_t)&v24, (uint64_t)v30, 16);
      }
      while (v7);
    }

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.IMAVDaemonControllerQueue", 0);
    remoteMessageQueue = v2->_remoteMessageQueue;
    v2->_remoteMessageQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.IMAVDaemonControllerListenerLockQueue", 0);
    listenerLockQueue = v2->_listenerLockQueue;
    v2->_listenerLockQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.IMAVDaemonControllerAgentLockQueue", 0);
    remoteDaemonLockQueue = v2->_remoteDaemonLockQueue;
    v2->_remoteDaemonLockQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.IMAVDaemonControllerLocalLockQueue", 0);
    localObjectLockQueue = v2->_localObjectLockQueue;
    v2->_localObjectLockQueue = (OS_dispatch_queue *)v19;

    v21 = objc_alloc_init(IMAVDaemonListener);
    daemonListener = v2->_daemonListener;
    v2->_daemonListener = v21;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4);
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, 0, 0);

  connectionLock = self->_connectionLock;
  self->_connectionLock = 0;

  v9.receiver = self;
  v9.super_class = (Class)IMAVDaemonController;
  [(IMAVDaemonController *)&v9 dealloc];
}

- (IMAVDaemonListener)listener
{
  return self->_daemonListener;
}

- (BOOL)__isLocalObjectValidOnQueue:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_224FCAAE8;
  v9[3] = &unk_264711218;
  v9[4] = self;
  v9[5] = &v10;
  v5 = (void (**)(void))MEMORY[0x22A628A90](v9);
  uint64_t v6 = v5;
  if (v4) {
    dispatch_sync(v4, v5);
  }
  else {
    v5[2](v5);
  }
  char v7 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)__isRemoteObjectValidOnQueue:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_224FCAC20;
  v9[3] = &unk_264711218;
  v9[4] = self;
  v9[5] = &v10;
  v5 = (void (**)(void))MEMORY[0x22A628A90](v9);
  uint64_t v6 = v5;
  if (v4) {
    dispatch_sync(v4, v5);
  }
  else {
    v5[2](v5);
  }
  char v7 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)isConnecting
{
  if (self->_acquiringDaemonConnection)
  {
    LOBYTE(isLocalObjectValidOnQueue) = 1;
  }
  else
  {
    int isLocalObjectValidOnQueue = objc_msgSend___isLocalObjectValidOnQueue_(self, a2, (uint64_t)self->_localObjectLockQueue, v2, v3);
    if (isLocalObjectValidOnQueue)
    {
      uint64_t v10 = objc_msgSend_listener(self, v6, v7, v8, v9);
      char isSetupComplete = objc_msgSend_isSetupComplete(v10, v11, v12, v13, v14);

      if (isSetupComplete)
      {
        LOBYTE(isLocalObjectValidOnQueue) = 0;
      }
      else
      {
        remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
        LOBYTE(isLocalObjectValidOnQueue) = objc_msgSend___isRemoteObjectValidOnQueue_(self, v16, (uint64_t)remoteDaemonLockQueue, v17, v18);
      }
    }
  }
  return isLocalObjectValidOnQueue;
}

- (BOOL)isConnected
{
  if (!objc_msgSend___isLocalObjectValidOnQueue_(self, a2, (uint64_t)self->_localObjectLockQueue, v2, v3)) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_listener(self, v5, v6, v7, v8);
  int isSetupComplete = objc_msgSend_isSetupComplete(v9, v10, v11, v12, v13);

  if (!isSetupComplete) {
    return 0;
  }
  remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
  return objc_msgSend___isRemoteObjectValidOnQueue_(self, v15, (uint64_t)remoteDaemonLockQueue, v16, v17);
}

- (void)_noteSetupComplete
{
  CFRunLoopSourceSignal(self->_runLoopSource);
  Main = CFRunLoopGetMain();
  CFRunLoopWakeUp(Main);
}

- (BOOL)remoteObjectExists
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
  if (remoteDaemonLockQueue)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_224FCAE58;
    v5[3] = &unk_264711218;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(remoteDaemonLockQueue, v5);
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)localObjectExists
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  localObjectLockQueue = self->_localObjectLockQueue;
  if (localObjectLockQueue)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_224FCAF34;
    v5[3] = &unk_264711218;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(localObjectLockQueue, v5);
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_localObjectCleanup
{
  localObjectLockQueue = self->_localObjectLockQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FCAFC4;
  block[3] = &unk_264710F40;
  block[4] = self;
  dispatch_sync(localObjectLockQueue, block);
}

- (void)_remoteObjectCleanup
{
  remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FCB0D0;
  block[3] = &unk_264710F40;
  block[4] = self;
  dispatch_sync(remoteDaemonLockQueue, block);
}

- (void)_listenerSetUpdated
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  listenerLockQueue = self->_listenerLockQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FCB2C0;
  block[3] = &unk_264711218;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(listenerLockQueue, block);
  if (*((unsigned char *)v17 + 24))
  {
    uint64_t v4 = sub_224FB12A0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "We have some listeners, make sure we're connected to daemon", v14, 2u);
    }

    objc_msgSend__connectToDaemon(self, v5, v6, v7, v8);
  }
  else
  {
    char v9 = sub_224FB12A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_224F93000, v9, OS_LOG_TYPE_DEFAULT, "No more listeners disconnecting from daemon", v14, 2u);
    }

    objc_msgSend__disconnectFromDaemon(self, v10, v11, v12, v13);
  }
  _Block_object_dispose(&v16, 8);
}

- (BOOL)addListenerID:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Request to add listener with ID: %@", buf, 0xCu);
  }

  uint64_t v13 = objc_msgSend_length(v4, v6, v7, v8, v9);
  if (v13 && (objc_msgSend_hasListenerForID_(self, v10, (uint64_t)v4, v11, v12) & 1) == 0)
  {
    listenerLockQueue = self->_listenerLockQueue;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = sub_224FCB454;
    v23 = &unk_264710AF8;
    long long v24 = self;
    id v25 = v4;
    dispatch_sync(listenerLockQueue, &v20);
    objc_msgSend__listenerSetUpdated(self, v15, v16, v17, v18, v20, v21, v22, v23, v24);
  }
  return v13 != 0;
}

- (BOOL)hasListenerForID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  listenerLockQueue = self->_listenerLockQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FCB5FC;
  block[3] = &unk_264711240;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(listenerLockQueue, block);
  LOBYTE(listenerLockQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)listenerLockQueue;
}

- (BOOL)removeListenerID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Request to remove listener with ID: %@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend_length(v4, v6, v7, v8, v9))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_224FCB7C8;
    block[3] = &unk_264711268;
    block[4] = self;
    id v18 = v4;
    p_long long buf = &buf;
    dispatch_sync(listenerLockQueue, block);
    objc_msgSend__listenerSetUpdated(self, v11, v12, v13, v14);
    BOOL v15 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_makeConnectionWithCompletionBlock:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v5, v6, v7, v8);
  char IsShuttingDown = objc_msgSend_systemIsShuttingDown(v9, v10, v11, v12, v13);

  if (IsShuttingDown) {
    goto LABEL_8;
  }
  BOOL v15 = sub_224FB12A0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_hasCheckedForDaemon) {
      uint64_t v16 = @"YES";
    }
    else {
      uint64_t v16 = @"NO";
    }
    *(_DWORD *)long long buf = 138412290;
    v60 = v16;
    _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "  Ensuring connection to daemon (has checked: %@)", buf, 0xCu);
  }

  if (self->_hasCheckedForDaemon)
  {
LABEL_8:
    BOOL v21 = 0;
  }
  else
  {
    self->_hasCheckedForDaemon = 1;
    if (!self->_listenerID)
    {
      uint64_t v23 = IMGetMainBundleIdentifier();
      if (!objc_msgSend_length(v23, v24, v25, v26, v27))
      {
        uint64_t v32 = objc_msgSend_stringGUID(NSString, v28, v29, v30, v31);

        uint64_t v23 = (void *)v32;
      }
      v33 = (NSString *)objc_msgSend_copy(v23, v28, v29, v30, v31);
      listenerID = self->_listenerID;
      self->_listenerID = v33;
    }
    char v35 = objc_msgSend_remoteObjectExists(self, v17, v18, v19, v20);
    v36 = sub_224FB12A0();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (v37)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_224F93000, v36, OS_LOG_TYPE_DEFAULT, "Remote Object exists, not creating new remote object", buf, 2u);
      }
    }
    else
    {
      if (v37)
      {
        v38 = self->_listenerID;
        *(_DWORD *)long long buf = 138412290;
        v60 = (__CFString *)v38;
        _os_log_impl(&dword_224F93000, v36, OS_LOG_TYPE_DEFAULT, "  Grabbing remote daemon port (listener ID: %@)", buf, 0xCu);
      }

      v43 = objc_msgSend_listener(self, v39, v40, v41, v42);
      objc_msgSend__noteDisconnected(v43, v44, v45, v46, v47);

      v48 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v36 = v48;
      v49 = self->_listenerID;
      if (v49) {
        CFDictionarySetValue(v48, @"listenerID", v49);
      }
      if (_IMWillLog())
      {
        v54 = objc_msgSend_date(MEMORY[0x263EFF910], v50, v51, v52, v53);
        if (v54) {
          CFDictionarySetValue((CFMutableDictionaryRef)v36, @"agentRequested", v54);
        }
      }
      if (objc_msgSend_remoteObjectExists(self, v50, v51, v52, v53))
      {
        if (v4) {
          v4[2](v4);
        }
      }
      else
      {
        localObjectLockQueue = self->_localObjectLockQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_224FCBC44;
        block[3] = &unk_2647112B8;
        block[4] = self;
        v36 = v36;
        v57 = v36;
        v58 = v4;
        dispatch_sync(localObjectLockQueue, block);

        if (qword_2680BEFF0 != -1) {
          dispatch_once(&qword_2680BEFF0, &unk_26D85A6D0);
        }
      }
    }

    BOOL v21 = 1;
  }

  return v21;
}

- (void)_connectToDaemon
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], a2, v2, v3, v4);
  int IsShuttingDown = objc_msgSend_systemIsShuttingDown(v6, v7, v8, v9, v10);

  if (IsShuttingDown)
  {
    uint64_t v16 = sub_224FB12A0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v17, v18, v19, v20);
      int v26 = objc_msgSend_systemIsShuttingDown(v21, v22, v23, v24, v25);
      uint64_t v27 = @"NO";
      if (v26) {
        uint64_t v27 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      v62 = v27;
      _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, "  Connecting to avdaemon (system is shutting down: %@", buf, 0xCu);
    }
  }
  else if ((objc_msgSend_isConnected(self, v12, v13, v14, v15) & 1) != 0 {
         || objc_msgSend_isConnecting(self, v28, v29, v30, v31))
  }
  {
    uint64_t v32 = sub_224FB12A0();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend_isConnected(self, v33, v34, v35, v36)) {
        uint64_t v41 = @"YES";
      }
      else {
        uint64_t v41 = @"NO";
      }
      if (objc_msgSend_isConnecting(self, v37, v38, v39, v40)) {
        uint64_t v42 = @"YES";
      }
      else {
        uint64_t v42 = @"NO";
      }
      *(_DWORD *)long long buf = 138412546;
      v62 = v41;
      __int16 v63 = 2112;
      v64 = v42;
      _os_log_impl(&dword_224F93000, v32, OS_LOG_TYPE_DEFAULT, "  Daemon is connected %@ is connecting %@", buf, 0x16u);
    }
  }
  else
  {
    v43 = sub_224FB12A0();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_224F93000, v43, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, buf, 2u);
    }

    objc_msgSend_lock(self->_connectionLock, v44, v45, v46, v47);
    if ((!objc_msgSend_remoteObjectExists(self, v48, v49, v50, v51)
       || (objc_msgSend___isLocalObjectValidOnQueue_(self, v52, (uint64_t)self->_localObjectLockQueue, v54, v55) & 1) == 0)
      && !self->_acquiringDaemonConnection)
    {
      objc_msgSend__cleanUpConnection(self, v52, v53, v54, v55);
      self->_acquiringDaemonConnection = 1;
      dispatch_suspend((dispatch_object_t)self->_remoteMessageQueue);
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = sub_224FCC5BC;
      v60[3] = &unk_264710F40;
      v60[4] = self;
      v56 = (void *)MEMORY[0x22A628A90](v60);
      if ((objc_msgSend__makeConnectionWithCompletionBlock_(self, v57, (uint64_t)v56, v58, v59) & 1) == 0) {
        self->_acquiringDaemonConnection = 0;
      }
    }
    objc_msgSend_unlock(self->_connectionLock, v52, v53, v54, v55);
  }
}

- (void)_cleanUpConnection
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, v33, 2u);
  }

  *(_WORD *)&self->_hasCheckedForDaemon = 0;
  if ((objc_msgSend_localObjectExists(self, v4, v5, v6, v7) & 1) != 0
    || objc_msgSend_remoteObjectExists(self, v8, v9, v10, v11))
  {
    uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v8, v9, v10, v11);
    objc_msgSend_removeObserver_name_object_(v12, v13, (uint64_t)self, *MEMORY[0x263F4A4E0], 0);

    uint64_t v18 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v14, v15, v16, v17);
    objc_msgSend_removeObserver_name_object_(v18, v19, (uint64_t)self, *MEMORY[0x263F4A4B8], 0);

    objc_msgSend__remoteObjectCleanup(self, v20, v21, v22, v23);
    objc_msgSend__localObjectCleanup(self, v24, v25, v26, v27);
  }
  uint64_t v28 = objc_msgSend_listener(self, v8, v9, v10, v11);
  objc_msgSend__noteDisconnected(v28, v29, v30, v31, v32);
}

- (void)_disconnectFromDaemon
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, v8, 2u);
  }

  objc_msgSend__cleanUpConnection(self, v4, v5, v6, v7);
}

- (void)_localObjectDiedNotification:(id)a3
{
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, " ... disconnection from agent (local) being handled by main thread", v13, 2u);
  }

  objc_msgSend__disconnectFromDaemon(self, v5, v6, v7, v8);
  objc_msgSend__listenerSetUpdated(self, v9, v10, v11, v12);
  byte_2680BEFF8 = 0;
}

- (void)_remoteObjectDiedNotification:(id)a3
{
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, " ... disconnection from agent (remote) being handled by main thread", buf, 2u);
  }

  objc_msgSend__disconnectFromDaemon(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v9, v10, v11, v12);
  char IsShuttingDown = objc_msgSend_systemIsShuttingDown(v13, v14, v15, v16, v17);

  if ((IsShuttingDown & 1) == 0)
  {
    uint64_t v19 = sub_224FB12A0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_224F93000, v19, OS_LOG_TYPE_DEFAULT, "Will auto reconnect...", buf, 2u);
    }

    im_dispatch_after();
  }
}

- (void)localObjectDiedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Disconnected from agent (local)...", v16, 2u);
  }

  uint64_t v10 = objc_msgSend_listener(self, v6, v7, v8, v9);
  objc_msgSend__noteDisconnected(v10, v11, v12, v13, v14);

  byte_2680BEFF8 = 1;
  objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v15, (uint64_t)sel__localObjectDiedNotification_, (uint64_t)v4, 0);
}

- (void)remoteObjectDiedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_listener(self, v5, v6, v7, v8);
  objc_msgSend__noteDisconnected(v9, v10, v11, v12, v13);

  if ((byte_2680BEFF8 & 1) == 0)
  {
    uint64_t v14 = sub_224FB12A0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "Disconnected from agent (remote)...", v16, 2u);
    }

    objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v15, (uint64_t)sel__remoteObjectDiedNotification_, (uint64_t)v4, 0);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  types = protocol_getMethodDescription((Protocol *)&unk_26D872570, a3, 1, 1).types;
  uint64_t v6 = MEMORY[0x263EFF970];
  return (id)MEMORY[0x270F9A6D0](v6, sel_signatureWithObjCTypes_, types, v4, v5);
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isConnected(self, v5, v6, v7, v8))
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = sub_224FCCDD8;
    uint64_t v20 = &unk_264710AF8;
    uint64_t v21 = self;
    id v9 = v4;
    id v22 = v9;
    uint64_t v10 = (void *)MEMORY[0x22A628A90](&v17);
    objc_msgSend_retainArguments(v9, v11, v12, v13, v14, v17, v18, v19, v20, v21);
    dispatch_async((dispatch_queue_t)self->_remoteMessageQueue, v10);

    uint64_t v15 = v22;
LABEL_5:

    goto LABEL_6;
  }
  remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
  if (remoteDaemonLockQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_224FCCCF4;
    block[3] = &unk_264710AF8;
    id v24 = v4;
    uint64_t v25 = self;
    dispatch_sync(remoteDaemonLockQueue, block);
    uint64_t v15 = v24;
    goto LABEL_5;
  }
LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localObjectLockQueue, 0);
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_remoteDaemonLockQueue, 0);
  objc_storeStrong((id *)&self->_listenerLockQueue, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_daemonListener, 0);
  objc_storeStrong((id *)&self->_localObject, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
}

@end