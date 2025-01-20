@interface GEOLocationShifter
+ (BOOL)isLocationShiftEnabled;
+ (BOOL)isLocationShiftRequiredForCoordinate:(id)a3;
+ (Class)proxyClass;
+ (_GEOLocationShifterProxy)_proxy;
+ (unsigned)locationShiftFunctionVersion;
+ (void)flushDiskCache;
+ (void)pruneDiskCache;
+ (void)setProxyClass:(Class)a3;
- (BOOL)_shiftLocation:(id)a3;
- (BOOL)locationShiftEnabled;
- (BOOL)shiftCoordinate:(id)a3 accuracy:(double)a4 shiftedCoordinate:(id *)a5 shiftedAccuracy:(double *)a6;
- (BOOL)shiftLatLng:(id)a3 accuracy:(double)a4 shiftedCoordinate:(id *)a5 shiftedAccuracy:(double *)a6;
- (GEOLocationShifter)init;
- (void)_fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_fetchSerializedCachedShiftFunctionResponseForRequest:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)_fetchShiftFunctionForLatLng:(id)a3 auditToken:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)_requestNextShiftFunctionIfNecessary;
- (void)_reset;
- (void)dealloc;
- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)shiftCoordinate:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5;
- (void)shiftCoordinate:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5 mustGoToNetworkCallback:(id)a6 errorHandler:(id)a7 callbackQueue:(id)a8;
- (void)shiftLatLng:(id)a3 accuracy:(double)a4 auditToken:(id)a5 withCompletionHandler:(id)a6 mustGoToNetworkCallback:(id)a7 errorHandler:(id)a8 callbackQueue:(id)a9;
- (void)shiftLatLng:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5;
- (void)shiftLatLng:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5 mustGoToNetworkCallback:(id)a6 errorHandler:(id)a7 callbackQueue:(id)a8;
@end

@implementation GEOLocationShifter

void __28__GEOLocationShifter__proxy__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)[*(id *)(a1 + 32) proxyClass]);
  v2 = (void *)_MergedGlobals_210;
  _MergedGlobals_210 = (uint64_t)v1;
}

+ (Class)proxyClass
{
  v2 = (void *)qword_1EB29F800;
  if (!qword_1EB29F800) {
    v2 = objc_opt_class();
  }

  return (Class)v2;
}

+ (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v6 = [a1 _proxy];
  int v7 = [v6 isLocationShiftEnabled];

  if (!v7) {
    return 0;
  }
  v8 = [a1 _proxy];
  char v9 = objc_msgSend(v8, "isLocationShiftRequiredForCoordinate:", var0, var1);

  return v9;
}

+ (_GEOLocationShifterProxy)_proxy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__GEOLocationShifter__proxy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29F808 != -1) {
    dispatch_once(&qword_1EB29F808, block);
  }
  v2 = (void *)_MergedGlobals_210;

  return (_GEOLocationShifterProxy *)v2;
}

- (void)shiftCoordinate:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5 mustGoToNetworkCallback:(id)a6 errorHandler:(id)a7 callbackQueue:(id)a8
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  v19 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
  [(GEOLocationShifter *)self shiftLatLng:v19 accuracy:v18 withCompletionHandler:v17 mustGoToNetworkCallback:v16 errorHandler:v15 callbackQueue:a4];
}

- (void)shiftLatLng:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5 mustGoToNetworkCallback:(id)a6 errorHandler:(id)a7 callbackQueue:(id)a8
{
}

- (void)shiftLatLng:(id)a3 accuracy:(double)a4 auditToken:(id)a5 withCompletionHandler:(id)a6 mustGoToNetworkCallback:(id)a7 errorHandler:(id)a8 callbackQueue:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  v22 = [[_GEOLocationShiftLocation alloc] initWithLatLng:v21 accuracy:v19 completionHandler:v17 errorHandler:v18 mustGoToNetworkCallback:v16 callbackQueue:v20 auditToken:a4];

  [(GEOLocationShifter *)self _shiftLocation:v22];
}

- (BOOL)_shiftLocation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 latLng];
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;

  if (objc_msgSend((id)objc_opt_class(), "isLocationShiftRequiredForCoordinate:", v7, v9))
  {
    os_unfair_lock_lock_with_options();
    [(NSCache *)self->_shiftFunctionCache allObjects];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "isValidForCoordinate:", v7, v9))
          {
            os_unfair_lock_unlock(&self->_lock);
            [v4 accuracy];
            uint64_t v20 = v18;
            objc_msgSend(v15, "shiftedCoordinateForCoordinate:accuracy:", &v20, v7, v9);
            objc_msgSend(v4, "performCompletionHandlerWithShiftedCoordinate:accuracy:function:", v15);

            BOOL v16 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [(NSMutableArray *)self->_locationsToShift addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    [v4 performMustGoToNetwork];
    [(GEOLocationShifter *)self _requestNextShiftFunctionIfNecessary];
    BOOL v16 = 0;
LABEL_13:
  }
  else
  {
    [v4 accuracy];
    objc_msgSend(v4, "performCompletionHandlerWithShiftedCoordinate:accuracy:function:", 0, v7, v9, v17);
    BOOL v16 = 0;
  }

  return v16;
}

+ (BOOL)isLocationShiftEnabled
{
  v2 = [a1 _proxy];
  char v3 = [v2 isLocationShiftEnabled];

  return v3;
}

+ (void)setProxyClass:(Class)a3
{
  id v4 = &unk_1ED77F210;
  if (_MergedGlobals_210)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v10 = 0;
      v5 = MEMORY[0x1E4F14500];
      double v6 = "Assertion failed: !_shifterProxy";
      double v7 = (uint8_t *)&v10;
LABEL_10:
      _os_log_fault_impl(&dword_188D96000, v5, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
LABEL_11:
    __break(1u);
    return;
  }
  id v8 = v4;
  if (([(objc_class *)a3 conformsToProtocol:v4] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x1E4F14500];
      double v6 = "Assertion failed: [proxyClass conformsToProtocol:protocol]";
      double v7 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  qword_1EB29F800 = (uint64_t)a3;
}

- (GEOLocationShifter)init
{
  v19.receiver = self;
  v19.super_class = (Class)GEOLocationShifter;
  v2 = [(GEOLocationShifter *)&v19 init];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__countryProvidersDidChange_ name:@"GEOCountryConfigurationProvidersDidChangeNotification" object:0];
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    locationsToShift = v2->_locationsToShift;
    v2->_locationsToShift = v4;

    double v6 = [(id)objc_opt_class() _proxy];
    uint64_t v7 = [v6 queue];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    double v9 = [(id)objc_opt_class() _proxy];
    uint64_t v10 = [v9 memoryCache];
    shiftFunctionCache = v2->_shiftFunctionCache;
    v2->_shiftFunctionCache = (NSCache *)v10;

    uint64_t v12 = +[GEOResourceManifestManager modernManager];
    global_queue = (void *)geo_get_global_queue();
    [v12 addTileGroupObserver:v2 queue:global_queue];

    objc_initWeak(&location, v2);
    v14 = v2->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __26__GEOLocationShifter_init__block_invoke;
    v16[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch("com.apple.Preferences.ResetPrivacyWarningsNotification", &v2->_resetPrivacyToken, v14, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__GEOLocationShifter_init__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 3;
    char v3 = (id *)WeakRetained;
    os_unfair_lock_lock_with_options();
    [v3[3] removeAllObjects];
    os_unfair_lock_unlock(v2);
    WeakRetained = (os_unfair_lock_s *)v3;
  }
}

- (void)dealloc
{
  notify_cancel(self->_resetPrivacyToken);
  char v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)GEOLocationShifter;
  [(GEOLocationShifter *)&v5 dealloc];
}

+ (unsigned)locationShiftFunctionVersion
{
  v2 = [a1 _proxy];
  unsigned int v3 = [v2 locationShiftFunctionVersion];

  return v3;
}

- (BOOL)locationShiftEnabled
{
  v2 = objc_opt_class();

  return [v2 isLocationShiftEnabled];
}

- (void)_reset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isRequestingShiftFunction = 0;
  id v4 = (void *)[(NSMutableArray *)self->_locationsToShift copy];
  [(NSMutableArray *)self->_locationsToShift removeAllObjects];
  [(NSCache *)self->_shiftFunctionCache removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLocationShifter _shiftLocation:](self, "_shiftLocation:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_requestNextShiftFunctionIfNecessary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_isRequestingShiftFunction || ![(NSMutableArray *)self->_locationsToShift count])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_isRequestingShiftFunction = 1;
    id v4 = [(NSMutableArray *)self->_locationsToShift firstObject];
    id v5 = [v4 latLng];
    os_unfair_lock_unlock(p_lock);
    uint64_t v6 = [(id)objc_opt_class() _proxy];
    uint64_t v7 = [v4 auditToken];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__GEOLocationShifter__requestNextShiftFunctionIfNecessary__block_invoke;
    v8[3] = &unk_1E53DEF08;
    v8[4] = self;
    [v6 shiftLatLng:v5 auditToken:v7 completionHandler:v8];
  }
}

void __58__GEOLocationShifter__requestNextShiftFunctionIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  if (v6)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * i) performErrorHandler:v6];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v10);
    }
    long long v13 = v8;
  }
  else
  {
    if (v5)
    {
      v14 = *(void **)(*(void *)(a1 + 32) + 24);
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
      BOOL v16 = [v15 UUIDString];
      [v14 setObject:v5 forKey:v16];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    uint64_t v17 = a1;
    uint64_t v18 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v54 count:16];
    obuint64_t j = v19;
    if (v20)
    {
      uint64_t v21 = v20;
      long long v22 = 0;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v26 = objc_msgSend(v25, "latLng", obj);
          [v26 coordinate];
          int v27 = objc_msgSend(v5, "isValidForCoordinate:");

          if (v27)
          {
            if (!v22)
            {
              long long v22 = [MEMORY[0x1E4F1CA48] array];
            }
            [v22 addObject:v25];
            [*(id *)(*(void *)(v17 + 32) + 16) removeObject:v25];
          }
        }
        id v19 = obj;
        uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v21);
    }
    else
    {
      long long v22 = 0;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v17 + 32) + 12));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = v22;
    uint64_t v28 = [v8 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v8);
          }
          v32 = *(void **)(*((void *)&v41 + 1) + 8 * k);
          v33 = objc_msgSend(v32, "latLng", obj);
          [v33 coordinate];
          double v35 = v34;
          double v37 = v36;

          uint64_t v40 = 0;
          [v32 accuracy];
          uint64_t v40 = v38;
          objc_msgSend(v5, "shiftedCoordinateForCoordinate:accuracy:", &v40, v35, v37);
          objc_msgSend(v32, "performCompletionHandlerWithShiftedCoordinate:accuracy:function:", v5);
        }
        uint64_t v29 = [v8 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v29);
    }

    [*(id *)(v17 + 32) _requestNextShiftFunctionIfNecessary];
    long long v13 = obj;
  }
}

- (void)shiftCoordinate:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  uint64_t v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
  [(GEOLocationShifter *)self shiftLatLng:v10 accuracy:v9 withCompletionHandler:a4];
}

- (void)shiftLatLng:(id)a3 accuracy:(double)a4 withCompletionHandler:(id)a5
{
}

- (BOOL)shiftCoordinate:(id)a3 accuracy:(double)a4 shiftedCoordinate:(id *)a5 shiftedAccuracy:(double *)a6
{
  uint64_t v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a3.var0, a3.var1);
  LOBYTE(a6) = [(GEOLocationShifter *)self shiftLatLng:v10 accuracy:a5 shiftedCoordinate:a6 shiftedAccuracy:a4];

  return (char)a6;
}

- (BOOL)shiftLatLng:(id)a3 accuracy:(double)a4 shiftedCoordinate:(id *)a5 shiftedAccuracy:(double *)a6
{
  id v10 = a3;
  uint64_t v26 = 0;
  int v27 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)&v26;
  uint64_t v28 = 0x3010000000;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = "";
  [v10 coordinate];
  uint64_t v30 = v11;
  uint64_t v31 = v12;
  uint64_t v22 = 0;
  uint64_t v23 = (double *)&v22;
  uint64_t v24 = 0x2020000000;
  double v25 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  long long v13 = [_GEOLocationShiftLocation alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__GEOLocationShifter_shiftLatLng_accuracy_shiftedCoordinate_shiftedAccuracy___block_invoke;
  v17[3] = &unk_1E53DEF30;
  v17[4] = &v18;
  v17[5] = &v26;
  v17[6] = &v22;
  v14 = [(_GEOLocationShiftLocation *)v13 initWithLatLng:v10 accuracy:v17 completionHandler:0 errorHandler:0 mustGoToNetworkCallback:0 callbackQueue:a4];
  if ([(GEOLocationShifter *)self _shiftLocation:v14] && *((unsigned char *)v19 + 24))
  {
    if (a5) {
      *a5 = v27[2];
    }
    if (a6) {
      *a6 = v23[3];
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

void *__77__GEOLocationShifter_shiftLatLng_accuracy_shiftedCoordinate_shiftedAccuracy___block_invoke(void *result, double a2, double a3, double a4)
{
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
  uint64_t v4 = *(void *)(result[5] + 8);
  *(double *)(v4 + 32) = a2;
  *(double *)(v4 + 40) = a3;
  *(double *)(*(void *)(result[6] + 8) + 24) = a4;
  return result;
}

- (void)_fetchShiftFunctionForLatLng:(id)a3 auditToken:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    v14 = [_GEOLocationShiftLocation alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke;
    v21[3] = &unk_1E53DEF58;
    id v22 = v10;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke_2;
    id v19 = &unk_1E53DB698;
    id v20 = v22;
    BOOL v15 = [(_GEOLocationShiftLocation *)v14 initWithLatLng:v13 auditToken:v12 functionHandler:v21 errorHandler:&v16 callbackQueue:v11];

    -[GEOLocationShifter _shiftLocation:](self, "_shiftLocation:", v15, v16, v17, v18, v19);
  }
}

uint64_t __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__GEOLocationShifter__fetchShiftFunctionForLatLng_auditToken_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchSerializedCachedShiftFunctionResponseForRequest:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8)
  {
    id v12 = [[GEOPolyLocationShiftRequest alloc] initWithData:v8];
    id v13 = v12;
    if (v12
      && ([(GEOPolyLocationShiftRequest *)v12 location],
          v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      BOOL v15 = [(GEOPolyLocationShiftRequest *)v13 location];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_3;
      v17[3] = &unk_1E53DEF80;
      uint64_t v16 = &v18;
      id v18 = v11;
      [(GEOLocationShifter *)self _fetchCachedShiftFunctionResponseForLocation:v15 callbackQueue:v9 completionHandler:v17];
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_2;
      v19[3] = &unk_1E53DA028;
      uint64_t v16 = &v20;
      id v20 = v11;
      dispatch_async(v9, v19);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v22 = (GEOPolyLocationShiftRequest *)v10;
    dispatch_async(v9, block);
    id v13 = v22;
  }
}

void __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __108__GEOLocationShifter__fetchSerializedCachedShiftFunctionResponseForRequest_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = a3;
    id v8 = [a2 toServerResponse];
    id v6 = [v8 data];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);
  }
  else
  {
    uint64_t v7 = *(void (**)(uint64_t, void))(v3 + 16);
    id v8 = a3;
    v7(v3, 0);
  }
}

- (void)_fetchCachedShiftFunctionResponseForLocation:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    id v10 = [(id)objc_opt_class() _proxy];
    [v10 fetchCachedShiftFunctionResponseForLocation:v9 callbackQueue:v8 completionHandler:v7];
  }
}

+ (void)flushDiskCache
{
  id v2 = [a1 _proxy];
  [v2 flushDiskCache];
}

+ (void)pruneDiskCache
{
  id v2 = [a1 _proxy];
  [v2 pruneDiskCache];
}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_shiftFunctionCache, 0);

  objc_storeStrong((id *)&self->_locationsToShift, 0);
}

@end