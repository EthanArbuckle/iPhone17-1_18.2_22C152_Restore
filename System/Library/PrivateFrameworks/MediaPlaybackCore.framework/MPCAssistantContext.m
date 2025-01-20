@interface MPCAssistantContext
- (MPCAssistantContext)init;
- (void)modifySystemMusicContextForDestination:(id)a3 completion:(id)a4;
@end

@implementation MPCAssistantContext

- (void).cxx_destruct
{
}

- (void)modifySystemMusicContextForDestination:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__MPCAssistantContext_modifySystemMusicContextForDestination_completion___block_invoke;
  aBlock[3] = &unk_2643C56A8;
  id v8 = v7;
  id v17 = v8;
  v9 = _Block_copy(aBlock);
  v10 = [v6 outputGroupID];

  if (v10)
  {
    discovery = self->_discovery;
    v12 = [v6 outputGroupID];
    [(MPCAssistantDiscovery *)discovery discoverAirplayDevicesMatchingGroupID:v12 completion:v9];
  }
  else
  {
    v13 = [v6 outputDeviceUIDs];
    uint64_t v14 = [v13 count];

    if (!v14)
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
      goto LABEL_6;
    }
    v15 = self->_discovery;
    v12 = [v6 outputDeviceUIDs];
    [(MPCAssistantDiscovery *)v15 discoverAirplayDevicesMatchingUIDs:v12 completion:v9];
  }

LABEL_6:
}

void __73__MPCAssistantContext_modifySystemMusicContextForDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "Setting output devices on the shared audio presentation context: %{public}@", buf, 0xCu);
    }

    v5 = dispatch_get_global_queue(0, 0);
    MRAVOutputContextGetSharedAudioPresentationContext();
    id v7 = *(id *)(a1 + 32);
    MRAVOutputContextSetOutputDevices();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v5 = MPCAssistantCreateError(1);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

void __73__MPCAssistantContext_modifySystemMusicContextForDestination_completion___block_invoke_1(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      uint64_t v9 = a2;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "Failed to set output devices on the shared audio presentation context: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = MPCAssistantCreateError(4);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v7();
  }
}

- (MPCAssistantContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCAssistantContext;
  v2 = [(MPCAssistantContext *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPCAssistantDiscovery);
    discovery = v2->_discovery;
    v2->_discovery = v3;
  }
  return v2;
}

@end