@interface _GCHapticClientProxy
+ (_GCHapticClientProxy)clientProxyWithConnection:(id)a3 server:(id)a4 clientID:(unint64_t)a5;
- (BOOL)complete;
- (BOOL)isInvalid;
- (BOOL)isMockClient;
- (BOOL)isMuted;
- (BOOL)isMutedForReason:(unint64_t)a3;
- (BOOL)running;
- (BOOL)shouldSquareContinuousIntensity;
- (BOOL)stopping;
- (NSArray)actuators;
- (NSArray)invalidationHandlers;
- (NSCopying)identifier;
- (NSMutableDictionary)hapticPlayers;
- (NSString)bundleIdentifier;
- (NSString)controllerProductCategory;
- (NSString)persistentControllerIdentifier;
- (_GCHapticClientProxy)init;
- (double)activeLifetimeInSeconds;
- (double)totalLifetimeInSeconds;
- (float)hapticStrength;
- (id).cxx_construct;
- (id)_initWithConnection:(id)a3 server:(id)a4 clientID:(unint64_t)a5;
- (id)addInvalidationHandler:(id)a3;
- (id)description;
- (int)totalPlayers;
- (unint64_t)clientID;
- (unsigned)applicationState;
- (void)_configureActuatorsLegacyWithOptions:(id)a3;
- (void)addActiveTime:(double)a3;
- (void)allocateClientResources:(id)a3;
- (void)configureWithOptions:(id)a3 reply:(id)a4;
- (void)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5;
- (void)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7;
- (void)dealloc;
- (void)debugEngineIsRunning:(id)a3;
- (void)debugExpectNotifyOnFinishAfter:(double)a3 reply:(id)a4;
- (void)detachSequence:(unint64_t)a3;
- (void)getHapticLatency:(id)a3;
- (void)invalidate;
- (void)invalidateDueToControllerDisconnect;
- (void)loadHapticEvent:(id)a3 reply:(id)a4;
- (void)loadHapticSequenceFromData:(id)a3 reply:(id)a4;
- (void)loadHapticSequenceFromEvents:(id)a3 reply:(id)a4;
- (void)loadVibePattern:(id)a3 reply:(id)a4;
- (void)notifyClientCompletedWithError:(id)a3;
- (void)notifyClientOnStopWithReason:(int64_t)a3 error:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareHapticSequence:(unint64_t)a3 reply:(id)a4;
- (void)prewarm:(id)a3;
- (void)queryCapabilities:(id)a3 reply:(id)a4;
- (void)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (void)refreshUserSettingForMuteHaptics;
- (void)releaseChannels;
- (void)releaseClientResources;
- (void)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (void)removeChannel:(unint64_t)a3 reply:(id)a4;
- (void)removeCustomAudioEvent:(unint64_t)a3 reply:(id)a4;
- (void)requestChannels:(unint64_t)a3 reply:(id)a4;
- (void)setApplicationState:(unsigned int)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setChannelEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 reply:(id)a5;
- (void)setClientID:(unint64_t)a3;
- (void)setComplete:(BOOL)a3;
- (void)setHapticPlayers:(id)a3;
- (void)setHapticStrength:(float)a3;
- (void)setInvalidationHandlers:(id)a3;
- (void)setMockClient:(BOOL)a3;
- (void)setMute:(BOOL)a3 forReason:(unint64_t)a4;
- (void)setPlayerBehavior:(unint64_t)a3 reply:(id)a4;
- (void)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channelIndex:(unint64_t)a5 reply:(id)a6;
- (void)setShouldSquareContinuousIntensity:(BOOL)a3;
- (void)sharedMemory;
- (void)startRunning:(id)a3;
- (void)stopPrewarm;
- (void)stopRunning;
- (void)stopRunning:(id)a3;
- (void)teardownAndReleaseChannels;
@end

@implementation _GCHapticClientProxy

+ (_GCHapticClientProxy)clientProxyWithConnection:(id)a3 server:(id)a4 clientID:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) _initWithConnection:v8 server:v9 clientID:a5];

  return (_GCHapticClientProxy *)v10;
}

- (id)_initWithConnection:(id)a3 server:(id)a4 clientID:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_GCHapticClientProxy;
  v11 = [(_GCHapticClientProxy *)&v33 init];
  v12 = v11;
  if (v11)
  {
    v11->_applicationState = 0;
    objc_storeStrong((id *)&v11->_server, a4);
    objc_storeStrong((id *)&v12->_connection, a3);
    v12->_clientID = a5;
    uint64_t v13 = +[NSMutableDictionary dictionary];
    hapticPlayers = v12->_hapticPlayers;
    v12->_hapticPlayers = (NSMutableDictionary *)v13;

    uint64_t v15 = +[NSMutableArray array];
    actuators = v12->_actuators;
    v12->_actuators = (NSArray *)v15;

    *(_WORD *)&v12->_shouldSquareContinuousIntensity = 257;
    uint64_t v17 = GCLookupService();
    settingsStore = v12->_settingsStore;
    v12->_settingsStore = (GCSSettingsStoreService *)v17;

    v19 = [(GCSSettingsStoreService *)v12->_settingsStore profiles];
    [v19 addObserver:v12 forKeyPath:@"values" options:1 context:kGCSettingsContext];

    v20 = [(GCSSettingsStoreService *)v12->_settingsStore games];
    [v20 addObserver:v12 forKeyPath:@"values" options:1 context:kGCSettingsContext];

    uint64_t v21 = objc_opt_new();
    invalidationHandlers = v12->_invalidationHandlers;
    v12->_invalidationHandlers = (NSArray *)v21;

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __60___GCHapticClientProxy__initWithConnection_server_clientID___block_invoke;
    v31[3] = &unk_26D22BDF0;
    v23 = v12;
    v32 = v23;
    v24 = (void *)MEMORY[0x223C6E420](v31);
    uint64_t v25 = [(_GCIPCIncomingConnection *)v12->_connection addInvalidationHandler:v24];
    id connectionInvalidationRegistration = v23->_connectionInvalidationRegistration;
    v23->_id connectionInvalidationRegistration = (id)v25;

    uint64_t v27 = [(_GCIPCIncomingConnection *)v12->_connection addInterruptionHandler:v24];
    id connectionInterruptedRegistration = v23->_connectionInterruptedRegistration;
    v23->_id connectionInterruptedRegistration = (id)v27;

    v23->_initializationTime = (double)mach_absolute_time() * 0.0000000416666667;
    if (gc_isInternalBuild())
    {
      v30 = getGCHapticsLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v23;
        _os_log_impl(&dword_220998000, v30, OS_LOG_TYPE_DEFAULT, "Haptic client proxy created: %@", buf, 0xCu);
      }
    }
  }

  return v12;
}

- (_GCHapticClientProxy)init
{
  return 0;
}

- (void)dealloc
{
  v4 = [(GCSSettingsStoreService *)self->_settingsStore profiles];

  if (v4)
  {
    v5 = [(GCSSettingsStoreService *)self->_settingsStore profiles];
    [v5 removeObserver:self forKeyPath:@"values" context:kGCSettingsContext];
  }
  v6 = [(GCSSettingsStoreService *)self->_settingsStore games];

  if (v6)
  {
    v7 = [(GCSSettingsStoreService *)self->_settingsStore games];
    [v7 removeObserver:self forKeyPath:@"values" context:kGCSettingsContext];
  }
  id v8 = +[GCAnalytics instance];
  id v9 = [(_GCHapticClientProxy *)self bundleIdentifier];
  id v10 = (void *)[v9 copy];
  v11 = [(_GCHapticClientProxy *)self controllerProductCategory];
  v12 = (void *)[v11 copy];
  uint64_t v13 = [(_GCHapticClientProxy *)self totalPlayers];
  [(_GCHapticClientProxy *)self totalLifetimeInSeconds];
  double v15 = v14;
  [(_GCHapticClientProxy *)self activeLifetimeInSeconds];
  [v8 sendHapticsClientDestroyedEventForBundleID:v10 productCategory:v12 totalPlayers:v13 sessionTotalDuration:(int)v15 sessionActiveDuration:(int)v16 terminationReason:@"Dealloc"];

  unsigned __int8 v17 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v17 & 1) == 0)
  {
    v18 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v18 handleFailureInMethod:a2, self, @"GCHapticClientProxy.mm", 134, @"%@ is being deallocated, but is still valid.", self object file lineNumber description];
  }
  [(_GCHapticClientProxy *)self invalidate];
  [(_GCHapticClientProxy *)self releaseClientResources];
  v19.receiver = self;
  v19.super_class = (Class)_GCHapticClientProxy;
  [(_GCHapticClientProxy *)&v19 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kGCSettingsContext == a6)
  {
    [(_GCHapticClientProxy *)self refreshUserSettingForMuteHaptics];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_GCHapticClientProxy;
    [(_GCHapticClientProxy *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)invalidateDueToControllerDisconnect
{
  if (gc_isInternalBuild())
  {
    v4 = getGCHapticsLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "%@ invalidateDueToControllerDisconnect", (uint8_t *)&v5, 0xCu);
    }
  }
  v3 = [(_GCIPCIncomingConnection *)self->_connection remoteProxy];
  [v3 clientDisconnectingForReason:3 error:0];

  [(_GCHapticClientProxy *)self invalidate];
}

- (void)invalidate
{
  p_invalid = &self->_invalid;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    atomic_store(1u, (unsigned __int8 *)p_invalid);
    int v5 = [(_GCHapticClientProxy *)v4 invalidationHandlers];
    objc_sync_exit(v4);

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = objc_msgSend(v5, "reverseObjectEnumerator", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      objc_super v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v19 = v4;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Haptic client proxy invalidated: %@", buf, 0xCu);
      }
    }
    id connectionInterruptedRegistration = v4->_connectionInterruptedRegistration;
    v4->_id connectionInterruptedRegistration = 0;

    id connectionInvalidationRegistration = v4->_connectionInvalidationRegistration;
    v4->_id connectionInvalidationRegistration = 0;

    [(_GCIPCIncomingConnection *)v4->_connection invalidate];
    connection = v4->_connection;
    v4->_connection = 0;
  }
}

- (void)setBundleIdentifier:(id)a3
{
  id v5 = a3;
  p_bundleIdentifier = &self->_bundleIdentifier;
  if (!self->_bundleIdentifier)
  {
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);
    if ([(NSString *)*p_bundleIdentifier isEqual:@"com.apple.TVSettings"]) {
      char v7 = 1;
    }
    else {
      char v7 = [(NSString *)*p_bundleIdentifier isEqual:@"com.apple.Preferences"];
    }
    self->_BOOL neverMute = v7;
    if (gc_isInternalBuild())
    {
      uint64_t v8 = getGCHapticsLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL neverMute = self->_neverMute;
        int v10 = 138412546;
        id v11 = self;
        __int16 v12 = 1024;
        BOOL v13 = neverMute;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "%@ neverMute=%d", (uint8_t *)&v10, 0x12u);
      }
    }
    [(_GCHapticClientProxy *)self refreshUserSettingForMuteHaptics];
  }
}

- (void)refreshUserSettingForMuteHaptics
{
  [(_GCHapticClientProxy *)self setMute:0 forReason:4];
  unsigned __int8 v3 = [(GCSSettingsStoreService *)self->_settingsStore profileForPersistentControllerIdentifier:self->_persistentControllerIdentifier appBundleIdentifier:self->_bundleIdentifier];
  v4 = v3;
  if (v3)
  {
    [v3 hapticStrength];
    float v6 = v5;
    double v7 = v6;
    if (gc_isInternalBuild())
    {
      uint64_t v9 = getGCHapticsLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = self->_bundleIdentifier;
        int v11 = 138412802;
        __int16 v12 = self;
        __int16 v13 = 1024;
        BOOL v14 = v7 < 0.01;
        __int16 v15 = 2112;
        long long v16 = bundleIdentifier;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "%@ setMute=%d for %@", (uint8_t *)&v11, 0x1Cu);
      }
    }
    [(_GCHapticClientProxy *)self setMute:v7 < 0.01 forReason:4];
    if (v7 >= 0.01)
    {
      *(float *)&double v8 = v6;
      [(_GCHapticClientProxy *)self setHapticStrength:v8];
    }
  }
}

- (BOOL)running
{
  return self->_running;
}

- (BOOL)stopping
{
  return self->_stopping;
}

- (void)sharedMemory
{
  return &self->_sharedMemory;
}

- (void)notifyClientOnStopWithReason:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  [(_GCHapticClientProxy *)self stopRunning];
  if (gc_isInternalBuild())
  {
    double v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218242;
      int64_t v10 = a3;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "notifyClientOnStopWithReason:%lu error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  double v7 = [(_GCIPCIncomingConnection *)self->_connection remoteProxy];
  [v7 clientStoppedForReason:a3 error:v6];
}

- (void)setMute:(BOOL)a3 forReason:(unint64_t)a4
{
  v4 = (char *)self + 4 * a4;
  int v5 = *((_DWORD *)v4 + 25);
  if (a3) {
    int v6 = v5 + 1;
  }
  else {
    int v6 = v5 - 1;
  }
  *((_DWORD *)v4 + 25) = (int)fmax((double)v6, 0.0);
  self->_dirtyMuteState = 1;
}

- (void)setHapticStrength:(float)a3
{
  self->_hapticStrength = a3;
}

- (float)hapticStrength
{
  return self->_hapticStrength;
}

- (BOOL)isMutedForReason:(unint64_t)a3
{
  if (a3 >= 5)
  {
    double v7 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v7 handleFailureInMethod:a2 object:self file:@"GCHapticClientProxy.mm" lineNumber:248 description:@"Attempting to check if player is muted for invalid reason"];
  }
  return self->_muteReasons[a3] != 0;
}

- (BOOL)isMuted
{
  if (!self->_dirtyMuteState) {
    return self->_muted;
  }
  BOOL v2 = 0;
  self->_muted = 0;
  if (!self->_neverMute)
  {
    uint64_t v3 = 0;
    while (!self->_muteReasons[v3])
    {
      if (++v3 == 5) {
        return 0;
      }
    }
    BOOL v2 = 1;
    self->_muted = 1;
  }
  return v2;
}

- (void)notifyClientCompletedWithError:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    int v6 = getGCHapticsLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      double v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_INFO, "%@ notifyClientCompletedWithError: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  int v5 = [(_GCIPCIncomingConnection *)self->_connection remoteProxy];
  [v5 clientCompletedWithError:0];
}

- (void)setComplete:(BOOL)a3
{
  if (self->_complete != a3)
  {
    BOOL v3 = a3;
    if (gc_isInternalBuild())
    {
      int v5 = getGCHapticsLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = @"NO";
        if (v3) {
          int v6 = @"YES";
        }
        int v7 = 138412546;
        double v8 = self;
        __int16 v9 = 2112;
        id v10 = v6;
        _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "%@ setComplete=%@", (uint8_t *)&v7, 0x16u);
      }
    }
    self->_complete = v3;
    if (v3) {
      [(_GCHapticClientProxy *)self notifyClientCompletedWithError:0];
    }
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@-%lu (%@) reservedChannels=%lu muted=%d running=%d>", objc_opt_class(), self->_clientID, self->_bundleIdentifier, [(NSMutableDictionary *)self->_hapticPlayers count], self->_muted, self->_running];
}

- (double)totalLifetimeInSeconds
{
  double result = 0.0;
  if (self->_initializationTime >= 0.0) {
    return (double)mach_absolute_time() * 0.0000000416666667 - self->_initializationTime;
  }
  return result;
}

- (void)addActiveTime:(double)a3
{
  if (a3 >= 0.0) {
    self->_activeLifetimeInSeconds = self->_activeLifetimeInSeconds + a3;
  }
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unint64_t)a3
{
  self->_clientID = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)persistentControllerIdentifier
{
  return self->_persistentControllerIdentifier;
}

- (NSString)controllerProductCategory
{
  return self->_controllerProductCategory;
}

- (NSArray)actuators
{
  return self->_actuators;
}

- (NSMutableDictionary)hapticPlayers
{
  return self->_hapticPlayers;
}

- (void)setHapticPlayers:(id)a3
{
}

- (BOOL)shouldSquareContinuousIntensity
{
  return self->_shouldSquareContinuousIntensity;
}

- (void)setShouldSquareContinuousIntensity:(BOOL)a3
{
  self->_shouldSquareContinuousIntensity = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (BOOL)isMockClient
{
  return self->_mockClient;
}

- (void)setMockClient:(BOOL)a3
{
  self->_mockClient = a3;
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (int)totalPlayers
{
  return self->_totalPlayers;
}

- (double)activeLifetimeInSeconds
{
  return self->_activeLifetimeInSeconds;
}

- (NSArray)invalidationHandlers
{
  return self->_invalidationHandlers;
}

- (void)setInvalidationHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong((id *)&self->_hapticPlayers, 0);
  objc_storeStrong((id *)&self->_actuators, 0);
  objc_storeStrong((id *)&self->_controllerProductCategory, 0);
  objc_storeStrong((id *)&self->_persistentControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeProfile, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  SharableMemoryBlock::~SharableMemoryBlock((SharableMemoryBlock *)&self->_sharedMemory);

  objc_storeStrong((id *)&self->_server, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  *(void *)((char *)self + 60) = 0xFFFFFFFFLL;
  *((void *)self + 9) = 0;
  *((void *)self + 3) = &unk_26D285A10;
  return self;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInvalidationHandler:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[v4 copy];

  int v6 = self;
  objc_sync_enter(v6);
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&v6->_invalid);
  if (v7)
  {
    objc_sync_exit(v6);

    id v12 = 0;
  }
  else
  {
    double v8 = [(_GCHapticClientProxy *)v6 invalidationHandlers];
    __int16 v9 = (void *)[v8 mutableCopy];

    id v10 = (void *)MEMORY[0x223C6E420](v5);
    [v9 addObject:v10];

    [(_GCHapticClientProxy *)v6 setInvalidationHandlers:v9];
    objc_sync_exit(v6);

    objc_initWeak(&location, v6);
    __int16 v11 = [_GCObservation alloc];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __71___GCHapticClientProxy_InvalidationObservable__addInvalidationHandler___block_invoke;
    v14[3] = &unk_26D22CD40;
    objc_copyWeak(&v16, &location);
    id v15 = v5;
    id v12 = [(_GCObservation *)v11 initWithCleanupHandler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)_configureActuatorsLegacyWithOptions:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKey:@"hapticEngineInfo"];
  if (!v5)
  {
    if (gc_isInternalBuild())
    {
      objc_super v19 = getGCHapticsLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v19, OS_LOG_TYPE_DEFAULT, "hapticEngineInfo not found, looking for individual components...", buf, 2u);
      }
    }
    unsigned __int8 v7 = [v4 objectForKey:@"hapticEngineLabel"];
    if (!v7)
    {
      uint64_t v14 = [v4 objectForKey:@"hapticEngineName"];
      if (v14) {
        unsigned __int8 v7 = (__CFString *)v14;
      }
      else {
        unsigned __int8 v7 = @"Unknown";
      }
    }
    uint64_t v15 = [v4 objectForKey:@"hapticEngineIndex"];
    if (v15) {
      int v6 = (void *)v15;
    }
    else {
      int v6 = &unk_26D2875D8;
    }
    id v12 = [v4 objectForKey:@"hapticEngineType"];
    id v16 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", v7, -[NSObject isEqualToString:](v12, "isEqualToString:", @"LRA"), [v6 integerValue]);
    v23 = v16;
    long long v17 = +[NSArray arrayWithObjects:&v23 count:1];
    actuators = self->_actuators;
    self->_actuators = v17;

    if (gc_isInternalBuild())
    {
      v20 = getGCHapticsLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = self->_actuators;
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v21;
        _os_log_impl(&dword_220998000, v20, OS_LOG_TYPE_DEFAULT, "Created actuator: %@", buf, 0xCu);
      }
    }
    goto LABEL_16;
  }
  id v22 = 0;
  int v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v22];
  unsigned __int8 v7 = (__CFString *)v22;
  v26 = v6;
  double v8 = +[NSArray arrayWithObjects:&v26 count:1];
  __int16 v9 = self->_actuators;
  self->_actuators = v8;

  if (!v7)
  {
    if (!gc_isInternalBuild()) {
      goto LABEL_18;
    }
    id v12 = getGCHapticsLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v6;
    __int16 v13 = "Haptic actuator received: %@";
    goto LABEL_27;
  }
  id v10 = +[GCAnalytics instance];
  __int16 v11 = currentProcessBundleIdentifier();
  [v10 sendHapticsErrorRaisedEventFromSource:v11 productCategory:self->_controllerProductCategory errorType:@"ConfigureActuatorsLegacyFailure"];

  if (gc_isInternalBuild())
  {
    id v12 = getGCHapticsLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v7;
    __int16 v13 = "Failed to unarchive haptic actuator! %@";
LABEL_27:
    _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    goto LABEL_16;
  }
LABEL_18:
}

- (void)configureWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, unint64_t))a4;
  if (gc_isInternalBuild())
  {
    v29 = getGCHapticsLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v42 = (unint64_t)v6;
      _os_log_impl(&dword_220998000, v29, OS_LOG_TYPE_DEFAULT, "configureWithOptions %@", buf, 0xCu);
    }
  }
  double v8 = [v6 objectForKey:@"controllerProductCategory"];
  controllerProductCategory = self->_controllerProductCategory;
  self->_controllerProductCategory = v8;

  if (self->_controllerProductCategory && gc_isInternalBuild())
  {
    v30 = getGCHapticsLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_controllerProductCategory;
      *(_DWORD *)buf = 138412290;
      unint64_t v42 = (unint64_t)v31;
      _os_log_impl(&dword_220998000, v30, OS_LOG_TYPE_DEFAULT, "Received controller product category %@", buf, 0xCu);
    }
  }
  id v10 = [v6 objectForKey:@"actuators"];
  if (v10)
  {
    id v40 = 0;
    __int16 v11 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v10 error:&v40];
    id v12 = v40;
    if (v12)
    {
      __int16 v13 = +[GCAnalytics instance];
      uint64_t v14 = currentProcessBundleIdentifier();
      [v13 sendHapticsErrorRaisedEventFromSource:v14 productCategory:self->_controllerProductCategory errorType:@"ConfigureActuatorsFailure"];

      if (!gc_isInternalBuild())
      {
LABEL_13:

        goto LABEL_14;
      }
      p_super = getGCHapticsLogger();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v42 = (unint64_t)v12;
        _os_log_impl(&dword_220998000, p_super, OS_LOG_TYPE_DEFAULT, "Failed to unarchive haptic actuator! %@", buf, 0xCu);
      }
    }
    else
    {
      if (gc_isInternalBuild())
      {
        v39 = getGCHapticsLogger();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v42 = (unint64_t)v11;
          _os_log_impl(&dword_220998000, v39, OS_LOG_TYPE_DEFAULT, "Haptic actuators received: %@", buf, 0xCu);
        }
      }
      id v16 = v11;
      p_super = &self->_actuators->super;
      self->_actuators = v16;
    }

    goto LABEL_13;
  }
  [(_GCHapticClientProxy *)self _configureActuatorsLegacyWithOptions:v6];
LABEL_14:
  long long v17 = [v6 objectForKey:@"controllerIdentifier"];
  identifier = self->_identifier;
  self->_identifier = v17;

  if (self->_identifier && gc_isInternalBuild())
  {
    v32 = getGCHapticsLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v33 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      unint64_t v42 = (unint64_t)v33;
      _os_log_impl(&dword_220998000, v32, OS_LOG_TYPE_DEFAULT, "Received controller identifier %@", buf, 0xCu);
    }
  }
  objc_super v19 = [v6 objectForKey:@"persistentControllerIdentifier"];
  persistentControllerIdentifier = self->_persistentControllerIdentifier;
  self->_persistentControllerIdentifier = v19;

  uint64_t v21 = self->_persistentControllerIdentifier;
  if (!v21)
  {
    self->_persistentControllerIdentifier = (NSString *)@"__Unknown";
LABEL_21:

    goto LABEL_22;
  }
  if (gc_isInternalBuild())
  {
    uint64_t v21 = getGCHapticsLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = self->_persistentControllerIdentifier;
      *(_DWORD *)buf = 138412290;
      unint64_t v42 = (unint64_t)v22;
      _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_DEFAULT, "Received persistent controller identifier %@", buf, 0xCu);
    }
    goto LABEL_21;
  }
LABEL_22:
  v23 = [v6 objectForKey:@"isDummyServer"];
  v24 = v23;
  if (v23 && [v23 BOOLValue])
  {
    if (gc_isInternalBuild())
    {
      v34 = getGCHapticsLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        actuators = self->_actuators;
        v36 = self->_identifier;
        *(_DWORD *)buf = 138412546;
        unint64_t v42 = (unint64_t)actuators;
        __int16 v43 = 2112;
        v44 = v36;
        _os_log_impl(&dword_220998000, v34, OS_LOG_TYPE_DEFAULT, "==ENTERING DUMMY SERVER MODE FOR ACTUATORS %@ AND CONTROLLER IDENTIFIER %@==", buf, 0x16u);
      }
    }
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v25 = 0;
  }
  [(_GCHapticClientProxy *)self setMockClient:v25];
  v26 = [v6 objectForKey:@"shouldSquareContinuousIntensity"];
  uint64_t v27 = v26;
  if (v26 && [v26 BOOLValue] && gc_isInternalBuild())
  {
    v37 = getGCHapticsLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      unint64_t clientID = self->_clientID;
      *(_DWORD *)buf = 134217984;
      unint64_t v42 = clientID;
      _os_log_impl(&dword_220998000, v37, OS_LOG_TYPE_INFO, "%lu should use legacy continuous intensity curve.", buf, 0xCu);
    }
  }
  v28 = +[_GCHapticServerManager sharedInstance];
  [v28 hapticClientProxyInitialized:self];

  v7[2](v7, self->_clientID);
}

- (void)queryCapabilities:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id, void))a4;
  id v8 = objc_alloc_init((Class)&off_26D2B4CF0);
  __int16 v9 = [v6 objectForKey:@"RequestedLocality"];
  id v10 = [(NSArray *)self->_actuators firstObject];
  BOOL v11 = [v10 type] == 0;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __62___GCHapticClientProxy_HapticServer__queryCapabilities_reply___block_invoke;
  v14[3] = &unk_26D22CD68;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  BOOL v17 = v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v14];
  v7[2](v7, v12, 0);
}

- (void)allocateClientResources:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    id v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = clientID;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - allocateClientResources", buf, 0xCu);
    }
  }
  *(void *)buf = xpc_null_create();
  unsigned int v10 = 5376;
  int v5 = HapticSharedMemory::allocate((uint64_t)&self->_sharedMemory, (void **)buf, &v10);
  if (v5)
  {
    id v6 = +[NSError errorWithDomain:@"com.apple.GameController.gamecontrollerd.haptics" code:v5 userInfo:0];
  }
  else
  {
    id v6 = 0;
  }
  (*((void (**)(id, void, void, void *))v4 + 2))(v4, *(void *)buf, v10, v6);

  unsigned __int8 v7 = *(void **)buf;
  *(void *)buf = 0;
}

- (void)releaseClientResources
{
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCHapticsLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v5 = 134217984;
      unint64_t v6 = clientID;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - releaseClientResources", (uint8_t *)&v5, 0xCu);
    }
  }
  (*((void (**)(HapticSharedMemory *))self->_sharedMemory._vptr$SharableMemoryBase + 2))(&self->_sharedMemory);
}

- (void)getHapticLatency:(id)a3
{
  id v4 = (void (**)(id, void, double))a3;
  if (gc_isInternalBuild())
  {
    int v5 = getGCHapticsLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v7 = 134217984;
      unint64_t v8 = clientID;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - getHapticLatency", (uint8_t *)&v7, 0xCu);
    }
  }
  v4[2](v4, 0, 15.0);
}

- (void)setPlayerBehavior:(unint64_t)a3 reply:(id)a4
{
  unint64_t v6 = (void (**)(id, void))a4;
  if (gc_isInternalBuild())
  {
    unint64_t v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v14 = 134218240;
      unint64_t v15 = clientID;
      __int16 v16 = 2048;
      unint64_t v17 = a3;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - setPlayerBehavior %lu", (uint8_t *)&v14, 0x16u);
    }
  }
  unint64_t v7 = a3 & 0x40;
  if ((v7 >> 6) != [(_GCHapticClientProxy *)self isMutedForReason:0])
  {
    if (gc_isInternalBuild())
    {
      unsigned int v10 = getGCHapticsLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [(_GCHapticClientProxy *)self identifier];
        id v12 = (void *)v11;
        id v13 = @"Unmute";
        if (v7) {
          id v13 = @"Mute";
        }
        int v14 = 138412546;
        unint64_t v15 = (unint64_t)v13;
        __int16 v16 = 2112;
        unint64_t v17 = v11;
        _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "%@ haptics for client %@", (uint8_t *)&v14, 0x16u);
      }
    }
    [(_GCHapticClientProxy *)self setMute:v7 != 0 forReason:0];
  }
  v6[2](v6, 0);
}

- (void)teardownAndReleaseChannels
{
  BOOL v3 = +[_GCHapticServerManager sharedInstance];
  id v4 = [v3 runloopQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64___GCHapticClientProxy_HapticServer__teardownAndReleaseChannels__block_invoke;
  block[3] = &unk_26D22BDF0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)releaseChannels
{
  BOOL v3 = +[_GCHapticServerManager sharedInstance];
  id v4 = [v3 runloopQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53___GCHapticClientProxy_HapticServer__releaseChannels__block_invoke;
  block[3] = &unk_26D22BDF0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)requestChannels:(unint64_t)a3 reply:(id)a4
{
  id v7 = a4;
  unint64_t v8 = +[_GCHapticServerManager sharedInstance];
  __int16 v9 = [v8 runloopQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __60___GCHapticClientProxy_HapticServer__requestChannels_reply___block_invoke;
  v11[3] = &unk_26D22CD90;
  unint64_t v13 = a3;
  SEL v14 = a2;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (void)removeChannel:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = +[_GCHapticServerManager sharedInstance];
  unint64_t v8 = [v7 runloopQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke;
  block[3] = &unk_26D22CDB8;
  id v11 = v6;
  unint64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (void)setChannelEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 reply:(id)a5
{
  id v9 = (void (**)(id, void))a5;
  if (gc_isInternalBuild())
  {
    SEL v14 = getGCHapticsLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v22 = 134218496;
      unint64_t v23 = clientID;
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - setChannelEventBehavior %lu, behavior %lu", (uint8_t *)&v22, 0x20u);
    }
  }
  hapticPlayers = self->_hapticPlayers;
  id v11 = +[NSNumber numberWithUnsignedInteger:a3];
  unint64_t v12 = [(NSMutableDictionary *)hapticPlayers objectForKeyedSubscript:v11];

  if (v12)
  {
    unint64_t v13 = a4 & 2;
    if ((v13 >> 1) != [v12 isMutedForReason:0])
    {
      if (gc_isInternalBuild())
      {
        v18 = getGCHapticsLogger();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v12 identifier];
          v20 = (void *)v19;
          uint64_t v21 = @"Unmute";
          if (v13) {
            uint64_t v21 = @"Mute";
          }
          int v22 = 138412546;
          unint64_t v23 = (unint64_t)v21;
          __int16 v24 = 2112;
          unint64_t v25 = v19;
          _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "%@ haptics for player %@", (uint8_t *)&v22, 0x16u);
        }
      }
      [v12 setMute:v13 != 0 forReason:0];
    }
    v9[2](v9, 0);
  }
  else
  {
    __int16 v16 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v16 handleFailureInMethod:a2 object:self file:@"GCHapticClientProxy.mm" lineNumber:616 description:@"Attempting to setChannelEventBehavior for unbound channel!"];

    unint64_t v17 = NSErrorFromOSStatus(-4804);
    ((void (**)(id, void *))v9)[2](v9, v17);
  }
}

- (void)loadHapticEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a4;
  if (gc_isInternalBuild())
  {
    id v9 = getGCHapticsLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v11 = 134218242;
      unint64_t v12 = clientID;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadHapticEvent %@", (uint8_t *)&v11, 0x16u);
    }
  }
  unint64_t v8 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v7[2](v7, -1, v8);
}

- (void)loadHapticSequenceFromData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, void *, double))a4;
  if (gc_isInternalBuild())
  {
    id v9 = getGCHapticsLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v11 = 134218242;
      unint64_t v12 = clientID;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadHapticSequenceFromData %@", (uint8_t *)&v11, 0x16u);
    }
  }
  unint64_t v8 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v7[2](v7, -1, -1, v8, -1.0);
}

- (void)loadHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, void *, double))a4;
  if (gc_isInternalBuild())
  {
    id v9 = getGCHapticsLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v11 = 134218242;
      unint64_t v12 = clientID;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadHapticSequenceFromEvents %@", (uint8_t *)&v11, 0x16u);
    }
  }
  unint64_t v8 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v7[2](v7, -1, -1, v8, -1.0);
}

- (void)loadVibePattern:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a4;
  if (gc_isInternalBuild())
  {
    id v9 = getGCHapticsLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v11 = 134218242;
      unint64_t v12 = clientID;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadVibePattern %@", (uint8_t *)&v11, 0x16u);
    }
  }
  unint64_t v8 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v7[2](v7, -1, v8);
}

- (void)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channelIndex:(unint64_t)a5 reply:(id)a6
{
  unint64_t v8 = (void (**)(id, void *))a6;
  if (gc_isInternalBuild())
  {
    id v10 = getGCHapticsLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v12 = 134218240;
      unint64_t v13 = clientID;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - setSequenceEventBehavior %lu", (uint8_t *)&v12, 0x16u);
    }
  }
  id v9 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v8[2](v8, v9);
}

- (void)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  unint64_t v15 = (void (**)(id, uint64_t, void *))a7;
  if (gc_isInternalBuild())
  {
    unint64_t v17 = getGCHapticsLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v19 = 134219010;
      unint64_t v20 = clientID;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2048;
      unint64_t v26 = a5;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - createCustomAudioEvent %@ format %@, frames %lu, options %@", (uint8_t *)&v19, 0x34u);
    }
  }
  __int16 v16 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v15[2](v15, -1, v16);
}

- (void)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void *))a5;
  if (gc_isInternalBuild())
  {
    int v11 = getGCHapticsLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v13 = 134218498;
      unint64_t v14 = clientID;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - copyCustomAudioEvent %lu, options %@", (uint8_t *)&v13, 0x20u);
    }
  }
  id v10 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v9[2](v9, -1, v10);
}

- (void)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    id v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v10 = 134218240;
      unint64_t v11 = clientID;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - referenceCustomAudioEvent %lu", (uint8_t *)&v10, 0x16u);
    }
  }
  id v7 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v6[2](v6, v7);
}

- (void)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    id v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v10 = 134218240;
      unint64_t v11 = clientID;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - releaseCustomAudioEvent %lu", (uint8_t *)&v10, 0x16u);
    }
  }
  id v7 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v6[2](v6, v7);
}

- (void)removeCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    id v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v10 = 134218240;
      unint64_t v11 = clientID;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - removeCustomAudioEvent %lu", (uint8_t *)&v10, 0x16u);
    }
  }
  id v7 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v6[2](v6, v7);
}

- (void)prepareHapticSequence:(unint64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    id v8 = getGCHapticsLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v10 = 134218240;
      unint64_t v11 = clientID;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - prepareHapticSequence %lu", (uint8_t *)&v10, 0x16u);
    }
  }
  id v7 = +[NSError errorWithDomain:@"com.apple.CoreHaptics" code:-4809 userInfo:0];
  v6[2](v6, v7);
}

- (void)detachSequence:(unint64_t)a3
{
  if (gc_isInternalBuild())
  {
    int v5 = getGCHapticsLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v7 = 134218240;
      unint64_t v8 = clientID;
      __int16 v9 = 2048;
      unint64_t v10 = a3;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - detachSequence %lu", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)prewarm:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (gc_isInternalBuild())
  {
    int v5 = getGCHapticsLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v7 = 134217984;
      unint64_t v8 = clientID;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - prewarm", (uint8_t *)&v7, 0xCu);
    }
  }
  v4[2](v4, 0);
}

- (void)stopPrewarm
{
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCHapticsLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v5 = 134217984;
      unint64_t v6 = clientID;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - stopPrewarm", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)startRunning:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (gc_isInternalBuild())
  {
    int v5 = getGCHapticsLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v7 = 134217984;
      unint64_t v8 = clientID;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - startRunning", (uint8_t *)&v7, 0xCu);
    }
  }
  self->_running = 1;
  v4[2](v4, 0);
}

- (void)stopRunning
{
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCHapticsLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v5 = 134217984;
      unint64_t v6 = clientID;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - stopRunning", (uint8_t *)&v5, 0xCu);
    }
  }
  *(_WORD *)&self->_running = 0;
}

- (void)stopRunning:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (gc_isInternalBuild())
  {
    int v5 = getGCHapticsLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v7 = 134217984;
      unint64_t v8 = clientID;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - stopRunning theReply", (uint8_t *)&v7, 0xCu);
    }
  }
  *(_WORD *)&self->_running = 256;
  v4[2](v4, 0);
  self->_stopping = 0;
}

- (void)debugExpectNotifyOnFinishAfter:(double)a3 reply:(id)a4
{
  unint64_t v6 = (void (**)(void))a4;
  if (gc_isInternalBuild())
  {
    int v7 = getGCHapticsLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t clientID = self->_clientID;
      int v9 = 134218240;
      unint64_t v10 = clientID;
      __int16 v11 = 2048;
      double v12 = a3;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - debugExpectNotifyOnFinishAfter %f", (uint8_t *)&v9, 0x16u);
    }
  }
  v6[2](v6);
}

- (void)debugEngineIsRunning:(id)a3
{
}

@end