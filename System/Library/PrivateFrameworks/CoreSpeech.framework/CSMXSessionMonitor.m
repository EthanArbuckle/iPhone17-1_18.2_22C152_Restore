@interface CSMXSessionMonitor
+ (id)GetCurrentlyActiveSessionCategory;
+ (id)GetCurrentlyActiveSessionMode;
+ (id)sharedInstance;
- (CSMXSessionMonitor)init;
- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3;
- (void)_querySomeClientIsActive;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingAVSystemControllerLifecycle;
- (void)_startObservingSomeClientIsActive;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
@end

@implementation CSMXSessionMonitor

- (void).cxx_destruct
{
}

- (void)_querySomeClientIsActive
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100151074;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001513B4;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_systemControllerDied:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "-[CSMXSessionMonitor _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSMXSessionMonitor *)self _startObservingAVSystemControllerLifecycle];
  [(CSMXSessionMonitor *)self _startObservingSomeClientIsActive];
  [(CSMXSessionMonitor *)self _handleSomeClientIsActiveDidChangeNotification:0];
}

- (void)_startObservingSomeClientIsActive
{
  v3 = +[AVSystemController sharedAVSystemController];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:AVSystemController_SomeClientIsActiveDidChangeNotification object:v3];
  uint64_t v6 = AVSystemController_SomeClientIsActiveDidChangeNotification;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 setAttribute:v5 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  [v4 addObserver:self selector:"_handleSomeClientIsActiveDidChangeNotification:" name:AVSystemController_SomeClientIsActiveDidChangeNotification object:v3];
}

- (void)_startObservingAVSystemControllerLifecycle
{
  id v5 = +[AVSystemController sharedAVSystemController];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:v5];
  id v4 = +[NSArray arrayWithObject:AVSystemController_ServerConnectionDiedNotification];
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  [v3 addObserver:self selector:"_systemControllerDied:" name:AVSystemController_ServerConnectionDiedNotification object:v5];
}

- (void)_stopMonitoring
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSMXSessionMonitor _stopMonitoring]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSMXSessionMonitor _startMonitoringWithQueue:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(CSMXSessionMonitor *)self _startObservingAVSystemControllerLifecycle];
  [(CSMXSessionMonitor *)self _startObservingSomeClientIsActive];
  [(CSMXSessionMonitor *)self _querySomeClientIsActive];
}

- (CSMXSessionMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSMXSessionMonitor;
  v2 = [(CSMXSessionMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSMXSessionMonitorQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)GetCurrentlyActiveSessionMode
{
  v2 = +[AVSystemController sharedAVSystemController];
  dispatch_queue_t v3 = [v2 attributeForKey:AVSystemController_CurrentlyActiveModeAttribute];

  return v3;
}

+ (id)GetCurrentlyActiveSessionCategory
{
  v2 = +[AVSystemController sharedAVSystemController];
  dispatch_queue_t v3 = [v2 attributeForKey:AVSystemController_CurrentlyActiveCategoryAttribute];

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3BF8 != -1) {
    dispatch_once(&qword_1002A3BF8, &stru_100252CC8);
  }
  v2 = (void *)qword_1002A3BF0;
  return v2;
}

@end