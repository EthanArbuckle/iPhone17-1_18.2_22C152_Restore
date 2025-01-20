@interface IRMiLoProvider
+ (BOOL)deleteServiceWithToken:(id)a3;
+ (BOOL)isConfidenceValid:(int64_t)a3;
+ (BOOL)isInMotion:(unint64_t)a3;
+ (BOOL)isQualityValid:(int64_t)a3;
+ (int64_t)highConfidenceValue;
- (BOOL)isLowLatency;
- (BOOL)isMiLoServiceStateRunning;
- (BOOL)spotOnLocationRequested;
- (BOOL)startLowLatencyMiLo;
- (IRMiLoProvider)initWithQueue:(id)a3;
- (IRMiLoProviderObserverProtocol)observer;
- (NSString)miloServiceStatusStringQE;
- (NSUUID)legacyServiceUUID;
- (NSUUID)requestSinglePredictionIdentifier;
- (NSUUID)serviceUUID;
- (OS_dispatch_queue)queue;
- (ULConnection)connection;
- (id)_miloServiceStatusLogStringFromStatus:(id)a3;
- (id)getMiloServiceStatusStringQEWithPrediction:(id)a3;
- (id)requestSinglePrediction;
- (int)_locationTypeToIRLocationSemantic:(id)a3;
- (int)miLoConnectionProgressStatus;
- (int)numberOfConsecutiveMiLoFailAttempts;
- (int64_t)_bitmapFromServiceQualityReasonArray:(id)a3;
- (int64_t)_bitmapFromServiceSuspendedReasonArray:(id)a3;
- (int64_t)miLoServiceQuality;
- (int64_t)miLoServiceQualityReasonBitmap;
- (int64_t)miLoServiceSuspendedReasonBitmap;
- (void)_connectToLslService;
- (void)_serviceReset;
- (void)_serviceResetAndIncreaseFailCount;
- (void)addObserver:(id)a3 withToken:(id)a4 withLegacyServiceUUID:(id)a5 isLowLatency:(BOOL)a6;
- (void)connection:(id)a3 didCompleteRequest:(id)a4 withError:(id)a5;
- (void)connection:(id)a3 didEnableMicrolocationAtCurrentLocationWithError:(id)a4;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didUpdatePrediction:(id)a4;
- (void)connection:(id)a3 didUpdateServiceStatus:(id)a4;
- (void)labelPredictionUuid:(id)a3 withEventUuid:(id)a4;
- (void)recoverServiceIfRequired;
- (void)removeObserver;
- (void)resetSpotOnLocationRequest;
- (void)setConnection:(id)a3;
- (void)setIsLowLatency:(BOOL)a3;
- (void)setIsMiLoServiceStateRunning:(BOOL)a3;
- (void)setLegacyServiceUUID:(id)a3;
- (void)setMiLoConnectionProgressStatus:(int)a3;
- (void)setMiLoServiceQuality:(int64_t)a3;
- (void)setMiLoServiceQualityReasonBitmap:(int64_t)a3;
- (void)setMiLoServiceSuspendedReasonBitmap:(int64_t)a3;
- (void)setMiloServiceStatusStringQE:(id)a3;
- (void)setNumberOfConsecutiveMiLoFailAttempts:(int)a3;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestSinglePredictionIdentifier:(id)a3;
- (void)setServiceUUID:(id)a3;
- (void)setSpotOnLocation;
- (void)setSpotOnLocationRequested:(BOOL)a3;
@end

@implementation IRMiLoProvider

- (void)recoverServiceIfRequired
{
  uint64_t v3 = [(IRMiLoProvider *)self observer];
  if (v3)
  {
    v4 = (void *)v3;
    int v5 = [(IRMiLoProvider *)self miLoConnectionProgressStatus];

    if (!v5)
    {
      [(IRMiLoProvider *)self _connectToLslService];
    }
  }
}

- (IRMiLoProviderObserverProtocol)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (IRMiLoProviderObserverProtocol *)WeakRetained;
}

- (int)miLoConnectionProgressStatus
{
  return self->_miLoConnectionProgressStatus;
}

- (id)getMiloServiceStatusStringQEWithPrediction:(id)a3
{
  id v4 = a3;
  int v5 = [(IRMiLoProvider *)self miloServiceStatusStringQE];
  v6 = [v4 predictionId];
  if ([(IRMiLoProvider *)self isLowLatency]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "confidence"));
  v9 = [v4 predictionTime];
  v10 = [MEMORY[0x263EFFA18] localTimeZone];
  v11 = objc_msgSend(v9, "dateByAddingTimeInterval:", (double)objc_msgSend(v10, "secondsFromGMT"));
  v12 = NSNumber;
  uint64_t v13 = [v4 confidenceReasonBitmap];

  v14 = [v12 numberWithLongLong:v13];
  v15 = [v5 stringByAppendingFormat:@" predictionId: %@\n isLowLatency: %@\n confidence: %@\n predictionTime: %@ \n confidenceReasons: %@", v6, v7, v8, v11, v14];

  return v15;
}

- (NSString)miloServiceStatusStringQE
{
  return self->_miloServiceStatusStringQE;
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

+ (BOOL)deleteServiceWithToken:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F55790] createServiceIdentifierForToken:v3];
  if (v4)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v6 = (void *)MEMORY[0x263F55790];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__IRMiLoProvider_deleteServiceWithToken___block_invoke;
    v11[3] = &unk_2653A04D8;
    uint64_t v13 = &v14;
    v7 = v5;
    v12 = v7;
    [v6 deleteServiceWithIdentifier:v4 reply:v11];
    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v7, v8);
    BOOL v9 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

intptr_t __41__IRMiLoProvider_deleteServiceWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (int64_t)highConfidenceValue
{
  return 30;
}

+ (BOOL)isQualityValid:(int64_t)a3
{
  return a3 > 10;
}

+ (BOOL)isInMotion:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

+ (BOOL)isConfidenceValid:(int64_t)a3
{
  return a3 > 1;
}

- (IRMiLoProvider)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IRMiLoProvider;
  dispatch_semaphore_t v5 = [(IRMiLoProvider *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(IRMiLoProvider *)v5 setQueue:v4];
    [(IRMiLoProvider *)v6 setMiloServiceStatusStringQE:@"MiLo State:nil"];
  }

  return v6;
}

- (void)addObserver:(id)a3 withToken:(id)a4 withLegacyServiceUUID:(id)a5 isLowLatency:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (char *)a4;
  id v12 = a5;
  uint64_t v13 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  uint64_t v14 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    v15 = NSNumber;
    uint64_t v16 = v14;
    char v17 = [v15 numberWithBool:v6];
    int v21 = 136316162;
    v22 = "#milo-provider, ";
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_INFO, "%s[%@], Adding MiLo observer with token: %@, legacyServiceUUID: %@, isLowLatency: %@", (uint8_t *)&v21, 0x34u);
  }
  v18 = [(IRMiLoProvider *)self observer];

  if (!v18)
  {
    [(IRMiLoProvider *)self setNumberOfConsecutiveMiLoFailAttempts:0];
    [(IRMiLoProvider *)self setObserver:v10];
    [(IRMiLoProvider *)self setLegacyServiceUUID:v12];
    [(IRMiLoProvider *)self setIsLowLatency:v6];
    v19 = [MEMORY[0x263F55790] createServiceIdentifierForToken:v11];
    [(IRMiLoProvider *)self setServiceUUID:v19];

    v20 = [(IRMiLoProvider *)self serviceUUID];

    if (!v20) {
      -[IRMiLoProvider addObserver:withToken:withLegacyServiceUUID:isLowLatency:](v11);
    }
    [(IRMiLoProvider *)self _connectToLslService];
  }
}

- (void)removeObserver
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "#milo-provider, ";
    __int16 v8 = 2112;
    BOOL v9 = v3;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_INFO, "%s[%@], Removing MiLo observer", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_t v5 = [(IRMiLoProvider *)self observer];

  if (v5)
  {
    [(IRMiLoProvider *)self setObserver:0];
    [(IRMiLoProvider *)self setServiceUUID:0];
    [(IRMiLoProvider *)self setLegacyServiceUUID:0];
    [(IRMiLoProvider *)self setIsLowLatency:0];
    [(IRMiLoProvider *)self setNumberOfConsecutiveMiLoFailAttempts:0];
    [(IRMiLoProvider *)self _serviceReset];
  }
}

- (void)labelPredictionUuid:(id)a3 withEventUuid:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  BOOL v9 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315906;
    uint64_t v13 = "#milo-provider, ";
    __int16 v14 = 2112;
    v15 = v8;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_INFO, "%s[%@], Labeling MiLo observation: predictionUuid: %@, eventUuid: %@", (uint8_t *)&v12, 0x2Au);
  }

  uint64_t v10 = [(IRMiLoProvider *)self connection];
  id v11 = (id)[v10 labelRequestIdentifier:v6 withPlaceIdentifier:v7];
}

- (id)requestSinglePrediction
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(IRMiLoProvider *)self isMiLoServiceStateRunning]
    && ([(IRMiLoProvider *)self observer], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v4 = (void *)v3,
        [(IRMiLoProvider *)self requestSinglePredictionIdentifier],
        dispatch_semaphore_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    __int16 v14 = [(IRMiLoProvider *)self connection];
    v15 = [v14 requestPrediction];
    [(IRMiLoProvider *)self setRequestSinglePredictionIdentifier:v15];

    id v6 = @"YES";
  }
  else
  {
    id v6 = @"NO";
  }
  id v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  __int16 v8 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    BOOL v9 = v8;
    uint64_t v10 = [(IRMiLoProvider *)self requestSinglePredictionIdentifier];
    int v16 = 136315906;
    id v17 = "#milo-provider, ";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    int v21 = v6;
    __int16 v22 = 2112;
    __int16 v23 = v10;
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_INFO, "%s[%@], Single prediction requested, complied = %@, request-id (updated if complied): %@", (uint8_t *)&v16, 0x2Au);
  }
  id v11 = [(IRMiLoProvider *)self requestSinglePredictionIdentifier];
  int v12 = [v11 UUIDString];

  return v12;
}

- (BOOL)startLowLatencyMiLo
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(IRMiLoProvider *)self miLoConnectionProgressStatus] != 2)
  {
    uint64_t v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    dispatch_semaphore_t v5 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      id v6 = NSNumber;
      id v7 = v5;
      __int16 v8 = objc_msgSend(v6, "numberWithUnsignedInt:", -[IRMiLoProvider miLoConnectionProgressStatus](self, "miLoConnectionProgressStatus"));
      int v15 = 136315650;
      int v16 = "#milo-provider, ";
      __int16 v17 = 2112;
      __int16 v18 = v3;
      __int16 v19 = 2112;
      __int16 v20 = v8;
      _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - MiLo start low latency] MiLo connection status is not connected: %@", (uint8_t *)&v15, 0x20u);
    }
    goto LABEL_7;
  }
  if ([(IRMiLoProvider *)self isLowLatency])
  {
    uint64_t v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    id v4 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      int v16 = "#milo-provider, ";
      __int16 v17 = 2112;
      __int16 v18 = v3;
      _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - MiLo start low latency] API was called after low latency is already enabled", (uint8_t *)&v15, 0x16u);
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  BOOL v9 = 1;
  [(IRMiLoProvider *)self setIsLowLatency:1];
  id v11 = [(IRMiLoProvider *)self connection];
  int v12 = objc_msgSend(objc_alloc(MEMORY[0x263F557F0]), "initWithIsLowLatency:", -[IRMiLoProvider isLowLatency](self, "isLowLatency"));
  id v13 = (id)[v11 startUpdatingWithConfiguration:v12];

  uint64_t v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  __int16 v14 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    int v16 = "#milo-provider, ";
    __int16 v17 = 2112;
    __int16 v18 = v3;
    _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_INFO, "%s[%@], Starting LowLatency connection for MiLo", (uint8_t *)&v15, 0x16u);
  }
LABEL_8:

  return v9;
}

- (void)setSpotOnLocation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [(IRMiLoProvider *)self spotOnLocationRequested];
  id v4 = (const void **)MEMORY[0x263F50120];
  dispatch_semaphore_t v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v6 = (os_log_t *)MEMORY[0x263F50090];
  id v7 = *MEMORY[0x263F50090];
  __int16 v8 = *MEMORY[0x263F50090];
  if (v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "#milo-provider, ";
      __int16 v21 = 2112;
      __int16 v22 = v5;
      _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - MiLo provider got setSpotOnLocation twice] MiLo already waiting for spotOn response", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "#milo-provider, ";
      __int16 v21 = 2112;
      __int16 v22 = v5;
      _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_INFO, "%s[%@], MiLo provider got setSpotOnLocation", buf, 0x16u);
    }

    if ([(IRMiLoProvider *)self miLoConnectionProgressStatus] == 2)
    {
      BOOL v9 = [(IRMiLoProvider *)self connection];
      [v9 enableMicrolocationAtCurrentLocation];

      [(IRMiLoProvider *)self setSpotOnLocationRequested:1];
    }
    else
    {
      uint64_t v10 = dispatch_get_specific(*v4);
      id v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v20 = "#milo-provider, ";
        __int16 v21 = 2112;
        __int16 v22 = v10;
        _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_INFO, "%s[%@], MiLo not connected, responding to setSpotOnLocation with error", buf, 0x16u);
      }

      int v12 = [(IRMiLoProvider *)self observer];
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F50088];
      uint64_t v17 = *MEMORY[0x263F08338];
      __int16 v18 = @"MiLo Unavailable";
      int v15 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      int v16 = [v13 errorWithDomain:v14 code:-12899 userInfo:v15];
      [v12 didSpotOnLocationCompleteWithError:v16];
    }
  }
}

- (void)resetSpotOnLocationRequest
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "#milo-provider, ";
    __int16 v7 = 2112;
    __int16 v8 = v3;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_INFO, "%s[%@], resetting spotOnLocationRquest", (uint8_t *)&v5, 0x16u);
  }

  [(IRMiLoProvider *)self setSpotOnLocationRequested:0];
}

- (void)_connectToLslService
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v4 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v5 = v4;
    id v6 = [(IRMiLoProvider *)self serviceUUID];
    int v16 = 136315650;
    uint64_t v17 = "#milo-provider, ";
    __int16 v18 = 2112;
    __int16 v19 = v3;
    __int16 v20 = 2112;
    __int16 v21 = v6;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_INFO, "%s[%@], Connecting to LSL service for identifier: %@", (uint8_t *)&v16, 0x20u);
  }
  __int16 v7 = [(IRMiLoProvider *)self connection];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F55790]);
    uint64_t v9 = [(IRMiLoProvider *)self serviceUUID];
    uint64_t v10 = (void *)[v8 initWithDelegate:self serviceIdentifier:v9];
    [(IRMiLoProvider *)self setConnection:v10];

    id v11 = [(IRMiLoProvider *)self legacyServiceUUID];

    if (v11)
    {
      int v12 = [(IRMiLoProvider *)self connection];
      id v13 = [(IRMiLoProvider *)self legacyServiceUUID];
      [v12 updateLegacyServiceIdentifier:v13];
    }
  }
  uint64_t v14 = [(IRMiLoProvider *)self connection];
  id v15 = (id)[v14 connect];

  [(IRMiLoProvider *)self setMiLoConnectionProgressStatus:1];
}

- (id)_miloServiceStatusLogStringFromStatus:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v5 = [v4 serviceSuspendReasons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = @"<";
    do
    {
      uint64_t v10 = 0;
      id v11 = v9;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v10) suspendReasonEnum];
        int v12 = ULServiceSuspendReasonToString();
        uint64_t v9 = [(__CFString *)v11 stringByAppendingString:v12];

        ++v10;
        id v11 = v9;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = @"<";
  }

  v26 = [(__CFString *)v9 stringByAppendingString:@">"];

  id v13 = NSString;
  __int16 v25 = [v4 serviceDescriptor];
  uint64_t v14 = [v25 serviceIdentifier];
  [v4 serviceState];
  id v15 = ULServiceStateToString();
  int v16 = NSNumber;
  uint64_t v17 = [v4 serviceQualityInfo];
  __int16 v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "serviceQuality"));
  __int16 v19 = [v4 error];
  if (v19)
  {
    __int16 v20 = NSNumber;
    BOOL v3 = [v4 error];
    __int16 v21 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v3, "code"));
  }
  else
  {
    __int16 v21 = 0;
  }
  uint64_t v22 = [v4 currentLocationOfInterestUuid];
  uint64_t v23 = [v13 stringWithFormat:@"MiLo State:\n milo service id: %@\n State: %@\n Suspend reasons:%@\n Quality index:%@\n error:%@\n currentGroupId %@\n", v14, v15, v26, v18, v21, v22];

  if (v19)
  {
  }

  return v23;
}

- (void)_serviceReset
{
  [(IRMiLoProvider *)self setIsMiLoServiceStateRunning:0];
  [(IRMiLoProvider *)self setConnection:0];
  [(IRMiLoProvider *)self setMiLoConnectionProgressStatus:0];
  uint64_t v3 = [(IRMiLoProvider *)self observer];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = [(IRMiLoProvider *)self numberOfConsecutiveMiLoFailAttempts];
    uint64_t v6 = +[IRPreferences shared];
    uint64_t v7 = [v6 miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts];
    uint64_t v8 = [v7 integerValue];

    if (v8 >= v5)
    {
      [(IRMiLoProvider *)self _connectToLslService];
    }
  }
}

- (void)_serviceResetAndIncreaseFailCount
{
  [(IRMiLoProvider *)self setNumberOfConsecutiveMiLoFailAttempts:[(IRMiLoProvider *)self numberOfConsecutiveMiLoFailAttempts] + 1];

  [(IRMiLoProvider *)self _serviceReset];
}

- (int64_t)_bitmapFromServiceQualityReasonArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= 1 << [*(id *)(*((void *)&v10 + 1) + 8 * i) qualityReasonEnum];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)_bitmapFromServiceSuspendedReasonArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= 1 << [*(id *)(*((void *)&v10 + 1) + 8 * i) suspendReasonEnum];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int)_locationTypeToIRLocationSemantic:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_11:
    int v6 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = [v3 locationType];
  if (v5 > 1)
  {
    if (v5 == 2)
    {
      int v6 = 5;
      goto LABEL_12;
    }
    if (v5 == 30) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (!v5)
  {
    int v6 = 1;
    goto LABEL_12;
  }
  if (v5 != 1)
  {
LABEL_8:
    uint64_t v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    uint64_t v8 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = v8;
      int v11 = 136315650;
      long long v12 = "#milo-provider, ";
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = [v4 locationType];
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - Milo location type unsupported] Milo provided LOI type not handled [%lu]", (uint8_t *)&v11, 0x20u);
    }
    goto LABEL_11;
  }
  int v6 = 2;
LABEL_12:

  return v6;
}

- (void)connection:(id)a3 didUpdateServiceStatus:(id)a4
{
  id v5 = a4;
  int v6 = [(IRMiLoProvider *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__IRMiLoProvider_connection_didUpdateServiceStatus___block_invoke;
  v8[3] = &unk_2653A0500;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __52__IRMiLoProvider_connection_didUpdateServiceStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 observer];
  if (!v4) {
    goto LABEL_20;
  }
  id v5 = *(void **)(a1 + 32);
  int v6 = [*(id *)(a1 + 40) currentLocationOfInterestType];
  uint64_t v7 = [v5 _locationTypeToIRLocationSemantic:v6];

  uint64_t v8 = [*(id *)(a1 + 40) currentLocationOfInterestUuid];
  id v9 = [v8 UUIDString];

  [v4 onUpdateLOIType:v7 WithLOIIdentifier:v9];
  if ([v3 miLoConnectionProgressStatus] == 1)
  {
    [v3 setMiLoConnectionProgressStatus:2];
    long long v10 = [v3 connection];
    int v11 = objc_msgSend(objc_alloc(MEMORY[0x263F557F0]), "initWithIsLowLatency:", objc_msgSend(v3, "isLowLatency"));
    id v12 = (id)[v10 startUpdatingWithConfiguration:v11];

    [v3 setNumberOfConsecutiveMiLoFailAttempts:0];
  }
  [v3 setIsMiLoServiceStateRunning:0];
  uint64_t v13 = [*(id *)(a1 + 40) serviceState];
  uint64_t v14 = (const void **)MEMORY[0x263F50120];
  if (v13 == 1)
  {
    [v4 onPrediction:0];
    [v3 setRequestSinglePredictionIdentifier:0];
    uint64_t v16 = dispatch_get_specific(*v14);
    __int16 v20 = (void *)*MEMORY[0x263F50090];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
LABEL_13:

      goto LABEL_14;
    }
    __int16 v18 = v20;
    *(_DWORD *)v34 = 136315650;
    *(void *)&v34[4] = "#milo-provider, ";
    *(_WORD *)&v34[12] = 2112;
    *(void *)&v34[14] = v16;
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = [v3 miLoConnectionProgressStatus];
    __int16 v19 = "%s[%@], Milo service state suspended, %d";
LABEL_12:
    _os_log_impl(&dword_25418E000, v18, OS_LOG_TYPE_INFO, v19, v34, 0x1Cu);

    goto LABEL_13;
  }
  if (!v13)
  {
    __int16 v15 = [v3 legacyServiceUUID];

    if (v15)
    {
      [v4 deleteLegacyServiceIdentifier];
      [v3 setLegacyServiceUUID:0];
    }
    [v3 setIsMiLoServiceStateRunning:1];
    uint64_t v16 = dispatch_get_specific(*v14);
    uint64_t v17 = (void *)*MEMORY[0x263F50090];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v18 = v17;
    *(_DWORD *)v34 = 136315650;
    *(void *)&v34[4] = "#milo-provider, ";
    *(_WORD *)&v34[12] = 2112;
    *(void *)&v34[14] = v16;
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = [v3 miLoConnectionProgressStatus];
    __int16 v19 = "%s[%@], Milo service state running, %d";
    goto LABEL_12;
  }
LABEL_14:
  __int16 v21 = objc_msgSend(v3, "_miloServiceStatusLogStringFromStatus:", *(void *)(a1 + 40), *(_OWORD *)v34, *(void *)&v34[16], v35);
  [v3 setMiloServiceStatusStringQE:v21];

  uint64_t v22 = dispatch_get_specific(*v14);
  uint64_t v23 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = v23;
    __int16 v25 = [v3 miloServiceStatusStringQE];
    *(_DWORD *)v34 = 136315650;
    *(void *)&v34[4] = "#milo-provider, ";
    *(_WORD *)&v34[12] = 2112;
    *(void *)&v34[14] = v22;
    *(_WORD *)&v34[22] = 2112;
    v35 = v25;
    _os_log_impl(&dword_25418E000, v24, OS_LOG_TYPE_DEFAULT, "%s[%@], Milo status changed: %@", v34, 0x20u);
  }
  v26 = [*(id *)(a1 + 40) serviceQualityInfo];
  objc_msgSend(v3, "setMiLoServiceQuality:", objc_msgSend(v26, "serviceQuality"));

  long long v27 = *(void **)(a1 + 32);
  long long v28 = [*(id *)(a1 + 40) serviceQualityInfo];
  long long v29 = [v28 serviceQualityReasons];
  objc_msgSend(v3, "setMiLoServiceQualityReasonBitmap:", objc_msgSend(v27, "_bitmapFromServiceQualityReasonArray:", v29));

  long long v30 = *(void **)(a1 + 32);
  uint64_t v31 = [*(id *)(a1 + 40) serviceSuspendReasons];
  objc_msgSend(v3, "setMiLoServiceSuspendedReasonBitmap:", objc_msgSend(v30, "_bitmapFromServiceSuspendedReasonArray:", v31));

  if ([v3 isMiLoServiceStateRunning] && objc_msgSend(v3, "isLowLatency"))
  {
    uint64_t v32 = [v3 connection];
    id v33 = (id)[v32 requestPrediction];
  }
LABEL_20:
}

- (void)connection:(id)a3 didUpdatePrediction:(id)a4
{
  id v5 = a4;
  int v6 = [(IRMiLoProvider *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__IRMiLoProvider_connection_didUpdatePrediction___block_invoke;
  v8[3] = &unk_2653A0528;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __49__IRMiLoProvider_connection_didUpdatePrediction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v5 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v6 = *(void **)(a1 + 32);
    id v7 = v5;
    uint64_t v8 = [v6 requestIdentifier];
    id v9 = NSNumber;
    long long v10 = [*(id *)(a1 + 32) places];
    int v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    int v17 = 136315906;
    __int16 v18 = "#milo-provider, ";
    __int16 v19 = 2112;
    __int16 v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_INFO, "%s[%@], MiLo prediction received, request ID is: %@, num events is: %@", (uint8_t *)&v17, 0x2Au);
  }
  id v12 = [v3 requestSinglePredictionIdentifier];
  uint64_t v13 = [*(id *)(a1 + 32) requestIdentifier];
  int v14 = [v12 isEqual:v13];

  if (v14) {
    [v3 setRequestSinglePredictionIdentifier:0];
  }
  if ([v3 isLowLatency])
  {
    __int16 v15 = -[IRMiLoProviderLslPredictionResults initWithMiloPrediction:withMiLoServiceQuality:withMiLoServiceQualityReasonBitmap:]([IRMiLoProviderLslPredictionResults alloc], "initWithMiloPrediction:withMiLoServiceQuality:withMiLoServiceQualityReasonBitmap:", *(void *)(a1 + 32), [v3 miLoServiceQuality], objc_msgSend(v3, "miLoServiceQualityReasonBitmap"));
    uint64_t v16 = [v3 observer];
    [v16 onPrediction:v15];
  }
}

- (void)connection:(id)a3 didCompleteRequest:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(IRMiLoProvider *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__IRMiLoProvider_connection_didCompleteRequest_withError___block_invoke;
  v12[3] = &unk_2653A0500;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  IRDispatchAsyncWithStrongSelf(v9, self, v12);
}

void __58__IRMiLoProvider_connection_didCompleteRequest_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4 || [v4 code] == -1) {
    id v5 = 0;
  }
  else {
    id v5 = *(void **)(a1 + 32);
  }
  id v6 = v5;
  id v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v8 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v12 = 136315906;
    id v13 = "#milo-provider, ";
    __int16 v14 = 2112;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], didCompleteRequest: requestIdentifier: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }

  id v10 = *(void **)(a1 + 40);
  id v11 = [v3 requestSinglePredictionIdentifier];
  LODWORD(v10) = [v10 isEqual:v11];

  if (v10 && v6) {
    [v3 setRequestSinglePredictionIdentifier:0];
  }
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(IRMiLoProvider *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__IRMiLoProvider_connection_didFailWithError___block_invoke;
  v8[3] = &unk_2653A0528;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __46__IRMiLoProvider_connection_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 code];
  id v6 = (const void **)MEMORY[0x263F50120];
  id v7 = (os_log_t *)MEMORY[0x263F50090];
  if (v5 == 19 || [*(id *)(a1 + 32) code] == 20)
  {
    id v8 = dispatch_get_specific(*v6);
    id v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v14 = 136315650;
      __int16 v15 = "#milo-provider, ";
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - IRMiLoProvider:connection:didFailWithError] IRMiLoProvider:connection:didFailWithError: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  id v11 = dispatch_get_specific(*v6);
  int v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 136315650;
    __int16 v15 = "#milo-provider, ";
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_25418E000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - didFailWithError] didFailWithError: %@", (uint8_t *)&v14, 0x20u);
  }

  [v4 _serviceResetAndIncreaseFailCount];
}

- (void)connection:(id)a3 didEnableMicrolocationAtCurrentLocationWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(IRMiLoProvider *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__IRMiLoProvider_connection_didEnableMicrolocationAtCurrentLocationWithError___block_invoke;
  v8[3] = &unk_2653A0528;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __78__IRMiLoProvider_connection_didEnableMicrolocationAtCurrentLocationWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (!v4 || [v4 code] == -1) {
    id v5 = 0;
  }
  else {
    id v5 = *(void **)(a1 + 32);
  }
  id v6 = v5;
  id v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v8 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "#milo-provider, ";
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], didEnableMicrolocationAtCurrentLocationWithError: error: %@", (uint8_t *)&v10, 0x20u);
  }

  [v3 resetSpotOnLocationRequest];
  id v9 = [v3 observer];
  [v9 didSpotOnLocationCompleteWithError:v6];
}

- (int64_t)miLoServiceSuspendedReasonBitmap
{
  return self->_miLoServiceSuspendedReasonBitmap;
}

- (void)setMiLoServiceSuspendedReasonBitmap:(int64_t)a3
{
  self->_miLoServiceSuspendedReasonBitmap = a3;
}

- (ULConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)isMiLoServiceStateRunning
{
  return self->_isMiLoServiceStateRunning;
}

- (void)setIsMiLoServiceStateRunning:(BOOL)a3
{
  self->_isMiLoServiceStateRunning = a3;
}

- (int64_t)miLoServiceQuality
{
  return self->_miLoServiceQuality;
}

- (void)setMiLoServiceQuality:(int64_t)a3
{
  self->_miLoServiceQuality = a3;
}

- (int64_t)miLoServiceQualityReasonBitmap
{
  return self->_miLoServiceQualityReasonBitmap;
}

- (void)setMiLoServiceQualityReasonBitmap:(int64_t)a3
{
  self->_miLoServiceQualityReasonBitmap = a3;
}

- (NSUUID)legacyServiceUUID
{
  return self->_legacyServiceUUID;
}

- (void)setLegacyServiceUUID:(id)a3
{
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setObserver:(id)a3
{
}

- (void)setMiLoConnectionProgressStatus:(int)a3
{
  self->_miLoConnectionProgressStatus = a3;
}

- (int)numberOfConsecutiveMiLoFailAttempts
{
  return self->_numberOfConsecutiveMiLoFailAttempts;
}

- (void)setNumberOfConsecutiveMiLoFailAttempts:(int)a3
{
  self->_numberOfConsecutiveMiLoFailAttempts = a3;
}

- (void)setMiloServiceStatusStringQE:(id)a3
{
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_isLowLatency = a3;
}

- (NSUUID)requestSinglePredictionIdentifier
{
  return self->_requestSinglePredictionIdentifier;
}

- (void)setRequestSinglePredictionIdentifier:(id)a3
{
}

- (BOOL)spotOnLocationRequested
{
  return self->_spotOnLocationRequested;
}

- (void)setSpotOnLocationRequested:(BOOL)a3
{
  self->_spotOnLocationRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSinglePredictionIdentifier, 0);
  objc_storeStrong((id *)&self->_miloServiceStatusStringQE, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_legacyServiceUUID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)addObserver:(const char *)a1 withToken:withLegacyServiceUUID:isLowLatency:.cold.1(const char *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (const void **)MEMORY[0x263F50120];
  id v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v4 = (os_log_t *)MEMORY[0x263F50090];
  id v5 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_FAULT))
  {
    int v8 = 136315650;
    id v9 = "#milo-provider, ";
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = a1;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - MiLo provider error - Unknown token] addObserver, unknown token: %@", (uint8_t *)&v8, 0x20u);
  }

  id v6 = dispatch_get_specific(*v2);
  id v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136316162;
    id v9 = "#milo-provider, ";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/IntelligentRouting/IntelligentRoutingDaemon/DataProviders/MiLo/IRMiLoProvider.m";
    __int16 v14 = 1024;
    int v15 = 229;
    __int16 v16 = 2080;
    uint64_t v17 = "-[IRMiLoProvider addObserver:withToken:withLegacyServiceUUID:isLowLatency:]";
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_INFO, "%s[%@], %s:%d: assertion failure in %s", (uint8_t *)&v8, 0x30u);
  }

  abort();
}

@end