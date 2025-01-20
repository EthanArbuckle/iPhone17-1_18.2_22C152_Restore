@interface _IMLegacyDaemonController
+ (BOOL)_applicationWillTerminate;
+ (void)_setApplicationWillTerminate;
- (BOOL)__isLocalObjectValidOnQueue:(id)a3;
- (BOOL)__isRemoteObjectValid;
- (BOOL)_acquiringDaemonConnection;
- (BOOL)_autoReconnect;
- (BOOL)_blocksConnectionAtResume;
- (BOOL)_makeConnectionWithLaunch:(BOOL)a3 completionBlock:(id)a4;
- (BOOL)acquiringDaemonConnection;
- (BOOL)addListenerID:(id)a3 capabilities:(unsigned int)a4;
- (BOOL)connectToDaemon;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5;
- (BOOL)consumeQueryContext:(id)a3;
- (BOOL)hasBeenSuspended;
- (BOOL)hasCheckedForDaemon;
- (BOOL)hasListenerForID:(id)a3;
- (BOOL)inBlockingConnect;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isRequestingConnection;
- (BOOL)localObjectExists;
- (BOOL)preventReconnect;
- (BOOL)remoteObjectExists;
- (BOOL)removeListenerID:(id)a3;
- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4;
- (IMDaemonListener)listener;
- (IMDaemonProtocol)remoteDaemon;
- (IMDaemonProtocol)remoteObject;
- (IMDaemonProtocol)replyingRemoteDaemon;
- (IMDaemonProtocol)synchronousRemoteDaemon;
- (IMDaemonProtocol)synchronousReplyingRemoteDaemon;
- (IMDaemonQueryController)queryController;
- (IMLocalObject)localObject;
- (NSArray)_servicesToAllow;
- (NSArray)_servicesToDeny;
- (NSLock)blockingLock;
- (NSMutableArray)services;
- (NSMutableDictionary)listenerMap;
- (NSProtocolChecker)protocol;
- (NSRecursiveLock)connectionLock;
- (NSString)listenerID;
- (OS_dispatch_queue)daemonConnectionQueue;
- (OS_dispatch_queue)listenerLockQueue;
- (OS_dispatch_queue)localObjectLockQueue;
- (OS_dispatch_queue)remoteMessageQueue;
- (_IMLegacyDaemonController)init;
- (__CFRunLoopSource)runLoopSource;
- (double)_connectionTimeout;
- (id)_remoteObject;
- (id)delegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (os_unfair_recursive_lock_s)remoteDaemonLock;
- (unint64_t)processCapabilities;
- (unsigned)_capabilities;
- (unsigned)cachedCapabilities;
- (unsigned)capabilities;
- (unsigned)capabilitiesForListenerID:(id)a3;
- (unsigned)gMyFZListenerCapabilities;
- (unsigned)lastUpdatedCapabilities;
- (void)__setCapabilities:(unsigned int)a3;
- (void)_agentDidLaunchNotification:(id)a3;
- (void)_blockUntilSendQueueIsEmpty;
- (void)_connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4;
- (void)_disconnectFromDaemonWithForce:(BOOL)a3;
- (void)_handleDaemonException:(id)a3;
- (void)_listenerSetUpdated;
- (void)_localObjectCleanup;
- (void)_noteSetupComplete;
- (void)_remoteObjectCleanup;
- (void)_setAutoReconnect:(BOOL)a3;
- (void)_setBlocksConnectionAtResume:(BOOL)a3;
- (void)_setCapabilities:(unsigned int)a3;
- (void)_setListenerID:(id)a3;
- (void)_setServicesToAllow:(id)a3;
- (void)_setServicesToDeny:(id)a3;
- (void)blockUntilConnected;
- (void)dealloc;
- (void)disconnectFromDaemonWithForce:(BOOL)a3;
- (void)forwardInvocation:(id)a3;
- (void)killDaemon;
- (void)listener:(id)a3 setListenerCapabilities:(unsigned int)a4;
- (void)listener:(id)a3 setValue:(id)a4 ofPersistentProperty:(id)a5;
- (void)listener:(id)a3 setValue:(id)a4 ofProperty:(id)a5;
- (void)localObjectDiedNotification:(id)a3;
- (void)remoteObjectDiedNotification:(id)a3;
- (void)sendQueryWithReply:(BOOL)a3 query:(id)a4;
- (void)setAcquiringDaemonConnection:(BOOL)a3;
- (void)setBlockingLock:(id)a3;
- (void)setCachedCapabilities:(unsigned int)a3;
- (void)setConnectionLock:(id)a3;
- (void)setDaemonConnectionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGMyFZListenerCapabilities:(unsigned int)a3;
- (void)setHasBeenSuspended:(BOOL)a3;
- (void)setHasCheckedForDaemon:(BOOL)a3;
- (void)setInBlockingConnect:(BOOL)a3;
- (void)setLastUpdatedCapabilities:(unsigned int)a3;
- (void)setListener:(id)a3;
- (void)setListenerLockQueue:(id)a3;
- (void)setListenerMap:(id)a3;
- (void)setLocalObject:(id)a3;
- (void)setLocalObjectLockQueue:(id)a3;
- (void)setPreventReconnect:(BOOL)a3;
- (void)setProtocol:(id)a3;
- (void)setQueryContext:(id)a3;
- (void)setRemoteDaemonLock:(os_unfair_recursive_lock_s)a3;
- (void)setRemoteObject:(id)a3;
- (void)setRunLoopSource:(__CFRunLoopSource *)a3;
- (void)setServices:(id)a3;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationDidResume;
- (void)systemApplicationDidSuspend;
- (void)systemApplicationWillEnterForeground;
- (void)unsetQueryContext:(id)a3;
@end

@implementation _IMLegacyDaemonController

- (_IMLegacyDaemonController)init
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)_IMLegacyDaemonController;
  v2 = [(_IMLegacyDaemonController *)&v55 init];
  uint64_t v5 = (uint64_t)v2;
  if (v2)
  {
    objc_msgSend__setAutoReconnect_(v2, v3, 1, v4);
    Main = CFRunLoopGetMain();
    memset(&context, 0, 72);
    context.perform = (void (__cdecl *)(void *))nullsub_6;
    *(void *)(v5 + 176) = CFRunLoopSourceCreate(0, 0, &context);
    objc_opt_class();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v7 = (id)*MEMORY[0x1E4F6C278];
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v50, (uint64_t)v56, 16);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v7);
          }
          CFRunLoopAddSource(Main, *(CFRunLoopSourceRef *)(v5 + 176), *(CFRunLoopMode *)(*((void *)&v50 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v50, (uint64_t)v56, 16);
      }
      while (v10);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v15 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.IMDaemonControllerLocalLockQueue", 0);
    v17 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.IMDaemonControllerQueue", 0);
    v19 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.IMDaemonControllerListenerLockQueue", 0);
    v21 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v20;

    *(void *)(v5 + 144) = 0;
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.IMDaemonControllerConnectionQueue", 0);
    v23 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v22;

    id v24 = objc_alloc(MEMORY[0x1E4F28FA8]);
    uint64_t v27 = objc_msgSend_initWithProtocol_(v24, v25, (uint64_t)&unk_1EF968410, v26, (void)v50);
    v28 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v27;

    v29 = [IMReplyingRemoteDaemonProxy alloc];
    uint64_t v31 = objc_msgSend_initWithDaemonController_synchronousReplies_(v29, v30, v5, 1);
    v32 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v31;

    v33 = [IMReplyingRemoteDaemonProxy alloc];
    uint64_t v35 = objc_msgSend_initWithDaemonController_synchronousReplies_(v33, v34, v5, 0);
    v36 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v35;

    v37 = [IMDaemonQueryController alloc];
    uint64_t v40 = objc_msgSend_initWithDaemonController_(v37, v38, v5, v39);
    v41 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v40;

    v42 = objc_alloc_init(_IMLegacyDaemonListener);
    v43 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v42;

    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v45 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v44;

    objc_msgSend___setCapabilities_((void *)v5, v46, *MEMORY[0x1E4F6C4F0], v47);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)v5, (CFNotificationCallback)sub_1A4B6FA4C, (CFStringRef)*MEMORY[0x1E4F6C488], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return (_IMLegacyDaemonController *)v5;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F6C488], 0);
  uint64_t v12 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v9, v10, v11);
  objc_msgSend_removeListener_(v12, v13, (uint64_t)self, v14);

  dispatch_queue_t v18 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v15, v16, v17);
  objc_msgSend_removeObserver_name_object_(v18, v19, (uint64_t)self, 0, 0);

  objc_msgSend__localObjectCleanup(self, v20, v21, v22);
  objc_msgSend__remoteObjectCleanup(self, v23, v24, v25);
  connectionLock = self->_connectionLock;
  self->_connectionLock = 0;

  v27.receiver = self;
  v27.super_class = (Class)_IMLegacyDaemonController;
  [(_IMLegacyDaemonController *)&v27 dealloc];
}

- (void)_agentDidLaunchNotification:(id)a3
{
  if (!self->_preventReconnect)
  {
    self->_hasCheckedForDaemon = 0;
    objc_msgSend__disconnectFromDaemonWithForce_(self, a2, 1, v3);
    objc_msgSend_connectToDaemonWithLaunch_(self, v5, 0, v6);
  }
}

- (void)_handleDaemonException:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Exception returned from daemon: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)_makeConnectionWithLaunch:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v7, v8, v9);
  if ((objc_msgSend_systemIsShuttingDown(v10, v11, v12, v13) & 1) != 0
    || self->_hasBeenSuspended && (objc_msgSend__blocksConnectionAtResume(self, v14, v15, v16) & 1) != 0)
  {

LABEL_17:
    BOOL v23 = 0;
    goto LABEL_18;
  }
  char v17 = IMIsRunningOnAudioAccessory();

  if (v17) {
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    dispatch_queue_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = @"NO";
      if (v4) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      if (self->_hasCheckedForDaemon) {
        uint64_t v21 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "  Ensuring connection to daemon (will launch: %@   has checked: %@)", buf, 0x16u);
    }
  }
  if (self->_hasCheckedForDaemon && !v4) {
    goto LABEL_17;
  }
  self->_hasCheckedForDaemon = 1;
  if (!self->_listenerID)
  {
    uint64_t v25 = IMGetMainBundleIdentifier();
    if (!objc_msgSend_length(v25, v26, v27, v28))
    {
      uint64_t v32 = objc_msgSend_stringGUID(NSString, v29, v30, v31);

      uint64_t v25 = (void *)v32;
    }
    listenerID = self->_listenerID;
    self->_listenerID = (NSString *)v25;
  }
  if ((!objc_msgSend___isLocalObjectValidOnQueue_(self, v18, (uint64_t)self->_localObjectLockQueue, v19)
     || (objc_msgSend___isRemoteObjectValid(self, v34, v35, v36) & 1) == 0)
    && !self->_requestingConnection)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = self->_listenerID;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v41;
        _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "  Grabbing remote daemon port (listener ID: %@)", buf, 0xCu);
      }
    }
    v42 = objc_msgSend_listener(self, v37, v38, v39);
    objc_msgSend__noteDisconnected(v42, v43, v44, v45);

    self->_lastUpdatedCapabilities = 0;
    objc_msgSend__localObjectCleanup(self, v46, v47, v48);
    v49 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v50 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v54 = objc_msgSend_sharedInstance(IMDaemonController, v51, v52, v53);
    v58 = objc_msgSend_listener(v54, v55, v56, v57);
    v61 = objc_msgSend__stampForContext_(v58, v59, @"fileTransfers", v60);

    if (v61) {
      CFDictionarySetValue(v50, @"fileTransfers", v61);
    }

    v65 = objc_msgSend_sharedInstance(IMDaemonController, v62, v63, v64);
    v69 = objc_msgSend_listener(v65, v66, v67, v68);
    v72 = objc_msgSend__stampForContext_(v69, v70, @"DBModificationStamp", v71);

    if (v72) {
      CFDictionarySetValue(v50, @"chatContext", v72);
    }

    if (v50) {
      CFDictionarySetValue(v49, @"context", v50);
    }
    v75 = self->_listenerID;
    if (v75) {
      CFDictionarySetValue(v49, @"listenerID", v75);
    }
    v76 = objc_msgSend__servicesToAllow(self, v73, (uint64_t)v75, v74);
    if (v76) {
      CFDictionarySetValue(v49, @"allowedServices", v76);
    }

    v80 = objc_msgSend__servicesToDeny(self, v77, v78, v79);
    if (v80) {
      CFDictionarySetValue(v49, @"deniedServices", v80);
    }

    v81 = NSNumber;
    uint64_t v85 = objc_msgSend_capabilities(self, v82, v83, v84);
    v88 = objc_msgSend_numberWithUnsignedInt_(v81, v86, v85, v87);
    if (v88) {
      CFDictionarySetValue(v49, @"capabilities", v88);
    }

    v91 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v89, 0, v90);
    if (v91) {
      CFDictionarySetValue(v49, @"vcCapabilities", v91);
    }

    v92 = IMGetMainBundleIdentifier();
    if (v92) {
      CFDictionarySetValue(v49, @"bundleID", v92);
    }

    if (objc_msgSend_remoteObjectExists(self, v93, v94, v95))
    {
      v99 = objc_msgSend_mainThread(MEMORY[0x1E4F29060], v96, v97, v98);
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = sub_1A4B712E4;
      v115[3] = &unk_1E5B7AE90;
      id v116 = v6;
      objc_msgSend___im_performBlock_modes_(v99, v100, (uint64_t)v115, *MEMORY[0x1E4F6C278]);
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v123 = sub_1A4B3447C;
      v124 = sub_1A4B34324;
      id v125 = 0;
      self->_requestingConnection = 1;
      localObjectLockQueue = self->_localObjectLockQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4B70A14;
      block[3] = &unk_1E5B7BD30;
      BOOL v121 = v4;
      v120 = buf;
      block[4] = self;
      v118 = v49;
      id v119 = v6;
      dispatch_sync(localObjectLockQueue, block);

      _Block_object_dispose(buf, 8);
      if ((IMIsRunningInMobileSMS() & 1) == 0)
      {
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = sub_1A4B712F4;
        v114[3] = &unk_1E5B7ACD0;
        v114[4] = self;
        if (qword_1EB3F22D0 != -1) {
          dispatch_once(&qword_1EB3F22D0, v114);
        }
      }
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      char v103 = objc_opt_respondsToSelector();

      if (v103)
      {
        id v107 = objc_loadWeakRetained(&self->_delegate);
        objc_msgSend_performSelector_withObject_(v107, v108, (uint64_t)sel_daemonControllerWillConnect, 0);
      }
      if ((objc_msgSend__hidingDisconnect(self->_daemonListener, v104, v105, v106) & 1) == 0)
      {
        v112 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v109, v110, v111);
        objc_msgSend___mainThreadPostNotificationName_object_(v112, v113, @"__kIMDaemonWillConnectNotification", 0);
      }
    }
  }
  BOOL v23 = 1;
LABEL_18:

  return v23;
}

+ (BOOL)_applicationWillTerminate
{
  return byte_1E965E860;
}

- (void)_blockUntilSendQueueIsEmpty
{
  int v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], a2, v2, v3);
  char IsShuttingDown = objc_msgSend_systemIsShuttingDown(v5, v6, v7, v8);

  if ((IsShuttingDown & 1) == 0 && !self->_acquiringDaemonConnection)
  {
    remoteMessageQueue = self->_remoteMessageQueue;
    if (remoteMessageQueue) {
      dispatch_sync(remoteMessageQueue, &unk_1EF8E5218);
    }
    objc_msgSend_defaultBroadcaster(MEMORY[0x1E4F6C3C8], v10, v11, v12);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_blockUntilSendQueueIsEmpty(v17, v14, v15, v16);
  }
}

- (void)killDaemon
{
  int v5 = objc_msgSend_defaultBroadcaster(MEMORY[0x1E4F6C3C8], a2, v2, v3);
  objc_msgSend_blockUntilSendQueueIsEmpty(v5, v6, v7, v8);

  MEMORY[0x1F4181798](self, sel_terminateForcingIfNeeded_, 1, v9);
}

+ (void)_setApplicationWillTerminate
{
  byte_1E965E860 = 1;
  objc_msgSend__blockUntilSendQueueIsEmpty(_IMLegacyDaemonController, a2, v2, v3);
}

- (void)disconnectFromDaemonWithForce:(BOOL)a3
{
}

- (void)_disconnectFromDaemonWithForce:(BOOL)a3
{
  aBlock[12] = *MEMORY[0x1E4F143B8];
  self->_hasCheckedForDaemon = 0;
  self->_lastUpdatedCapabilities = 0;
  objc_msgSend_lock(self->_connectionLock, a2, a3, v3);
  if (self->_acquiringDaemonConnection)
  {
    self->_acquiringDaemonConnection = 0;
    dispatch_resume((dispatch_object_t)self->_remoteMessageQueue);
  }
  objc_msgSend_unlock(self->_connectionLock, v6, v7, v8);
  if ((objc_msgSend_localObjectExists(self, v9, v10, v11) & 1) != 0
    || objc_msgSend_remoteObjectExists(self, v12, v13, v14))
  {
    if (!a3) {
      objc_msgSend__blockUntilSendQueueIsEmpty(_IMLegacyDaemonController, v12, v13, v14);
    }
    uint64_t v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
    objc_msgSend_removeObserver_name_object_(v15, v16, (uint64_t)self, *MEMORY[0x1E4F6C268], 0);

    dispatch_queue_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19);
    objc_msgSend_removeObserver_name_object_(v20, v21, (uint64_t)self, *MEMORY[0x1E4F6C1D8], 0);

    objc_msgSend__remoteObjectCleanup(self, v22, v23, v24);
    objc_msgSend__localObjectCleanup(self, v25, v26, v27);
    if (!a3) {
      self->_preventReconnect = 1;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4B719A0;
    aBlock[3] = &unk_1E5B7ACD0;
    aBlock[4] = self;
    uint64_t v28 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v32 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
    objc_msgSend___mainThreadPostNotificationName_object_(v32, v33, @"__k_IMDaemonDidDisconnectNotification", 0);

    v37 = objc_msgSend_listener(self, v34, v35, v36);
    objc_msgSend__setHidingDisconnect_(v37, v38, 1, v39);

    if (objc_msgSend__autoReconnect(self, v40, v41, v42)) {
      im_dispatch_after();
    }
    else {
      v28[2](v28);
    }
  }
  v43 = objc_msgSend_listener(self, v12, v13, v14);
  objc_msgSend__noteDisconnected(v43, v44, v45, v46);
}

- (void)_connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      if (v5) {
        uint64_t v14 = @"YES";
      }
      else {
        uint64_t v14 = @"NO";
      }
      if (!v4) {
        objc_msgSend_capabilities(self, v11, v12, v13);
      }
      uint64_t v15 = _IMStringFromFZListenerCapabilities();
      *(_DWORD *)buf = 138412546;
      v49 = v14;
      __int16 v50 = 2112;
      long long v51 = v15;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "Connect to daemon with launch: %@   capabilities: %@", buf, 0x16u);
    }
  }
  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v7, v8, v9);
  if (objc_msgSend_systemIsShuttingDown(v16, v17, v18, v19))
  {

    return;
  }
  if (self->_hasBeenSuspended)
  {
    char v23 = objc_msgSend__blocksConnectionAtResume(self, v20, v21, v22);

    if (v23) {
      return;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      _IMStringFromFZListenerCapabilities();
      uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v27;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_DEBUG, "Connect:  Set capabilities: %@", buf, 0xCu);
    }
  }
  objc_msgSend__setCapabilities_(self, v24, v4, v25);
  if ((objc_msgSend_isConnected(self, v28, v29, v30) & 1) == 0
    && (objc_msgSend_isConnecting(self, v31, v32, v33) & 1) == 0)
  {
    objc_msgSend_lock(self->_connectionLock, v34, v35, v36);
    if (!objc_msgSend_remoteObjectExists(self, v37, v38, v39)
      || (objc_msgSend___isLocalObjectValidOnQueue_(self, v40, (uint64_t)self->_localObjectLockQueue, v42) & 1) == 0)
    {
      self->_preventReconnect = 0;
      if (!self->_services)
      {
        v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        services = self->_services;
        self->_services = v43;
      }
      if (!self->_acquiringDaemonConnection)
      {
        self->_acquiringDaemonConnection = 1;
        dispatch_suspend((dispatch_object_t)self->_remoteMessageQueue);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1A4B722E0;
        aBlock[3] = &unk_1E5B7ACD0;
        aBlock[4] = self;
        uint64_t v45 = _Block_copy(aBlock);
        if ((objc_msgSend__makeConnectionWithLaunch_completionBlock_(self, v46, v5, (uint64_t)v45) & 1) == 0
          && self->_acquiringDaemonConnection)
        {
          self->_acquiringDaemonConnection = 0;
          dispatch_resume((dispatch_object_t)self->_remoteMessageQueue);
        }
      }
    }
    objc_msgSend_unlock(self->_connectionLock, v40, v41, v42);
  }
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  return 1;
}

- (BOOL)connectToDaemon
{
  return objc_msgSend_connectToDaemonWithLaunch_(self, a2, 1, v2);
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  BOOL v5 = a5;
  objc_msgSend__connectToDaemonWithLaunch_capabilities_(self, a2, a3, *(uint64_t *)&a4);
  if (!v5) {
    return 1;
  }
  objc_msgSend_blockUntilConnected(self, v7, v8, v9);

  return objc_msgSend_isConnected(self, v10, v11, v12);
}

- (IMDaemonProtocol)remoteDaemon
{
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Invoking -remoteDaemon on legacy daemon controller", v9, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_replyingRemoteDaemon(self, v3, v4, v5);

  return (IMDaemonProtocol *)v7;
}

- (IMDaemonProtocol)synchronousRemoteDaemon
{
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Invoking -synchronousRemoteDaemon on legacy daemon controller", v9, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_synchronousReplyingRemoteDaemon(self, v3, v4, v5);

  return (IMDaemonProtocol *)v7;
}

- (void)_listenerSetUpdated
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend_capabilities(self, a2, v2, v3);
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  self->_cachedCapabilities = 0;
  listenerLockQueue = self->_listenerLockQueue;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1A4B7290C;
  v39[3] = &unk_1E5B7BD58;
  v39[4] = self;
  v39[5] = &v40;
  dispatch_sync(listenerLockQueue, v39);
  if (*((unsigned char *)v41 + 24))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        listenerMap = self->_listenerMap;
        _IMStringFromFZListenerCapabilities();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_capabilities(self, v13, v14, v15);
        uint64_t v16 = _IMStringFromFZListenerCapabilities();
        *(_DWORD *)buf = 138412802;
        uint64_t v45 = listenerMap;
        __int16 v46 = 2112;
        id v47 = v12;
        __int16 v48 = 2112;
        v49 = v16;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Connecting: Listener set updated to: %@ old capabilities: %@ new capabilities: %@", buf, 0x20u);
      }
    }
    if (v5 != objc_msgSend_capabilities(self, v7, v8, v9))
    {
      dispatch_queue_t v20 = objc_msgSend_listener(self, v17, v18, v19);
      objc_msgSend__resetPostedSetupCompleted(v20, v21, v22, v23);
    }
    objc_msgSend__setAutoReconnect_(self, v17, 1, v19);
    uint64_t v27 = objc_msgSend_capabilities(self, v24, v25, v26);
    objc_msgSend_connectToDaemonWithLaunch_capabilities_blockUntilConnected_(self, v28, 1, v27, 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = self->_listenerMap;
        objc_msgSend_capabilities(self, v32, v33, v34);
        uint64_t v36 = _IMStringFromFZListenerCapabilities();
        *(_DWORD *)buf = 138412546;
        uint64_t v45 = v35;
        __int16 v46 = 2112;
        id v47 = v36;
        _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Disconnecting: Listener set updated to: %@   capabilities: %@", buf, 0x16u);
      }
    }
    objc_msgSend__setAutoReconnect_(self, v29, 0, v30);
    objc_msgSend__disconnectFromDaemonWithForce_(self, v37, 0, v38);
  }
  _Block_object_dispose(&v40, 8);
}

- (BOOL)addListenerID:(id)a3 capabilities:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (objc_msgSend_length(v6, v7, v8, v9))
  {
    if (objc_msgSend_hasListenerForID_(self, v10, (uint64_t)v6, v11))
    {
      char v13 = objc_msgSend_setCapabilities_forListenerID_(self, v12, v4, (uint64_t)v6);
    }
    else
    {
      listenerLockQueue = self->_listenerLockQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4B72A40;
      block[3] = &unk_1E5B7BD80;
      block[4] = self;
      id v20 = v6;
      int v21 = v4;
      dispatch_sync(listenerLockQueue, block);
      objc_msgSend__listenerSetUpdated(self, v15, v16, v17);

      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)hasListenerForID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  listenerLockQueue = self->_listenerLockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B72C64;
  block[3] = &unk_1E5B7BDA8;
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
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4B72DD8;
    block[3] = &unk_1E5B7BDD0;
    block[4] = self;
    id v15 = v4;
    uint64_t v16 = &v17;
    dispatch_sync(listenerLockQueue, block);
    if (*((unsigned char *)v18 + 24))
    {
      objc_msgSend__listenerSetUpdated(self, v9, v10, v11);
      BOOL v12 = *((unsigned char *)v18 + 24) != 0;
    }
    else
    {
      BOOL v12 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    int v20 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4B730CC;
    block[3] = &unk_1E5B7BDA8;
    uint64_t v16 = &v17;
    block[4] = self;
    id v15 = v4;
    dispatch_sync(listenerLockQueue, block);
    unsigned int v12 = *((_DWORD *)v18 + 6);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    unsigned int v12 = objc_msgSend_capabilities(self, v8, v9, v10);
  }

  return v12;
}

- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (objc_msgSend_length(v6, v7, v8, v9) && objc_msgSend_hasListenerForID_(self, v10, (uint64_t)v6, v11))
  {
    if (!a3 || objc_msgSend_capabilitiesForListenerID_(self, v12, (uint64_t)v6, v13) != a3)
    {
      if (IMOSLoggingEnabled())
      {
        char v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = _IMStringFromFZListenerCapabilities();
          *(_DWORD *)buf = 138412546;
          uint64_t v26 = v15;
          __int16 v27 = 2112;
          id v28 = v6;
          _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Set capabilities: %@  for listener ID: %@", buf, 0x16u);
        }
      }
      listenerLockQueue = self->_listenerLockQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4B732F4;
      block[3] = &unk_1E5B7BD80;
      block[4] = self;
      unsigned int v24 = a3;
      id v23 = v6;
      dispatch_sync(listenerLockQueue, block);
      objc_msgSend__listenerSetUpdated(self, v17, v18, v19);
    }
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (unint64_t)processCapabilities
{
  return objc_msgSend_capabilities(self, a2, v2, v3);
}

- (id)_remoteObject
{
  return self->_remoteObject;
}

- (void)_setBlocksConnectionAtResume:(BOOL)a3
{
  if (self->__blocksConnectionAtResume != a3)
  {
    BOOL v4 = a3;
    self->__blocksConnectionAtResume = a3;
    id v6 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], a2, a3, v3);
    id v19 = v6;
    if (v4)
    {
      char isActive = objc_msgSend_isActive(v6, v7, v8, v9);

      if ((isActive & 1) == 0)
      {
        char v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v11, v12, v13);
        objc_msgSend_setActive_(v14, v15, 1, v16);
      }
      objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v11, v12, v13);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend__addEarlyListener_(v19, v17, (uint64_t)self, v18);
    }
    else
    {
      objc_msgSend__removeEarlyListener_(v6, v7, (uint64_t)self, v9);
    }
  }
}

- (BOOL)_acquiringDaemonConnection
{
  return self->_acquiringDaemonConnection;
}

- (BOOL)isConnecting
{
  if (self->_acquiringDaemonConnection)
  {
    LOBYTE(isLocalObjectValidOnQueue) = 1;
  }
  else
  {
    int isLocalObjectValidOnQueue = objc_msgSend___isLocalObjectValidOnQueue_(self, a2, (uint64_t)self->_localObjectLockQueue, v2);
    if (isLocalObjectValidOnQueue)
    {
      uint64_t v8 = objc_msgSend_listener(self, v5, v6, v7);
      char isSetupComplete = objc_msgSend_isSetupComplete(v8, v9, v10, v11);

      if (isSetupComplete)
      {
        LOBYTE(isLocalObjectValidOnQueue) = 0;
      }
      else
      {
        LOBYTE(isLocalObjectValidOnQueue) = objc_msgSend___isRemoteObjectValid(self, v13, v14, v15);
      }
    }
  }
  return isLocalObjectValidOnQueue;
}

- (BOOL)isConnected
{
  int v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], a2, v2, v3);
  char isNonUIInstall = objc_msgSend_isNonUIInstall(v5, v6, v7, v8);

  if (isNonUIInstall)
  {
    LOBYTE(isLocalObjectValidOnQueue) = 1;
  }
  else
  {
    int isLocalObjectValidOnQueue = objc_msgSend___isLocalObjectValidOnQueue_(self, v10, (uint64_t)self->_localObjectLockQueue, v11);
    if (isLocalObjectValidOnQueue)
    {
      uint64_t v16 = objc_msgSend_listener(self, v13, v14, v15);
      int isSetupComplete = objc_msgSend_isSetupComplete(v16, v17, v18, v19);

      if (isSetupComplete)
      {
        LOBYTE(isLocalObjectValidOnQueue) = objc_msgSend___isRemoteObjectValid(self, v21, v22, v23);
      }
      else
      {
        LOBYTE(isLocalObjectValidOnQueue) = 0;
      }
    }
  }
  return isLocalObjectValidOnQueue;
}

- (double)_connectionTimeout
{
  if (qword_1EB3F22B8 != -1) {
    dispatch_once(&qword_1EB3F22B8, &unk_1EF8E6328);
  }
  return *(double *)&qword_1EB3F1F50;
}

- (void)blockUntilConnected
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], a2, v2, v3);
  char isNonUIInstall = objc_msgSend_isNonUIInstall(v5, v6, v7, v8);

  if (isNonUIInstall) {
    return;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Request to block until connected", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B73F40;
  block[3] = &unk_1E5B7ACD0;
  block[4] = self;
  if (qword_1EB3F22C0 != -1) {
    dispatch_once(&qword_1EB3F22C0, block);
  }
  if (objc_msgSend_isConnected(self, v10, v11, v12))
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    int v21 = objc_msgSend_listener(v17, v18, v19, v20);
    int hasPostedSetupComplete = objc_msgSend_hasPostedSetupComplete(v21, v22, v23, v24);

    if (hasPostedSetupComplete)
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, " => Not blocking, already connected", buf, 2u);
      }
      goto LABEL_28;
    }
  }
  __int16 v27 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v14, v15, v16);
  if (objc_msgSend_systemIsShuttingDown(v27, v28, v29, v30))
  {

LABEL_19:
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, " => Not blocking, shutting down", buf, 2u);
    }
    goto LABEL_28;
  }
  if (self->_hasBeenSuspended)
  {
    char v34 = objc_msgSend__blocksConnectionAtResume(self, v31, v32, v33);

    if (v34) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (self->_inBlockingConnect)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, " => Already blocking, bailing", buf, 2u);
    }
LABEL_28:

    return;
  }
  if ((*MEMORY[0x1E4F6C500] & objc_msgSend_capabilities(self, v35, v36, v37)) != 0
    || (*MEMORY[0x1E4F6C508] & objc_msgSend_capabilities(self, v38, v39, v40)) != 0
    || (*MEMORY[0x1E4F6C510] & objc_msgSend_capabilities(self, v38, v39, v40)) != 0)
  {
    id v41 = (id)objc_msgSend_sharedRegistry(IMChatRegistry, v38, v39, v40);
    id v45 = (id)objc_msgSend_sharedController(IMKeyTransparencyController, v42, v43, v44);
  }
  self->_inBlockingConnect = 1;
  objc_msgSend_lock(self->_blockingLock, v38, v39, v40);
  if ((objc_msgSend_isConnected(self, v46, v47, v48) & 1) == 0
    && (objc_msgSend_isConnecting(self, v49, v50, v51) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v54 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_INFO, " => Starting connect", buf, 2u);
      }
    }
    objc_msgSend_connectToDaemonWithLaunch_(self, v52, 1, v53);
  }
  if ((objc_msgSend_remoteObjectExists(self, v49, v50, v51) & 1) != 0 || self->_acquiringDaemonConnection)
  {
    dispatch_sync((dispatch_queue_t)self->_daemonConnectionQueue, &unk_1EF8E3B30);
    v58 = objc_msgSend_currentRunLoop(MEMORY[0x1E4F1CAC0], v55, v56, v57);
    id v59 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v132 = objc_msgSend_IMCoreSetupTimingCollection(MEMORY[0x1E4F6C3F8], v60, v61, v62);
    objc_msgSend_startTimingForKey_(v132, v63, @"IMCoreSetup: Blocking connection", v64);
    objc_msgSend__connectionTimeout(self, v65, v66, v67);
    double v69 = v68;
    if (IMOSLoggingEnabled())
    {
      v73 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v135 = v69;
        _os_log_impl(&dword_1A4AF7000, v73, OS_LOG_TYPE_INFO, "connection timeout: %f", buf, 0xCu);
      }
    }
    uint64_t v74 = *MEMORY[0x1E4F6C270];
    while (1)
    {
      if (objc_msgSend_isConnected(self, v70, v71, v72)) {
        int isConnecting = 1;
      }
      else {
        int isConnecting = objc_msgSend_isConnecting(self, v75, v76, v77);
      }
      uint64_t v79 = objc_msgSend_sharedInstance(IMDaemonController, v75, v76, v77);
      uint64_t v83 = objc_msgSend_listener(v79, v80, v81, v82);
      int v87 = objc_msgSend_hasPostedSetupComplete(v83, v84, v85, v86);

      if (((v87 | isConnecting ^ 1) & 1) == 0)
      {
        v91 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v88, v89, v90, v69);
        objc_msgSend_runMode_beforeDate_(v58, v92, v74, (uint64_t)v91);

        if (objc_msgSend_isConnected(self, v93, v94, v95)) {
          int isConnecting = 1;
        }
        else {
          int isConnecting = objc_msgSend_isConnecting(self, v96, v97, v98);
        }
        v99 = objc_msgSend_sharedInstance(IMDaemonController, v96, v97, v98);
        char v103 = objc_msgSend_listener(v99, v100, v101, v102);
        LOBYTE(v87) = objc_msgSend_hasPostedSetupComplete(v103, v104, v105, v106);
      }
      if ((v87 & 1) != 0 || !isConnecting) {
        break;
      }
      objc_msgSend_timeIntervalSinceNow(v59, v88, v89, v90);
      if (v69 <= -v107)
      {
        objc_msgSend_unlock(self->_blockingLock, v70, v71, v72);
        goto LABEL_61;
      }
    }
    objc_msgSend_unlock(self->_blockingLock, v88, v89, v90);
    if (v87)
    {
      int v110 = 1;
      goto LABEL_68;
    }
LABEL_61:
    objc_msgSend__disconnectFromDaemonWithForce_(self, v108, 1, v109);
    objc_msgSend_timeIntervalSinceNow(v59, v111, v112, v113);
    if (v69 <= -v115)
    {
      id v116 = NSString;
      v117 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v108, v114, v109);
      BOOL v121 = objc_msgSend_processName(v117, v118, v119, v120);
      v124 = objc_msgSend_stringWithFormat_(v116, v122, @"%@ timed out connecting to imagent", v123, v121);

      if (IMOSLoggingEnabled())
      {
        id v125 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          double v135 = *(double *)&v124;
          _os_log_impl(&dword_1A4AF7000, v125, OS_LOG_TYPE_INFO, "************* %@, please file a radar, and attach the stackshots generated ***********************", buf, 0xCu);
        }
      }
      IMLogGenerateStackshotWithReason();
    }
    int v110 = 0;
LABEL_68:
    objc_msgSend_stopTimingForKey_(v132, v108, @"IMCoreSetup: Blocking connection", v109);
    if (IMOSLoggingEnabled())
    {
      uint64_t v126 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        v127 = @"NO";
        if (v110) {
          v127 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        double v135 = *(double *)&v127;
        _os_log_impl(&dword_1A4AF7000, v126, OS_LOG_TYPE_INFO, "Done blocking  (Success: %@)", buf, 0xCu);
      }
    }
    self->_inBlockingConnect = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v131 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v131, OS_LOG_TYPE_INFO, " => No remote object, can't block", buf, 2u);
      }
    }
    objc_msgSend_unlock(self->_blockingLock, v128, v129, v130);
    self->_inBlockingConnect = 0;
  }
}

- (void)_noteSetupComplete
{
  CFRunLoopSourceSignal(self->_runLoopSource);
  Main = CFRunLoopGetMain();

  CFRunLoopWakeUp(Main);
}

- (BOOL)__isLocalObjectValidOnQueue:(id)a3
{
  BOOL v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1A4B740BC;
  v9[3] = &unk_1E5B7BD58;
  v9[4] = self;
  v9[5] = &v10;
  int v5 = (void (**)(void))_Block_copy(v9);
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

- (BOOL)__isRemoteObjectValid
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4B741C8;
  v5[3] = &unk_1E5B7BD58;
  v5[4] = self;
  v5[5] = &v6;
  uint64_t v3 = _Block_copy(v5);
  sub_1A4B6FCAC((uint64_t)&v2->_remoteDaemonLock, v3);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)remoteObjectExists
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A4B742C4;
  v4[3] = &unk_1E5B7BD58;
  v4[4] = self;
  v4[5] = &v5;
  sub_1A4B6FCAC((uint64_t)&self->_remoteDaemonLock, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
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
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_1A4B743A0;
    v5[3] = &unk_1E5B7BD58;
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B74430;
  block[3] = &unk_1E5B7ACD0;
  block[4] = self;
  dispatch_sync(localObjectLockQueue, block);
}

- (void)_remoteObjectCleanup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1A4B744FC;
  v2[3] = &unk_1E5B7ACD0;
  v2[4] = self;
  sub_1A4B6FCAC((uint64_t)&self->_remoteDaemonLock, v2);
}

- (void)listener:(id)a3 setListenerCapabilities:(unsigned int)a4
{
}

- (unsigned)capabilities
{
  int v5 = objc_msgSend__capabilities(self, a2, v2, v3);
  unsigned int cachedCapabilities = self->_cachedCapabilities;
  if (!cachedCapabilities)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    int v14 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1A4B74618;
    v10[3] = &unk_1E5B7BE20;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(listenerLockQueue, v10);
    uint64_t v8 = v12;
    self->_unsigned int cachedCapabilities = *((_DWORD *)v12 + 6);
    unsigned int cachedCapabilities = *((_DWORD *)v8 + 6);
    _Block_object_dispose(&v11, 8);
  }
  return cachedCapabilities | v5;
}

- (void)_setCapabilities:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = objc_msgSend_capabilities(self, a2, *(uint64_t *)&a3, v3);
    uint64_t v9 = v5;
    if (self->_lastUpdatedCapabilities == v5)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = _IMStringFromFZListenerCapabilities();
          int v15 = 138412290;
          uint64_t v16 = v11;
          _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "Not updating caps, these were already pushed down: %@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
    else
    {
      self->_lastUpdatedCapabilities = v5;
      int v14 = objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
      objc_msgSend_setListenerCapabilities_(v14, v12, v9, v13);
    }
  }
}

- (void)localObjectDiedNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Disconnected from agent (local)...", buf, 2u);
    }
  }
  uint64_t v9 = objc_msgSend_listener(self, v5, v6, v7);
  objc_msgSend__noteDisconnected(v9, v10, v11, v12);

  if ((byte_1E965DD98 & 1) == 0)
  {
    byte_1E965DD98 = 1;
    objc_msgSend__localObjectCleanup(self, v13, v14, v15);
    objc_msgSend__remoteObjectCleanup(self, v16, v17, v18);
    im_dispatch_after();
  }
}

- (void)remoteObjectDiedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_listener(self, v5, v6, v7);
  objc_msgSend__noteDisconnected(v8, v9, v10, v11);

  if ((byte_1E965DD98 & 1) == 0)
  {
    byte_1E965DD98 = 1;
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Disconnected from agent (remote)...", buf, 2u);
      }
    }
    im_dispatch_after();
  }
}

- (void)listener:(id)a3 setValue:(id)a4 ofProperty:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_ofProperty_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)listener:(id)a3 setValue:(id)a4 ofPersistentProperty:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_ofPersistentProperty_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)sendQueryWithReply:(BOOL)a3 query:(id)a4
{
  BOOL v4 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if (v4)
  {
    uint64_t v9 = @"QueryWithReplySync";
    objc_msgSend_setQueryContext_(self, v6, @"QueryWithReplySync", v7);
  }
  else
  {
    uint64_t v9 = @"QueryWithReply";
    objc_msgSend_setQueryContext_(self, v6, @"QueryWithReply", v7);
  }
  v8[2](v8);

  MEMORY[0x1F4181798](self, sel_unsetQueryContext_, v9, v10);
}

- (void)setQueryContext:(id)a3
{
  id v19 = a3;
  id v6 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v3, v4, v5);
  uint64_t v10 = objc_msgSend_threadDictionary(v6, v7, v8, v9);

  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v19, v12);
  char v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

  if ((v17 & 1) == 0) {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v18, MEMORY[0x1E4F1CC38], (uint64_t)v19);
  }
}

- (void)unsetQueryContext:(id)a3
{
  id v20 = a3;
  id v6 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v3, v4, v5);
  uint64_t v10 = objc_msgSend_threadDictionary(v6, v7, v8, v9);

  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v20, v12);
  int v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

  if (v17) {
    objc_msgSend_removeObjectForKey_(v10, v18, (uint64_t)v20, v19);
  }
}

- (BOOL)consumeQueryContext:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v4, v5, v6);
  uint64_t v11 = objc_msgSend_threadDictionary(v7, v8, v9, v10);

  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)v3, v13);
  int v18 = objc_msgSend_BOOLValue(v14, v15, v16, v17);

  if (v18) {
    objc_msgSend_removeObjectForKey_(v11, v19, (uint64_t)v3, v20);
  }

  return v18;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend_methodSignatureForSelector_(self->_protocol, a2, (uint64_t)a3, v3);
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  int Context = objc_msgSend_consumeQueryContext_(self, v5, @"QueryWithReplySync", v6);
  char v10 = objc_msgSend_consumeQueryContext_(self, v8, @"QueryWithReply", v9);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4B753D4;
  aBlock[3] = &unk_1E5B7BE48;
  aBlock[4] = self;
  char v35 = Context;
  char v36 = v10;
  id v11 = v4;
  id v34 = v11;
  uint64_t v15 = (void (**)(void))_Block_copy(aBlock);
  if (Context)
  {
    if (objc_msgSend_connectToDaemonWithLaunch_capabilities_blockUntilConnected_(self, v12, 1, 0, 1))
    {
      objc_msgSend_retainArguments(v11, v16, v17, v18);
      uint64_t v22 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v19, v20, v21);
      uint64_t v26 = objc_msgSend_threadDictionary(v22, v23, v24, v25);
      objc_msgSend_objectForKey_(v26, v27, @"com.apple.IMDaemonControllerForwardingMessageKey", v28);
      uint64_t v29 = (_IMLegacyDaemonController *)objc_claimAutoreleasedReturnValue();

      if (v29 == self) {
        v15[2](v15);
      }
      else {
        dispatch_sync((dispatch_queue_t)self->_remoteMessageQueue, v15);
      }
    }
  }
  else if (objc_msgSend_connectToDaemon(self, v12, v13, v14))
  {
    objc_msgSend_retainArguments(v11, v30, v31, v32);
    dispatch_async((dispatch_queue_t)self->_remoteMessageQueue, v15);
  }
}

- (void)systemApplicationDidSuspend
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "System application did suspend", v4, 2u);
    }
  }
  self->_hasBeenSuspended = 1;
}

- (void)systemApplicationDidEnterBackground
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "System application did enter background", v4, 2u);
    }
  }
  self->_hasBeenSuspended = 1;
}

- (void)systemApplicationWillEnterForeground
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend__blocksConnectionAtResume(self, a2, v2, v3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if (self->_hasBeenSuspended) {
          uint64_t v8 = @"YES";
        }
        else {
          uint64_t v8 = @"NO";
        }
        int v12 = 138412290;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "System application did enter foreground (was suspended: %@)", (uint8_t *)&v12, 0xCu);
      }
    }
    if (self->_hasBeenSuspended)
    {
      self->_hasBeenSuspended = 0;
      objc_msgSend__disconnectFromDaemonWithForce_(self, v5, 1, v6);
      objc_msgSend_blockUntilConnected(self, v9, v10, v11);
      im_dispatch_after();
    }
  }
}

- (void)systemApplicationDidResume
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend__blocksConnectionAtResume(self, a2, v2, v3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if (self->_hasBeenSuspended) {
          uint64_t v8 = @"YES";
        }
        else {
          uint64_t v8 = @"NO";
        }
        int v12 = 138412290;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "System application did resume (was suspended: %@)", (uint8_t *)&v12, 0xCu);
      }
    }
    if (self->_hasBeenSuspended)
    {
      self->_hasBeenSuspended = 0;
      objc_msgSend__disconnectFromDaemonWithForce_(self, v5, 1, v6);
      objc_msgSend_blockUntilConnected(self, v9, v10, v11);
      im_dispatch_after();
    }
  }
}

- (IMDaemonListener)listener
{
  return self->_daemonListener;
}

- (void)setListener:(id)a3
{
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- (void)_setListenerID:(id)a3
{
}

- (BOOL)isRequestingConnection
{
  return self->_requestingConnection;
}

- (IMDaemonProtocol)replyingRemoteDaemon
{
  return self->_replyingRemoteDaemon;
}

- (IMDaemonProtocol)synchronousReplyingRemoteDaemon
{
  return self->_synchronousReplyingRemoteDaemon;
}

- (IMDaemonQueryController)queryController
{
  return self->_queryController;
}

- (NSArray)_servicesToAllow
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)_setServicesToAllow:(id)a3
{
}

- (NSArray)_servicesToDeny
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)_setServicesToDeny:(id)a3
{
}

- (BOOL)_blocksConnectionAtResume
{
  return self->__blocksConnectionAtResume;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMDaemonProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSMutableDictionary)listenerMap
{
  return self->_listenerMap;
}

- (void)setListenerMap:(id)a3
{
}

- (IMLocalObject)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)a3
{
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (OS_dispatch_queue)listenerLockQueue
{
  return self->_listenerLockQueue;
}

- (void)setListenerLockQueue:(id)a3
{
}

- (os_unfair_recursive_lock_s)remoteDaemonLock
{
  return self->_remoteDaemonLock;
}

- (void)setRemoteDaemonLock:(os_unfair_recursive_lock_s)a3
{
  self->_remoteDaemonLock = a3;
}

- (OS_dispatch_queue)localObjectLockQueue
{
  return self->_localObjectLockQueue;
}

- (void)setLocalObjectLockQueue:(id)a3
{
}

- (OS_dispatch_queue)daemonConnectionQueue
{
  return self->_daemonConnectionQueue;
}

- (void)setDaemonConnectionQueue:(id)a3
{
}

- (NSRecursiveLock)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(id)a3
{
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (NSLock)blockingLock
{
  return self->_blockingLock;
}

- (void)setBlockingLock:(id)a3
{
}

- (BOOL)hasCheckedForDaemon
{
  return self->_hasCheckedForDaemon;
}

- (void)setHasCheckedForDaemon:(BOOL)a3
{
  self->_hasCheckedForDaemon = a3;
}

- (BOOL)preventReconnect
{
  return self->_preventReconnect;
}

- (void)setPreventReconnect:(BOOL)a3
{
  self->_preventReconnect = a3;
}

- (BOOL)inBlockingConnect
{
  return self->_inBlockingConnect;
}

- (void)setInBlockingConnect:(BOOL)a3
{
  self->_inBlockingConnect = a3;
}

- (BOOL)acquiringDaemonConnection
{
  return self->_acquiringDaemonConnection;
}

- (void)setAcquiringDaemonConnection:(BOOL)a3
{
  self->_acquiringDaemonConnection = a3;
}

- (BOOL)hasBeenSuspended
{
  return self->_hasBeenSuspended;
}

- (void)setHasBeenSuspended:(BOOL)a3
{
  self->_hasBeenSuspended = a3;
}

- (unsigned)gMyFZListenerCapabilities
{
  return self->_gMyFZListenerCapabilities;
}

- (void)setGMyFZListenerCapabilities:(unsigned int)a3
{
  self->_gMyFZListenerCapabilities = a3;
}

- (unsigned)cachedCapabilities
{
  return self->_cachedCapabilities;
}

- (void)setCachedCapabilities:(unsigned int)a3
{
  self->_unsigned int cachedCapabilities = a3;
}

- (unsigned)lastUpdatedCapabilities
{
  return self->_lastUpdatedCapabilities;
}

- (void)setLastUpdatedCapabilities:(unsigned int)a3
{
  self->_lastUpdatedCapabilities = a3;
}

- (unsigned)_capabilities
{
  return self->__capabilities;
}

- (void)__setCapabilities:(unsigned int)a3
{
  self->__capabilities = a3;
}

- (BOOL)_autoReconnect
{
  return self->__autoReconnect;
}

- (void)_setAutoReconnect:(BOOL)a3
{
  self->__autoReconnect = a3;
}

- (OS_dispatch_queue)remoteMessageQueue
{
  return self->_remoteMessageQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_blockingLock, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_daemonConnectionQueue, 0);
  objc_storeStrong((id *)&self->_localObjectLockQueue, 0);
  objc_storeStrong((id *)&self->_listenerLockQueue, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_localObject, 0);
  objc_storeStrong((id *)&self->_listenerMap, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->__servicesToDeny, 0);
  objc_storeStrong((id *)&self->__servicesToAllow, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_synchronousReplyingRemoteDaemon, 0);
  objc_storeStrong((id *)&self->_replyingRemoteDaemon, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);

  objc_storeStrong((id *)&self->_daemonListener, 0);
}

@end