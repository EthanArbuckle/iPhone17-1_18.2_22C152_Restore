@interface EKTravelEngineThrottle
+ (double)_requestHypothesisRefreshInterval;
+ (double)emissionThresholdTimeInterval;
- (BOOL)receivedAlarmNamed:(id)a3;
- (BOOL)running;
- (EKTravelEngineThrottle)init;
- (NSDate)nextEmissionDate;
- (NSString)eventExternalURL;
- (OS_dispatch_queue)throttleQueue;
- (id)alarmName;
- (id)cancelHypothesisRequestRefreshBlock;
- (id)description;
- (id)emissionBlock;
- (id)requestHypothesisRefreshBlock;
- (void)_createEmissionTimerWithDate:(id)a3;
- (void)_emissionTimerFired;
- (void)_fireEmissionBlock;
- (void)_registerForNotificationObservation;
- (void)_significantTimeChangeNotificationReceived;
- (void)_uninstallEmissionTimer;
- (void)_updateEmissionDate:(id)a3;
- (void)dealloc;
- (void)setCancelHypothesisRequestRefreshBlock:(id)a3;
- (void)setEmissionBlock:(id)a3;
- (void)setEventExternalURL:(id)a3;
- (void)setNextEmissionDate:(id)a3;
- (void)setRequestHypothesisRefreshBlock:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setThrottleQueue:(id)a3;
- (void)tearDown;
- (void)updatePredictedDepartureDate:(id)a3;
@end

@implementation EKTravelEngineThrottle

- (EKTravelEngineThrottle)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKTravelEngineThrottle;
  v2 = [(EKTravelEngineThrottle *)&v7 init];
  if (v2)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];

    dispatch_queue_t v5 = dispatch_queue_create(v4, 0);
    [(EKTravelEngineThrottle *)v2 setThrottleQueue:v5];

    [(EKTravelEngineThrottle *)v2 _registerForNotificationObservation];
  }
  return v2;
}

- (void)dealloc
{
  [(EKTravelEngineThrottle *)self _uninstallEmissionTimer];
  v3.receiver = self;
  v3.super_class = (Class)EKTravelEngineThrottle;
  [(EKTravelEngineThrottle *)&v3 dealloc];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F30018]);
  v10.receiver = self;
  v10.super_class = (Class)EKTravelEngineThrottle;
  v4 = [(EKTravelEngineThrottle *)&v10 description];
  dispatch_queue_t v5 = (void *)[v3 initWithSuperclassDescription:v4];

  v6 = [(EKTravelEngineThrottle *)self nextEmissionDate];
  [v5 setKey:@"nextEmissionDate" withDate:v6];

  objc_super v7 = [(EKTravelEngineThrottle *)self throttleQueue];
  [v5 setKey:@"throttleQueue" withPointerAddress:v7];

  v8 = [v5 build];

  return v8;
}

- (void)tearDown
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v7 = self;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Throttle has been requested to tear down: [%@]", buf, 0xCu);
  }
  v4 = [(EKTravelEngineThrottle *)self throttleQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__EKTravelEngineThrottle_tearDown__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __34__EKTravelEngineThrottle_tearDown__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _uninstallEmissionTimer];
  v2 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_2216BB000, v2, OS_LOG_TYPE_DEFAULT, "Travel engine throttle tear down: [%@]", (uint8_t *)&v4, 0xCu);
  }
}

- (void)updatePredictedDepartureDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "updatePredictedDepartureDate: [%{public}@]", buf, 0xCu);
  }
  uint64_t v6 = [(EKTravelEngineThrottle *)self throttleQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__EKTravelEngineThrottle_updatePredictedDepartureDate___block_invoke;
  v8[3] = &unk_2645C0DC0;
  id v9 = v4;
  objc_super v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __55__EKTravelEngineThrottle_updatePredictedDepartureDate___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F04B80] shared];
  int v3 = [v2 shouldBypassTravelEngineThrottle];

  if (*(void *)(a1 + 32))
  {
    if (v3)
    {
      [*(id *)(a1 + 40) _uninstallEmissionTimer];
      id v4 = *(void **)(a1 + 40);
      [v4 _fireEmissionBlock];
    }
    else
    {
      [(id)objc_opt_class() emissionThresholdTimeInterval];
      id v7 = [*(id *)(a1 + 32) dateByAddingTimeInterval:-v6];
      [*(id *)(a1 + 40) _updateEmissionDate:v7];
    }
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F04B10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "No date given.  Tearing down emission timer.", buf, 2u);
    }
    [*(id *)(a1 + 40) _uninstallEmissionTimer];
  }
}

+ (double)_requestHypothesisRefreshInterval
{
  return 60.0;
}

+ (double)emissionThresholdTimeInterval
{
  return 900.0;
}

- (id)alarmName
{
  v2 = NSNumber;
  int v3 = [(EKTravelEngineThrottle *)self eventExternalURL];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  uint64_t v5 = [v4 stringValue];

  double v6 = [NSString stringWithFormat:@"%@throttle-%@", @"com.apple.calaccessd.travelEngine.", v5];

  return v6;
}

- (BOOL)receivedAlarmNamed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(EKTravelEngineThrottle *)self alarmName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = *MEMORY[0x263F04B10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "EKTravelEngineThrottle received alarm named: %{public}@", buf, 0xCu);
    }
    uint64_t v8 = [(EKTravelEngineThrottle *)self throttleQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__EKTravelEngineThrottle_receivedAlarmNamed___block_invoke;
    block[3] = &unk_2645C0D98;
    block[4] = self;
    dispatch_sync(v8, block);
  }
  return v6;
}

uint64_t __45__EKTravelEngineThrottle_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _emissionTimerFired];
}

- (void)_updateEmissionDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
  if (v4)
  {
    if ([v4 CalIsBeforeOrSameAsDate:v5])
    {
      int v6 = *MEMORY[0x263F04B10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "The given emission date %@ is before now %@.  Firing the emission block and uninstalling the timer.", (uint8_t *)&v14, 0x16u);
      }
      [(EKTravelEngineThrottle *)self _uninstallEmissionTimer];
      [(EKTravelEngineThrottle *)self _fireEmissionBlock];
    }
    else
    {
      uint64_t v8 = [(EKTravelEngineThrottle *)self nextEmissionDate];
      if (v8
        && (id v9 = (void *)v8,
            [(EKTravelEngineThrottle *)self nextEmissionDate],
            objc_super v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v10 isEqualToDate:v4],
            v10,
            v9,
            v11))
      {
        id v12 = *MEMORY[0x263F04B10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          id v15 = v4;
          _os_log_impl(&dword_2216BB000, v12, OS_LOG_TYPE_DEFAULT, "The given emission date is the same as the existing emission date.  Will not update the emission timer.  Emission date: [%@]", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        uint64_t v13 = *MEMORY[0x263F04B10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138543362;
          id v15 = v4;
          _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "updating emissionDate to [%{public}@]", (uint8_t *)&v14, 0xCu);
        }
        [(EKTravelEngineThrottle *)self _uninstallEmissionTimer];
        [(EKTravelEngineThrottle *)self setNextEmissionDate:v4];
        [(EKTravelEngineThrottle *)self _createEmissionTimerWithDate:v4];
      }
    }
  }
  else
  {
    id v7 = *MEMORY[0x263F04B10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "'nil' emission timer given.  Uninstalling emission timer.", (uint8_t *)&v14, 2u);
    }
    [(EKTravelEngineThrottle *)self _uninstallEmissionTimer];
  }
}

- (void)_fireEmissionBlock
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Firing emission block for travel engine throttle: [%@]", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = [(EKTravelEngineThrottle *)self emissionBlock];
  uint64_t v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

- (void)_createEmissionTimerWithDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 timeIntervalSinceNow];
  int64_t v6 = (unint64_t)((ceil(v5) + (double)time(0)) * 1000000000.0);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v7, (const char *)*MEMORY[0x263F300A8], v6);
  id v8 = [(EKTravelEngineThrottle *)self alarmName];
  [v8 UTF8String];
  xpc_set_event();

  id v9 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Created a new emission timer that will fire on the emission date: [%@]", (uint8_t *)&v13, 0xCu);
  }
  [(id)objc_opt_class() _requestHypothesisRefreshInterval];
  int v11 = [MEMORY[0x263EFF910] dateWithTimeInterval:v4 sinceDate:-v10];
  id v12 = [(EKTravelEngineThrottle *)self requestHypothesisRefreshBlock];
  ((void (**)(void, void *))v12)[2](v12, v11);
}

- (void)_uninstallEmissionTimer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = [(EKTravelEngineThrottle *)self cancelHypothesisRequestRefreshBlock];
  v3[2]();

  id v4 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    xpc_object_t v7 = self;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Uninstalling timer for travel engine throttle: [%@].", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(EKTravelEngineThrottle *)self alarmName];
  [v5 UTF8String];
  xpc_set_event();
}

- (void)_emissionTimerFired
{
  int v3 = (os_log_t *)MEMORY[0x263F04B10];
  id v4 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Emission timer fired", buf, 2u);
  }
  [(EKTravelEngineThrottle *)self setNextEmissionDate:0];
  id v5 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Cleared out the next emission date due to emission timer firing.", v6, 2u);
  }
  [(EKTravelEngineThrottle *)self _fireEmissionBlock];
  [(EKTravelEngineThrottle *)self _uninstallEmissionTimer];
}

- (void)_registerForNotificationObservation
{
}

- (void)_significantTimeChangeNotificationReceived
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F04B10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F30108];
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  id v5 = [(EKTravelEngineThrottle *)self throttleQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__EKTravelEngineThrottle__significantTimeChangeNotificationReceived__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_async(v5, block);
}

void __68__EKTravelEngineThrottle__significantTimeChangeNotificationReceived__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nextEmissionDate];
  [*(id *)(a1 + 32) _uninstallEmissionTimer];
  if (v2)
  {
    [*(id *)(a1 + 32) setNextEmissionDate:0];
    [*(id *)(a1 + 32) _updateEmissionDate:v2];
  }
}

- (NSString)eventExternalURL
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventExternalURL:(id)a3
{
}

- (id)requestHypothesisRefreshBlock
{
  return self->_requestHypothesisRefreshBlock;
}

- (void)setRequestHypothesisRefreshBlock:(id)a3
{
}

- (id)cancelHypothesisRequestRefreshBlock
{
  return self->_cancelHypothesisRequestRefreshBlock;
}

- (void)setCancelHypothesisRequestRefreshBlock:(id)a3
{
}

- (id)emissionBlock
{
  return self->_emissionBlock;
}

- (void)setEmissionBlock:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_queue)throttleQueue
{
  return self->_throttleQueue;
}

- (void)setThrottleQueue:(id)a3
{
}

- (NSDate)nextEmissionDate
{
  return self->_nextEmissionDate;
}

- (void)setNextEmissionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEmissionDate, 0);
  objc_storeStrong((id *)&self->_throttleQueue, 0);
  objc_storeStrong(&self->_emissionBlock, 0);
  objc_storeStrong(&self->_cancelHypothesisRequestRefreshBlock, 0);
  objc_storeStrong(&self->_requestHypothesisRefreshBlock, 0);
  objc_storeStrong((id *)&self->_eventExternalURL, 0);
}

@end