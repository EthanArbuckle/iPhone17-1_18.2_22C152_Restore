@interface WFMediaPlaybackController
+ (id)bundleIdentifierForMediaPlaybackApplication:(unint64_t)a3;
+ (id)songPropertySet;
- (OS_dispatch_queue)queue;
- (WFMediaPlaybackController)init;
- (id)createSendCommandError:(unsigned int)a3;
- (void)clearQueueWithCompletion:(id)a3;
- (void)connectToEndpoint:(id)a3 completion:(id)a4;
- (void)connectToExternalDevice:(id)a3 completion:(id)a4;
- (void)getActivePlayerPathWithCompletion:(id)a3;
- (void)getCurrentlyPlayingMediaWithCompletion:(id)a3;
- (void)getLocalPlaybackCapabilityWithCompletion:(id)a3;
- (void)getPreferredMediaControlDestinationForOutputDeviceUIDs:(id)a3 completionBlock:(id)a4;
- (void)getPreferredMediaControlOriginWithCompletion:(id)a3;
- (void)getPreferredPlaybackDestinationForPlaybackArchive:(id)a3 completionBlock:(id)a4;
- (void)getPreferredPlaybackOriginWithCompletion:(id)a3;
- (void)getRemoteControlEndpointsMatchingUIDs:(id)a3 completion:(id)a4;
- (void)goToBeginningOfTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4;
- (void)goToNextTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4;
- (void)goToPreviousTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4;
- (void)pauseOnDevicesWithUIDs:(id)a3 completion:(id)a4;
- (void)playOnDevicesWithUIDs:(id)a3 completion:(id)a4;
- (void)playPauseOnDevicesWithUIDs:(id)a3 completion:(id)a4;
- (void)queueItemsWithIdentifierSets:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5;
- (void)queueMediaItems:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5;
- (void)queueiTunesStoreItems:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5;
- (void)reconSession;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5;
- (void)sendCommand:(unsigned int)a3 origin:(void *)a4 options:(id)a5 completion:(id)a6;
- (void)sendCommand:(unsigned int)a3 playerPath:(void *)a4 options:(id)a5 completion:(id)a6;
- (void)sendCommandToDevicesWithUIDs:(unsigned int)a3 deviceUIDs:(id)a4 options:(id)a5 sendTwice:(BOOL)a6 completion:(id)a7;
- (void)setReconSession:(void *)a3;
- (void)skipBackwardOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5;
- (void)skipForwardOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5;
- (void)skipToPositionOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5;
@end

@implementation WFMediaPlaybackController

- (void).cxx_destruct
{
}

- (void)setReconSession:(void *)a3
{
  self->_reconSession = a3;
}

- (void)reconSession
{
  return self->_reconSession;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)goToBeginningOfTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
}

- (void)goToPreviousTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
}

- (void)goToNextTrackOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
}

- (void)skipToPositionOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  v14 = (void *)*MEMORY[0x263F54D10];
  v8 = v14;
  v9 = NSNumber;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 numberWithDouble:a4];
  v15[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [(WFMediaPlaybackController *)self sendCommandToDevicesWithUIDs:24 deviceUIDs:v11 options:v13 sendTwice:0 completion:v10];
}

- (void)skipBackwardOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  v14 = (void *)*MEMORY[0x263F54D90];
  v8 = v14;
  v9 = NSNumber;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 numberWithDouble:a4];
  v15[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [(WFMediaPlaybackController *)self sendCommandToDevicesWithUIDs:18 deviceUIDs:v11 options:v13 sendTwice:0 completion:v10];
}

- (void)skipForwardOnDevicesWithUIDs:(id)a3 interval:(double)a4 completion:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  v14 = (void *)*MEMORY[0x263F54D90];
  v8 = v14;
  v9 = NSNumber;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 numberWithDouble:a4];
  v15[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [(WFMediaPlaybackController *)self sendCommandToDevicesWithUIDs:17 deviceUIDs:v11 options:v13 sendTwice:0 completion:v10];
}

- (void)pauseOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
}

- (void)playOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
}

- (void)playPauseOnDevicesWithUIDs:(id)a3 completion:(id)a4
{
}

- (void)sendCommandToDevicesWithUIDs:(unsigned int)a3 deviceUIDs:(id)a4 options:(id)a5 sendTwice:(BOOL)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ([v12 count])
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2;
    v20[3] = &unk_264E562D0;
    id v21 = v13;
    id v22 = v14;
    int v23 = v10;
    v20[4] = self;
    BOOL v24 = a6;
    id v15 = v13;
    id v16 = v14;
    [(WFMediaPlaybackController *)self getRemoteControlEndpointsMatchingUIDs:v12 completion:v20];

    v17 = v22;
  }
  else
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke;
    v25[3] = &unk_264E56230;
    BOOL v29 = a6;
    int v28 = v10;
    v25[4] = self;
    id v26 = v13;
    id v27 = v14;
    id v18 = v13;
    id v19 = v14;
    [(WFMediaPlaybackController *)self sendCommand:v10 origin:0 options:v18 completion:v25];

    v17 = v26;
  }
}

uint64_t __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60)) {
    return [*(id *)(a1 + 32) sendCommand:*(unsigned int *)(a1 + 56) origin:0 options:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    if ([v7 count] || !objc_msgSend(v8, "count"))
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__3156;
      v46 = __Block_byref_object_dispose__3157;
      id v47 = 0;
      dispatch_group_t v10 = dispatch_group_create();
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_221;
      aBlock[3] = &unk_264E56280;
      v41 = buf;
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 32);
      v38 = v11;
      uint64_t v39 = v12;
      int v42 = *(_DWORD *)(a1 + 56);
      id v40 = *(id *)(a1 + 40);
      char v43 = *(unsigned char *)(a1 + 60);
      id v13 = _Block_copy(aBlock);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_4;
      v33[3] = &unk_264E562A8;
      id v14 = v11;
      uint64_t v15 = *(void *)(a1 + 32);
      v34 = v14;
      uint64_t v35 = v15;
      id v16 = v13;
      id v36 = v16;
      [v7 enumerateObjectsUsingBlock:v33];
      v17 = [*(id *)(a1 + 32) queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_5;
      block[3] = &unk_264E5EDC8;
      id v31 = *(id *)(a1 + 48);
      v32 = buf;
      dispatch_group_notify(v14, v17, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v18 = getWFActionsLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:compl"
                             "etion:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_INFO, "%s Found no endpoints for provided UIDs, only devices: %@", buf, 0x16u);
      }

      if (v9)
      {
        id v19 = [v9 userInfo];
        v20 = (void *)[v19 mutableCopy];
      }
      else
      {
        v20 = objc_opt_new();
      }
      BOOL v24 = NSString;
      v25 = WFLocalizedPluralString(@"These devices can't be controlled remotely.");
      id v26 = objc_msgSend(v24, "localizedStringWithFormat:", v25, objc_msgSend(v8, "count"));
      [v20 setObject:v26 forKeyedSubscript:*MEMORY[0x263F08320]];

      id v27 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"WFMediaPlaybackControllerErrorDomain", objc_msgSend(v9, "code"), v20);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v21 = getWFActionsLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[WFMediaPlaybackController sendCommandToDevicesWithUIDs:deviceUIDs:options:sendTwice:complet"
                           "ion:]_block_invoke_2";
      _os_log_impl(&dword_23C364000, v21, OS_LOG_TYPE_INFO, "%s Found no endpoints and no devices for provided UIDs.", buf, 0xCu);
    }

    if (v9)
    {
      id v22 = [v9 userInfo];
      int v23 = (void *)[v22 mutableCopy];
    }
    else
    {
      int v23 = objc_opt_new();
    }
    int v28 = WFLocalizedString(@"No endpoints were found.");
    [v23 setObject:v28 forKeyedSubscript:*MEMORY[0x263F08320]];

    BOOL v29 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"WFMediaPlaybackControllerErrorDomain", objc_msgSend(v9, "code"), v23);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_221(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2_222;
    aBlock[3] = &unk_264E59980;
    uint64_t v21 = *(void *)(a1 + 56);
    id v20 = *(id *)(a1 + 32);
    id v8 = _Block_copy(aBlock);
    uint64_t v9 = *(unsigned int *)(a1 + 64);
    id v11 = *(void **)(a1 + 40);
    dispatch_group_t v10 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_3;
    v13[3] = &unk_264E56258;
    char v18 = *(unsigned char *)(a1 + 68);
    int v17 = v9;
    v13[4] = v11;
    uint64_t v16 = a3;
    id v14 = v10;
    id v15 = v8;
    id v12 = v8;
    [v11 sendCommand:v9 origin:a3 options:v14 completion:v13];
  }
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  [*(id *)(a1 + 40) connectToEndpoint:v4 completion:*(void *)(a1 + 48)];
}

uint64_t __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_2_222(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __98__WFMediaPlaybackController_sendCommandToDevicesWithUIDs_deviceUIDs_options_sendTwice_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 68)) {
    return [*(id *)(a1 + 32) sendCommand:*(unsigned int *)(a1 + 64) origin:*(void *)(a1 + 56) options:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __60__WFMediaPlaybackController_sendCommand_options_completion___block_invoke;
  uint64_t v16 = &unk_264E56208;
  unsigned int v18 = a3;
  id v17 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = _Block_copy(&v13);
  id v12 = [(WFMediaPlaybackController *)self queue];
  MRMediaRemoteSendCommandWithReply();
}

void __60__WFMediaPlaybackController_sendCommand_options_completion___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count]
    && ([v3 firstObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = (int)v4,
        v4,
        v5))
  {
    if (v5 == 2)
    {
      v6 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F07F80];
      v17[0] = v6;
      id v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v9 = [v7 errorWithDomain:@"WFMediaPlaybackControllerErrorDomain" code:2 userInfo:v8];
    }
    else
    {
      v6 = (void *)MRMediaRemoteCopyCommandDescription();
      id v8 = getWFActionsLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315650;
        id v11 = "-[WFMediaPlaybackController sendCommand:options:completion:]_block_invoke";
        __int16 v12 = 2114;
        uint64_t v13 = v6;
        __int16 v14 = 1024;
        int v15 = v5;
        _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s %{public}@ received a non-success status: '%u'", (uint8_t *)&v10, 0x1Cu);
      }
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendCommand:(unsigned int)a3 playerPath:(void *)a4 options:(id)a5 completion:(id)a6
{
  id v8 = a6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFMediaPlaybackController_sendCommand_playerPath_options_completion___block_invoke;
  aBlock[3] = &unk_264E572D0;
  id v14 = v8;
  id v9 = v8;
  id v10 = a5;
  id v11 = _Block_copy(aBlock);
  __int16 v12 = [(WFMediaPlaybackController *)self queue];
  MRMediaRemoteSendCommandToPlayer();
}

void __71__WFMediaPlaybackController_sendCommand_playerPath_options_completion___block_invoke(uint64_t a1, unsigned int a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v4 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
    int v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F07F80];
    v9[0] = v4;
    v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = [v5 errorWithDomain:@"WFMediaPlaybackControllerErrorDomain" code:a2 userInfo:v6];
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendCommand:(unsigned int)a3 origin:(void *)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = getWFActionsLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = (void *)MRMediaRemoteCopyCommandDescription();
    int v14 = 136315394;
    int v15 = "-[WFMediaPlaybackController sendCommand:origin:options:completion:]";
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_INFO, "%s Sending command: %@", (uint8_t *)&v14, 0x16u);
  }
  if (a4) {
    [(WFMediaPlaybackController *)self sendCommand:v8 playerPath:MRNowPlayingPlayerPathCreate() options:v10 completion:v11];
  }
  else {
    [(WFMediaPlaybackController *)self sendCommand:v8 options:v10 completion:v11];
  }
}

- (id)createSendCommandError:(unsigned int)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
  uint64_t v8 = *MEMORY[0x263F08320];
  v9[0] = v4;
  int v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"WFMediaPlaybackControllerErrorDomain" code:a3 userInfo:v5];

  return v6;
}

- (void)connectToExternalDevice:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFActionsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Connecting to external device: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__WFMediaPlaybackController_connectToExternalDevice_completion___block_invoke;
  v12[3] = &unk_264E561E0;
  objc_copyWeak(&v14, (id *)buf);
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v10 = [(WFMediaPlaybackController *)self queue];
  [v6 setConnectionStateCallback:v12 withQueue:v10];

  uint64_t v15 = *MEMORY[0x263F54868];
  __int16 v16 = @"WFMediaPlaybackController";
  id v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v6 connectWithOptions:0 userInfo:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __64__WFMediaPlaybackController_connectToExternalDevice_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2 == 3)
  {
    id v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315650;
      id v13 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]_block_invoke";
      __int16 v14 = 2114;
      id v15 = WeakRetained;
      __int16 v16 = 2114;
      uint64_t v17 = a3;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_ERROR, "%s Connection failed %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [WeakRetained setConnectionStateCallback:0 withQueue:0];
  }
  else if (a2 == 2)
  {
    id v7 = getWFActionsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      id v13 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]_block_invoke";
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEBUG, "%s Successfully connected to external device.", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v8 = [WeakRetained customOrigin];
    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v10 = getWFActionsLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        id v13 = "-[WFMediaPlaybackController connectToExternalDevice:completion:]_block_invoke";
        __int16 v14 = 2114;
        id v15 = WeakRetained;
        _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_ERROR, "%s No origin for %{public}@", (uint8_t *)&v12, 0x16u);
      }

      id v11 = [*(id *)(a1 + 32) createSendCommandError:6];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    [WeakRetained setConnectionStateCallback:0 withQueue:0];
  }
}

- (void)connectToEndpoint:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFActionsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    __int16 v14 = "-[WFMediaPlaybackController connectToEndpoint:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Connecting to endpoint: %@", (uint8_t *)&v13, 0x16u);
  }

  if (v6 && ![v6 isLocalEndpoint])
  {
    id v10 = [v6 externalDevice];
    if (v10)
    {
      id v11 = [v6 externalDevice];
      [(WFMediaPlaybackController *)self connectToExternalDevice:v11 completion:v7];
    }
    else
    {
      int v12 = getWFActionsLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        __int16 v14 = "-[WFMediaPlaybackController connectToEndpoint:completion:]";
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_ERROR, "%s No device for endpoint %{public}@", (uint8_t *)&v13, 0x16u);
      }

      id v11 = [(WFMediaPlaybackController *)self createSendCommandError:2];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
    }
  }
  else
  {
    uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
    (*((void (**)(id, void, uint64_t, void))v7 + 2))(v7, 0, LocalOrigin, 0);
  }
}

- (void)getRemoteControlEndpointsMatchingUIDs:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFActionsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v13 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Getting remote control endpoints for UIDs: %@", buf, 0x16u);
  }

  id v9 = getWFActionsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v13 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]";
    _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s Nullifying existing reconSession.", buf, 0xCu);
  }

  [(WFMediaPlaybackController *)self setReconSession:0];
  [(WFMediaPlaybackController *)self setReconSession:MRAVReconnaissanceSessionCreateWithEndpointFeatures()];
  [(WFMediaPlaybackController *)self reconSession];
  MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints();
  [(WFMediaPlaybackController *)self reconSession];
  MRAVReconnaissanceSessionSetReturnPartialResults();
  [(WFMediaPlaybackController *)self reconSession];
  id v11 = v7;
  id v10 = v7;
  MRAVReconnaissanceSessionBeginEndpointsSearch();
}

void __78__WFMediaPlaybackController_getRemoteControlEndpointsMatchingUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  if (v7)
  {
    if ([v7 code] == 26
      && ([v7 domain],
          id v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = (void *)*MEMORY[0x263F54AE0],
          int v12 = [v10 isEqualToString:*MEMORY[0x263F54AE0]],
          v11,
          v10,
          v12))
    {
      uint64_t v13 = [v8 count];
      __int16 v14 = getWFActionsLogObject();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (!v13)
      {
        if (!v15) {
          goto LABEL_13;
        }
        int v20 = 136315138;
        uint64_t v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
        uint64_t v16 = "%s Search for remote control endpoints timed out with no results.";
        uint64_t v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 12;
        goto LABEL_12;
      }
      if (v15)
      {
        int v20 = 136315394;
        uint64_t v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
        __int16 v22 = 2114;
        uint64_t v23 = (uint64_t)v8;
        uint64_t v16 = "%s Search for remote control endpoints timed out with partial results. Found endpoints: %{public}@";
LABEL_9:
        uint64_t v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 22;
LABEL_12:
        _os_log_impl(&dword_23C364000, v17, v18, v16, (uint8_t *)&v20, v19);
      }
    }
    else
    {
      __int16 v14 = getWFActionsLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315394;
        uint64_t v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
        __int16 v22 = 2114;
        uint64_t v23 = (uint64_t)v7;
        uint64_t v16 = "%s Search for remote control endpoints failed with error: %{public}@";
        goto LABEL_9;
      }
    }
  }
  else
  {
    __int16 v14 = getWFActionsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315650;
      uint64_t v21 = "-[WFMediaPlaybackController getRemoteControlEndpointsMatchingUIDs:completion:]_block_invoke";
      __int16 v22 = 2048;
      uint64_t v23 = [v8 count];
      __int16 v24 = 2048;
      uint64_t v25 = [v9 count];
      uint64_t v16 = "%s Search for remote control endpoints succeeded. Found %lu endpoints, %lu devices.";
      uint64_t v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      uint32_t v19 = 32;
      goto LABEL_12;
    }
  }
LABEL_13:

  (*(void (**)(void, id, id, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v8, v9, v7);
}

- (void)getActivePlayerPathWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = getWFActionsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[WFMediaPlaybackController getActivePlayerPathWithCompletion:]";
    _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_INFO, "%s Querying active player path...", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__WFMediaPlaybackController_getActivePlayerPathWithCompletion___block_invoke;
  v7[3] = &unk_264E56190;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WFMediaPlaybackController *)self getPreferredMediaControlOriginWithCompletion:v7];
}

void __63__WFMediaPlaybackController_getActivePlayerPathWithCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = getWFActionsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[WFMediaPlaybackController getActivePlayerPathWithCompletion:]_block_invoke";
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_INFO, "%s Preferred media control origin is local, falling back to [MPCPlayerPath deviceActivePlayerPath]...", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [getMPCPlayerPathClass() deviceActivePlayerPath];
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, 1);
  }
  else
  {
    id v6 = [(id)objc_opt_class() bundleIdentifierForMediaPlaybackApplication:1];
    id v8 = [getMPCPlayerPathClass() pathWithCustomOrigin:a2 bundleID:v6 playerID:0];
    id v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      uint64_t v11 = "-[WFMediaPlaybackController getActivePlayerPathWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = a2;
      __int16 v14 = 2112;
      BOOL v15 = v6;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s Preferred media control origin is not local (%@)—constructed player path with bundle ID %@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)clearQueueWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getMPCPlayerRequestClass());
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WFMediaPlaybackController_clearQueueWithCompletion___block_invoke;
  v7[3] = &unk_264E56168;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 performWithCompletion:v7];
}

void __54__WFMediaPlaybackController_clearQueueWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 tracklist];
    id v4 = [v3 resetCommand];
    id v6 = [v4 clearUpNextItems];

    if (v6) {
      [getMPCPlayerChangeRequestClass() performRequest:v6 completion:*(void *)(a1 + 32)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

- (void)queueItemsWithIdentifierSets:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFMediaPlaybackController.m", 316, @"Invalid parameter not satisfying: %@", @"identifierSets" object file lineNumber description];
  }
  if ([v9 count])
  {
    uint64_t v11 = [getMPModelSongClass() kindWithVariants:1];
    uint64_t v27 = 0;
    int v28 = &v27;
    uint64_t v29 = 0x2050000000;
    __int16 v12 = (void *)getMPModelLibraryRequestClass_softClass;
    uint64_t v30 = getMPModelLibraryRequestClass_softClass;
    if (!getMPModelLibraryRequestClass_softClass)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __getMPModelLibraryRequestClass_block_invoke;
      v26[3] = &unk_264E5EC88;
      v26[4] = &v27;
      __getMPModelLibraryRequestClass_block_invoke((uint64_t)v26);
      __int16 v12 = (void *)v28[3];
    }
    uint64_t v13 = v12;
    _Block_object_dispose(&v27, 8);
    id v14 = objc_alloc_init(v13);
    [v14 setItemKind:v11];
    BOOL v15 = [getMPPropertySetClass() emptyPropertySet];
    [v14 setItemProperties:v15];

    [v14 setAllowedItemIdentifiers:v9];
    getMPCPlayerRequestClass();
    uint64_t v16 = [v9 firstObject];
    uint64_t v17 = [v14 playbackIntentWithStartItemIdentifiers:v16];

    [v17 setShuffleMode:-1];
    id v18 = objc_alloc_init((Class)getMPCPlayerRequestClass());
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __84__WFMediaPlaybackController_queueItemsWithIdentifierSets_inAdditionMode_completion___block_invoke;
    v22[3] = &unk_264E56140;
    id v24 = v10;
    unint64_t v25 = a4;
    id v23 = v17;
    id v19 = v17;
    id v20 = (id)[v18 performWithCompletion:v22];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __84__WFMediaPlaybackController_queueItemsWithIdentifierSets_inAdditionMode_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    uint64_t v6 = a1[6];
    if (v6 == 1)
    {
      id v7 = [v12 tracklist];
      id v8 = [v7 insertCommand];
      uint64_t v9 = [v8 insertAtEndOfTracklistWithPlaybackIntent:a1[4]];
    }
    else
    {
      if (v6)
      {
LABEL_9:
        id v10 = *(void (**)(void))(a1[5] + 16);
        goto LABEL_10;
      }
      id v7 = [v12 tracklist];
      id v8 = [v7 insertCommand];
      uint64_t v9 = [v8 insertAfterPlayingItemWithPlaybackIntent:a1[4]];
    }
    uint64_t v11 = (void *)v9;

    if (v11)
    {
      [getMPCPlayerChangeRequestClass() performRequest:v11 completion:a1[5]];

      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v10 = *(void (**)(void))(a1[5] + 16);
LABEL_10:
  v10();
LABEL_11:
}

- (void)queueiTunesStoreItems:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [getMPModelSongClass() kindWithVariants:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke;
  v13[3] = &unk_264E56118;
  id v14 = v10;
  id v11 = v10;
  id v12 = objc_msgSend(v9, "if_map:", v13);

  [(WFMediaPlaybackController *)self queueItemsWithIdentifierSets:v12 inAdditionMode:a4 completion:v8];
}

id __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)getMPIdentifierSetClass());
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_2;
  v9[3] = &unk_264E560F0;
  id v10 = v3;
  id v6 = v3;
  id v7 = (void *)[v4 initWithModelKind:v5 block:v9];

  return v7;
}

void __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_3;
  v3[3] = &unk_264E560C8;
  id v4 = *(id *)(a1 + 32);
  [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __77__WFMediaPlaybackController_queueiTunesStoreItems_inAdditionMode_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "longLongValue"));
}

- (void)queueMediaItems:(id)a3 inAdditionMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [getMPMediaLibraryClass() defaultMediaLibrary];
  id v11 = [getMPModelSongClass() kindWithVariants:1];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke;
  id v18 = &unk_264E560A0;
  id v19 = v11;
  id v20 = v10;
  id v12 = v10;
  id v13 = v11;
  id v14 = objc_msgSend(v9, "if_map:", &v15);

  -[WFMediaPlaybackController queueItemsWithIdentifierSets:inAdditionMode:completion:](self, "queueItemsWithIdentifierSets:inAdditionMode:completion:", v14, a4, v8, v15, v16, v17, v18);
}

id __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)getMPIdentifierSetClass());
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_2;
  v9[3] = &unk_264E56078;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v6 = v3;
  id v7 = (void *)[v4 initWithModelKind:v5 block:v9];

  return v7;
}

void __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 uniqueIdentifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_3;
  v6[3] = &unk_264E56050;
  id v7 = *(id *)(a1 + 40);
  [v4 setLibraryIdentifiersWithDatabaseID:v5 block:v6];
}

void __71__WFMediaPlaybackController_queueMediaItems_inAdditionMode_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));
}

- (void)getPreferredMediaControlOriginWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(v5, LocalOrigin, 1);
}

- (void)getPreferredPlaybackOriginWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(v5, LocalOrigin, 1);
}

- (void)getCurrentlyPlayingMediaWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = getWFActionsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]";
    _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_INFO, "%s Starting fetching currently playing song information...", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke;
  v7[3] = &unk_264E56028;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WFMediaPlaybackController *)self getActivePlayerPathWithCompletion:v7];
}

void __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = getWFActionsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = @"remote companion";
    *(void *)&uint8_t buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_DWORD *)buf = 136315651;
    if (a3) {
      id v7 = @"local";
    }
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v33 = v7;
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_INFO, "%s Resolved active player path: %{private}@, %{public}@", buf, 0x20u);
  }

  if (v5)
  {
    id v8 = objc_alloc((Class)getMPPropertySetClass());
    uint64_t v24 = 0;
    unint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    id v9 = (id *)getMPModelRelationshipGenericSongSymbolLoc_ptr;
    uint64_t v27 = getMPModelRelationshipGenericSongSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericSongSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMPModelRelationshipGenericSongSymbolLoc_block_invoke;
      v33 = (__CFString *)&unk_264E5EC88;
      v34 = &v24;
      id v10 = MediaPlayerLibrary();
      uint64_t v11 = dlsym(v10, "MPModelRelationshipGenericSong");
      *(void *)(v34[1] + 24) = v11;
      getMPModelRelationshipGenericSongSymbolLoc_ptr = *(void *)(v34[1] + 24);
      id v9 = (id *)v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (!v9)
    {
      id v19 = [MEMORY[0x263F08690] currentHandler];
      id v20 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipGenericSong(void)"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFMediaPlaybackController.m", 54, @"%s", dlerror());

      __break(1u);
    }
    id v12 = *v9;
    id v13 = v12;
    if (a3)
    {
      id v30 = v12;
      id v14 = [getMPPropertySetClass() emptyPropertySet];
      id v31 = v14;
      [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    }
    else
    {
      id v28 = v12;
      id v14 = [(id)objc_opt_class() songPropertySet];
      uint64_t v29 = v14;
      [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v15 = };
    uint64_t v16 = (void *)[v8 initWithProperties:MEMORY[0x263EFFA68] relationships:v15];

    id v17 = objc_alloc_init((Class)getMPCPlayerRequestClass());
    [v17 setPlayerPath:v5];
    [v17 setPlayingItemProperties:v16];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke_176;
    v21[3] = &unk_264E56000;
    id v22 = *(id *)(a1 + 40);
    char v23 = a3;
    id v18 = (id)[v17 performWithCompletion:v21];
  }
  else
  {
    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
  }
}

void __68__WFMediaPlaybackController_getCurrentlyPlayingMediaWithCompletion___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315651;
    *(void *)&uint8_t buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v33 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s MPCPlayerRequest responded: %{private}@ with error: %{public}@", buf, 0x20u);
  }

  id v8 = [v5 tracklist];
  id v9 = [v8 playingItem];

  id v10 = [v9 metadataObject];
  if (!v10)
  {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
    goto LABEL_21;
  }
  uint64_t v11 = getWFActionsLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_23C364000, v11, OS_LOG_TYPE_INFO, "%s Fetched now playing media: %{private}@", buf, 0x16u);
  }

  if (!*(unsigned char *)(a1 + 40))
  {
    id v19 = getWFActionsLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
      _os_log_impl(&dword_23C364000, v19, OS_LOG_TYPE_INFO, "%s Making a MPMediaItem from model object", buf, 0xCu);
    }

    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2050000000;
    id v20 = (void *)getMPMediaItemClass_softClass;
    uint64_t v31 = getMPMediaItemClass_softClass;
    if (!getMPMediaItemClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMPMediaItemClass_block_invoke;
      v33 = &unk_264E5EC88;
      v34 = &v28;
      __getMPMediaItemClass_block_invoke((uint64_t)buf);
      id v20 = (void *)v29[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v28, 8);
    id v18 = [v21 itemFromModelObject:v10];
    if (v9) {
      goto LABEL_10;
    }
LABEL_17:
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    goto LABEL_18;
  }
  id v12 = [v10 song];
  id v13 = [v12 identifiers];
  id v14 = [v13 library];
  uint64_t v15 = [v14 persistentID];

  uint64_t v16 = getWFActionsLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_23C364000, v16, OS_LOG_TYPE_INFO, "%s Making a local MPMediaItem from pid %{private}lld", buf, 0x16u);
  }

  id v17 = [getMPMediaLibraryClass() defaultMediaLibrary];
  id v18 = [v17 itemWithPersistentID:v15 verifyExistence:0];

  if (!v9) {
    goto LABEL_17;
  }
LABEL_10:
  [v9 duration];
LABEL_18:
  objc_msgSend(MEMORY[0x263EFF910], "timeIntervalSinceReferenceDate", v24, (void)v26);
  double v23 = *(double *)&v27 + (v22 - v25) * *((float *)&v27 + 2);
  if (v23 >= *((double *)&v26 + 1)) {
    double v23 = *((double *)&v26 + 1);
  }
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(fmax(v23, 0.0));

LABEL_21:
}

- (void)getLocalPlaybackCapabilityWithCompletion:(id)a3
{
}

- (WFMediaPlaybackController)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFMediaPlaybackController;
  v2 = [(WFMediaPlaybackController *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.shortcuts.WFMediaController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = v2;
  }

  return v2;
}

+ (id)songPropertySet
{
  v107[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  id v3 = (id *)getMPModelPropertyGenreNameSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertyGenreNameSymbolLoc_ptr;
  if (!getMPModelPropertyGenreNameSymbolLoc_ptr)
  {
    dispatch_queue_t v4 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v4, "MPModelPropertyGenreName");
    getMPModelPropertyGenreNameSymbolLoc_ptr = v97[3];
    id v3 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v3)
  {
    v61 = [MEMORY[0x263F08690] currentHandler];
    v62 = [NSString stringWithUTF8String:"NSString *getMPModelPropertyGenreName(void)"];
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, @"WFMediaPlaybackController.m", 75, @"%s", dlerror());

    goto LABEL_64;
  }
  v107[0] = *v3;
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = v107[0];
  id v7 = [v5 arrayWithObjects:v107 count:1];

  v95 = (void *)[v2 initWithProperties:v7 relationships:0];
  id v8 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  id v9 = (id *)getMPModelPropertyAlbumTitleSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertyAlbumTitleSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumTitleSymbolLoc_ptr)
  {
    id v10 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v10, "MPModelPropertyAlbumTitle");
    getMPModelPropertyAlbumTitleSymbolLoc_ptr = v97[3];
    id v9 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v9)
  {
    v63 = [MEMORY[0x263F08690] currentHandler];
    v64 = [NSString stringWithUTF8String:"NSString *getMPModelPropertyAlbumTitle(void)"];
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, @"WFMediaPlaybackController.m", 68, @"%s", dlerror());

    goto LABEL_64;
  }
  id v11 = *v9;
  v105[0] = v11;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  id v12 = (id *)getMPModelPropertyAlbumDiscCountSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertyAlbumDiscCountSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumDiscCountSymbolLoc_ptr)
  {
    id v13 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v13, "MPModelPropertyAlbumDiscCount");
    getMPModelPropertyAlbumDiscCountSymbolLoc_ptr = v97[3];
    id v12 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v12)
  {
    v65 = [MEMORY[0x263F08690] currentHandler];
    v66 = [NSString stringWithUTF8String:"NSString *getMPModelPropertyAlbumDiscCount(void)"];
    objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, @"WFMediaPlaybackController.m", 69, @"%s", dlerror());

    goto LABEL_64;
  }
  id v14 = *v12;
  v105[1] = v14;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v15 = (id *)getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr)
  {
    uint64_t v16 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v16, "MPModelPropertyAlbumReleaseDateComponents");
    getMPModelPropertyAlbumReleaseDateComponentsSymbolLoc_ptr = v97[3];
    uint64_t v15 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v15)
  {
    v67 = [MEMORY[0x263F08690] currentHandler];
    v68 = [NSString stringWithUTF8String:"NSString *getMPModelPropertyAlbumReleaseDateComponents(void)"];
    objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, @"WFMediaPlaybackController.m", 70, @"%s", dlerror());

    goto LABEL_64;
  }
  id v17 = *v15;
  v105[2] = v17;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  id v18 = (id *)getMPModelPropertyAlbumTrackCountSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertyAlbumTrackCountSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumTrackCountSymbolLoc_ptr)
  {
    id v19 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v19, "MPModelPropertyAlbumTrackCount");
    getMPModelPropertyAlbumTrackCountSymbolLoc_ptr = v97[3];
    id v18 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v18)
  {
    v69 = [MEMORY[0x263F08690] currentHandler];
    v70 = [NSString stringWithUTF8String:"NSString *getMPModelPropertyAlbumTrackCount(void)"];
    objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, @"WFMediaPlaybackController.m", 71, @"%s", dlerror());

    goto LABEL_64;
  }
  id v106 = *v18;
  id v20 = (void *)MEMORY[0x263EFF8C0];
  id v21 = v106;
  double v22 = [v20 arrayWithObjects:v105 count:4];

  v94 = (void *)[v8 initWithProperties:v22 relationships:0];
  id v23 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  long long v24 = (id *)getMPModelPropertyArtistNameSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertyArtistNameSymbolLoc_ptr;
  if (!getMPModelPropertyArtistNameSymbolLoc_ptr)
  {
    double v25 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v25, "MPModelPropertyArtistName");
    getMPModelPropertyArtistNameSymbolLoc_ptr = v97[3];
    long long v24 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v24)
  {
    v71 = [MEMORY[0x263F08690] currentHandler];
    v72 = [NSString stringWithUTF8String:"NSString *getMPModelPropertyArtistName(void)"];
    objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, @"WFMediaPlaybackController.m", 64, @"%s", dlerror());

    goto LABEL_64;
  }
  id v104 = *v24;
  long long v26 = (void *)MEMORY[0x263EFF8C0];
  id v27 = v104;
  uint64_t v28 = [v26 arrayWithObjects:&v104 count:1];

  v93 = (void *)[v23 initWithProperties:v28 relationships:0];
  id v92 = objc_alloc((Class)getMPPropertySetClass());
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v29 = (id *)getMPModelPropertySongTitleSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertySongTitleSymbolLoc_ptr;
  if (!getMPModelPropertySongTitleSymbolLoc_ptr)
  {
    uint64_t v30 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v30, "MPModelPropertySongTitle");
    getMPModelPropertySongTitleSymbolLoc_ptr = v97[3];
    uint64_t v29 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v29)
  {
    v73 = [MEMORY[0x263F08690] currentHandler];
    v74 = [NSString stringWithUTF8String:"NSString *getMPModelPropertySongTitle(void)"];
    objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, @"WFMediaPlaybackController.m", 55, @"%s", dlerror());

    goto LABEL_64;
  }
  id v31 = *v29;
  v103[0] = v31;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  v32 = (id *)getMPModelPropertySongDurationSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertySongDurationSymbolLoc_ptr;
  if (!getMPModelPropertySongDurationSymbolLoc_ptr)
  {
    v33 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v33, "MPModelPropertySongDuration");
    getMPModelPropertySongDurationSymbolLoc_ptr = v97[3];
    v32 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v32)
  {
    v75 = [MEMORY[0x263F08690] currentHandler];
    v76 = [NSString stringWithUTF8String:"NSString *getMPModelPropertySongDuration(void)"];
    objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, @"WFMediaPlaybackController.m", 56, @"%s", dlerror());

    goto LABEL_64;
  }
  id v34 = *v32;
  v103[1] = v34;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v35 = (id *)getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongDiscNumberSymbolLoc_ptr)
  {
    id v36 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v36, "MPModelPropertySongDiscNumber");
    getMPModelPropertySongDiscNumberSymbolLoc_ptr = v97[3];
    uint64_t v35 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v35)
  {
    v77 = [MEMORY[0x263F08690] currentHandler];
    v78 = [NSString stringWithUTF8String:"NSString *getMPModelPropertySongDiscNumber(void)"];
    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, @"WFMediaPlaybackController.m", 57, @"%s", dlerror());

    goto LABEL_64;
  }
  id v37 = *v35;
  v103[2] = v37;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  v38 = (id *)getMPModelPropertySongExplicitSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertySongExplicitSymbolLoc_ptr;
  if (!getMPModelPropertySongExplicitSymbolLoc_ptr)
  {
    uint64_t v39 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v39, "MPModelPropertySongExplicit");
    getMPModelPropertySongExplicitSymbolLoc_ptr = v97[3];
    v38 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v38)
  {
    v79 = [MEMORY[0x263F08690] currentHandler];
    v80 = [NSString stringWithUTF8String:"NSString *getMPModelPropertySongExplicit(void)"];
    objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, @"WFMediaPlaybackController.m", 58, @"%s", dlerror());

    goto LABEL_64;
  }
  id v40 = *v38;
  v103[3] = v40;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  v41 = (id *)getMPModelPropertySongTrackNumberSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertySongTrackNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongTrackNumberSymbolLoc_ptr)
  {
    int v42 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v42, "MPModelPropertySongTrackNumber");
    getMPModelPropertySongTrackNumberSymbolLoc_ptr = v97[3];
    v41 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v41)
  {
    v81 = [MEMORY[0x263F08690] currentHandler];
    v82 = [NSString stringWithUTF8String:"NSString *getMPModelPropertySongTrackNumber(void)"];
    objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, @"WFMediaPlaybackController.m", 59, @"%s", dlerror());

    goto LABEL_64;
  }
  id v43 = *v41;
  v103[4] = v43;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  v44 = (id *)getMPModelPropertySongArtworkSymbolLoc_ptr;
  uint64_t v99 = getMPModelPropertySongArtworkSymbolLoc_ptr;
  if (!getMPModelPropertySongArtworkSymbolLoc_ptr)
  {
    v45 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v45, "MPModelPropertySongArtwork");
    getMPModelPropertySongArtworkSymbolLoc_ptr = v97[3];
    v44 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v44)
  {
    v83 = [MEMORY[0x263F08690] currentHandler];
    v84 = [NSString stringWithUTF8String:"NSString *getMPModelPropertySongArtwork(void)"];
    objc_msgSend(v83, "handleFailureInFunction:file:lineNumber:description:", v84, @"WFMediaPlaybackController.m", 60, @"%s", dlerror());

    goto LABEL_64;
  }
  v91 = v31;
  id v46 = *v44;
  v103[5] = v46;
  id v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:6];
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v48 = (id *)getMPModelRelationshipSongArtistSymbolLoc_ptr;
  uint64_t v99 = getMPModelRelationshipSongArtistSymbolLoc_ptr;
  if (!getMPModelRelationshipSongArtistSymbolLoc_ptr)
  {
    v49 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v49, "MPModelRelationshipSongArtist");
    getMPModelRelationshipSongArtistSymbolLoc_ptr = v97[3];
    uint64_t v48 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v48)
  {
    v85 = [MEMORY[0x263F08690] currentHandler];
    v86 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipSongArtist(void)"];
    objc_msgSend(v85, "handleFailureInFunction:file:lineNumber:description:", v86, @"WFMediaPlaybackController.m", 63, @"%s", dlerror());

    goto LABEL_64;
  }
  id v50 = *v48;
  v100[0] = v50;
  v102[0] = v93;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  v51 = (id *)getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  uint64_t v99 = getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  if (!getMPModelRelationshipSongAlbumSymbolLoc_ptr)
  {
    v52 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v52, "MPModelRelationshipSongAlbum");
    getMPModelRelationshipSongAlbumSymbolLoc_ptr = v97[3];
    v51 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v51)
  {
    v87 = [MEMORY[0x263F08690] currentHandler];
    v88 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipSongAlbum(void)"];
    objc_msgSend(v87, "handleFailureInFunction:file:lineNumber:description:", v88, @"WFMediaPlaybackController.m", 67, @"%s", dlerror());

    goto LABEL_64;
  }
  id v53 = *v51;
  v100[1] = v53;
  v102[1] = v94;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  v54 = (id *)getMPModelRelationshipSongGenreSymbolLoc_ptr;
  uint64_t v99 = getMPModelRelationshipSongGenreSymbolLoc_ptr;
  if (!getMPModelRelationshipSongGenreSymbolLoc_ptr)
  {
    v55 = MediaPlayerLibrary();
    v97[3] = (uint64_t)dlsym(v55, "MPModelRelationshipSongGenre");
    getMPModelRelationshipSongGenreSymbolLoc_ptr = v97[3];
    v54 = (id *)v97[3];
  }
  _Block_object_dispose(&v96, 8);
  if (!v54)
  {
    v89 = [MEMORY[0x263F08690] currentHandler];
    v90 = [NSString stringWithUTF8String:"NSString *getMPModelRelationshipSongGenre(void)"];
    objc_msgSend(v89, "handleFailureInFunction:file:lineNumber:description:", v90, @"WFMediaPlaybackController.m", 74, @"%s", dlerror());

LABEL_64:
    __break(1u);
  }
  id v101 = *v54;
  v102[2] = v95;
  v56 = NSDictionary;
  id v57 = v101;
  v58 = [v56 dictionaryWithObjects:v102 forKeys:v100 count:3];

  v59 = (void *)[v92 initWithProperties:v47 relationships:v58];
  return v59;
}

+ (id)bundleIdentifierForMediaPlaybackApplication:(unint64_t)a3
{
  if (a3 == 2)
  {
    dispatch_queue_t v4 = (id *)MEMORY[0x263F85548];
LABEL_7:
    id v3 = (const char *)*v4;
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    dispatch_queue_t v4 = (id *)MEMORY[0x263F85538];
    goto LABEL_7;
  }
  if (a3) {
    goto LABEL_9;
  }
  id v3 = [a1 bundleIdentifierForMediaPlaybackApplication:1];
LABEL_8:
  a2 = v3;
LABEL_9:
  return (id)(id)a2;
}

- (void)getPreferredMediaControlDestinationForOutputDeviceUIDs:(id)a3 completionBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = getWFActionsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredMediaControlDestinationForOutputDeviceUIDs:completionBlock:]";
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Querying preferred media control MPCAssistant destination...", buf, 0xCu);
  }

  if ([v6 count])
  {
    id v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredMediaControlDestinationForOutputDeviceUIDs:completionBlock:]";
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s Output device UIDs are given. Returning local destination, with the UIDs set", buf, 0xCu);
    }

    id v10 = [getMPCAssistantMutableRemoteControlDestinationClass() nowPlayingApplicationDestination];
    [v10 setOutputDeviceUIDs:v6];
    v7[2](v7, v10);
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __114__WFMediaPlaybackController_MPCAssistant__getPreferredMediaControlDestinationForOutputDeviceUIDs_completionBlock___block_invoke;
    v11[3] = &unk_264E56FE0;
    id v12 = v7;
    [(WFMediaPlaybackController *)self getPreferredMediaControlOriginWithCompletion:v11];
    id v10 = v12;
  }
}

void __114__WFMediaPlaybackController_MPCAssistant__getPreferredMediaControlDestinationForOutputDeviceUIDs_completionBlock___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = getWFActionsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = @"remote companion";
    id v10 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredMediaControlDestinationForOutputDeviceUIDs:completionBlo"
          "ck:]_block_invoke";
    int v9 = 136315650;
    if (a3) {
      id v7 = @"local";
    }
    __int16 v11 = 2112;
    uint64_t v12 = a2;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_INFO, "%s Constructing playback destination for origin %@ (%{public}@), player bundle ID nil (MR will pick whatever player is active)", (uint8_t *)&v9, 0x20u);
  }

  id v8 = (void *)[objc_alloc((Class)getMPCAssistantMutableRemoteControlDestinationClass()) initWithAppBundleID:0 playerID:0 origin:a2];
  (*(void (**)(void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v8);
}

- (void)getPreferredPlaybackDestinationForPlaybackArchive:(id)a3 completionBlock:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = getWFActionsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredPlaybackDestinationForPlaybackArchive:completionBlock:]";
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_INFO, "%s Querying preferred playback MPCAssistant destination...", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __109__WFMediaPlaybackController_MPCAssistant__getPreferredPlaybackDestinationForPlaybackArchive_completionBlock___block_invoke;
  v8[3] = &unk_264E56FE0;
  id v9 = v5;
  id v7 = v5;
  [(WFMediaPlaybackController *)self getPreferredPlaybackOriginWithCompletion:v8];
}

void __109__WFMediaPlaybackController_MPCAssistant__getPreferredPlaybackDestinationForPlaybackArchive_completionBlock___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = +[WFMediaPlaybackController bundleIdentifierForMediaPlaybackApplication:a3 ^ 1u];
  id v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"remote companion";
    int v11 = 136315906;
    uint64_t v12 = "-[WFMediaPlaybackController(MPCAssistant) getPreferredPlaybackDestinationForPlaybackArchive:completionBlock:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = a2;
    if (a3) {
      id v8 = @"local";
    }
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Constructing playback destination for origin %@ (%{public}@), player bundle ID %@", (uint8_t *)&v11, 0x2Au);
  }

  id v9 = (void *)[objc_alloc((Class)getMPCAssistantMutableRemoteControlDestinationClass()) initWithAppBundleID:v6 playerID:0 origin:a2];
  (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, v10);
}

@end