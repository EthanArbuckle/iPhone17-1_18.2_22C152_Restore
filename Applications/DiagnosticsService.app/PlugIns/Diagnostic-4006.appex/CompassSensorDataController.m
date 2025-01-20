@interface CompassSensorDataController
- (DAHIDEventMonitor)eventMonitor;
- (int)compassDataCount;
- (void)finish;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)setCompassDataCount:(int)a3;
- (void)setEventMonitor:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation CompassSensorDataController

- (void)start
{
  [(CompassSensorDataController *)self setCompassDataCount:0];
  v3 = +[DAHIDEventMonitor sharedInstance];
  [(CompassSensorDataController *)self setEventMonitor:v3];

  v4 = [(CompassSensorDataController *)self eventMonitor];
  [v4 setDelegate:self];

  if (([(CompassSensorDataController *)self isCancelled] & 1) == 0)
  {
    v5 = [(CompassSensorDataController *)self eventMonitor];
    v6 = +[NSSet setWithObject:&off_1000043C8];
    unsigned int v7 = [v5 startMonitoringWithHIDEvents:v6];

    if (v7
      && ([(CompassSensorDataController *)self eventMonitor],
          v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = objc_msgSend(v8, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10000), @"ReportInterval", 4), v8, v9))
    {
      dispatch_time_t v10 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100001310;
      block[3] = &unk_100004230;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v11 = [(CompassSensorDataController *)self result];
      [v11 setStatusCode:&off_1000043E0];

      [(CompassSensorDataController *)self setFinished:1];
    }
  }
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (([(CompassSensorDataController *)self isCancelled] & 1) == 0
    && IOHIDEventGetType() == 21)
  {
    IOHIDEventGetFloatValue();
    IOHIDEventGetFloatValue();
    IOHIDEventGetFloatValue();
    uint64_t v4 = [(CompassSensorDataController *)self compassDataCount] + 1;
    [(CompassSensorDataController *)self setCompassDataCount:v4];
  }
}

- (void)finish
{
  if (([(CompassSensorDataController *)self isCancelled] & 1) == 0)
  {
    [(CompassSensorDataController *)self teardown];
    int v3 = [(CompassSensorDataController *)self compassDataCount];
    uint64_t v4 = DiagnosticLogHandleForCategory();
    v5 = v4;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000027D8(v5);
      }

      v6 = [(CompassSensorDataController *)self result];
      unsigned int v7 = v6;
      v8 = &off_100004410;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = [(CompassSensorDataController *)self compassDataCount];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Compass found. (%d)", (uint8_t *)v9, 8u);
      }

      v6 = [(CompassSensorDataController *)self result];
      unsigned int v7 = v6;
      v8 = &off_1000043F8;
    }
    [v6 setStatusCode:v8];
  }
  [(CompassSensorDataController *)self setFinished:1];
}

- (void)teardown
{
  int v3 = [(CompassSensorDataController *)self eventMonitor];

  if (v3)
  {
    uint64_t v4 = [(CompassSensorDataController *)self eventMonitor];
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      v6 = [(CompassSensorDataController *)self eventMonitor];
      [v6 stopMonitoring];
    }
    [(CompassSensorDataController *)self setEventMonitor:0];
  }
}

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (int)compassDataCount
{
  return self->_compassDataCount;
}

- (void)setCompassDataCount:(int)a3
{
  self->_compassDataCount = a3;
}

- (void).cxx_destruct
{
}

@end