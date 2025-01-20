@interface BarometerSensorDataController
- (DAHIDEventMonitor)eventMonitor;
- (int)barometerDataCount;
- (void)finish;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)setBarometerDataCount:(int)a3;
- (void)setEventMonitor:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation BarometerSensorDataController

- (void)start
{
  [(BarometerSensorDataController *)self setBarometerDataCount:0];
  v3 = +[DAHIDEventMonitor sharedInstance];
  [(BarometerSensorDataController *)self setEventMonitor:v3];

  v4 = [(BarometerSensorDataController *)self eventMonitor];
  [v4 setDelegate:self];

  if (([(BarometerSensorDataController *)self isCancelled] & 1) == 0)
  {
    v5 = [(BarometerSensorDataController *)self eventMonitor];
    v6 = +[NSSet setWithObject:&off_1000044D0];
    unsigned int v7 = [v5 startMonitoringWithHIDEvents:v6];

    if (v7
      && ([(BarometerSensorDataController *)self eventMonitor],
          v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = objc_msgSend(v8, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 40000), @"ReportInterval", 5), v8, v9))
    {
      dispatch_time_t v10 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100002520;
      block[3] = &unk_100004298;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v11 = [(BarometerSensorDataController *)self result];
      [v11 setStatusCode:&off_1000044E8];

      [(BarometerSensorDataController *)self setFinished:1];
    }
  }
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (([(BarometerSensorDataController *)self isCancelled] & 1) == 0
    && IOHIDEventGetType() == 31)
  {
    IOHIDEventGetFloatValue();
    uint64_t v4 = [(BarometerSensorDataController *)self barometerDataCount] + 1;
    [(BarometerSensorDataController *)self setBarometerDataCount:v4];
  }
}

- (void)finish
{
  if (([(BarometerSensorDataController *)self isCancelled] & 1) == 0)
  {
    [(BarometerSensorDataController *)self teardown];
    int v3 = [(BarometerSensorDataController *)self barometerDataCount];
    uint64_t v4 = DiagnosticLogHandleForCategory();
    v5 = v4;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10000295C(v5);
      }

      v6 = [(BarometerSensorDataController *)self result];
      unsigned int v7 = v6;
      v8 = &off_100004518;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = [(BarometerSensorDataController *)self barometerDataCount];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Barometer found. (%d)", (uint8_t *)v9, 8u);
      }

      v6 = [(BarometerSensorDataController *)self result];
      unsigned int v7 = v6;
      v8 = &off_100004500;
    }
    [v6 setStatusCode:v8];
  }
  [(BarometerSensorDataController *)self setFinished:1];
}

- (void)teardown
{
  int v3 = [(BarometerSensorDataController *)self eventMonitor];

  if (v3)
  {
    uint64_t v4 = [(BarometerSensorDataController *)self eventMonitor];
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      v6 = [(BarometerSensorDataController *)self eventMonitor];
      [v6 stopMonitoring];
    }
    [(BarometerSensorDataController *)self setEventMonitor:0];
  }
}

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (int)barometerDataCount
{
  return self->_barometerDataCount;
}

- (void)setBarometerDataCount:(int)a3
{
  self->_barometerDataCount = a3;
}

- (void).cxx_destruct
{
}

@end