@interface MPCAssistantEndpointContext
- (BOOL)shouldSearchForLogicalDevices;
- (MPCAssistantEndpointContext)init;
- (void)_discoverLocalEndpointFromClusterUsingDeviceInfo:(id)a3 completion:(id)a4;
- (void)_discoverLocalEndpointFromDeviceInfo:(id)a3 completion:(id)a4;
- (void)_discoverLocalEndpointFromHomeTheaterUsingDeviceInfo:(id)a3 completion:(id)a4;
- (void)_discoverLocalEndpointFromMultiplayerUsingDeviceInfo:(id)a3 completion:(id)a4;
- (void)_modifyOutputDevices:(id)a3 onEndpoint:(id)a4 completion:(id)a5;
- (void)_updateDiscoverableDeviceList:(id)a3 deviceInfo:(id)a4 completion:(id)a5;
- (void)modifySystemMusicContextForDestination:(id)a3 completion:(id)a4;
- (void)modifySystemMusicContextForEndpointDestination:(id)a3 completion:(id)a4;
- (void)modifySystemMusicContextForEndpointDestination:(id)a3 discoveryHandler:(id)a4 completion:(id)a5;
@end

@implementation MPCAssistantEndpointContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_discoveryEndpoint, 0);
  objc_storeStrong((id *)&self->_discoveryAudio, 0);

  objc_storeStrong((id *)&self->_discoveryLogical, 0);
}

- (BOOL)shouldSearchForLogicalDevices
{
  return _os_feature_enabled_impl() ^ 1;
}

- (void)_modifyOutputDevices:(id)a3 onEndpoint:(id)a4 completion:(id)a5
{
  id v8 = a5;
  callbackQueue = self->_callbackQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__MPCAssistantEndpointContext__modifyOutputDevices_onEndpoint_completion___block_invoke;
  v11[3] = &unk_2643C5830;
  id v12 = v8;
  id v10 = v8;
  [a4 setOutputDevices:a3 initiator:@"MPCAssistantEndpointContext" withReplyQueue:callbackQueue completion:v11];
}

void __74__MPCAssistantEndpointContext__modifyOutputDevices_onEndpoint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3 && (MRMediaRemoteErrorIsInformational() & 1) == 0)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "Failed to set output devices on primary endpoint: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    v6 = MPCAssistantCreateError(4);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_discoverLocalEndpointFromMultiplayerUsingDeviceInfo:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  discoveryEndpoint = self->_discoveryEndpoint;
  id v8 = [a3 deviceUID];
  v13[0] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __95__MPCAssistantEndpointContext__discoverLocalEndpointFromMultiplayerUsingDeviceInfo_completion___block_invoke;
  v11[3] = &unk_2643C30B0;
  id v12 = v6;
  id v10 = v6;
  [(MPCAssistantDiscovery *)discoveryEndpoint discoverRemoteControlEndpointsMatchingUIDs:v9 completion:v11];
}

void __95__MPCAssistantEndpointContext__discoverLocalEndpointFromMultiplayerUsingDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)_discoverLocalEndpointFromClusterUsingDeviceInfo:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F54880];
  id v9 = a3;
  id v10 = [v8 sharedController];
  if ([v10 clusterType] != 1)
  {
    v11 = [MEMORY[0x263F54880] sharedController];
    int v12 = [v11 clusterType];

    if (v12 == 3) {
      goto LABEL_5;
    }
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MPCAssistantEndpointContext.m", 243, @"Invalid parameter not satisfying: %@", @"MRAVClusterController.sharedController.clusterType == MRAVOutputDeviceClusterTypeStereoPair || MRAVClusterController.sharedController.clusterType == MRAVOutputDeviceClusterTypeGenericAudio" object file lineNumber description];
  }

LABEL_5:
  v13 = [v9 deviceUID];
  int v14 = [v9 isAirPlayActive];

  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "Searching for endpoint, pilot %{public}@", buf, 0xCu);
    }

    discoveryEndpoint = self->_discoveryEndpoint;
    v23 = v13;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91__MPCAssistantEndpointContext__discoverLocalEndpointFromClusterUsingDeviceInfo_completion___block_invoke;
    v20[3] = &unk_2643C3088;
    id v21 = v13;
    id v22 = v7;
    [(MPCAssistantDiscovery *)discoveryEndpoint discoverRemoteControlEndpointsMatchingUIDs:v18 completion:v20];
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "Not being airplayed to", buf, 2u);
    }

    uint64_t LocalEndpoint = MRAVEndpointGetLocalEndpoint();
    (*((void (**)(id, uint64_t))v7 + 2))(v7, LocalEndpoint);
  }
}

void __91__MPCAssistantEndpointContext__discoverLocalEndpointFromClusterUsingDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = [a2 firstObject];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v42 = v6;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "Searching endpoint for leader: %{public}@", buf, 0xCu);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = [v3 outputDevices];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v36;
      uint64_t v29 = *(void *)v36;
      v30 = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v13 = objc_msgSend(v3, "designatedGroupLeader", v29);
          int v14 = [v12 uid];
          int v15 = [v13 containsUID:v14];

          if (v15)
          {
            BOOL v16 = [v12 clusterComposition];
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v32;
              while (2)
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v32 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  id v22 = [*(id *)(*((void *)&v31 + 1) + 8 * j) uid];
                  int v23 = [v22 isEqualToString:*(void *)(a1 + 32)];

                  if (v23)
                  {
                    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

                    goto LABEL_28;
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            uint64_t v10 = v29;
            id v7 = v30;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v9);
    }

    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v3;
      v24 = "cluster is not group leader. Endpoint: %{public}@";
      v25 = v4;
      uint32_t v26 = 12;
LABEL_26:
      _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v24 = "No discoverable pair";
    v25 = v4;
    uint32_t v26 = 2;
    goto LABEL_26;
  }

  uint64_t v27 = *(void *)(a1 + 40);
  uint64_t LocalEndpoint = MRAVEndpointGetLocalEndpoint();
  (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v27, LocalEndpoint);
LABEL_28:
}

- (void)_discoverLocalEndpointFromHomeTheaterUsingDeviceInfo:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263F54880] sharedController];
  int v10 = [v9 clusterType];

  if (v10 != 2)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPCAssistantEndpointContext.m", 194, @"Invalid parameter not satisfying: %@", @"MRAVClusterController.sharedController.clusterType == MRAVOutputDeviceClusterTypeHomeTheater" object file lineNumber description];
  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v7 deviceUID];
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "Local endpoint: %{public}@", buf, 0xCu);
  }
  discoveryEndpoint = self->_discoveryEndpoint;
  int v14 = [v7 deviceUID];
  id v22 = v14;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke;
  v19[3] = &unk_2643C3088;
  id v20 = v7;
  id v21 = v8;
  id v16 = v8;
  id v17 = v7;
  [(MPCAssistantDiscovery *)discoveryEndpoint discoverRemoteControlEndpointsMatchingUIDs:v15 completion:v19];
}

void __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
    BOOL v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = (uint64_t)v4;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "Discovered primary endpoint: %{public}@", buf, 0xCu);
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke_64;
    v24[3] = &unk_2643C3060;
    id v25 = *(id *)(a1 + 32);
    id v6 = [v4 outputDevicesMatchingPredicate:v24];
    if ([v6 count])
    {
      id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = (uint64_t)v4;
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "Breakaway from endpoint: %{public}@", buf, 0xCu);
      }

      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t LocalEndpoint = MRAVEndpointGetLocalEndpoint();
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, LocalEndpoint);
      goto LABEL_24;
    }
    id v16 = [v4 designatedGroupLeader];
    int v17 = [v16 groupContainsGroupLeader];

    if (v17)
    {
      os_log_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
LABEL_24:

        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = (uint64_t)v4;
      uint64_t v19 = "Discovered primary endpoint: %{public}@";
    }
    else
    {
      id v20 = [MEMORY[0x263F54880] sharedController];
      int v21 = [v20 needsCommandRedirection];

      if (!v21)
      {
        uint64_t v22 = MRAVEndpointGetLocalEndpoint();

        int v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v27 = v22;
          _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "Takeover legacy endpoint: %{public}@", buf, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        v4 = (void *)v22;
        goto LABEL_24;
      }
      os_log_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = (uint64_t)v4;
      uint64_t v19 = "Takeover discovered endpoint: %{public}@";
    }
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
    goto LABEL_23;
  }
  int v10 = [MEMORY[0x263F54880] sharedController];
  int v11 = [v10 needsCommandRedirection];

  int v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_ERROR, "No discovered endpoint, failing because device requires command redirection", buf, 2u);
    }

    int v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_ERROR, "No discovered endpoint, use local", buf, 2u);
    }

    uint64_t v15 = *(void *)(a1 + 40);
    MRAVEndpointGetLocalEndpoint();
    int v14 = *(void (**)(void))(v15 + 16);
  }
  v14();
LABEL_25:
}

uint64_t __95__MPCAssistantEndpointContext__discoverLocalEndpointFromHomeTheaterUsingDeviceInfo_completion___block_invoke_64(uint64_t a1, void *a2)
{
  id v3 = [a2 uid];
  v4 = [*(id *)(a1 + 32) deviceUID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_discoverLocalEndpointFromDeviceInfo:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  int v10 = [v9 UUIDString];

  int v11 = (__CFString *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@<%@>", @"discoverLocalEndpointFromDeviceInfo", v10];
  int v12 = [v6 deviceUID];

  if (v12)
  {
    BOOL v13 = [v6 deviceUID];
    [(__CFString *)v11 appendFormat:@" for %@", v13];
  }
  int v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v37 = v11;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__MPCAssistantEndpointContext__discoverLocalEndpointFromDeviceInfo_completion___block_invoke;
  aBlock[3] = &unk_2643C3038;
  id v15 = v6;
  id v32 = v15;
  id v16 = v10;
  id v33 = v16;
  id v17 = v8;
  id v34 = v17;
  id v18 = v7;
  id v35 = v18;
  uint64_t v19 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v20 = [MEMORY[0x263F54880] sharedController];
  int v21 = [v20 clusterType];

  uint64_t v22 = [v15 deviceUID];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    switch(v21)
    {
      case 0:
        v24 = [MEMORY[0x263F54948] currentSettings];
        int v25 = [v24 isMultiplayerHost];

        if (!v25) {
          goto LABEL_14;
        }
        uint32_t v26 = _MRLogForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          long long v37 = @"discoverLocalEndpointFromDeviceInfo";
          __int16 v38 = 2114;
          id v39 = v16;
          __int16 v40 = 2112;
          v41 = @"Multiplayer";
          _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        [(MPCAssistantEndpointContext *)self _discoverLocalEndpointFromMultiplayerUsingDeviceInfo:v15 completion:v19];
        break;
      case 1:
        uint64_t v29 = _MRLogForCategory();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 138543874;
        long long v37 = @"discoverLocalEndpointFromDeviceInfo";
        __int16 v38 = 2114;
        id v39 = v16;
        __int16 v40 = 2112;
        v41 = @"Stereo Pair";
        goto LABEL_22;
      case 2:
        v30 = _MRLogForCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          long long v37 = @"discoverLocalEndpointFromDeviceInfo";
          __int16 v38 = 2114;
          id v39 = v16;
          __int16 v40 = 2112;
          v41 = @"Home Theater";
          _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        [(MPCAssistantEndpointContext *)self _discoverLocalEndpointFromHomeTheaterUsingDeviceInfo:v15 completion:v19];
        break;
      case 3:
        uint64_t v29 = _MRLogForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          long long v37 = @"discoverLocalEndpointFromDeviceInfo";
          __int16 v38 = 2114;
          id v39 = v16;
          __int16 v40 = 2112;
          v41 = @"Generic Audio Group";
LABEL_22:
          _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }
LABEL_23:

        [(MPCAssistantEndpointContext *)self _discoverLocalEndpointFromClusterUsingDeviceInfo:v15 completion:v19];
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v27 = _MRLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      long long v37 = @"discoverLocalEndpointFromDeviceInfo";
      __int16 v38 = 2114;
      id v39 = v16;
      __int16 v40 = 2112;
      v41 = @"Non groupable";
      _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

LABEL_14:
    uint64_t v28 = [MEMORY[0x263F54890] sharedLocalEndpoint];
    v19[2](v19, v28);
  }
}

void __79__MPCAssistantEndpointContext__discoverLocalEndpointFromDeviceInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) deviceUID];

  uint64_t v5 = _MRLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = [*(id *)(a1 + 32) deviceUID];
        uint64_t v9 = [MEMORY[0x263EFF910] date];
        [v9 timeIntervalSinceDate:*(void *)(a1 + 48)];
        int v29 = 138544386;
        v30 = @"discoverLocalEndpointFromDeviceInfo";
        __int16 v31 = 2114;
        uint64_t v32 = v7;
        __int16 v33 = 2112;
        id v34 = v3;
        __int16 v35 = 2114;
        long long v36 = v8;
        __int16 v37 = 2048;
        uint64_t v38 = v10;
        int v11 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        int v12 = v5;
        uint32_t v13 = 52;
LABEL_8:
        _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v29, v13);

LABEL_14:
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    [v8 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v29 = 138544130;
    v30 = @"discoverLocalEndpointFromDeviceInfo";
    __int16 v31 = 2114;
    uint64_t v32 = v16;
    __int16 v33 = 2112;
    id v34 = v3;
    __int16 v35 = 2048;
    long long v36 = v17;
    id v18 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    uint64_t v19 = v5;
    uint32_t v20 = 42;
LABEL_13:
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v29, v20);
    goto LABEL_14;
  }
  if (!v4)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    [v8 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v29 = 138543874;
    v30 = @"discoverLocalEndpointFromDeviceInfo";
    __int16 v31 = 2114;
    uint64_t v32 = v21;
    __int16 v33 = 2048;
    id v34 = v22;
    id v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    uint64_t v19 = v5;
    uint32_t v20 = 32;
    goto LABEL_13;
  }
  if (v6)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) deviceUID];
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 48)];
    int v29 = 138544130;
    v30 = @"discoverLocalEndpointFromDeviceInfo";
    __int16 v31 = 2114;
    uint64_t v32 = v14;
    __int16 v33 = 2114;
    id v34 = v8;
    __int16 v35 = 2048;
    long long v36 = v15;
    int v11 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    int v12 = v5;
    uint32_t v13 = 42;
    goto LABEL_8;
  }
LABEL_15:

  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v3, v23, v24, v25, v26, v27, v28);
}

- (void)_updateDiscoverableDeviceList:(id)a3 deviceInfo:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  int v11 = [v9 deviceUID];
  if (![v8 containsObject:v11]) {
    goto LABEL_8;
  }
  int v12 = [v9 tightSyncUID];
  if (![v12 length])
  {

LABEL_8:
    goto LABEL_9;
  }
  BOOL v13 = [(MPCAssistantEndpointContext *)self shouldSearchForLogicalDevices];

  if (!v13)
  {
LABEL_9:
    v10[2](v10, v8);
    goto LABEL_10;
  }
  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v9 tightSyncUID];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v15;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "Discover logical devices: %{public}@", buf, 0xCu);
  }
  discoveryLogical = self->_discoveryLogical;
  id v17 = [v9 tightSyncUID];
  uint64_t v23 = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__MPCAssistantEndpointContext__updateDiscoverableDeviceList_deviceInfo_completion___block_invoke;
  v19[3] = &unk_2643C2F48;
  id v20 = v8;
  uint64_t v21 = self;
  uint64_t v22 = v10;
  [(MPCAssistantDiscovery *)discoveryLogical discoverAirplayDevicesMatchingLogicalDeviceIDs:v18 expectedCount:1 completion:v19];

LABEL_10:
}

void __83__MPCAssistantEndpointContext__updateDiscoverableDeviceList_deviceInfo_completion___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v4 = a1[4];
  id v5 = a2;
  id v10 = [v3 setWithArray:v4];
  BOOL v6 = NSStringFromSelector("uid");
  uint64_t v7 = [v5 valueForKeyPath:v6];

  [v10 addObjectsFromArray:v7];
  [*(id *)(a1[5] + 16) stopDiscovery];
  uint64_t v8 = a1[6];
  id v9 = [v10 allObjects];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (void)modifySystemMusicContextForEndpointDestination:(id)a3 discoveryHandler:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [MEMORY[0x263F548C8] localDeviceInfo];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke;
  aBlock[3] = &unk_2643C2FE8;
  void aBlock[4] = self;
  id v12 = v11;
  id v35 = v12;
  id v13 = v10;
  id v36 = v13;
  uint64_t v14 = v9;
  id v37 = v14;
  id v15 = _Block_copy(aBlock);
  uint64_t v16 = [v8 outputGroupID];

  if (v16)
  {
    id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v8 outputGroupID];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v18;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "Discover devices of group: %{public}@", buf, 0xCu);
    }
    discoveryAudio = self->_discoveryAudio;
    id v20 = [v8 outputGroupID];
    [(MPCAssistantDiscovery *)discoveryAudio discoverAirplayDevicesMatchingGroupID:v20 completion:v15];
  }
  else
  {
    uint64_t v21 = [v8 outputDeviceUIDs];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      uint64_t v23 = [v8 outputDeviceUIDs];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_15;
      v30[3] = &unk_2643C2F48;
      id v31 = v8;
      uint64_t v32 = self;
      id v33 = v15;
      [(MPCAssistantEndpointContext *)self _updateDiscoverableDeviceList:v23 deviceInfo:v12 completion:v30];

      id v20 = v31;
    }
    else
    {
      uint64_t v24 = MRAVEndpointGetLocalEndpoint();
      uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v39 = self;
        _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Sending default local endpoint to caller", buf, 0xCu);
      }

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_16;
      v27[3] = &unk_2643C3010;
      id v28 = v24;
      id v29 = v13;
      uint64_t v26 = (void (*)(void *, id, void, void *))v14[2];
      id v20 = v24;
      v26(v14, v20, 0, v27);
    }
  }
}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = objc_msgSend(v3, "msv_map:", &__block_literal_global_20473);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Resolved devices: %@", buf, 0x16u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_12;
  v12[3] = &unk_2643C2FC0;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = v9;
  v12[4] = v10;
  id v15 = *(id *)(a1 + 56);
  id v13 = v3;
  id v11 = v3;
  [v7 _discoverLocalEndpointFromDeviceInfo:v8 completion:v12];
}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) outputDeviceUIDs];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "Discover devices: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) discoverAirplayDevicesMatchingUIDs:v3 completion:*(void *)(a1 + 48)];
}

uint64_t __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v5;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Sending discovered local endpoint to caller", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_13;
    v9[3] = &unk_2643C2F98;
    uint64_t v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v11 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, id, id, void *))(v6 + 16))(v6, v3, v10, v9);
  }
  else
  {
    uint64_t v8 = MPCAssistantCreateError(2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v5;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Routing to devices", buf, 0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_14;
  v10[3] = &unk_2643C59E0;
  v10[4] = v6;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  [v6 _modifyOutputDevices:v7 onEndpoint:v9 completion:v10];
}

void __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Routing completed with error %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __106__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_discoveryHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 name];
  uint64_t v5 = [v3 uid];

  int v6 = [v2 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (void)modifySystemMusicContextForEndpointDestination:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F54900] localOrigin];
  uint64_t v10 = v6;
  id v8 = v5;
  id v9 = v6;
  MRMediaRemoteGetDeviceInfo();
}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2;
  aBlock[3] = &unk_2643C2F20;
  void aBlock[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v29 = v7;
  id v31 = *(id *)(a1 + 48);
  id v8 = v6;
  id v30 = v8;
  id v9 = _Block_copy(aBlock);
  uint64_t v10 = [*(id *)(a1 + 40) outputGroupID];

  if (v10)
  {
    id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 40) outputGroupID];
      *(_DWORD *)buf = 138543362;
      id v33 = v12;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "Discover devices of group: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v15 = [v13 outputGroupID];
    [v14 discoverAirplayDevicesMatchingGroupID:v15 completion:v9];
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 40) outputDeviceUIDs];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      __int16 v18 = *(void **)(a1 + 32);
      uint64_t v19 = [*(id *)(a1 + 40) outputDeviceUIDs];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_6;
      v24[3] = &unk_2643C2F48;
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 32);
      id v25 = v20;
      uint64_t v26 = v21;
      id v27 = v9;
      [v18 _updateDiscoverableDeviceList:v19 deviceInfo:v7 completion:v24];
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t LocalEndpoint = MRAVEndpointGetLocalEndpoint();
      (*(void (**)(uint64_t, uint64_t, void))(v22 + 16))(v22, LocalEndpoint, 0);
    }
  }
}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_3;
  v9[3] = &unk_2643C3038;
  id v13 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v3;
  id v8 = v3;
  [v4 _discoverLocalEndpointFromDeviceInfo:v5 completion:v9];
}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) outputDeviceUIDs];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "Discover devices: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) discoverAirplayDevicesMatchingUIDs:v3 completion:*(void *)(a1 + 48)];
}

void __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    int v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "msv_description");
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v7;
        _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "Modify context: slow error=%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "Modify context: slow", buf, 2u);
    }

    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2;
    v11[3] = &unk_2643C6110;
    id v13 = *(id *)(a1 + 56);
    id v12 = v3;
    [v9 _modifyOutputDevices:v10 onEndpoint:v12 completion:v11];
  }
  else
  {
    uint64_t v8 = MPCAssistantCreateError(2);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __89__MPCAssistantEndpointContext_modifySystemMusicContextForEndpointDestination_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)modifySystemMusicContextForDestination:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__MPCAssistantEndpointContext_modifySystemMusicContextForDestination_completion___block_invoke;
  v8[3] = &unk_2643C2EF8;
  id v9 = v6;
  id v7 = v6;
  [(MPCAssistantEndpointContext *)self modifySystemMusicContextForEndpointDestination:a3 completion:v8];
}

uint64_t __81__MPCAssistantEndpointContext_modifySystemMusicContextForDestination_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MPCAssistantEndpointContext)init
{
  v12.receiver = self;
  v12.super_class = (Class)MPCAssistantEndpointContext;
  uint64_t v2 = [(MPCAssistantContext *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPCAssistantDiscovery);
    discoveryLogical = v2->_discoveryLogical;
    v2->_discoveryLogical = v3;

    uint64_t v5 = objc_alloc_init(MPCAssistantDiscovery);
    discoveryAudio = v2->_discoveryAudio;
    v2->_discoveryAudio = v5;

    id v7 = objc_alloc_init(MPCAssistantDiscovery);
    discoveryEndpoint = v2->_discoveryEndpoint;
    v2->_discoveryEndpoint = v7;

    uint64_t v9 = dispatch_get_global_queue(0, 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

@end