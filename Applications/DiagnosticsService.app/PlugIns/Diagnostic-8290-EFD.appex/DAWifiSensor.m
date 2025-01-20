@interface DAWifiSensor
- (BOOL)started;
- (CWFInterface)interface;
- (DAChamberSensorDelegate)delegate;
- (DAChamberSensorEvent)mostRecentEvent;
- (DAWifiSensor)initWithDelegate:(id)a3 scanInterval:(double)a4;
- (OS_dispatch_queue)scanQueue;
- (double)scanInterval;
- (void)dealloc;
- (void)scanAvailableNetworks;
- (void)scheduleNetworksScanWithDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInterface:(id)a3;
- (void)setMostRecentEvent:(id)a3;
- (void)setScanInterval:(double)a3;
- (void)setScanQueue:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation DAWifiSensor

- (DAWifiSensor)initWithDelegate:(id)a3 scanInterval:(double)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAWifiSensor;
  v7 = [(DAWifiSensor *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
    interface = v8->_interface;
    v8->_interface = v9;

    v8->_scanInterval = a4;
    dispatch_queue_t v11 = dispatch_queue_create("DAWifiSensorQueue", 0);
    scanQueue = v8->_scanQueue;
    v8->_scanQueue = (OS_dispatch_queue *)v11;

    mostRecentEvent = v8->_mostRecentEvent;
    v8->_mostRecentEvent = 0;
  }
  return v8;
}

- (void)startMonitoring
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DAWifiSensor:: Start monitoring", v5, 2u);
  }

  v4 = [(DAWifiSensor *)self interface];
  [v4 activate];

  [(DAWifiSensor *)self setStarted:1];
  [(DAWifiSensor *)self scheduleNetworksScanWithDelay:0.0];
}

- (void)stopMonitoring
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DAWifiSensor:: Stop monitoring", v5, 2u);
  }

  [(DAWifiSensor *)self setStarted:0];
  [(DAWifiSensor *)self setMostRecentEvent:0];
  v4 = [(DAWifiSensor *)self interface];
  [v4 invalidate];
}

- (void)scanAvailableNetworks
{
  v2 = self;
  if ([(DAWifiSensor *)self started])
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DAWifiSensor: Scanning wifi networks", buf, 2u);
    }

    id v4 = objc_alloc_init((Class)CWFScanParameters);
    [v4 setMergeScanResults:1];
    [v4 setMaximumCacheAge:0];
    [v4 setChannels:0];
    v5 = +[NSSet setWithArray:&off_10001DA38];
    [v4 setIncludeProperties:v5];

    id v6 = [(DAWifiSensor *)v2 interface];
    id v31 = 0;
    v7 = [v6 performScanWithParameters:v4 error:&v31];
    id v8 = v31;

    v9 = DiagnosticLogHandleForCategory();
    v10 = (DAChamberSensorEvent *)v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000107D0(v8, &v10->super);
      }
    }
    else
    {
      v26 = v2;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v7 count];
        *(_DWORD *)buf = 134217984;
        id v33 = v11;
        _os_log_impl((void *)&_mh_execute_header, &v10->super, OS_LOG_TYPE_DEFAULT, "DAWifiSensor: Found %lu networks", buf, 0xCu);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v25 = v7;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v18 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = [v17 networkName];
              id v20 = [v17 RSSI];
              *(_DWORD *)buf = 138412546;
              id v33 = v19;
              __int16 v34 = 2048;
              id v35 = v20;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SSID: %@, RSSI: %ld, ", buf, 0x16u);
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v14);
      }

      if ([v12 count]) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = 3;
      }
      v10 = [[DAChamberSensorEvent alloc] initWithSensorType:1 eventType:v21];
      v2 = v26;
      v22 = [(DAWifiSensor *)v26 mostRecentEvent];
      unsigned __int8 v23 = [(DAChamberSensorEvent *)v10 isEqual:v22];

      if ((v23 & 1) == 0)
      {
        v24 = [(DAWifiSensor *)v26 delegate];
        [v24 handleSensorEvent:v10];

        [(DAWifiSensor *)v26 setMostRecentEvent:v10];
      }
      v7 = v25;
      id v8 = 0;
    }

    [(DAWifiSensor *)v2 scanInterval];
    -[DAWifiSensor scheduleNetworksScanWithDelay:](v2, "scheduleNetworksScanWithDelay:");
  }
}

- (void)scheduleNetworksScanWithDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v5 = [(DAWifiSensor *)self scanQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CB50;
  block[3] = &unk_10001C590;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

- (void)dealloc
{
  [(DAWifiSensor *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)DAWifiSensor;
  [(DAWifiSensor *)&v3 dealloc];
}

- (DAChamberSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DAChamberSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (OS_dispatch_queue)scanQueue
{
  return self->_scanQueue;
}

- (void)setScanQueue:(id)a3
{
}

- (DAChamberSensorEvent)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (void)setMostRecentEvent:(id)a3
{
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(double)a3
{
  self->_scanInterval = a3;
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
  objc_storeStrong((id *)&self->_mostRecentEvent, 0);
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_interface, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end