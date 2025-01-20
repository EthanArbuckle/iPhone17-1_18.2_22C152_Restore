@interface MRAVConcreteOutputContext
+ (AVOutputContext)outputContextForLocalDevice;
+ (id)_sharedOutputContextFromType:(uint64_t)a1;
+ (id)createOutputContextWithUniqueIdentifier:(id)a3;
+ (id)iTunesContext;
+ (id)outputContextForLocalDeviceDataSource;
+ (id)sharedAudioPresentationContext;
+ (id)sharedSystemAudioContext;
+ (id)sharedSystemScreenContext;
+ (void)_initializeAVFNotificationForwarding;
+ (void)iTunesContext;
+ (void)setOutputContextForLocalDeviceDataSource:(id)a3;
- (AVOutputContext)avOutputContext;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeMuted;
- (BOOL)supportsMultipleBluetoothOutputDevices;
- (BOOL)supportsVolumeControl;
- (MRAVConcreteOutputContext)initWithAVOutputContext:(id)a3 type:(unsigned int)a4;
- (NSArray)concreteOutputDevices;
- (float)volume;
- (id)contextID;
- (id)debugDescription;
- (id)description;
- (id)predictedOutputDevice;
- (id)predictedOutputDeviceUIDs;
- (uint64_t)_unregisterNotifications;
- (unsigned)type;
- (unsigned)volumeControlCapabilities;
- (void)_addNotifications:(void *)a3 name:(void *)a4 object:;
- (void)_handleCanMuteDidChangeNotification:(id)a3;
- (void)_handleClusterMemberCanMuteDidChangeNotification:(id)a3;
- (void)_handleClusterMemberMutedDidChangeNotification:(id)a3;
- (void)_handleClusterMemberRoomVolumeDidChangeNotification:(id)a3;
- (void)_handleMutedDidChangeNotification:(id)a3;
- (void)_handleOutputContextSupportsVolumeDidChangeNotification:(id)a3;
- (void)_handleOutputDeviceCanSetVolumeDidChangeNotification:(id)a3;
- (void)_handleOutputDeviceVolumeDidChangeNotification:(id)a3;
- (void)_handleOutputDevicesDidChangeNotification:(id)a3;
- (void)_handleOutputDevicesTimedOut:(uint64_t)a1;
- (void)_handlePredictedOutputDevicesDidChangeNotification:(id)a3;
- (void)_notifyPredictedOutputDeviceDidChange:(uint64_t)a1;
- (void)_outputContextChangeInitiatedNotification:(id)a3;
- (void)_postVolumeCapabilitiesChangedNotificationForUID:(void *)a1;
- (void)_postVolumeChangedNotificationForUID:(void *)a1;
- (void)_postVolumeMutedChangedNotificationForUID:(void *)a1;
- (void)_registerNotifications;
- (void)_reloadOutputContext;
- (void)_reloadOutputDevices;
- (void)_reloadPredictedOutputDevice;
- (void)adjustVolume:(int64_t)a3 details:(id)a4;
- (void)attemptLogicalDeviceRecovery;
- (void)dealloc;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)resetPredictedOutputDevice;
- (void)setAvOutputContext:(id)a3;
- (void)setConcreteOutputDevices:(id)a3;
- (void)setIsVolumeControlAvailable:(BOOL)a3;
- (void)setPredictedOutputDevice:(uint64_t)a1;
- (void)setVolume:(float)a3 details:(id)a4;
- (void)setVolumeMuted:(BOOL)a3 details:(id)a4;
@end

@implementation MRAVConcreteOutputContext

void __44__MRAVConcreteOutputContext_avOutputContext__block_invoke(uint64_t a1)
{
}

- (void)_registerNotifications
{
  if (a1)
  {
    v2 = [a1 avOutputContext];
    if (v2)
    {
      id v21 = v2;
      v3 = getAVOutputContextOutputDeviceDidChangeNotification();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceDidChangeNotification_, v3, v21);

      v4 = getAVOutputContextOutputDevicesDidChangeNotification();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDevicesDidChangeNotification_, v4, v21);

      v5 = getAVOutputContextDestinationChangeInitiatedNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__outputContextChangeInitiatedNotification_, v5, v21);

      v6 = getAVOutputDeviceVolumeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceVolumeDidChangeNotification_, v6, 0);

      v7 = getAVOutputDeviceCanSetVolumeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceCanSetVolumeDidChangeNotification_, v7, 0);

      v8 = getAVOutputDeviceVolumeControlTypeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputDeviceCanSetVolumeDidChangeNotification_, v8, 0);

      v9 = getAVOutputContextVolumeControlTypeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputContextSupportsVolumeDidChangeNotification_, v9, v21);

      v10 = getAVOutputContextCanSetVolumeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputContextSupportsVolumeDidChangeNotification_, v10, v21);

      v11 = getAVOutputContextProvidesControlForAllVolumeFeaturesDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleOutputContextSupportsVolumeDidChangeNotification_, v11, v21);

      v12 = getAVOutputContextPredictedOutputDeviceDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handlePredictedOutputDeviceDidChangeNotification_, v12, v21);

      v13 = getAVOutputContextPredictedOutputDevicesDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handlePredictedOutputDevicesDidChangeNotification_, v13, v21);

      v14 = getAVOutputDeviceClusterMemberVolumeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberVolumeDidChangeNotification_, v14, 0);

      v15 = getAVOutputDeviceClusterMemberVolumeControlTypeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberVolumeControlTypeDidChangeNotification_, v15, 0);

      v16 = getAVOutputDeviceCanMuteDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleCanMuteDidChangeNotification_, v16, 0);

      v17 = getAVOutputDeviceMutedDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleMutedDidChangeNotification_, v17, 0);

      v18 = getAVOutputDeviceCanMuteDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberCanMuteDidChangeNotification_, v18, 0);

      v19 = getAVOutputDeviceMutedDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberMutedDidChangeNotification_, v19, 0);

      v20 = getAVOutputDeviceActivatedClusterMembersRoomVolumeDidChangeNotification[0]();
      -[MRAVConcreteOutputContext _addNotifications:name:object:]((uint64_t)a1, (uint64_t)sel__handleClusterMemberRoomVolumeDidChangeNotification_, v20, 0);

      v2 = v21;
    }
  }
}

- (void)_addNotifications:(void *)a3 name:(void *)a4 object:
{
  id v10 = a3;
  id v7 = a4;
  if (a1 && v10)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:a1 selector:a2 name:v10 object:v7];

    if (v7)
    {
      [*(id *)(a1 + 96) setObject:v7 forKeyedSubscript:v10];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [*(id *)(a1 + 96) setObject:v9 forKeyedSubscript:v10];
    }
  }
}

void __50__MRAVConcreteOutputContext_predictedOutputDevice__block_invoke(uint64_t a1)
{
}

- (id)description
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__9;
  v8 = __Block_byref_object_dispose__9;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

+ (id)sharedAudioPresentationContext
{
  if (sharedAudioPresentationContext___once != -1) {
    dispatch_once(&sharedAudioPresentationContext___once, &__block_literal_global_33);
  }
  id v2 = (void *)sharedAudioPresentationContext___context;

  return v2;
}

void __48__MRAVConcreteOutputContext_setAvOutputContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 48);
  v3 = (id *)(*(void *)(a1 + 32) + 88);

  objc_storeStrong(v3, v2);
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __59__MRAVConcreteOutputContext_sharedAudioPresentationContext__block_invoke()
{
  v0 = +[MRUserSettings currentSettings];
  int v1 = [v0 supportMultiplayerHost];

  if (v1) {
    +[MRAVConcreteOutputContext outputContextForLocalDevice];
  }
  else {
  id v2 = [(Class)getAVOutputContextClass[0]() sharedAudioPresentationOutputContext];
  }
  if (!v2)
  {
    v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__MRAVConcreteOutputContext_sharedAudioPresentationContext__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_9;
  }
  v3 = [[MRAVConcreteOutputContext alloc] initWithAVOutputContext:v2 type:1];
  uint64_t v4 = (void *)sharedAudioPresentationContext___context;
  sharedAudioPresentationContext___context = (uint64_t)v3;

  v5 = +[MRUserSettings currentSettings];
  int v6 = [v5 supportMultiplayerHost];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:sharedAudioPresentationContext___context selector:sel__handleLocalDeviceDidChangeOutputContextNotification_ name:@"MRAVOutputContextManagerLocalDeviceDidChangeOutputContextNotification" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:sharedAudioPresentationContext___context selector:sel__handleLocalDeviceDidChangeOutputContextNotification_ name:@"kMRMediaRemoteServiceClientDidRestoreConnectionNotification" object:0];
LABEL_9:
  }
}

- (MRAVConcreteOutputContext)initWithAVOutputContext:(id)a3 type:(unsigned int)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRAVConcreteOutputContext;
  id v7 = [(MRAVConcreteOutputContext *)&v21 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    uint64_t v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MRAVOutputDeviceSourceInfo alloc];
    uint64_t v15 = [v6 ID];
    uint64_t v16 = [(MRAVOutputDeviceSourceInfo *)v14 initWithRoutingContextUID:v15 multipleBuiltInDevices:0];
    outputDeviceSourceInfo = v8->_outputDeviceSourceInfo;
    v8->_outputDeviceSourceInfo = (MRAVOutputDeviceSourceInfo *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notifications = v8->_notifications;
    v8->_notifications = v18;

    [(MRAVConcreteOutputContext *)v8 setAvOutputContext:v6];
    +[MRAVConcreteOutputContext _initializeAVFNotificationForwarding]();
  }

  return v8;
}

- (void)setAvOutputContext:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MRAVConcreteOutputContext.m", 358, @"Invalid parameter not satisfying: %@", @"avOutputContext" object file lineNumber description];
  }
  -[MRAVConcreteOutputContext _unregisterNotifications]((uint64_t)self);
  if (self->_type == 1)
  {
    id v6 = NSString;
    id v7 = (__CFString *)MRAVOutputContextTypeCopyDescription(1u);
    v8 = [v6 stringWithFormat:@"OutputContext<%@-%p>", v7, self];

    uint64_t v9 = _MRLogForCategory(0);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138544130;
        v23 = v8;
        __int16 v24 = 2114;
        v25 = @"avOutputContext";
        __int16 v26 = 2112;
        id v27 = v5;
        __int16 v28 = 2112;
        id v29 = v5;
        uint64_t v11 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
        dispatch_queue_t v12 = v9;
        uint32_t v13 = 42;
LABEL_9:
        _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      __int16 v24 = 2114;
      v25 = @"avOutputContext";
      __int16 v26 = 2112;
      id v27 = 0;
      uint64_t v11 = "Set: %{public}@ setting %{public}@ to <%@>";
      dispatch_queue_t v12 = v9;
      uint32_t v13 = 32;
      goto LABEL_9;
    }
  }
  uint64_t v14 = [v5 contextID];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MRAVConcreteOutputContext_setAvOutputContext___block_invoke;
  block[3] = &unk_1E57D1B18;
  block[4] = self;
  id v20 = v5;
  id v21 = v14;
  id v16 = v14;
  id v17 = v5;
  dispatch_sync(serialQueue, block);
  -[MRAVConcreteOutputContext _registerNotifications](self);
  [(MRAVConcreteOutputContext *)self _reloadOutputDevices];
  -[MRAVConcreteOutputContext _reloadPredictedOutputDevice](self);
  [(MRAVConcreteOutputContext *)self setIsVolumeControlAvailable:[(MRAVConcreteOutputContext *)self isVolumeControlAvailable]];
  [(MRAVOutputContext *)self _scheduleOutputContextDidChangeNotification];
}

- (void)setIsVolumeControlAvailable:(BOOL)a3
{
  self->_isVolumeControlAvailable = a3;
}

- (uint64_t)_unregisterNotifications
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 96);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__MRAVConcreteOutputContext__unregisterNotifications__block_invoke;
    v3[3] = &unk_1E57D30F0;
    v3[4] = v1;
    [v2 enumerateKeysAndObjectsUsingBlock:v3];
    return [*(id *)(v1 + 96) removeAllObjects];
  }
  return result;
}

- (void)_reloadPredictedOutputDevice
{
  if (a1)
  {
    id v2 = [a1 avOutputContext];
    id v4 = [v2 predictedOutputDevice];

    if (v4)
    {
      v3 = [[MRAVConcreteOutputDevice alloc] initWithAVOutputDevice:v4 sourceInfo:a1[7]];
      -[MRAVConcreteOutputContext setPredictedOutputDevice:]((uint64_t)a1, v3);
    }
    else
    {
      -[MRAVConcreteOutputContext setPredictedOutputDevice:]((uint64_t)a1, 0);
    }
  }
}

- (id)predictedOutputDevice
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__9;
  v8 = __Block_byref_object_dispose__9;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)setPredictedOutputDevice:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v12 = 0;
    uint32_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    id v5 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MRAVConcreteOutputContext_setPredictedOutputDevice___block_invoke;
    block[3] = &unk_1E57D1C88;
    uint64_t v11 = &v12;
    block[4] = a1;
    id v6 = v3;
    id v10 = v6;
    dispatch_sync(v5, block);
    if (*((unsigned char *)v13 + 24))
    {
      id v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [v6 uid];
        *(_DWORD *)buf = 138543618;
        id v17 = v8;
        __int16 v18 = 2114;
        uint64_t v19 = a1;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Predicted output device changed to: %{public}@ for context: %{public}@", buf, 0x16u);
      }
      -[MRAVConcreteOutputContext _notifyPredictedOutputDeviceDidChange:](a1, v6);
    }

    _Block_object_dispose(&v12, 8);
  }
}

- (void)_reloadOutputDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(MRAVConcreteOutputContext *)self avOutputContext];
  id v5 = [v4 outputDevices];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [MRAVConcreteOutputDevice alloc];
        uint32_t v13 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:](v12, "initWithAVOutputDevice:sourceInfo:", v11, self->_outputDeviceSourceInfo, (void)v14);
        if (v13) {
          [v3 addObject:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(MRAVConcreteOutputContext *)self setConcreteOutputDevices:v3];
  [(MRAVOutputContext *)self _reloadWithOutputDevices:v3];
}

- (void)setConcreteOutputDevices:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MRAVConcreteOutputContext_setConcreteOutputDevices___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (BOOL)isVolumeControlAvailable
{
  BOOL v3 = [(MRAVConcreteOutputContext *)self supportsVolumeControl];
  if (v3)
  {
    id v4 = [(MRAVConcreteOutputContext *)self avOutputContext];
    char v5 = [v4 canSetVolume];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)contextID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MRAVConcreteOutputContext_contextID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)supportsVolumeControl
{
  id v2 = [(MRAVConcreteOutputContext *)self avOutputContext];
  char v3 = [v2 providesControlForAllVolumeFeatures];

  return v3;
}

- (AVOutputContext)avOutputContext
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__9;
  uint64_t v8 = __Block_byref_object_dispose__9;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVOutputContext *)v2;
}

+ (void)_initializeAVFNotificationForwarding
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (_initializeAVFNotificationForwarding___once != -1) {
    dispatch_once(&_initializeAVFNotificationForwarding___once, block);
  }
}

void __40__MRAVConcreteOutputContext_description__block_invoke(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 24);
  id v9 = (__CFString *)MRAVOutputContextTypeCopyDescription(*(_DWORD *)(v4 + 32));
  uint64_t v6 = [v2 stringWithFormat:@"<%@: %p uid=%@ type=%@ avOutputContext=%@>", v3, v4, v5, v9, *(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (unsigned)type
{
  return self->_type;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(MRAVConcreteOutputContext *)self description];
  uint64_t v5 = [(MRAVConcreteOutputContext *)self predictedOutputDeviceUIDs];
  uint64_t v6 = [(MRAVOutputContext *)self outputDevices];
  uint64_t v7 = [v3 stringWithFormat:@"%@ predicted=%@ outputDevices=%@", v4, v5, v6];

  return v7;
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = getAVOutputContextOutputDeviceDidChangeNotification();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_4;
  v13[3] = &unk_1E57D3188;
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = &__block_literal_global_133;
  uint64_t v15 = v4;
  id v5 = (id)[v2 addObserverForName:v3 object:0 queue:0 usingBlock:v13];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = getAVOutputContextOutputDevicesDidChangeNotification();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_6;
  v10[3] = &unk_1E57D3188;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = &__block_literal_global_133;
  uint64_t v12 = v8;
  id v9 = (id)[v6 addObserverForName:v7 object:0 queue:0 usingBlock:v10];
}

void __54__MRAVConcreteOutputContext_setConcreteOutputDevices___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v3 = (void *)[*(id *)(a1 + 40) copy];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v3);
  if (v2)
  {
  }
}

void __54__MRAVConcreteOutputContext_setPredictedOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) uid];
  uint64_t v3 = [*(id *)(a1 + 40) uid];
  if (v2 == v3) {
    char v4 = 0;
  }
  else {
    char v4 = [v2 isEqual:v3] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = (id *)(*(void *)(a1 + 32) + 48);

  objc_storeStrong(v6, v5);
}

+ (AVOutputContext)outputContextForLocalDevice
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  char v4 = [v3 UUIDString];

  id v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"outputContextForLocalDevice", v4];
  uint64_t v7 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v6;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v8 = [a1 outputContextForLocalDeviceDataSource];

  if (v8)
  {
    id v9 = [a1 outputContextForLocalDeviceDataSource];
    uint64_t v10 = v9[2]();
    id v11 = 0;
  }
  else
  {
    MRCreateXPCMessage(0x300000000000025uLL);
    id v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    uint64_t v12 = +[MRMediaRemoteServiceClient sharedServiceClient];
    uint32_t v13 = [v12 service];
    id v14 = [v13 mrXPCConnection];
    id v28 = 0;
    uint64_t v15 = [v14 sendSyncMessage:v9 error:&v28];
    id v11 = v28;

    long long v16 = MRCreateStringFromXPCMessage(v15, "MRXPC_ROUTING_CONTEXT_UID_KEY");
    long long v17 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = @"outputContextForLocalDevice";
      __int16 v31 = 2114;
      v32 = v4;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v10 = [(Class)getAVOutputContextClass[0]() outputContextForID:v16];
  }
  __int16 v18 = _MRLogForCategory(0xAuLL);
  uint64_t v19 = v18;
  if (v11 || !v10)
  {
    if (v11)
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      [v20 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      uint64_t v30 = @"outputContextForLocalDevice";
      __int16 v31 = 2114;
      v32 = v4;
      __int16 v33 = 2114;
      id v34 = v11;
      __int16 v35 = 2048;
      uint64_t v36 = v25;
      _os_log_error_impl(&dword_194F3C000, v19, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
      goto LABEL_18;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    [v20 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = @"outputContextForLocalDevice";
    __int16 v31 = 2114;
    v32 = v4;
    __int16 v33 = 2048;
    id v34 = v26;
    v22 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v23 = v19;
    uint32_t v24 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    [v20 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = @"outputContextForLocalDevice";
    __int16 v31 = 2114;
    v32 = v4;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2048;
    uint64_t v36 = v21;
    v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v23 = v19;
    uint32_t v24 = 42;
  }
  _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_18:

LABEL_19:

  return (AVOutputContext *)v10;
}

+ (id)sharedSystemAudioContext
{
  if (sharedSystemAudioContext___once != -1) {
    dispatch_once(&sharedSystemAudioContext___once, &__block_literal_global_8_1);
  }
  uint64_t v2 = (void *)sharedSystemAudioContext___context;

  return v2;
}

void __53__MRAVConcreteOutputContext_sharedSystemAudioContext__block_invoke()
{
  uint64_t v0 = [(Class)getAVOutputContextClass[0]() sharedSystemAudioContext];
  if (v0)
  {
    uint64_t v1 = [[MRAVConcreteOutputContext alloc] initWithAVOutputContext:v0 type:2];
    uint64_t v2 = (void *)sharedSystemAudioContext___context;
    sharedSystemAudioContext___context = (uint64_t)v1;
  }
  else
  {
    uint64_t v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__MRAVConcreteOutputContext_sharedSystemAudioContext__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

+ (id)sharedSystemScreenContext
{
  if (sharedSystemScreenContext___once != -1) {
    dispatch_once(&sharedSystemScreenContext___once, &__block_literal_global_10_0);
  }
  uint64_t v2 = (void *)sharedSystemScreenContext___context;

  return v2;
}

void __54__MRAVConcreteOutputContext_sharedSystemScreenContext__block_invoke()
{
  uint64_t v0 = [(Class)getAVOutputContextClass[0]() sharedSystemScreenContext];
  if (v0)
  {
    uint64_t v1 = [[MRAVConcreteOutputContext alloc] initWithAVOutputContext:v0 type:3];
    uint64_t v2 = (void *)sharedSystemScreenContext___context;
    sharedSystemScreenContext___context = (uint64_t)v1;
  }
  else
  {
    uint64_t v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__MRAVConcreteOutputContext_sharedSystemScreenContext__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

+ (id)iTunesContext
{
  uint64_t v2 = [(Class)getAVOutputContextClass[0]() iTunesAudioContext];
  if (v2)
  {
    uint64_t v3 = [[MRAVConcreteOutputContext alloc] initWithAVOutputContext:v2 type:4];
  }
  else
  {
    uint64_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[MRAVConcreteOutputContext iTunesContext];
    }

    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)createOutputContextWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(Class)getAVOutputContextClass[0]() sharedAudioPresentationOutputContext];
    uint64_t v6 = [v5 ID];

    if ([v6 isEqualToString:v4])
    {
      uint64_t v7 = [a1 sharedAudioPresentationContext];
    }
    else
    {
      uint64_t v8 = [(Class)getAVOutputContextClass[0]() outputContextForID:v4];
      if (v8)
      {
        uint64_t v7 = [[MRAVConcreteOutputContext alloc] initWithAVOutputContext:v8 type:5];
      }
      else
      {
        uint64_t v9 = _MRLogForCategory(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[MRAVConcreteOutputContext createOutputContextWithUniqueIdentifier:]((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
        }

        uint64_t v7 = 0;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  -[MRAVConcreteOutputContext _unregisterNotifications]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)MRAVConcreteOutputContext;
  [(MRAVConcreteOutputContext *)&v3 dealloc];
}

+ (void)setOutputContextForLocalDeviceDataSource:(id)a3
{
  _outputContextForLocalDeviceDataSource = MEMORY[0x1997190F0](a3, a2);

  MEMORY[0x1F41817F8]();
}

+ (id)outputContextForLocalDeviceDataSource
{
  uint64_t v2 = (void *)MEMORY[0x1997190F0](_outputContextForLocalDeviceDataSource, a2);

  return v2;
}

void __38__MRAVConcreteOutputContext_contextID__block_invoke(uint64_t a1)
{
}

- (NSArray)concreteOutputDevices
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__9;
  uint64_t v8 = __Block_byref_object_dispose__9;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

uint64_t __50__MRAVConcreteOutputContext_concreteOutputDevices__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  id v2 = [(MRAVConcreteOutputContext *)self avOutputContext];
  char v3 = [v2 supportsMultipleBluetoothOutputDevices];

  return v3;
}

- (id)predictedOutputDeviceUIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(MRAVConcreteOutputContext *)self predictedOutputDevice];
  char v3 = [v2 uid];

  if (v3)
  {
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_notifyPredictedOutputDeviceDidChange:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [(id)objc_opt_class() notificationQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__MRAVConcreteOutputContext__notifyPredictedOutputDeviceDidChange___block_invoke;
    v5[3] = &unk_1E57D0790;
    id v6 = v3;
    uint64_t v7 = a1;
    dispatch_async(v4, v5);
  }
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[MRAVOutputContextModification alloc] initWithRequest:v10];

  [(MRAVOutputContextModification *)v11 modifyWithOutputContext:self queue:v9 completion:v8];
}

- (void)resetPredictedOutputDevice
{
  id v2 = [(MRAVConcreteOutputContext *)self avOutputContext];
  [v2 resetPredictedOutputDevice];
}

- (void)attemptLogicalDeviceRecovery
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "[ConcreteOutputContext] Did not find any incomplete logical devices.", v1, 2u);
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ((unint64_t)[a3 count] <= 1) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_63(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(id *)(a1 + 32);
  if (v9 || ![v7 count])
  {
    uint64_t v11 = _MRLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_63_cold_1((uint64_t)v9, (uint64_t)v7, v11);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 72) = 0;
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_64;
    v22[3] = &unk_1E57D3078;
    id v23 = *(id *)(a1 + 48);
    uint64_t v12 = [v7 indexesOfObjectsPassingTest:v22];
    uint64_t v13 = [v7 objectsAtIndexes:v12];

    if ([v13 count])
    {
      uint64_t v14 = *(void **)(a1 + 40);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_69;
      v19[3] = &unk_1E57D30A0;
      id v15 = v13;
      uint64_t v16 = *(void *)(a1 + 40);
      id v20 = v15;
      uint64_t v21 = v16;
      [v14 addOutputDevices:v15 withCallbackQueue:0 block:v19];
    }
    else
    {
      long long v17 = _MRLogForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_63_cold_3(v17);
      }

      __int16 v18 = _MRLogForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_63_cold_2(v7, (id *)(a1 + 48), v18);
      }

      *(unsigned char *)(*(void *)(a1 + 40) + 72) = 0;
    }
  }
}

uint64_t __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_64(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uid];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _MRLogForCategory(0);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_69_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [*(id *)(a1 + 32) count];
    int v13 = 134217984;
    uint64_t v14 = v12;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Successfully recovered missing logical devices: %ld", (uint8_t *)&v13, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 72) = 0;
}

- (unsigned)volumeControlCapabilities
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVConcreteOutputContext_volumeControlCapabilities__block_invoke;
  v5[3] = &unk_1E57D0590;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MRAVConcreteOutputContext_volumeControlCapabilities__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) volumeControlType];
  int v3 = 4 * (result == 2);
  if (result == 1) {
    int v3 = 2;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (float)volume
{
  if (![(MRAVConcreteOutputContext *)self isVolumeControlAvailable]) {
    return 0.0;
  }
  int v3 = [(MRAVConcreteOutputContext *)self avOutputContext];
  [v3 volume];
  float v5 = v4;

  return v5;
}

- (void)setVolume:(float)a3 details:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  int v9 = [(MRAVConcreteOutputContext *)self contextID];
  uint64_t v10 = (void *)[v8 initWithFormat:@"%@ -> %lf", v9, a3];

  id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v12 = [v7 requestID];

  int v13 = (void *)[v11 initWithFormat:@"%@<%@>", @"ConcreteOutputContext.setVolume", v12];
  if (v10) {
    [v13 appendFormat:@" for %@", v10];
  }
  uint64_t v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v13;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if ([(MRAVConcreteOutputContext *)self isVolumeControlAvailable])
  {
    uint64_t v15 = [(MRAVConcreteOutputContext *)self avOutputContext];
    *(float *)&double v16 = a3;
    [v15 setVolume:v16];
  }
  else
  {
    uint64_t v15 = _MRLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Volume control is not available, ignoring setVolume request.", buf, 2u);
    }
  }
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  int v9 = [(MRAVConcreteOutputContext *)self contextID];
  uint64_t v10 = MRMediaRemoteVolumeControlAdjustmentDescription(a3);
  id v11 = (void *)[v8 initWithFormat:@"%@ -> %@", v9, v10];

  id v12 = objc_alloc(MEMORY[0x1E4F28E78]);
  int v13 = [v7 requestID];

  uint64_t v14 = (void *)[v12 initWithFormat:@"%@<%@>", @"ConcreteOutputContext.adjustVolume", v13];
  if (v11) {
    [v14 appendFormat:@" for %@", v11];
  }
  uint64_t v15 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v14;
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  double v16 = [(MRAVConcreteOutputContext *)self avOutputContext];
  if ([v16 volumeControlType] == 2)
  {
    if ((unint64_t)(a3 - 1) > 2)
    {
      if ((unint64_t)(a3 - 4) <= 2) {
        [v16 decreaseVolumeByCount:1];
      }
    }
    else
    {
      [v16 increaseVolumeByCount:1];
    }
  }
}

- (BOOL)isVolumeMuted
{
  id v2 = [(MRAVConcreteOutputContext *)self avOutputContext];
  char v3 = [v2 isMuted];

  return v3;
}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  int v9 = [(MRAVConcreteOutputContext *)self contextID];
  uint64_t v10 = (void *)[v8 initWithFormat:@"%@ -> %u", v9, v4];

  id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v12 = [v7 requestID];

  int v13 = (void *)[v11 initWithFormat:@"%@<%@>", @"ConcreteOutputContext.setVolumeMuted", v12];
  if (v10) {
    [v13 appendFormat:@" for %@", v10];
  }
  uint64_t v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v17 = v13;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v15 = [(MRAVConcreteOutputContext *)self avOutputContext];
  [v15 setMuted:v4];
}

- (void)_handleOutputDevicesDidChangeNotification:(id)a3
{
  id v15 = a3;
  BOOL v4 = (void *)MRMediaRemoteCopyDeviceUID();

  float v5 = +[MRAVConcreteOutputContext sharedAudioPresentationContext];

  if (MRProcessIsMediaRemoteDaemon())
  {
    if (v5 == self && v4 == 0)
    {
      id v7 = [v15 userInfo];
      id v8 = getAVOutputContextDestinationChangeReasonKey[0]();
      int v9 = [v7 objectForKeyedSubscript:v8];
      uint64_t v10 = getAVOutputContextDestinationChangeReasonIdleDisconnect[0]();
      int v11 = [v9 isEqualToString:v10];

      if (v11)
      {
        id v12 = [v15 userInfo];
        int v13 = getAVOutputContextDestinationChangePreviousDeviceIDsKey();
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];

        -[MRAVConcreteOutputContext _handleOutputDevicesTimedOut:]((uint64_t)self, v14);
      }
    }
  }
  [(MRAVOutputContext *)self _scheduleOutputContextDevicesDidChangeNotification];
}

- (void)_handleOutputDevicesTimedOut:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] AirPlay routes timed out: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    float v5 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke;
    block[3] = &unk_1E57D3118;
    block[4] = a1;
    id v6 = v3;
    id v11 = v6;
    p_long long buf = &buf;
    dispatch_sync(v5, block);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      uint64_t v7 = *(void *)(a1 + 64);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2;
      v8[3] = &unk_1E57D3140;
      v8[4] = a1;
      id v9 = v6;
      +[MRAVEndpoint createEndpointWithOutputDeviceUIDs:v9 queue:v7 completion:v8];
    }
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_outputContextChangeInitiatedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self && ((MRProcessIsMediaRemoteDaemon() & 1) != 0 || [(MRAVConcreteOutputContext *)self type] == 3))
  {
    float v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      id v7 = v4;
      __int16 v8 = 2114;
      id v9 = self;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Received output context change initiated notification: %{public}@ for context: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __53__MRAVConcreteOutputContext__unregisterNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a3;
  id v7 = a2;
  id v11 = [v5 defaultCenter];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [MEMORY[0x1E4F1CA98] null];
  if ([v6 isEqual:v9]) {
    id v10 = 0;
  }
  else {
    id v10 = v6;
  }
  [v11 removeObserver:v8 name:v7 object:v10];
}

- (void)_handleOutputContextSupportsVolumeDidChangeNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MRAVConcreteOutputContext *)self volumeControlCapabilities];
  if (self && ((MRProcessIsMediaRemoteDaemon() & 1) != 0 || [(MRAVConcreteOutputContext *)self type] == 3))
  {
    id v6 = [(MRAVConcreteOutputContext *)self avOutputContext];
    id v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v6 providesControlForAllVolumeFeatures];
      id v9 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v5);
      id v10 = [v4 name];
      *(_DWORD *)long long buf = 67109890;
      int v17 = v8;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] ProvidesVolumeFeatures did change to %{BOOL}u, capabilities: %{public}@  for context: %{public}@ - %{public}@", buf, 0x26u);
    }
  }
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5, @"MRAVOutputContextVolumeControlCapabilitiesUserInfoKey");
  char v15 = v12;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v11 postNotificationName:@"MRAVOutputContextVolumeControlCapabilitiesDidChangeNotification" object:self userInfo:v13];
}

- (void)_handleOutputDeviceCanSetVolumeDidChangeNotification:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 deviceID];
  -[MRAVConcreteOutputContext _postVolumeCapabilitiesChangedNotificationForUID:](self, v4);
}

- (void)_postVolumeCapabilitiesChangedNotificationForUID:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = objc_msgSend(a1, "concreteOutputDevices", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) effectiveOutputDeviceForUID:v3];
          if (v9)
          {
            id v10 = (void *)v9;
            if ((MRProcessIsMediaRemoteDaemon() & 1) != 0 || [a1 type] == 3)
            {
              id v11 = _MRLogForCategory(0);
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                id v12 = [v10 uid];
                int v13 = [v10 isVolumeControlAvailable];
                *(_DWORD *)long long buf = 138543874;
                uint64_t v24 = v12;
                __int16 v25 = 1024;
                int v26 = v13;
                __int16 v27 = 2114;
                id v28 = a1;
                _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Output device %{public}@ did change isVolumeControlAvailable to %{BOOL}u for context: %{public}@", buf, 0x1Cu);
              }
            }
            uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v21[0] = @"MRAVOutputContextOutputDeviceUserInfoKey";
            v21[1] = @"MRAVOutputContextVolumeControlCapabilitiesUserInfoKey";
            v22[0] = v10;
            char v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "volumeCapabilities"));
            v22[1] = v15;
            uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
            [v14 postNotificationName:@"MRAVOutputContextVolumeControlCapabilitiesDidChangeNotification" object:a1 userInfo:v16];

            goto LABEL_17;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
}

- (void)_handleCanMuteDidChangeNotification:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 ID];
  -[MRAVConcreteOutputContext _postVolumeCapabilitiesChangedNotificationForUID:](self, v4);
}

- (void)_handleClusterMemberCanMuteDidChangeNotification:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 ID];
  -[MRAVConcreteOutputContext _postVolumeCapabilitiesChangedNotificationForUID:](self, v4);
}

- (void)_handleOutputDeviceVolumeDidChangeNotification:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 deviceID];
  -[MRAVConcreteOutputContext _postVolumeChangedNotificationForUID:](self, v4);
}

- (void)_postVolumeChangedNotificationForUID:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = objc_msgSend(a1, "concreteOutputDevices", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) effectiveOutputDeviceForUID:v3];
          if (v9)
          {
            id v10 = (void *)v9;
            id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v19[0] = @"MRAVOutputContextOutputDeviceUserInfoKey";
            v19[1] = @"MRAVOutputContextVolumeUserInfoKey";
            v20[0] = v10;
            id v12 = NSNumber;
            [v10 volume];
            int v13 = objc_msgSend(v12, "numberWithFloat:");
            v20[1] = v13;
            uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
            [v11 postNotificationName:@"MRAVOutputContextVolumeDidChangeNotification" object:a1 userInfo:v14];

            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_handleClusterMemberRoomVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v10 = [v4 object];
  uint64_t v5 = [v4 userInfo];

  uint64_t v6 = getAVOutputDeviceActivatedClusterMembersRoomIDKey();
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  int v8 = [v10 ID];
  uint64_t v9 = +[MRAVRoomOutputDevice calculateOutputDeviceIDFromOutputDeviceID:v8 withRoomID:v7];

  -[MRAVConcreteOutputContext _postVolumeChangedNotificationForUID:](self, v9);
}

- (void)_handleMutedDidChangeNotification:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 deviceID];
  -[MRAVConcreteOutputContext _postVolumeMutedChangedNotificationForUID:](self, v4);
}

- (void)_postVolumeMutedChangedNotificationForUID:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(a1, "concreteOutputDevices", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) effectiveOutputDeviceForUID:v3];
          if (v9)
          {
            id v10 = (void *)v9;
            id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v18[0] = @"MRAVOutputContextOutputDeviceUserInfoKey";
            v18[1] = @"MRAVOutputContextVolumeMutedUserInfoKey";
            v19[0] = v10;
            id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isVolumeMuted"));
            v19[1] = v12;
            int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
            [v11 postNotificationName:@"MRAVOutputContextVolumeMutedDidChangeNotification" object:a1 userInfo:v13];

            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_handleClusterMemberMutedDidChangeNotification:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 ID];
  -[MRAVConcreteOutputContext _postVolumeMutedChangedNotificationForUID:](self, v4);
}

unint64_t __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke(unint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 73))
  {
    unint64_t v1 = result;
    uint64_t result = [*(id *)(result + 40) count];
    if (result >= 2)
    {
      *(unsigned char *)(*(void *)(v1 + 32) + 73) = 1;
      *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

void __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
  uint64_t v7 = _MRLogForCategory(0);
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Created endpoint for disconnected devices: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_handlePredictedOutputDevicesDidChangeNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = _MRLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MRAVConcreteOutputContext *)self predictedOutputDeviceUIDs];
    int v7 = 138543618;
    int v8 = v5;
    __int16 v9 = 2114;
    id v10 = self;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] Predicted outputDeviceUIDs changed to: %{public}@ for context: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(MRAVConcreteOutputContext *)self predictedOutputDevice];
  -[MRAVConcreteOutputContext _notifyPredictedOutputDeviceDidChange:]((uint64_t)self, v6);
}

void __67__MRAVConcreteOutputContext__notifyPredictedOutputDeviceDidChange___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v5 = @"MRAVOutputContextOutputDeviceUserInfoKey";
    v6[0] = v2;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"kMRAVOutputContextPredictedOutputDeviceDidChangeNotification" object:*(void *)(a1 + 40) userInfo:v3];
}

- (void)_reloadOutputContext
{
  if (a1)
  {
    if (_reloadOutputContext___once != -1) {
      dispatch_once(&_reloadOutputContext___once, &__block_literal_global_128);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_2;
    block[3] = &unk_1E57D0518;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_reloadOutputContext___queue, block);
  }
}

void __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mediaremote.outputcontext.reloadOutputContext", v2);
  unint64_t v1 = (void *)_reloadOutputContext___queue;
  _reloadOutputContext___queue = (uint64_t)v0;
}

void __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() outputContextForLocalDevice];
  if (v2
    || ([(id)objc_opt_class() outputContextForLocalDevice],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      id v12 = v2;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[ConcreteOutputContext] %{public}@ Reloading with output context: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setAvOutputContext:v2];
  }
  else
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    id v6 = _reloadOutputContext___queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_3;
    block[3] = &unk_1E57D12D0;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_after(v5, v6, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __49__MRAVConcreteOutputContext__reloadOutputContext__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRAVConcreteOutputContext _reloadOutputContext]();
}

+ (id)_sharedOutputContextFromType:(uint64_t)a1
{
  self;
  switch(a2)
  {
    case 3:
      id v3 = +[MRAVConcreteOutputContext sharedSystemScreenContext];
      break;
    case 2:
      id v3 = +[MRAVConcreteOutputContext sharedSystemAudioContext];
      break;
    case 1:
      id v3 = +[MRAVConcreteOutputContext sharedAudioPresentationContext];
      break;
    default:
      id v3 = 0;
      break;
  }

  return v3;
}

id __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_3(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 object];
  id v3 = [v2 outputContextType];
  uint64_t v4 = getAVOutputContextTypeSharedSystemAudio[0]();
  v12[0] = v4;
  v13[0] = &unk_1EE66EEC8;
  dispatch_time_t v5 = getAVOutputContextTypeSharedSystemScreen[0]();
  v12[1] = v5;
  v13[1] = &unk_1EE66EEE0;
  id v6 = getAVOutputContextTypeSharedAudioPresentation[0]();
  v12[2] = v6;
  v13[2] = &unk_1EE66EEF8;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  id v8 = [v7 objectForKey:v3];
  int v9 = [v8 unsignedIntegerValue];

  if (v9)
  {
    uint64_t v10 = +[MRAVConcreteOutputContext _sharedOutputContextFromType:]((uint64_t)MRAVConcreteOutputContext, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_5;
  v7[3] = &unk_1E57D0DB8;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _scheduleOutputContextDeviceDidChangeNotification];
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_7;
  v7[3] = &unk_1E57D0DB8;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __65__MRAVConcreteOutputContext__initializeAVFNotificationForwarding__block_invoke_7(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _scheduleOutputContextDevicesDidChangeNotification];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_avOutputContext, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_outputDeviceSourceInfo, 0);
  objc_storeStrong((id *)&self->_predictedOutputDevice, 0);
  objc_storeStrong((id *)&self->_concreteOutputDevices, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __59__MRAVConcreteOutputContext_sharedAudioPresentationContext__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__MRAVConcreteOutputContext_sharedSystemAudioContext__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__MRAVConcreteOutputContext_sharedSystemScreenContext__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)iTunesContext
{
}

+ (void)createOutputContextWithUniqueIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_63_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, a2, a3, "[ConcreteOutputContext] Failed to find missing logical device components: %{public}@ -- found devices %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_63_cold_2(void *a1, id *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 componentsJoinedByString:@", "];
  id v6 = [*a2 allObjects];
  int v7 = [v6 componentsJoinedByString:@", "];
  int v8 = 138543618;
  id v9 = v5;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "[ConcreteOutputContext] Logical Devices: %{public}@. Existing devices: %{public}@.", (uint8_t *)&v8, 0x16u);
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_63_cold_3(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[ConcreteOutputContext] Failed to find any remaining logical device components to add.", v1, 2u);
}

void __57__MRAVConcreteOutputContext_attemptLogicalDeviceRecovery__block_invoke_69_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__MRAVConcreteOutputContext__handleOutputDevicesTimedOut___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, a2, a3, "[ConcreteOutputContext] Failed to create endpoint for disconnected devices (%{public}@): %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end