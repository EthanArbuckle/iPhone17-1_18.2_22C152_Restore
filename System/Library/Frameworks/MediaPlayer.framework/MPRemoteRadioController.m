@interface MPRemoteRadioController
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MPRemoteRadioController)init;
- (RadioAvailabilityController)availabilityController;
- (RadioRecentStationsController)recentStationsController;
- (void)_addConnection:(id)a3;
- (void)_handleRecentStationsControllerDidChange;
- (void)_playActivityReportingControllerDidFlushEventsNotification:(id)a3;
- (void)_radioAvailabilityControllerRadioAvailableDidChangeNotification:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)dealloc;
- (void)serviceRadioControllerGetRadioAvailabilityWithCompletionHandler:(id)a3;
- (void)serviceRadioControllerGetRecentStationGroupsWithCompletionHandler:(id)a3;
- (void)start;
@end

@implementation MPRemoteRadioController

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_listener)
  {
    v4 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.MediaPlayer.MPRadioControllerServer"];
    listener = self->_listener;
    self->_listener = v4;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener resume];
  }

  os_unfair_lock_unlock(p_lock);
}

- (MPRemoteRadioController)init
{
  v25.receiver = self;
  v25.super_class = (Class)MPRemoteRadioController;
  v2 = [(MPRemoteRadioController *)&v25 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  v2->_lock._os_unfair_lock_opaque = 0;
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v5 = (void *)getRadioAvailabilityControllerClass_softClass;
  uint64_t v34 = getRadioAvailabilityControllerClass_softClass;
  if (!getRadioAvailabilityControllerClass_softClass)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getRadioAvailabilityControllerClass_block_invoke;
    v29 = &unk_1E57FA300;
    v30 = &v31;
    __getRadioAvailabilityControllerClass_block_invoke((uint64_t)&v26);
    v5 = (void *)v32[3];
  }
  v6 = v5;
  _Block_object_dispose(&v31, 8);
  v7 = (RadioAvailabilityController *)objc_alloc_init(v6);
  availabilityController = v3->_availabilityController;
  v3->_availabilityController = v7;

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  v9 = (void *)getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr;
  uint64_t v34 = getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr;
  if (!getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_block_invoke;
    v29 = &unk_1E57FA300;
    v30 = &v31;
    v10 = RadioLibrary();
    v11 = dlsym(v10, "RadioAvailabilityControllerRadioAvailableDidChangeNotification");
    *(void *)(v30[1] + 24) = v11;
    getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr = *(void *)(v30[1] + 24);
    v9 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (v9)
  {
    [v4 addObserver:v3 selector:sel__radioAvailabilityControllerRadioAvailableDidChangeNotification_ name:*v9 object:v3->_availabilityController];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v12 = (void *)getRadioRecentStationsControllerClass_softClass;
    uint64_t v34 = getRadioRecentStationsControllerClass_softClass;
    if (!getRadioRecentStationsControllerClass_softClass)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getRadioRecentStationsControllerClass_block_invoke;
      v29 = &unk_1E57FA300;
      v30 = &v31;
      __getRadioRecentStationsControllerClass_block_invoke((uint64_t)&v26);
      v12 = (void *)v32[3];
    }
    v13 = v12;
    _Block_object_dispose(&v31, 8);
    v14 = (RadioRecentStationsController *)objc_alloc_init(v13);
    recentStationsController = v3->_recentStationsController;
    v3->_recentStationsController = v14;

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    v16 = (void *)getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr;
    uint64_t v34 = getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr;
    if (!getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_block_invoke;
      v29 = &unk_1E57FA300;
      v30 = &v31;
      v17 = RadioLibrary();
      v18 = dlsym(v17, "RadioRecentStationsControllerStationsDidChangeNotification");
      *(void *)(v30[1] + 24) = v18;
      getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr = *(void *)(v30[1] + 24);
      v16 = (void *)v32[3];
    }
    _Block_object_dispose(&v31, 8);
    if (v16)
    {
      [v4 addObserver:v3 selector:sel__recentStationsControllerDidChangeStationsNotification_ name:*v16 object:v3->_recentStationsController];
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      v19 = (void *)getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr;
      uint64_t v34 = getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr;
      if (!getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr)
      {
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        v28 = __getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_block_invoke;
        v29 = &unk_1E57FA300;
        v30 = &v31;
        v20 = MediaPlaybackCoreLibrary();
        v21 = dlsym(v20, "MPCJinglePlayActivityReportingControllerDidFlushEventsNotification");
        *(void *)(v30[1] + 24) = v21;
        getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr = *(void *)(v30[1] + 24);
        v19 = (void *)v32[3];
      }
      _Block_object_dispose(&v31, 8);
      if (v19)
      {
        [v4 addObserver:v3 selector:sel__playActivityReportingControllerDidFlushEventsNotification_ name:*v19 object:0];

        return v3;
      }
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [NSString stringWithUTF8String:"NSString *getMPCJinglePlayActivityReportingControllerDidFlushEventsNotification(void)"];
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"MPRemoteRadioController.m", 25, @"%s", dlerror());
    }
    else
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [NSString stringWithUTF8String:"NSString *getRadioRecentStationsControllerStationsDidChangeNotification(void)"];
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"MPRemoteRadioController.m", 33, @"%s", dlerror());
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"NSString *getRadioAvailabilityControllerRadioAvailableDidChangeNotification(void)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"MPRemoteRadioController.m", 32, @"%s", dlerror());
  }

  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentStationsController, 0);
  objc_storeStrong((id *)&self->_availabilityController, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

- (RadioRecentStationsController)recentStationsController
{
  return self->_recentStationsController;
}

- (RadioAvailabilityController)availabilityController
{
  return self->_availabilityController;
}

- (void)_handleRecentStationsControllerDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableSet *)self->_connections copy];
  os_unfair_lock_unlock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "remoteObjectProxy", (void)v11);
        [v10 clientRadioControllerRecentStationsDidChange];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_removeConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_connections removeObject:v5];

  if (![(NSMutableSet *)self->_connections count])
  {
    connections = self->_connections;
    self->_connections = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_addConnection:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  connections = self->_connections;
  if (!connections)
  {
    id v5 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v6 = self->_connections;
    self->_connections = v5;

    connections = self->_connections;
  }
  [(NSMutableSet *)connections addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_playActivityReportingControllerDidFlushEventsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v6 = (void *)getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr;
  uint64_t v14 = getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr;
  if (!getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr)
  {
    id v7 = MediaPlaybackCoreLibrary();
    v12[3] = (uint64_t)dlsym(v7, "MPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEvent");
    getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr = v12[3];
    uint64_t v6 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v6)
  {
    uint64_t v8 = [v5 objectForKey:*v6];

    if (objc_opt_respondsToSelector())
    {
      if ([v8 BOOLValue]) {
        [(MPRemoteRadioController *)self _handleRecentStationsControllerDidChange];
      }
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"NSString *getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEvent(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"MPRemoteRadioController.m", 26, @"%s", dlerror());

    __break(1u);
  }
}

- (void)_radioAvailabilityControllerRadioAvailableDidChangeNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)[(NSMutableSet *)self->_connections copy];
  os_unfair_lock_unlock(p_lock);
  uint64_t v6 = [(RadioAvailabilityController *)self->_availabilityController isRadioAvailable];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "remoteObjectProxy", (void)v13);
        [v12 clientRadioControllerRadioAvailabilityDidChange:v6];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForEntitlement:@"com.apple.mediaplayer.radio.private"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    uint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE70E170];
    [v7 setRemoteObjectInterface:v10];

    [v7 setExportedObject:self];
    uint64_t v11 = MPServiceRadioControllerGetXPCInterface();
    [v7 setExportedInterface:v11];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke;
    v19[3] = &unk_1E57F9228;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    [v7 setInterruptionHandler:v19];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    long long v15 = __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke_12;
    long long v16 = &unk_1E57F9228;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [v7 setInvalidationHandler:&v13];
    -[MPRemoteRadioController _addConnection:](self, "_addConnection:", v7, v13, v14, v15, v16);
    [v7 resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "[MPRemoteRadioController] Connection interrupted.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4) {
      [WeakRetained _removeConnection:v4];
    }
  }
}

void __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke_12(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "[MPRemoteRadioController] Connection invalidated.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4) {
      [WeakRetained _removeConnection:v4];
    }
  }
}

- (void)serviceRadioControllerGetRecentStationGroupsWithCompletionHandler:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_hasRefreshedStations)
  {
    self->_hasRefreshedStations = 1;
    [(RadioRecentStationsController *)self->_recentStationsController refreshWithCompletionHandler:0];
  }
  id v6 = [(RadioRecentStationsController *)self->_recentStationsController stationGroups];
  id v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v20 = v7;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v7;
    uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v24)
    {
      v22 = 0;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v10 = objc_msgSend(v9, "stations", v20);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            id v13 = 0;
            uint64_t v14 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v26 != v14) {
                  objc_enumerationMutation(v10);
                }
                long long v16 = [[MPRadioStation alloc] initWithStation:*(void *)(*((void *)&v25 + 1) + 8 * j)];
                if (v16)
                {
                  if (!v13) {
                    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  [v13 addObject:v16];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v12);
          }
          else
          {
            id v13 = 0;
          }

          if ([v13 count])
          {
            id v17 = objc_alloc_init(MPRadioRecentStationsGroup);
            id v18 = [v9 localizedTitle];
            [(MPRadioRecentStationsGroup *)v17 setLocalizedTitle:v18];

            [(MPRadioRecentStationsGroup *)v17 setStations:v13];
            if (v17)
            {
              v19 = v22;
              if (!v22) {
                v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
              }
              v22 = v19;
              [v19 addObject:v17];
            }
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v24);
    }
    else
    {
      v22 = 0;
    }

    v4[2](v4, v22, 0);
    id v7 = v20;
  }
}

- (void)serviceRadioControllerGetRadioAvailabilityWithCompletionHandler:(id)a3
{
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MPRemoteRadioController;
  [(MPRemoteRadioController *)&v3 dealloc];
}

@end