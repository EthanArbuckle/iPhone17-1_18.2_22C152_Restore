@interface MediaControlsEndpointController
- (BOOL)allowsAutomaticResponseLoading;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)deviceUnlocked;
- (BOOL)hasAvailableRoutes;
- (BOOL)hasEverReceivedResponse;
- (BOOL)isAirPlaying;
- (BOOL)isAttemptingConnection;
- (BOOL)isAutomaticResponseLoading;
- (BOOL)isDeviceSystemRoute;
- (BOOL)isRoutingToWireless;
- (BOOL)onScreen;
- (MPAVEndpointRoute)route;
- (MPCPlayerPath)playerPath;
- (MPCPlayerResponse)response;
- (MPMediaControlsConfiguration)configuration;
- (MPRequestResponseController)requestController;
- (MediaControlsEndpointController)initWithEndpoint:(id)a3;
- (MediaControlsEndpointController)initWithEndpoint:(id)a3 client:(id)a4 player:(id)a5;
- (MediaControlsEndpointControllerConnectionDelegate)connectionDelegate;
- (MediaControlsEndpointControllerDelegate)delegate;
- (MediaControlsEndpointObserverDelegate)proxyDelegate;
- (NSArray)routeNames;
- (NSString)bundleID;
- (NSString)description;
- (NSString)label;
- (NSString)predictedDeviceUID;
- (NSString)representedBundleID;
- (NSString)specifiedClient;
- (NSString)specifiedPlayer;
- (id)_stateDumpObject;
- (int64_t)state;
- (void)_connectIfNeeded;
- (void)_connectionDidAttemptConnection:(id)a3;
- (void)_connectionDidConnect:(id)a3;
- (void)_connectionDidInvalidate:(id)a3;
- (void)_connectionHasBecomeInvalid;
- (void)_createRequestController;
- (void)_getConnected:(BOOL *)a3 connecting:(BOOL *)a4 invalid:(BOOL *)a5;
- (void)_getConnected:(BOOL *)a3 invalid:(BOOL *)a4;
- (void)_maybeReloadPlayerPathWithRoute:(id)a3;
- (void)_reloadPlayerPathWithRoute:(id)a3;
- (void)_routeDidChange:(id)a3;
- (void)_updateState;
- (void)connectAllowingAuthenticationWithCompletion:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)launchNowPlayingApp;
- (void)representsLongFormVideoContentWithCompletion:(id)a3;
- (void)setAllowsAutomaticResponseLoading:(BOOL)a3;
- (void)setAttemptingConnection:(BOOL)a3;
- (void)setAutomaticResponseLoading:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnectionDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUnlocked:(BOOL)a3;
- (void)setHasEverReceivedResponse:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setProxyDelegate:(id)a3;
- (void)setRoute:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateRoutePropertiesIfNeeded;
@end

@implementation MediaControlsEndpointController

- (MediaControlsEndpointController)initWithEndpoint:(id)a3 client:(id)a4 player:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsEndpointController;
  v11 = [(MediaControlsEndpointController *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    specifiedClient = v11->_specifiedClient;
    v11->_specifiedClient = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    specifiedPlayer = v11->_specifiedPlayer;
    v11->_specifiedPlayer = (NSString *)v14;

    [(MediaControlsEndpointController *)v11 _createRequestController];
    [(MediaControlsEndpointController *)v11 _maybeReloadPlayerPathWithRoute:v8];
  }

  return v11;
}

- (MediaControlsEndpointController)initWithEndpoint:(id)a3
{
  return [(MediaControlsEndpointController *)self initWithEndpoint:a3 client:0 player:0];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MediaControlsEndpointController *)self route];
  v7 = [v6 routeName];
  id v8 = [(MediaControlsEndpointController *)self label];
  id v9 = [v3 stringWithFormat:@"<%@:%p route: (%@) %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (NSString)bundleID
{
  v3 = [(MediaControlsEndpointController *)self playerPath];
  v4 = [v3 bundleID];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(MediaControlsEndpointController *)self response];
    id v8 = [v7 playerPath];
    id v6 = [v8 bundleID];
  }

  return (NSString *)v6;
}

- (NSString)representedBundleID
{
  v3 = [(MediaControlsEndpointController *)self playerPath];
  v4 = [v3 representedBundleID];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(MediaControlsEndpointController *)self response];
    id v8 = [v7 playerPath];
    id v6 = [v8 representedBundleID];
  }

  return (NSString *)v6;
}

- (MPCPlayerPath)playerPath
{
  v2 = [(MPRequestResponseController *)self->_requestController request];
  v3 = [v2 playerPath];

  return (MPCPlayerPath *)v3;
}

- (MPAVEndpointRoute)route
{
  v2 = [(MediaControlsEndpointController *)self playerPath];
  v3 = [v2 route];

  return (MPAVEndpointRoute *)v3;
}

- (BOOL)isAirPlaying
{
  BOOL v3 = [(MediaControlsEndpointController *)self isDeviceSystemRoute];
  if (v3)
  {
    v4 = [(MediaControlsEndpointController *)self route];
    char v5 = [v4 isAirPlayingToDevice];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isDeviceSystemRoute
{
  v2 = [(MediaControlsEndpointController *)self route];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 isDeviceRoute];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isRoutingToWireless
{
  v2 = [(MediaControlsEndpointController *)self route];
  char v3 = [v2 isRoutingToWirelessDevice];

  return v3;
}

- (MPCPlayerResponse)response
{
  char v5 = 0;
  [(MediaControlsEndpointController *)self _getConnected:&v5 invalid:0];
  if (v5)
  {
    char v3 = [(MPRequestResponseController *)self->_requestController response];
  }
  else
  {
    char v3 = 0;
  }

  return (MPCPlayerResponse *)v3;
}

- (void)setAllowsAutomaticResponseLoading:(BOOL)a3
{
  if (self->_allowsAutomaticResponseLoading != a3)
  {
    self->_allowsAutomaticResponseLoading = a3;
    [(MediaControlsEndpointController *)self _updateState];
    [(MediaControlsEndpointController *)self _connectIfNeeded];
  }
}

- (void)setRoute:(id)a3
{
  id v6 = a3;
  id v4 = [(MediaControlsEndpointController *)self route];

  char v5 = v6;
  if (v4 != v6)
  {
    [(MediaControlsEndpointController *)self _maybeReloadPlayerPathWithRoute:v6];
    char v5 = v6;
  }
}

- (void)representsLongFormVideoContentWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = dispatch_get_global_queue(2, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke;
  v7[3] = &unk_1E5F0E428;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F31850];
  char v3 = [*(id *)(a1 + 32) bundleID];
  if ([v2 bundleIdRepresentsLongFormVideoContent:v3])
  {
    char v4 = 1;
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F31850];
    id v6 = [*(id *)(a1 + 32) representedBundleID];
    char v4 = [v5 bundleIdRepresentsLongFormVideoContent:v6];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5F0E830;
  id v8 = *(id *)(a1 + 40);
  char v9 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)connectAllowingAuthenticationWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(MediaControlsEndpointController *)self connectionDelegate];
  id v6 = [(MediaControlsEndpointController *)self route];
  [v5 endpointController:self willAttemptToConnectToRoute:v6];

  v7 = [(MediaControlsEndpointController *)self route];
  id v8 = [v7 connection];

  if (v8)
  {
    if ([v8 isInvalidated]) {
      [v8 reset];
    }
    [(MediaControlsEndpointController *)self setAttemptingConnection:1];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v8);
    char v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];

    v11 = MCLogCategoryRouting();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(MediaControlsEndpointController *)self route];
      id v13 = [v12 routeName];
      uint64_t v14 = [(MediaControlsEndpointController *)self delegate];
      *(_DWORD *)buf = 134218754;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2048;
      v30 = v14;
      __int16 v31 = 2114;
      v32 = v10;
      _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> Attempting connect with authentication", buf, 0x2Au);
    }
    uint64_t v15 = *MEMORY[0x1E4F31238];
    v23[0] = *MEMORY[0x1E4F31228];
    v23[1] = v15;
    v24[0] = v10;
    v24[1] = @"MediaControlsEndpointController-allowAuthentication";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke;
    v17[3] = &unk_1E5F0E900;
    objc_copyWeak(&v19, &location);
    v17[4] = self;
    objc_copyWeak(&v20, &from);
    id v18 = v4;
    [v8 connectWithOptions:1 userInfo:v16 completion:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MediaControlsEndpointController *)self _updateState];
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryRouting();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = WeakRetained;
    v7 = [v6 route];
    id v8 = [v7 routeName];
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = [v9 delegate];
    uint64_t v11 = *(void *)(a1 + 32);

    *(_DWORD *)buf = 134219010;
    id v19 = WeakRetained;
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 2048;
    v23 = v10;
    __int16 v24 = 2114;
    uint64_t v25 = v11;
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> <- connect error: %{public}@", buf, 0x34u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke_8;
  v13[3] = &unk_1E5F0E8D8;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  objc_copyWeak(&v17, (id *)(a1 + 56));
  id v14 = v3;
  id v15 = *(id *)(a1 + 40);
  id v12 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
}

void __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke_8(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = [WeakRetained route];
    uint64_t v5 = [v4 connection];
    if (!v5)
    {
LABEL_12:

      goto LABEL_13;
    }
    id v6 = (void *)v5;
    v7 = [WeakRetained route];
    id v8 = [v7 connection];

    if (v8 == v3)
    {
      if (*(void *)(a1 + 32)) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = *((unsigned char *)WeakRetained + 8) != 0;
      }
      [WeakRetained setAutomaticResponseLoading:v9];
      [WeakRetained setAttemptingConnection:0];
      __int16 v24 = 0;
      unsigned __int8 v23 = 0;
      [WeakRetained _getConnected:(char *)&v24 + 1 connecting:&v23 invalid:&v24];
      id v4 = MCLogCategoryRouting();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = [WeakRetained route];
        v21 = [v22 routeName];
        unint64_t v10 = [WeakRetained state];
        if (v10 > 3) {
          uint64_t v11 = @"?";
        }
        else {
          uint64_t v11 = off_1E5F0E9E8[v10];
        }
        __int16 v20 = v11;
        int v12 = HIBYTE(v24);
        int v13 = v23;
        int v14 = v24;
        int v15 = *((unsigned __int8 *)WeakRetained + 8);
        int v19 = *((unsigned __int8 *)WeakRetained + 12);
        int v17 = *((unsigned __int8 *)WeakRetained + 14);
        int v18 = *((unsigned __int8 *)WeakRetained + 13);
        id v16 = objc_loadWeakRetained(WeakRetained + 5);
        *(_DWORD *)buf = 134220546;
        __int16 v26 = WeakRetained;
        __int16 v27 = 2112;
        uint64_t v28 = v21;
        __int16 v29 = 2112;
        v30 = v20;
        __int16 v31 = 1024;
        int v32 = v12;
        __int16 v33 = 1024;
        int v34 = v13;
        __int16 v35 = 1024;
        int v36 = v14;
        __int16 v37 = 1024;
        int v38 = v15;
        __int16 v39 = 1024;
        int v40 = v17;
        __int16 v41 = 1024;
        int v42 = v19;
        __int16 v43 = 1024;
        int v44 = v18;
        __int16 v45 = 2048;
        id v46 = v16;
        _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (NSString)label
{
  v2 = [(MPRequestResponseController *)self->_requestController request];
  id v3 = [v2 label];

  return (NSString *)v3;
}

- (void)setLabel:(id)a3
{
  requestController = self->_requestController;
  id v4 = a3;
  id v5 = [(MPRequestResponseController *)requestController request];
  [v5 setLabel:v4];
}

- (void)launchNowPlayingApp
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(MediaControlsEndpointController *)self route];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F31850];
    id v5 = [(MediaControlsEndpointController *)self route];
    [v4 setActiveRoute:v5 reason:@"Analytics: Launch now playing app" completion:0];

    id v6 = SBSCreateOpenApplicationService();
    id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = *MEMORY[0x1E4F626A0];
    v49[0] = *MEMORY[0x1E4F62688];
    v49[1] = v8;
    v50[0] = MEMORY[0x1E4F1CC38];
    v50[1] = MEMORY[0x1E4F1CC38];
    v49[2] = *MEMORY[0x1E4F62658];
    BOOL v9 = [(MediaControlsEndpointController *)self route];
    unint64_t v10 = [v9 routeName];
    v50[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
    int v12 = (void *)[v7 initWithDictionary:v11];

    int v13 = [(MediaControlsEndpointController *)self representedBundleID];
    if (![v13 length])
    {
      int v14 = [(MediaControlsEndpointController *)self bundleID];
      int v15 = v14;
      if (v14) {
        id v16 = v14;
      }
      else {
        id v16 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
      }
      id v20 = v16;

      int v13 = v20;
    }
    if ([v13 length] && !MRMediaRemoteApplicationIsSystemMediaApplication())
    {
      if (!MRMediaRemoteApplicationIsSystemPodcastApplication()) {
        goto LABEL_15;
      }
      __int16 v31 = MCLogCategoryRouting();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = [(MediaControlsEndpointController *)self route];
        __int16 v33 = [v32 routeName];
        int v34 = [(MediaControlsEndpointController *)self delegate];
        *(_DWORD *)buf = 134218754;
        int v42 = self;
        __int16 v43 = 2112;
        int v44 = v33;
        __int16 v45 = 2048;
        id v46 = v34;
        __int16 v47 = 2112;
        v48 = v13;
        _os_log_impl(&dword_1AE7DF000, v31, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  given %@ bundleID. Launching Podcasts", buf, 0x2Au);
      }
      uint64_t v25 = @"podcasts://nowPlaying";
      uint64_t v26 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    }
    else
    {
      v21 = MCLogCategoryRouting();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = [(MediaControlsEndpointController *)self route];
        unsigned __int8 v23 = [v22 routeName];
        __int16 v24 = [(MediaControlsEndpointController *)self delegate];
        *(_DWORD *)buf = 134218754;
        int v42 = self;
        __int16 v43 = 2112;
        int v44 = v23;
        __int16 v45 = 2048;
        id v46 = v24;
        __int16 v47 = 2112;
        v48 = v13;
        _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  given %@ bundleID. Launching Music", buf, 0x2Au);
      }
      uint64_t v25 = @"music://show-now-playing";
      uint64_t v26 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    }
    __int16 v27 = (void *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
    [v12 setObject:v28 forKey:*MEMORY[0x1E4F62678]];

    int v13 = v27;
LABEL_15:
    __int16 v29 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v12];
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    __int16 v37 = __54__MediaControlsEndpointController_launchNowPlayingApp__block_invoke;
    int v38 = &unk_1E5F0E928;
    __int16 v39 = self;
    id v40 = v13;
    id v30 = v13;
    [v6 openApplication:v30 withOptions:v29 completion:&v35];
    +[MediaControlsAnalytics postAnalyticKind:](MediaControlsAnalytics, "postAnalyticKind:", 9, v35, v36, v37, v38, v39);

    goto LABEL_16;
  }
  id v6 = MCLogCategoryRouting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [(MediaControlsEndpointController *)self route];
    int v18 = [v17 routeName];
    int v19 = [(MediaControlsEndpointController *)self delegate];
    *(_DWORD *)buf = 134218498;
    int v42 = self;
    __int16 v43 = 2112;
    int v44 = v18;
    __int16 v45 = 2048;
    id v46 = v19;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  cannot launch Now Playing App with nil route", buf, 0x20u);
  }
LABEL_16:
}

void __54__MediaControlsEndpointController_launchNowPlayingApp__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = MCLogCategoryRouting();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v5 route];
      id v7 = [v6 routeName];
      uint64_t v8 = [*(id *)(a1 + 32) delegate];
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 134218754;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      int v13 = v7;
      __int16 v14 = 2048;
      int v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  cannot launch Now Playing App with bundleID: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)updateRoutePropertiesIfNeeded
{
  id v3 = [(MediaControlsEndpointController *)self route];
  id v15 = [v3 routeNames];

  id v4 = [(MediaControlsEndpointController *)self route];
  id v5 = [v4 predictedOutputDevice];
  id v6 = [v5 routeUID];

  if (![v15 isEqualToArray:self->_routeNames]) {
    goto LABEL_4;
  }
  id v7 = self->_predictedDeviceUID;
  if (v6 == v7)
  {

LABEL_6:
    if (!+[MRUFeatureFlagProvider isNewControlsEnabled]) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v8 = v7;
  char v9 = [(NSString *)v6 isEqual:v7];

  if (v9) {
    goto LABEL_6;
  }
LABEL_4:
  int v10 = (NSArray *)[v15 copy];
  routeNames = self->_routeNames;
  self->_routeNames = v10;

  __int16 v12 = (NSString *)[(NSString *)v6 copy];
  predictedDeviceUID = self->_predictedDeviceUID;
  self->_predictedDeviceUID = v12;

LABEL_7:
  __int16 v14 = [(MediaControlsEndpointController *)self delegate];
  [v14 endpointControllerRouteDidUpdate:self];

LABEL_8:
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MediaControlsEndpointController_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_1E5F0E950;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__MediaControlsEndpointController_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = MCLogCategoryRouting();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 route];
    id v5 = [v4 routeName];
    id v6 = [*(id *)(a1 + 32) delegate];
    *(_DWORD *)buf = 134218498;
    __int16 v29 = v3;
    __int16 v30 = 2112;
    __int16 v31 = v5;
    __int16 v32 = 2048;
    __int16 v33 = v6;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> -> defersResponseReplacement", buf, 0x20u);
  }
  __int16 v27 = 0;
  unsigned __int8 v26 = 0;
  [*(id *)(a1 + 32) _getConnected:(char *)&v27 + 1 connecting:&v26 invalid:&v27];
  id v7 = MCLogCategoryRouting();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v25 = [v8 route];
    __int16 v24 = [v25 routeName];
    unint64_t v9 = [*(id *)(a1 + 32) state];
    if (v9 > 3) {
      int v10 = @"?";
    }
    else {
      int v10 = off_1E5F0E9E8[v9];
    }
    unsigned __int8 v23 = v10;
    int v11 = HIBYTE(v27);
    int v12 = v26;
    int v13 = v27;
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = *(unsigned __int8 *)(v14 + 8);
    int v16 = *(unsigned __int8 *)(v14 + 14);
    int v17 = *(unsigned __int8 *)(v14 + 12);
    int v22 = *(unsigned __int8 *)(v14 + 13);
    id WeakRetained = objc_loadWeakRetained((id *)(v14 + 40));
    *(_DWORD *)buf = 134220546;
    __int16 v29 = v8;
    __int16 v30 = 2112;
    __int16 v31 = v24;
    __int16 v32 = 2112;
    __int16 v33 = v23;
    __int16 v34 = 1024;
    int v35 = v11;
    __int16 v36 = 1024;
    int v37 = v12;
    __int16 v38 = 1024;
    int v39 = v13;
    __int16 v40 = 1024;
    int v41 = v15;
    __int16 v42 = 1024;
    int v43 = v16;
    __int16 v44 = 1024;
    int v45 = v17;
    __int16 v46 = 1024;
    int v47 = v22;
    __int16 v48 = 2048;
    id v49 = WeakRetained;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) setHasEverReceivedResponse:1];
  int v19 = [*(id *)(a1 + 32) delegate];
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = [*(id *)(a1 + 40) response];
  [v19 endpointController:v20 didLoadNewResponse:v21];
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (void)setState:(int64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    id v5 = MCLogCategoryRouting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(MediaControlsEndpointController *)self route];
      id v7 = [v6 routeName];
      uint64_t v8 = [(MediaControlsEndpointController *)self delegate];
      unint64_t v9 = (void *)v8;
      unint64_t state = self->_state;
      if (state > 3) {
        int v11 = @"?";
      }
      else {
        int v11 = off_1E5F0E9E8[state];
      }
      if ((unint64_t)a3 > 3) {
        int v12 = @"?";
      }
      else {
        int v12 = off_1E5F0E9E8[a3];
      }
      *(_DWORD *)buf = 134219010;
      __int16 v31 = self;
      __int16 v32 = 2112;
      __int16 v33 = v7;
      __int16 v34 = 2048;
      uint64_t v35 = v8;
      __int16 v36 = 2114;
      *(void *)int v37 = v11;
      *(_WORD *)&v37[8] = 2114;
      __int16 v38 = v12;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> changing state from %{public}@ -> %{public}@", buf, 0x34u);
    }
    self->_unint64_t state = a3;
    __int16 v29 = 0;
    unsigned __int8 v28 = 0;
    [(MediaControlsEndpointController *)self _getConnected:(char *)&v29 + 1 connecting:&v28 invalid:&v29];
    int v13 = MCLogCategoryRouting();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = [(MediaControlsEndpointController *)self route];
      unsigned __int8 v26 = [v27 routeName];
      unint64_t v14 = [(MediaControlsEndpointController *)self state];
      if (v14 > 3) {
        int v15 = @"?";
      }
      else {
        int v15 = off_1E5F0E9E8[v14];
      }
      uint64_t v25 = v15;
      int v16 = HIBYTE(v29);
      int v17 = v28;
      int v18 = v29;
      BOOL allowsAutomaticResponseLoading = self->_allowsAutomaticResponseLoading;
      BOOL automaticResponseLoading = self->_automaticResponseLoading;
      BOOL hasEverReceivedResponse = self->_hasEverReceivedResponse;
      BOOL attemptingConnection = self->_attemptingConnection;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      *(_DWORD *)buf = 134220546;
      __int16 v31 = self;
      __int16 v32 = 2112;
      __int16 v33 = v26;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v25;
      __int16 v36 = 1024;
      *(_DWORD *)int v37 = v16;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v17;
      LOWORD(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 2) = v18;
      HIWORD(v38) = 1024;
      BOOL v39 = allowsAutomaticResponseLoading;
      __int16 v40 = 1024;
      BOOL v41 = automaticResponseLoading;
      __int16 v42 = 1024;
      BOOL v43 = hasEverReceivedResponse;
      __int16 v44 = 1024;
      BOOL v45 = attemptingConnection;
      __int16 v46 = 2048;
      id v47 = WeakRetained;
      _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);
    }
    unsigned __int8 v23 = [(MediaControlsEndpointController *)self delegate];
    [v23 endpointControllerDidChangeState:self];
  }
}

- (void)setAttemptingConnection:(BOOL)a3
{
  if (self->_attemptingConnection != a3)
  {
    self->_BOOL attemptingConnection = a3;
    [(MediaControlsEndpointController *)self _updateState];
  }
}

- (void)setAutomaticResponseLoading:(BOOL)a3
{
  if (self->_automaticResponseLoading != a3)
  {
    self->_BOOL automaticResponseLoading = a3;
    requestController = self->_requestController;
    if (a3) {
      [(MPRequestResponseController *)requestController beginAutomaticResponseLoading];
    }
    else {
      [(MPRequestResponseController *)requestController endAutomaticResponseLoading];
    }
  }
}

- (void)setHasEverReceivedResponse:(BOOL)a3
{
  if (self->_hasEverReceivedResponse != a3)
  {
    self->_BOOL hasEverReceivedResponse = a3;
    [(MediaControlsEndpointController *)self _updateState];
  }
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    if (a3 && !self->_attemptingConnection)
    {
      id v4 = [(MPRequestResponseController *)self->_requestController response];
      id v5 = [v4 playerPath];
      char v6 = [v5 isFullyResolved];

      if ((v6 & 1) == 0)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F76EB0]);
        uint64_t v8 = (void *)MEMORY[0x1E4F76EA0];
        unint64_t v9 = [(MediaControlsEndpointController *)self route];
        int v10 = [(MediaControlsEndpointController *)self bundleID];
        int v11 = [v8 pathWithRoute:v9 bundleID:v10 playerID:0];
        [v7 setPlayerPath:v11];

        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __47__MediaControlsEndpointController_setOnScreen___block_invoke;
        v13[3] = &unk_1E5F0E978;
        void v13[4] = self;
        id v12 = (id)[v7 performWithCompletion:v13];
      }
    }
  }
}

void __47__MediaControlsEndpointController_setOnScreen___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 playerPath];
  int v5 = [v4 isFullyResolved];

  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__MediaControlsEndpointController_setOnScreen___block_invoke_2;
    v8[3] = &unk_1E5F0D8E8;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __47__MediaControlsEndpointController_setOnScreen___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) playerPath];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 56) response];
  id v4 = [v3 playerPath];
  char v5 = [v2 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = MCLogCategoryRouting();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v7 route];
      id v9 = [v8 routeName];
      uint64_t v10 = [*(id *)(a1 + 40) delegate];
      int v11 = [*(id *)(a1 + 32) playerPath];
      id v12 = [*(id *)(*(void *)(a1 + 40) + 56) response];
      int v13 = [v12 playerPath];
      int v16 = 134219010;
      int v17 = v7;
      __int16 v18 = 2112;
      int v19 = v9;
      __int16 v20 = 2048;
      v21 = v10;
      __int16 v22 = 2112;
      unsigned __int8 v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> Reloading because re-request returned %@ and does not equal %@", (uint8_t *)&v16, 0x34u);
    }
    unint64_t v14 = *(void **)(a1 + 40);
    int v15 = [v14 route];
    [v14 _reloadPlayerPathWithRoute:v15];
  }
}

- (void)_connectionHasBecomeInvalid
{
  [(MediaControlsEndpointController *)self setHasEverReceivedResponse:0];

  [(MediaControlsEndpointController *)self _updateState];
}

- (void)_createRequestController
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v3 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x1E4F31A20]);
  requestController = self->_requestController;
  self->_requestController = v3;

  id v37 = objc_alloc(MEMORY[0x1E4F31A00]);
  uint64_t v51 = *MEMORY[0x1E4F316E0];
  id v34 = objc_alloc(MEMORY[0x1E4F31A00]);
  uint64_t v5 = *MEMORY[0x1E4F316B0];
  v50[0] = *MEMORY[0x1E4F316C0];
  v50[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F316A8];
  v50[2] = *MEMORY[0x1E4F316A0];
  v50[3] = v6;
  void v50[4] = *MEMORY[0x1E4F316B8];
  __int16 v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:5];
  v48[0] = *MEMORY[0x1E4F31710];
  uint64_t v7 = (void *)MEMORY[0x1E4F31A00];
  uint64_t v47 = *MEMORY[0x1E4F315B8];
  __int16 v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  uint64_t v35 = [v7 propertySetWithProperties:v36];
  v49[0] = v35;
  v48[1] = *MEMORY[0x1E4F31700];
  id v8 = objc_alloc(MEMORY[0x1E4F31A00]);
  uint64_t v46 = *MEMORY[0x1E4F315A8];
  __int16 v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  uint64_t v44 = *MEMORY[0x1E4F316C8];
  id v9 = (void *)MEMORY[0x1E4F31A00];
  uint64_t v43 = *MEMORY[0x1E4F315B0];
  uint64_t v10 = v43;
  __int16 v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  int v11 = [v9 propertySetWithProperties:v33];
  BOOL v45 = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  int v13 = (void *)[v8 initWithProperties:v32 relationships:v12];
  v49[1] = v13;
  v48[2] = *MEMORY[0x1E4F31708];
  unint64_t v14 = (void *)MEMORY[0x1E4F31A00];
  uint64_t v42 = v10;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  int v16 = [v14 propertySetWithProperties:v15];
  v49[2] = v16;
  int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
  __int16 v18 = (void *)[v34 initWithProperties:v38 relationships:v17];
  v52[0] = v18;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  __int16 v20 = (void *)[v37 initWithProperties:0 relationships:v19];

  id v21 = objc_alloc(MEMORY[0x1E4F31A00]);
  uint64_t v40 = *MEMORY[0x1E4F316D8];
  __int16 v22 = (void *)MEMORY[0x1E4F31A00];
  uint64_t v23 = *MEMORY[0x1E4F31690];
  v39[0] = *MEMORY[0x1E4F31698];
  v39[1] = v23;
  __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  uint64_t v25 = [v22 propertySetWithProperties:v24];
  BOOL v41 = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  __int16 v27 = (void *)[v21 initWithProperties:0 relationships:v26];

  [(MPRequestResponseController *)self->_requestController setDelegate:self];
  id v28 = objc_alloc_init(MEMORY[0x1E4F76EB0]);
  objc_msgSend(v28, "setTracklistRange:", 0, 1);
  [v28 setPlayingItemProperties:v20];
  [v28 setQueueSectionProperties:v27];
  [(MPRequestResponseController *)self->_requestController setRequest:v28];
  __int16 v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v29 addObserver:self selector:sel__connectionDidInvalidate_ name:*MEMORY[0x1E4F31AB8] object:0];

  __int16 v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 addObserver:self selector:sel__connectionDidConnect_ name:*MEMORY[0x1E4F31AB0] object:0];

  __int16 v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v31 addObserver:self selector:sel__connectionDidAttemptConnection_ name:*MEMORY[0x1E4F31AA8] object:0];
}

- (void)_getConnected:(BOOL *)a3 invalid:(BOOL *)a4
{
}

- (void)_getConnected:(BOOL *)a3 connecting:(BOOL *)a4 invalid:(BOOL *)a5
{
  id v8 = [(MediaControlsEndpointController *)self route];
  if (v8 && (v12 = v8, v9 = [v8 isDeviceRoute], v12, id v8 = v12, !v9))
  {
    uint64_t v10 = [v12 connection];
    int v11 = v10;
    if (a3) {
      *a3 = [v10 isConnected];
    }
    if (a4) {
      *a4 = [v11 isConnecting];
    }
    if (a5) {
      *a5 = [v11 isInvalidated];
    }

    id v8 = v12;
  }
  else
  {
    if (a3) {
      *a3 = 1;
    }
    if (a5) {
      *a5 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
  }
}

- (void)_updateState
{
  __int16 v5 = 0;
  unsigned __int8 v4 = 0;
  [(MediaControlsEndpointController *)self _getConnected:(char *)&v5 + 1 connecting:&v4 invalid:&v5];
  if ((_BYTE)v5)
  {
    uint64_t v3 = -1;
  }
  else if (HIBYTE(v5))
  {
    if (self->_hasEverReceivedResponse) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = (self->_attemptingConnection | v4) != 0;
  }
  [(MediaControlsEndpointController *)self setState:v3];
}

- (void)_connectIfNeeded
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MediaControlsEndpointController *)self connectionDelegate];
  unsigned __int8 v4 = [(MediaControlsEndpointController *)self route];
  [v3 endpointController:self willAttemptToConnectToRoute:v4];

  __int16 v20 = 0;
  [(MediaControlsEndpointController *)self _getConnected:(char *)&v20 + 1 invalid:&v20];
  if (!self->_allowsAutomaticResponseLoading || v20)
  {
    if (self->_allowsAutomaticResponseLoading && HIBYTE(v20) && !(_BYTE)v20 && !self->_attemptingConnection)
    {
      [(MediaControlsEndpointController *)self setAutomaticResponseLoading:1];
      return;
    }
LABEL_11:
    [(MediaControlsEndpointController *)self setAutomaticResponseLoading:0];
    return;
  }
  if (self->_attemptingConnection) {
    goto LABEL_11;
  }
  __int16 v5 = [(MediaControlsEndpointController *)self route];
  uint64_t v6 = [v5 connection];

  [(MediaControlsEndpointController *)self setAttemptingConnection:1];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];

  int v9 = MCLogCategoryRouting();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(MediaControlsEndpointController *)self route];
    id v11 = [v10 routeName];
    id v12 = [(MediaControlsEndpointController *)self delegate];
    *(_DWORD *)buf = 134218754;
    __int16 v24 = self;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    id v28 = v12;
    __int16 v29 = 2114;
    __int16 v30 = v8;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> Attempting connect without authentication", buf, 0x2Au);
  }
  uint64_t v13 = *MEMORY[0x1E4F31238];
  v21[0] = *MEMORY[0x1E4F31228];
  v21[1] = v13;
  v22[0] = v8;
  v22[1] = @"MediaControlsEndpointController";
  unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__MediaControlsEndpointController__connectIfNeeded__block_invoke;
  v15[3] = &unk_1E5F0E9C8;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  objc_copyWeak(&v17, &from);
  [v6 connectWithUserInfo:v14 completion:v15];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __51__MediaControlsEndpointController__connectIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned __int8 v4 = MCLogCategoryRouting();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    uint64_t v7 = [v6 route];
    id v8 = [v7 routeName];
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v10 = [v9 delegate];
    uint64_t v11 = *(void *)(a1 + 32);

    *(_DWORD *)buf = 134219010;
    id v18 = WeakRetained;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2048;
    __int16 v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v11;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> <- connect error: %{public}@", buf, 0x34u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MediaControlsEndpointController__connectIfNeeded__block_invoke_41;
  block[3] = &unk_1E5F0E9A0;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v14 = v3;
  id v12 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void __51__MediaControlsEndpointController__connectIfNeeded__block_invoke_41(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [WeakRetained route];
    uint64_t v4 = [v3 connection];
    if (v4)
    {
      __int16 v5 = (void *)v4;
      id v6 = [WeakRetained route];
      id v7 = [v6 connection];

      if (v7 == v2)
      {
        if (*(void *)(a1 + 32)) {
          BOOL v8 = 0;
        }
        else {
          BOOL v8 = WeakRetained[8] != 0;
        }
        [WeakRetained setAutomaticResponseLoading:v8];
        [WeakRetained setAttemptingConnection:0];
      }
    }
    else
    {
    }
  }
}

- (void)_maybeReloadPlayerPathWithRoute:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MediaControlsEndpointController *)self playerPath];
  id v5 = [v4 route];

  if (v5 != v6) {
    [(MediaControlsEndpointController *)self _reloadPlayerPathWithRoute:v6];
  }
}

- (void)_reloadPlayerPathWithRoute:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(MediaControlsEndpointController *)self specifiedClient];
  id v5 = [(MediaControlsEndpointController *)self specifiedPlayer];
  if ([(MPMediaControlsConfiguration *)self->_configuration style] == 1)
  {
    uint64_t v6 = [(MPMediaControlsConfiguration *)self->_configuration presentingAppBundleID];

    uint64_t v4 = (void *)v6;
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F31240];
  id v9 = [(MediaControlsEndpointController *)self route];
  [v7 removeObserver:self name:v8 object:v9];

  uint64_t v10 = [MEMORY[0x1E4F76EA0] pathWithRoute:v14 bundleID:v4 playerID:v5];
  uint64_t v11 = [(MPRequestResponseController *)self->_requestController request];
  [v11 setPlayerPath:v10];

  [(MPRequestResponseController *)self->_requestController setNeedsReload];
  if (v14)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:self selector:sel__routeDidChange_ name:v8 object:v14];
  }
  uint64_t v13 = [(MediaControlsEndpointController *)self delegate];
  [v13 endpointControllerRouteDidUpdate:self];

  self->_BOOL attemptingConnection = 0;
  [(MediaControlsEndpointController *)self _connectIfNeeded];
  [(MediaControlsEndpointController *)self _updateState];
  [(MediaControlsEndpointController *)self updateRoutePropertiesIfNeeded];
}

- (void)_connectionDidInvalidate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__MediaControlsEndpointController__connectionDidInvalidate___block_invoke;
  v6[3] = &unk_1E5F0D8E8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __60__MediaControlsEndpointController__connectionDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(a1 + 40) route];
  id v4 = [v3 connection];

  if (v2 == v4)
  {
    id v5 = MCLogCategoryRouting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 40);
      id v7 = [v6 route];
      uint64_t v8 = [v7 routeName];
      id v9 = [*(id *)(a1 + 40) delegate];
      *(_DWORD *)buf = 134218498;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      __int16 v32 = 2048;
      __int16 v33 = v9;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> connectionDidInvalidate", buf, 0x20u);
    }
    __int16 v27 = 0;
    unsigned __int8 v26 = 0;
    [*(id *)(a1 + 40) _getConnected:(char *)&v27 + 1 connecting:&v26 invalid:&v27];
    uint64_t v10 = MCLogCategoryRouting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void **)(a1 + 40);
      __int16 v25 = [v11 route];
      uint64_t v24 = [v25 routeName];
      unint64_t v12 = [*(id *)(a1 + 40) state];
      if (v12 > 3) {
        uint64_t v13 = @"?";
      }
      else {
        uint64_t v13 = off_1E5F0E9E8[v12];
      }
      __int16 v23 = v13;
      int v14 = HIBYTE(v27);
      int v15 = v26;
      int v16 = v27;
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = *(unsigned __int8 *)(v17 + 8);
      int v19 = *(unsigned __int8 *)(v17 + 14);
      int v21 = *(unsigned __int8 *)(v17 + 12);
      int v22 = *(unsigned __int8 *)(v17 + 13);
      id WeakRetained = objc_loadWeakRetained((id *)(v17 + 40));
      *(_DWORD *)buf = 134220546;
      __int16 v29 = v11;
      __int16 v30 = 2112;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      __int16 v33 = v23;
      __int16 v34 = 1024;
      int v35 = v14;
      __int16 v36 = 1024;
      int v37 = v15;
      __int16 v38 = 1024;
      int v39 = v16;
      __int16 v40 = 1024;
      int v41 = v18;
      __int16 v42 = 1024;
      int v43 = v19;
      __int16 v44 = 1024;
      int v45 = v21;
      __int16 v46 = 1024;
      int v47 = v22;
      __int16 v48 = 2048;
      id v49 = WeakRetained;
      _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);
    }
    [*(id *)(a1 + 40) _connectionHasBecomeInvalid];
  }
}

- (void)_connectionDidConnect:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MediaControlsEndpointController__connectionDidConnect___block_invoke;
  v6[3] = &unk_1E5F0D8E8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__MediaControlsEndpointController__connectionDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(a1 + 40) route];
  id v4 = [v3 connection];

  if (v2 == v4)
  {
    id v5 = MCLogCategoryRouting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 40);
      id v7 = [v6 route];
      uint64_t v8 = [v7 routeName];
      id v9 = [*(id *)(a1 + 40) delegate];
      *(_DWORD *)buf = 134218498;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      __int16 v32 = 2048;
      __int16 v33 = v9;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> connectionDidConnect", buf, 0x20u);
    }
    __int16 v27 = 0;
    unsigned __int8 v26 = 0;
    [*(id *)(a1 + 40) _getConnected:(char *)&v27 + 1 connecting:&v26 invalid:&v27];
    uint64_t v10 = MCLogCategoryRouting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void **)(a1 + 40);
      __int16 v25 = [v11 route];
      uint64_t v24 = [v25 routeName];
      unint64_t v12 = [*(id *)(a1 + 40) state];
      if (v12 > 3) {
        uint64_t v13 = @"?";
      }
      else {
        uint64_t v13 = off_1E5F0E9E8[v12];
      }
      __int16 v23 = v13;
      int v14 = HIBYTE(v27);
      int v15 = v26;
      int v16 = v27;
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = *(unsigned __int8 *)(v17 + 8);
      int v19 = *(unsigned __int8 *)(v17 + 14);
      int v21 = *(unsigned __int8 *)(v17 + 12);
      int v22 = *(unsigned __int8 *)(v17 + 13);
      id WeakRetained = objc_loadWeakRetained((id *)(v17 + 40));
      *(_DWORD *)buf = 134220546;
      __int16 v29 = v11;
      __int16 v30 = 2112;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      __int16 v33 = v23;
      __int16 v34 = 1024;
      int v35 = v14;
      __int16 v36 = 1024;
      int v37 = v15;
      __int16 v38 = 1024;
      int v39 = v16;
      __int16 v40 = 1024;
      int v41 = v18;
      __int16 v42 = 1024;
      int v43 = v19;
      __int16 v44 = 1024;
      int v45 = v21;
      __int16 v46 = 1024;
      int v47 = v22;
      __int16 v48 = 2048;
      id v49 = WeakRetained;
      _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);
    }
    [*(id *)(a1 + 40) _connectIfNeeded];
    [*(id *)(a1 + 40) _updateState];
  }
}

- (void)_connectionDidAttemptConnection:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__MediaControlsEndpointController__connectionDidAttemptConnection___block_invoke;
  v6[3] = &unk_1E5F0D8E8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67__MediaControlsEndpointController__connectionDidAttemptConnection___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(a1 + 40) route];
  id v4 = [v3 connection];

  if (v2 == v4)
  {
    id v5 = MCLogCategoryRouting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 40);
      id v7 = [v6 route];
      uint64_t v8 = [v7 routeName];
      id v9 = [*(id *)(a1 + 40) delegate];
      *(_DWORD *)buf = 134218498;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      __int16 v32 = 2048;
      __int16 v33 = v9;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> connectionDidAttemptConnection", buf, 0x20u);
    }
    __int16 v27 = 0;
    unsigned __int8 v26 = 0;
    [*(id *)(a1 + 40) _getConnected:(char *)&v27 + 1 connecting:&v26 invalid:&v27];
    uint64_t v10 = MCLogCategoryRouting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void **)(a1 + 40);
      __int16 v25 = [v11 route];
      uint64_t v24 = [v25 routeName];
      unint64_t v12 = [*(id *)(a1 + 40) state];
      if (v12 > 3) {
        uint64_t v13 = @"?";
      }
      else {
        uint64_t v13 = off_1E5F0E9E8[v12];
      }
      __int16 v23 = v13;
      int v14 = HIBYTE(v27);
      int v15 = v26;
      int v16 = v27;
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = *(unsigned __int8 *)(v17 + 8);
      int v19 = *(unsigned __int8 *)(v17 + 14);
      int v21 = *(unsigned __int8 *)(v17 + 12);
      int v22 = *(unsigned __int8 *)(v17 + 13);
      id WeakRetained = objc_loadWeakRetained((id *)(v17 + 40));
      *(_DWORD *)buf = 134220546;
      __int16 v29 = v11;
      __int16 v30 = 2112;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      __int16 v33 = v23;
      __int16 v34 = 1024;
      int v35 = v14;
      __int16 v36 = 1024;
      int v37 = v15;
      __int16 v38 = 1024;
      int v39 = v16;
      __int16 v40 = 1024;
      int v41 = v18;
      __int16 v42 = 1024;
      int v43 = v19;
      __int16 v44 = 1024;
      int v45 = v21;
      __int16 v46 = 1024;
      int v47 = v22;
      __int16 v48 = 2048;
      id v49 = WeakRetained;
      _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);
    }
    [*(id *)(a1 + 40) _updateState];
  }
}

- (void)_routeDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MediaControlsEndpointController__routeDidChange___block_invoke;
  block[3] = &unk_1E5F0D7F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__MediaControlsEndpointController__routeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRoutePropertiesIfNeeded];
}

- (id)_stateDumpObject
{
  v15[7] = *MEMORY[0x1E4F143B8];
  v14[0] = @"_obj";
  id v3 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v15[0] = v3;
  v14[1] = @"hasEverReceivedResponse";
  id v4 = [NSNumber numberWithBool:self->_hasEverReceivedResponse];
  v15[1] = v4;
  v14[2] = @"state";
  id v5 = [NSNumber numberWithInteger:self->_state];
  v15[2] = v5;
  v14[3] = @"attemptingConnection";
  uint64_t v6 = [NSNumber numberWithBool:self->_attemptingConnection];
  v15[3] = v6;
  v14[4] = @"allowsAutomaticResponseLoading";
  id v7 = [NSNumber numberWithBool:self->_allowsAutomaticResponseLoading];
  v15[4] = v7;
  v14[5] = @"automaticResponseLoading";
  uint64_t v8 = [NSNumber numberWithBool:self->_automaticResponseLoading];
  void v15[5] = v8;
  v14[6] = @"requestResponseController";
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self->_requestController);
  uint64_t v10 = (void *)v9;
  uint64_t v11 = @"<NONE>";
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  v15[6] = v11;
  unint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:7];

  return v12;
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSArray)routeNames
{
  return self->_routeNames;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)allowsAutomaticResponseLoading
{
  return self->_allowsAutomaticResponseLoading;
}

- (BOOL)hasAvailableRoutes
{
  return self->_hasAvailableRoutes;
}

- (BOOL)onScreen
{
  return self->_onScreen;
}

- (BOOL)deviceUnlocked
{
  return self->_deviceUnlocked;
}

- (void)setDeviceUnlocked:(BOOL)a3
{
  self->_deviceUnlocked = a3;
}

- (MediaControlsEndpointControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaControlsEndpointControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MediaControlsEndpointObserverDelegate)proxyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyDelegate);

  return (MediaControlsEndpointObserverDelegate *)WeakRetained;
}

- (void)setProxyDelegate:(id)a3
{
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (BOOL)hasEverReceivedResponse
{
  return self->_hasEverReceivedResponse;
}

- (BOOL)isAttemptingConnection
{
  return self->_attemptingConnection;
}

- (NSString)specifiedClient
{
  return self->_specifiedClient;
}

- (NSString)specifiedPlayer
{
  return self->_specifiedPlayer;
}

- (NSString)predictedDeviceUID
{
  return self->_predictedDeviceUID;
}

- (BOOL)isAutomaticResponseLoading
{
  return self->_automaticResponseLoading;
}

- (MediaControlsEndpointControllerConnectionDelegate)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);

  return (MediaControlsEndpointControllerConnectionDelegate *)WeakRetained;
}

- (void)setConnectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_predictedDeviceUID, 0);
  objc_storeStrong((id *)&self->_specifiedPlayer, 0);
  objc_storeStrong((id *)&self->_specifiedClient, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_destroyWeak((id *)&self->_proxyDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeNames, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end