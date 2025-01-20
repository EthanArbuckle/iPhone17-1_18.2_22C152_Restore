@interface WFMediaRoutePicker
- (AVAudioSession)routingAudioSession;
- (MPAVRoutingController)routingController;
- (NSArray)availableRoutes;
- (NSMutableArray)observers;
- (OS_dispatch_queue)queue;
- (WFBluetoothSettingsClient)bluetoothClient;
- (WFMediaRoutePicker)init;
- (WFMediaRoutePicker)initWithRouteType:(int64_t)a3;
- (int64_t)routeType;
- (void)addAvailableRoutesObserver:(id)a3;
- (void)findHandoffRouteMatchingDescriptor:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)findHandoffRoutesMatchingDescriptors:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)findRouteMatchingDescriptor:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)findRoutesMatchingDescriptors:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)getPairedAudioDevicesMatchingRouteDescriptor:(id)a3 withCompletion:(id)a4;
- (void)handOffFromSourceUID:(id)a3 toDestinationUID:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)removeAvailableRoutesObserver:(id)a3;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)selectRoute:(id)a3 operation:(int64_t)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)setRoutingAudioSession:(id)a3;
- (void)setRoutingController:(id)a3;
- (void)startDiscoveringRoutes;
- (void)stopDiscoveringRoutes;
@end

@implementation WFMediaRoutePicker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_routingAudioSession, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (WFBluetoothSettingsClient)bluetoothClient
{
  return self->_bluetoothClient;
}

- (void)setRoutingController:(id)a3
{
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (void)setRoutingAudioSession:(id)a3
{
}

- (AVAudioSession)routingAudioSession
{
  return self->_routingAudioSession;
}

- (int64_t)routeType
{
  return self->_routeType;
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = getWFActionsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 availableRoutes];
    *(_DWORD *)buf = 136315395;
    v10 = "-[WFMediaRoutePicker routingControllerAvailableRoutesDidChange:]";
    __int16 v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_INFO, "%s Available media routes updated: %{private}@", buf, 0x16u);
  }
  v7 = [(WFMediaRoutePicker *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WFMediaRoutePicker_routingControllerAvailableRoutesDidChange___block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_async(v7, block);
}

void __64__WFMediaRoutePicker_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) routePickerDidUpdateAvailableRoutes:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)findHandoffRoutesMatchingDescriptors:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([(WFMediaRoutePicker *)self routeType] != 2)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"WFMediaRoutePicker.m" lineNumber:347 description:@"Can't handoff when route type isn't WFMediaRouteTypeHandoffCompatibleEndpoint"];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__WFMediaRoutePicker_findHandoffRoutesMatchingDescriptors_timeout_completionHandler___block_invoke;
  v13[3] = &unk_264E5CE88;
  id v14 = v10;
  id v11 = v10;
  [(WFMediaRoutePicker *)self findRoutesMatchingDescriptors:v9 timeout:v13 completionHandler:a4];
}

void __85__WFMediaRoutePicker_findHandoffRoutesMatchingDescriptors_timeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "if_map:", &__block_literal_global_38582);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __85__WFMediaRoutePicker_findHandoffRoutesMatchingDescriptors_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id MPAVEndpointRouteClass = getMPAVEndpointRouteClass();
  uint64_t v4 = WFEnforceClass_38585(v2, (uint64_t)MPAVEndpointRouteClass);

  return v4;
}

- (void)findHandoffRouteMatchingDescriptor:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([(WFMediaRoutePicker *)self routeType] != 2)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"WFMediaRoutePicker.m" lineNumber:337 description:@"Can't handoff when route type isn't WFMediaRouteTypeHandoffCompatibleEndpoint"];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__WFMediaRoutePicker_findHandoffRouteMatchingDescriptor_timeout_completionHandler___block_invoke;
  v13[3] = &unk_264E5AF98;
  id v14 = v10;
  id v11 = v10;
  [(WFMediaRoutePicker *)self findRouteMatchingDescriptor:v9 timeout:v13 completionHandler:a4];
}

void __83__WFMediaRoutePicker_findHandoffRouteMatchingDescriptor_timeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id MPAVEndpointRouteClass = getMPAVEndpointRouteClass();
  WFEnforceClass_38585(v6, (uint64_t)MPAVEndpointRouteClass);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v5);
}

- (void)handOffFromSourceUID:(id)a3 toDestinationUID:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFMediaRoutePicker.m", 311, @"Invalid parameter not satisfying: %@", @"sourceUID" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFMediaRoutePicker.m", 312, @"Invalid parameter not satisfying: %@", @"destinationUID" object file lineNumber description];

LABEL_3:
  if ([(WFMediaRoutePicker *)self routeType] != 2)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"WFMediaRoutePicker.m" lineNumber:313 description:@"Can't handoff when route type isn't WFMediaRouteTypeHandoffCompatibleEndpoint"];
  }
  if ([v10 isEqualToString:@"Speaker"])
  {

    id v10 = 0;
  }
  if ([v11 isEqualToString:@"Speaker"])
  {

    id v11 = 0;
  }
  uint64_t v13 = [(WFMediaRoutePicker *)self queue];
  v18 = v12;
  id v14 = v12;
  MRMediaRemotePlaybackSessionMigrateForDevice();
}

uint64_t __86__WFMediaRoutePicker_handOffFromSourceUID_toDestinationUID_timeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)selectRoute:(id)a3 operation:(int64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = getWFActionsLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_INFO, "%s Selecting route as output route %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v43 = __Block_byref_object_copy__38620;
  v44 = __Block_byref_object_dispose__38621;
  id v45 = (id)[v11 copy];
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__34;
  v40 = __Block_byref_object_dispose__35;
  id v41 = 0;
  id v14 = objc_alloc(MEMORY[0x263F85290]);
  v15 = [(WFMediaRoutePicker *)self queue];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke;
  v28[3] = &unk_264E5AFE8;
  v32 = &v36;
  id v16 = v13;
  double v34 = a5;
  v33 = buf;
  id v29 = v16;
  v30 = self;
  id v17 = v10;
  id v31 = v17;
  int64_t v35 = a4;
  uint64_t v18 = [v14 initWithInterval:v15 repeatInterval:v28 queue:1.0 handler:1.0];
  v19 = (void *)v37[5];
  v37[5] = v18;

  [(id)v37[5] start];
  objc_initWeak(&location, self);
  objc_initWeak(&from, (id)v37[5]);
  objc_initWeak(&v25, *(id *)(*(void *)&buf[8] + 40));
  v20 = [(WFMediaRoutePicker *)self routingController];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_38;
  v21[3] = &unk_264E5B010;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  objc_copyWeak(&v24, &v25);
  [v20 selectRoute:v17 operation:a4 completion:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(buf, 8);
}

void __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isCancelled] & 1) == 0)
  {
    id v2 = [MEMORY[0x263EFF910] date];
    [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v4 = v3;
    double v5 = *(double *)(a1 + 72);

    id v6 = getWFActionsLogObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v4 <= v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
        _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_INFO, "%s Select route: polling to see if desired route selection operation has succeeded", buf, 0xCu);
      }

      id v11 = [*(id *)(a1 + 40) routingController];
      id v12 = [v11 pickedRoutes];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = v12;
      uint64_t v13 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v9);
            }
            id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend(v17, "routeUID", (void)v24);
            v19 = [*(id *)(a1 + 48) routeUID];
            if (([v18 isEqualToString:v19] & 1) != 0
              || [v17 isDeviceSpeakerRoute]
              && [*(id *)(a1 + 48) isDeviceSpeakerRoute])
            {

LABEL_22:
              if (*(void *)(a1 + 80) != 2) {
                goto LABEL_25;
              }
              goto LABEL_29;
            }
            v20 = [v17 routeName];
            v21 = [*(id *)(a1 + 48) routeName];
            int v22 = [v20 isEqualToString:v21];

            if (v22) {
              goto LABEL_22;
            }
          }
          uint64_t v14 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v14) {
            continue;
          }
          break;
        }

        if ((v22 ^ (*(void *)(a1 + 80) == 2))) {
          goto LABEL_25;
        }
        goto LABEL_29;
      }

      if (*(void *)(a1 + 80) != 2)
      {
LABEL_29:

        return;
      }
LABEL_25:
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "cancel", (void)v24);
      id v23 = getWFActionsLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
        _os_log_impl(&dword_23C364000, v23, OS_LOG_TYPE_INFO, "%s Select route: route selection finished successfully", buf, 0xCu);
      }

      id v10 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 16);
    }
    else
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 136315394;
        v30 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
        __int16 v31 = 2048;
        uint64_t v32 = v8;
        _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_INFO, "%s Selecting route timed out after %f seconds", buf, 0x16u);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cancel];
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"WFMediaRoutePickerErrorDomain" code:3 userInfo:0];
      id v10 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 16);
    }
    v10();
    goto LABEL_29;
  }
}

void __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_38(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v5 = objc_loadWeakRetained(a1 + 5);
  id v6 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    BOOL v7 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_2;
    block[3] = &unk_264E5DD30;
    id v9 = v5;
    id v10 = v3;
    id v11 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = getWFActionsLogObject();
  double v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke_2";
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_INFO, "%s Select route completed with error: %@", buf, 0x16u);
    }

    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v10 = *MEMORY[0x263F08608];
    uint64_t v11 = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    double v4 = [v6 errorWithDomain:@"WFMediaRoutePickerErrorDomain" code:4 userInfo:v8];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
    _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_ERROR, "%s Select route completed", buf, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)findRoutesMatchingDescriptors:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke;
  v5[3] = &unk_264E5AFC0;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  objc_msgSend(a3, "if_mapAsynchronously:completionHandler:", v5, a5);
}

void __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void **)(a1 + 32);
  double v8 = *(double *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke_2;
  v10[3] = &unk_264E5AF98;
  id v11 = v6;
  id v9 = v6;
  [v7 findRouteMatchingDescriptor:a2 timeout:v10 completionHandler:v8];
}

uint64_t __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)findRouteMatchingDescriptor:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v9 = a5;
  if (!v12)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFMediaRoutePicker.m", 222, @"Invalid parameter not satisfying: %@", @"routeDescriptor" object file lineNumber description];
  }
  uint64_t v10 = [[WFMediaRouteFinder alloc] initWithPicker:self routeDescriptor:v12 timeout:v9 completionHandler:a4];
  [(WFMediaRouteFinder *)v10 start];
}

- (NSArray)availableRoutes
{
  id v3 = [(WFMediaRoutePicker *)self routingController];
  double v4 = [v3 availableRoutes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__WFMediaRoutePicker_availableRoutes__block_invoke;
  v7[3] = &unk_264E5AF70;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "if_objectsPassingTest:", v7);

  return (NSArray *)v5;
}

uint64_t __37__WFMediaRoutePicker_availableRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) routeType] != 2
    || ([v3 isAppleTVRoute] & 1) != 0
    || ([v3 isHomePodRoute] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [v3 isDeviceSpeakerRoute];
  }

  return v4;
}

- (void)removeAvailableRoutesObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFMediaRoutePicker *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__WFMediaRoutePicker_removeAvailableRoutesObserver___block_invoke;
  v7[3] = &unk_264E5DED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__WFMediaRoutePicker_removeAvailableRoutesObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
  if (![v2 count]) {
    [*(id *)(a1 + 32) stopDiscoveringRoutes];
  }
}

- (void)addAvailableRoutesObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFMediaRoutePicker *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__WFMediaRoutePicker_addAvailableRoutesObserver___block_invoke;
  v7[3] = &unk_264E5DED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__WFMediaRoutePicker_addAvailableRoutesObserver___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) observers];
  uint64_t v2 = [v3 count];
  [v3 addObject:*(void *)(a1 + 40)];
  if (!v2) {
    [*(id *)(a1 + 32) startDiscoveringRoutes];
  }
}

- (void)stopDiscoveringRoutes
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = getWFActionsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[WFMediaRoutePicker stopDiscoveringRoutes]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_INFO, "%s Stopping discovering routes for %@", (uint8_t *)&v5, 0x16u);
  }

  id v4 = [(WFMediaRoutePicker *)self routingController];
  [v4 setDiscoveryMode:0];
  [v4 setDelegate:0];
}

- (void)startDiscoveringRoutes
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = getWFActionsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[WFMediaRoutePicker startDiscoveringRoutes]";
    __int16 v9 = 2112;
    uint64_t v10 = self;
    _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_INFO, "%s Starting discovering routes for %@", buf, 0x16u);
  }

  id v4 = [(WFMediaRoutePicker *)self routingController];
  [v4 setDiscoveryMode:3];
  [v4 setDelegate:self];
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__WFMediaRoutePicker_startDiscoveringRoutes__block_invoke;
  v5[3] = &unk_264E5AF48;
  objc_copyWeak(&v6, (id *)buf);
  [v4 fetchAvailableRoutesWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __44__WFMediaRoutePicker_startDiscoveringRoutes__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained routingController];
  [WeakRetained routingControllerAvailableRoutesDidChange:v1];
}

- (void)getPairedAudioDevicesMatchingRouteDescriptor:(id)a3 withCompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFMediaRoutePicker.m", 128, @"Invalid parameter not satisfying: %@", @"routeDescriptor" object file lineNumber description];
  }
  __int16 v9 = getWFActionsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    long long v27 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]";
    __int16 v28 = 2113;
    id v29 = v7;
    _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s Searching for Bluetooth device matching route descriptor %{private}@", buf, 0x16u);
  }

  uint64_t v10 = [(WFMediaRoutePicker *)self bluetoothClient];

  if (v10)
  {
    uint64_t v11 = [(WFMediaRoutePicker *)self bluetoothClient];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_25;
    v20[3] = &unk_264E5DDE8;
    id v12 = &v21;
    id v21 = v7;
    id v22 = v8;
    id v13 = v8;
    id v14 = v7;
    [v11 getPairedDevicesMatchingType:1 completion:v20];

    uint64_t v15 = v22;
  }
  else
  {
    uint64_t v16 = getWFActionsLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v27 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]";
      _os_log_impl(&dword_23C364000, v16, OS_LOG_TYPE_INFO, "%s Initializing Bluetooth client", buf, 0xCu);
    }

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke;
    v23[3] = &unk_264E5AEF8;
    id v12 = &v25;
    id v24 = v7;
    id v25 = v8;
    v23[4] = self;
    id v17 = v8;
    id v18 = v7;
    +[WFBluetoothSettingsClient createClientWithCompletionHandler:v23];
    uint64_t v15 = v24;
  }
}

void __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    int v5 = getWFActionsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]_block_invoke";
      _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_INFO, "%s Bluetooth client initialized, caching for future runs...", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    [*(id *)(a1 + 32) getPairedAudioDevicesMatchingRouteDescriptor:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_2;
  v13[3] = &unk_264E5AF20;
  id v14 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "if_objectsPassingTest:", v13);
  uint64_t v5 = [v4 count];
  int v6 = getWFActionsLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315651;
      uint64_t v16 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]_block_invoke";
      __int16 v17 = 2113;
      uint64_t v18 = v8;
      __int16 v19 = 2113;
      v20 = v4;
      __int16 v9 = "%s Found bluetooth devices matching descriptor %{private}@: %{private}@";
      uint64_t v10 = v6;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    }
  }
  else if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315395;
    uint64_t v16 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]_block_invoke";
    __int16 v17 = 2113;
    uint64_t v18 = v12;
    __int16 v9 = "%s Did not find any bluetooth devices matching descriptor %{private}@";
    uint64_t v10 = v6;
    uint32_t v11 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 routeUID];
  int v6 = [v4 address];
  int v7 = [v5 containsString:v6];

  uint64_t v8 = [*(id *)(a1 + 32) routeName];
  __int16 v9 = [v4 name];

  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10 == v11)
  {
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
    if (v10 && v11) {
      int v13 = [v10 isEqualToString:v11];
    }
  }

  return v7 | v13;
}

- (WFMediaRoutePicker)initWithRouteType:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)WFMediaRoutePicker;
  id v4 = [(WFMediaRoutePicker *)&v26 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.shortcuts.WFMediaRoutePicker", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    observers = v4->_observers;
    v4->_observers = (NSMutableArray *)v7;

    v4->_routeType = a3;
    id v9 = objc_alloc((Class)getMPAVEndpointRouteClass());
    id v10 = (void *)[v9 initWithEndpoint:MRAVEndpointGetLocalEndpoint()];
    uint64_t v27 = 0;
    __int16 v28 = &v27;
    uint64_t v29 = 0x2050000000;
    id v11 = (void *)getMPAVOutputDeviceRoutingDataSourceClass_softClass;
    uint64_t v30 = getMPAVOutputDeviceRoutingDataSourceClass_softClass;
    if (!getMPAVOutputDeviceRoutingDataSourceClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMPAVOutputDeviceRoutingDataSourceClass_block_invoke;
      *(void *)&unsigned char buf[24] = &unk_264E5EC88;
      uint64_t v32 = &v27;
      __getMPAVOutputDeviceRoutingDataSourceClass_block_invoke((uint64_t)buf);
      id v11 = (void *)v28[3];
    }
    uint64_t v12 = v11;
    _Block_object_dispose(&v27, 8);
    int v13 = (void *)[[v12 alloc] initWithEndpointRoute:v10];
    id v14 = [MEMORY[0x263EF93E0] auxiliarySession];
    uint64_t v15 = *MEMORY[0x263EF9060];
    id v25 = 0;
    int v16 = [v14 setCategory:v15 error:&v25];
    id v17 = v25;
    uint64_t v18 = getWFActionsLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFMediaRoutePicker initWithRouteType:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v16 ^ 1;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v17;
      _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_DEFAULT, "%s Setting audio session category for route discovery failed: %d error: %@", buf, 0x1Cu);
    }

    objc_msgSend(v13, "setTargetSessionID:", objc_msgSend(v14, "opaqueSessionID"));
    objc_storeStrong((id *)&v4->_routingAudioSession, v14);
    if ((unint64_t)(a3 - 1) > 1) {
      [v13 setSupportsQueueHandoff:0];
    }
    else {
      [v13 setFilterMode:3];
    }
    uint64_t v27 = 0;
    __int16 v28 = &v27;
    uint64_t v29 = 0x2050000000;
    __int16 v19 = (void *)getMPAVRoutingControllerClass_softClass_38680;
    uint64_t v30 = getMPAVRoutingControllerClass_softClass_38680;
    if (!getMPAVRoutingControllerClass_softClass_38680)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMPAVRoutingControllerClass_block_invoke_38681;
      *(void *)&unsigned char buf[24] = &unk_264E5EC88;
      uint64_t v32 = &v27;
      __getMPAVRoutingControllerClass_block_invoke_38681((uint64_t)buf);
      __int16 v19 = (void *)v28[3];
    }
    v20 = v19;
    _Block_object_dispose(&v27, 8);
    uint64_t v21 = [[v20 alloc] initWithDataSource:v13 name:@"WFMediaRoutePicker"];
    routingController = v4->_routingController;
    v4->_routingController = (MPAVRoutingController *)v21;

    [(MPAVRoutingController *)v4->_routingController setRouteTypes:3];
    id v23 = v4;
  }
  return v4;
}

- (WFMediaRoutePicker)init
{
  return [(WFMediaRoutePicker *)self initWithRouteType:0];
}

@end