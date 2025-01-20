@interface _GCControllerManagerServer
- (BOOL)acceptIncomingDriverConnection:(id)a3;
- (BOOL)addConfiguration:(id)a3 replaceExisting:(BOOL)a4;
- (BOOL)getLastGeneratedName:(id *)a3 directoryHandle:(id *)a4 url:(id *)a5;
- (BOOL)hasConfigurationWithIdentifier:(id)a3;
- (BOOL)removeConfigurationWithIdentifier:(id)a3;
- (BOOL)updateConfiguration:(id)a3;
- (NSSet)activeControllerDevices;
- (NSSet)pidsWithKeyboardAndMouseSupport;
- (_GCControllerManagerServer)init;
- (_GCControllerManagerServer)initWithControllerProfiles:(id)a3;
- (id)_hidqueue_popPendingDriverConnectionsForRegistryID:(id)a3;
- (id)_hidqueue_popPendingFilterConnectionsForRegistryID:(id)a3;
- (id)configurationWithIdentifier:(id)a3;
- (id)lastGeneratedURL;
- (id)logicalDevices;
- (id)makeHIDEventSource:(__IOHIDEventSystemClient *)a3;
- (void)_hidqueue_pushPendingDriverConnection:(id)a3 forRegistryID:(id)a4;
- (void)_hidqueue_pushPendingFilterConnection:(id)a3 forRegistryID:(id)a4;
- (void)_onqueue_refreshControllers;
- (void)_onqueue_refreshLogicalDevices;
- (void)_onqueue_registerLogicalDevice:(id)a3;
- (void)_onqueue_registerPhysicalDevice:(id)a3;
- (void)_onqueue_signalGameControllerFocusModeEvent;
- (void)_onqueue_unregisterLogicalDevice:(id)a3;
- (void)_onqueue_unregisterPhysicalDevice:(id)a3;
- (void)_rebuildCoPilotConfigurations;
- (void)_refreshCoPilotSettings;
- (void)dealloc;
- (void)deviceManager:(id)a3 deviceDidConnect:(id)a4;
- (void)deviceManager:(id)a3 deviceDidDisconnect:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onHIDServiceAdded:(id)a3;
- (void)onHIDServiceRemoved:(id)a3;
- (void)refreshActiveConfigurations;
- (void)refreshActiveConfigurationsWithCompletion:(id)a3;
- (void)setActiveControllerDevices:(id)a3;
- (void)setLastGeneratedName:(id)a3 directoryHandle:(id)a4 url:(id)a5;
- (void)setPidsWithKeyboardAndMouseSupport:(id)a3;
@end

@implementation _GCControllerManagerServer

- (id)logicalDevices
{
  return self->_logicalDevices;
}

- (_GCControllerManagerServer)init
{
  v3 = AllControllerProfiles();
  v4 = [(_GCControllerManagerServer *)self initWithControllerProfiles:v3];

  return v4;
}

- (_GCControllerManagerServer)initWithControllerProfiles:(id)a3
{
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)_GCControllerManagerServer;
  v5 = [(_GCControllerManager *)&v74 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc((Class)&off_26D2B4CF0), "initWithCapacity:", objc_msgSend(v4, "count"));
    allDeviceManagers = v5->_allDeviceManagers;
    v5->_allDeviceManagers = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_msgSend(objc_alloc((Class)&off_26D2B4CF0), "initWithCapacity:", objc_msgSend(v4, "count"));
    physicalDeviceManagers = v5->_physicalDeviceManagers;
    v5->_physicalDeviceManagers = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_msgSend(objc_alloc((Class)&off_26D2B4CF0), "initWithCapacity:", objc_msgSend(v4, "count"));
    logicalDeviceManagers = v5->_logicalDeviceManagers;
    v5->_logicalDeviceManagers = (NSMutableDictionary *)v10;

    uint64_t v12 = GCLookupService();
    settingsStore = v5->_settingsStore;
    uint64_t v64 = 208;
    v5->_settingsStore = (GCSSettingsStore *)v12;

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v65 = v4;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v71 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_26D290330, v64))
          {
            v20 = [v19 deviceManager];
            [v20 setDeviceRegistry:v5];
            v21 = v5->_allDeviceManagers;
            v22 = [v20 identifier];
            [(NSMutableDictionary *)v21 setObject:v20 forKey:v22];

            if ([v20 conformsToProtocol:&unk_26D291708])
            {
              v23 = v5->_physicalDeviceManagers;
              v24 = [v20 identifier];
              [(NSMutableDictionary *)v23 setObject:v20 forKey:v24];
            }
            if ([v20 conformsToProtocol:&unk_26D291800])
            {
              v25 = v5->_logicalDeviceManagers;
              v26 = [v20 identifier];
              [(NSMutableDictionary *)v25 setObject:v20 forKey:v26];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v16);
    }

    v27 = objc_opt_new();
    [v27 setDeviceRegistry:v5];
    v28 = v5->_allDeviceManagers;
    v29 = [v27 identifier];
    [(NSMutableDictionary *)v28 setObject:v27 forKey:v29];

    v30 = v5->_physicalDeviceManagers;
    v31 = [v27 identifier];
    [(NSMutableDictionary *)v30 setObject:v27 forKey:v31];

    v32 = v5->_logicalDeviceManagers;
    v33 = [v27 identifier];
    [(NSMutableDictionary *)v32 setObject:v27 forKey:v33];

    v5->_configurationsLock._os_unfair_lock_opaque = 0;
    v34 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    configurations = v5->_configurations;
    v5->_configurations = v34;

    v36 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    copilotConfigurations = v5->_copilotConfigurations;
    v5->_copilotConfigurations = v36;

    uint64_t v38 = GCLookupService();
    defaults = v5->_defaults;
    v5->_defaults = (GCUserDefaults *)v38;

    copilotSettings = v5->_copilotSettings;
    v5->_copilotSettings = (NSArray *)&__NSArray0__struct;

    v41 = [*(id *)((char *)&v5->super.super.isa + v64) copilotFusedControllers];
    [v41 addObserver:v5 forKeyPath:@"values" options:5 context:0];

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    allDevices = v5->_allDevices;
    v5->_allDevices = v42;

    v44 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    physicalDevices = v5->_physicalDevices;
    v5->_physicalDevices = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    logicalDevices = v5->_logicalDevices;
    v5->_logicalDevices = v46;

    v48 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    activeConfigurations = v5->_activeConfigurations;
    v5->_activeConfigurations = v48;

    v50 = (NSSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    activeControllerDevices = v5->_activeControllerDevices;
    v5->_activeControllerDevices = v50;

    v52 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    hidServices = v5->_hidServices;
    v5->_hidServices = v52;

    v54 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    hidServiceOwners = v5->_hidServiceOwners;
    v5->_hidServiceOwners = v54;

    v56 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    pendingDriverConnections = v5->_pendingDriverConnections;
    v5->_pendingDriverConnections = v56;

    v58 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    pendingFilterConnections = v5->_pendingFilterConnections;
    v5->_pendingFilterConnections = v58;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke;
    block[3] = &unk_26D22A8C0;
    v60 = v5;
    v69 = v60;
    dispatch_block_t v61 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v61);

    v62 = [(_GCControllerManager *)v60 controllersQueue];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke_2;
    v66[3] = &unk_26D22A8C0;
    v67 = v60;
    dispatch_async(v62, v66);

    id v4 = v65;
  }

  return v5;
}

- (void)dealloc
{
  [(GCUserDefaults *)self->_defaults removeObserver:self forKeyPath:@"configurations_v1" context:0];
  v3 = [(GCSSettingsStore *)self->_settingsStore copilotFusedControllers];

  if (v3)
  {
    id v4 = [(GCSSettingsStore *)self->_settingsStore copilotFusedControllers];
    [v4 removeObserver:self forKeyPath:@"values" context:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)_GCControllerManagerServer;
  [(_GCControllerManager *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(GCSSettingsStore *)self->_settingsStore copilotFusedControllers];
  if (v13 != v11)
  {

LABEL_5:
    v16.receiver = self;
    v16.super_class = (Class)_GCControllerManagerServer;
    [(_GCControllerManagerServer *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_6;
  }
  int v14 = [v10 isEqualToString:@"values"];

  if (!v14) {
    goto LABEL_5;
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v15 = _os_activity_create(&dword_220998000, "Co-pilot Settings Did Change", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v15, &state);
  -[_GCControllerManagerServer _refreshCoPilotSettings]((id *)&self->super.super.isa);
  os_activity_scope_leave(&state);

LABEL_6:
}

- (void)_refreshCoPilotSettings
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_220998000, v0, v1, "New co-pilot settings: %@", v2);
}

- (void)_onqueue_refreshControllers
{
  v3 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_msgSend(objc_alloc((Class)&off_26D2B4EF0), "initWithCapacity:", -[NSMutableDictionary count](self->_logicalDevices, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = [(NSMutableDictionary *)self->_logicalDevices allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 conformsToProtocol:&unk_26D292EB0]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(_GCControllerManagerServer *)self setActiveControllerDevices:v4];
}

- (void)_onqueue_refreshLogicalDevices
{
  v3 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new();
  os_unfair_lock_lock(&self->_configurationsLock);
  [v4 setConfigurationsIN:self->_configurations];
  os_unfair_lock_unlock(&self->_configurationsLock);
  [v4 setDeviceManagersIN:self->_logicalDeviceManagers];
  [v4 setPhysicalDevicesIN:self->_physicalDevices];
  [v4 evaluate];
  v81 = v4;
  objc_super v5 = [v4 viableConfigurationsOUT];
  id v84 = objc_alloc_init((Class)&off_26D2B4AE0);
  id v83 = objc_alloc_init((Class)&off_26D2B4AE0);
  id v87 = objc_alloc_init((Class)&off_26D2B4AE0);
  id v82 = objc_alloc_init((Class)&off_26D2B4AE0);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v94 = self;
  obj = self->_activeConfigurations;
  uint64_t v6 = [(NSMutableSet *)obj countByEnumeratingWithState:&v115 objects:v130 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v116;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v116 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(NSObject **)(*((void *)&v115 + 1) + 8 * v9);
        long long v11 = [v5 member:v10];
        long long v12 = v11;
        if (!v11 || ([v11 isEqualToConfiguration:v10] & 1) == 0)
        {
          logicalDevices = v94->_logicalDevices;
          long long v14 = [v10 deviceIdentifier];
          uint64_t v15 = [(NSMutableDictionary *)logicalDevices objectForKey:v14];

          if (v15)
          {
            if (gc_isInternalBuild())
            {
              v18 = getGCLogger();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v122 = v15;
                _os_log_debug_impl(&dword_220998000, v18, OS_LOG_TYPE_DEBUG, "Deactivate logical device: %@", buf, 0xCu);
              }
            }
            objc_super v16 = [v15 manager];
            if (objc_opt_respondsToSelector()) {
              [v15 deactivateLogical];
            }
            if (objc_opt_respondsToSelector()) {
              [v16 deactivateLogicalDevice:v15];
            }
            [v87 addObject:v15];
            [v84 addObject:v10];
            goto LABEL_15;
          }
          uint64_t v17 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
          [v17 handleFailureInMethod:a2, v94, @"GCControllerManagerServer.m", 256, @"Can't find device for active configuration: %@", v10 object file lineNumber description];

          if (gc_isInternalBuild())
          {
            objc_super v16 = getGCLogger();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v122 = v10;
              _os_log_error_impl(&dword_220998000, v16, OS_LOG_TYPE_ERROR, "#BUG Can't find device for active configuration: %@", buf, 0xCu);
            }
LABEL_15:
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v19 = [(NSMutableSet *)obj countByEnumeratingWithState:&v115 objects:v130 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v88 = v87;
  uint64_t v20 = [v88 countByEnumeratingWithState:&v111 objects:v129 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v112;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v112 != v22) {
          objc_enumerationMutation(v88);
        }
        v24 = *(NSObject **)(*((void *)&v111 + 1) + 8 * v23);
        if (gc_isInternalBuild())
        {
          v25 = getGCLogger();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v24;
            _os_log_debug_impl(&dword_220998000, v25, OS_LOG_TYPE_DEBUG, "Unregister device: %@", buf, 0xCu);
          }
        }
        [(_GCControllerManagerServer *)v94 _onqueue_unregisterLogicalDevice:v24];
        ++v23;
      }
      while (v21 != v23);
      uint64_t v26 = [v88 countByEnumeratingWithState:&v111 objects:v129 count:16];
      uint64_t v21 = v26;
    }
    while (v26);
  }

  v27 = v94;
  [(NSMutableSet *)v94->_activeConfigurations gc_removeObjectsInArray:v84];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v89 = v5;
  uint64_t v28 = [v89 countByEnumeratingWithState:&v107 objects:v128 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v108;
    uint64_t v85 = *(void *)v108;
    do
    {
      uint64_t v31 = 0;
      uint64_t v86 = v29;
      do
      {
        if (*(void *)v108 != v30) {
          objc_enumerationMutation(v89);
        }
        v32 = *(NSObject **)(*((void *)&v107 + 1) + 8 * v31);
        if (([(NSMutableSet *)v27->_activeConfigurations containsObject:v32] & 1) == 0)
        {
          uint64_t v90 = v31;
          logicalDeviceManagers = v27->_logicalDeviceManagers;
          v34 = [v32 deviceBuilderIdentifier];
          uint64_t v35 = [(NSMutableDictionary *)logicalDeviceManagers objectForKey:v34];

          obja = v35;
          if (!v35)
          {
            v57 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
            [v57 handleFailureInMethod:a2, v27, @"GCControllerManagerServer.m", 298, @"Missing device manager for: %@", v32 object file lineNumber description];
          }
          v36 = [v32 deviceDependencies];
          v37 = objc_msgSend(objc_alloc((Class)&off_26D2B4EF0), "initWithCapacity:", objc_msgSend(v36, "count"));
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          uint64_t v38 = v36;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v103 objects:v127 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v104;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v104 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v43 = *(void *)(*((void *)&v103 + 1) + 8 * i);
                v44 = [(NSMutableDictionary *)v27->_physicalDevices objectForKey:v43];
                if (v44)
                {
                  [v37 addObject:v44];
                }
                else
                {
                  v45 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
                  [v45 handleFailureInMethod:a2, v94, @"GCControllerManagerServer.m", 307, @"Did not find a physical device with identifier '%@', needed for %@", v43, v32 object file lineNumber description];

                  v27 = v94;
                }
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v103 objects:v127 count:16];
            }
            while (v40);
          }

          uint64_t v46 = [v38 count];
          if (v46 != [v37 count])
          {
            v27 = v94;
            uint64_t v29 = v86;
            uint64_t v30 = v85;
            if (gc_isInternalBuild())
            {
              v48 = getGCLogger();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v122 = v32;
                __int16 v123 = 2112;
                v124 = v38;
                __int16 v125 = 2112;
                id v126 = v37;
                _os_log_error_impl(&dword_220998000, v48, OS_LOG_TYPE_ERROR, "#BUG Missing dependencies for %@\nExpected: %@\nHave: %@", buf, 0x20u);
              }
LABEL_68:
            }
            uint64_t v31 = v90;
            goto LABEL_70;
          }
          v47 = [obja makeDeviceWithConfiguration:v32 dependencies:v37];
          v48 = v47;
          uint64_t v30 = v85;
          uint64_t v29 = v86;
          if (v47)
          {
            v49 = [v47 identifier];
            v50 = [v32 deviceIdentifier];
            char v51 = [v49 isEqual:v50];

            if (v51)
            {
              [v82 addObject:v48];
              [v83 addObject:v32];
              goto LABEL_67;
            }
            v56 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
            [v56 handleFailureInMethod:a2, v94, @"GCControllerManagerServer.m", 332, @"Identifier of materialized device %@ does not match its configuration %@", v48, v32 object file lineNumber description];

            if (!gc_isInternalBuild())
            {
LABEL_67:
              v27 = v94;
              goto LABEL_68;
            }
            v53 = getGCLogger();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
LABEL_73:

              goto LABEL_67;
            }
            *(_DWORD *)buf = 138412546;
            v122 = v48;
            __int16 v123 = 2112;
            v124 = v32;
            v54 = v53;
            v55 = "#BUG Identifier of materialized device %@ does not match its configuration %@";
          }
          else
          {
            v52 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
            [v52 handleFailureInMethod:a2, v94, @"GCControllerManagerServer.m", 322, @"%@ did not return a device for configuration: %@", obja, v32 object file lineNumber description];

            if (!gc_isInternalBuild()) {
              goto LABEL_67;
            }
            v53 = getGCLogger();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              goto LABEL_73;
            }
            *(_DWORD *)buf = 138412546;
            v122 = obja;
            __int16 v123 = 2112;
            v124 = v32;
            v54 = v53;
            v55 = "#BUG %@ did not return a device for configuration: %@";
          }
          _os_log_error_impl(&dword_220998000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x16u);
          goto LABEL_73;
        }
LABEL_70:
        ++v31;
      }
      while (v31 != v29);
      uint64_t v58 = [v89 countByEnumeratingWithState:&v107 objects:v128 count:16];
      uint64_t v29 = v58;
    }
    while (v58);
  }

  [(NSMutableSet *)v27->_activeConfigurations addObjectsFromArray:v83];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v59 = v82;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v99 objects:v120 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v100;
    do
    {
      uint64_t v63 = 0;
      do
      {
        if (*(void *)v100 != v62) {
          objc_enumerationMutation(v59);
        }
        uint64_t v64 = *(NSObject **)(*((void *)&v99 + 1) + 8 * v63);
        if (gc_isInternalBuild())
        {
          id v65 = getGCLogger();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v64;
            _os_log_debug_impl(&dword_220998000, v65, OS_LOG_TYPE_DEBUG, "Register device: %@", buf, 0xCu);
          }
        }
        [(_GCControllerManagerServer *)v94 _onqueue_registerLogicalDevice:v64];
        ++v63;
      }
      while (v61 != v63);
      uint64_t v66 = [v59 countByEnumeratingWithState:&v99 objects:v120 count:16];
      uint64_t v61 = v66;
    }
    while (v66);
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v67 = v59;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v95 objects:v119 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v96;
    do
    {
      uint64_t v71 = 0;
      do
      {
        if (*(void *)v96 != v70) {
          objc_enumerationMutation(v67);
        }
        long long v72 = *(NSObject **)(*((void *)&v95 + 1) + 8 * v71);
        if (gc_isInternalBuild())
        {
          objc_super v74 = getGCLogger();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v72;
            _os_log_debug_impl(&dword_220998000, v74, OS_LOG_TYPE_DEBUG, "Activate logical device: %@", buf, 0xCu);
          }
        }
        long long v73 = [v72 manager];
        if (objc_opt_respondsToSelector()) {
          [v73 activateLogicalDevice:v72];
        }
        if (objc_opt_respondsToSelector()) {
          [v72 activateLogical];
        }

        ++v71;
      }
      while (v69 != v71);
      uint64_t v75 = [v67 countByEnumeratingWithState:&v95 objects:v119 count:16];
      uint64_t v69 = v75;
    }
    while (v75);
  }

  if (gc_isInternalBuild())
  {
    v78 = getGCLogger();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v122 = v89;
      __int16 v123 = 2112;
      v124 = v67;
      __int16 v125 = 2112;
      id v126 = v88;
      _os_log_impl(&dword_220998000, v78, OS_LOG_TYPE_DEFAULT, "New configurations: %@\nincomingDevices: %@\noutgoingDevices: %@", buf, 0x20u);
    }
  }
  uint64_t v76 = [(NSMutableSet *)v94->_activeConfigurations count];
  if (v76 != [v89 count])
  {
    v79 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v79 handleFailureInMethod:a2 object:v94 file:@"GCControllerManagerServer.m" lineNumber:366 description:@"A configuration is unaccounted for."];
  }
  uint64_t v77 = [(NSMutableDictionary *)v94->_logicalDevices count];
  if (v77 != [(NSMutableSet *)v94->_activeConfigurations count])
  {
    v80 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v80 handleFailureInMethod:a2 object:v94 file:@"GCControllerManagerServer.m" lineNumber:367 description:@"We are missing a device."];
  }
  [(_GCControllerManagerServer *)v94 _onqueue_refreshControllers];
}

- (void)_onqueue_registerPhysicalDevice:(id)a3
{
  id v16 = a3;
  objc_super v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  if (([v16 conformsToProtocol:&unk_26D293490] & 1) == 0)
  {
    long long v14 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v14 handleFailureInMethod:a2, self, @"GCControllerManagerServer.m", 374, @"%@ is not a <_GCPhysicalDevice>", v16 object file lineNumber description];
  }
  uint64_t v6 = [v16 identifier];
  uint64_t v7 = [(NSMutableDictionary *)self->_allDevices objectForKey:v6];

  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_allDevices objectForKey:v6];

    if (v8 != v16)
    {
      uint64_t v15 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v15 handleFailureInMethod:a2, self, @"GCControllerManagerServer.m", 380, @"Identifier '%@' is already registered. Possible duplicate identifier?", v6 object file lineNumber description];
    }
  }
  allDevices = self->_allDevices;
  id v10 = [v16 identifier];
  [(NSMutableDictionary *)allDevices setObject:v16 forKey:v10];

  physicalDevices = self->_physicalDevices;
  long long v12 = [v16 identifier];
  [(NSMutableDictionary *)physicalDevices setObject:v16 forKey:v12];

  long long v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"GCPhysicalDeviceWasRegisteredNotification" object:v16 userInfo:0];
}

- (void)_onqueue_unregisterPhysicalDevice:(id)a3
{
  id v11 = a3;
  objc_super v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v11 identifier];
  uint64_t v7 = [(NSMutableDictionary *)self->_physicalDevices objectForKey:v6];

  if (!v7)
  {
    id v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"GCControllerManagerServer.m", 392, @"%@ was not previously registered", v11 object file lineNumber description];
  }
  [(NSMutableDictionary *)self->_physicalDevices removeObjectForKey:v6];
  id v8 = [(NSMutableDictionary *)self->_logicalDevices objectForKey:v6];

  if (!v8) {
    [(NSMutableDictionary *)self->_allDevices removeObjectForKey:v6];
  }
  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"GCPhysicalDeviceWasUnregisteredNotification" object:v11 userInfo:0];
}

- (void)_onqueue_registerLogicalDevice:(id)a3
{
  id v16 = a3;
  objc_super v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  if (([v16 conformsToProtocol:&unk_26D293540] & 1) == 0)
  {
    long long v14 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v14 handleFailureInMethod:a2, self, @"GCControllerManagerServer.m", 402, @"%@ is not a <_GCLogicalDevice>", v16 object file lineNumber description];
  }
  uint64_t v6 = [v16 identifier];
  uint64_t v7 = [(NSMutableDictionary *)self->_allDevices objectForKey:v6];

  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_allDevices objectForKey:v6];

    if (v8 != v16)
    {
      uint64_t v15 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v15 handleFailureInMethod:a2, self, @"GCControllerManagerServer.m", 408, @"Identifier '%@' is already registered. Possible duplicate identifier?", v6 object file lineNumber description];
    }
  }
  allDevices = self->_allDevices;
  id v10 = [v16 identifier];
  [(NSMutableDictionary *)allDevices setObject:v16 forKey:v10];

  logicalDevices = self->_logicalDevices;
  long long v12 = [v16 identifier];
  [(NSMutableDictionary *)logicalDevices setObject:v16 forKey:v12];

  long long v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"GCLogicalDeviceWasRegisteredNotification" object:v16 userInfo:0];

  [(_GCControllerManagerServer *)self _onqueue_signalGameControllerFocusModeEvent];
}

- (void)_onqueue_unregisterLogicalDevice:(id)a3
{
  id v11 = a3;
  objc_super v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v11 identifier];
  uint64_t v7 = [(NSMutableDictionary *)self->_logicalDevices objectForKey:v6];

  if (!v7)
  {
    id v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"GCControllerManagerServer.m", 421, @"%@ was not previously registered", v11 object file lineNumber description];
  }
  [(NSMutableDictionary *)self->_logicalDevices removeObjectForKey:v6];
  id v8 = [(NSMutableDictionary *)self->_physicalDevices objectForKey:v6];

  if (!v8) {
    [(NSMutableDictionary *)self->_allDevices removeObjectForKey:v6];
  }
  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"GCLogicalDeviceWasUnregisteredNotification" object:v11 userInfo:0];

  [(_GCControllerManagerServer *)self _onqueue_signalGameControllerFocusModeEvent];
}

- (void)deviceManager:(id)a3 deviceDidConnect:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_GCControllerManager *)self controllersQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __61___GCControllerManagerServer_deviceManager_deviceDidConnect___block_invoke;
  v8[3] = &unk_26D22A8E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(v6, v8);
}

- (void)deviceManager:(id)a3 deviceDidDisconnect:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_GCControllerManager *)self controllersQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __64___GCControllerManagerServer_deviceManager_deviceDidDisconnect___block_invoke;
  v8[3] = &unk_26D22A8E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(v6, v8);
}

- (void)_onqueue_signalGameControllerFocusModeEvent
{
  v3 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(NSMutableDictionary *)self->_logicalDevices count];
  uint64_t v5 = [(NSMutableDictionary *)self->_logicalDevices count];
  if (gc_isInternalBuild())
  {
    uint64_t v15 = getGCLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = @"NO";
      if (v4) {
        id v16 = @"YES";
      }
      int v17 = 138412546;
      v18 = v16;
      __int16 v19 = 2048;
      uint64_t v20 = v5;
      _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "signalGameControllerFocusModeEvent: controllersConnected=%@, numberOfControllersConnected=%lu", (uint8_t *)&v17, 0x16u);
    }
  }
  BOOL v6 = v4 != 0;
  id v7 = BiomeLibrary();
  id v8 = [v7 GameController];
  id v9 = [v8 Connected];

  id v10 = [v9 source];
  id v11 = objc_alloc((Class)&off_26D2B67D8);
  long long v12 = +[NSNumber numberWithBool:v6];
  long long v13 = +[NSNumber numberWithUnsignedInteger:v5];
  long long v14 = (void *)[v11 initWithIsControllerConnected:v12 numberOfControllersConnected:v13];

  [v10 sendEvent:v14];
}

- (void)_rebuildCoPilotConfigurations
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_220998000, v0, v1, "Co-pilot: Rebuild configurations with settings %@", v2);
}

- (BOOL)hasConfigurationWithIdentifier:(id)a3
{
  p_configurationsLock = &self->_configurationsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_configurationsLock);
  BOOL v6 = [(NSMutableSet *)self->_configurations member:v5];

  os_unfair_lock_unlock(p_configurationsLock);
  return v6 != 0;
}

- (id)configurationWithIdentifier:(id)a3
{
  p_configurationsLock = &self->_configurationsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_configurationsLock);
  BOOL v6 = [(NSMutableSet *)self->_configurations member:v5];

  os_unfair_lock_unlock(p_configurationsLock);

  return v6;
}

- (BOOL)addConfiguration:(id)a3 replaceExisting:(BOOL)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_configurationsLock);
  configurations = self->_configurations;
  id v8 = [v6 identifier];
  id v9 = [(NSMutableSet *)configurations member:v8];

  if (!a4 && v9 && (![v9 isTransient] || (objc_msgSend(v6, "isTransient") & 1) != 0))
  {

    os_unfair_lock_unlock(&self->_configurationsLock);
    BOOL v10 = 0;
    goto LABEL_11;
  }
  id v11 = (void *)[v6 copy];

  if (gc_isInternalBuild())
  {
    long long v13 = getGCLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_GCControllerManagerServer addConfiguration:replaceExisting:](v11, v13);
    }

    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v9) {
LABEL_8:
  }
    [(NSMutableSet *)self->_configurations removeObject:v9];
LABEL_9:
  [(NSMutableSet *)self->_configurations addObject:v11];
  if (gc_isInternalBuild())
  {
    long long v14 = getGCLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_INFO, "Added configuration: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  os_unfair_lock_unlock(&self->_configurationsLock);
  -[_GCControllerManagerServer _rebuildCoPilotConfigurations]((uint64_t)self);
  BOOL v10 = 1;
  id v6 = v11;
LABEL_11:

  return v10;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_configurationsLock);
  configurations = self->_configurations;
  id v6 = [v4 identifier];
  id v7 = [(NSMutableSet *)configurations member:v6];

  if (v7)
  {
    id v8 = (void *)[v4 copy];

    if (gc_isInternalBuild())
    {
      BOOL v10 = getGCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_GCControllerManagerServer updateConfiguration:](v8, v10);
      }
    }
    [(NSMutableSet *)self->_configurations removeObject:v8];
    [(NSMutableSet *)self->_configurations addObject:v8];
    if (gc_isInternalBuild())
    {
      id v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        long long v13 = v8;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Updated configuration: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    os_unfair_lock_unlock(&self->_configurationsLock);
    -[_GCControllerManagerServer _rebuildCoPilotConfigurations]((uint64_t)self);
  }
  else
  {
    os_unfair_lock_unlock(&self->_configurationsLock);
    id v8 = v4;
  }

  return v7 != 0;
}

- (BOOL)removeConfigurationWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_configurationsLock);
  id v5 = [(NSMutableSet *)self->_configurations member:v4];
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      id v7 = getGCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[_GCControllerManagerServer removeConfigurationWithIdentifier:](v5, v7);
      }
    }
    [(NSMutableSet *)self->_configurations removeObject:v4];
    if (gc_isInternalBuild())
    {
      id v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        BOOL v10 = v5;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "Removed configuration: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    os_unfair_lock_unlock(&self->_configurationsLock);
    -[_GCControllerManagerServer _rebuildCoPilotConfigurations]((uint64_t)self);
  }
  else
  {
    os_unfair_lock_unlock(&self->_configurationsLock);
  }

  return v5 != 0;
}

- (void)refreshActiveConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_220998000, "Refresh Active Configurations", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = [(_GCControllerManager *)self controllersQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __72___GCControllerManagerServer_refreshActiveConfigurationsWithCompletion___block_invoke;
  v8[3] = &unk_26D22A870;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_barrier_async(v6, v8);

  os_activity_scope_leave(&state);
}

- (void)refreshActiveConfigurations
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_220998000, "Refresh Active Configurations", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  id v4 = [(_GCControllerManager *)self controllersQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57___GCControllerManagerServer_refreshActiveConfigurations__block_invoke;
  block[3] = &unk_26D22A8C0;
  void block[4] = self;
  dispatch_barrier_sync(v4, block);

  os_activity_scope_leave(&state);
}

- (id)makeHIDEventSource:(__IOHIDEventSystemClient *)a3
{
  return 0;
}

- (void)onHIDServiceAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableSet *)self->_hidServices member:v4];

  if (!v5)
  {
    [(NSMutableSet *)self->_hidServices addObject:v4];
    [(_GCControllerManager *)self registerIPCObject:v4];
    v53 = GCPhysicalDeviceProbeScoreNoMatch;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v7 = [(NSMutableDictionary *)self->_physicalDeviceManagers allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v70 objects:v82 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v71;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v71 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          [(NSMutableDictionary *)self->_hidServiceOwners setObject:v12 forKey:v4];
          id v6 = [v12 matchHIDService:v4];
          if (v6 > v53)
          {

            id v15 = v12;
            [v15 claimHIDService:v4];
            if (gc_isInternalBuild())
            {
              v50 = getGCLogger();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
                -[_GCControllerManagerServer onHIDServiceAdded:]();
              }
            }
            v34 = [v4 registryID];
            uint64_t v35 = [(_GCControllerManagerServer *)self _hidqueue_popPendingDriverConnectionsForRegistryID:v34];

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v33 = v35;
            uint64_t v36 = [v33 countByEnumeratingWithState:&v66 objects:v81 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v67;
              do
              {
                uint64_t v39 = 0;
                do
                {
                  if (*(void *)v67 != v38) {
                    objc_enumerationMutation(v33);
                  }
                  uint64_t v40 = *(void **)(*((void *)&v66 + 1) + 8 * v39);
                  if ((objc_opt_respondsToSelector() & 1) == 0) {
                    goto LABEL_90;
                  }
                  if (gc_isInternalBuild())
                  {
                    log = getGCLogger();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v78 = v40;
                      __int16 v79 = 2112;
                      id v80 = v15;
                      _os_log_debug_impl(&dword_220998000, log, OS_LOG_TYPE_DEBUG, "Sending previous driver connection %@ to %@", buf, 0x16u);
                    }
                  }
                  if ((objc_msgSend(v15, "acceptDriverConnection:forHIDService:", v40, v4, log) & 1) == 0)
                  {
LABEL_90:
                    if (gc_isInternalBuild())
                    {
                      log = getGCLogger();
                      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        id v78 = v40;
                        __int16 v79 = 2112;
                        id v80 = v15;
                        _os_log_impl(&dword_220998000, log, OS_LOG_TYPE_INFO, "Dropping incoming driver connection %@ because %@ rejected it.", buf, 0x16u);
                      }
                    }
                    objc_msgSend(v40, "invalidate", log);
                  }
                  ++v39;
                }
                while (v37 != v39);
                uint64_t v41 = [v33 countByEnumeratingWithState:&v66 objects:v81 count:16];
                uint64_t v37 = v41;
              }
              while (v41);
            }

            v42 = [v4 registryID];
            uint64_t v43 = [(_GCControllerManagerServer *)self _hidqueue_popPendingFilterConnectionsForRegistryID:v42];

            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v25 = v43;
            uint64_t v44 = [v25 countByEnumeratingWithState:&v62 objects:v76 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v46 = *(void *)v63;
              do
              {
                uint64_t v47 = 0;
                do
                {
                  if (*(void *)v63 != v46) {
                    objc_enumerationMutation(v25);
                  }
                  v48 = *(void **)(*((void *)&v62 + 1) + 8 * v47);
                  if ((objc_opt_respondsToSelector() & 1) == 0) {
                    goto LABEL_91;
                  }
                  if (gc_isInternalBuild())
                  {
                    log = getGCLogger();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v78 = v48;
                      __int16 v79 = 2112;
                      id v80 = v15;
                      _os_log_debug_impl(&dword_220998000, log, OS_LOG_TYPE_DEBUG, "Sending previous filter connection %@ to %@", buf, 0x16u);
                    }
                  }
                  if ((objc_msgSend(v15, "acceptFilterConnection:forHIDService:", v48, v4, log) & 1) == 0)
                  {
LABEL_91:
                    if (gc_isInternalBuild())
                    {
                      log = getGCLogger();
                      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        id v78 = v48;
                        __int16 v79 = 2112;
                        id v80 = v15;
                        _os_log_impl(&dword_220998000, log, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ rejected it.", buf, 0x16u);
                      }
                    }
                    objc_msgSend(v48, "invalidate", log);
                  }
                  ++v47;
                }
                while (v45 != v47);
                uint64_t v49 = [v25 countByEnumeratingWithState:&v62 objects:v76 count:16];
                uint64_t v45 = v49;
              }
              while (v49);
            }

            goto LABEL_79;
          }
          [(NSMutableDictionary *)self->_hidServiceOwners removeObjectForKey:v4];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (gc_isInternalBuild())
    {
      char v51 = getGCLogger();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v78 = v4;
        _os_log_impl(&dword_220998000, v51, OS_LOG_TYPE_INFO, "No device manager claimed HID service %@.", buf, 0xCu);
      }
    }
    long long v13 = [v4 registryID];
    long long v14 = [(_GCControllerManagerServer *)self _hidqueue_popPendingDriverConnectionsForRegistryID:v13];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v75 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v59;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v59 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v58 + 1) + 8 * v19);
          if (gc_isInternalBuild())
          {
            uint64_t v21 = getGCLogger();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v78 = v20;
              __int16 v79 = 2112;
              id v80 = v4;
              _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_INFO, "Ignoring incoming driver connection %@ because it is for unclaimed service %@", buf, 0x16u);
            }
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v22 = [v15 countByEnumeratingWithState:&v58 objects:v75 count:16];
        uint64_t v17 = v22;
      }
      while (v22);
    }

    uint64_t v23 = [v4 registryID];
    v24 = [(_GCControllerManagerServer *)self _hidqueue_popPendingFilterConnectionsForRegistryID:v23];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v74 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v55;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v55 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v54 + 1) + 8 * v29);
          if (gc_isInternalBuild())
          {
            uint64_t v31 = getGCLogger();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v78 = v30;
              __int16 v79 = 2112;
              id v80 = v4;
              _os_log_impl(&dword_220998000, v31, OS_LOG_TYPE_INFO, "Ignoring incoming filter connection %@ because it is for unclaimed service %@", buf, 0x16u);
            }
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v32 = [v25 countByEnumeratingWithState:&v54 objects:v74 count:16];
        uint64_t v27 = v32;
      }
      while (v32);
    }
    id v33 = v25;
    id v6 = v53;
LABEL_79:

    goto LABEL_80;
  }
  if (gc_isInternalBuild())
  {
    id v6 = getGCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_GCControllerManagerServer onHIDServiceAdded:]();
    }
LABEL_80:
  }
}

- (void)onHIDServiceRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_hidServiceOwners objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 relinquishHIDService:v4];
    [(NSMutableDictionary *)self->_hidServiceOwners removeObjectForKey:v4];
    [(NSMutableSet *)self->_hidServices removeObject:v4];
  }
  else if (gc_isInternalBuild())
  {
    id v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_GCControllerManagerServer onHIDServiceRemoved:]();
    }
  }
}

- (id)_hidqueue_popPendingDriverConnectionsForRegistryID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  id v5 = [(NSMutableDictionary *)self->_pendingDriverConnections objectForKey:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_setAssociatedObject(*(id *)(*((void *)&v11 + 1) + 8 * i), "DriverConnectionInvalidationRegistrationKey", 0, (void *)1);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_pendingDriverConnections removeObjectForKey:v4];

  return v5;
}

- (void)_hidqueue_pushPendingDriverConnection:(id)a3 forRegistryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  if (!self->_pendingDriverConnections)
  {
    uint64_t v8 = (NSMutableDictionary *)[objc_alloc((Class)&off_26D2B4CF0) initWithCapacity:1];
    pendingDriverConnections = self->_pendingDriverConnections;
    self->_pendingDriverConnections = v8;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke;
  v13[3] = &unk_26D22A938;
  id v15 = v6;
  v13[4] = self;
  id v10 = v7;
  id v14 = v10;
  long long v11 = [v6 addInvalidationHandler:v13];
  objc_setAssociatedObject(v6, "DriverConnectionInvalidationRegistrationKey", v11, (void *)1);
  long long v12 = [(NSMutableDictionary *)self->_pendingDriverConnections objectForKey:v10];
  if (!v12)
  {
    long long v12 = (void *)[objc_alloc((Class)&off_26D2B4EF0) initWithCapacity:1];
    [(NSMutableDictionary *)self->_pendingDriverConnections setObject:v12 forKey:v10];
  }
  [v12 addObject:v6];
}

- (id)_hidqueue_popPendingFilterConnectionsForRegistryID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  id v5 = [(NSMutableDictionary *)self->_pendingFilterConnections objectForKey:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_setAssociatedObject(*(id *)(*((void *)&v11 + 1) + 8 * i), "FilterConnectionInvalidationRegistrationKey", 0, (void *)1);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_pendingFilterConnections removeObjectForKey:v4];

  return v5;
}

- (void)_hidqueue_pushPendingFilterConnection:(id)a3 forRegistryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  if (!self->_pendingFilterConnections)
  {
    uint64_t v8 = (NSMutableDictionary *)[objc_alloc((Class)&off_26D2B4CF0) initWithCapacity:1];
    pendingFilterConnections = self->_pendingFilterConnections;
    self->_pendingFilterConnections = v8;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke;
  v13[3] = &unk_26D22A938;
  id v15 = v6;
  v13[4] = self;
  id v10 = v7;
  id v14 = v10;
  long long v11 = [v6 addInvalidationHandler:v13];
  objc_setAssociatedObject(v6, "FilterConnectionInvalidationRegistrationKey", v11, (void *)1);
  long long v12 = [(NSMutableDictionary *)self->_pendingFilterConnections objectForKey:v10];
  if (!v12)
  {
    long long v12 = (void *)[objc_alloc((Class)&off_26D2B4EF0) initWithCapacity:1];
    [(NSMutableDictionary *)self->_pendingFilterConnections setObject:v12 forKey:v10];
  }
  [v12 addObject:v6];
}

- (NSSet)activeControllerDevices
{
  return (NSSet *)objc_getProperty(self, a2, 312, 1);
}

- (void)setActiveControllerDevices:(id)a3
{
}

- (NSSet)pidsWithKeyboardAndMouseSupport
{
  return (NSSet *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPidsWithKeyboardAndMouseSupport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidsWithKeyboardAndMouseSupport, 0);
  objc_storeStrong((id *)&self->_activeControllerDevices, 0);
  objc_storeStrong((id *)&self->_lastGeneratedURL, 0);
  objc_storeStrong((id *)&self->_lastGeneratedDirectoryHandle, 0);
  objc_storeStrong((id *)&self->_lastGeneratedName, 0);
  objc_storeStrong((id *)&self->_pendingFilterConnections, 0);
  objc_storeStrong((id *)&self->_pendingDriverConnections, 0);
  objc_storeStrong((id *)&self->_hidServiceOwners, 0);
  objc_storeStrong((id *)&self->_hidServices, 0);
  objc_storeStrong((id *)&self->_activeConfigurations, 0);
  objc_storeStrong((id *)&self->_logicalDevices, 0);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_allDevices, 0);
  objc_storeStrong((id *)&self->_copilotConfigurations, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_copilotSettings, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_logicalDeviceManagers, 0);
  objc_storeStrong((id *)&self->_physicalDeviceManagers, 0);

  objc_storeStrong((id *)&self->_allDeviceManagers, 0);
}

- (BOOL)acceptIncomingDriverConnection:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_220998000, "Incoming Driver Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  [v4 setExportedObject:self];
  [v4 resume];
  id v6 = [v4 remoteProxy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke;
  v9[3] = &unk_26D22A988;
  id v10 = v4;
  long long v11 = self;
  id v7 = v4;
  [v6 fetchDeviceRegistryIDWithReply:v9];

  os_activity_scope_leave(&state);
  return 1;
}

- (void)setLastGeneratedName:(id)a3 directoryHandle:(id)a4 url:(id)a5
{
  uint64_t v8 = (NSString *)a3;
  uint64_t v9 = (NSFileHandle *)a4;
  id v10 = (NSURL *)a5;
  obj = self;
  objc_sync_enter(obj);
  lastGeneratedName = obj->_lastGeneratedName;
  obj->_lastGeneratedName = v8;
  long long v12 = v8;

  lastGeneratedDirectoryHandle = obj->_lastGeneratedDirectoryHandle;
  obj->_lastGeneratedDirectoryHandle = v9;
  id v14 = v9;

  lastGeneratedURL = obj->_lastGeneratedURL;
  obj->_lastGeneratedURL = v10;

  objc_sync_exit(obj);
}

- (BOOL)getLastGeneratedName:(id *)a3 directoryHandle:(id *)a4 url:(id *)a5
{
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = v8->_lastGeneratedName;
  lastGeneratedName = v8->_lastGeneratedName;
  v8->_lastGeneratedName = 0;

  lastGeneratedDirectoryHandle = v8->_lastGeneratedDirectoryHandle;
  v8->_lastGeneratedDirectoryHandle = 0;
  long long v12 = lastGeneratedDirectoryHandle;

  long long v13 = v8->_lastGeneratedURL;
  lastGeneratedURL = v8->_lastGeneratedURL;
  v8->_lastGeneratedURL = 0;

  objc_sync_exit(v8);
  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *a5 = v13;
  }
  if (v9) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v17 = !v15 || v13 != 0;

  return v17;
}

- (id)lastGeneratedURL
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastGeneratedURL;
  lastGeneratedURL = v2->_lastGeneratedURL;
  v2->_lastGeneratedURL = 0;

  objc_sync_exit(v2);

  return v3;
}

- (void)addConfiguration:(void *)a1 replaceExisting:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_220998000, a2, v4, "Adding configuration: %@", v5);
}

- (void)updateConfiguration:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_220998000, a2, v4, "Updating configuration: %@", v5);
}

- (void)removeConfigurationWithIdentifier:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_220998000, a2, v4, "Removing configuration: %@", v5);
}

- (void)onHIDServiceAdded:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_220998000, v0, v1, "Device manager %@ has claimed ownership of HID service %@.");
}

- (void)onHIDServiceAdded:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_220998000, v0, v1, "Ignoring added notification for HID service %@, because it is already known.", v2);
}

- (void)onHIDServiceRemoved:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_220998000, v0, v1, "Ignoring removed notification for HID service %@, because it was not previously claimed.", v2);
}

@end