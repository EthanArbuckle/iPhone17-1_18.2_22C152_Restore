@interface CSVoiceTriggerJarvisAPEnabledPolicy
+ (id)sharedInstance;
- (BOOL)isPlaybackAudioSessionActive;
- (CSVoiceTriggerJarvisAPEnabledPolicy)init;
- (NSString)clientRecordRoute;
- (void)_addVoiceTriggerHearstAPEnabledPolicy;
- (void)_subscribeEventMonitors;
- (void)setClientRecordRoute:(id)a3;
- (void)setIsPlaybackAudioSessionActive:(BOOL)a3;
- (void)siriClientBehaviorMonitor:(id)a3 activatedAudioSessionWithReason:(unint64_t)a4;
- (void)siriClientBehaviorMonitorAudioDeviceInfoUpdated:(id)a3;
- (void)siriClientBehaviorMonitorReleasedAudioSession:(id)a3;
@end

@implementation CSVoiceTriggerJarvisAPEnabledPolicy

- (void).cxx_destruct
{
}

- (void)setClientRecordRoute:(id)a3
{
}

- (NSString)clientRecordRoute
{
  return self->_clientRecordRoute;
}

- (void)setIsPlaybackAudioSessionActive:(BOOL)a3
{
  self->_isPlaybackAudioSessionActive = a3;
}

- (BOOL)isPlaybackAudioSessionActive
{
  return self->_isPlaybackAudioSessionActive;
}

- (void)siriClientBehaviorMonitorAudioDeviceInfoUpdated:(id)a3
{
  v4 = [a3 recordDeviceInfo];
  v5 = [v4 route];
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self setClientRecordRoute:v5];

  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self notifyCallbackWithOption:0];
}

- (void)siriClientBehaviorMonitorReleasedAudioSession:(id)a3
{
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self setIsPlaybackAudioSessionActive:0];
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self notifyCallbackWithOption:0];
}

- (void)siriClientBehaviorMonitor:(id)a3 activatedAudioSessionWithReason:(unint64_t)a4
{
  if (a4 - 3 <= 1)
  {
    [(CSVoiceTriggerJarvisAPEnabledPolicy *)self setIsPlaybackAudioSessionActive:1];
    [(CSVoiceTriggerJarvisAPEnabledPolicy *)self notifyCallbackWithOption:0];
  }
}

- (void)_addVoiceTriggerHearstAPEnabledPolicy
{
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self addConditions:&stru_1002527B8];
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self addConditions:&stru_1002527D8];
  objc_initWeak(&location, self);
  v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  v5 = sub_10014128C;
  v6 = &unk_100253730;
  objc_copyWeak(&v7, &location);
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self addConditions:&v3];
  -[CSVoiceTriggerJarvisAPEnabledPolicy addConditions:](self, "addConditions:", &stru_1002527F8, v3, v4, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_subscribeEventMonitors
{
  v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self subscribeEventMonitor:v3];

  uint64_t v4 = +[CSOtherAppRecordingStateMonitor sharedInstance];
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self subscribeEventMonitor:v4];

  v5 = +[CSAudioStreamActivityMonitor sharedInstance];
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self subscribeEventMonitor:v5];

  v6 = +[CSAudioRouteChangeMonitor sharedInstance];
  [(CSVoiceTriggerJarvisAPEnabledPolicy *)self subscribeEventMonitor:v6];

  id v7 = +[CSSiriClientBehaviorMonitor sharedInstance];
  [v7 registerObserver:self];
}

- (CSVoiceTriggerJarvisAPEnabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerJarvisAPEnabledPolicy;
  v2 = [(CSVoiceTriggerJarvisAPEnabledPolicy *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_isPlaybackAudioSessionActive = 0;
    [(CSVoiceTriggerJarvisAPEnabledPolicy *)v2 _addVoiceTriggerHearstAPEnabledPolicy];
    [(CSVoiceTriggerJarvisAPEnabledPolicy *)v3 _subscribeEventMonitors];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3B68 != -1) {
    dispatch_once(&qword_1002A3B68, &stru_100252798);
  }
  v2 = (void *)qword_1002A3B60;
  return v2;
}

@end