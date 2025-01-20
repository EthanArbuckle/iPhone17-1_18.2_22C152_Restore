@interface MediaControlsActiveEndpointController
+ (double)mediaRecentlyPlayedTimeout;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)isDeferred;
- (MPCFuture)deferredPlayerPathFuture;
- (MSVPersistentTimer)deferredPlayerPathTimer;
- (MediaControlsActiveEndpointController)initWithActiveEndpointType:(int64_t)a3;
- (NSString)activeEndpointUID;
- (NSString)activeRouteUID;
- (id)_routeForEndpoint:(__MRAVEndpointRef *)a3;
- (id)deferredPlayerPathInvalidationToken;
- (int64_t)endpointType;
- (void)_activeSystemRouteDidChangeWithChangeType:(int64_t)a3;
- (void)_fetchActiveSystemRoute:(id)a3;
- (void)_maybeRestoreDeferredPlayerPath;
- (void)_maybeUpdateActiveSystemRoute;
- (void)_resetDeferredPlayerPath;
- (void)_restoreDeferredPlayerPath;
- (void)_updateActiveSystemRoute;
- (void)activeSystemRouteDidChangeNotification:(id)a3;
- (void)endpointController:(id)a3 willAttemptToConnectToRoute:(id)a4;
- (void)setActiveEndpointUID:(id)a3;
- (void)setDeferredPlayerPathFuture:(id)a3;
- (void)setDeferredPlayerPathInvalidationToken:(id)a3;
- (void)setDeferredPlayerPathTimer:(id)a3;
- (void)setDeviceUnlocked:(BOOL)a3;
- (void)setEndpointType:(int64_t)a3;
- (void)setIsDeferred:(BOOL)a3;
- (void)setOnScreen:(BOOL)a3;
@end

@implementation MediaControlsActiveEndpointController

- (MediaControlsActiveEndpointController)initWithActiveEndpointType:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F31850] systemRoute];
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsActiveEndpointController;
  v6 = [(MediaControlsEndpointController *)&v9 initWithEndpoint:v5];

  if (v6)
  {
    v6->_endpointType = a3;
    [(MediaControlsEndpointController *)v6 setConnectionDelegate:v6];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel_activeSystemRouteDidChangeNotification_ name:*MEMORY[0x1E4F77220] object:0];

    [(MediaControlsActiveEndpointController *)v6 _updateActiveSystemRoute];
  }
  return v6;
}

- (void)setOnScreen:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(MediaControlsEndpointController *)self onScreen] != v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsActiveEndpointController;
    [(MediaControlsEndpointController *)&v5 setOnScreen:v3];
    if ([(MediaControlsActiveEndpointController *)self isDeferred])
    {
      [(MediaControlsActiveEndpointController *)self _maybeRestoreDeferredPlayerPath];
    }
    else if (v3)
    {
      [(MediaControlsActiveEndpointController *)self _maybeUpdateActiveSystemRoute];
    }
  }
}

- (void)setDeviceUnlocked:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(MediaControlsEndpointController *)self deviceUnlocked] != v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsActiveEndpointController;
    [(MediaControlsEndpointController *)&v5 setDeviceUnlocked:v3];
    [(MediaControlsActiveEndpointController *)self _maybeRestoreDeferredPlayerPath];
  }
}

- (void)setActiveEndpointUID:(id)a3
{
  id v4 = a3;
  MRAVEndpointGetLocalEndpoint();
  id v6 = (id)MRAVEndpointCopyUniqueIdentifier();
  if (objc_msgSend(v4, "isEqualToString:"))
  {

    id v4 = 0;
  }
  activeEndpointUID = self->_activeEndpointUID;
  self->_activeEndpointUID = (NSString *)v4;
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v4 = a4;
  objc_super v5 = [v4 domain];
  BOOL v6 = v5 != (void *)*MEMORY[0x1E4F31230];
  if (v5 == (void *)*MEMORY[0x1E4F31230])
  {
    uint64_t v7 = [v4 code];

    if (v7 != 2)
    {
      BOOL v6 = 1;
      goto LABEL_6;
    }
    v8 = (void *)MEMORY[0x1E4F31850];
    objc_super v5 = [MEMORY[0x1E4F31850] systemRoute];
    [v8 setActiveRoute:v5 reason:@"invalid route error" completion:0];
  }

LABEL_6:
  return v6;
}

- (void)endpointController:(id)a3 willAttemptToConnectToRoute:(id)a4
{
  id v6 = a4;
  if ([(MediaControlsActiveEndpointController *)self endpointType] == 1)
  {
    objc_super v5 = [v6 connection];
    [v5 reset];
  }
}

- (void)activeSystemRouteDidChangeNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F77210]];
  uint64_t v7 = (int)[v6 intValue];

  v8 = MCLogCategoryRouting();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    uint64_t active = MRMediaRemoteActiveEndpointTypeCopyDescription();
    _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ activeSystemRouteDidChangeNotification] with type %{public}@", (uint8_t *)&v12, 0x16u);
  }

  if ([(MediaControlsActiveEndpointController *)self endpointType] == v7)
  {
    objc_super v9 = [v4 userInfo];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F77208]];
    uint64_t v11 = (int)[v10 intValue];

    [(MediaControlsActiveEndpointController *)self _activeSystemRouteDidChangeWithChangeType:v11];
  }
}

- (id)_routeForEndpoint:(__MRAVEndpointRef *)a3
{
  uint64_t ExternalDevice = MRAVEndpointGetExternalDevice();
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F31818]) initWithEndpoint:a3];
  if (ExternalDevice)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F31848]) initWithExternalDevice:ExternalDevice];
    [v5 setConnection:v6];
  }

  return v5;
}

- (void)_resetDeferredPlayerPath
{
  [(MediaControlsActiveEndpointController *)self setIsDeferred:0];
  [(MediaControlsActiveEndpointController *)self setActiveEndpointUID:0];
  [(MediaControlsActiveEndpointController *)self setDeferredPlayerPathFuture:0];
  [(MediaControlsActiveEndpointController *)self setDeferredPlayerPathInvalidationToken:0];

  [(MediaControlsActiveEndpointController *)self setDeferredPlayerPathTimer:0];
}

- (void)_restoreDeferredPlayerPath
{
  [(MediaControlsActiveEndpointController *)self _resetDeferredPlayerPath];

  [(MediaControlsActiveEndpointController *)self _updateActiveSystemRoute];
}

- (void)_maybeRestoreDeferredPlayerPath
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(MediaControlsActiveEndpointController *)self isDeferred])
  {
    BOOL v3 = [(MediaControlsActiveEndpointController *)self deferredPlayerPathFuture];

    id v4 = [(MediaControlsActiveEndpointController *)self activeEndpointUID];
    if (v4 && [(MediaControlsEndpointController *)self deviceUnlocked]) {
      int v5 = ![(MediaControlsEndpointController *)self onScreen];
    }
    else {
      int v5 = 0;
    }
    int v6 = v3 ? v5 : 1;

    uint64_t v7 = [(MediaControlsActiveEndpointController *)self deferredPlayerPathTimer];
    int v8 = !v7 && ![(MediaControlsEndpointController *)self onScreen];
    int v9 = v6 | v8;

    if (v9)
    {
      v10 = MCLogCategoryRouting();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v21 = NSStringFromSelector(sel_activeEndpointUID);
        uint64_t v11 = [(MediaControlsActiveEndpointController *)self activeEndpointUID];
        int v12 = NSStringFromSelector(sel_deferredPlayerPathFuture);
        v20 = [(MediaControlsActiveEndpointController *)self deferredPlayerPathFuture];
        v19 = [v20 result];
        v13 = NSStringFromSelector(sel_deferredPlayerPathTimer);
        v18 = [(MediaControlsActiveEndpointController *)self deferredPlayerPathTimer];
        __int16 v14 = NSStringFromSelector(sel_onScreen);
        if ([(MediaControlsEndpointController *)self onScreen]) {
          v15 = @"YES";
        }
        else {
          v15 = @"NO";
        }
        uint64_t v16 = NSStringFromSelector(sel_deviceUnlocked);
        *(_DWORD *)buf = 138414594;
        if ([(MediaControlsEndpointController *)self deviceUnlocked]) {
          v17 = @"YES";
        }
        else {
          v17 = @"NO";
        }
        v23 = v21;
        __int16 v24 = 2112;
        v25 = v11;
        __int16 v26 = 2112;
        v27 = v12;
        __int16 v28 = 2112;
        v29 = v19;
        __int16 v30 = 2112;
        v31 = v13;
        __int16 v32 = 2112;
        v33 = v18;
        __int16 v34 = 2112;
        v35 = v14;
        __int16 v36 = 2112;
        v37 = v15;
        __int16 v38 = 2112;
        v39 = v16;
        __int16 v40 = 2112;
        v41 = v17;
        _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_ERROR, "Restoring deferredPlayerPath because %@=%@, %@=%@, %@=%@, %@=%@, %@=%@", buf, 0x66u);
      }
      [(MediaControlsActiveEndpointController *)self _restoreDeferredPlayerPath];
    }
  }
}

- (void)_updateActiveSystemRoute
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MCLogCategoryRouting();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@ _updateActiveSystemRoute]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__MediaControlsActiveEndpointController__updateActiveSystemRoute__block_invoke;
  v4[3] = &unk_1E5F0D988;
  objc_copyWeak(&v5, (id *)buf);
  v4[4] = self;
  [(MediaControlsActiveEndpointController *)self _fetchActiveSystemRoute:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __65__MediaControlsActiveEndpointController__updateActiveSystemRoute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _resetDeferredPlayerPath];
    int v6 = objc_msgSend(v5, "_routeForEndpoint:", objc_msgSend(v3, "unwrappedValue"));
    id v7 = [v6 endpointWrapper];
    [v7 unwrappedValue];
    uint64_t v8 = (void *)MRAVEndpointCopyUniqueIdentifier();

    int v9 = [*(id *)(a1 + 32) route];
    id v10 = [v9 endpointWrapper];
    [v10 unwrappedValue];
    uint64_t v11 = (void *)MRAVEndpointCopyUniqueIdentifier();

    if (v8 == v11) {
      int v12 = 1;
    }
    else {
      int v12 = [v8 isEqual:v11];
    }
    v13 = [*(id *)(a1 + 32) route];
    __int16 v14 = [v13 connection];
    int v15 = [v14 isInvalidated];

    if (!v12 || v15)
    {
      [v5 setRoute:v6];
      [v5 updateRoutePropertiesIfNeeded];
      if ((v12 & 1) == 0)
      {
        uint64_t v16 = MCLogCategoryRouting();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v18 = 138543874;
          uint64_t v19 = v17;
          __int16 v20 = 2112;
          v21 = v11;
          __int16 v22 = 2114;
          v23 = v8;
          _os_log_impl(&dword_1AE7DF000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@ _updateActiveSystemRoute] route update from %{@public}@ to %{public}@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
  }
}

- (void)_maybeUpdateActiveSystemRoute
{
  id v3 = [(MediaControlsEndpointController *)self route];
  [(MediaControlsActiveEndpointController *)self endpointType];
  id v4 = v3;
  MRAVEndpointGetActiveSystemEndpointUID();
}

void __70__MediaControlsActiveEndpointController__maybeUpdateActiveSystemRoute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) endpoint];
  id v4 = (void *)MRAVEndpointCopyOutputDevices();
  if (!v3 && ([*(id *)(a1 + 32) isDeviceRoute] & 1) != 0)
  {
LABEL_13:
    int v12 = [*(id *)(a1 + 40) route];
    v13 = [v12 connection];
    char v14 = [v13 isInvalidated];

    if ((v14 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
          char v11 = objc_msgSend(v3, "isEqualToString:", v10, v17);

          if (v11)
          {

            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  int v15 = MCLogCategoryRouting();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@ _maybeUpdateActiveSystemRoute] triggering route update", buf, 0xCu);
  }

  [*(id *)(a1 + 40) _updateActiveSystemRoute];
LABEL_17:
}

- (void)_fetchActiveSystemRoute:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MCLogCategoryRouting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ _fetchActiveSystemRoute]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  [(MediaControlsActiveEndpointController *)self endpointType];
  id v6 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v8, (id *)buf);
  id v7 = v4;
  MRAVEndpointResolveActiveSystemEndpointWithType();

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __65__MediaControlsActiveEndpointController__fetchActiveSystemRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = (void *)MRAVEndpointCopyUniqueIdentifier();
    [WeakRetained setActiveEndpointUID:v5];
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = MCLogCategoryRouting();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = a2;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ _fetchActiveSystemRoute] completing with endpoint %{public}@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (a2)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F318E0]) initWithMRAVEndpoint:a2];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

- (void)_activeSystemRouteDidChangeWithChangeType:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = MCLogCategoryRouting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v10 = self;
    __int16 v11 = 2114;
    uint64_t v12 = MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ _activeSystemRouteDidChangeWithChangeType] with type %{public}@", buf, 0x16u);
  }

  if (a3 == 1 && [(MediaControlsEndpointController *)self onScreen])
  {
    id v6 = MCLogCategoryRouting();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v10 = self;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ _activeSystemRouteDidChangeWithChangeType] deferring update", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke;
    v8[3] = &unk_1E5F0DA50;
    v8[4] = self;
    [(MediaControlsActiveEndpointController *)self _fetchActiveSystemRoute:v8];
  }
  else
  {
    uint64_t v7 = MCLogCategoryRouting();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v10 = self;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ _activeSystemRouteDidChangeWithChangeType] updating route immediately", buf, 0xCu);
    }

    [(MediaControlsActiveEndpointController *)self _updateActiveSystemRoute];
  }
}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F76EA8] sharedCache];
  id v5 = [*(id *)(a1 + 32) playerPath];
  id v6 = [v4 resolvedPlayerPathForPlayerPath:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_2;
  v9[3] = &unk_1E5F0DA28;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v6 onCompletion:v9];
}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 _updateActiveSystemRoute];
  }
  else
  {
    [v7 setIsDeferred:1];
    id v8 = [MEMORY[0x1E4F76EA8] sharedCache];
    uint64_t v9 = [v8 resolvedPlayerPathForPlayerPath:v5];
    [*(id *)(a1 + 32) setDeferredPlayerPathFuture:v9];

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v10 = *(void **)(*(void *)(a1 + 32) + 120);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_3;
    v24[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v25, &location);
    __int16 v11 = [v10 onInvalid:v24];
    [*(id *)(a1 + 32) setDeferredPlayerPathInvalidationToken:v11];

    +[MediaControlsActiveEndpointController mediaRecentlyPlayedTimeout];
    double v13 = v12;
    uint64_t v14 = [*(id *)(a1 + 32) route];
    [v14 endpoint];
    int v15 = (void *)MRAVEndpointCopyLocalizedName();

    [*(id *)(a1 + 40) unwrappedValue];
    uint64_t v16 = (void *)MRAVEndpointCopyLocalizedName();
    long long v17 = (void *)[[NSString alloc] initWithFormat:@"deferredplayerPathTimer: Remaining at %@ instead of changing to %@", v15, v16];
    id v18 = objc_alloc(MEMORY[0x1E4F779E0]);
    uint64_t v19 = MEMORY[0x1E4F14428];
    id v20 = MEMORY[0x1E4F14428];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_4;
    v22[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v23, &location);
    v21 = (void *)[v18 initWithInterval:v17 name:v19 queue:v22 block:v13];
    [*(id *)(a1 + 32) setDeferredPlayerPathTimer:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setDeferredPlayerPathFuture:0];
    [v2 setDeferredPlayerPathInvalidationToken:0];
    [v2 _maybeRestoreDeferredPlayerPath];
    id WeakRetained = v2;
  }
}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setDeferredPlayerPathTimer:0];
    [v2 _maybeRestoreDeferredPlayerPath];
    id WeakRetained = v2;
  }
}

+ (double)mediaRecentlyPlayedTimeout
{
  if (mediaRecentlyPlayedTimeout_once != -1) {
    dispatch_once(&mediaRecentlyPlayedTimeout_once, &__block_literal_global_2);
  }
  return *(double *)&mediaRecentlyPlayedTimeout_timeout;
}

void __67__MediaControlsActiveEndpointController_mediaRecentlyPlayedTimeout__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mediaremote"];
  v0 = [v2 objectForKey:@"MediaRecentlyPlayedInterval"];

  if (v0)
  {
    [v2 doubleForKey:@"MediaRecentlyPlayedInterval"];
    mediaRecentlyPlayedTimeout_timeout = v1;
  }
}

- (int64_t)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int64_t)a3
{
  self->_endpointType = a3;
}

- (NSString)activeRouteUID
{
  return self->_activeRouteUID;
}

- (MPCFuture)deferredPlayerPathFuture
{
  return self->_deferredPlayerPathFuture;
}

- (void)setDeferredPlayerPathFuture:(id)a3
{
}

- (id)deferredPlayerPathInvalidationToken
{
  return self->_deferredPlayerPathInvalidationToken;
}

- (void)setDeferredPlayerPathInvalidationToken:(id)a3
{
}

- (MSVPersistentTimer)deferredPlayerPathTimer
{
  return self->_deferredPlayerPathTimer;
}

- (void)setDeferredPlayerPathTimer:(id)a3
{
}

- (NSString)activeEndpointUID
{
  return self->_activeEndpointUID;
}

- (BOOL)isDeferred
{
  return self->_isDeferred;
}

- (void)setIsDeferred:(BOOL)a3
{
  self->_isDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeEndpointUID, 0);
  objc_storeStrong((id *)&self->_deferredPlayerPathTimer, 0);
  objc_storeStrong(&self->_deferredPlayerPathInvalidationToken, 0);
  objc_storeStrong((id *)&self->_deferredPlayerPathFuture, 0);

  objc_storeStrong((id *)&self->_activeRouteUID, 0);
}

@end