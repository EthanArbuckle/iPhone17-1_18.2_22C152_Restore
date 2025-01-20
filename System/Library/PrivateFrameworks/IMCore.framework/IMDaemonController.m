@interface IMDaemonController
+ (IMDaemonController)sharedController;
+ (id)sharedInstance;
- (BOOL)_clientRequiresSynchronousConnectionRescueWithListenerID:(id)a3;
- (BOOL)_hasMultiplexedConnectionWithUniqueID:(id)a3;
- (BOOL)addListenerID:(id)a3 capabilities:(unsigned int)a4;
- (BOOL)connectToDaemon;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5;
- (BOOL)hasListenerForID:(id)a3;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)removeListenerID:(id)a3;
- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4;
- (IMDaemonConnectionManaging)connection;
- (IMDaemonController)init;
- (IMDaemonListener)listener;
- (IMDaemonProtocol)remoteDaemon;
- (IMDaemonProtocol)replyingRemoteDaemon;
- (IMDaemonProtocol)synchronousRemoteDaemon;
- (IMDaemonProtocol)synchronousReplyingRemoteDaemon;
- (IMDaemonQueryController)queryController;
- (IMDistributingProxy)remoteDaemonProxy;
- (IMMultiplexedDaemonConnection)anonymousMultiplexedConnection;
- (NSArray)_servicesToAllow;
- (NSArray)_servicesToDeny;
- (NSDictionary)processContext;
- (NSMapTable)multiplexedConnections;
- (NSMutableDictionary)retainedMultiplexedConnections;
- (NSString)listenerID;
- (id)_multiplexedConnectionWithUniqueID:(id)a3 label:(id)a4 capabilities:(unint64_t)a5 context:(id)a6 retain:(BOOL)a7;
- (id)delegate;
- (id)multiplexedConnectionWithLabel:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (os_unfair_lock_s)lock;
- (unint64_t)_capabilitiesForMultiplexedConnectionWithUniqueID:(id)a3;
- (unint64_t)_clientCapabilitiesForLegacyClientWithListenerID:(id)a3 requestedCapabilities:(unint64_t)a4;
- (unint64_t)processCapabilities;
- (unint64_t)requestedCapabilities;
- (unsigned)capabilities;
- (unsigned)capabilitiesForListenerID:(id)a3;
- (void)_capabilitiesDidChange;
- (void)_capabilitiesDidChangeWithContextChange:(BOOL)a3;
- (void)_connectWithCompletion:(id)a3;
- (void)_connectWithContextChange:(BOOL)a3;
- (void)_handleDaemonLaunched:(id)a3;
- (void)_invalidateMultiplexedConnectionWithUniqueID:(id)a3;
- (void)_reconnectIfNeeded;
- (void)_setBlocksConnectionAtResume:(BOOL)a3;
- (void)_setListenerID:(id)a3;
- (void)_setServicesToAllow:(id)a3;
- (void)_setServicesToDeny:(id)a3;
- (void)_updateAnonymousMultiplexedConnectionWithAddedCapabilities:(unint64_t)a3;
- (void)blockUntilConnected;
- (void)disconnectFromDaemon;
- (void)killDaemon;
- (void)requestSetup;
- (void)sendQueryWithReply:(BOOL)a3 query:(id)a4;
- (void)setAnonymousMultiplexedConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProcessCapabilities:(unint64_t)a3;
@end

@implementation IMDaemonController

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = @"NO";
      if (v3) {
        v8 = @"YES";
      }
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Connecting with anonymous multiplexed connection with launch %@", (uint8_t *)&v10, 0xCu);
    }
  }
  objc_msgSend__connectWithContextChange_(self, v5, 0, v6);
  return 1;
}

- (void)_capabilitiesDidChangeWithContextChange:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_msgSend_setProcessCapabilities_(self, a2, 0, v3);
  uint64_t v9 = objc_msgSend_requestedCapabilities(self, v6, v7, v8);
  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = IMStringFromClientCapabilities();
        int v17 = 138412290;
        v18 = v15;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Process capabilities changed to %@, requesting new setup message", (uint8_t *)&v17, 0xCu);
      }
    }
    objc_msgSend__connectWithContextChange_(self, v11, v4, v13);
  }
  else
  {
    if (v10)
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Process capabilities changed to nil, disconnecting", (uint8_t *)&v17, 2u);
      }
    }
    objc_msgSend_disconnectFromDaemon(self, v11, v12, v13);
  }
}

- (IMDaemonProtocol)remoteDaemon
{
  BOOL v4 = objc_msgSend_connection(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_remoteObjectProxy(v4, v5, v6, v7);

  return (IMDaemonProtocol *)v8;
}

- (id)multiplexedConnectionWithLabel:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  uint64_t v8 = NSString;
  uint64_t v9 = (void *)MEMORY[0x1E4F29128];
  id v10 = a5;
  id v11 = a3;
  v15 = objc_msgSend_UUID(v9, v12, v13, v14);
  uint64_t v19 = objc_msgSend_UUIDString(v15, v16, v17, v18);
  v22 = objc_msgSend_stringWithFormat_(v8, v20, @"%@-%@", v21, v11, v19);

  v24 = objc_msgSend__multiplexedConnectionWithUniqueID_label_capabilities_context_retain_(self, v23, (uint64_t)v22, (uint64_t)v11, a4, v10, 0);

  return v24;
}

- (id)_multiplexedConnectionWithUniqueID:(id)a3 label:(id)a4 capabilities:(unint64_t)a5 context:(id)a6 retain:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v39 = a4;
  id v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  id location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4B527DC;
  aBlock[3] = &unk_1E5B7B420;
  objc_copyWeak(&v44, &location);
  id v13 = v11;
  id v43 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1A4B5282C;
  v40[3] = &unk_1E5B7ADC8;
  objc_copyWeak(&v41, &location);
  v15 = _Block_copy(v40);
  v16 = [IMMultiplexedDaemonConnection alloc];
  uint64_t v18 = objc_msgSend_initWithLabel_capabilities_context_onInvalidate_onDealloc_(v16, v17, (uint64_t)v39, a5, v12, v14, v15);
  v22 = objc_msgSend_multiplexedConnections(self, v19, v20, v21);
  objc_msgSend_setObject_forKey_(v22, v23, (uint64_t)v18, (uint64_t)v13);

  v27 = objc_msgSend_retainedMultiplexedConnections(self, v24, v25, v26);
  v29 = v27;
  if (v7) {
    objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v18, (uint64_t)v13);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v27, v28, 0, (uint64_t)v13);
  }

  if (v12)
  {
    processContext = self->_processContext;
    self->_processContext = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (IMOSLoggingEnabled())
  {
    v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = IMStringFromClientCapabilities();
      v35 = (void *)v34;
      uint64_t v36 = MEMORY[0x1E4F1CC28];
      if (v12) {
        uint64_t v36 = MEMORY[0x1E4F1CC38];
      }
      *(_DWORD *)buf = 138412802;
      id v47 = v39;
      __int16 v48 = 2112;
      uint64_t v49 = v34;
      __int16 v50 = 2112;
      uint64_t v51 = v36;
      _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Multiplexing connection with label: %@ capabilities: %@ hasContext: %@", buf, 0x20u);
    }
  }
  objc_msgSend__capabilitiesDidChangeWithContextChange_(self, v31, v12 != 0, v32);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

  return v18;
}

- (IMDaemonController)init
{
  v49[2] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)IMDaemonController;
  id v2 = [(IMDaemonController *)&v48 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_IMLegacyDaemonListener);
    BOOL v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    v5 = [IMDaemonConnection alloc];
    uint64_t v8 = objc_msgSend_initWithListener_(v5, v6, *((void *)v2 + 3), v7);
    uint64_t v9 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v8;

    id v10 = IMGetMainBundleIdentifier();
    uint64_t v14 = v10;
    if (v10)
    {
      id v15 = v10;
    }
    else
    {
      objc_msgSend_stringGUID(NSString, v11, v12, v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v15;

    id v17 = objc_alloc(MEMORY[0x1E4F28E10]);
    uint64_t v19 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v17, v18, 0x10000, 5, 1);
    uint64_t v20 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v22 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v21;

    v23 = [IMDaemonQueryController alloc];
    uint64_t v26 = objc_msgSend_initWithDaemonController_(v23, v24, (uint64_t)v2, v25);
    v27 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v26;

    *((_DWORD *)v2 + 3) = 0;
    id location = 0;
    objc_initWeak(&location, v2);
    id v28 = objc_alloc(MEMORY[0x1E4F6E7E8]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1A4B05EE4;
    v45[3] = &unk_1E5B7B3D0;
    objc_copyWeak(&v46, &location);
    v30 = objc_msgSend_initWithProtocol_forwardingHandler_(v28, v29, (uint64_t)&unk_1EF968410, (uint64_t)v45);
    id v31 = objc_alloc(MEMORY[0x1E4F6E750]);
    id v32 = objc_loadWeakRetained(&location);
    v49[0] = v32;
    v49[1] = v30;
    uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v33, (uint64_t)v49, 2);
    uint64_t v37 = objc_msgSend_initWithTargets_(v31, v35, (uint64_t)v34, v36);
    v38 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v37;

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_1A4AFCA48;
    v43[3] = &unk_1E5B7B3F8;
    objc_copyWeak(&v44, &location);
    objc_msgSend_setOnSetupComplete_(*((void **)v2 + 10), v39, (uint64_t)v43, v40);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1A4B51F4C, (CFStringRef)*MEMORY[0x1E4F6C488], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  return (IMDaemonController *)v2;
}

- (IMDaemonProtocol)replyingRemoteDaemon
{
  BOOL v4 = objc_msgSend_connection(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_remoteObjectProxy(v4, v5, v6, v7);

  return (IMDaemonProtocol *)v8;
}

- (void)blockUntilConnected
{
  objc_msgSend__connectWithContextChange_(self, a2, 0, v2);
  objc_msgSend_connection(self, v4, v5, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_waitForSetup(v10, v7, v8, v9);
}

- (void)_connectWithContextChange:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_requestedCapabilities(self, a2, a3, v3);
  objc_msgSend_processContext(self, v7, v8, v9);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_connection(self, v10, v11, v12);
  objc_msgSend_connectWithCapabilities_context_contextChanged_(v13, v14, v6, (uint64_t)v15, v4);
}

- (NSDictionary)processContext
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  processContext = self->_processContext;
  if (!processContext)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v9 = objc_msgSend_multiplexedConnections(self, v6, v7, v8, 0);
    uint64_t v13 = objc_msgSend_keyEnumerator(v9, v10, v11, v12);

    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v43, (uint64_t)v47, 16);
    if (v15)
    {
      uint64_t v19 = v15;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v23 = objc_msgSend_multiplexedConnections(self, v16, v17, v18);
          uint64_t v26 = objc_msgSend_objectForKey_(v23, v24, v22, v25);

          if (v26)
          {
            v30 = objc_msgSend_context(v26, v27, v28, v29);

            if (v30)
            {
              uint64_t v34 = objc_msgSend_context(v26, v31, v32, v33);
              objc_msgSend_setObject_forKeyedSubscript_(v5, v35, (uint64_t)v34, v22);
            }
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v43, (uint64_t)v47, 16);
      }
      while (v19);
    }

    id v39 = (NSDictionary *)objc_msgSend_copy(v5, v36, v37, v38);
    uint64_t v40 = self->_processContext;
    self->_processContext = v39;

    processContext = self->_processContext;
  }
  id v41 = processContext;
  os_unfair_lock_unlock(p_lock);

  return v41;
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  if (a3) {
    return objc_msgSend__capabilitiesForMultiplexedConnectionWithUniqueID_(self, a2, (uint64_t)a3, v3);
  }
  else {
    return objc_msgSend_processCapabilities(self, a2, 0, v3);
  }
}

- (unint64_t)processCapabilities
{
  if (self->_processCapabilities) {
    return self->_processCapabilities;
  }
  else {
    return objc_msgSend_requestedCapabilities(self, a2, v2, v3);
  }
}

- (NSMapTable)multiplexedConnections
{
  return self->_multiplexedConnections;
}

- (BOOL)isConnected
{
  id v5 = objc_msgSend_connection(self, a2, v2, v3);
  if (objc_msgSend_isConnected(v5, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_listener(self, v9, v10, v11);
    char isSetupComplete = objc_msgSend_isSetupComplete(v12, v13, v14, v15);
  }
  else
  {
    char isSetupComplete = 0;
  }

  return isSetupComplete;
}

- (IMDaemonConnectionManaging)connection
{
  return self->_connection;
}

- (IMDaemonListener)listener
{
  return self->_listener;
}

+ (id)sharedInstance
{
  BOOL v4 = objc_msgSend_sharedController(IMDaemonController, a2, v2, v3);
  uint64_t v8 = objc_msgSend_remoteDaemonProxy(v4, v5, v6, v7);

  return v8;
}

+ (IMDaemonController)sharedController
{
  if (qword_1EB3F2368 != -1) {
    dispatch_once(&qword_1EB3F2368, &unk_1EF8E5158);
  }
  uint64_t v2 = (void *)qword_1EB3F2358;

  return (IMDaemonController *)v2;
}

- (IMDistributingProxy)remoteDaemonProxy
{
  return self->_remoteDaemonProxy;
}

- (NSArray)_servicesToDeny
{
  return self->__servicesToDeny;
}

- (NSArray)_servicesToAllow
{
  return self->__servicesToAllow;
}

- (IMDaemonQueryController)queryController
{
  return self->_queryController;
}

- (NSMutableDictionary)retainedMultiplexedConnections
{
  return self->_retainedMultiplexedConnections;
}

- (unsigned)capabilities
{
  return objc_msgSend_processCapabilities(self, a2, v2, v3);
}

- (IMDaemonProtocol)synchronousRemoteDaemon
{
  BOOL v4 = objc_msgSend_connection(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxy(v4, v5, v6, v7);

  return (IMDaemonProtocol *)v8;
}

- (void)_connectWithCompletion:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Requesting asynchronous connection and setup for client", buf, 2u);
    }
  }
  uint64_t v9 = objc_msgSend_connection(self, v5, v6, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A4B5215C;
  v13[3] = &unk_1E5B7AE90;
  id v14 = v4;
  id v10 = v4;
  objc_msgSend_requestSetupIfNeededWithCompletionHandler_(v9, v11, (uint64_t)v13, v12);
}

- (BOOL)connectToDaemon
{
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Connecting with anonymous multiplexed connection", v7, 2u);
    }
  }
  objc_msgSend__connectWithContextChange_(self, v3, 0, v4);
  return 1;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = IMStringFromClientCapabilities();
      uint64_t v12 = (void *)v11;
      uint64_t v13 = @"NO";
      if (v5) {
        uint64_t v13 = @"YES";
      }
      int v24 = 138412546;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Connecting with anonymous multiplexed connection using capabilities: %@ blockUntilConnected: %@", (uint8_t *)&v24, 0x16u);
    }
  }
  objc_msgSend__updateAnonymousMultiplexedConnectionWithAddedCapabilities_(self, v8, a4, v9);
  objc_msgSend__connectWithContextChange_(self, v14, 0, v15);
  if (v5)
  {
    uint64_t v19 = objc_msgSend_connection(self, v16, v17, v18);
    objc_msgSend_waitForSetup(v19, v20, v21, v22);
  }
  return 1;
}

- (void)disconnectFromDaemon
{
  BOOL v5 = objc_msgSend_connection(self, a2, v2, v3);
  objc_msgSend_disconnect(v5, v6, v7, v8);

  objc_msgSend_listener(self, v9, v10, v11);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__noteDisconnected(v15, v12, v13, v14);
}

- (void)killDaemon
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1A4AF7000, v2, OS_LOG_TYPE_INFO, "Request to terminate daemon ignored, this function is no longer supported", v3, 2u);
    }
  }
}

- (void)_reconnectIfNeeded
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Request to reconnect if needed", (uint8_t *)&v30, 2u);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = objc_msgSend_anonymousMultiplexedConnection(self, v4, v5, v6);
  if (v7) {
    unint64_t v8 = 2;
  }
  else {
    unint64_t v8 = 1;
  }

  uint64_t v12 = objc_msgSend_multiplexedConnections(self, v9, v10, v11);
  BOOL v16 = objc_msgSend_count(v12, v13, v14, v15) < v8;

  os_unfair_lock_unlock(&self->_lock);
  int v17 = IMOSLoggingEnabled();
  if (v16)
  {
    if (v17)
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Not reconnecting, no non-anonymous multiplexed connections", (uint8_t *)&v30, 2u);
      }
    }
  }
  else
  {
    if (v17)
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = objc_msgSend_multiplexedConnections(self, v22, v23, v24);
        uint64_t v29 = objc_msgSend_count(v25, v26, v27, v28);
        int v30 = 134217984;
        uint64_t v31 = v29;
        _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "Reconnecting, controller has %llu multiplexed connections", (uint8_t *)&v30, 0xCu);
      }
    }
    objc_msgSend__connectWithContextChange_(self, v18, 0, v19);
  }
}

- (void)_handleDaemonLaunched:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Daemon launch detected while process was running", v9, 2u);
    }
  }
  objc_msgSend__reconnectIfNeeded(self, v5, v6, v7);
}

- (void)_invalidateMultiplexedConnectionWithUniqueID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v8 = objc_msgSend_multiplexedConnections(self, v5, v6, v7);
  objc_msgSend_removeObjectForKey_(v8, v9, (uint64_t)v4, v10);

  uint64_t v14 = objc_msgSend_retainedMultiplexedConnections(self, v11, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v14, v15, 0, (uint64_t)v4);

  os_unfair_lock_unlock(&self->_lock);
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Removed multiplexed connection with uniqueID: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  objc_msgSend__capabilitiesDidChange(self, v16, v17, v18);
}

- (BOOL)_hasMultiplexedConnectionWithUniqueID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v9 = objc_msgSend_multiplexedConnections(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v5, v11);

  os_unfair_lock_unlock(p_lock);
  return v12 != 0;
}

- (unint64_t)_capabilitiesForMultiplexedConnectionWithUniqueID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v9 = objc_msgSend_multiplexedConnections(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v5, v11);

  unint64_t v16 = objc_msgSend_capabilities(v12, v13, v14, v15);
  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (void)_updateAnonymousMultiplexedConnectionWithAddedCapabilities:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v4 = a3;
    uint64_t v6 = objc_msgSend_anonymousMultiplexedConnection(self, a2, a3, v3);

    if (v6)
    {
      uint64_t v10 = objc_msgSend_anonymousMultiplexedConnection(self, v7, v8, v9);
      uint64_t v14 = objc_msgSend_capabilities(v10, v11, v12, v13);

      v4 |= v14;
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          IMStringFromClientCapabilities();
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = IMStringFromClientCapabilities();
          int v21 = 138412546;
          id v22 = v16;
          __int16 v23 = 2112;
          uint64_t v24 = v17;
          _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Had existing anonymous capabilities %@, updating to %@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    uint64_t v18 = objc_msgSend__multiplexedConnectionWithUniqueID_label_capabilities_context_retain_(self, v7, @"__IMDaemonControllerAnonymousConnectionIdentifier", @"__IMDaemonControllerAnonymousConnectionIdentifier", v4, 0, 1);
    objc_msgSend_setAnonymousMultiplexedConnection_(self, v19, (uint64_t)v18, v20);
  }
}

- (unint64_t)requestedCapabilities
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = objc_msgSend_multiplexedConnections(self, v4, v5, v6, 0);
  uint64_t v11 = objc_msgSend_objectEnumerator(v7, v8, v9, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    unint64_t v18 = 0;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v11);
        }
        v18 |= objc_msgSend_capabilities(*(void **)(*((void *)&v22 + 1) + 8 * i), v14, v15, v16);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v17);
  }
  else
  {
    unint64_t v18 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (void)_capabilitiesDidChange
{
  objc_msgSend__capabilitiesDidChangeWithContextChange_(self, a2, 0, v2);
}

- (BOOL)addListenerID:(id)a3 capabilities:(unsigned int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v8 = objc_msgSend__clientCapabilitiesForLegacyClientWithListenerID_requestedCapabilities_(self, v7, (uint64_t)v6, a4);
  id v10 = (id)objc_msgSend__multiplexedConnectionWithUniqueID_label_capabilities_context_retain_(self, v9, (uint64_t)v6, (uint64_t)v6, v8, 0, 1);
  if (objc_msgSend__clientRequiresSynchronousConnectionRescueWithListenerID_(self, v11, (uint64_t)v6, v12))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Forcing block until connected for client %@ to rescue poor asynchronous behavior", (uint8_t *)&v18, 0xCu);
      }
    }
    objc_msgSend_blockUntilConnected(self, v13, v14, v15);
  }

  return 1;
}

- (BOOL)hasListenerForID:(id)a3
{
  return ((uint64_t (*)(IMDaemonController *, char *, id))MEMORY[0x1F4181798])(self, sel__hasMultiplexedConnectionWithUniqueID_, a3);
}

- (BOOL)removeListenerID:(id)a3
{
  objc_msgSend__invalidateMultiplexedConnectionWithUniqueID_(self, a2, (uint64_t)a3, v3);
  return 1;
}

- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4
{
  id v4 = (id)objc_msgSend__multiplexedConnectionWithUniqueID_label_capabilities_context_retain_(self, a2, (uint64_t)a4, (uint64_t)a4, a3, 0, 1);
  return 1;
}

- (BOOL)_clientRequiresSynchronousConnectionRescueWithListenerID:(id)a3
{
  return 0;
}

- (unint64_t)_clientCapabilitiesForLegacyClientWithListenerID:(id)a3 requestedCapabilities:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((a4 & 0x200004) == 4)
  {
    unint64_t v8 = a4 | 0x400000;
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v7;
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Assuming client %@ wants Precached Recent Chats (has no on-demand chat registry capability)", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    unint64_t v8 = a4;
    unint64_t v10 = a4;
    if ((a4 & 4) == 0) {
      goto LABEL_11;
    }
  }
  unint64_t v10 = v8 | 0x43200;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Assuming client %@ wants Send Messages, Message History Modify Read State, and Accounts (has chat capability)", (uint8_t *)&v17, 0xCu);
    }
  }
LABEL_11:
  if (objc_msgSend_isEqualToString_(v7, v5, @"CKSettingsMessagesController", v6))
  {
    v10 |= 0x20000000uLL;
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Granting synced settings capability to CKSettingsMessagesController listener.", (uint8_t *)&v17, 2u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      IMStringFromClientCapabilities();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = IMStringFromClientCapabilities();
      int v17 = 138412802;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2112;
      long long v22 = v15;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Client %@ requested %@ with legacy API, upgrading capabilities to %@", (uint8_t *)&v17, 0x20u);
    }
  }

  return v10;
}

- (BOOL)isConnecting
{
  uint64_t v5 = objc_msgSend_connection(self, a2, v2, v3);
  if (objc_msgSend_isConnected(v5, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_listener(self, v9, v10, v11);
    int v16 = objc_msgSend_isSetupComplete(v12, v13, v14, v15) ^ 1;
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)requestSetup
{
  objc_msgSend_connection(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestSetup(v7, v4, v5, v6);
}

- (void)_setServicesToAllow:(id)a3
{
}

- (void)_setServicesToDeny:(id)a3
{
}

- (IMDaemonProtocol)synchronousReplyingRemoteDaemon
{
  id v4 = objc_msgSend_connection(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxy(v4, v5, v6, v7);

  return (IMDaemonProtocol *)v8;
}

- (void)_setListenerID:(id)a3
{
}

- (void)sendQueryWithReply:(BOOL)a3 query:(id)a4
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- (void)_setBlocksConnectionAtResume:(BOOL)a3
{
  self->__blocksConnectionAtResume = a3;
}

- (void)setProcessCapabilities:(unint64_t)a3
{
  self->_processCapabilities = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (IMMultiplexedDaemonConnection)anonymousMultiplexedConnection
{
  return self->_anonymousMultiplexedConnection;
}

- (void)setAnonymousMultiplexedConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousMultiplexedConnection, 0);
  objc_storeStrong((id *)&self->_retainedMultiplexedConnections, 0);
  objc_storeStrong((id *)&self->_multiplexedConnections, 0);
  objc_storeStrong((id *)&self->_remoteDaemonProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_processContext, 0);
  objc_storeStrong((id *)&self->__servicesToDeny, 0);
  objc_storeStrong((id *)&self->__servicesToAllow, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak(&self->_delegate);
}

@end