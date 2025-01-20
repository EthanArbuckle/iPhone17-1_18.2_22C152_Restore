@interface AccelerometerSensorDataController
- (DAHIDEventMonitor)eventMonitor;
- (int)accelerometerDataCount;
- (void)finish;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)setAccelerometerDataCount:(int)a3;
- (void)setEventMonitor:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation AccelerometerSensorDataController

- (void)start
{
  [(AccelerometerSensorDataController *)self setAccelerometerDataCount:0];
  v3 = +[DAHIDEventMonitor sharedInstance];
  [(AccelerometerSensorDataController *)self setEventMonitor:v3];

  v4 = [(AccelerometerSensorDataController *)self eventMonitor];
  [v4 setDelegate:self];

  if (([(AccelerometerSensorDataController *)self isCancelled] & 1) == 0)
  {
    v5 = [(AccelerometerSensorDataController *)self eventMonitor];
    v6 = +[NSSet setWithObject:&off_1000044D0];
    unsigned int v7 = [v5 startMonitoringWithHIDEvents:v6];

    if (v7
      && ([(AccelerometerSensorDataController *)self eventMonitor],
          v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = objc_msgSend(v8, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10000), @"ReportInterval", 0), v8, v9))
    {
      dispatch_time_t v10 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000024AC;
      block[3] = &unk_100004298;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v11 = [(AccelerometerSensorDataController *)self result];
      [v11 setStatusCode:&off_1000044E8];

      [(AccelerometerSensorDataController *)self setFinished:1];
    }
  }
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (([(AccelerometerSensorDataController *)self isCancelled] & 1) == 0
    && IOHIDEventGetType() == 13)
  {
    IOHIDEventGetFloatValue();
    IOHIDEventGetFloatValue();
    IOHIDEventGetFloatValue();
    uint64_t v4 = [(AccelerometerSensorDataController *)self accelerometerDataCount] + 1;
    [(AccelerometerSensorDataController *)self setAccelerometerDataCount:v4];
  }
}

- (void)finish
{
  if (([(AccelerometerSensorDataController *)self isCancelled] & 1) == 0)
  {
    [(AccelerometerSensorDataController *)self teardown];
    int v3 = [(AccelerometerSensorDataController *)self accelerometerDataCount];
    uint64_t v4 = DiagnosticLogHandleForCategory();
    v5 = v4;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10000293C(v5);
      }

      v6 = [(AccelerometerSensorDataController *)self result];
      unsigned int v7 = v6;
      v8 = &off_100004518;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = [(AccelerometerSensorDataController *)self accelerometerDataCount];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accelerometer found. (%d)", (uint8_t *)v9, 8u);
      }

      v6 = [(AccelerometerSensorDataController *)self result];
      unsigned int v7 = v6;
      v8 = &off_100004500;
    }
    [v6 setStatusCode:v8];
  }
  [(AccelerometerSensorDataController *)self setFinished:1];
}

- (void)teardown
{
  int v3 = [(AccelerometerSensorDataController *)self eventMonitor];

  if (v3)
  {
    uint64_t v4 = [(AccelerometerSensorDataController *)self eventMonitor];
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      v6 = [(AccelerometerSensorDataController *)self eventMonitor];
      [v6 stopMonitoring];
    }
    [(AccelerometerSensorDataController *)self setEventMonitor:0];
  }
}

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (int)accelerometerDataCount
{
  return self->_accelerometerDataCount;
}

- (void)setAccelerometerDataCount:(int)a3
{
  self->_accelerometerDataCount = a3;
}

- (void).cxx_destruct
{
}

@end