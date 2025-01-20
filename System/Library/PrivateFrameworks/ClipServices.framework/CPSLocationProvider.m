@interface CPSLocationProvider
+ (BOOL)locationServiceEnabled;
+ (id)sharedProvider;
+ (void)setLocationServiceEnabled:(BOOL)a3;
- (CPSLocationProvider)init;
- (void)confirmCurrentLocationInRegion:(id)a3 completion:(id)a4;
- (void)getCurrentLocationWithCompletion:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation CPSLocationProvider

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedProvider_sharedProvider;

  return v2;
}

uint64_t __37__CPSLocationProvider_sharedProvider__block_invoke()
{
  sharedProvider_sharedProvider = objc_alloc_init(CPSLocationProvider);

  return MEMORY[0x270F9A758]();
}

- (CPSLocationProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)CPSLocationProvider;
  v2 = [(CPSLocationProvider *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ClipServices.CPSLocationProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__CPSLocationProvider_init__block_invoke;
    block[3] = &unk_26424E7B0;
    v6 = v2;
    v10 = v6;
    dispatch_sync(v5, block);
    v7 = v6;
  }
  return v2;
}

uint64_t __27__CPSLocationProvider_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)getCLLocationManagerClass());
  dispatch_queue_t v3 = LocationBundle();
  uint64_t v4 = [v2 initWithEffectiveBundle:v3 delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v7 = (double *)getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  uint64_t v13 = getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  if (!getkCLLocationAccuracyHundredMetersSymbolLoc_ptr)
  {
    v8 = (void *)CoreLocationLibrary();
    v11[3] = (uint64_t)dlsym(v8, "kCLLocationAccuracyHundredMeters");
    getkCLLocationAccuracyHundredMetersSymbolLoc_ptr = v11[3];
    v7 = (double *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v7) {
    __27__CPSLocationProvider_init__block_invoke_cold_1();
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setDesiredAccuracy:*v7];
  uint64_t result = [(id)objc_opt_class() locationServiceEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

+ (BOOL)locationServiceEnabled
{
  id CLLocationManagerClass = getCLLocationManagerClass();
  dispatch_queue_t v3 = LocationBundle();
  LOBYTE(CLLocationManagerClass) = [CLLocationManagerClass authorizationStatusForBundle:v3] == 3;

  return (char)CLLocationManagerClass;
}

+ (void)setLocationServiceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id CLLocationManagerClass = getCLLocationManagerClass();
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  LocationBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [CLLocationManagerClass setAuthorizationStatusByType:v5 forBundle:v6];
}

- (void)confirmCurrentLocationInRegion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CPSLocationProvider_confirmCurrentLocationInRegion_completion___block_invoke;
  v10[3] = &unk_26424F310;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(CPSLocationProvider *)self getCurrentLocationWithCompletion:v10];
}

void __65__CPSLocationProvider_confirmCurrentLocationInRegion_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) radius];
    if (v6 > 500.0)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 15);
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

      goto LABEL_7;
    }
    id v9 = *(void **)(a1 + 32);
    [v10 coordinate];
    objc_msgSend(v9, "containsCoordinate:");
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
LABEL_7:
}

- (void)getCurrentLocationWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__CPSLocationProvider_getCurrentLocationWithCompletion___block_invoke;
  v7[3] = &unk_26424E6F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__CPSLocationProvider_getCurrentLocationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 32))
  {
    BOOL v3 = *(void **)(v2 + 16);
    if (!v3)
    {
      id v4 = objc_alloc_init(CPSPromise);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v4;

      [*(id *)(*(void *)(a1 + 32) + 8) requestLocation];
      BOOL v3 = *(void **)(*(void *)(a1 + 32) + 16);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    [v3 addCompletionBlock:v7];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"CPSErrorDomain" code:14 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21559C000, v4, OS_LOG_TYPE_INFO, "CPSLocationProvider: locationManagerDidChangeAuthorization", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CPSLocationProvider_locationManagerDidChangeAuthorization___block_invoke;
  block[3] = &unk_26424E7B0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __61__CPSLocationProvider_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t result = [(id)objc_opt_class() locationServiceEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v5 lastObject];
    *(_DWORD *)buf = 138739971;
    v14 = v8;
    _os_log_impl(&dword_21559C000, v7, OS_LOG_TYPE_INFO, "CPSLocationProvider: didUpdateLocation: %{sensitive}@", buf, 0xCu);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__CPSLocationProvider_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_26424E7D8;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(queue, v11);
}

void __58__CPSLocationProvider_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  BOOL v3 = [*(id *)(a1 + 40) lastObject];
  [v2 finishWithResult:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CPSLocationProvider locationManager:didFailWithError:]((uint64_t)v5, v6);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__CPSLocationProvider_locationManager_didFailWithError___block_invoke;
  v9[3] = &unk_26424E7D8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __56__CPSLocationProvider_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) finishWithError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationPromise, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __27__CPSLocationProvider_init__block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CLLocationAccuracy getkCLLocationAccuracyHundredMeters(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSLocationProvider.m", 16, @"%s", dlerror());

  __break(1u);
}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "CPSLocationProvider: didFailWithError: %@", (uint8_t *)&v2, 0xCu);
}

@end