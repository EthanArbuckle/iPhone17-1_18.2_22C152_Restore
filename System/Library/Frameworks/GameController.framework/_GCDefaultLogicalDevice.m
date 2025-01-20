@interface _GCDefaultLogicalDevice
- (BOOL)_addClient:(id)a3;
- (BOOL)activeApplicationCanReceiveEvents;
- (BOOL)conformsToProtocol:(id)a3;
- (GCSystemGesturesState)activeSystemGesturesState;
- (NSObject)identifier;
- (NSSet)components;
- (NSSet)underlyingDevices;
- (NSString)debugDescription;
- (NSString)description;
- (_GCDefaultLogicalDevice)init;
- (_GCDefaultLogicalDevice)initWithPhysicalDevice:(id)a3 configuration:(id)a4 manager:(id)a5;
- (_GCDefaultLogicalDeviceDelegate)delegate;
- (_GCDeviceConfiguration)configuration;
- (_GCDeviceManager)manager;
- (_GCPhysicalDevice)underlyingDevice;
- (id)_makeControllerGamepadEventSource;
- (id)hapticDriver;
- (id)makeControllerForClient:(id)a3;
- (id)makeSyntheticController;
- (id)persistentIdentifierForSettings;
- (id)propertyForKey:(id)a3;
- (id)redactedDescription;
- (int)activeApplicationPID;
- (void)_removeClient:(id)a3;
- (void)activateLogical;
- (void)adaptiveTriggersXPCProxyServerEndpoint:(id)a3 didReceiveAdaptiveTriggersChange:(id)a4 forIndex:(int)a5;
- (void)applicationBackgrounded:(int)a3;
- (void)applicationCanReceiveEventsDidChange:(BOOL)a3 forPID:(int)a4;
- (void)applicationForegrounded:(int)a3;
- (void)deactivateLogical;
- (void)dealloc;
- (void)gameIntentXPCProxyServerEndpoint:(id)a3 didReceiveGameIntent:(int64_t)a4;
- (void)lightXPCProxyServerEndpoint:(id)a3 didReceiveLightChange:(id)a4;
- (void)motionXPCProxyServerEndpoint:(id)a3 didReceiveSensorsActiveChange:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4;
- (void)setActiveApplicationCanReceiveEvents:(BOOL)a3;
- (void)setActiveApplicationPID:(int)a3;
- (void)setActiveSystemGesturesState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)settingsDidChange;
- (void)startTrackingSessionForClient:(id)a3;
- (void)stopObservingClientStateChanges:(id)a3;
- (void)stopObservingClientStateChangesForAllClients;
- (void)stopTrackingSessionForClient:(id)a3;
- (void)stopTrackingSessionsForAllClients;
- (void)systemGestureXPCProxyServerEndpoint:(id)a3 didSetSystemGestureStateForInput:(id)a4 enabled:(BOOL)a5;
- (void)systemGestureXPCProxyServerEndpoint:(id)a3 disableSystemGestureForInput:(id)a4;
- (void)systemGestureXPCProxyServerEndpoint:(id)a3 enableSystemGestureForInput:(id)a4;
- (void)updateLightForActiveClient;
@end

@implementation _GCDefaultLogicalDevice

- (_GCDefaultLogicalDevice)initWithPhysicalDevice:(id)a3 configuration:(id)a4 manager:(id)a5
{
  id v139 = a3;
  id v9 = a4;
  id v10 = a5;
  v183.receiver = self;
  v183.super_class = (Class)_GCDefaultLogicalDevice;
  v11 = [(_GCDefaultLogicalDevice *)&v183 init];

  if (v11)
  {
    uint64_t v12 = [v9 deviceIdentifier];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_underlyingDevice, a3);
    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_storeWeak((id *)&v11->_manager, v10);
    uint64_t v14 = +[NSMapTable strongToStrongObjectsMapTable];
    clients = v11->_clients;
    v11->_clients = (NSMapTable *)v14;

    uint64_t v16 = objc_opt_new();
    pidToAnalytics = v11->_pidToAnalytics;
    v11->_pidToAnalytics = (NSMutableDictionary *)v16;

    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    v18 = [(_GCDefaultLogicalDevice *)v11 components];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v179 objects:v192 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v180;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v180 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v179 + 1) + 8 * i);
          if ([v22 conformsToProtocol:&unk_26D293020]) {
            objc_storeStrong((id *)&v11->_devicePlayerIndicatorComponent, v22);
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v179 objects:v192 count:16];
      }
      while (v19);
    }

    if (v11->_devicePlayerIndicatorComponent)
    {
      v11->_indicatedPlayerIndex = -1;
      uint64_t v23 = +[NSMapTable strongToStrongObjectsMapTable];
      clientPlayerIndicatorEndpoints = v11->_clientPlayerIndicatorEndpoints;
      v11->_clientPlayerIndicatorEndpoints = (NSMapTable *)v23;
    }
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    v25 = [(_GCDefaultLogicalDevice *)v11 components];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v175 objects:v191 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v176;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v176 != v27) {
            objc_enumerationMutation(v25);
          }
          v29 = *(void **)(*((void *)&v175 + 1) + 8 * j);
          if ([v29 conformsToProtocol:&unk_26D298890]) {
            objc_storeStrong((id *)&v11->_deviceLightComponent, v29);
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v175 objects:v191 count:16];
      }
      while (v26);
    }

    if (v11->_deviceLightComponent)
    {
      v173[0] = _NSConcreteStackBlock;
      v173[1] = 3221225472;
      v173[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke;
      v173[3] = &unk_26D22A8C0;
      v30 = dispatch_semaphore_create(0);
      v174 = v30;
      [(_GCDeviceLightComponent *)v11->_deviceLightComponent setDeviceLightServiceConnectedHandler:v173];
      if (gc_isInternalBuild())
      {
        v104 = getGCLogger();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_220998000, v104, OS_LOG_TYPE_INFO, "Waiting for driver light service to be brought up", (uint8_t *)location, 2u);
        }
      }
      dispatch_time_t v31 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v30, v31);
      uint64_t v32 = [(_GCDeviceLightComponent *)v11->_deviceLightComponent light];
      light = v11->_light;
      v11->_light = (GCDeviceLight *)v32;

      if (!v11->_light)
      {
        if (gc_isInternalBuild())
        {
          v115 = getGCLogger();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
            -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:](v115, v116, v117, v118, v119, v120, v121, v122);
          }
        }
        v34 = [GCDeviceLight alloc];
        v35 = [GCColor alloc];
        LODWORD(v36) = 1056997505;
        LODWORD(v37) = 1040220289;
        LODWORD(v38) = 1017159841;
        v39 = [(GCColor *)v35 initWithRed:v36 green:v37 blue:v38];
        uint64_t v40 = [(GCDeviceLight *)v34 initWithColor:v39];
        v41 = v11->_light;
        v11->_light = (GCDeviceLight *)v40;
      }
      if (gc_isInternalBuild())
      {
        v105 = getGCLogger();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
        {
          v106 = v11->_light;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v106;
          _os_log_impl(&dword_220998000, v105, OS_LOG_TYPE_INFO, "Initialize device light component light value to %@", (uint8_t *)location, 0xCu);
        }
      }
      uint64_t v42 = +[NSMapTable strongToStrongObjectsMapTable];
      clientLightEndpoints = v11->_clientLightEndpoints;
      v11->_clientLightEndpoints = (NSMapTable *)v42;
    }
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    v44 = [(_GCDefaultLogicalDevice *)v11 components];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v169 objects:v189 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v170;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v170 != v46) {
            objc_enumerationMutation(v44);
          }
          v48 = *(void **)(*((void *)&v169 + 1) + 8 * k);
          if ([v48 conformsToProtocol:&unk_26D298A00]) {
            objc_storeStrong((id *)&v11->_deviceAdaptiveTriggersComponent, v48);
          }
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v169 objects:v189 count:16];
      }
      while (v45);
    }

    if (v11->_deviceAdaptiveTriggersComponent)
    {
      v167[0] = _NSConcreteStackBlock;
      v167[1] = 3221225472;
      v167[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_178;
      v167[3] = &unk_26D22A8C0;
      v49 = dispatch_semaphore_create(0);
      v168 = v49;
      [(_GCDeviceAdaptiveTriggersComponent *)v11->_deviceAdaptiveTriggersComponent setDeviceAdaptiveTriggersServiceConnectedHandler:v167];
      if (gc_isInternalBuild())
      {
        v107 = getGCLogger();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_220998000, v107, OS_LOG_TYPE_INFO, "Waiting for driver adaptive trigger service to be brought up", (uint8_t *)location, 2u);
        }
      }
      dispatch_time_t v50 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v49, v50);
      uint64_t v51 = [(_GCDeviceAdaptiveTriggersComponent *)v11->_deviceAdaptiveTriggersComponent triggerStatuses];
      adaptiveTriggerStatuses = v11->_adaptiveTriggerStatuses;
      v11->_adaptiveTriggerStatuses = (NSArray *)v51;

      if (!v11->_adaptiveTriggerStatuses)
      {
        if (gc_isInternalBuild())
        {
          v123 = getGCLogger();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
            -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:](v123, v124, v125, v126, v127, v128, v129, v130);
          }
        }
        id v53 = [[GCDeviceAdaptiveTriggersStatusPayload alloc] initFeedbackWithStatus:0 armPosition:0 mode:0];
        v188[0] = v53;
        id v54 = [[GCDeviceAdaptiveTriggersStatusPayload alloc] initFeedbackWithStatus:0 armPosition:0 mode:0];
        v188[1] = v54;
        uint64_t v55 = +[NSArray arrayWithObjects:v188 count:2];
        v56 = v11->_adaptiveTriggerStatuses;
        v11->_adaptiveTriggerStatuses = (NSArray *)v55;
      }
      if (gc_isInternalBuild())
      {
        v108 = getGCLogger();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          v109 = v11->_adaptiveTriggerStatuses;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v109;
          _os_log_impl(&dword_220998000, v108, OS_LOG_TYPE_INFO, "Initialize device battery component value to %@", (uint8_t *)location, 0xCu);
        }
      }
      uint64_t v57 = +[NSMapTable strongToStrongObjectsMapTable];
      clientAdaptiveTriggersEndpoints = v11->_clientAdaptiveTriggersEndpoints;
      v11->_clientAdaptiveTriggersEndpoints = (NSMapTable *)v57;

      uint64_t v59 = +[NSMapTable strongToStrongObjectsMapTable];
      pidToAdaptiveTriggersComponent = v11->_pidToAdaptiveTriggersComponent;
      v11->_pidToAdaptiveTriggersComponent = (NSMapTable *)v59;

      objc_initWeak(location, v11);
      v165[0] = _NSConcreteStackBlock;
      v165[1] = 3221225472;
      v165[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_181;
      v165[3] = &unk_26D22C100;
      objc_copyWeak(&v166, location);
      [(_GCDeviceAdaptiveTriggersComponent *)v11->_deviceAdaptiveTriggersComponent setDeviceAdaptiveTriggersComponentStatusUpdatedHandler:v165];
      objc_destroyWeak(&v166);
      objc_destroyWeak(location);
    }
    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    v61 = [(_GCDefaultLogicalDevice *)v11 components];
    uint64_t v62 = [v61 countByEnumeratingWithState:&v161 objects:v187 count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v162;
      do
      {
        for (uint64_t m = 0; m != v62; ++m)
        {
          if (*(void *)v162 != v63) {
            objc_enumerationMutation(v61);
          }
          v65 = *(void **)(*((void *)&v161 + 1) + 8 * m);
          if ([v65 conformsToProtocol:&unk_26D2987E0]) {
            objc_storeStrong((id *)&v11->_deviceMotionComponent, v65);
          }
        }
        uint64_t v62 = [v61 countByEnumeratingWithState:&v161 objects:v187 count:16];
      }
      while (v62);
    }

    if (v11->_deviceMotionComponent)
    {
      v159[0] = _NSConcreteStackBlock;
      v159[1] = 3221225472;
      v159[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_2;
      v159[3] = &unk_26D22A8C0;
      v66 = dispatch_semaphore_create(0);
      v160 = v66;
      [(_GCDeviceMotionComponent *)v11->_deviceMotionComponent setDeviceMotionServiceConnectedHandler:v159];
      if (gc_isInternalBuild())
      {
        v110 = getGCLogger();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_220998000, v110, OS_LOG_TYPE_INFO, "Waiting for driver motion service to be brought up", (uint8_t *)location, 2u);
        }
      }
      dispatch_time_t v67 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v66, v67);
      v11->_motionSensorsActive = 0;
      [(_GCDeviceMotionComponent *)v11->_deviceMotionComponent setSensorsActive:0];
      uint64_t v68 = +[NSMapTable strongToStrongObjectsMapTable];
      clientMotionEndpoints = v11->_clientMotionEndpoints;
      v11->_clientMotionEndpoints = (NSMapTable *)v68;
    }
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    v70 = [(_GCDefaultLogicalDevice *)v11 components];
    uint64_t v71 = [v70 countByEnumeratingWithState:&v155 objects:v186 count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v156;
      do
      {
        for (uint64_t n = 0; n != v71; ++n)
        {
          if (*(void *)v156 != v72) {
            objc_enumerationMutation(v70);
          }
          v74 = *(void **)(*((void *)&v155 + 1) + 8 * n);
          if ([v74 conformsToProtocol:&unk_26D293138]) {
            objc_storeStrong((id *)&v11->_deviceBatteryComponent, v74);
          }
        }
        uint64_t v71 = [v70 countByEnumeratingWithState:&v155 objects:v186 count:16];
      }
      while (v71);
    }

    if (v11->_deviceBatteryComponent)
    {
      v153[0] = _NSConcreteStackBlock;
      v153[1] = 3221225472;
      v153[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_209;
      v153[3] = &unk_26D22A8C0;
      v75 = dispatch_semaphore_create(0);
      v154 = v75;
      [(_GCDeviceBatteryComponent *)v11->_deviceBatteryComponent setDeviceBatteryServiceConnectedHandler:v153];
      if (gc_isInternalBuild())
      {
        v111 = getGCLogger();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_220998000, v111, OS_LOG_TYPE_INFO, "Waiting for driver battery service to be brought up", (uint8_t *)location, 2u);
        }
      }
      dispatch_time_t v76 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v75, v76);
      uint64_t v77 = [(_GCDeviceBatteryComponent *)v11->_deviceBatteryComponent battery];
      battery = v11->_battery;
      v11->_battery = (GCDeviceBattery *)v77;

      if (!v11->_battery)
      {
        if (gc_isInternalBuild())
        {
          v131 = getGCLogger();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
            -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:](v131, v132, v133, v134, v135, v136, v137, v138);
          }
        }
        v79 = [[GCDeviceBattery alloc] initWithLevel:-1 batteryState:0.0];
        v80 = v11->_battery;
        v11->_battery = v79;
      }
      if (gc_isInternalBuild())
      {
        v112 = getGCLogger();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          v113 = v11->_battery;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v113;
          _os_log_impl(&dword_220998000, v112, OS_LOG_TYPE_INFO, "Initialize device battery component value to %@", (uint8_t *)location, 0xCu);
        }
      }
      uint64_t v81 = +[NSMapTable strongToStrongObjectsMapTable];
      clientBatteryEndpoints = v11->_clientBatteryEndpoints;
      v11->_clientBatteryEndpoints = (NSMapTable *)v81;

      objc_initWeak(location, v11);
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472;
      v151[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_211;
      v151[3] = &unk_26D22BF50;
      objc_copyWeak(&v152, location);
      [(_GCDeviceBatteryComponent *)v11->_deviceBatteryComponent setDeviceBatteryComponentBatteryUpdatedHandler:v151];
      objc_destroyWeak(&v152);
      objc_destroyWeak(location);
    }
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    v83 = [(_GCDefaultLogicalDevice *)v11 components];
    uint64_t v84 = [v83 countByEnumeratingWithState:&v147 objects:v185 count:16];
    if (v84)
    {
      uint64_t v85 = *(void *)v148;
      do
      {
        for (iuint64_t i = 0; ii != v84; ++ii)
        {
          if (*(void *)v148 != v85) {
            objc_enumerationMutation(v83);
          }
          v87 = *(void **)(*((void *)&v147 + 1) + 8 * ii);
          if ([v87 conformsToProtocol:&unk_26D298C30]) {
            objc_storeStrong((id *)&v11->_deviceGameIntentComponent, v87);
          }
        }
        uint64_t v84 = [v83 countByEnumeratingWithState:&v147 objects:v185 count:16];
      }
      while (v84);
    }

    if (v11->_deviceGameIntentComponent)
    {
      objc_initWeak(location, v11);
      uint64_t v88 = +[NSMapTable strongToStrongObjectsMapTable];
      clientGameIntentEndpoints = v11->_clientGameIntentEndpoints;
      v11->_clientGameIntentEndpoints = (NSMapTable *)v88;

      if (gc_isInternalBuild())
      {
        v114 = getGCLogger();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_220998000, v114, OS_LOG_TYPE_DEFAULT, "Setting intent handler", buf, 2u);
        }
      }
      v144[0] = _NSConcreteStackBlock;
      v144[1] = 3221225472;
      v144[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_220;
      v144[3] = &unk_26D22C128;
      objc_copyWeak(&v145, location);
      [(_GCDeviceGameIntentComponent *)v11->_deviceGameIntentComponent setDeviceGameIntentComponentGameIntentTriggeredHandler:v144];
      objc_destroyWeak(&v145);
      objc_destroyWeak(location);
    }
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v90 = [(_GCDefaultLogicalDevice *)v11 components];
    uint64_t v91 = [v90 countByEnumeratingWithState:&v140 objects:v184 count:16];
    if (v91)
    {
      uint64_t v92 = *(void *)v141;
      do
      {
        for (juint64_t j = 0; jj != v91; ++jj)
        {
          if (*(void *)v141 != v92) {
            objc_enumerationMutation(v90);
          }
          v94 = *(void **)(*((void *)&v140 + 1) + 8 * jj);
          if ([v94 conformsToProtocol:&unk_26D2963C0]) {
            objc_storeWeak((id *)&v11->_deviceSettingsComponent, v94);
          }
        }
        uint64_t v91 = [v90 countByEnumeratingWithState:&v140 objects:v184 count:16];
      }
      while (v91);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&v11->_deviceSettingsComponent);
    if (WeakRetained)
    {
      uint64_t v96 = +[NSMapTable strongToStrongObjectsMapTable];
      clientSettingsEndpoints = v11->_clientSettingsEndpoints;
      v11->_clientSettingsEndpoints = (NSMapTable *)v96;

      uint64_t v98 = GCLookupService();
      settingsStore = v11->_settingsStore;
      v11->_settingsStore = (GCSSettingsStoreService *)v98;

      v100 = [(GCSSettingsStoreService *)v11->_settingsStore profiles];
      [v100 addObserver:v11 forKeyPath:@"values" options:5 context:0];

      v101 = [(GCSSettingsStoreService *)v11->_settingsStore games];
      [v101 addObserver:v11 forKeyPath:@"values" options:5 context:0];

      if (([(GCSSettingsStoreService *)v11->_settingsStore showGCPreferencesPane] & 1) == 0) {
        [(GCSSettingsStoreService *)v11->_settingsStore setShowGCPreferencesPane:1];
      }
    }
  }
  v102 = v11;

  return v102;
}

- (_GCDefaultLogicalDevice)init
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ '%@'>", objc_opt_class(), self->_identifier];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"<%@ '#%llx'>", objc_opt_class(), [self->_identifier hash]];
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p '%@'>", v4, self, self->_identifier];

  return (NSString *)v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (&unk_26D297A00 == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_GCDefaultLogicalDevice;
  return -[_GCDefaultLogicalDevice conformsToProtocol:](&v4, sel_conformsToProtocol_);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"values"])
  {
    [(_GCDefaultLogicalDevice *)self settingsDidChange];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_GCDefaultLogicalDevice;
    [(_GCDefaultLogicalDevice *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)dealloc
{
  settingsStore = self->_settingsStore;
  if (settingsStore)
  {
    objc_super v4 = [(GCSSettingsStoreService *)settingsStore profiles];
    [v4 removeObserver:self forKeyPath:@"values" context:0];

    v5 = [(GCSSettingsStoreService *)self->_settingsStore games];
    [v5 removeObserver:self forKeyPath:@"values" context:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)_GCDefaultLogicalDevice;
  [(_GCDefaultLogicalDevice *)&v6 dealloc];
}

- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4
{
  self->_indicatedPlayerIndex = a4;
  [(_GCDevicePlayerIndexIndicatorComponent *)self->_devicePlayerIndicatorComponent setIndicatedPlayerIndex:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v6 = [(NSMapTable *)self->_clientPlayerIndicatorEndpoints objectEnumerator];
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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setPlayerIndex:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)lightXPCProxyServerEndpoint:(id)a3 didReceiveLightChange:(id)a4
{
  id v6 = a4;
  objc_storeStrong((id *)&self->_light, a4);
  self->_lightClientOverrideEnabled = 1;
  if (!self->_lightUserOverrideEnabled) {
    [(_GCDeviceLightComponent *)self->_deviceLightComponent setLight:v6];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [(NSMapTable *)self->_clientLightEndpoints objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setLight:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)adaptiveTriggersXPCProxyServerEndpoint:(id)a3 didReceiveAdaptiveTriggersChange:(id)a4 forIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if (gc_isInternalBuild())
  {
    v25 = getGCLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v8;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 1024;
      int v38 = v5;
      _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_INFO, "adaptiveTriggersXPCProxyServerEndpoint:%@ didReceiveAdaptiveTriggersChange:%@ forIndex:%d", buf, 0x1Cu);
    }
  }
  uint64_t v10 = (void *)MEMORY[0x223C6E130]();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v11 = [(NSMapTable *)self->_clientAdaptiveTriggersEndpoints keyEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v26 = v5;
    context = v10;
    id v14 = v9;
    uint64_t v15 = *(void *)v29;
LABEL_4:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
      v18 = -[NSMapTable objectForKey:](self->_clientAdaptiveTriggersEndpoints, "objectForKey:", v17, v26);
      char v19 = [v18 isEqual:v8];

      if (v19) {
        break;
      }
      if (v13 == ++v16)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13) {
          goto LABEL_4;
        }
        id v20 = v11;
        id v9 = v14;
        uint64_t v10 = context;
        goto LABEL_16;
      }
    }
    id v20 = v17;

    id v9 = v14;
    uint64_t v10 = context;
    if (!v20) {
      goto LABEL_17;
    }
    pidToAdaptiveTriggersComponent = self->_pidToAdaptiveTriggersComponent;
    v22 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v20 processIdentifier]);
    uint64_t v23 = [(NSMapTable *)pidToAdaptiveTriggersComponent objectForKey:v22];

    [v23 setObject:v14 atIndexedSubscript:(int)v26];
    int activeApplicationPID = self->_activeApplicationPID;
    if (activeApplicationPID == [v20 processIdentifier]) {
      [(_GCDeviceAdaptiveTriggersComponent *)self->_deviceAdaptiveTriggersComponent setAdaptiveTriggersPayload:v14 forIndex:v26];
    }
  }
  else
  {
    id v20 = v11;
  }
LABEL_16:

LABEL_17:
}

- (void)gameIntentXPCProxyServerEndpoint:(id)a3 didReceiveGameIntent:(int64_t)a4
{
  if (a4 == 3)
  {
    id GKDaemonProxyClass = getGKDaemonProxyClass();
    uint64_t v5 = [getGKLocalPlayerClass() local];
    id v11 = [GKDaemonProxyClass proxyForPlayer:v5];

    id v6 = [getGKGameClass() currentGame];
    uint64_t v7 = [v6 internal];

    uint64_t v8 = getpid();
    id v9 = getGKDashboardLaunchContextGameController();
    uint64_t v10 = [v11 utilityService];
    [v10 openDashboardAsRemoteAlertForGame:v7 hostPID:v8 deeplink:0 launchContext:v9];
  }
  else
  {
    id v11 = +[GCGameIntentManager instance];
    [v11 toggleGamesFolder];
  }
}

- (void)systemGestureXPCProxyServerEndpoint:(id)a3 disableSystemGestureForInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "systemGestureXPCProxyServerEndpoint:%@ disableSystemGestureForInput: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [(_GCDefaultLogicalDevice *)self systemGestureXPCProxyServerEndpoint:v6 didSetSystemGestureStateForInput:v7 enabled:0];
}

- (void)systemGestureXPCProxyServerEndpoint:(id)a3 enableSystemGestureForInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "systemGestureXPCProxyServerEndpoint:%@ enableSystemGestureForInput: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [(_GCDefaultLogicalDevice *)self systemGestureXPCProxyServerEndpoint:v6 didSetSystemGestureStateForInput:v7 enabled:1];
}

- (void)systemGestureXPCProxyServerEndpoint:(id)a3 didSetSystemGestureStateForInput:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  context = (void *)MEMORY[0x223C6E130]();
  id v10 = self;
  objc_sync_enter(v10);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  __int16 v11 = [(NSMapTable *)v10->_clientSystemGestureEndpoints keyEnumerator];
  id v12 = (id)[v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  BOOL v32 = v5;
  if (v12)
  {
    uint64_t v13 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v16 = [(NSMapTable *)v10->_clientSystemGestureEndpoints objectForKey:v15];
        int v17 = [v16 isEqual:v8];

        if (v17)
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v10);
  if (v12)
  {
    v18 = v10;
    objc_sync_enter(v18);
    char v19 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v12 processIdentifier]);
    id v20 = [(NSMapTable *)v18->_pidToSystemGesturesState objectForKey:v19];
    if (!v20)
    {
      v21 = [GCSystemGesturesState alloc];
      v22 = objc_opt_new();
      uint64_t v23 = objc_opt_new();
      v24 = [v12 bundleIdentifier];
      id v20 = [(GCSystemGesturesState *)v21 initWithEnabledSystemGestures:v22 disabledSystemGestures:v23 bundleIdentifier:v24];
    }
    v25 = [(GCSystemGesturesState *)v20 disabledSystemGestureInputNames];
    uint64_t v26 = (void *)[v25 mutableCopy];

    uint64_t v27 = [(GCSystemGesturesState *)v20 enabledSystemGestureInputNames];
    long long v28 = (void *)[v27 mutableCopy];

    if (v32)
    {
      [v28 addObject:v9];
      [v26 removeObject:v9];
    }
    else
    {
      [v28 removeObject:v9];
      [v26 addObject:v9];
    }
    long long v29 = [GCSystemGesturesState alloc];
    long long v30 = [v12 bundleIdentifier];
    long long v31 = [(GCSystemGesturesState *)v29 initWithEnabledSystemGestures:v28 disabledSystemGestures:v26 bundleIdentifier:v30];

    [(NSMapTable *)v18->_pidToSystemGesturesState setObject:v31 forKey:v19];
    objc_sync_exit(v18);

    LODWORD(v30) = v18->_activeApplicationPID;
    if (v30 == [v12 processIdentifier]) {
      [(_GCDefaultLogicalDevice *)v18 setActiveSystemGesturesState:v31];
    }
  }
}

- (void)motionXPCProxyServerEndpoint:(id)a3 didReceiveSensorsActiveChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (gc_isInternalBuild())
  {
    id v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 1024;
      BOOL v11 = v4;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_INFO, "motionXPCProxyServerEndpoint:%@ %d", (uint8_t *)&v8, 0x12u);
    }
  }
  [(_GCDeviceMotionComponent *)self->_deviceMotionComponent setSensorsActive:v4];
}

- (id)propertyForKey:(id)a3
{
  return (id)[(_GCPhysicalDevice *)self->_underlyingDevice propertyForKey:a3];
}

- (NSSet)components
{
  v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
  BOOL v5 = [v4 components];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 addObject:self];
  __int16 v10 = +[NSSet setWithArray:v3];

  return (NSSet *)v10;
}

- (NSSet)underlyingDevices
{
  underlyingDevice = self->_underlyingDevice;
  v2 = +[NSArray arrayWithObjects:&underlyingDevice count:1];

  return (NSSet *)v2;
}

- (void)activateLogical
{
  devicePlayerIndicatorComponent = self->_devicePlayerIndicatorComponent;
  if (devicePlayerIndicatorComponent)
  {
    self->_indicatedPlayerIndex = -1;
    [(_GCDevicePlayerIndexIndicatorComponent *)devicePlayerIndicatorComponent setIndicatedPlayerIndex:-1];
  }
}

- (void)deactivateLogical
{
  [(_GCDefaultLogicalDevice *)self stopObservingClientStateChangesForAllClients];

  [(_GCDefaultLogicalDevice *)self stopTrackingSessionsForAllClients];
}

- (void)startTrackingSessionForClient:(id)a3
{
  BOOL v4 = (NSMutableDictionary *)a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v4 bundleIdentifier];

  if (v6)
  {
    pidToAnalytics = v5->_pidToAnalytics;
    uint64_t v8 = +[NSNumber numberWithInt:[(NSMutableDictionary *)v4 processIdentifier]];
    id v9 = [(NSMutableDictionary *)pidToAnalytics objectForKeyedSubscript:v8];

    if (!v9)
    {
      __int16 v10 = [(_GCDefaultLogicalDevice *)v5 delegate];
      char v11 = objc_opt_respondsToSelector();

      [(_GCDefaultLogicalDevice *)v5 delegate];
      if (v11) {
        long long v12 = {;
      }
        [v12 logicalDeviceControllerDetailedProductCategory:v5];
      }
      else {
        long long v12 = {;
      }
        [v12 logicalDeviceControllerProductCategory:v5];
      long long v13 = };

      long long v14 = [GCLogicalDeviceAnalytics alloc];
      long long v15 = +[_GCDaemonSettings instance];
      uint64_t v16 = [v15 anonymizedIdentifierForControllerIdentifier:v5->_identifier];
      int v17 = [(NSMutableDictionary *)v4 bundleIdentifier];
      v18 = [(GCLogicalDeviceAnalytics *)v14 initWithAnonymousIdentifier:v16 bundleIdentifier:v17 productCategory:v13];

      char v19 = v5->_pidToAnalytics;
      id v20 = +[NSNumber numberWithInt:[(NSMutableDictionary *)v4 processIdentifier]];
      [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];

      if (gc_isInternalBuild())
      {
        v21 = getGCAnalyticsLogger();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412546;
          v25 = v4;
          __int16 v26 = 2112;
          uint64_t v27 = v18;
          _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_INFO, "startTrackingSessionForClient: %@ with analytics: %@", (uint8_t *)&v24, 0x16u);
        }
      }
      if (gc_isInternalBuild())
      {
        v22 = getGCAnalyticsLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = v5->_pidToAnalytics;
          int v24 = 138412290;
          v25 = v23;
          _os_log_impl(&dword_220998000, v22, OS_LOG_TYPE_INFO, "startTrackingSessionForClient: _pidToAnalytics = %@", (uint8_t *)&v24, 0xCu);
        }
      }
    }
  }
  objc_sync_exit(v5);
}

- (void)stopTrackingSessionForClient:(id)a3
{
  BOOL v4 = (NSMutableDictionary *)a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v4 bundleIdentifier];

  if (v6)
  {
    pidToAnalytics = v5->_pidToAnalytics;
    uint64_t v8 = +[NSNumber numberWithInt:[(NSMutableDictionary *)v4 processIdentifier]];
    id v9 = [(NSMutableDictionary *)pidToAnalytics objectForKeyedSubscript:v8];

    if (v9)
    {
      __int16 v10 = v5->_pidToAnalytics;
      char v11 = +[NSNumber numberWithInt:[(NSMutableDictionary *)v4 processIdentifier]];
      long long v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];

      long long v13 = v5->_pidToAnalytics;
      long long v14 = +[NSNumber numberWithInt:[(NSMutableDictionary *)v4 processIdentifier]];
      [(NSMutableDictionary *)v13 removeObjectForKey:v14];

      if (gc_isInternalBuild())
      {
        long long v15 = getGCAnalyticsLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412546;
          char v19 = v4;
          __int16 v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "stopTrackingSessionForClient: %@ with analytics: %@", (uint8_t *)&v18, 0x16u);
        }
      }
      if (gc_isInternalBuild())
      {
        uint64_t v16 = getGCAnalyticsLogger();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v17 = v5->_pidToAnalytics;
          int v18 = 138412290;
          char v19 = v17;
          _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_INFO, "stopTrackingSessionForClient: _pidToAnalytics = %@", (uint8_t *)&v18, 0xCu);
        }
      }
      [v12 flushSessionAndSendCAEvent];
    }
  }
  objc_sync_exit(v5);
}

- (void)stopTrackingSessionsForAllClients
{
  v2 = self;
  objc_sync_enter(v2);
  if (gc_isInternalBuild())
  {
    uint64_t v7 = getGCAnalyticsLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_INFO, "stopTrackingSessionsForAllClients", buf, 2u);
    }
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(NSMutableDictionary *)v2->_pidToAnalytics allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) flushSessionAndSendCAEvent];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (BOOL)_addClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSMapTable *)v5->_clients objectForKey:v4];

    if (v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      objc_initWeak(&location, v5);
      objc_initWeak(&from, v4);
      long long v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      int v17 = __38___GCDefaultLogicalDevice__addClient___block_invoke;
      int v18 = &unk_26D22B730;
      objc_copyWeak(&v19, &location);
      objc_copyWeak(&v20, &from);
      long long v8 = [v4 addInvalidationHandler:&v15];
      BOOL v7 = v8 != 0;
      if (v8)
      {
        -[NSMapTable setObject:forKey:](v5->_clients, "setObject:forKey:", v8, v4, v15, v16, v17, v18);
        long long v9 = +[GCApplicationStateMonitor sharedInstance];
        objc_msgSend(v9, "addObserver:forProcessIdentifier:", v5, objc_msgSend(v4, "processIdentifier"));

        [(_GCDefaultLogicalDevice *)v5 startTrackingSessionForClient:v4];
        long long v10 = +[GCApplicationStateMonitor sharedInstance];
        -[_GCDefaultLogicalDevice setActiveApplicationPID:](v5, "setActiveApplicationPID:", [v10 frontmostApplication]);

        long long v11 = +[GCApplicationStateMonitor sharedInstance];
        long long v12 = +[GCApplicationStateMonitor sharedInstance];
        -[_GCDefaultLogicalDevice setActiveApplicationCanReceiveEvents:](v5, "setActiveApplicationCanReceiveEvents:", objc_msgSend(v11, "applicationCanReceiveEvents:", objc_msgSend(v12, "frontmostApplication")));

        if (gc_isInternalBuild())
        {
          long long v14 = getGCLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            -[_GCDefaultLogicalDevice _addClient:]();
          }
        }
      }

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v5);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_removeClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    uint64_t v6 = [(NSMapTable *)v5->_clients objectForKey:v4];

    if (v6)
    {
      [(_GCDefaultLogicalDevice *)v5 stopObservingClientStateChanges:v4];
      [(_GCDefaultLogicalDevice *)v5 stopTrackingSessionForClient:v4];
      [(NSMapTable *)v5->_clientPlayerIndicatorEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientLightEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientAdaptiveTriggersEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientMotionEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientBatteryEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientGameIntentEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientSettingsEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientSystemGestureEndpoints removeObjectForKey:v4];
      uint64_t v6 = [(NSMapTable *)v5->_clients objectForKey:v4];
      [(NSMapTable *)v5->_clients removeObjectForKey:v4];
      pidToAdaptiveTriggersComponent = v5->_pidToAdaptiveTriggersComponent;
      long long v8 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v4 processIdentifier]);
      [(NSMapTable *)pidToAdaptiveTriggersComponent removeObjectForKey:v8];

      pidToSystemGesturesState = v5->_pidToSystemGesturesState;
      long long v10 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v4 processIdentifier]);
      [(NSMapTable *)pidToSystemGesturesState removeObjectForKey:v10];

      if (gc_isInternalBuild())
      {
        long long v11 = getGCLogger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[_GCDefaultLogicalDevice _removeClient:]();
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_sync_exit(v5);
}

- (void)stopObservingClientStateChangesForAllClients
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  v2 = +[GCApplicationStateMonitor sharedInstance];
  [v2 removeObserver:obj];

  [(_GCDefaultLogicalDevice *)obj setActiveApplicationPID:0];
  objc_sync_exit(obj);
}

- (void)stopObservingClientStateChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 processIdentifier];
  BOOL v7 = +[GCApplicationStateMonitor sharedInstance];
  [v7 removeObserver:v5 forProcessIdentifier:v6];

  if (v6 == v5->_activeApplicationPID)
  {
    if (gc_isInternalBuild())
    {
      long long v8 = getGCAppStateMonitorLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        long long v10 = v5;
        __int16 v11 = 1024;
        int v12 = v6;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "%@ stopped observing changes for PID %d, which was the active application", (uint8_t *)&v9, 0x12u);
      }
    }
    [(_GCDefaultLogicalDevice *)v5 setActiveApplicationPID:0];
  }
  objc_sync_exit(v5);
}

- (void)applicationForegrounded:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCAppStateMonitorLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      BOOL v7 = v4;
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ application foregrounded: %d", (uint8_t *)&v6, 0x12u);
    }
  }
  [(_GCDefaultLogicalDevice *)v4 setActiveApplicationPID:v3];
  objc_sync_exit(v4);
}

- (void)applicationBackgrounded:(int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCAppStateMonitorLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      BOOL v7 = v4;
      __int16 v8 = 1024;
      int v9 = a3;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ application backgrounded: %d", (uint8_t *)&v6, 0x12u);
    }
  }
  if (v4->_activeApplicationPID == a3) {
    [(_GCDefaultLogicalDevice *)v4 setActiveApplicationPID:0];
  }
  objc_sync_exit(v4);
}

- (void)applicationCanReceiveEventsDidChange:(BOOL)a3 forPID:(int)a4
{
  BOOL v5 = a3;
  int v6 = self;
  objc_sync_enter(v6);
  if (gc_isInternalBuild())
  {
    BOOL v7 = getGCAppStateMonitorLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412802;
      int v9 = v6;
      __int16 v10 = 1024;
      BOOL v11 = v5;
      __int16 v12 = 1024;
      int v13 = a4;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "%@ application can receive events did change: %d forPID: %d", (uint8_t *)&v8, 0x18u);
    }
  }
  if (v6->_activeApplicationPID == a4) {
    [(_GCDefaultLogicalDevice *)v6 setActiveApplicationCanReceiveEvents:v5];
  }
  objc_sync_exit(v6);
}

- (void)setActiveApplicationCanReceiveEvents:(BOOL)a3
{
}

- (void)setActiveApplicationPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gc_isInternalBuild())
  {
    uint64_t v42 = getGCAppStateMonitorLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      int activeApplicationPID = self->_activeApplicationPID;
      *(_DWORD *)buf = 67109376;
      int v55 = activeApplicationPID;
      __int16 v56 = 1024;
      int v57 = v3;
      _os_log_impl(&dword_220998000, v42, OS_LOG_TYPE_DEFAULT, "setActiveApplicationPID - was %d now %d", buf, 0xEu);
    }
  }
  if (self->_activeApplicationPID != v3)
  {
    pidToAnalytics = self->_pidToAnalytics;
    int v6 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:");
    BOOL v7 = [(NSMutableDictionary *)pidToAnalytics objectForKeyedSubscript:v6];

    if (v7) {
      [v7 pauseSession];
    }
    self->_int activeApplicationPID = v3;
    int v8 = self->_pidToAnalytics;
    int v9 = +[NSNumber numberWithInt:v3];
    __int16 v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];

    if (v10) {
      [v10 resumeSession];
    }
    if (self->_activeApplicationPID)
    {
      deviceGameIntentComponent = self->_deviceGameIntentComponent;
      if (deviceGameIntentComponent) {
        deviceGameIntentComponent = (_GCDeviceGameIntentComponent *)[(_GCDeviceGameIntentComponent *)deviceGameIntentComponent setEnableGlobalGameControllerFunctionality:0];
      }
      __int16 v12 = (void *)MEMORY[0x223C6E130](deviceGameIntentComponent);
      if (self->_deviceAdaptiveTriggersComponent)
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        int v13 = [(NSMapTable *)self->_clientAdaptiveTriggersEndpoints keyEnumerator];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v49;
LABEL_13:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v49 != v15) {
              objc_enumerationMutation(v13);
            }
            int v17 = *(void **)(*((void *)&v48 + 1) + 8 * v16);
            if ([v17 processIdentifier] == self->_activeApplicationPID) {
              break;
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v53 count:16];
              if (v14) {
                goto LABEL_13;
              }
              goto LABEL_19;
            }
          }
          id v18 = v17;

          if (!v18) {
            goto LABEL_32;
          }
          pidToAdaptiveTriggersComponent = self->_pidToAdaptiveTriggersComponent;
          uint64_t v27 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v18 processIdentifier]);
          long long v28 = [(NSMapTable *)pidToAdaptiveTriggersComponent objectForKey:v27];

          if ([v28 count])
          {
            unint64_t v29 = 0;
            do
            {
              long long v30 = [v28 objectAtIndexedSubscript:v29];
              [(_GCDeviceAdaptiveTriggersComponent *)self->_deviceAdaptiveTriggersComponent setAdaptiveTriggersPayload:v30 forIndex:v29];

              ++v29;
            }
            while ([v28 count] > v29);
          }
        }
        else
        {
LABEL_19:
          id v18 = v13;
        }
      }
LABEL_32:
      long long v31 = (void *)MEMORY[0x223C6E130]();
      id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceSystemGestureComponent);

      if (WeakRetained)
      {
        v33 = self;
        objc_sync_enter(v33);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v34 = [(NSMapTable *)v33->_clientSystemGestureEndpoints keyEnumerator];
        id v35 = (id)[v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v45;
          while (2)
          {
            for (uint64_t i = 0; i != v35; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v45 != v36) {
                objc_enumerationMutation(v34);
              }
              int v38 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if ([v38 processIdentifier] == self->_activeApplicationPID)
              {
                id v35 = v38;
                goto LABEL_43;
              }
            }
            id v35 = (id)[v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }
LABEL_43:

        objc_sync_exit(v33);
        if (v35)
        {
          pidToSystemGesturesState = v33->_pidToSystemGesturesState;
          uint64_t v40 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v35 processIdentifier]);
          v41 = [(NSMapTable *)pidToSystemGesturesState objectForKey:v40];

          [(_GCDefaultLogicalDevice *)v33 setActiveSystemGesturesState:v41];
        }
      }
    }
    else
    {
      deviceAdaptiveTriggersComponent = self->_deviceAdaptiveTriggersComponent;
      if (deviceAdaptiveTriggersComponent)
      {
        id v20 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
        [(_GCDeviceAdaptiveTriggersComponent *)deviceAdaptiveTriggersComponent setAdaptiveTriggersPayload:v20 forIndex:0];

        v21 = self->_deviceAdaptiveTriggersComponent;
        id v22 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
        [(_GCDeviceAdaptiveTriggersComponent *)v21 setAdaptiveTriggersPayload:v22 forIndex:1];
      }
      uint64_t v23 = self->_deviceGameIntentComponent;
      if (v23) {
        [(_GCDeviceGameIntentComponent *)v23 setEnableGlobalGameControllerFunctionality:1];
      }
      id v24 = objc_loadWeakRetained((id *)&self->_deviceSystemGestureComponent);

      if (v24)
      {
        v25 = objc_alloc_init(GCSystemGesturesState);
        [(_GCDefaultLogicalDevice *)self setActiveSystemGesturesState:v25];
      }
    }
    [(_GCDefaultLogicalDevice *)self updateLightForActiveClient];
  }
}

- (void)updateLightForActiveClient
{
  uint64_t v3 = (void *)MEMORY[0x223C6E130](self, a2);
  if (self->_deviceLightComponent)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceSettingsComponent);

    if (WeakRetained)
    {
      BOOL v5 = self;
      objc_sync_enter(v5);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      int v6 = [(NSMapTable *)v5->_clientLightEndpoints keyEnumerator];
      id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v18 != v8) {
              objc_enumerationMutation(v6);
            }
            __int16 v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v10 processIdentifier] == v5->_activeApplicationPID)
            {
              id v7 = v10;
              goto LABEL_13;
            }
          }
          id v7 = (id)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      objc_sync_exit(v5);
      settingsStore = v5->_settingsStore;
      __int16 v12 = [(_GCDefaultLogicalDevice *)v5 persistentIdentifierForSettings];
      if (v7)
      {
        int v13 = [v7 bundleIdentifier];
        uint64_t v14 = [(GCSSettingsStoreService *)settingsStore profileForPersistentControllerIdentifier:v12 appBundleIdentifier:v13];
      }
      else
      {
        uint64_t v14 = [(GCSSettingsStoreService *)settingsStore profileForPersistentControllerIdentifier:v12 appBundleIdentifier:0];
      }

      if ([v14 lightbarColor])
      {
        uint64_t v15 = -[GCColor initWithColorPreset:]([GCColor alloc], "initWithColorPreset:", [v14 lightbarColor]);
        uint64_t v16 = [[GCDeviceLight alloc] initWithColor:v15];
        [(_GCDeviceLightComponent *)self->_deviceLightComponent setLight:v16];

        v5->_lightUserOverrideEnabled = 1;
      }
      else
      {
        v5->_lightUserOverrideEnabled = 0;
        if (v5->_lightClientOverrideEnabled) {
          [(_GCDeviceLightComponent *)self->_deviceLightComponent setLight:v5->_light];
        }
      }
    }
  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 248, 1);
}

- (_GCDeviceManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (_GCDeviceManager *)WeakRetained;
}

- (_GCDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (_GCDefaultLogicalDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_GCDefaultLogicalDeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_GCPhysicalDevice)underlyingDevice
{
  return self->_underlyingDevice;
}

- (int)activeApplicationPID
{
  return self->_activeApplicationPID;
}

- (BOOL)activeApplicationCanReceiveEvents
{
  return self->_activeApplicationCanReceiveEvents;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pidToAnalytics, 0);
  objc_storeStrong((id *)&self->_clientSystemGestureEndpoints, 0);
  objc_storeStrong((id *)&self->_pidToSystemGesturesState, 0);
  objc_storeStrong((id *)&self->_activeSystemGesturesState, 0);
  objc_destroyWeak((id *)&self->_deviceSystemGestureComponent);
  objc_storeStrong((id *)&self->_clientGameIntentEndpoints, 0);
  objc_storeStrong((id *)&self->_deviceGameIntentComponent, 0);
  objc_storeStrong((id *)&self->_clientSettingsEndpoints, 0);
  objc_destroyWeak((id *)&self->_deviceSettingsComponent);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_clientBatteryEndpoints, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_deviceBatteryComponent, 0);
  objc_storeStrong((id *)&self->_clientMotionEndpoints, 0);
  objc_storeStrong((id *)&self->_deviceMotionComponent, 0);
  objc_storeStrong((id *)&self->_clientLightEndpoints, 0);
  objc_storeStrong((id *)&self->_light, 0);
  objc_storeStrong((id *)&self->_deviceLightComponent, 0);
  objc_storeStrong((id *)&self->_clientAdaptiveTriggersEndpoints, 0);
  objc_storeStrong((id *)&self->_pidToAdaptiveTriggersComponent, 0);
  objc_storeStrong((id *)&self->_adaptiveTriggerStatuses, 0);
  objc_storeStrong((id *)&self->_deviceAdaptiveTriggersComponent, 0);
  objc_storeStrong((id *)&self->_clientPlayerIndicatorEndpoints, 0);
  objc_storeStrong((id *)&self->_devicePlayerIndicatorComponent, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_underlyingDevice, 0);
}

- (id)makeControllerForClient:(id)a3
{
  id v5 = a3;
  if (![(_GCDefaultLogicalDevice *)self _addClient:v5])
  {
    id v7 = 0;
    goto LABEL_95;
  }
  SEL v132 = a2;
  int v6 = [(_GCDefaultLogicalDevice *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v8 = [(_GCDefaultLogicalDevice *)self components];
    uint64_t v133 = +[NSMutableArray array];
    int v9 = [[GCProductInformation alloc] initWithIdentifier:@"ProductInfo"];
    __int16 v10 = [v6 logicalDeviceControllerProductCategory:self];
    [(GCProductInformation *)v9 setProductCategory:v10];

    if (objc_opt_respondsToSelector()) {
      [v6 logicalDeviceControllerDetailedProductCategory:self];
    }
    else {
    BOOL v11 = [(GCProductInformation *)v9 productCategory];
    }
    [(GCProductInformation *)v9 setDetailedProductCategory:v11];

    if (objc_opt_respondsToSelector())
    {
      __int16 v12 = [v6 logicalDeviceControllerVendorName:self];
      if (v12)
      {
        [(GCProductInformation *)v9 setVendorName:v12];
      }
      else
      {
        uint64_t v14 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
        uint64_t v15 = [v14 propertyForKey:@"Product"];
        [(GCProductInformation *)v9 setVendorName:v15];
      }
    }
    else
    {
      __int16 v12 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
      int v13 = [v12 propertyForKey:@"Product"];
      [(GCProductInformation *)v9 setVendorName:v13];
    }
    uint64_t v16 = +[_GCDaemonSettings instance];
    long long v17 = [v16 anonymizedIdentifierForControllerIdentifier:self->_identifier];
    [(GCProductInformation *)v9 setAnonymizedIdentifier:v17];

    if (objc_opt_respondsToSelector())
    {
      long long v18 = +[NSNumber numberWithBool:](&off_26D2B68C8, "numberWithBool:", [v6 logicalDeviceControllerIsAttachedToHost:self]);
      [(GCProductInformation *)v9 setAttachedToDevice:v18];
    }
    else
    {
      long long v19 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
      long long v18 = [v19 propertyForKey:@"GameControllerFormFitting"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v20 = [v18 BOOLValue];
      }
      else {
        unsigned int v20 = 0;
      }
      v21 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
      id v22 = [v21 propertyForKey:@"IAPHIDAccessoryCategory"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v23 = [v22 intValue];
      }
      else {
        int v23 = -1;
      }
      if (v23 == 3) {
        unsigned int v24 = 1;
      }
      else {
        unsigned int v24 = v20;
      }
      if (v23 == 4) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v24;
      }
      __int16 v26 = +[NSNumber numberWithBool:v25];
      [(GCProductInformation *)v9 setAttachedToDevice:v26];
    }
    uint64_t v27 = [[_GCControllerComponentDescription alloc] initWithComponent:v9 bindings:0];
    [v133 addObject:v27];

    long long v28 = [[GCHIDInformation alloc] initWithIdentifier:@"HIDInfo"];
    unint64_t v29 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
    long long v30 = [v29 propertyForKey:@"RegistryID"];
    [(GCHIDInformation *)v28 setRegistryID:v30];

    long long v31 = [[_GCControllerComponentDescription alloc] initWithComponent:v28 bindings:0];
    [v133 addObject:v31];

    BOOL v32 = [(_GCDefaultLogicalDevice *)self _makeControllerGamepadEventSource];
    if (v32)
    {
      if (objc_opt_respondsToSelector())
      {
        v144 = v32;
        v33 = +[NSArray arrayWithObjects:&v144 count:1];
        long long v34 = [v6 logicalDevice:self makeControllerInputDescriptionWithIdentifier:@"Input" bindings:v33];

        if (v34) {
          [v133 addObject:v34];
        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (long long v143 = v32,
            +[NSArray arrayWithObjects:&v143 count:1],
            id v35 = objc_claimAutoreleasedReturnValue(),
            [v6 logicalDevice:self makeControllerPhysicalInputProfileDescriptionWithIdentifier:@"PhysicalInput" bindings:v35], uint64_t v36 = objc_claimAutoreleasedReturnValue(), v35, v36))
      {
        [v133 addObject:v36];
      }
      else
      {
        uint64_t v36 = [v6 logicalDevice:self makeControllerPhysicalInputProfileWithIdentifier:@"PhysicalInput"];
        [v36 setGlyphFlags:0];
        long long v37 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
        int v38 = [v37 conformsToProtocol:&unk_26D298D00];

        if (v38)
        {
          v39 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
          uint64_t v40 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
          char v41 = objc_opt_respondsToSelector();

          if (v41)
          {
            objc_msgSend(v36, "setGlyphFlags:", objc_msgSend(v39, "getGlyphFlags"));
            if (gc_isInternalBuild())
            {
              v131 = getGCLogger();
              if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v142 = [v36 glyphFlags];
                _os_log_impl(&dword_220998000, v131, OS_LOG_TYPE_INFO, "Determined physical input profile glyph flags: %ld", buf, 0xCu);
              }
            }
          }
        }
        if ([v36 conformsToProtocol:&unk_26D28C7C8])
        {
          uint64_t v42 = [_GCControllerComponentDescription alloc];
          long long v140 = v32;
          v43 = +[NSArray arrayWithObjects:&v140 count:1];
          long long v44 = [(_GCControllerComponentDescription *)v42 initWithComponent:v36 bindings:v43];

          [v133 addObject:v44];
        }
      }
    }
    if (self->_deviceMotionComponent)
    {
      long long v45 = [v6 logicalDevice:self makeControllerMotionWithIdentifier:@"Motion"];
      long long v46 = [(_GCDeviceMotionComponent *)self->_deviceMotionComponent motionEventSource];
      long long v47 = [_GCControllerComponentDescription alloc];
      id v139 = v46;
      long long v48 = +[NSArray arrayWithObjects:&v139 count:1];
      long long v49 = [(_GCControllerComponentDescription *)v47 initWithComponent:v45 bindings:v48];

      [v133 addObject:v49];
      long long v50 = self;
      objc_sync_enter(v50);
      long long v51 = [(NSMapTable *)v50->_clientMotionEndpoints objectForKey:v5];
      if (!v51)
      {
        v52 = [GCMotionXPCProxyServerEndpoint alloc];
        id v53 = +[NSUUID UUID];
        long long v51 = [(GCMotionXPCProxyServerEndpoint *)v52 initWithIdentifier:v53 initialValue:0];

        [(GCMotionXPCProxyServerEndpoint *)v51 setDelegate:v50];
        [(NSMapTable *)v50->_clientMotionEndpoints setObject:v51 forKey:v5];
        id v54 = [v5 IPCObjectRegistry];
        [v54 registerIPCObject:v51];
      }
      int v55 = [(GCMotionXPCProxyServerEndpoint *)v51 receiverDescription];
      [v133 addObject:v55];

      objc_sync_exit(v50);
    }
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v56 = v8;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v134 objects:v138 count:16];
    v58 = v56;
    if (v57)
    {
      v58 = 0;
      uint64_t v59 = *(void *)v135;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v135 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = *(void **)(*((void *)&v134 + 1) + 8 * i);
          if ([v61 conformsToProtocol:&unk_26D2931B0])
          {
            id v62 = v61;

            v58 = v62;
          }
        }
        uint64_t v57 = [v56 countByEnumeratingWithState:&v134 objects:v138 count:16];
      }
      while (v57);

      if (!v58) {
        goto LABEL_59;
      }
      uint64_t v63 = [GCHapticCapabilities alloc];
      v64 = [v58 hapticEngines];
      v65 = [v58 hapticCapabilityGraph];
      v66 = [(GCHapticCapabilities *)v63 initWithIdentifier:@"HapticCapabilities" hapticEnginesInfo:v64 hapticCapabilityGraph:v65];

      dispatch_time_t v67 = [[_GCControllerComponentDescription alloc] initWithComponent:v66 bindings:0];
      [v133 addObject:v67];
    }
LABEL_59:
    if (self->_devicePlayerIndicatorComponent)
    {
      uint64_t v68 = self;
      objc_sync_enter(v68);
      v69 = [(NSMapTable *)v68->_clientPlayerIndicatorEndpoints objectForKey:v5];
      if (!v69)
      {
        v70 = [GCPlayerIndicatorXPCProxyServerEndpoint alloc];
        uint64_t v71 = +[NSUUID UUID];
        v69 = [(GCPlayerIndicatorXPCProxyServerEndpoint *)v70 initWithIdentifier:v71 initialValue:v68->_indicatedPlayerIndex];

        [(GCPlayerIndicatorXPCProxyServerEndpoint *)v69 setDelegate:v68];
        [(NSMapTable *)v68->_clientPlayerIndicatorEndpoints setObject:v69 forKey:v5];
        uint64_t v72 = [v5 IPCObjectRegistry];
        [v72 registerIPCObject:v69];
      }
      v73 = [(GCPlayerIndicatorXPCProxyServerEndpoint *)v69 receiverDescription];
      [v133 addObject:v73];

      objc_sync_exit(v68);
    }
    if (self->_deviceLightComponent)
    {
      v74 = self;
      objc_sync_enter(v74);
      v75 = [(NSMapTable *)v74->_clientLightEndpoints objectForKey:v5];
      if (!v75)
      {
        dispatch_time_t v76 = [GCLightXPCProxyServerEndpoint alloc];
        uint64_t v77 = +[NSUUID UUID];
        v75 = [(GCLightXPCProxyServerEndpoint *)v76 initWithIdentifier:v77 initialValue:v74->_light];

        [(GCLightXPCProxyServerEndpoint *)v75 setDelegate:v74];
        [(NSMapTable *)v74->_clientLightEndpoints setObject:v75 forKey:v5];
        v78 = [v5 IPCObjectRegistry];
        [v78 registerIPCObject:v75];
      }
      v79 = [(GCLightXPCProxyServerEndpoint *)v75 receiverDescription];
      [v133 addObject:v79];

      objc_sync_exit(v74);
    }
    if (self->_deviceAdaptiveTriggersComponent)
    {
      v80 = self;
      objc_sync_enter(v80);
      uint64_t v81 = [(NSMapTable *)v80->_clientAdaptiveTriggersEndpoints objectForKey:v5];
      if (!v81)
      {
        v82 = [GCAdaptiveTriggersXPCProxyServerEndpoint alloc];
        v83 = +[NSUUID UUID];
        uint64_t v81 = [(GCAdaptiveTriggersXPCProxyServerEndpoint *)v82 initWithIdentifier:v83 initialStatuses:v80->_adaptiveTriggerStatuses];

        [(GCAdaptiveTriggersXPCProxyServerEndpoint *)v81 setDelegate:v80];
        [(NSMapTable *)v80->_clientAdaptiveTriggersEndpoints setObject:v81 forKey:v5];
        uint64_t v84 = [v5 IPCObjectRegistry];
        [v84 registerIPCObject:v81];
      }
      uint64_t v85 = [(GCAdaptiveTriggersXPCProxyServerEndpoint *)v81 receiverDescription];
      [v133 addObject:v85];

      v86 = objc_opt_new();
      id v87 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
      [v86 addObject:v87];

      id v88 = [[GCDeviceAdaptiveTriggersPayload alloc] initOff];
      [v86 addObject:v88];

      pidToAdaptiveTriggersComponent = v80->_pidToAdaptiveTriggersComponent;
      v90 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v5 processIdentifier]);
      [(NSMapTable *)pidToAdaptiveTriggersComponent setObject:v86 forKey:v90];

      objc_sync_exit(v80);
    }
    if (self->_deviceBatteryComponent)
    {
      uint64_t v91 = self;
      objc_sync_enter(v91);
      uint64_t v92 = [(NSMapTable *)v91->_clientBatteryEndpoints objectForKey:v5];
      if (!v92)
      {
        v93 = [GCBatteryXPCProxyServerEndpoint alloc];
        v94 = +[NSUUID UUID];
        uint64_t v92 = [(GCBatteryXPCProxyServerEndpoint *)v93 initWithIdentifier:v94 initialValue:v91->_battery];

        [(GCBatteryXPCProxyServerEndpoint *)v92 setDelegate:v91];
        [(NSMapTable *)v91->_clientBatteryEndpoints setObject:v92 forKey:v5];
        v95 = [v5 IPCObjectRegistry];
        [v95 registerIPCObject:v92];
      }
      uint64_t v96 = [(GCBatteryXPCProxyServerEndpoint *)v92 receiverDescription];
      [v133 addObject:v96];

      objc_sync_exit(v91);
    }
    if (self->_deviceGameIntentComponent)
    {
      v97 = self;
      objc_sync_enter(v97);
      uint64_t v98 = [(NSMapTable *)v97->_clientGameIntentEndpoints objectForKey:v5];
      if (!v98)
      {
        v99 = [GCGameIntentXPCProxyServerEndpoint alloc];
        v100 = +[NSUUID UUID];
        uint64_t v98 = [(GCGameIntentXPCProxyServerEndpoint *)v99 initWithIdentifier:v100];

        [(GCGameIntentXPCProxyServerEndpoint *)v98 setDelegate:v97];
        [(NSMapTable *)v97->_clientGameIntentEndpoints setObject:v98 forKey:v5];
        v101 = [v5 IPCObjectRegistry];
        [v101 registerIPCObject:v98];
      }
      v102 = [(GCGameIntentXPCProxyServerEndpoint *)v98 receiverDescription];
      [v133 addObject:v102];

      objc_sync_exit(v97);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceSystemGestureComponent);

    if (WeakRetained)
    {
      v104 = self;
      objc_sync_enter(v104);
      v105 = [(NSMapTable *)v104->_clientSystemGestureEndpoints objectForKey:v5];
      if (!v105)
      {
        v106 = [v5 bundleIdentifier];
        int v107 = [v106 isEqualToString:@"com.apple.controlcenter"];

        if (v107)
        {
          v108 = [GCSystemGestureXPCProxyServerEndpoint alloc];
          v109 = +[NSUUID UUID];
          uint64_t v110 = [(GCSystemGestureXPCProxyServerEndpoint *)v108 initSystemGestureObserverWithIdentifier:v109 initialValue:v104->_activeSystemGesturesState];
        }
        else
        {
          v111 = [GCSystemGestureXPCProxyServerEndpoint alloc];
          v109 = +[NSUUID UUID];
          uint64_t v110 = [(GCSystemGestureXPCProxyServerEndpoint *)v111 initWithIdentifier:v109];
        }
        v105 = (void *)v110;

        [v105 setDelegate:v104];
        [(NSMapTable *)v104->_clientSystemGestureEndpoints setObject:v105 forKey:v5];
        v112 = [v5 IPCObjectRegistry];
        [v112 registerIPCObject:v105];
      }
      v113 = [v105 receiverDescription];
      [v133 addObject:v113];

      objc_sync_exit(v104);
    }
    id v114 = objc_loadWeakRetained((id *)&self->_deviceSettingsComponent);

    if (v114)
    {
      v115 = self;
      objc_sync_enter(v115);
      uint64_t v116 = [(NSMapTable *)v115->_clientSettingsEndpoints objectForKey:v5];
      if (!v116)
      {
        settingsStore = v115->_settingsStore;
        uint64_t v118 = [(_GCDefaultLogicalDevice *)v115 persistentIdentifierForSettings];
        uint64_t v119 = [v5 bundleIdentifier];
        uint64_t v120 = [(GCSSettingsStoreService *)settingsStore profileForPersistentControllerIdentifier:v118 appBundleIdentifier:v119];
        uint64_t v121 = [v120 anonymizedCopy];

        uint64_t v122 = [GCSettingsXPCProxyServerEndpoint alloc];
        v123 = +[NSUUID UUID];
        uint64_t v116 = [(GCSettingsXPCProxyServerEndpoint *)v122 initWithIdentifier:v123 initialValueForProfile:v121];

        [(GCSettingsXPCProxyServerEndpoint *)v116 setDelegate:v115];
        [(NSMapTable *)v115->_clientSettingsEndpoints setObject:v116 forKey:v5];
        uint64_t v124 = [v5 IPCObjectRegistry];
        [v124 registerIPCObject:v116];
      }
      uint64_t v125 = [(GCSettingsXPCProxyServerEndpoint *)v116 receiverDescription];
      [v133 addObject:v125];

      objc_sync_exit(v115);
    }
    uint64_t v126 = objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      uint64_t v126 = (void *)[v6 logicalDeviceControllerDescriptionClass:self];
      if (([v126 isSubclassOfClass:objc_opt_class()] & 1) == 0)
      {
        uint64_t v130 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
        [v130 handleFailureInMethod:v132 object:self file:@"_GCDefaultLogicalDevice.m" lineNumber:1290 description:@"Assertion failed: [descriptionClass isSubclassOfClass:_GCControllerDescription.class]"];
      }
    }
    id v127 = objc_alloc((Class)v126);
    uint64_t v128 = [(_GCDefaultLogicalDevice *)self identifier];
    id v7 = (void *)[v127 initWithIdentifier:v128 components:v133];

    goto LABEL_94;
  }
  id v7 = [v6 logicalDevice:self makeControllerForClient:v5];
LABEL_94:

LABEL_95:

  return v7;
}

- (id)_makeControllerGamepadEventSource
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(_GCDefaultLogicalDevice *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 conformsToProtocol:&unk_26D292F88])
        {
          id v9 = v8;

          id v5 = v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  __int16 v10 = [v5 gamepadEventSource];

  return v10;
}

- (void)settingsDidChange
{
  uint64_t v3 = getGCSettingsLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "settingsDidChange", buf, 2u);
  }

  uint64_t v4 = self;
  objc_sync_enter(v4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NSMapTable *)v4->_clientSettingsEndpoints keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v10 = [(NSMapTable *)v4->_clientSettingsEndpoints objectForKey:v9];
        settingsStore = v4->_settingsStore;
        long long v12 = [(_GCDefaultLogicalDevice *)v4 persistentIdentifierForSettings];
        long long v13 = [v9 bundleIdentifier];
        long long v14 = [(GCSSettingsStoreService *)settingsStore profileForPersistentControllerIdentifier:v12 appBundleIdentifier:v13];
        long long v15 = [v14 anonymizedCopy];

        [v10 setSettingsProfile:v15];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }

  [(_GCDefaultLogicalDevice *)v4 updateLightForActiveClient];
  objc_sync_exit(v4);
}

- (id)persistentIdentifierForSettings
{
  uint64_t v3 = [(_GCDefaultLogicalDevice *)self identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(_GCDefaultLogicalDevice *)self identifier];
  }
  else
  {
    id v5 = &stru_26D27BBB8;
  }

  return v5;
}

- (void)setActiveSystemGesturesState:(id)a3
{
  uint64_t v4 = (GCSystemGesturesState *)a3;
  if (!v4) {
    uint64_t v4 = objc_alloc_init(GCSystemGesturesState);
  }
  p_activeSystemGesturesState = &self->_activeSystemGesturesState;
  if (self->_activeSystemGesturesState != v4)
  {
    if (gc_isInternalBuild())
    {
      long long v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        long long v19 = self;
        __int16 v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "%@ setActiveSystemGesturesState - %@", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)&self->_activeSystemGesturesState, v4);
    uint64_t v6 = self;
    objc_sync_enter(v6);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(NSMapTable *)v6->_clientSystemGestureEndpoints objectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          BOOL v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 isSystemGestureObserver]) {
            [v11 setSystemGesturesState:*p_activeSystemGesturesState];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
}

- (GCSystemGesturesState)activeSystemGesturesState
{
  return self->_activeSystemGesturesState;
}

- (id)makeSyntheticController
{
  uint64_t v3 = [_GCSyntheticControllerDescription alloc];
  uint64_t v4 = [(_GCDefaultLogicalDevice *)self identifier];
  id v5 = [(_GCDefaultLogicalDevice *)self persistentIdentifierForSettings];
  uint64_t v6 = [(_GCSyntheticControllerDescription *)v3 initWithControllerIdentifier:v4 persistentIdentifier:v5];

  return v6;
}

- (id)hapticDriver
{
  v2 = [(_GCPhysicalDevice *)self->_underlyingDevice driverConnection];
  uint64_t v3 = [v2 remoteProxy];

  return v3;
}

- (void)initWithPhysicalDevice:(uint64_t)a3 configuration:(uint64_t)a4 manager:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPhysicalDevice:(uint64_t)a3 configuration:(uint64_t)a4 manager:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPhysicalDevice:(uint64_t)a3 configuration:(uint64_t)a4 manager:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addClient:.cold.1()
{
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_2_2(&dword_220998000, v0, v1, "Device %@ client added: %@");
}

- (void)_removeClient:.cold.1()
{
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_2_2(&dword_220998000, v0, v1, "Device %@ client removed: %@");
}

@end