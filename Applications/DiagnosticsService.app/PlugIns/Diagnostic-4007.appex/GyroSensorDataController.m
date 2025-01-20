@interface GyroSensorDataController
- (DAHIDEventMonitor)eventMonitor;
- (int)gyroDataCount;
- (void)finish;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)setEventMonitor:(id)a3;
- (void)setGyroDataCount:(int)a3;
- (void)start;
- (void)teardown;
@end

@implementation GyroSensorDataController

- (void)start
{
  [(GyroSensorDataController *)self setGyroDataCount:0];
  v3 = +[DAHIDEventMonitor sharedInstance];
  [(GyroSensorDataController *)self setEventMonitor:v3];

  v4 = [(GyroSensorDataController *)self eventMonitor];
  [v4 setDelegate:self];

  if (([(GyroSensorDataController *)self isCancelled] & 1) == 0)
  {
    v5 = [(GyroSensorDataController *)self eventMonitor];
    v6 = +[NSSet setWithObject:&off_1000044D0];
    unsigned int v7 = [v5 startMonitoringWithHIDEvents:v6];

    if (v7
      && ([(GyroSensorDataController *)self eventMonitor],
          v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = objc_msgSend(v8, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10000), @"ReportInterval", 1), v8, v9))
    {
      dispatch_time_t v10 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100002488;
      block[3] = &unk_100004298;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v11 = [(GyroSensorDataController *)self result];
      [v11 setStatusCode:&off_1000044E8];

      [(GyroSensorDataController *)self setFinished:1];
    }
  }
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (([(GyroSensorDataController *)self isCancelled] & 1) == 0
    && IOHIDEventGetType() == 20)
  {
    IOHIDEventGetFloatValue();
    *(float *)&double v4 = v4;
    v5 = +[NSNumber numberWithFloat:v4];

    IOHIDEventGetFloatValue();
    *(float *)&double v6 = v6;
    unsigned int v7 = +[NSNumber numberWithFloat:v6];

    IOHIDEventGetFloatValue();
    *(float *)&double v8 = v8;
    unsigned int v9 = +[NSNumber numberWithFloat:v8];

    if (v5)
    {
      if (v7 && v9)
      {
        uint64_t v10 = [(GyroSensorDataController *)self gyroDataCount] + 1;
        [(GyroSensorDataController *)self setGyroDataCount:v10];
      }
    }
  }
}

- (void)finish
{
  if (([(GyroSensorDataController *)self isCancelled] & 1) == 0)
  {
    [(GyroSensorDataController *)self teardown];
    int v3 = [(GyroSensorDataController *)self gyroDataCount];
    double v4 = DiagnosticLogHandleForCategory();
    v5 = v4;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10000295C(v5);
      }

      double v6 = [(GyroSensorDataController *)self result];
      unsigned int v7 = v6;
      double v8 = &off_100004518;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = [(GyroSensorDataController *)self gyroDataCount];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Gyroscope found. (%d)", (uint8_t *)v9, 8u);
      }

      double v6 = [(GyroSensorDataController *)self result];
      unsigned int v7 = v6;
      double v8 = &off_100004500;
    }
    [v6 setStatusCode:v8];
  }
  [(GyroSensorDataController *)self setFinished:1];
}

- (void)teardown
{
  int v3 = [(GyroSensorDataController *)self eventMonitor];

  if (v3)
  {
    double v4 = [(GyroSensorDataController *)self eventMonitor];
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      double v6 = [(GyroSensorDataController *)self eventMonitor];
      [v6 stopMonitoring];
    }
    [(GyroSensorDataController *)self setEventMonitor:0];
  }
}

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (int)gyroDataCount
{
  return self->_gyroDataCount;
}

- (void)setGyroDataCount:(int)a3
{
  self->_gyroDataCount = a3;
}

- (void).cxx_destruct
{
}

@end