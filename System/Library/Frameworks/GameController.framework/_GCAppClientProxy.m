@interface _GCAppClientProxy
+ (id)clientProxyWithConnection:(id)a3 server:(id)a4;
+ (id)settingsSuiteName;
- (BOOL)isInvalid;
- (BOOL)readBooleanValueWithName:(id)a3;
- (NSArray)invalidationHandlers;
- (NSString)bundleIdentifier;
- (_GCAppClientProxy)init;
- (_GCIPCObjectRegistry)IPCObjectRegistry;
- (_GCIPCServiceRegistry)IPCServiceRegistry;
- (id)_initWithConnection:(id)a3 server:(id)a4;
- (id)addInvalidationHandler:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (int)processIdentifier;
- (void)_invalidate;
- (void)adaptiveTriggersXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)batteryXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)checkClipBufferingEnabledWithReply:(id)a3;
- (void)checkEmulatedControllerEnabledWithReply:(id)a3;
- (void)clientCanReceiveEventsDidChange:(BOOL)a3;
- (void)connectToAdaptiveTriggersXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToBatteryXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToControllerServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToGameIntentXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToLightXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToMotionXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToPhotoVideoXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToPlayerIndicatorXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToSettingsXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToSystemGestureXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)fetchControllerDescriptionsWithReply:(id)a3;
- (void)gameIntentXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)generateURLFor:(id)a3 withReply:(id)a4;
- (void)getTheLastGeneratedURLWithReply:(id)a3;
- (void)lightXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)motionXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onVideoRecordingStart:(id)a3;
- (void)onVideoRecordingStopWithURL:(id)a3 reply:(id)a4;
- (void)pingWithReply:(id)a3;
- (void)playerIndicatorXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)setInvalidationHandlers:(id)a3;
- (void)settingsXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)systemGestureXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4;
- (void)takeScreenshotWithReply:(id)a3;
@end

@implementation _GCAppClientProxy

+ (id)clientProxyWithConnection:(id)a3 server:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithConnection:v7 server:v6];

  return v8;
}

- (id)_initWithConnection:(id)a3 server:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_GCAppClientProxy;
  v9 = [(_GCAppClientProxy *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_server, a4);
    objc_storeStrong((id *)&v10->_connection, a3);
    uint64_t v11 = objc_opt_new();
    invalidationHandlers = v10->_invalidationHandlers;
    v10->_invalidationHandlers = (NSArray *)v11;

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __48___GCAppClientProxy__initWithConnection_server___block_invoke;
    v21[3] = &unk_26D22A8C0;
    v13 = v10;
    v22 = v13;
    v14 = (void *)MEMORY[0x223C6E420](v21);
    uint64_t v15 = [(_GCIPCIncomingConnection *)v10->_connection addInvalidationHandler:v14];
    id connectionInvalidationRegistration = v13->_connectionInvalidationRegistration;
    v13->_id connectionInvalidationRegistration = (id)v15;

    uint64_t v17 = [(_GCIPCIncomingConnection *)v10->_connection addInterruptionHandler:v14];
    id connectionInterruptedRegistration = v13->_connectionInterruptedRegistration;
    v13->_id connectionInterruptedRegistration = (id)v17;

    if (gc_isInternalBuild())
    {
      v20 = getGCLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[_GCAppClientProxy _initWithConnection:server:]();
      }
    }
  }

  return v10;
}

- (_GCAppClientProxy)init
{
  return 0;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    v5 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v5 handleFailureInMethod:a2, self, @"GCAppClientProxy.m", 104, @"%@ is being deallocated, but is still valid.", self object file lineNumber description];
  }
  [(_GCAppClientProxy *)self _invalidate];
  v6.receiver = self;
  v6.super_class = (Class)_GCAppClientProxy;
  [(_GCAppClientProxy *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  uint64_t v11 = (_GCControllerManagerServer *)a4;
  id v12 = a5;
  v46 = v12;
  v47 = v11;
  v45 = v10;
  if (self->_server == v11 && [v10 isEqualToString:@"activeControllerDevices"])
  {
    v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    v14 = self;
    id v15 = v13;
    if (gc_isInternalBuild())
    {
      v40 = getGCLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[_GCAppClientProxy observeValueForKeyPath:ofObject:change:context:]();
      }
    }
    id v48 = objc_alloc_init((Class)&off_26D2B4AE0);
    id v16 = objc_alloc_init((Class)&off_26D2B4AE0);
    uint64_t v17 = v14;
    objc_sync_enter(v17);
    publishedControllerDescriptions = v17->_publishedControllerDescriptions;
    if (publishedControllerDescriptions)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v19 = (id)[(NSMapTable *)publishedControllerDescriptions copy];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v55 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            v24 = [v15 member:v23];
            BOOL v25 = v24 == 0;

            if (v25)
            {
              v26 = [(NSMapTable *)v17->_publishedControllerDescriptions objectForKey:v23];
              if (!v26)
              {
                v44 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
                v28 = +[NSString stringWithUTF8String:"void setActiveDevices(_GCAppClientProxy *__strong, NSSet<id<_GCDeviceControllerProviding>> *__strong)"];
                objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v28, @"GCAppClientProxy.m", 473, @"Bug in %s", "setActiveDevices");
              }
              v27 = [v26 identifier];
              [v48 addObject:v27];

              [(NSMapTable *)v17->_publishedControllerDescriptions removeObjectForKey:v23];
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v20);
      }

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v29 = v15;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v51 != v31) {
              objc_enumerationMutation(v29);
            }
            v33 = *(void **)(*((void *)&v50 + 1) + 8 * j);
            v34 = [v33 makeControllerForClient:v17];
            if (v34)
            {
              [v16 addObject:v34];
              [(NSMapTable *)v17->_publishedControllerDescriptions setObject:v34 forKey:v33];
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v61 count:16];
        }
        while (v30);
      }

      objc_sync_exit(v17);
      if (![v48 count] && !objc_msgSend(v16, "count")) {
        goto LABEL_36;
      }
      v35 = v17->_controllerServiceClient;
      if (v35)
      {
        unint64_t v36 = v17->_controllerServiceClientPendingUpdates + 1;
        v17->_controllerServiceClientPendingUpdates = v36;
        if (v36 <= 0x14)
        {
          BOOL v37 = v36 == 20;
          int isInternalBuild = gc_isInternalBuild();
          if (v37)
          {
            if (isInternalBuild)
            {
              v41 = getGCLogger();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
                -[_GCAppClientProxy observeValueForKeyPath:ofObject:change:context:]((uint64_t)v17, v41);
              }
            }
            [(GCControllerServiceRemoteClientInterface *)v35 refreshControllers];
          }
          else
          {
            if (isInternalBuild)
            {
              v42 = getGCLogger();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                connection = v17->_connection;
                *(_DWORD *)buf = 138412802;
                *(void *)&buf[4] = connection;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v16;
                *(_WORD *)&buf[22] = 2112;
                v59 = v48;
                _os_log_debug_impl(&dword_220998000, v42, OS_LOG_TYPE_DEBUG, "Sending published controller changes to remote %@\nIncoming: %@\nOutgoing: %@", buf, 0x20u);
              }
            }
            if ([v48 count]) {
              [(GCControllerServiceRemoteClientInterface *)v35 unpublishControllersWithIdentifiers:v48];
            }
            if ([v16 count]) {
              [(GCControllerServiceRemoteClientInterface *)v35 publishControllers:v16];
            }
            if (v17->_controllerServiceClientPendingUpdates == 10)
            {
              v39 = v17->_connection;
              *(void *)buf = _NSConcreteStackBlock;
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __setActiveDevices_block_invoke;
              v59 = &unk_26D22A8C0;
              v60 = v17;
              [(_GCIPCIncomingConnection *)v39 scheduleSendBarrierBlock:buf];
            }
          }
        }
      }
    }
    else
    {
      objc_sync_exit(v17);
      v35 = (GCControllerServiceRemoteClientInterface *)v17;
    }

LABEL_36:
    goto LABEL_33;
  }
  v49.receiver = self;
  v49.super_class = (Class)_GCAppClientProxy;
  [(_GCAppClientProxy *)&v49 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_33:
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v4) {
    v5 = " (invalid)";
  }
  else {
    v5 = "";
  }
  objc_super v6 = [(_GCIPCIncomingConnection *)self->_connection process];
  uint64_t v7 = [v6 processIdentifier];
  id v8 = [(_GCIPCIncomingConnection *)self->_connection process];
  v9 = [v8 bundleIdentifier];
  id v10 = +[NSString stringWithFormat:@"<%@%s client.pid: %i, client.bundleIdentifier: %@>", v3, v5, v7, v9];

  return v10;
}

- (id)redactedDescription
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v4) {
    v5 = " (invalid)";
  }
  else {
    v5 = "";
  }
  objc_super v6 = [(_GCIPCIncomingConnection *)self->_connection process];
  uint64_t v7 = [v6 processIdentifier];
  id v8 = [(_GCIPCIncomingConnection *)self->_connection process];
  v9 = [v8 bundleIdentifier];
  id v10 = +[NSString stringWithFormat:@"<%@%s client.pid: %i, client.bundleIdentifier: %@>", v3, v5, v7, v9];

  return v10;
}

- (id)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v5) {
    objc_super v6 = " (invalid)";
  }
  else {
    objc_super v6 = "";
  }
  uint64_t v7 = [(_GCIPCIncomingConnection *)self->_connection process];
  uint64_t v8 = [v7 processIdentifier];
  v9 = [(_GCIPCIncomingConnection *)self->_connection process];
  id v10 = [v9 bundleIdentifier];
  uint64_t v11 = +[NSString stringWithFormat:@"<%@ %p%s client.pid: %i, client.bundleIdentifier: %@>", v4, self, v6, v8, v10];

  return v11;
}

- (void)_invalidate
{
  p_invalid = &self->_invalid;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = self;
    objc_sync_enter(v4);
    atomic_store(1u, (unsigned __int8 *)p_invalid);
    unsigned __int8 v5 = [(_GCAppClientProxy *)v4 invalidationHandlers];
    objc_sync_exit(v4);

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v6 = objc_msgSend(v5, "reverseObjectEnumerator", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      uint64_t v20 = getGCLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v4;
        _os_log_impl(&dword_220998000, v20, OS_LOG_TYPE_INFO, "App client proxy invalidated: %@", buf, 0xCu);
      }
    }
    id v10 = v4;
    objc_sync_enter(v10);
    if (v10->_publishedControllerDescriptions)
    {
      [(_GCControllerManagerServer *)v10->_server removeObserver:v10 forKeyPath:@"activeControllerDevices" context:0];
      publishedControllerDescriptions = v10->_publishedControllerDescriptions;
      v10->_publishedControllerDescriptions = 0;
    }
    controllerServiceClient = v10->_controllerServiceClient;
    v10->_controllerServiceClient = 0;

    objc_sync_exit(v10);
    v13 = v10;
    objc_sync_enter(v13);
    v14 = +[GCApplicationStateMonitor sharedInstance];
    id v15 = [v13[3] process];
    objc_msgSend(v14, "removeApplicationFromCanReceiveEventsMonitoring:", objc_msgSend(v15, "processIdentifier"));

    objc_sync_exit(v13);
    id v16 = v13[5];
    v13[5] = 0;

    uint64_t v17 = v13[4];
    v13[4] = 0;

    v18 = v13[3];
    v13 += 3;
    [v18 invalidate];
    id v19 = *v13;
    void *v13 = 0;
  }
}

- (void)pingWithReply:(id)a3
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __35___GCAppClientProxy_pingWithReply___block_invoke;
  activity_block[3] = &unk_26D22C018;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(App Client) Ping", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)clientCanReceiveEventsDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&obj->_invalid);
  if ((v4 & 1) == 0)
  {
    id v5 = +[GCApplicationStateMonitor sharedInstance];
    objc_super v6 = [(_GCIPCIncomingConnection *)obj->_connection process];
    objc_msgSend(v5, "setApplicationCanReceiveEvents:forPID:", v3, objc_msgSend(v6, "processIdentifier"));
  }
  objc_sync_exit(obj);
}

- (void)connectToControllerServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __64___GCAppClientProxy_connectToControllerServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Controller Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToPlayerIndicatorXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __77___GCAppClientProxy_connectToPlayerIndicatorXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Player Indicator XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToLightXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __67___GCAppClientProxy_connectToLightXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Light XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToAdaptiveTriggersXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __78___GCAppClientProxy_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Adaptive Triggers XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToMotionXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __68___GCAppClientProxy_connectToMotionXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Motion XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToBatteryXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __69___GCAppClientProxy_connectToBatteryXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Battery XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToSettingsXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __70___GCAppClientProxy_connectToSettingsXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Settings XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToGameIntentXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __72___GCAppClientProxy_connectToGameIntentXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Game Intent XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToSystemGestureXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __75___GCAppClientProxy_connectToSystemGestureXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'System Gesture XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToPhotoVideoXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __72___GCAppClientProxy_connectToPhotoVideoXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'PhotoVideo XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

+ (id)settingsSuiteName
{
  if (settingsSuiteName_onceToken != -1) {
    dispatch_once(&settingsSuiteName_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)settingsSuiteName_suiteName;

  return v2;
}

- (NSArray)invalidationHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInvalidationHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong((id *)&self->_keyboardMouseTransaction, 0);
  objc_storeStrong((id *)&self->_publishedControllerDescriptions, 0);
  objc_storeStrong((id *)&self->_controllerServiceClient, 0);
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (NSString)bundleIdentifier
{
  v2 = [(_GCIPCIncomingConnection *)self->_connection process];
  BOOL v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (int)processIdentifier
{
  v2 = [(_GCIPCIncomingConnection *)self->_connection process];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInvalidationHandler:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  id v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if (v6)
  {
    objc_sync_exit(v5);

    uint64_t v11 = 0;
  }
  else
  {
    id v7 = [(_GCAppClientProxy *)v5 invalidationHandlers];
    id v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = (void *)MEMORY[0x223C6E420](v4);
    [v8 addObject:v9];

    [(_GCAppClientProxy *)v5 setInvalidationHandlers:v8];
    objc_sync_exit(v5);

    objc_initWeak(&location, v5);
    id v10 = [_GCObservation alloc];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __58___GCAppClientProxy_DeviceClient__addInvalidationHandler___block_invoke;
    v13[3] = &unk_26D22BE18;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    uint64_t v11 = [(_GCObservation *)v10 initWithCleanupHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (_GCIPCObjectRegistry)IPCObjectRegistry
{
  return (_GCIPCObjectRegistry *)self->_server;
}

- (_GCIPCServiceRegistry)IPCServiceRegistry
{
  return (_GCIPCServiceRegistry *)self->_server;
}

- (void)fetchControllerDescriptionsWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke;
  v4[3] = &unk_26D22A870;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(App Client / Controller Service Server) Fetch Controller Descriptions", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

- (void)playerIndicatorXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / Player Indicator XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)lightXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / Light XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)adaptiveTriggersXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / Adaptive Triggers XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)motionXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / Motion XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)batteryXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / Battery XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)gameIntentXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / GameIntent XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)systemGestureXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / SystemGesture XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)settingsXPCProxyServiceClientEndpointConnect:(id)a3 reply:(id)a4
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke;
  activity_block[3] = &unk_26D22C888;
  void activity_block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  _os_activity_initiate(&dword_220998000, "(App Client / Settings XPC Proxy Service) Client Endpoint Connect", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (BOOL)readBooleanValueWithName:(id)a3
{
  id v3 = (__CFString *)a3;
  if (gc_isInternalBuild())
  {
    id v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Reading %@ property...", (uint8_t *)&v12, 0xCu);
    }
  }
  CFPropertyListRef v4 = CFPreferencesCopyValue(v3, (CFStringRef)+[_GCAppClientProxy settingsSuiteName], kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  id v5 = (void *)v4;
  if (v4 && ((CFTypeID v6 = CFGetTypeID(v4), v6 == CFBooleanGetTypeID()) || v6 == CFNumberGetTypeID())) {
    int v7 = [v5 BOOLValue];
  }
  else {
    int v7 = 0;
  }
  if (gc_isInternalBuild())
  {
    id v10 = getGCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = @"YES";
      int v12 = 138412802;
      v13 = v3;
      if (!v5) {
        uint64_t v11 = @"NO";
      }
      __int16 v14 = 1024;
      int v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "%@ value is %d. Key exists ? %@", (uint8_t *)&v12, 0x1Cu);
    }
  }
  return v7;
}

- (void)checkEmulatedControllerEnabledWithReply:(id)a3
{
  CFPropertyListRef v4 = (void (**)(id, id))a3;
  id v5 = +[NSNumber numberWithBool:[(_GCAppClientProxy *)self readBooleanValueWithName:@"emulatedControllerEnabled"]];
  v4[2](v4, v5);
}

- (void)checkClipBufferingEnabledWithReply:(id)a3
{
  CFPropertyListRef v4 = (void (**)(id, id))a3;
  id v5 = +[NSNumber numberWithBool:[(_GCAppClientProxy *)self readBooleanValueWithName:@"bufferingEnabled"]];
  v4[2](v4, v5);
}

- (void)onVideoRecordingStart:(id)a3
{
  id v3 = a3;
  id v5 = [[GCReplayNotificationOptions alloc] initRecordingStart];
  CFPropertyListRef v4 = +[GCNotificationManager sharedInstance];
  [v4 requestNotification:v5 withReply:v3];
}

- (void)onVideoRecordingStopWithURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gc_isInternalBuild())
  {
    id v10 = getGCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "onVideoRecordingStopWithURL: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2050000000;
  int v7 = (void *)getRPScreenRecorderClass_softClass_0;
  uint64_t v14 = getRPScreenRecorderClass_softClass_0;
  if (!getRPScreenRecorderClass_softClass_0)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    __int16 v16 = __getRPScreenRecorderClass_block_invoke_0;
    uint64_t v17 = &unk_26D22C150;
    v18 = &v11;
    __getRPScreenRecorderClass_block_invoke_0((uint64_t)&buf);
    int v7 = (void *)v12[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  id v9 = objc_msgSend(v8, "sharedRecorder", v11);
  [v9 saveClipToCameraRoll:v5 handler:v6];
}

- (void)generateURLFor:(id)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a4;
  int v7 = &protocolRef_GCLightServiceServerInterface;
  id v8 = a3;
  id v9 = +[NSUUID UUID];
  id v10 = [v9 UUIDString];
  uint64_t v11 = +[NSString stringWithFormat:@"%@_%@.mp4", v8, v10];

  if (gc_isInternalBuild())
  {
    BOOL v25 = getGCLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v30 = v11;
      _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_INFO, "Generating URL for: %@", buf, 0xCu);
    }
  }
  int v12 = NSTemporaryDirectory();
  uint64_t v13 = [v12 stringByExpandingTildeInPath];

  id v14 = v13;
  int v15 = [v11 lastPathComponent];
  if (![v15 length]
    || ([v15 isEqualToString:@"."] & 1) != 0
    || ([v15 isEqualToString:@".."] & 1) != 0)
  {
    __int16 v16 = 0;
  }
  else
  {
    long long v24 = [v14 stringByAppendingPathComponent:v15];
    __int16 v16 = +[NSURL fileURLWithPath:v24 isDirectory:0];
  }
  int isInternalBuild = gc_isInternalBuild();
  if (v16)
  {
    if (isInternalBuild)
    {
      v26 = getGCLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v30 = v16;
        _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_INFO, "Assigning last URL: %@", buf, 0xCu);
      }
    }
    [(_GCControllerManagerServer *)self->_server setLastGeneratedName:v11 directoryHandle:0 url:v16];
    v18 = v14;
    id v19 = v18;
    if (v18)
    {
      uint64_t v20 = v18;
      [v20 fileSystemRepresentation];
      long long v21 = (void *)sandbox_extension_issue_file();
      int v22 = gc_isInternalBuild();
      if (v21)
      {
        if (v22)
        {
          v27 = getGCLogger();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v30 = v20;
            _os_log_impl(&dword_220998000, v27, OS_LOG_TYPE_INFO, "extension token for: %@ was succesfully issued", buf, 0xCu);
          }

          int v7 = &protocolRef_GCLightServiceServerInterface;
        }
        long long v23 = [v7[112] stringWithCString:v21 encoding:4];
        free(v21);
        goto LABEL_17;
      }
      if (v22)
      {
        v28 = getGCLogger();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[_GCAppClientProxy(GCPhotoVideoXPCProxyService) generateURLFor:withReply:]();
        }
      }
    }
LABEL_16:
    long long v23 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (isInternalBuild)
  {
    id v19 = getGCLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_GCAppClientProxy(GCPhotoVideoXPCProxyService) generateURLFor:withReply:]();
    }
    goto LABEL_16;
  }
  long long v23 = 0;
LABEL_18:
  v6[2](v6, v16, v23);
}

- (void)getTheLastGeneratedURLWithReply:(id)a3
{
}

- (void)takeScreenshotWithReply:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  if (gc_isInternalBuild())
  {
    id v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Trying to capture a screenshot", (uint8_t *)v10, 2u);
    }
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2050000000;
  CFPropertyListRef v4 = (void *)getSSUIServiceClass_softClass;
  uint64_t v14 = getSSUIServiceClass_softClass;
  if (!getSSUIServiceClass_softClass)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __getSSUIServiceClass_block_invoke;
    v10[3] = &unk_26D22C150;
    v10[4] = &v11;
    __getSSUIServiceClass_block_invoke((uint64_t)v10);
    CFPropertyListRef v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = objc_alloc_init(v5);
  SEL v7 = NSSelectorFromString(&cfstr_Showscreenshot.isa);
  if (objc_opt_respondsToSelector())
  {
    ((void (*)(id, SEL))[v6 methodForSelector:v7])(v6, v7);
    v3[2](v3, 0);
  }
  else
  {
    id v8 = +[NSError errorWithDomain:@"com.apple.GameController.gamecontrollerd.screenshot" code:3328 userInfo:0];
    ((void (**)(id, void *))v3)[2](v3, v8);
  }
}

- (void)_initWithConnection:server:.cold.1()
{
  OUTLINED_FUNCTION_0_23();
  _os_log_debug_impl(&dword_220998000, v0, OS_LOG_TYPE_DEBUG, "App client proxy created: %@", v1, 0xCu);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "Sending published controller refresh request to remote %@", (uint8_t *)&v3, 0xCu);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  OUTLINED_FUNCTION_0_23();
  OUTLINED_FUNCTION_1_19(&dword_220998000, v0, v1, "%@ has received new active controller devices: %@");
}

@end