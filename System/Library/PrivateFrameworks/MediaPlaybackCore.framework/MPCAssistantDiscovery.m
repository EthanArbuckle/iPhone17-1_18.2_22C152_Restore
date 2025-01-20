@interface MPCAssistantDiscovery
- (BOOL)waitForCompleteClusters;
- (MPCAssistantDiscovery)init;
- (void)_discoverAirplayDevices:(id)a3;
- (void)dealloc;
- (void)discoverAirplayDevicesMatchingGroupID:(id)a3 completion:(id)a4;
- (void)discoverAirplayDevicesMatchingLogicalDeviceIDs:(id)a3 expectedCount:(unint64_t)a4 completion:(id)a5;
- (void)discoverAirplayDevicesMatchingUIDs:(id)a3 completion:(id)a4;
- (void)discoverRemoteControlEndpointsMatchingUIDs:(id)a3 completion:(id)a4;
- (void)setWaitForCompleteClusters:(BOOL)a3;
- (void)stopDiscovery;
@end

@implementation MPCAssistantDiscovery

- (void)setWaitForCompleteClusters:(BOOL)a3
{
  self->_waitForCompleteClusters = a3;
}

- (BOOL)waitForCompleteClusters
{
  return self->_waitForCompleteClusters;
}

- (void)_discoverAirplayDevices:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  MRAVReconnaissanceSessionSetReturnPartialResults();
  v4 = [MEMORY[0x263EF93E0] auxiliarySession];
  uint64_t v5 = *MEMORY[0x263EF9060];
  id v13 = 0;
  char v6 = [v4 setCategory:v5 error:&v13];
  id v7 = v13;
  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "Audio session category failed: %{public}@ (AirPlay devices may be missed)", buf, 0xCu);
    }
  }
  [v4 opaqueSessionID];
  MRAVReconnaissanceSessionSetTargetAudioSessionID();
  v11 = v4;
  v12 = v3;
  id v9 = v3;
  id v10 = v4;
  MRAVReconnaissanceSessionBeginSearch();
}

void __49__MPCAssistantDiscovery__discoverAirplayDevices___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v3, a2);
}

- (void)stopDiscovery
{
  reconSession = self->_reconSession;
  if (reconSession)
  {
    CFRelease(reconSession);
    self->_reconSession = 0;
  }
}

- (void)discoverRemoteControlEndpointsMatchingUIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MPCAssistantDiscovery *)self stopDiscovery];
  v8 = (void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();

  self->_reconSession = v8;
  MRAVReconnaissanceSessionSetWaitForCompleteClusters();
  MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints();
  MRAVReconnaissanceSessionSetReturnPartialResults();
  id v10 = v6;
  id v9 = v6;
  MRAVReconnaissanceSessionBeginEndpointsSearch();
}

void __79__MPCAssistantDiscovery_discoverRemoteControlEndpointsMatchingUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    id v11 = a3;
    id v19 = a2;
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134218240;
      uint64_t v22 = [v11 count];
      __int16 v23 = 2048;
      uint64_t v24 = [v19 count];
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "Found %lu endpoints, %lu devices.", (uint8_t *)&v21, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_17;
  }
  if ([v7 code] == 26)
  {
    id v9 = [v8 domain];
    int v10 = [v9 isEqualToString:*MEMORY[0x263F54AE0]];

    if (v10)
    {
      id v11 = a3;
      uint64_t v12 = [v11 count];
      id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14)
        {
          int v21 = 138543362;
          uint64_t v22 = (uint64_t)v11;
          id v15 = "Timed out with partial discovery. Found endpoints: %{public}@";
          uint64_t v16 = v13;
          uint32_t v17 = 12;
LABEL_15:
          _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v21, v17);
        }
      }
      else if (v14)
      {
        LOWORD(v21) = 0;
        id v15 = "Timed out with no devices discovered";
        uint64_t v16 = v13;
        uint32_t v17 = 2;
        goto LABEL_15;
      }

      (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v11);
LABEL_17:

      goto LABEL_18;
    }
  }
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v21 = 138543362;
    uint64_t v22 = (uint64_t)v8;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "Failed to discover output devices error: %{public}@", (uint8_t *)&v21, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_18:
}

- (void)discoverAirplayDevicesMatchingUIDs:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [(MPCAssistantDiscovery *)self stopDiscovery];
  id v7 = (void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();

  self->_reconSession = v7;
  MRAVReconnaissanceSessionSetWaitForCompleteClusters();
  [(MPCAssistantDiscovery *)self _discoverAirplayDevices:v8];
}

- (void)discoverAirplayDevicesMatchingLogicalDeviceIDs:(id)a3 expectedCount:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  id v7 = a3;
  [(MPCAssistantDiscovery *)self stopDiscovery];
  id v8 = (void *)MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs();

  self->_reconSession = v8;
  MRAVReconnaissanceSessionSetWaitForCompleteClusters();
  MRAVReconnaissanceSessionSetExpectedLogicalDevices();
  [(MPCAssistantDiscovery *)self _discoverAirplayDevices:v9];
}

- (void)discoverAirplayDevicesMatchingGroupID:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [(MPCAssistantDiscovery *)self stopDiscovery];
  id v7 = (void *)MRAVReconnaissanceSessionCreateWithMatchingOutputGroupIDFeatures();

  self->_reconSession = v7;
  [(MPCAssistantDiscovery *)self _discoverAirplayDevices:v8];
}

- (void)dealloc
{
  [(MPCAssistantDiscovery *)self stopDiscovery];
  v3.receiver = self;
  v3.super_class = (Class)MPCAssistantDiscovery;
  [(MPCAssistantDiscovery *)&v3 dealloc];
}

- (MPCAssistantDiscovery)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPCAssistantDiscovery;
  result = [(MPCAssistantDiscovery *)&v3 init];
  if (result) {
    result->_waitForCompleteClusters = 1;
  }
  return result;
}

@end