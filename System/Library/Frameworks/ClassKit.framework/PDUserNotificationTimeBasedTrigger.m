@interface PDUserNotificationTimeBasedTrigger
- (NSCalendar)calendar;
- (NSDateComponents)recurringTriggerDateComponents;
- (OS_dispatch_queue)queue;
- (PDUserNotificationTimeBasedTrigger)initWithDatabase:(id)a3;
- (id)defaultRecurringTriggerDateComponents;
- (id)nextTriggerDateFromReferenceDate:(id)a3;
- (void)checkForTriggerAtDate:(id)a3;
- (void)checkTriggerNow;
- (void)resetTrigger;
- (void)scheduleCheckTimerForNextTriggerTime;
- (void)scheduleCheckTimerForTimeInterval:(double)a3;
- (void)setCalendar:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecurringTriggerDateComponents:(id)a3;
@end

@implementation PDUserNotificationTimeBasedTrigger

- (PDUserNotificationTimeBasedTrigger)initWithDatabase:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PDUserNotificationTimeBasedTrigger;
  v3 = [(PDUserNotificationTrigger *)&v11 initWithDatabase:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.progressd.timeBasedTriggerQ", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSCalendar currentCalendar];
    calendar = v3->_calendar;
    v3->_calendar = (NSCalendar *)v6;

    uint64_t v8 = [(PDUserNotificationTimeBasedTrigger *)v3 defaultRecurringTriggerDateComponents];
    recurringTriggerDateComponents = v3->_recurringTriggerDateComponents;
    v3->_recurringTriggerDateComponents = (NSDateComponents *)v8;
  }
  return v3;
}

- (void)scheduleCheckTimerForTimeInterval:(double)a3
{
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013B8C4;
  v12[3] = &unk_1001F2D28;
  objc_copyWeak(&v13, &location);
  v5 = objc_retainBlock(v12);
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  uint64_t v8 = +[NSString stringWithFormat:@"com.apple.progressd.task.%@", v7];

  v9 = [[PDTaskSchedulerBlockTask alloc] initWithIdentifier:v8 queue:self->_queue block:v5];
  [(PDTaskSchedulerBlockTask *)v9 setDelay:(unint64_t)a3];
  [(PDTaskSchedulerBlockTask *)v9 setGracePeriod:60];
  [(PDTaskSchedulerBlockTask *)v9 setRepeating:0];
  [(PDTaskSchedulerBlockTask *)v9 setRequiredNetworkState:0];
  v10 = sub_1000637B8();
  sub_100063984(v10, v8);

  objc_super v11 = sub_1000637B8();
  sub_100063F70(v11, v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)scheduleCheckTimerForNextTriggerTime
{
  v3 = +[NSDate date];
  dispatch_queue_t v4 = [(PDUserNotificationTimeBasedTrigger *)self nextTriggerDateFromReferenceDate:v3];
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;
  CLSInitLog();
  v7 = (void *)CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    v9 = +[NSNumber numberWithDouble:round(v6)];
    int v10 = 138412546;
    objc_super v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PDUserNotificationTimeBasedTrigger.scheduleCheckTimerForNextTriggerTime. Schedule timer for %@ %@", (uint8_t *)&v10, 0x16u);
  }
  [(PDUserNotificationTimeBasedTrigger *)self scheduleCheckTimerForTimeInterval:v6];
}

- (id)nextTriggerDateFromReferenceDate:(id)a3
{
  CLSInitLog();
  v3 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v6 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "PDUserNotificationTimeBasedTrigger.nextTriggerDateFromReferenceDate. Subclass must override.", v6, 2u);
  }
  dispatch_queue_t v4 = +[NSDate distantFuture];

  return v4;
}

- (id)defaultRecurringTriggerDateComponents
{
  CLSInitLog();
  v2 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v5 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "PDUserNotificationTimeBasedTrigger.defaultRecurringTriggerDateComponents. Subclass must override.", v5, 2u);
  }
  id v3 = objc_alloc_init((Class)NSDateComponents);
  [v3 setHour:0];
  [v3 setMinute:0];
  [v3 setSecond:0];

  return v3;
}

- (void)checkTriggerNow
{
  CLSInitLog();
  id v3 = (void *)CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v4 = v3;
    *(_DWORD *)v7 = 138412290;
    *(void *)&v7[4] = objc_opt_class();
    id v5 = *(id *)&v7[4];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ checkForTriggerNow", v7, 0xCu);
  }
  double v6 = +[NSDate date];
  [(PDUserNotificationTimeBasedTrigger *)self checkForTriggerAtDate:v6];

  [(PDUserNotificationTimeBasedTrigger *)self scheduleCheckTimerForNextTriggerTime];
}

- (void)resetTrigger
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v5 = +[NSString stringWithFormat:@"com.apple.progressd.task.%@", v3];

  dispatch_queue_t v4 = sub_1000637B8();
  sub_100063984(v4, v5);
}

- (void)checkForTriggerAtDate:(id)a3
{
  CLSInitLog();
  id v3 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)dispatch_queue_t v4 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "PDUserNotificationTimeBasedTrigger.checkForTriggerAtDate. Subclass should override.", v4, 2u);
  }
}

- (void)setRecurringTriggerDateComponents:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_recurringTriggerDateComponents, a3);
    [(PDUserNotificationTimeBasedTrigger *)self checkTriggerNow];
    id v5 = v6;
  }
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSDateComponents)recurringTriggerDateComponents
{
  return self->_recurringTriggerDateComponents;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recurringTriggerDateComponents, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end