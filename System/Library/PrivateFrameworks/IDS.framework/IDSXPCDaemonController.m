@interface IDSXPCDaemonController
+ (id)onQueueWeakSharedInstance;
+ (id)weakSharedInstance;
+ (void)asyncWeakSharedInstance:(id)a3;
+ (void)performDaemonControllerTask:(id)a3;
- (IDSXPCConnection)connection;
- (IDSXPCDaemonController)initWithQueue:(id)a3;
- (IDSXPCDaemonController)initWithQueue:(id)a3 connectionCreationBlock:(id)a4;
- (NSMapTable)interruptionHandlerByTarget;
- (NSMutableDictionary)collaboratorPromiseDictionary;
- (NSMutableDictionary)syncCollaboratorDictionary;
- (OS_dispatch_queue)queue;
- (id)_collaboratorWithIdentifier:(id)a3 interface:(id)a4 timeout:(double)a5 errorHandler:(id)a6 resolverBlock:(id)a7;
- (id)_daemonProxyWithErrorHandler:(id)a3;
- (id)_initWithQueue:(id)a3 isSync:(BOOL)a4;
- (id)_initWithQueue:(id)a3 isSync:(BOOL)a4 connectionCreationBlock:(id)a5;
- (id)_sync_collaboratorWithIdentifier:(id)a3 errorHandler:(id)a4 resolverBlock:(id)a5;
- (id)_timingOutDaemonProxyWithTimeout:(double)a3 errorHandler:(id)a4;
- (id)activityMonitorCollaboratorWithErrorHandler:(id)a3;
- (id)baaSignerCollaboratorForTopic:(id)a3 withErrorHandler:(id)a4;
- (id)eventReportingCollaboratorWithErrorHandler:(id)a3;
- (id)featureTogglerCollaboratorForService:(id)a3 withErrorHandler:(id)a4;
- (id)firewallCollaboratorForService:(id)a3 withErrorHandler:(id)a4;
- (id)groupSessionKeyValueDeliveryProviderCollaboratorWithErrorHandler:(id)a3;
- (id)initSyncControllerWithQueue:(id)a3;
- (id)interalTestingCollaboratorWithErrorHandler:(id)a3;
- (id)keyTransparencyCollaboratorWithErrorHandler:(id)a3;
- (id)offGridMessengerCollaboratorWithErrorHandler:(id)a3;
- (id)offGridStateManagerCollaboratorWithErrorHandler:(id)a3;
- (id)opportunisticCollaboratorWithErrorHandler:(id)a3;
- (id)pairedDeviceManagerCollaboratorWithErrorHandler:(id)a3;
- (id)pairingCollaboratorWithErrorHandler:(id)a3;
- (id)pairingCollaboratorWithTimeout:(double)a3 errorHandler:(id)a4;
- (id)pinnedIdentityCollaboratorWithErrorHandler:(id)a3;
- (id)registrationCollaboratorWithErrorHandler:(id)a3;
- (id)reunionSyncCollaboratorWithErrorHandler:(id)a3;
- (id)serverMessagingCollaboratorWithErrorHandler:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addInterruptionHandler:(id)a3 forTarget:(id)a4;
- (void)dealloc;
- (void)performTask:(id)a3;
- (void)removeInterruptionHandlerForTarget:(id)a3;
- (void)setCollaboratorPromiseDictionary:(id)a3;
- (void)setConnection:(id)a3;
- (void)setInterruptionHandlerByTarget:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSyncCollaboratorDictionary:(id)a3;
@end

@implementation IDSXPCDaemonController

+ (id)onQueueWeakSharedInstance
{
  id WeakRetained = objc_loadWeakRetained(&qword_1E92DE250);

  if (WeakRetained)
  {
    v3 = (IDSXPCDaemonController *)objc_loadWeakRetained(&qword_1E92DE250);
  }
  else
  {
    v4 = [IDSXPCDaemonController alloc];
    v5 = +[IDSInternalQueueController sharedInstance];
    v6 = [v5 queue];
    v3 = [(IDSXPCDaemonController *)v4 initWithQueue:v6];

    objc_storeWeak(&qword_1E92DE250, v3);
  }

  return v3;
}

+ (id)weakSharedInstance
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_191918700;
  v11 = sub_1919185A0;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191990FB0;
  v6[3] = &unk_1E572B858;
  v6[4] = &v7;
  v6[5] = a1;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)asyncWeakSharedInstance:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919910B4;
  v7[3] = &unk_1E572AEF8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 performBlock:v7];
}

+ (void)performDaemonControllerTask:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919911CC;
  v7[3] = &unk_1E572AEF8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (IDSXPCDaemonController)initWithQueue:(id)a3 connectionCreationBlock:(id)a4
{
  return (IDSXPCDaemonController *)MEMORY[0x1F4181798](self, sel__initWithQueue_isSync_connectionCreationBlock_);
}

- (IDSXPCDaemonController)initWithQueue:(id)a3
{
  return (IDSXPCDaemonController *)MEMORY[0x1F4181798](self, sel__initWithQueue_isSync_);
}

- (id)initSyncControllerWithQueue:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__initWithQueue_isSync_);
}

- (id)_initWithQueue:(id)a3 isSync:(BOOL)a4
{
  return (id)MEMORY[0x1F4181798](self, sel__initWithQueue_isSync_connectionCreationBlock_);
}

- (id)_initWithQueue:(id)a3 isSync:(BOOL)a4 connectionCreationBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (void (**)(void))a5;
  int v11 = _IDSRunningInDaemon();
  id v12 = [MEMORY[0x1E4F6B460] xpc];
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A35FB4((uint64_t)self, v13);
    }

    v14 = 0;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCDaemonController {pointer: %p}", buf, 0xCu);
    }

    v36.receiver = self;
    v36.super_class = (Class)IDSXPCDaemonController;
    v15 = [(IDSXPCDaemonController *)&v36 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_queue, a3);
      v17 = v10[2](v10);
      v18 = +[IDSXPCDaemonInterface interface];
      [v17 setRemoteObjectInterface:v18];

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v16);
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      v32 = sub_19199157C;
      v33 = &unk_1E5729568;
      objc_copyWeak(&v35, (id *)buf);
      v19 = v16;
      v34 = v19;
      [v17 setInterruptionHandler:&v30];
      v20 = [IDSXPCConnection alloc];
      if (v6)
      {
        uint64_t v21 = -[IDSXPCConnection initForSyncMessagingWithQueue:takingOverAndResumingConnection:](v20, "initForSyncMessagingWithQueue:takingOverAndResumingConnection:", v9, v17, v30, v31, v32, v33);
        connection = v19->_connection;
        v19->_connection = (IDSXPCConnection *)v21;

        v19->_sync = 1;
        v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        syncCollaboratorDictionary = v19->_syncCollaboratorDictionary;
        v19->_syncCollaboratorDictionary = v23;

        collaboratorPromiseDictionary = v19->_collaboratorPromiseDictionary;
        v19->_collaboratorPromiseDictionary = 0;
      }
      else
      {
        uint64_t v26 = -[IDSXPCConnection initWithQueue:takingOverAndResumingConnection:](v20, "initWithQueue:takingOverAndResumingConnection:", v9, v17, v30, v31, v32, v33);
        v27 = v19->_connection;
        v19->_connection = (IDSXPCConnection *)v26;

        v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        collaboratorPromiseDictionary = v19->_collaboratorPromiseDictionary;
        v19->_collaboratorPromiseDictionary = v28;
      }

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
    self = v16;
    v14 = self;
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    BOOL v6 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCDaemonController {pointer: %p}", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)IDSXPCDaemonController;
  [(IDSXPCDaemonController *)&v4 dealloc];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Activating daemon controller", v9, 2u);
  }

  if (self->_sync)
  {
    BOOL v6 = [(IDSXPCDaemonController *)self connection];
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
    [v7 activateWithCompletion:v4];
  }
  else
  {
    id v8 = [(IDSXPCDaemonController *)self queue];
    dispatch_assert_queue_V2(v8);

    BOOL v6 = [(IDSXPCDaemonController *)self _daemonProxyWithErrorHandler:v4];
    [v6 activateWithCompletion:v4];
  }
}

- (id)pairingCollaboratorWithErrorHandler:(id)a3
{
  return [(IDSXPCDaemonController *)self pairingCollaboratorWithTimeout:a3 errorHandler:60.0];
}

- (id)pairingCollaboratorWithTimeout:(double)a3 errorHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[IDSXPCPairingInterface interface];
  id v8 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"pairing" interface:v7 timeout:v6 errorHandler:&unk_1EE245CE8 resolverBlock:a3];

  return v8;
}

- (id)pairedDeviceManagerCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCPairedDeviceManagerInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"pairedDeviceManager" interface:v5 timeout:v4 errorHandler:&unk_1EE245DA8 resolverBlock:60.0];

  return v6;
}

- (id)reunionSyncCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCReunionSyncInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"reunionSync" interface:v5 timeout:v4 errorHandler:&unk_1EE245E28 resolverBlock:60.0];

  return v6;
}

- (id)opportunisticCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCOpportunisticInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"opportunistic" interface:v5 timeout:v4 errorHandler:&unk_1EE245E68 resolverBlock:60.0];

  return v6;
}

- (id)registrationCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCRegistrationInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"registration" interface:v5 timeout:v4 errorHandler:&unk_1EE246C68 resolverBlock:60.0];

  return v6;
}

- (id)activityMonitorCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCActivityMonitorInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"activityMonitor" interface:v5 timeout:v4 errorHandler:&unk_1EE246CC8 resolverBlock:3600.0];

  return v6;
}

- (id)serverMessagingCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCServerMessagingInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"serverMessaging" interface:v5 timeout:v4 errorHandler:&unk_1EE246CE8 resolverBlock:3600.0];

  return v6;
}

- (id)offGridMessengerCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCOffGridMessengerInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"offgridMessenger" interface:v5 timeout:v4 errorHandler:&unk_1EE245FC8 resolverBlock:3600.0];

  return v6;
}

- (id)offGridStateManagerCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCOffGridStateManagerInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"offgridStateManager" interface:v5 timeout:v4 errorHandler:&unk_1EE246D48 resolverBlock:3600.0];

  return v6;
}

- (id)keyTransparencyCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCKeyTransparencyInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"keyTransparency" interface:v5 timeout:v4 errorHandler:&unk_1EE246048 resolverBlock:3600.0];

  return v6;
}

- (id)pinnedIdentityCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCPinnedIdentityInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"pinnedIdentity" interface:v5 timeout:v4 errorHandler:&unk_1EE2460A8 resolverBlock:3600.0];

  return v6;
}

- (id)firewallCollaboratorForService:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSXPCFirewallInterface interface];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191992160;
  v12[3] = &unk_1E572B8C0;
  id v13 = v6;
  id v9 = v6;
  v10 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"firewall" interface:v8 timeout:v7 errorHandler:v12 resolverBlock:60.0];

  return v10;
}

- (id)groupSessionKeyValueDeliveryProviderCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCGroupSessionKeyValueDeliveryProviderInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"groupSessionKeyValueDeliveryProvider" interface:v5 timeout:v4 errorHandler:&unk_1EE246128 resolverBlock:60.0];

  return v6;
}

- (id)featureTogglerCollaboratorForService:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSXPCFeatureTogglerInterface interface];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19199230C;
  v12[3] = &unk_1E572B8C0;
  id v13 = v6;
  id v9 = v6;
  v10 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"featuretoggler" interface:v8 timeout:v7 errorHandler:v12 resolverBlock:60.0];

  return v10;
}

- (id)baaSignerCollaboratorForTopic:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSXPCBAASignerInterface interface];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_19199241C;
  v12[3] = &unk_1E572B8C0;
  id v13 = v6;
  id v9 = v6;
  v10 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"baasigner" interface:v8 timeout:v7 errorHandler:v12 resolverBlock:60.0];

  return v10;
}

- (id)eventReportingCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCEventReportingInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"eventReporting" interface:v5 timeout:v4 errorHandler:&unk_1EE245B28 resolverBlock:60.0];

  return v6;
}

- (id)interalTestingCollaboratorWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = +[IDSXPCInternalTestingInterface interface];
  id v6 = [(IDSXPCDaemonController *)self _collaboratorWithIdentifier:@"internalTesting" interface:v5 timeout:v4 errorHandler:&unk_1EE246FE8 resolverBlock:60.0];

  return v6;
}

- (void)performTask:(id)a3
{
  id v4 = a3;
  v5 = [(IDSXPCDaemonController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191992618;
  v7[3] = &unk_1E5729880;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addInterruptionHandler:(id)a3 forTarget:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6)
  {
    interruptionHandlerByTarget = self->_interruptionHandlerByTarget;
    if (!interruptionHandlerByTarget)
    {
      id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      id v9 = self->_interruptionHandlerByTarget;
      self->_interruptionHandlerByTarget = v8;

      interruptionHandlerByTarget = self->_interruptionHandlerByTarget;
    }
    v10 = (void *)MEMORY[0x192FE03B0](v11);
    [(NSMapTable *)interruptionHandlerByTarget setObject:v10 forKey:v6];
  }
}

- (void)removeInterruptionHandlerForTarget:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMapTable *)self->_interruptionHandlerByTarget removeObjectForKey:v4];
    if (![(NSMapTable *)self->_interruptionHandlerByTarget count])
    {
      interruptionHandlerByTarget = self->_interruptionHandlerByTarget;
      self->_interruptionHandlerByTarget = 0;
    }
  }

  MEMORY[0x1F41817F8]();
}

- (id)_daemonProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(IDSXPCDaemonController *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_191992820;
  v9[3] = &unk_1E572B8E8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)_timingOutDaemonProxyWithTimeout:(double)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(IDSXPCDaemonController *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19199296C;
  v11[3] = &unk_1E572B8E8;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithTimeoutInSeconds:v11 errorHandler:a3];

  return v9;
}

- (id)_collaboratorWithIdentifier:(id)a3 interface:(id)a4 timeout:(double)a5 errorHandler:(id)a6 resolverBlock:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void *, void *))a7;
  v16 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a5;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_INFO, "Get collaborator {identifier: %{public}@, timeout: %f}", buf, 0x16u);
  }

  if (self->_sync)
  {
    v17 = [(IDSXPCDaemonController *)self _sync_collaboratorWithIdentifier:v12 errorHandler:v14 resolverBlock:v15];
  }
  else
  {
    v18 = [(IDSXPCDaemonController *)self queue];
    dispatch_assert_queue_V2(v18);

    v19 = [IDSXPCConnectionRemoteObjectPromise alloc];
    v20 = [(IDSXPCDaemonController *)self queue];
    v37 = [(IDSXPCConnectionRemoteObjectPromise *)v19 initWithInterface:v13 queue:v20];

    uint64_t v21 = [(IDSXPCDaemonController *)self collaboratorPromiseDictionary];
    v22 = [v21 objectForKeyedSubscript:v12];

    v23 = &off_191A52000;
    if (!v22)
    {
      v24 = [MEMORY[0x1E4F6B460] xpc];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "Creating collaborator promise {identifier: %{public}@}", buf, 0xCu);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v53 = 0;
      id v25 = objc_alloc(MEMORY[0x1E4F59E08]);
      uint64_t v26 = [(IDSXPCDaemonController *)self queue];
      v27 = (void *)[v25 initWithQueue:v26];

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = sub_191992E98;
      v47[3] = &unk_1E572B910;
      v51 = buf;
      id v28 = v27;
      id v48 = v28;
      v49 = self;
      id v29 = v12;
      id v50 = v29;
      objc_super v36 = [(IDSXPCDaemonController *)self _timingOutDaemonProxyWithTimeout:v47 errorHandler:a5];
      uint64_t v30 = [(IDSXPCDaemonController *)self connection];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = sub_191992F24;
      v43[3] = &unk_1E572B938;
      v46 = buf;
      id v31 = v28;
      id v44 = v31;
      id v32 = v30;
      id v45 = v32;
      v15[2](v15, v36, v43);
      v22 = [v31 promise];
      v33 = [(IDSXPCDaemonController *)self collaboratorPromiseDictionary];
      [v33 setObject:v22 forKeyedSubscript:v29];

      _Block_object_dispose(buf, 8);
      v23 = &off_191A52000;
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = *((void *)v23 + 51);
    v38[2] = sub_191992FBC;
    v38[3] = &unk_1E572B960;
    double v42 = a5;
    id v41 = v14;
    v38[4] = self;
    id v39 = v12;
    v40 = v37;
    v34 = v37;
    [v22 registerResultBlock:v38];
    v17 = [(IDSXPCConnectionRemoteObjectPromise *)v34 remoteObjectProxy];
  }

  return v17;
}

- (id)_sync_collaboratorWithIdentifier:(id)a3 errorHandler:(id)a4 resolverBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *))a5;
  id v11 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_INFO, "Get sync collaborator", buf, 2u);
  }

  *(void *)buf = 0;
  v23 = buf;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_191918700;
  uint64_t v26 = sub_1919185A0;
  id v27 = 0;
  id v12 = [(IDSXPCDaemonController *)self connection];
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_191993468;
  v18[3] = &unk_1E572B988;
  id v14 = v9;
  id v20 = v14;
  uint64_t v21 = buf;
  v18[4] = self;
  id v15 = v8;
  id v19 = v15;
  v10[2](v10, v13, v18);
  id v16 = *((id *)v23 + 5);

  _Block_object_dispose(buf, 8);

  return v16;
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)collaboratorPromiseDictionary
{
  return self->_collaboratorPromiseDictionary;
}

- (void)setCollaboratorPromiseDictionary:(id)a3
{
}

- (NSMutableDictionary)syncCollaboratorDictionary
{
  return self->_syncCollaboratorDictionary;
}

- (void)setSyncCollaboratorDictionary:(id)a3
{
}

- (NSMapTable)interruptionHandlerByTarget
{
  return self->_interruptionHandlerByTarget;
}

- (void)setInterruptionHandlerByTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionHandlerByTarget, 0);
  objc_storeStrong((id *)&self->_syncCollaboratorDictionary, 0);
  objc_storeStrong((id *)&self->_collaboratorPromiseDictionary, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end