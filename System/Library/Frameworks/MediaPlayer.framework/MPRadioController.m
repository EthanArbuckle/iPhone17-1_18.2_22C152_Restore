@interface MPRadioController
- (BOOL)isRadioAvailable;
- (MPRadioController)init;
- (void)_beginRemoteProcessAssertionWithCompletionHandler:(id)a3;
- (void)_endRemoteProcessAssertion;
- (void)_getConnectionWithCompletionHandler:(id)a3;
- (void)_setRadioAvailable:(BOOL)a3;
- (void)clientRadioControllerRadioAvailabilityDidChange:(BOOL)a3;
- (void)clientRadioControllerRecentStationsDidChange;
- (void)dealloc;
- (void)getRecentStationGroupsWithCompletionHandler:(id)a3;
@end

@implementation MPRadioController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteProcessAssertionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_remoteProcessAssertion, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_getConnectionWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = v4;
  if (self->_connection)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E57F9140;
    v6[4] = self;
    v7 = v4;
    [(MPRadioController *)self _beginRemoteProcessAssertionWithCompletionHandler:v6];
  }
}

uint64_t __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    [v2 _endRemoteProcessAssertion];
  }
  else
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.MediaPlayer.MPRadioControllerServer" options:0];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v3);
    v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v5 = MPServiceRadioControllerGetXPCInterface();
    [v4 setRemoteObjectInterface:v5];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setExportedObject:");
    v6 = *(void **)(*(void *)(a1 + 32) + 16);
    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE70E170];
    [v6 setExportedInterface:v7];

    objc_initWeak(&location, *(id *)(*(void *)(a1 + 32) + 16));
    objc_initWeak(&from, *(id *)(a1 + 32));
    v8 = *(void **)(*(void *)(a1 + 32) + 16);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E57F9228;
    objc_copyWeak(&v20, &from);
    objc_copyWeak(&v21, &location);
    [v8 setInterruptionHandler:v19];
    v9 = *(void **)(*(void *)(a1 + 32) + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_24;
    v16[3] = &unk_1E57F9228;
    objc_copyWeak(&v17, &from);
    objc_copyWeak(&v18, &location);
    [v9 setInvalidationHandler:v16];
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_26;
    v15[3] = &unk_1E57F9B00;
    v15[4] = v10;
    v12 = [v11 remoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_4;
    v14[3] = &unk_1E57FA170;
    v14[4] = *(void *)(a1 + 32);
    [v12 serviceRadioControllerGetRadioAvailabilityWithCompletionHandler:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "[MPRadioController] Connection interrupted.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_23;
    v7[3] = &unk_1E57F9F98;
    v8 = WeakRetained;
    id v9 = v5;
    dispatch_barrier_async(v6, v7);
  }
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_24(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "[MPRadioController] Connection invalidated.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_25;
    v7[3] = &unk_1E57F9F98;
    v8 = WeakRetained;
    id v9 = v5;
    dispatch_barrier_async(v6, v7);
  }
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_2_26(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E57F9EA8;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E57F8F88;
  id v10 = v5;
  uint64_t v11 = v6;
  char v12 = a2;
  id v8 = v5;
  dispatch_barrier_async(v7, block);
}

uint64_t __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) _setRadioAvailable:*(unsigned __int8 *)(a1 + 48)];
  }
  v2 = *(void **)(a1 + 40);

  return [v2 _endRemoteProcessAssertion];
}

uint64_t __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endRemoteProcessAssertion];
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(void *)(v1 + 16) = 0;
  }
}

void __57__MPRadioController__getConnectionWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (v2 == *(void **)(a1 + 40))
  {
    *(void *)(v1 + 16) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

- (void)_setRadioAvailable:(BOOL)a3
{
  if (self->_isRadioAvailable != a3)
  {
    self->_isRadioAvailable = a3;
    CFPreferencesSetAppValue(@"MPRadioControllerRadioAvailability", (CFPropertyListRef)objc_msgSend(NSNumber, "numberWithBool:"), @"com.apple.mobileipod");
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MPRadioController__setRadioAvailable___block_invoke;
    block[3] = &unk_1E57F9EA8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __40__MPRadioController__setRadioAvailable___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPRadioControllerRadioAvailabilityDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_endRemoteProcessAssertion
{
  int64_t v2 = self->_remoteProcessAssertionCount - 1;
  self->_remoteProcessAssertionCount = v2;
  if (!v2)
  {
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MPRadioController__endRemoteProcessAssertion__block_invoke;
    block[3] = &unk_1E57F9EA8;
    void block[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

void __47__MPRadioController__endRemoteProcessAssertion__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MPRadioController__endRemoteProcessAssertion__block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  void block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __47__MPRadioController__endRemoteProcessAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 48))
  {
    [*(id *)(v1 + 32) setInvalidationHandler:0];
    [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_time_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

- (void)_beginRemoteProcessAssertionWithCompletionHandler:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v4 = (void (**)(void))a3;
  id remoteProcessAssertionCompletionHandler = self->_remoteProcessAssertionCompletionHandler;
  ++self->_remoteProcessAssertionCount;
  if (self->_hasLaunchedService && remoteProcessAssertionCompletionHandler == 0)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v7 = (void *)[remoteProcessAssertionCompletionHandler copy];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E57EE4B0;
    id v8 = v7;
    id v15 = v8;
    v16 = v4;
    id v9 = (void *)[v14 copy];
    id v10 = self->_remoteProcessAssertionCompletionHandler;
    self->_id remoteProcessAssertionCompletionHandler = v9;

    if (!self->_hasLaunchedService)
    {
      self->_hasLaunchedService = 1;
      uint64_t v11 = [MEMORY[0x1E4F62AF8] sharedService];
      uint64_t v17 = *MEMORY[0x1E4F625F8];
      v18[0] = MEMORY[0x1E4F1CC38];
      char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2;
      v13[3] = &unk_1E57F9B00;
      v13[4] = self;
      [v11 openApplication:@"com.apple.Music" options:v12 withResult:v13];
    }
  }
}

uint64_t __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    dispatch_time_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E57F9EA8;
  void block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v2 + 48) >= 1 && !*(void *)(v2 + 32))
  {
    objc_initWeak(&location, (id)v2);
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__3086;
    id v18 = __Block_byref_object_dispose__3087;
    id v19 = 0;
    id v3 = objc_alloc(MEMORY[0x1E4F4E280]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_17;
    v12[3] = &unk_1E57EE4D8;
    objc_copyWeak(&v13, &location);
    v12[4] = &v14;
    uint64_t v4 = [v3 initWithBundleIdentifier:@"com.apple.Music" flags:7 reason:4 name:@"com.apple.MediaPlayer.MPRadioController.connection" withHandler:v12];
    id v5 = (void *)v15[5];
    void v15[5] = v4;

    uint64_t v6 = (void *)v15[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3_20;
    v10[3] = &unk_1E57FA328;
    objc_copyWeak(&v11, &location);
    v10[4] = &v14;
    [v6 setInvalidationHandler:v10];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), (id)v15[5]);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    _Block_object_dispose(&v14, 8);

    objc_destroyWeak(&location);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v7 = (void (**)(void))[*(id *)(v2 + 40) copy];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  if (v7) {
    v7[2](v7);
  }
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_17(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = WeakRetained[1];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2_18;
      v6[3] = &unk_1E57F9F20;
      uint64_t v8 = *(void *)(a1 + 32);
      v7 = WeakRetained;
      dispatch_barrier_async(v5, v6);
    }
  }
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_3_20(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_4;
    v5[3] = &unk_1E57F9F20;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = WeakRetained;
    dispatch_barrier_async(v4, v5);
  }
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2 == *(void **)(v1 + 32))
  {
    *(void *)(v1 + 32) = 0;
  }
}

void __71__MPRadioController__beginRemoteProcessAssertionWithCompletionHandler___block_invoke_2_18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2 == *(void **)(v1 + 32))
  {
    *(void *)(v1 + 32) = 0;
  }
}

- (void)getRecentStationGroupsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E57F9140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E57F9140;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _beginRemoteProcessAssertionWithCompletionHandler:v2];
}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E57EE488;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _getConnectionWithCompletionHandler:v4];
}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_4;
  v13[3] = &unk_1E57F4970;
  id v4 = *(id *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v4;
  id v5 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v13);
  id v6 = v5;
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_6;
    v11[3] = &unk_1E57F8500;
    v11[4] = *(void *)(a1 + 32);
    uint64_t v7 = v5;
    id v12 = v7;
    id v8 = [v3 remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_8;
    v9[3] = &unk_1E57F4970;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    [v8 serviceRadioControllerGetRecentStationGroupsWithCompletionHandler:v9];
  }
  else
  {
    v5[2](v5, 0, 0);
  }
}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E57F8408;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
  [*(id *)(a1 + 32) _endRemoteProcessAssertion];
}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_7;
  v7[3] = &unk_1E57F9140;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_barrier_async(v4, v7);
}

void __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_9;
  block[3] = &unk_1E57F8408;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_barrier_async(v7, block);
}

uint64_t __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_9(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __65__MPRadioController_getRecentStationGroupsWithCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)isRadioAvailable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MPRadioController_isRadioAvailable__block_invoke;
  v5[3] = &unk_1E57F9F20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__MPRadioController_isRadioAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 25);
  return result;
}

- (void)clientRadioControllerRecentStationsDidChange
{
  char v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MPRadioController_clientRadioControllerRecentStationsDidChange__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __65__MPRadioController_clientRadioControllerRecentStationsDidChange__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPRadioControllerRecentStationsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)clientRadioControllerRadioAvailabilityDidChange:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__MPRadioController_clientRadioControllerRadioAvailabilityDidChange___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

uint64_t __69__MPRadioController_clientRadioControllerRadioAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRadioAvailable:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(BKSProcessAssertion *)self->_remoteProcessAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPRadioController;
  [(MPRadioController *)&v3 dealloc];
}

- (MPRadioController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPRadioController;
  id v2 = [(MPRadioController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.MPRadioController.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_isRadioAvailable = CFPreferencesGetAppBooleanValue(@"MPRadioControllerRadioAvailability", @"com.apple.mobileipod", 0) != 0;
    [(MPRadioController *)v2 _getConnectionWithCompletionHandler:0];
  }
  return v2;
}

@end