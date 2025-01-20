@interface MPAVRoutingDataSource
- (BOOL)devicePresenceDetected;
- (BOOL)didReceiveDiscoveryResults;
- (BOOL)hasActiveAudioCategory;
- (BOOL)routeIsLeaderOfEndpoint:(id)a3;
- (BOOL)supportsMultipleSelection;
- (MPAVRoutingDataSource)init;
- (NSString)activeAudioCategory;
- (id)getRoutesForCategory:(id)a3;
- (int64_t)discoveryMode;
- (int64_t)filterMode;
- (unsigned)targetSessionID;
- (void)_activeAudioRouteDidChangeNotification:(id)a3;
- (void)_externalScreenTypeDidChangeNotification:(id)a3;
- (void)_reloadActiveAudioCategoryWithCompletion:(id)a3;
- (void)_superclassRegisterNotifications;
- (void)_superclassUnregisterNotifications;
- (void)_volumeControlAvailabilityDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)getExternalScreenTypeWithCompletion:(id)a3;
- (void)getPickedRouteHasVolumeControlWithCompletion:(id)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setFilterMode:(int64_t)a3;
- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5;
- (void)setTargetSessionID:(unsigned int)a3;
- (void)unpickAirPlayAVRoutesWithCompletion:(id)a3;
@end

@implementation MPAVRoutingDataSource

- (BOOL)hasActiveAudioCategory
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MPAVRoutingDataSource_hasActiveAudioCategory__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (MPAVRoutingDataSource)init
{
  v12.receiver = self;
  v12.super_class = (Class)MPAVRoutingDataSource;
  v2 = [(MPAVRoutingDataSource *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingDataSource/serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingDataSource/workerQueue", 0);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingDataSource/callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    [(MPAVRoutingDataSource *)v2 _superclassRegisterNotifications];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__MPAVRoutingDataSource_init__block_invoke;
    v10[3] = &unk_1E57F9B98;
    v11 = v2;
    [(MPAVRoutingDataSource *)v11 _reloadActiveAudioCategoryWithCompletion:v10];
  }
  return v2;
}

- (void)_superclassRegisterNotifications
{
  v7[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__volumeControlAvailabilityDidChangeNotification_ name:*MEMORY[0x1E4F77810] object:0];
  [v3 addObserver:self selector:sel__externalScreenTypeDidChangeNotification_ name:*MEMORY[0x1E4F77388] object:0];
  v4 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  dispatch_queue_t v5 = (void *)MEMORY[0x1E4F74A88];
  v7[0] = *MEMORY[0x1E4F74A88];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 setAttribute:v6 forKey:*MEMORY[0x1E4F74EA8] error:0];

  [v3 addObserver:self selector:sel__activeAudioRouteDidChangeNotification_ name:*v5 object:0];
  MRMediaRemoteSetWantsVolumeControlNotifications();
  MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();
}

- (void)_reloadActiveAudioCategoryWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke;
  v7[3] = &unk_1E57F9140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

void __44__MPAVRoutingDataSource_activeAudioCategory__block_invoke(uint64_t a1)
{
}

uint64_t __29__MPAVRoutingDataSource_init__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  return result;
}

uint64_t __47__MPAVRoutingDataSource_hasActiveAudioCategory__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

void __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

void __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) activeAudioCategory];
  uint64_t v3 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  id v4 = [v3 attributeForKey:*MEMORY[0x1E4F74B78]];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 8);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __66__MPAVRoutingDataSource__reloadActiveAudioCategoryWithCompletion___block_invoke_2;
  v14 = &unk_1E57F9F98;
  uint64_t v15 = v5;
  id v7 = v4;
  id v16 = v7;
  dispatch_sync(v6, &v11);
  id v8 = v7;
  os_log_t v9 = v2;
  if (v2 == v8)
  {
LABEL_5:

    goto LABEL_6;
  }
  char v10 = -[NSObject isEqual:](v2, "isEqual:", v8, v11, v12, v13, v14, v15);

  if ((v10 & 1) == 0)
  {
    os_log_t v9 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v2;
      __int16 v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Active audio category changed from %{public}@ to %{public}@", buf, 0x16u);
    }
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)activeAudioCategory
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__51524;
  id v8 = __Block_byref_object_dispose__51525;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __29__MPAVRoutingDataSource_init__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = v1[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MPAVRoutingDataSource_init__block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  uint64_t v4 = v1;
  dispatch_sync(v2, block);
}

- (int64_t)filterMode
{
  return self->_filterMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAudioCategory, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (BOOL)didReceiveDiscoveryResults
{
  return self->_didReceiveDiscoveryResults;
}

- (void)setTargetSessionID:(unsigned int)a3
{
  self->_targetSessionID = a3;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (void)setFilterMode:(int64_t)a3
{
  self->_filterMode = a3;
}

- (BOOL)devicePresenceDetected
{
  return self->_devicePresenceDetected;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  self->_discoveryMode = a3;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (void)_superclassUnregisterNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77810] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77388] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74A88] object:0];
  MRMediaRemoteSetWantsVolumeControlNotifications();
  MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();
}

- (void)_activeAudioRouteDidChangeNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Received active audio route did change notification: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke;
  v7[3] = &unk_1E57F8F08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(MPAVRoutingDataSource *)self _reloadActiveAudioCategoryWithCompletion:v7];
}

void __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke_2;
    v5[3] = &unk_1E57F9F98;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = v3;
    uint64_t v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __64__MPAVRoutingDataSource__activeAudioRouteDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userInfo];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPAVRoutingDataSourceActiveAudioRouteDidChangeNotification" object:*(void *)(a1 + 40) userInfo:v3];
}

- (void)_externalScreenTypeDidChangeNotification:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F77390]];
  unsigned int v6 = [v5 unsignedIntValue];

  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2 * (v6 == 2);
  }
  v14 = @"ExternalScreenType";
  id v8 = [NSNumber numberWithInteger:v7];
  v15[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  char v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v11 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Received external screen type did change notification with screen type = %ld", (uint8_t *)&v12, 0xCu);
  }

  [v10 postNotificationName:@"MPAVRoutingDataSourceExternalScreenTypeDidChangeNotification" object:self userInfo:v9];
}

- (void)_volumeControlAvailabilityDidChangeNotification:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  [v5 objectForKey:*MEMORY[0x1E4F77878]];

  MRNowPlayingPlayerPathGetOrigin();
  if (MROriginIsLocalOrigin())
  {
    unsigned int v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F77818]];

    char v10 = @"VolumeControlAvailability";
    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"MPAVRoutingDataSourceVolumeControlAvailabilityDidChangeNotification" object:self userInfo:v8];
  }
}

- (BOOL)supportsMultipleSelection
{
  return 0;
}

- (BOOL)routeIsLeaderOfEndpoint:(id)a3
{
  return 0;
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  uint64_t v13 = NSString;
  v14 = NSStringFromSelector(a2);
  uint64_t v15 = [v13 stringWithFormat:@"%@ is abstract", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (id)getRoutesForCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is abstract", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)unpickAirPlayAVRoutesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[BaseRoutingDataSource] Unpicking AirPlay AV routes...", buf, 2u);
  }

  uint64_t v6 = v3;
  id v5 = v3;
  MRMediaRemoteUnpickAirPlayAVRoutes();
}

uint64_t __61__MPAVRoutingDataSource_unpickAirPlayAVRoutesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  id v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 138543362;
    uint64_t v12 = a2;
    uint64_t v6 = "[BaseRoutingDataSource] Failed to unpick AirPlay AV routes: %{public}@";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v11) = 0;
    uint64_t v6 = "[BaseRoutingDataSource] Successfully unpicked AirPlay AV routes";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
  }
  _os_log_impl(&dword_1952E8000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)getPickedRouteHasVolumeControlWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    qos_class_t v5 = qos_class_self();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__MPAVRoutingDataSource_getPickedRouteHasVolumeControlWithCompletion___block_invoke;
    v8[3] = &unk_1E57F9140;
    v8[4] = self;
    id v9 = v4;
    dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v5, 0, v8);
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    dispatch_async(v7, v6);
  }
}

void __70__MPAVRoutingDataSource_getPickedRouteHasVolumeControlWithCompletion___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  MRMediaRemoteGetPickedRouteHasVolumeControl();
}

uint64_t __70__MPAVRoutingDataSource_getPickedRouteHasVolumeControlWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (void)getExternalScreenTypeWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    MRMediaRemoteGetExternalScreenType();
  }
}

uint64_t __61__MPAVRoutingDataSource_getExternalScreenTypeWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a2 == 2);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)dealloc
{
  [(MPAVRoutingDataSource *)self _superclassUnregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingDataSource;
  [(MPAVRoutingDataSource *)&v3 dealloc];
}

@end