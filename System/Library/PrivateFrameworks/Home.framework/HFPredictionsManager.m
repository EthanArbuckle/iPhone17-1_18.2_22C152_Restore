@interface HFPredictionsManager
- (BOOL)cachesRawPredictions;
- (BOOL)wasQueriedForInFlightPredictions;
- (HFPredictionsController)predictionsController;
- (HFPredictionsManager)init;
- (HFPredictionsManager)initWithHome:(id)a3 predictionsController:(id)a4 delegate:(id)a5 predictionLimit:(unint64_t)a6;
- (HFPredictionsManager)initWithHome:(id)a3 predictionsController:(id)a4 delegate:(id)a5 predictionLimit:(unint64_t)a6 filterTypes:(id)a7;
- (HFPredictionsManagerDelegate)delegate;
- (HMHome)home;
- (NAFuture)initialPredictionUpdateFuture;
- (NSArray)filterTypes;
- (NSArray)predictions;
- (NSDictionary)predictionConfidence;
- (OS_dispatch_queue)predictionQueue;
- (id)_homeKitObjectForAccessoryUUID:(id)a3;
- (id)_homeKitObjectForMediaSystemUUID:(id)a3;
- (id)_homeKitObjectForSceneUUID:(id)a3;
- (id)_homeKitObjectForServiceGroupUUID:(id)a3;
- (id)_homeKitObjectForServiceUUID:(id)a3;
- (id)_processUserActionPredictions:(id)a3;
- (id)fetchUserActionPredictions;
- (id)fetchUserActionPredictionsAndWaitForInitialUpdate:(BOOL)a3;
- (id)predictionConfidenceForObject:(id)a3;
- (unint64_t)predictionLimit;
- (void)_didReceivePredictions:(id)a3;
- (void)_queryUserActionPredictions;
- (void)_queryUserActionPredictionsOnQueue;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveActionSet:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveServiceGroup:(id)a4;
- (void)prepopulateWithCache;
- (void)setCachesRawPredictions:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterTypes:(id)a3;
- (void)setInitialPredictionUpdateFuture:(id)a3;
- (void)setPredictionConfidence:(id)a3;
- (void)setPredictionLimit:(unint64_t)a3;
- (void)setPredictionQueue:(id)a3;
- (void)setPredictions:(id)a3;
- (void)setPredictionsController:(id)a3;
- (void)setWasQueriedForInFlightPredictions:(BOOL)a3;
- (void)submitPredictionsFetchEventWithDuration:(double)a3 numberOfPredictions:(unint64_t)a4;
- (void)userActionPredictionController:(id)a3 didUpdatePredictions:(id)a4;
@end

@implementation HFPredictionsManager

void __51__HFPredictionsManager__queryUserActionPredictions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _queryUserActionPredictionsOnQueue];
}

- (void)_queryUserActionPredictionsOnQueue
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v3 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(HFPredictionsManager *)self home];
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Fetching predictions for home: %@", buf, 0xCu);
  }
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [(HFPredictionsManager *)self predictionsController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HFPredictionsManager__queryUserActionPredictionsOnQueue__block_invoke;
  v8[3] = &unk_264093D20;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 fetchPredictionsWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (HFPredictionsController)predictionsController
{
  return self->_predictionsController;
}

void __58__HFPredictionsManager__queryUserActionPredictionsOnQueue__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained cachesRawPredictions])
  {
    unint64_t v4 = [v9 count];
    uint64_t v5 = [WeakRetained predictionLimit];
    if (v4 >= 2 * v5) {
      unint64_t v4 = 2 * v5;
    }
    v6 = [WeakRetained home];
    id v7 = objc_msgSend(v9, "subarrayWithRange:", 0, v4);
    [v6 setCachedPredictions:v7];
  }
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  objc_msgSend(WeakRetained, "submitPredictionsFetchEventWithDuration:numberOfPredictions:", objc_msgSend(v9, "count"), fabs(v8));
  [WeakRetained _didReceivePredictions:v9];
}

- (BOOL)cachesRawPredictions
{
  return self->_cachesRawPredictions;
}

- (void)_didReceivePredictions:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    id v7 = [(HFPredictionsManager *)self home];
    double v8 = objc_msgSend(v4, "hf_prettyDescription");
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Fetched %lu predictions for home %@: %@", buf, 0x20u);
  }
  id v9 = [(HFPredictionsManager *)self _processUserActionPredictions:v4];
  id v10 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__HFPredictionsManager__didReceivePredictions___block_invoke;
  v13[3] = &unk_2640905E0;
  objc_copyWeak(&v16, &location);
  id v11 = v4;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 performBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (HMHome)home
{
  return self->_home;
}

- (id)_processUserActionPredictions:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[HFPredictionsManager predictionLimit](self, "predictionLimit"));
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", -[HFPredictionsManager predictionLimit](self, "predictionLimit"));
  v35 = [MEMORY[0x263EFF9A0] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v11 = HFLogForCategory(0x34uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = objc_msgSend(v10, "hf_prettyDescription");
          *(_DWORD *)buf = 138412290;
          uint64_t v43 = (uint64_t)v12;
          _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Processing user action prediction: %@", buf, 0xCu);
        }
        uint64_t v13 = [(HFPredictionsManager *)self filterTypes];
        if (!v13) {
          goto LABEL_10;
        }
        id v14 = (void *)v13;
        id v15 = [(HFPredictionsManager *)self filterTypes];
        id v16 = v5;
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "predictionType"));
        char v18 = [v15 containsObject:v17];

        uint64_t v5 = v16;
        if (v18)
        {
LABEL_10:
          switch([v10 predictionType])
          {
            case 0:
              goto LABEL_26;
            case 1:
              uint64_t v19 = [v10 predictionTargetUUID];
              uint64_t v20 = [(HFPredictionsManager *)self _homeKitObjectForSceneUUID:v19];
              goto LABEL_22;
            case 2:
              uint64_t v24 = [v10 targetServiceUUID];

              if (v24)
              {
                uint64_t v19 = [v10 targetServiceUUID];
                [(HFPredictionsManager *)self _homeKitObjectForServiceUUID:v19];
              }
              else
              {
                uint64_t v19 = [v10 predictionTargetUUID];
                [(HFPredictionsManager *)self _homeKitObjectForAccessoryUUID:v19];
              uint64_t v20 = };
              goto LABEL_22;
            case 3:
              uint64_t v19 = [v10 predictionTargetUUID];
              uint64_t v20 = [(HFPredictionsManager *)self _homeKitObjectForServiceGroupUUID:v19];
              goto LABEL_22;
            case 4:
              uint64_t v19 = [v10 predictionTargetUUID];
              uint64_t v20 = [(HFPredictionsManager *)self _homeKitObjectForMediaSystemUUID:v19];
LABEL_22:
              v25 = v20;

              if (!v25) {
                goto LABEL_26;
              }
              v26 = [v25 uniqueIdentifier];
              v27 = [v26 UUIDString];

              if ([v5 containsObject:v27])
              {
                v28 = HFLogForCategory(0x34uLL);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v43 = (uint64_t)v25;
                  _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "HomeKit object %@ already added, skipping", buf, 0xCu);
                }
              }
              else
              {
                [v5 addObject:v27];
                [v37 addObject:v25];
                v29 = NSNumber;
                [v10 predictionScore];
                v28 = objc_msgSend(v29, "numberWithDouble:");
                v30 = [v25 uniqueIdentifier];
                [v35 setObject:v28 forKey:v30];
              }
              goto LABEL_30;
            default:
              v23 = NSStringFromHMUserActionPredictionType([v10 predictionType]);
              NSLog(&cfstr_UnhandledPredi.isa, v23);

LABEL_26:
              v25 = HFLogForCategory(0x34uLL);
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                goto LABEL_31;
              }
              v27 = [(HFPredictionsManager *)self home];
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = (uint64_t)v10;
              __int16 v44 = 2112;
              v45 = v27;
              _os_log_error_impl(&dword_20B986000, v25, OS_LOG_TYPE_ERROR, "Prediction %@ couldn't be mapped to a HomeKit object in home: %@", buf, 0x16u);
LABEL_30:

LABEL_31:
              unint64_t v31 = [v37 count];
              if (v31 < [(HFPredictionsManager *)self predictionLimit]) {
                continue;
              }
              goto LABEL_34;
          }
        }
        v21 = HFLogForCategory(0x34uLL);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v10 predictionType];
          *(_DWORD *)buf = 134217984;
          uint64_t v43 = v22;
          _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Skipping prediction that does not match any of the filtered types: %lu", buf, 0xCu);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v7);
  }
LABEL_34:

  v32 = (void *)[v35 copy];
  [(HFPredictionsManager *)self setPredictionConfidence:v32];

  v33 = [MEMORY[0x263EFF8C0] arrayWithArray:v37];

  return v33;
}

- (unint64_t)predictionLimit
{
  return self->_predictionLimit;
}

- (void)setPredictionConfidence:(id)a3
{
}

void __47__HFPredictionsManager__didReceivePredictions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[HFAnalyticsCCPredictionEvent sendMetricsForPredictionEventAtStage:withCount:](HFAnalyticsCCPredictionEvent, "sendMetricsForPredictionEventAtStage:withCount:", 1, [*(id *)(a1 + 32) count]);
  [WeakRetained setPredictions:*(void *)(a1 + 40)];
  v2 = [WeakRetained predictions];
  +[HFAnalyticsCCPredictionEvent sendMetricsForPredictionEventAtStage:withCount:](HFAnalyticsCCPredictionEvent, "sendMetricsForPredictionEventAtStage:withCount:", 2, [v2 count]);

  if ([WeakRetained wasQueriedForInFlightPredictions])
  {
    v3 = [WeakRetained delegate];
    [v3 predictionsManagerDidUpdatePredictions:WeakRetained];

    [WeakRetained setWasQueriedForInFlightPredictions:0];
    id v4 = [WeakRetained initialPredictionUpdateFuture];
    uint64_t v5 = [WeakRetained predictions];
    [v4 finishWithResult:v5];
  }
}

id __74__HFPredictionsManager_fetchUserActionPredictionsAndWaitForInitialUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained predictions];
  uint64_t v4 = [v3 count];

  if (!v4
    && ([WeakRetained setWasQueriedForInFlightPredictions:1], *(unsigned char *)(a1 + 40))
    && ([WeakRetained predictionsController],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    uint64_t v7 = [WeakRetained initialPredictionUpdateFuture];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F58190];
    uint64_t v6 = [WeakRetained predictions];
    uint64_t v7 = [v5 futureWithResult:v6];
  }
  return v7;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (void)setWasQueriedForInFlightPredictions:(BOOL)a3
{
  self->_wasQueriedForInFlightPredictions = a3;
}

- (BOOL)wasQueriedForInFlightPredictions
{
  return self->_wasQueriedForInFlightPredictions;
}

- (void)setPredictions:(id)a3
{
}

- (NAFuture)initialPredictionUpdateFuture
{
  return self->_initialPredictionUpdateFuture;
}

- (HFPredictionsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFPredictionsManagerDelegate *)WeakRetained;
}

- (HFPredictionsManager)initWithHome:(id)a3 predictionsController:(id)a4 delegate:(id)a5 predictionLimit:(unint64_t)a6 filterTypes:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HFPredictionsManager;
  v17 = [(HFPredictionsManager *)&v26 init];
  char v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v15);
    v18->_predictionLimit = a6;
    objc_storeStrong((id *)&v18->_home, a3);
    objc_storeStrong((id *)&v18->_predictionsController, a4);
    uint64_t v19 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    initialPredictionUpdateFuture = v18->_initialPredictionUpdateFuture;
    v18->_initialPredictionUpdateFuture = v19;

    [(HFPredictionsController *)v18->_predictionsController setDelegate:v18];
    predictions = v18->_predictions;
    v18->_predictions = (NSArray *)MEMORY[0x263EFFA68];

    v18->_cachesRawPredictions = 0;
    objc_storeStrong((id *)&v18->_filterTypes, a7);
    uint64_t v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.Home.predictionFetchQueue", v22);
    predictionQueue = v18->_predictionQueue;
    v18->_predictionQueue = (OS_dispatch_queue *)v23;

    [(HFPredictionsManager *)v18 _queryUserActionPredictions];
  }

  return v18;
}

- (void)_queryUserActionPredictions
{
  if (+[HFUtilities isInternalTest])
  {
    [(HFPredictionsManager *)self _queryUserActionPredictionsOnQueue];
  }
  else
  {
    objc_initWeak(&location, self);
    v3 = [(HFPredictionsManager *)self predictionQueue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __51__HFPredictionsManager__queryUserActionPredictions__block_invoke;
    v4[3] = &unk_26408E550;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (OS_dispatch_queue)predictionQueue
{
  return self->_predictionQueue;
}

- (id)fetchUserActionPredictions
{
  return [(HFPredictionsManager *)self fetchUserActionPredictionsAndWaitForInitialUpdate:0];
}

- (id)fetchUserActionPredictionsAndWaitForInitialUpdate:(BOOL)a3
{
  objc_initWeak(&location, self);
  uint64_t v4 = [MEMORY[0x263F58190] futureWithNoResult];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__HFPredictionsManager_fetchUserActionPredictionsAndWaitForInitialUpdate___block_invoke;
  v7[3] = &unk_264093CF8;
  objc_copyWeak(&v8, &location);
  BOOL v9 = a3;
  id v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (void)submitPredictionsFetchEventWithDuration:(double)a3 numberOfPredictions:(unint64_t)a4
{
  uint64_t v5 = sub_20BCE6E60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v9 = self;
  sub_20BCE6E50();
  sub_20BA5E33C();
  sub_20BCE6980();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (HFPredictionsManager)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithHome_predictionsController_delegate_predictionLimit_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPredictionsManager.m", 43, @"%s is unavailable; use %@ instead",
    "-[HFPredictionsManager init]",
    v5);

  return 0;
}

- (HFPredictionsManager)initWithHome:(id)a3 predictionsController:(id)a4 delegate:(id)a5 predictionLimit:(unint64_t)a6
{
  return [(HFPredictionsManager *)self initWithHome:a3 predictionsController:a4 delegate:a5 predictionLimit:a6 filterTypes:0];
}

- (id)predictionConfidenceForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFPredictionsManager *)self predictionConfidence];
  uint64_t v6 = [v4 uniqueIdentifier];

  uint64_t v7 = [v5 objectForKey:v6];

  return v7;
}

- (void)prepopulateWithCache
{
  v3 = [(HFPredictionsManager *)self home];
  id v4 = [v3 cachedPredictions];

  if ([v4 count]) {
    [(HFPredictionsManager *)self _didReceivePredictions:v4];
  }
}

- (void)setFilterTypes:(id)a3
{
  objc_storeStrong((id *)&self->_filterTypes, a3);
  if ([(HFPredictionsManager *)self cachesRawPredictions]) {
    [(HFPredictionsManager *)self prepopulateWithCache];
  }
  [(HFPredictionsManager *)self _queryUserActionPredictions];
}

- (id)_homeKitObjectForSceneUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFPredictionsManager *)self home];
  uint64_t v6 = objc_msgSend(v5, "hf_actionSetWithUUID:", v4);

  uint64_t v7 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Found scene object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_homeKitObjectForServiceUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFPredictionsManager *)self home];
  uint64_t v6 = objc_msgSend(v5, "hf_serviceWithIdentifier:", v4);

  uint64_t v7 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    v25 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Found initial service object: %@", (uint8_t *)&v24, 0xCu);
  }

  if (objc_msgSend(v6, "hf_isChildService"))
  {
    id v8 = objc_msgSend(v6, "hf_parentService");

    int v9 = HFLogForCategory(0x34uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v8;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Child service - using parent service instead: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    id v8 = v6;
  }
  if (!objc_msgSend(v8, "hf_isVisible"))
  {
    id v14 = HFLogForCategory(0x34uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v8;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Service %@ is non visible, so skipping this service entirely", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_24;
  }
  uint64_t v10 = [v8 accessory];
  int v11 = objc_msgSend(v10, "hf_showAsAccessoryTile");

  if (!v11)
  {
    id v17 = v8;
LABEL_20:
    uint64_t v22 = v17;
    goto LABEL_25;
  }
  id v12 = [v8 accessory];
  int v13 = objc_msgSend(v12, "hf_isCamera");

  if (v13)
  {
    id v14 = HFLogForCategory(0x34uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v8 accessory];
      int v24 = 138412290;
      v25 = v15;
      id v16 = "Service is normally shown as accessory, but accessory %@ is a camera, so skipping this service entirely";
LABEL_23:
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, 0xCu);

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  char v18 = [v8 accessory];
  int v19 = objc_msgSend(v18, "hf_isVisibleAccessory");

  id v14 = HFLogForCategory(0x34uLL);
  BOOL v20 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v20)
    {
      v21 = [v8 accessory];
      int v24 = 138412290;
      v25 = v21;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Service is normally shown as accessory, using accessory %@ instead", (uint8_t *)&v24, 0xCu);
    }
    id v17 = [v8 accessory];
    goto LABEL_20;
  }
  if (v20)
  {
    id v15 = [v8 accessory];
    int v24 = 138412290;
    v25 = v15;
    id v16 = "Service is normally shown as accessory, but accessory %@ is non visible, so skipping this service entirely";
    goto LABEL_23;
  }
LABEL_24:

  uint64_t v22 = 0;
LABEL_25:

  return v22;
}

- (id)_homeKitObjectForServiceGroupUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFPredictionsManager *)self home];
  uint64_t v6 = objc_msgSend(v5, "hf_serviceGroupWithIdentifier:", v4);

  uint64_t v7 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Found service group object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_homeKitObjectForAccessoryUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFPredictionsManager *)self home];
  uint64_t v6 = objc_msgSend(v5, "hf_accessoryWithIdentifier:", v4);

  uint64_t v7 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Found accessory object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_homeKitObjectForMediaSystemUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFPredictionsManager *)self home];
  uint64_t v6 = objc_msgSend(v5, "hf_mediaSystemWithIdentifier:", v4);

  uint64_t v7 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Found media system object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (void)userActionPredictionController:(id)a3 didUpdatePredictions:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x34uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    id v8 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 134218242;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Predictions manager updated with %lu predictions: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__HFPredictionsManager_userActionPredictionController_didUpdatePredictions___block_invoke;
  v10[3] = &unk_26408DB10;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __76__HFPredictionsManager_userActionPredictionController_didUpdatePredictions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained _processUserActionPredictions:*(void *)(a1 + 32)];
  [WeakRetained setPredictions:v2];

  v3 = [WeakRetained delegate];
  [v3 predictionsManagerDidUpdatePredictions:WeakRetained];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v8 = [(HFPredictionsManager *)self predictions];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __48__HFPredictionsManager_home_didRemoveAccessory___block_invoke;
  __int16 v15 = &unk_264093D48;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = &v18;
  uint64_t v10 = objc_msgSend(v8, "na_filter:", &v12);
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((unsigned char *)v19 + 24))
  {
    id v11 = [(HFPredictionsManager *)self delegate];
    [v11 predictionsManagerDidUpdatePredictions:self];

    [(HFPredictionsManager *)self _queryUserActionPredictions];
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __48__HFPredictionsManager_home_didRemoveAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];

  if (v4 != v5
    || (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "hf_associatedAccessories"),
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:*(void *)(a1 + 32)],
        v7,
        v8))
  {
    uint64_t v6 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  int v8 = [(HFPredictionsManager *)self predictions];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __50__HFPredictionsManager_home_didRemoveMediaSystem___block_invoke;
  __int16 v15 = &unk_264093D48;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = &v18;
  uint64_t v10 = objc_msgSend(v8, "na_filter:", &v12);
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((unsigned char *)v19 + 24))
  {
    id v11 = [(HFPredictionsManager *)self delegate];
    [v11 predictionsManagerDidUpdatePredictions:self];

    [(HFPredictionsManager *)self _queryUserActionPredictions];
  }

  _Block_object_dispose(&v18, 8);
}

BOOL __50__HFPredictionsManager_home_didRemoveMediaSystem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];

  if (v3 == v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return v3 != v4;
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  int v8 = [(HFPredictionsManager *)self predictions];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __51__HFPredictionsManager_home_didRemoveServiceGroup___block_invoke;
  __int16 v15 = &unk_264093D48;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = &v18;
  uint64_t v10 = objc_msgSend(v8, "na_filter:", &v12);
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((unsigned char *)v19 + 24))
  {
    id v11 = [(HFPredictionsManager *)self delegate];
    [v11 predictionsManagerDidUpdatePredictions:self];

    [(HFPredictionsManager *)self _queryUserActionPredictions];
  }

  _Block_object_dispose(&v18, 8);
}

BOOL __51__HFPredictionsManager_home_didRemoveServiceGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];

  if (v3 == v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return v3 != v4;
}

- (void)home:(id)a3 didRemoveActionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  int v8 = [(HFPredictionsManager *)self predictions];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __48__HFPredictionsManager_home_didRemoveActionSet___block_invoke;
  __int16 v15 = &unk_264093D48;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = &v18;
  uint64_t v10 = objc_msgSend(v8, "na_filter:", &v12);
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((unsigned char *)v19 + 24))
  {
    id v11 = [(HFPredictionsManager *)self delegate];
    [v11 predictionsManagerDidUpdatePredictions:self];

    [(HFPredictionsManager *)self _queryUserActionPredictions];
  }

  _Block_object_dispose(&v18, 8);
}

BOOL __48__HFPredictionsManager_home_didRemoveActionSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];

  if (v3 == v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return v3 != v4;
}

- (void)setDelegate:(id)a3
{
}

- (void)setCachesRawPredictions:(BOOL)a3
{
  self->_cachesRawPredictions = a3;
}

- (NSArray)filterTypes
{
  return self->_filterTypes;
}

- (NSDictionary)predictionConfidence
{
  return self->_predictionConfidence;
}

- (void)setPredictionsController:(id)a3
{
}

- (void)setPredictionLimit:(unint64_t)a3
{
  self->_predictionLimit = a3;
}

- (void)setPredictionQueue:(id)a3
{
}

- (void)setInitialPredictionUpdateFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPredictionUpdateFuture, 0);
  objc_storeStrong((id *)&self->_predictionQueue, 0);
  objc_storeStrong((id *)&self->_predictionsController, 0);
  objc_storeStrong((id *)&self->_predictionConfidence, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_filterTypes, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end