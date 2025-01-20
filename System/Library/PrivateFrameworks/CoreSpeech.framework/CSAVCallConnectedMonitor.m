@interface CSAVCallConnectedMonitor
+ (id)sharedInstance;
- (BOOL)hasConnectedAVCall;
- (CSAVCallConnectedMonitor)init;
- (void)_handleCallActiveDidChangeNotification:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_startObservingAVCallActiveChange;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopMonitoring;
- (void)_systemControllerDied:(id)a3;
@end

@implementation CSAVCallConnectedMonitor

- (BOOL)hasConnectedAVCall
{
  return self->_hasConnectedAVCall;
}

+ (id)sharedInstance
{
  if (qword_1002A3C08 != -1) {
    dispatch_once(&qword_1002A3C08, &stru_100252D80);
  }
  v2 = (void *)qword_1002A3C00;
  return v2;
}

- (void)_startObservingSystemControllerLifecycle
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];

  id v8 = +[NSArray arrayWithObject:AVSystemController_ServerConnectionDiedNotification];
  v4 = +[AVSystemController sharedAVSystemController];
  [v4 setAttribute:v8 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = AVSystemController_ServerConnectionDiedNotification;
  v7 = +[AVSystemController sharedAVSystemController];
  [v5 addObserver:self selector:"_systemControllerDied:" name:v6 object:v7];
}

- (void)_systemControllerDied:(id)a3
{
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSAVCallConnectedMonitor _systemControllerDied:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSAVCallConnectedMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSAVCallConnectedMonitor *)self _startObservingAVCallActiveChange];
  [(CSAVCallConnectedMonitor *)self _handleCallActiveDidChangeNotification:0];
}

- (void)_startObservingAVCallActiveChange
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVSystemController_CallIsActiveDidChangeNotification object:0];

  uint64_t v7 = AVSystemController_CallIsActiveDidChangeNotification;
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = +[AVSystemController sharedAVSystemController];
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  int v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handleCallActiveDidChangeNotification:" name:AVSystemController_CallIsActiveDidChangeNotification object:0];
}

- (void)_stopMonitoring
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_handleCallActiveDidChangeNotification:(id)a3
{
  id v5 = +[AVSystemController sharedAVSystemController];
  id v4 = [v5 attributeForKey:AVSystemController_CallIsActive];
  self->_hasConnectedAVCall = [v4 BOOLValue];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  [(CSAVCallConnectedMonitor *)self _startObservingSystemControllerLifecycle];
  [(CSAVCallConnectedMonitor *)self _startObservingAVCallActiveChange];
  [(CSAVCallConnectedMonitor *)self _handleCallActiveDidChangeNotification:0];
}

- (CSAVCallConnectedMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSAVCallConnectedMonitor;
  result = [(CSAVCallConnectedMonitor *)&v3 init];
  if (result) {
    result->_hasConnectedAVCall = 0;
  }
  return result;
}

@end