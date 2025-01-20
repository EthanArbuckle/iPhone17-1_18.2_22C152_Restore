@interface DAChamberDetector
- (BOOL)shouldStopAfterEventReceived:(id)a3;
- (BOOL)started;
- (DAChamberDetector)initWithInputs:(id)a3;
- (DAChamberDetectorDelegate)delegate;
- (DAChamberInputs)inputs;
- (NSMutableSet)expectations;
- (NSMutableSet)sensors;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_semaphore)chamberReadySemaphore;
- (void)checkChamberIsReady;
- (void)dealloc;
- (void)handleSensorEvent:(id)a3;
- (void)setChamberReadySemaphore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setExpectations:(id)a3;
- (void)setInputs:(id)a3;
- (void)setSensors:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation DAChamberDetector

- (DAChamberDetector)initWithInputs:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DAChamberDetector;
  v6 = [(DAChamberDetector *)&v23 init];
  v7 = v6;
  if (v6)
  {
    v6->_started = 0;
    p_inputs = (id *)&v6->_inputs;
    objc_storeStrong((id *)&v6->_inputs, a3);
    uint64_t v9 = +[NSMutableSet set];
    sensors = v7->_sensors;
    v7->_sensors = (NSMutableSet *)v9;

    uint64_t v11 = +[NSMutableSet set];
    expectations = v7->_expectations;
    v7->_expectations = (NSMutableSet *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("DAChamberDetectorEventQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = (OS_dispatch_queue *)v13;

    if (([(DAChamberInputs *)v7->_inputs detectChamberSensor] & 2) != 0)
    {
      v15 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Creating Wifi sensor", buf, 2u);
      }

      v16 = [[DAWifiSensor alloc] initWithDelegate:v7 scanInterval:8.0];
      [(NSMutableSet *)v7->_sensors addObject:v16];
    }
    if ([*p_inputs detectChamberSensor])
    {
      v17 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Creating ALS sensor", buf, 2u);
      }

      v18 = [[DAALSSensor alloc] initWithDelegate:v7 threshold:[(DAChamberInputs *)v7->_inputs detectChamberReadyALSThreshold]];
      [(NSMutableSet *)v7->_sensors addObject:v18];
    }
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [*p_inputs detectChamberReadyWaitTime];
      unsigned int v21 = [*p_inputs detectChamberSensor];
      *(_DWORD *)buf = 67109376;
      unsigned int v25 = v20;
      __int16 v26 = 1024;
      unsigned int v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Setup parameters: detectChamberReadyWaitTime(%dsec), detectChamberSensor(%x)", buf, 0xEu);
    }
  }
  return v7;
}

- (void)start
{
  v3 = [(DAChamberDetector *)self sensors];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(DAChamberDetector *)self sensors];
      *(_DWORD *)buf = 138412290;
      __int16 v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Starting sensors: %@", buf, 0xCu);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(DAChamberDetector *)self sensors];
    id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [(DAChamberDetector *)self expectations];
            dispatch_queue_t v13 = [[DAChamberSensorEvent alloc] initWithSensorType:1 eventType:3];
            [v12 addObject:v13];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [(DAChamberDetector *)self expectations];
            v15 = [[DAChamberSensorEvent alloc] initWithSensorType:0 eventType:2];
            [v14 addObject:v15];
          }
          [v11 startMonitoring];
        }
        id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    [(DAChamberDetector *)self setChamberReadySemaphore:v16];

    v17 = [(DAChamberDetector *)self eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000033D8;
    block[3] = &unk_10001C590;
    block[4] = self;
    dispatch_async(v17, block);

    [(DAChamberDetector *)self setStarted:1];
  }
  else
  {
    [(DAChamberDetector *)self setStarted:1];
    [(DAChamberDetector *)self checkChamberIsReady];
  }
}

- (void)stop
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(DAChamberDetector *)self sensors];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) stopMonitoring];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(DAChamberDetector *)self expectations];
  [v8 removeAllObjects];

  [(DAChamberDetector *)self setStarted:0];
}

- (void)checkChamberIsReady
{
  id v8 = [(DAChamberDetector *)self expectations];
  if ([v8 count])
  {
  }
  else
  {
    unsigned __int8 v3 = [(DAChamberDetector *)self started];

    if (v3)
    {
      id v4 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Chamber is ready", buf, 2u);
      }

      id v5 = [(DAChamberDetector *)self chamberReadySemaphore];

      if (v5)
      {
        uint64_t v6 = [(DAChamberDetector *)self chamberReadySemaphore];
        dispatch_semaphore_signal(v6);
      }
      id v7 = [(DAChamberDetector *)self delegate];
      [v7 handleChamberStatus:1];
    }
  }
}

- (BOOL)shouldStopAfterEventReceived:(id)a3
{
  id v4 = a3;
  if (![(DAChamberDetector *)self started]) {
    goto LABEL_11;
  }
  id v5 = [(DAChamberDetector *)self expectations];
  if (![v5 count])
  {
    id v7 = [(DAChamberDetector *)self sensors];
    if (![v7 count])
    {

      goto LABEL_3;
    }
    if ([v4 eventType] == 1)
    {

LABEL_10:
      [(DAChamberDetector *)self stop];
      id v5 = [(DAChamberDetector *)self delegate];
      [v5 handleChamberStatus:3];
      BOOL v6 = 1;
      goto LABEL_4;
    }
    unsigned int v8 = [v4 eventType];

    if (v8 == 4) {
      goto LABEL_10;
    }
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }
LABEL_3:
  BOOL v6 = 0;
LABEL_4:

LABEL_12:
  return v6;
}

- (void)handleSensorEvent:(id)a3
{
  id v4 = a3;
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Received sensor event: %@", (uint8_t *)&v11, 0xCu);
  }

  if (![(DAChamberDetector *)self shouldStopAfterEventReceived:v4])
  {
    BOOL v6 = self;
    objc_sync_enter(v6);
    id v7 = [(DAChamberDetector *)v6 expectations];
    [v7 removeObject:v4];

    unsigned int v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = [(DAChamberDetector *)v6 expectations];
      id v10 = [v9 count];
      int v11 = 134217984;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Expectations left: %lu", (uint8_t *)&v11, 0xCu);
    }
    [(DAChamberDetector *)v6 checkChamberIsReady];
    objc_sync_exit(v6);
  }
}

- (void)dealloc
{
  [(DAChamberDetector *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)DAChamberDetector;
  [(DAChamberDetector *)&v3 dealloc];
}

- (DAChamberDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DAChamberDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DAChamberInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSMutableSet)sensors
{
  return self->_sensors;
}

- (void)setSensors:(id)a3
{
}

- (NSMutableSet)expectations
{
  return self->_expectations;
}

- (void)setExpectations:(id)a3
{
}

- (OS_dispatch_semaphore)chamberReadySemaphore
{
  return self->_chamberReadySemaphore;
}

- (void)setChamberReadySemaphore:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_chamberReadySemaphore, 0);
  objc_storeStrong((id *)&self->_expectations, 0);
  objc_storeStrong((id *)&self->_sensors, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end