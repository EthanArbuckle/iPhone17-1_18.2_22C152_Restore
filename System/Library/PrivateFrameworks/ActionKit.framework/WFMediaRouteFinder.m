@interface WFMediaRouteFinder
- (WFDispatchSourceTimer)timer;
- (WFMediaRouteDescriptor)routeDescriptor;
- (WFMediaRouteFinder)initWithPicker:(id)a3 routeDescriptor:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
- (WFMediaRoutePicker)picker;
- (double)timeout;
- (id)completionHandler;
- (void)finishWithMatchingRoute:(id)a3 error:(id)a4;
- (void)routePickerDidUpdateAvailableRoutes:(id)a3;
- (void)start;
@end

@implementation WFMediaRouteFinder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_routeDescriptor, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_picker);
}

- (WFDispatchSourceTimer)timer
{
  return self->_timer;
}

- (double)timeout
{
  return self->_timeout;
}

- (WFMediaRouteDescriptor)routeDescriptor
{
  return self->_routeDescriptor;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (WFMediaRoutePicker)picker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  return (WFMediaRoutePicker *)WeakRetained;
}

- (void)routePickerDidUpdateAvailableRoutes:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFMediaRouteFinder *)self routeDescriptor];
  v6 = [v4 availableRoutes];

  v7 = [v5 findMatchingRoute:v6];

  if (v7 && self->_completionHandler)
  {
    v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[WFMediaRouteFinder routePickerDidUpdateAvailableRoutes:]";
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Found route %@", (uint8_t *)&v9, 0x16u);
    }

    [(WFMediaRouteFinder *)self finishWithMatchingRoute:v7 error:0];
  }
}

- (void)finishWithMatchingRoute:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(WFMediaRouteFinder *)self timer];
  [v7 cancel];

  v8 = [(WFMediaRouteFinder *)self picker];
  [v8 removeAvailableRoutesObserver:self];

  completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v11, v6);
    id v10 = self->_completionHandler;
    self->_completionHandler = 0;
  }
}

- (void)start
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = getWFActionsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(WFMediaRouteFinder *)self routeDescriptor];
    *(_DWORD *)buf = 136315650;
    v26 = "-[WFMediaRouteFinder start]";
    __int16 v27 = 2112;
    v28 = v4;
    __int16 v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_INFO, "%s Finding route matching %@ for %@", buf, 0x20u);
  }
  v5 = [(WFMediaRouteFinder *)self routeDescriptor];
  id v6 = [v5 routeName];

  v7 = [(WFMediaRouteFinder *)self routeDescriptor];
  v8 = [v7 routeUID];

  if (v8)
  {
    int v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFMediaRouteFinder start]";
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s Requested route has a route UID... Attempting to connect via Bluetooth (if applicable)", buf, 0xCu);
    }

    id v10 = [(WFMediaRouteFinder *)self picker];
    id v11 = [(WFMediaRouteFinder *)self routeDescriptor];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __27__WFMediaRouteFinder_start__block_invoke;
    v22[3] = &unk_264E5DB20;
    id v23 = v6;
    id v24 = v8;
    [v10 getPairedAudioDevicesMatchingRouteDescriptor:v11 withCompletion:v22];
  }
  objc_initWeak((id *)buf, self);
  id v12 = objc_alloc(MEMORY[0x263F85290]);
  [(WFMediaRouteFinder *)self timeout];
  double v14 = v13;
  v15 = [(WFMediaRouteFinder *)self picker];
  v16 = [v15 queue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __27__WFMediaRouteFinder_start__block_invoke_170;
  v20[3] = &unk_264E5B950;
  objc_copyWeak(&v21, (id *)buf);
  v17 = (WFDispatchSourceTimer *)[v12 initWithInterval:v16 queue:v20 handler:v14];
  timer = self->_timer;
  self->_timer = v17;

  [(WFDispatchSourceTimer *)self->_timer start];
  v19 = [(WFMediaRouteFinder *)self picker];
  [v19 addAvailableRoutesObserver:self];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __27__WFMediaRouteFinder_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  v5 = getWFActionsLogObject();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      id v21 = "-[WFMediaRouteFinder start]_block_invoke";
      __int16 v22 = 2113;
      id v23 = v3;
      _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_INFO, "%s Found bluetooth devices %{private}@", buf, 0x16u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = getWFActionsLogObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315395;
            id v21 = "-[WFMediaRouteFinder start]_block_invoke";
            __int16 v22 = 2113;
            id v23 = v11;
            _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_INFO, "%s Attempting to connect to %{private}@", buf, 0x16u);
          }

          if (([v11 connected] & 1) == 0) {
            [v11 connect];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    double v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315651;
    id v21 = "-[WFMediaRouteFinder start]_block_invoke";
    __int16 v22 = 2113;
    id v23 = v13;
    __int16 v24 = 2113;
    uint64_t v25 = v14;
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_ERROR, "%s Could not find bluetooth device (%{private}@) matching UID: %{private}@", buf, 0x20u);
  }
}

void __27__WFMediaRouteFinder_start__block_invoke_170(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained timer];
    char v4 = [v3 isCancelled];

    if ((v4 & 1) == 0)
    {
      v5 = getWFActionsLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        [v2 timeout];
        int v12 = 136315394;
        double v13 = "-[WFMediaRouteFinder start]_block_invoke";
        __int16 v14 = 2048;
        uint64_t v15 = v6;
        _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_ERROR, "%s Finding route timed out after %f seconds", (uint8_t *)&v12, 0x16u);
      }

      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = [v2 routeDescriptor];
      uint64_t v9 = [v8 routeName];
      id v10 = WFMediaRoutePickerInjectRouteNameInUserInfoIfPossible(v9, 0);
      id v11 = [v7 errorWithDomain:@"WFMediaRoutePickerErrorDomain" code:0 userInfo:v10];

      [v2 finishWithMatchingRoute:0 error:v11];
    }
  }
}

- (WFMediaRouteFinder)initWithPicker:(id)a3 routeDescriptor:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFMediaRouteFinder;
  double v13 = [(WFMediaRouteFinder *)&v19 init];
  __int16 v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_picker, v10);
    objc_storeStrong((id *)&v14->_routeDescriptor, a4);
    uint64_t v15 = [v12 copy];
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = (id)v15;

    v14->_timeout = a5;
    long long v17 = v14;
  }

  return v14;
}

@end