@interface MPAVEndpointRoute
+ (BOOL)supportsSecureCoding;
+ (void)getActiveEndpointRouteWithCompletion:(id)a3;
- (BOOL)_groupLeaderIsOfDeviceSubtype:(unsigned int)a3;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canFetchMediaDataFromSender;
- (BOOL)canModifyGroupMembership;
- (BOOL)canPlayEncryptedProgressiveDownloadAssets;
- (BOOL)isAirPlayingToDevice;
- (BOOL)isAppleTVRoute;
- (BOOL)isB520Route;
- (BOOL)isClusterRoute;
- (BOOL)isDeviceRoute;
- (BOOL)isDeviceSpeakerRoute;
- (BOOL)isHomePodRoute;
- (BOOL)isHomeTheaterRoute;
- (BOOL)isLowFidelityRoute;
- (BOOL)isLowLatencyRoute;
- (BOOL)isMacRoute;
- (BOOL)isPhoneRoute;
- (BOOL)isPickable;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRoutingToWirelessDevice;
- (BOOL)isSplitRoute;
- (BOOL)isSplitterCapable;
- (BOOL)isStereoPair;
- (BOOL)isTVRoute;
- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets;
- (BOOL)supportsGrouping;
- (BOOL)supportsRemoteControl;
- (MPAVEndpointRoute)initWithCoder:(id)a3;
- (MPAVEndpointRoute)initWithEndpointObject:(id)a3;
- (MPAVOutputDeviceRoute)predictedOutputDevice;
- (MPAVRouteConnection)connection;
- (MPMRAVEndpointWrapper)endpointWrapper;
- (MRAVEndpoint)endpointObject;
- (NSString)sortName;
- (id)clusterComposition;
- (id)description;
- (id)designatedGroupLeaderName;
- (id)designatedGroupLeaderRouteUID;
- (id)effectiveGroupLeader;
- (id)groupLeaderAirplayIdentifier;
- (id)productIdentifier;
- (id)routeName;
- (id)routeNames;
- (id)routeUID;
- (int64_t)clusterType;
- (int64_t)numberOfOutputDevices;
- (int64_t)originalRouteSubtype;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (unint64_t)_outputDevicesComposition;
- (void)_endpointDidChange:(id)a3;
- (void)_endpointOutputDevicesDidChange:(id)a3;
- (void)_endpointPredictedOutputDeviceDidChange:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)endpoint;
- (void)establishGroup;
- (void)resetPredictedOutputDevice;
- (void)setConnection:(id)a3;
- (void)setEndpointWrapper:(id)a3;
@end

@implementation MPAVEndpointRoute

void __36__MPAVEndpointRoute_endpointWrapper__block_invoke(uint64_t a1)
{
}

- (id)description
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)MPAVEndpointRoute;
  v3 = [(MPAVRoute *)&v8 description];
  v4 = [v2 stringWithString:v3];

  id v7 = v4;
  msv_dispatch_sync_on_queue();
  id v5 = v7;

  return v5;
}

- (BOOL)isDeviceRoute
{
  v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 isLocalEndpoint];

  return v3;
}

- (int64_t)routeType
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [(MPAVEndpointRoute *)self endpointObject];
  if ([v3 isLocalEndpoint]) {
    goto LABEL_4;
  }
  v4 = [v3 externalDevice];
  id v5 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  v6 = v5;
  if (v4)
  {
    char v7 = [v5 isRemoteControllable];

    if (v7)
    {
LABEL_4:
      int64_t v8 = 3;
      goto LABEL_16;
    }
  }
  else
  {
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = objc_msgSend(v3, "outputDevices", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    int64_t v8 = 3;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v9);
      }
      if ([*(id *)(*((void *)&v15 + 1) + 8 * v13) canRelayCommunicationChannel]) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    int64_t v8 = 0;
  }

LABEL_16:
  return v8;
}

- (id)routeName
{
  v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 localizedName];

  return v3;
}

- (id)routeUID
{
  v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 uniqueIdentifier];

  return v3;
}

- (MRAVEndpoint)endpointObject
{
  id v2 = [(MPAVEndpointRoute *)self endpointWrapper];
  char v3 = [v2 unwrappedValue];

  return (MRAVEndpoint *)v3;
}

- (MPMRAVEndpointWrapper)endpointWrapper
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = __Block_byref_object_copy__50691;
  int64_t v8 = __Block_byref_object_dispose__50692;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPMRAVEndpointWrapper *)v2;
}

- (int64_t)routeSubtype
{
  return 1;
}

- (BOOL)isAirPlayingToDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 outputDevices];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "deviceType", (void)v9) == 1)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (int64_t)numberOfOutputDevices
{
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 outputDevices];
  int64_t v4 = [v3 count];

  return v4;
}

- (BOOL)isAppleTVRoute
{
  BOOL v3 = [(MPAVEndpointRoute *)self _groupLeaderIsOfDeviceSubtype:13];
  return v3 | [(MPAVEndpointRoute *)self isHomeTheaterRoute];
}

- (BOOL)_groupLeaderIsOfDeviceSubtype:(unsigned int)a3
{
  int64_t v4 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = [v4 deviceSubtype] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isHomeTheaterRoute
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  BOOL v3 = [v2 clusterType] == 2;

  return v3;
}

- (id)effectiveGroupLeader
{
  id v2 = [(MPAVEndpointRoute *)self endpoint];
  BOOL v3 = [v2 groupLeader];
  if (![v3 supportsMultiplayer] || objc_msgSend(v2, "isLocalEndpoint"))
  {

LABEL_4:
    int64_t v4 = [v2 groupLeader];
    goto LABEL_5;
  }
  BOOL v6 = [v2 outputDeviceUIDs];
  char v7 = [v2 groupLeader];
  int64_t v8 = [v7 uid];
  int v9 = [v6 containsObject:v8];

  if (v9) {
    goto LABEL_4;
  }
  long long v10 = [v2 outputDevices];
  long long v11 = [v10 sortedArrayUsingSelector:&sel_uid];

  int64_t v4 = [v11 firstObject];

LABEL_5:

  return v4;
}

- (void)endpoint
{
  id v2 = [(MPAVEndpointRoute *)self endpointWrapper];
  BOOL v3 = (void *)[v2 unwrappedValue];

  return v3;
}

- (MPAVEndpointRoute)initWithEndpointObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPAVEndpointRoute;
  uint64_t v5 = [(MPAVEndpointRoute *)&v18 init];
  if (v5)
  {
    BOOL v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaplayer.MPAVEndpointRoute/accessQueue", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    int v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaplayer.MPAVEndpointRoute/calloutQueue", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    v5->super._picked = 0;
    avRouteDescription = v5->super._avRouteDescription;
    v5->super._avRouteDescription = 0;

    wirelessDisplayRoute = v5->super._wirelessDisplayRoute;
    v5->super._wirelessDisplayRoute = 0;

    v5->super._displayRouteType = 3;
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F76FB8] sharedLocalEndpoint];
    }
    uint64_t v14 = [[MPMRAVEndpointWrapper alloc] initWithMRAVEndpoint:v4];
    [(MPAVEndpointRoute *)v5 setEndpointWrapper:v14];

    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v5 selector:sel__endpointOutputDevicesDidChange_ name:*MEMORY[0x1E4F77120] object:0];

    long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v5 selector:sel__endpointPredictedOutputDeviceDidChange_ name:*MEMORY[0x1E4F77128] object:0];
  }
  return v5;
}

- (void)setEndpointWrapper:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MPAVEndpointRoute.m", 206, @"Invalid parameter not satisfying: %@", @"endpointWrapper" object file lineNumber description];
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke;
  block[3] = &unk_1E57F9F98;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(accessQueue, block);
}

void __32__MPAVEndpointRoute_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 208);
  if (v1)
  {
    BOOL v3 = *(void **)(a1 + 40);
    [NSString stringWithFormat:@" connection=%@", v1];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertString:atIndex:", v4, objc_msgSend(*(id *)(a1 + 40), "length") - 1);
  }
}

void __31__MPAVEndpointRoute_connection__block_invoke(uint64_t a1)
{
}

void __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 240);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), *(id *)(a1 + 40));
  BOOL v3 = [*(id *)(a1 + 32) endpointObject];
  uint64_t v4 = [v3 localizedName];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  id v7 = [*(id *)(a1 + 32) effectiveGroupLeader];
  int64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 name];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(void **)(v11 + 232);
    *(void *)(v11 + 232) = v10;
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(id *)(v13 + 8);
    int v9 = *(void **)(v13 + 232);
    *(void *)(v13 + 232) = v14;
  }

  if (v2)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    long long v16 = *(NSObject **)(v15 + 224);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    block[4] = v15;
    dispatch_async(v16, block);
  }
  id v17 = v2;
  objc_super v18 = [v17 unwrappedValue];
  v19 = [*(id *)(a1 + 40) unwrappedValue];
  uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
  v21 = [v18 personalOutputDevices];
  v22 = [v20 setWithArray:v21];
  v23 = (void *)MEMORY[0x1E4F1CAD0];
  v24 = [v19 personalOutputDevices];
  v25 = [v23 setWithArray:v24];
  char v26 = [v22 isEqualToSet:v25];

  if ((v26 & 1) == 0)
  {
    v27 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_opt_class();
      uint64_t v29 = *(void *)(a1 + 32);
      id v34 = v28;
      v30 = [v18 personalOutputDevices];
      v31 = [v19 personalOutputDevices];
      *(_DWORD *)buf = 138544130;
      v38 = v28;
      __int16 v39 = 2048;
      uint64_t v40 = v29;
      __int16 v41 = 2114;
      v42 = v30;
      __int16 v43 = 2114;
      v44 = v31;
      _os_log_impl(&dword_1952E8000, v27, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Personal devices changed from %{public}@, to: %{public}@", buf, 0x2Au);
    }
    uint64_t v32 = *(void *)(a1 + 32);
    v33 = *(NSObject **)(v32 + 224);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_50;
    v35[3] = &unk_1E57F9EA8;
    v35[4] = v32;
    dispatch_async(v33, v35);
  }
}

- (MPAVRouteConnection)connection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__50691;
  uint64_t v10 = __Block_byref_object_dispose__50692;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MPAVEndpointRoute_connection__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPAVRouteConnection *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointWrapper, 0);
  objc_storeStrong((id *)&self->_sortName, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (unint64_t)_outputDevicesComposition
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(MPAVEndpointRoute *)self endpointObject];
  uint64_t v5 = [v4 outputDevices];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "deviceSubtype", (void)v17);
        if (v14 == 12)
        {
          uint64_t v15 = [v13 logicalDeviceID];
          if ((v9 & 1) != 0 || ([v3 containsObject:v15] & 1) == 0)
          {
            if (v15) {
              [v3 addObject:v15];
            }
          }
          else
          {
            char v9 = 1;
          }
          v10 |= 4uLL;
        }
        else if (v14 == 13)
        {
          v10 |= 2uLL;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);

    if ((v9 & 1) != 0 && (v10 & 4) != 0) {
      v10 |= 8uLL;
    }
  }
  else
  {

    unint64_t v10 = 0;
  }

  return v10;
}

- (void)_endpointPredictedOutputDeviceDidChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v5 uniqueIdentifier];
  uint64_t v7 = [(MPAVEndpointRoute *)self endpointObject];
  uint64_t v8 = [v7 uniqueIdentifier];

  if (v6 == v8)
  {
    char v9 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v10 = objc_opt_class();
      id v11 = v10;
      long long v12 = [v4 object];
      uint64_t v13 = [v5 predictedOutputDevice];
      int v15 = 138544130;
      long long v16 = v10;
      __int16 v17 = 2048;
      long long v18 = self;
      __int16 v19 = 2114;
      long long v20 = v12;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> External device: %{public}@ predicted route to: %{public}@", (uint8_t *)&v15, 0x2Au);
    }
    int v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"MPAVRouteDidChangeNotification" object:self];
  }
}

- (void)_endpointOutputDevicesDidChange:(id)a3
{
  id v8 = [a3 object];
  id v4 = [v8 uniqueIdentifier];
  uint64_t v5 = [(MPAVEndpointRoute *)self endpointObject];
  id v6 = [v5 uniqueIdentifier];

  if (v4 == v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"MPAVRouteDidChangeNotification" object:self];
  }
}

- (void)_endpointDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F771B0]];

  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    unint64_t v10 = [v4 object];
    int v12 = 138544130;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    int v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    __int16 v18 = 2114;
    __int16 v19 = v6;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> External device: %{public}@ changed endpoint to: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
  id v11 = [[MPMRAVEndpointWrapper alloc] initWithMRAVEndpoint:v6];
  [(MPAVEndpointRoute *)self setEndpointWrapper:v11];
}

- (BOOL)isPickable
{
  return 1;
}

- (BOOL)isLowFidelityRoute
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  char v3 = [v2 producesLowFidelityAudio];

  return v3;
}

- (id)designatedGroupLeaderRouteUID
{
  char v3 = [(MPAVEndpointRoute *)self endpoint];
  if ([v3 isLocalEndpoint])
  {
    id v4 = [v3 uniqueIdentifier];
  }
  else
  {
    uint64_t v5 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
    id v4 = [v5 uid];
  }

  return v4;
}

- (int64_t)clusterType
{
  char v3 = objc_opt_class();
  id v4 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  int64_t v5 = objc_msgSend(v3, "clusterTypeForMRClusterType:", objc_msgSend(v4, "clusterType"));

  return v5;
}

- (id)clusterComposition
{
  char v3 = objc_opt_class();
  id v4 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  int64_t v5 = [v3 clusterCompositionForOutputDevice:v4];

  return v5;
}

- (BOOL)isClusterRoute
{
  return [(MPAVEndpointRoute *)self _groupLeaderIsOfDeviceSubtype:15];
}

- (BOOL)isSplitRoute
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 outputDevices];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "supportsBluetoothSharing", (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  if ((unint64_t)[v4 count] <= 1) {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isSplitterCapable
{
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 outputDevices];

  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    char v5 = [v4 supportsBluetoothSharing];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)supportsRemoteControl
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  char v3 = [v2 isRemoteControllable];

  return v3;
}

- (BOOL)supportsGrouping
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  char v3 = [v2 isGroupable];

  return v3;
}

- (int64_t)originalRouteSubtype
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "routeSubtypeForMRSubtype:mrType:", objc_msgSend(v2, "deviceSubtype"), objc_msgSend(v2, "deviceType"));

  return v3;
}

- (id)productIdentifier
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  int64_t v3 = [v2 modelID];

  return v3;
}

- (BOOL)isLowLatencyRoute
{
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  int64_t v3 = [v2 outputDevices];

  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    int v5 = [v4 deviceType];

    BOOL v6 = (v5 & 0xFFFFFFFE) == 4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isRoutingToWirelessDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  int64_t v3 = [v2 outputDevices];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (+[MPAVOutputDeviceRoute pickableRouteTypeForOutputDevice:](MPAVOutputDeviceRoute, "pickableRouteTypeForOutputDevice:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9) == 1)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isDeviceSpeakerRoute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  int64_t v3 = [v2 outputDevices];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "deviceType", (void)v9) == 4)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)canModifyGroupMembership
{
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 canModifyGroupMembership];

  return v3;
}

- (BOOL)isProxyGroupPlayer
{
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  char v3 = [v2 isProxyGroupPlayer];

  return v3;
}

- (BOOL)isPhoneRoute
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  BOOL v3 = [v2 hostDeviceClass] == 1;

  return v3;
}

- (BOOL)isStereoPair
{
  id v2 = self;
  if ([(MPAVEndpointRoute *)self isClusterRoute])
  {
    BOOL v3 = [(MPAVEndpointRoute *)v2 effectiveGroupLeader];
    LOBYTE(v2) = [v3 clusterType] == 1;
  }
  else
  {
    return ([(MPAVEndpointRoute *)v2 _outputDevicesComposition] >> 3) & 1;
  }
  return (char)v2;
}

- (BOOL)isB520Route
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  BOOL v3 = [v2 modelID];

  LOBYTE(v2) = [v3 containsString:@"AudioAccessory5"];
  return (char)v2;
}

- (BOOL)isHomePodRoute
{
  if ([(MPAVEndpointRoute *)self isClusterRoute])
  {
    return [(MPAVEndpointRoute *)self isStereoPair];
  }
  else
  {
    return [(MPAVEndpointRoute *)self _groupLeaderIsOfDeviceSubtype:12];
  }
}

- (BOOL)isMacRoute
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  BOOL v3 = [v2 deviceSubtype] == 18;

  return v3;
}

- (BOOL)isTVRoute
{
  if ([(MPAVEndpointRoute *)self _groupLeaderIsOfDeviceSubtype:11]
    || [(MPAVEndpointRoute *)self _groupLeaderIsOfDeviceSubtype:16])
  {
    return 1;
  }

  return [(MPAVEndpointRoute *)self _groupLeaderIsOfDeviceSubtype:17];
}

- (id)groupLeaderAirplayIdentifier
{
  if ([(MPAVEndpointRoute *)self isDeviceRoute])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 uid];
      BOOL v3 = (void *)[v6 copy];
    }
    else
    {
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  return 1;
}

- (BOOL)canFetchMediaDataFromSender
{
  return 1;
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  return 1;
}

- (BOOL)canAccessRemoteAssets
{
  return 1;
}

- (void)resetPredictedOutputDevice
{
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  [v2 resetPredictedOutputDevice];
}

- (MPAVOutputDeviceRoute)predictedOutputDevice
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  BOOL v3 = [v2 predictedOutputDevice];

  if (v3)
  {
    id v4 = [MPAVOutputDeviceRoute alloc];
    v8[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    uint64_t v6 = [(MPAVOutputDeviceRoute *)v4 initWithOutputDevices:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MPAVEndpointRoute_setConnection___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __35__MPAVEndpointRoute_setConnection___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 208) != *(void *)(a1 + 40))
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = *MEMORY[0x1E4F771A8];
    [v2 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x1E4F771A8] object:0];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v4, "addObserver:selector:name:object:", *(void *)(a1 + 32), sel__endpointDidChange_, v3, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "externalDevice"));

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 224);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__MPAVEndpointRoute_setConnection___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    block[4] = v5;
    dispatch_async(v6, block);
  }
}

void __35__MPAVEndpointRoute_setConnection___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPAVRouteDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPAVRouteDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __40__MPAVEndpointRoute_setEndpointWrapper___block_invoke_50(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPAVRouteDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)establishGroup
{
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F770C0]) initWithName:@"MPAVEndpointRoute.establishGroup" requestID:0 reason:@"API Call"];
  id v3 = objc_alloc(MEMORY[0x1E4F77050]);
  id v4 = [(MPAVEndpointRoute *)self endpointObject];
  uint64_t v5 = [v4 outputDevices];
  id v6 = (void *)[v3 initWithRequestDetails:v8 type:1 outputDevices:v5];

  uint64_t v7 = [(MPAVEndpointRoute *)self endpointObject];
  [v7 modifyTopologyWithRequest:v6 withReplyQueue:MEMORY[0x1E4F14428] completion:&__block_literal_global_50716];
}

- (id)designatedGroupLeaderName
{
  id v2 = [(MPAVEndpointRoute *)self effectiveGroupLeader];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 name];
    uint64_t v5 = (__CFString *)[v4 copy];
  }
  else
  {
    uint64_t v5 = &stru_1EE680640;
  }

  return v5;
}

- (id)routeNames
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [(MPAVEndpointRoute *)self endpointObject];
  id v3 = [v2 outputDevices];

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "logicalDeviceID", (void)v17);
        long long v13 = [v11 name];
        if ([v13 length])
        {
          if ([v12 length])
          {
            if ([v5 containsObject:v12]) {
              goto LABEL_12;
            }
            [v4 addObject:v13];
            uint64_t v14 = v5;
            int v15 = v12;
          }
          else
          {
            uint64_t v14 = v4;
            int v15 = v13;
          }
          [v14 addObject:v15];
        }
LABEL_12:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v4;
}

- (NSString)sortName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__50691;
  long long v10 = __Block_byref_object_dispose__50692;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__MPAVEndpointRoute_sortName__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __29__MPAVEndpointRoute_sortName__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F77120] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MPAVEndpointRoute;
  [(MPAVEndpointRoute *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(MPAVEndpointRoute *)self endpointWrapper];
  [v4 unwrappedValue];
  uint64_t IsLocalEndpoint = MRAVEndpointIsLocalEndpoint();

  [v7 encodeBool:IsLocalEndpoint forKey:@"localEndpoint"];
  if ((IsLocalEndpoint & 1) == 0)
  {
    id v6 = [(MPAVEndpointRoute *)self endpointWrapper];
    objc_msgSend(v7, "encodeObject:forKey:", objc_msgSend(v6, "unwrappedValue"), @"endpoint");
  }
}

- (MPAVEndpointRoute)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"localEndpoint"]) {
    uint64_t LocalEndpoint = MRAVEndpointGetLocalEndpoint();
  }
  else {
    uint64_t LocalEndpoint = [v4 decodeObjectOfClass:MRAVEndpointGetClass() forKey:@"endpoint"];
  }
  id v6 = (MPAVEndpointRoute *)LocalEndpoint;
  if (LocalEndpoint)
  {
    self = [(MPAVEndpointRoute *)self initWithEndpoint:LocalEndpoint];
    uint64_t ExternalDevice = MRAVEndpointGetExternalDevice();
    if (ExternalDevice)
    {
      uint64_t v8 = [[MPAVRouteConnection alloc] initWithExternalDevice:ExternalDevice];
      [(MPAVEndpointRoute *)self setConnection:v8];
    }
    id v6 = self;
  }

  return v6;
}

+ (void)getActiveEndpointRouteWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  MRAVEndpointResolveActiveSystemEndpoint();
}

void __58__MPAVEndpointRoute_getActiveEndpointRouteWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  id v4 = [[MPAVEndpointRoute alloc] initWithEndpoint:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end