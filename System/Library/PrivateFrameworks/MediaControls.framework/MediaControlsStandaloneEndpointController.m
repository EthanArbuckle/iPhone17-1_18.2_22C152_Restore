@interface MediaControlsStandaloneEndpointController
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)isEndpointDiscovered;
- (MPAVRoutingController)routingController;
- (MPMRAVEndpointObserverWrapper)endpointObserver;
- (MediaControlsStandaloneEndpointController)initWithEndpoint:(id)a3;
- (MediaControlsStandaloneEndpointController)initWithEndpoint:(id)a3 client:(id)a4 player:(id)a5;
- (MediaControlsStandaloneEndpointController)initWithRouteUID:(id)a3;
- (MediaControlsStandaloneEndpointController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5;
- (NSString)routeUID;
- (id)_routeForEndpoint:(__MRAVEndpointRef *)a3;
- (void)beginObserving;
- (void)dealloc;
- (void)endObserving;
- (void)setAllowsAutomaticResponseLoading:(BOOL)a3;
- (void)setEndpointDiscovered:(BOOL)a3;
- (void)setEndpointObserver:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRouteUID:(id)a3;
- (void)updateAllowsAutomaticResponseLoading;
@end

@implementation MediaControlsStandaloneEndpointController

- (MediaControlsStandaloneEndpointController)initWithEndpoint:(id)a3 client:(id)a4 player:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MediaControlsStandaloneEndpointController;
  v5 = [(MediaControlsEndpointController *)&v13 initWithEndpoint:a3 client:a4 player:a5];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F31820]) initWithThrottlingEnabled:1];
    id v7 = objc_alloc(MEMORY[0x1E4F31850]);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 initWithDataSource:v6 name:v9];
    routingController = v5->_routingController;
    v5->_routingController = (MPAVRoutingController *)v10;

    [(MPAVRoutingController *)v5->_routingController setDelegate:v5];
  }
  return v5;
}

- (MediaControlsStandaloneEndpointController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ![v8 isEqualToString:@"LOCAL"])
  {
    v11 = 0;
    char v12 = 0;
  }
  else
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F31818]) initWithEndpoint:MRAVEndpointGetLocalEndpoint()];
    char v12 = 1;
  }
  v16.receiver = self;
  v16.super_class = (Class)MediaControlsStandaloneEndpointController;
  objc_super v13 = [(MediaControlsEndpointController *)&v16 initWithEndpoint:v11 client:v9 player:v10];
  v14 = v13;
  if (v13)
  {
    v13->_endpointDiscovered = v12;
    [(MediaControlsStandaloneEndpointController *)v13 setRouteUID:v8];
  }

  return v14;
}

- (MediaControlsStandaloneEndpointController)initWithEndpoint:(id)a3
{
  return [(MediaControlsStandaloneEndpointController *)self initWithEndpoint:a3 client:0 player:0];
}

- (MediaControlsStandaloneEndpointController)initWithRouteUID:(id)a3
{
  return [(MediaControlsStandaloneEndpointController *)self initWithRouteUID:a3 client:0 player:0];
}

- (void)dealloc
{
  MEMORY[0x1B3E72A30]([(MPMRAVEndpointObserverWrapper *)self->_endpointObserver unwrappedValue]);
  endpointObserver = self->_endpointObserver;
  self->_endpointObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsStandaloneEndpointController;
  [(MediaControlsStandaloneEndpointController *)&v4 dealloc];
}

- (void)setRouteUID:(id)a3
{
  id v7 = a3;
  if ((-[NSString isEqual:](self->_routeUID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_routeUID, a3);
    v5 = (const void *)MRAVEndpointObserverCreateWithOutputDeviceUID();
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F318D8]) initWithMRAVEndpointObserver:v5];
    [(MediaControlsStandaloneEndpointController *)self setEndpointObserver:v6];

    CFRelease(v5);
  }
}

- (void)setRoute:(id)a3
{
  id v4 = a3;
  [(MediaControlsStandaloneEndpointController *)self setEndpointDiscovered:v4 != 0];
  [(MediaControlsStandaloneEndpointController *)self updateAllowsAutomaticResponseLoading];
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsStandaloneEndpointController;
    [(MediaControlsEndpointController *)&v5 setRoute:v4];
  }
}

- (void)setAllowsAutomaticResponseLoading:(BOOL)a3
{
  self->_allowsAutomaticResponseLoading = a3;
  [(MediaControlsStandaloneEndpointController *)self updateAllowsAutomaticResponseLoading];
}

- (void)updateAllowsAutomaticResponseLoading
{
  v3 = [(MediaControlsEndpointController *)self route];
  if (v3) {
    BOOL allowsAutomaticResponseLoading = self->_allowsAutomaticResponseLoading;
  }
  else {
    BOOL allowsAutomaticResponseLoading = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsStandaloneEndpointController;
  [(MediaControlsEndpointController *)&v5 setAllowsAutomaticResponseLoading:allowsAutomaticResponseLoading];
}

- (void)setEndpointDiscovered:(BOOL)a3
{
  if (self->_endpointDiscovered != a3)
  {
    self->_endpointDiscovered = a3;
    id v4 = [(MediaControlsEndpointController *)self delegate];
    [v4 endpointControllerDidChangeState:self];
  }
}

- (void)setEndpointObserver:(id)a3
{
  id v5 = a3;
  v6 = [(MediaControlsStandaloneEndpointController *)self endpointObserver];

  if (v6)
  {
    id v7 = [(MediaControlsStandaloneEndpointController *)self endpointObserver];
    MEMORY[0x1B3E72A30]([v7 unwrappedValue]);
  }
  objc_storeStrong((id *)&self->_endpointObserver, a3);
  objc_initWeak(&location, self);
  id v8 = [(MediaControlsStandaloneEndpointController *)self endpointObserver];
  [v8 unwrappedValue];
  objc_copyWeak(&v9, &location);
  MRAVEndpointObserverAddEndpointChangedCallback();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__MediaControlsStandaloneEndpointController_setEndpointObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = [WeakRetained _routeForEndpoint:a2];
    }
    else
    {
      v6 = 0;
    }
    id v7 = MCLogCategoryRouting();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "[MediaControlsEndpointController setEndpointObserver] for %{public}@ to %{public}@", buf, 0x16u);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__MediaControlsStandaloneEndpointController_setEndpointObserver___block_invoke_10;
    v10[3] = &unk_1E5F0D938;
    id v11 = v5;
    id v12 = v6;
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = a2;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __65__MediaControlsStandaloneEndpointController_setEndpointObserver___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) setRoute:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setAllowsAutomaticResponseLoading:*(void *)(a1 + 56) != 0];
  v2 = *(void **)(a1 + 32);

  return [v2 updateRoutePropertiesIfNeeded];
}

- (void)beginObserving
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MCLogCategoryRouting();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MediaControlsEndpointController *)self route];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "Begin observing: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(MediaControlsStandaloneEndpointController *)self endpointObserver];
  MEMORY[0x1B3E72A10]([v5 unwrappedValue]);
}

- (void)endObserving
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MCLogCategoryRouting();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(MediaControlsEndpointController *)self route];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "End observing: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(MediaControlsStandaloneEndpointController *)self endpointObserver];
  MEMORY[0x1B3E72A30]([v5 unwrappedValue]);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v4 = a4;
  id v5 = [v4 domain];
  BOOL v6 = v5 != (void *)*MEMORY[0x1E4F31230];
  if (v5 == (void *)*MEMORY[0x1E4F31230])
  {
    uint64_t v7 = [v4 code];

    if (v7 != 2)
    {
      BOOL v6 = 1;
      goto LABEL_6;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F31850];
    id v5 = [MEMORY[0x1E4F31850] systemRoute];
    [v8 setActiveRoute:v5 reason:@"invalid route error" completion:0];
  }

LABEL_6:
  return v6;
}

- (id)_routeForEndpoint:(__MRAVEndpointRef *)a3
{
  uint64_t ExternalDevice = MRAVEndpointGetExternalDevice();
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F31818]) initWithEndpoint:a3];
  if (ExternalDevice)
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F31848]) initWithExternalDevice:ExternalDevice];
    [v5 setConnection:v6];
  }

  return v5;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (BOOL)isEndpointDiscovered
{
  return self->_endpointDiscovered;
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (MPMRAVEndpointObserverWrapper)endpointObserver
{
  return self->_endpointObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong((id *)&self->_routingController, 0);

  objc_storeStrong((id *)&self->_routeUID, 0);
}

@end