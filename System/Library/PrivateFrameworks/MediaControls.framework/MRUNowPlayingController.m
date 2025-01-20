@interface MRUNowPlayingController
- (MRUEndpointController)endpointController;
- (MRUMRMetadataDataSource)handoffDataSource;
- (MRUMediaSuggestionsController)mediaSuggestionsController;
- (MRUMetadataController)metadataController;
- (MRUMetadataDataSource)metadataDataSource;
- (MRUNowPlayingController)initWithEndpointController:(id)a3;
- (MRUNowPlayingQueueHandoffCoordinator)queueHandoffCoordinator;
- (MRUTVRemoteController)tvRemoteController;
- (MRUTransportControlItem)quickControlItem;
- (NSHashTable)observers;
- (NSString)description;
- (NSString)identifier;
- (NSString)nowPlayingInfoIdentifier;
- (id)deviceSymbolName;
- (id)outputDevicesSymbolName;
- (void)addObserver:(id)a3;
- (void)endpointController:(id)a3 didChangeRoute:(id)a4;
- (void)imageForRoute:(id)a3 completion:(id)a4;
- (void)mediaSuggestionsController:(id)a3 didChangeMediaSuggestions:(id)a4;
- (void)metadataController:(id)a3 didChangeArtwork:(id)a4;
- (void)metadataController:(id)a3 didChangeBundleID:(id)a4;
- (void)metadataController:(id)a3 didChangeNowPlayingInfo:(id)a4;
- (void)metadataController:(id)a3 didChangeTimeControls:(id)a4;
- (void)metadataController:(id)a3 didChangeTransportControls:(id)a4;
- (void)queueHandoffCoordinator:(id)a3 didChangeResponse:(id)a4;
- (void)queueHandoffCoordinator:(id)a3 didChangeState:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)routingDeviceImage:(id)a3;
- (void)setHandoffDataSource:(id)a3;
- (void)setMetadataDataSource:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueueHandoffCoordinator:(id)a3;
- (void)tvRemoteController:(id)a3 didChangeShowTVRemote:(BOOL)a4;
- (void)updateAutomaticResponseLoading;
- (void)updateQuickTransportItem;
@end

@implementation MRUNowPlayingController

- (MRUNowPlayingController)initWithEndpointController:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUNowPlayingController;
  v6 = [(MRUNowPlayingController *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_endpointController, a3);
    [(MRUEndpointController *)v6->_endpointController addObserver:v6];
    v9 = [[MRUTVRemoteController alloc] initWithEndpointController:v5];
    tvRemoteController = v6->_tvRemoteController;
    v6->_tvRemoteController = v9;

    [(MRUTVRemoteController *)v6->_tvRemoteController setDelegate:v6];
    v11 = [[MRUMPCMetadataDataSource alloc] initWithEndpointController:v5];
    metadataDataSource = v6->_metadataDataSource;
    v6->_metadataDataSource = (MRUMetadataDataSource *)v11;

    v13 = [[MRUMetadataController alloc] initWithDataSource:v6->_metadataDataSource];
    metadataController = v6->_metadataController;
    v6->_metadataController = v13;

    [(MRUMetadataController *)v6->_metadataController addObserver:v6];
  }

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRUEndpointController *)self->_endpointController route];
  v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)identifier
{
  return [(MRUEndpointController *)self->_endpointController routeUID];
}

- (NSString)nowPlayingInfoIdentifier
{
  v3 = [(MRUNowPlayingController *)self identifier];
  uint64_t v4 = [(MRUNowPlayingController *)self metadataController];
  id v5 = [v4 nowPlayingInfo];
  v6 = [v5 identifier];
  uint64_t v7 = [v3 stringByAppendingFormat:@"|%@", v6];

  return (NSString *)v7;
}

- (void)setQueueHandoffCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_queueHandoffCoordinator, a3);
  id v5 = a3;
  [(MRUNowPlayingQueueHandoffCoordinator *)self->_queueHandoffCoordinator setDelegate:self];
}

- (MRUMediaSuggestionsController)mediaSuggestionsController
{
  mediaSuggestionsController = self->_mediaSuggestionsController;
  if (!mediaSuggestionsController)
  {
    BOOL v4 = +[MRUFeatureFlagProvider isMediaSuggestionsPushEnabled];
    id v5 = off_1E5F0CE90;
    if (!v4) {
      id v5 = off_1E5F0CE88;
    }
    id v6 = objc_alloc_init(*v5);
    uint64_t v7 = [MRUMediaSuggestionsController alloc];
    v8 = [(MRUNowPlayingController *)self endpointController];
    v9 = [(MRUNowPlayingController *)self metadataController];
    v10 = [(MRUMediaSuggestionsController *)v7 initWithEndpointController:v8 metadataController:v9 dataSource:v6];
    v11 = self->_mediaSuggestionsController;
    self->_mediaSuggestionsController = v10;

    [(MRUMediaSuggestionsController *)self->_mediaSuggestionsController setDelegate:self];
    mediaSuggestionsController = self->_mediaSuggestionsController;
  }

  return mediaSuggestionsController;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable addObject:](self->_observers, "addObject:");
    [(MRUNowPlayingController *)self updateAutomaticResponseLoading];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
    [(MRUNowPlayingController *)self updateAutomaticResponseLoading];
  }
}

- (void)updateAutomaticResponseLoading
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v6 |= [v9 nowPlayingControllerShouldAutomaticallyUpdateResponse:self];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  v10 = [(MRUEndpointController *)self->_endpointController endpointController];
  [v10 setAllowsAutomaticResponseLoading:v6 & 1];
  [v10 setOnScreen:v6 & 1];
  [v10 setDeviceUnlocked:v6 & 1];
  v11 = [v10 proxyDelegate];
  v12 = v11;
  if (v6) {
    [v11 beginObserving];
  }
  else {
    [v11 endObserving];
  }
}

- (id)deviceSymbolName
{
  v3 = [(MRUEndpointController *)self->_endpointController route];
  if (v3 && [(MRUEndpointController *)self->_endpointController isDeviceSystemRoute])
  {
    uint64_t v4 = [MEMORY[0x1E4F31850] _currentDeviceRoutingSymbolName];
  }
  else
  {
    uint64_t v4 = [(MRUNowPlayingController *)self outputDevicesSymbolName];
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

- (id)outputDevicesSymbolName
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v2 = [(MRUEndpointController *)self->_endpointController route];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 endpointObject];
    uint64_t v4 = [v3 predictedOutputDevice];
  }
  else
  {
    v3 = 0;
    uint64_t v4 = 0;
  }
  if ([v2 isSplitRoute])
  {
    uint64_t v5 = @"person.2.fill";
  }
  else
  {
    int v6 = [v2 isDeviceSpeakerRoute] ^ 1;
    if (v4) {
      int v6 = 1;
    }
    if (v6 != 1 || v3 == 0)
    {
      uint64_t v5 = @"airplayaudio";
    }
    else
    {
      v8 = [v3 outputDevices];
      v23 = v3;
      if (v4)
      {
        v34[0] = v4;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];

        v8 = (void *)v9;
      }
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            id v17 = objc_alloc(MEMORY[0x1E4F31830]);
            uint64_t v32 = v16;
            uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
            v19 = (void *)[v17 initWithOutputDevices:v18];
            [v10 addObject:v19];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v13);
      }

      v20 = MCLogCategoryDefault();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v21;
        __int16 v30 = 2114;
        v31 = v10;
        _os_log_impl(&dword_1AE7DF000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ imageForRoute routes: %{public}@", buf, 0x16u);
      }

      uint64_t v5 = [MEMORY[0x1E4F31850] _symbolNameForRoutes:v10];

      v3 = v23;
    }
  }

  return v5;
}

- (void)imageForRoute:(id)a3 completion:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 endpointObject];
    uint64_t v9 = [v8 predictedOutputDevice];
  }
  else
  {
    v8 = 0;
    uint64_t v9 = 0;
  }
  if ([v6 isSplitRoute])
  {
    uint64_t v10 = +[MRUAssetsProvider wirelessSharing];
LABEL_6:
    id v11 = (void *)v10;
    v7[2](v7, v10);

    goto LABEL_25;
  }
  int v12 = [v6 isDeviceSpeakerRoute] ^ 1;
  if (v9) {
    int v12 = 1;
  }
  if (v12 != 1 || !v8)
  {
    v28 = [(MRUMetadataController *)self->_metadataController bundleID];

    if (v28)
    {
      metadataController = self->_metadataController;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __52__MRUNowPlayingController_imageForRoute_completion___block_invoke;
      v36[3] = &unk_1E5F0E5C0;
      v36[4] = self;
      v37 = v7;
      [(MRUMetadataController *)metadataController representsLongFormVideoContentWithCompletion:v36];

      goto LABEL_25;
    }
    uint64_t v10 = +[MRUAssetsProvider airplay];
    goto LABEL_6;
  }
  uint64_t v13 = [v8 outputDevices];
  v31 = v7;
  __int16 v30 = v9;
  if (v9)
  {
    v44[0] = v9;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];

    uint64_t v13 = (void *)v14;
  }
  long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = v13;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v22 = objc_alloc(MEMORY[0x1E4F31830]);
        uint64_t v42 = v21;
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        long long v24 = (void *)[v22 initWithOutputDevices:v23];
        [v15 addObject:v24];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v18);
  }

  long long v25 = MCLogCategoryDefault();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = v26;
    __int16 v40 = 2114;
    v41 = v15;
    _os_log_impl(&dword_1AE7DF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ imageForRoute routes: %{public}@", buf, 0x16u);
  }

  long long v27 = [MEMORY[0x1E4F31850] _symbolImageForRoutes:v15];
  uint64_t v7 = v31;
  v31[2](v31, (uint64_t)v27);

  uint64_t v9 = v30;
LABEL_25:
}

void __52__MRUNowPlayingController_imageForRoute_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ imageForRoute representsLongFormVideoContent: %d", (uint8_t *)&v7, 0x12u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (a2) {
    +[MRUAssetsProvider airplayVideo];
  }
  else {
  id v6 = +[MRUAssetsProvider airplay];
  }
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)routingDeviceImage:(id)a3
{
  endpointController = self->_endpointController;
  id v5 = a3;
  id v6 = [(MRUEndpointController *)endpointController route];
  [(MRUNowPlayingController *)self imageForRoute:v6 completion:v5];
}

- (void)endpointController:(id)a3 didChangeRoute:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 nowPlayingController:self endpointController:v6 didChangeRoute:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)tvRemoteController:(id)a3 didChangeShowTVRemote:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 nowPlayingController:self tvRemoteController:v6 didChangeShowTVRemote:v4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if (v4)
  {
    uint64_t v13 = [(MRUEndpointController *)self->_endpointController endpointController];
    int v14 = [v13 allowsAutomaticResponseLoading];

    if (v14) {
      [v6 prewarmIfNeeded];
    }
  }
  [(MRUNowPlayingController *)self updateQuickTransportItem];
}

- (void)metadataController:(id)a3 didChangeBundleID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 nowPlayingController:self metadataController:v6 didChangeBundleID:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)metadataController:(id)a3 didChangeArtwork:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 nowPlayingController:self metadataController:v6 didChangeArtwork:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)metadataController:(id)a3 didChangeNowPlayingInfo:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 nowPlayingController:self metadataController:v6 didChangeNowPlayingInfo:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(MRUNowPlayingController *)self updateQuickTransportItem];
}

- (void)metadataController:(id)a3 didChangeTimeControls:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 nowPlayingController:self metadataController:v6 didChangeTimeControls:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)metadataController:(id)a3 didChangeTransportControls:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 nowPlayingController:self metadataController:v6 didChangeTransportControls:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(MRUNowPlayingController *)self updateQuickTransportItem];
}

- (void)mediaSuggestionsController:(id)a3 didChangeMediaSuggestions:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 nowPlayingController:self mediaSuggestionsController:v6 didChangeMediaSuggestions:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)queueHandoffCoordinator:(id)a3 didChangeState:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 4)
  {
    queueHandoffCoordinator = self->_queueHandoffCoordinator;
    self->_queueHandoffCoordinator = 0;

    handoffDataSource = self->_handoffDataSource;
    self->_handoffDataSource = 0;

    uint64_t v14 = 0;
    p_metadataDataSource = &self->_metadataDataSource;
LABEL_6:
    [(MRUMetadataController *)self->_metadataController setDataSource:*p_metadataDataSource];
    goto LABEL_7;
  }
  if (a4 != 1) {
    goto LABEL_8;
  }
  id v7 = [MRUMRMetadataDataSource alloc];
  endpointController = self->_endpointController;
  uint64_t v9 = [v6 response];
  uint64_t v10 = [(MRUMRMetadataDataSource *)v7 initWithEndpointController:endpointController response:v9];
  p_metadataDataSource = &self->_handoffDataSource;
  uint64_t v11 = self->_handoffDataSource;
  self->_handoffDataSource = v10;

  uint64_t v13 = [v6 response];

  uint64_t v14 = 1;
  if (v13) {
    goto LABEL_6;
  }
LABEL_7:
  [(MRUMediaSuggestionsController *)self->_mediaSuggestionsController setIsQueueHandoffActive:v14];
LABEL_8:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v17 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v23 + 1) + 8 * v21);
        if (objc_opt_respondsToSelector()) {
          [v22 nowPlayingController:self queueHandoffCoordinator:v6 didChangeState:a4];
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }
}

- (void)queueHandoffCoordinator:(id)a3 didChangeResponse:(id)a4
{
  id v6 = [a3 response];
  [(MRUMRMetadataDataSource *)self->_handoffDataSource setResponse:v6];

  uint64_t v7 = 64;
  if (!a4) {
    uint64_t v7 = 72;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + v7);
  metadataController = self->_metadataController;

  [(MRUMetadataController *)metadataController setDataSource:v8];
}

- (void)updateQuickTransportItem
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(MRUMetadataController *)self->_metadataController nowPlayingInfo];
  BOOL v4 = [(MRUNowPlayingController *)self tvRemoteController];
  objc_initWeak(&location, v4);

  if ([(MRUEndpointController *)self->_endpointController state] == 3
    && ([v3 showPlaceholder] & 1) == 0)
  {
    id v6 = [(MRUMetadataController *)self->_metadataController transportControls];
    uint64_t v8 = [v6 centerItem];
  }
  else
  {
    if (![(MRUTVRemoteController *)self->_tvRemoteController showTVRemote]
      || ![v3 showPlaceholder])
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    id v5 = +[MRUAssetsProvider tvRemote];
    id v6 = +[MRUAsset image:v5];

    uint64_t v7 = [MRUTransportControlItem alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__MRUNowPlayingController_updateQuickTransportItem__block_invoke;
    v20[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v21, &location);
    uint64_t v8 = [(MRUTransportControlItem *)v7 initWithIdentifier:@"tvremote" asset:v6 mainAction:v20];
    objc_destroyWeak(&v21);
  }

LABEL_9:
  objc_storeStrong((id *)&self->_quickControlItem, v8);
  uint64_t v9 = MCLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v10;
    __int16 v26 = 2114;
    long long v27 = v8;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update quick transport controls: %{public}@", buf, 0x16u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 nowPlayingController:self didChangeQuickControlItem:v8];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v12);
  }

  objc_destroyWeak(&location);
}

void __51__MRUNowPlayingController_updateQuickTransportItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentTVRemoteUsingApp:0];
}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MRUTVRemoteController)tvRemoteController
{
  return self->_tvRemoteController;
}

- (MRUMetadataController)metadataController
{
  return self->_metadataController;
}

- (MRUNowPlayingQueueHandoffCoordinator)queueHandoffCoordinator
{
  return self->_queueHandoffCoordinator;
}

- (MRUTransportControlItem)quickControlItem
{
  return self->_quickControlItem;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MRUMRMetadataDataSource)handoffDataSource
{
  return self->_handoffDataSource;
}

- (void)setHandoffDataSource:(id)a3
{
}

- (MRUMetadataDataSource)metadataDataSource
{
  return self->_metadataDataSource;
}

- (void)setMetadataDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDataSource, 0);
  objc_storeStrong((id *)&self->_handoffDataSource, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_quickControlItem, 0);
  objc_storeStrong((id *)&self->_queueHandoffCoordinator, 0);
  objc_storeStrong((id *)&self->_metadataController, 0);
  objc_storeStrong((id *)&self->_tvRemoteController, 0);
  objc_storeStrong((id *)&self->_endpointController, 0);

  objc_storeStrong((id *)&self->_mediaSuggestionsController, 0);
}

@end