@interface CLSCachedGeocoderOperation
+ (id)operationForceGeocoderWithLocation:(id)a3;
+ (id)operationForceGeocoderWithLocation:(id)a3 withAccuracy:(double)a4;
+ (id)operationWithLocation:(id)a3;
+ (id)operationWithLocation:(id)a3 withAccuracy:(double)a4;
- (CLSCachedGeocoderOperation)initWithLocation:(id)a3 withAccuracy:(double)a4;
- (id)performSynchronouslyWithLocationCache:(id)a3 error:(id *)a4;
- (void)_executeQueryWithResultBlock:(id)a3;
- (void)_returnsResultsForPlacemarks:(id)a3 error:(id)a4 resultBlock:(id)a5;
- (void)_setupTimeOutForGeocoder:(id)a3 resultBlock:(id)a4;
- (void)_stopTimeOut;
- (void)_timedOutForGeocoder:(id)a3 withResultBlock:(id)a4;
@end

@implementation CLSCachedGeocoderOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong(&self->_location, 0);
}

- (void)_executeQueryWithResultBlock:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_location;
  v6 = self;
  objc_sync_enter(v6);
  v6->_cancelled = 0;
  objc_sync_exit(v6);

  objc_initWeak(&location, v6);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1E5C8]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __59__CLSCachedGeocoderOperation__executeQueryWithResultBlock___block_invoke;
  v16 = &unk_1E690EC50;
  objc_copyWeak(&v18, &location);
  id v8 = v4;
  id v17 = v8;
  v9 = (void *)MEMORY[0x1D2602540](&v13);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CLSCachedGeocoderOperation *)v6 _setupTimeOutForGeocoder:v7 resultBlock:v8];
        v12 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v5];
        [v7 geocodePostalAddress:v12 completionHandler:v9];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CLSCachedGeocoderOperation *)v6 _setupTimeOutForGeocoder:v7 resultBlock:v8];
          [v7 geocodeAddressString:v5 completionHandler:v9];
          goto LABEL_9;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CLSCachedGeocoderOperation *)v6 _setupTimeOutForGeocoder:v7 resultBlock:v8];
          [v7 geocodePostalAddress:v5 completionHandler:v9];
          goto LABEL_9;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
          goto LABEL_9;
        }
        v20[0] = v5;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
        (*((void (**)(id, void *, void))v8 + 2))(v8, v12, 0);
      }
      goto LABEL_8;
    }
  }
  if (!v6->_forceQuery)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = [NSString stringWithFormat:@"Try to reverse geocode individual location: %@", v5, v13, v14, v15, v16];
    v12 = [v10 errorWithDescription:v11];

    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
LABEL_8:

    goto LABEL_9;
  }
  [(CLSCachedGeocoderOperation *)v6 _setupTimeOutForGeocoder:v7 resultBlock:v8];
  [v7 reverseGeocodeLocation:v5 completionHandler:v9];
LABEL_9:

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __59__CLSCachedGeocoderOperation__executeQueryWithResultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _returnsResultsForPlacemarks:v7 error:v6 resultBlock:*(void *)(a1 + 32)];
}

- (void)_returnsResultsForPlacemarks:(id)a3 error:(id)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_cancelled) {
    goto LABEL_11;
  }
  [(CLSCachedGeocoderOperation *)v11 _stopTimeOut];
  v12 = [v9 domain];
  if (![v12 isEqualToString:*MEMORY[0x1E4F1E6C8]])
  {

    goto LABEL_6;
  }
  if ([v9 code] != 8)
  {
    uint64_t v13 = [v9 code];

    if (v13 == 9) {
      goto LABEL_8;
    }
LABEL_6:
    v10[2](v10, v8, v9);
    goto LABEL_11;
  }

LABEL_8:
  uint64_t v14 = +[CLSLogging sharedLogging];
  v15 = [v14 loggingConnection];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16[0] = 0;
    _os_log_impl(&dword_1D2150000, v15, OS_LOG_TYPE_INFO, "Forward GEO lookup returned no result", (uint8_t *)v16, 2u);
  }

  v10[2](v10, (id)MEMORY[0x1E4F1CBF0], 0);
LABEL_11:
  objc_sync_exit(v11);
}

- (void)_stopTimeOut
{
  obj = self;
  objc_sync_enter(obj);
  timer = obj->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v3 = obj->_timer;
    obj->_timer = 0;
  }
  objc_sync_exit(obj);
}

- (void)_setupTimeOutForGeocoder:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
  timer = self->_timer;
  self->_timer = v8;

  v10 = self->_timer;
  dispatch_time_t v11 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__CLSCachedGeocoderOperation__setupTimeOutForGeocoder_resultBlock___block_invoke;
  v15[3] = &unk_1E690EC28;
  objc_copyWeak(&v18, &location);
  id v16 = v6;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = (void *)MEMORY[0x1D2602540](v15);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v14);
  dispatch_activate((dispatch_object_t)self->_timer);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __67__CLSCachedGeocoderOperation__setupTimeOutForGeocoder_resultBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _timedOutForGeocoder:*(void *)(a1 + 32) withResultBlock:*(void *)(a1 + 40)];
}

- (void)_timedOutForGeocoder:(id)a3 withResultBlock:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = self;
  objc_sync_enter(v7);
  v7->_cancelled = 1;
  timer = v7->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v9 = v7->_timer;
    v7->_timer = 0;

    [v13 cancelGeocode];
    v10 = (void *)MEMORY[0x1E4F28C58];
    dispatch_time_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Hit timeout of %ld getting person address", 2);
    id v12 = [v10 errorWithDescription:v11];
    v6[2](v6, 0, v12);
  }
  objc_sync_exit(v7);
}

- (id)performSynchronouslyWithLocationCache:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__907;
  v34 = __Block_byref_object_dispose__908;
  id v35 = [v6 placemarksForLocation:self->_location];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__907;
  v28 = __Block_byref_object_dispose__908;
  id v29 = 0;
  if (!v31[5])
  {
    id v7 = 0;
    double accuracy = self->_accuracy;
    if (accuracy != 0.0 && accuracy != *MEMORY[0x1E4F1E6D8] && accuracy != *MEMORY[0x1E4F1E6E0])
    {
      uint64_t v10 = objc_msgSend(v6, "placemarksForLocation:withQueryAccuracy:", self->_location);
      dispatch_time_t v11 = (void *)v31[5];
      v31[5] = v10;

      id v7 = (void *)v31[5];
    }
    if (![v7 count])
    {
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      id v13 = self->_location;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__CLSCachedGeocoderOperation_performSynchronouslyWithLocationCache_error___block_invoke;
      v18[3] = &unk_1E690EC00;
      v22 = &v24;
      id v19 = v6;
      id v14 = v13;
      id v20 = v14;
      v23 = &v30;
      v15 = v12;
      v21 = v15;
      [(CLSCachedGeocoderOperation *)self _executeQueryWithResultBlock:v18];
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  if (a4) {
    *a4 = (id) v25[5];
  }
  id v16 = (id)v31[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __74__CLSCachedGeocoderOperation_performSynchronouslyWithLocationCache_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          id v14 = [CLSLitePlacemark alloc];
          v15 = -[CLSLitePlacemark initWithCLPlacemark:](v14, "initWithCLPlacemark:", v13, (void)v18);
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 32) setPlacemarks:v7 forLocation:*(void *)(a1 + 40)];
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v7;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (CLSCachedGeocoderOperation)initWithLocation:(id)a3 withAccuracy:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSCachedGeocoderOperation;
  id v8 = [(CLSCachedGeocoderOperation *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_location, a3);
    v9->_double accuracy = a4;
  }

  return v9;
}

+ (id)operationForceGeocoderWithLocation:(id)a3 withAccuracy:(double)a4
{
  id result = (id)[a1 operationWithLocation:a3 withAccuracy:a4];
  *((unsigned char *)result + 8) = 1;
  return result;
}

+ (id)operationForceGeocoderWithLocation:(id)a3
{
  id result = (id)[a1 operationWithLocation:a3];
  *((unsigned char *)result + 8) = 1;
  return result;
}

+ (id)operationWithLocation:(id)a3 withAccuracy:(double)a4
{
  id v5 = a3;
  id v6 = [[CLSCachedGeocoderOperation alloc] initWithLocation:v5 withAccuracy:a4];

  return v6;
}

+ (id)operationWithLocation:(id)a3
{
  id v3 = a3;
  id v4 = [CLSCachedGeocoderOperation alloc];
  id v5 = [(CLSCachedGeocoderOperation *)v4 initWithLocation:v3 withAccuracy:*MEMORY[0x1E4F1E6D8]];

  return v5;
}

@end