@interface CSVoiceTriggerHearstAPEnabledPolicy
+ (id)sharedInstance;
- (BOOL)_isOtherStreamsActiveOnDoAPRoute;
- (CSVoiceTriggerHearstAPEnabledPolicy)init;
- (void)_addVoiceTriggerHearstAPEnabledPolicy;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerHearstAPEnabledPolicy

- (BOOL)_isOtherStreamsActiveOnDoAPRoute
{
  v2 = +[CSAudioStreamActivityMonitor sharedInstance];
  unsigned __int8 v3 = [v2 hasNonVoiceTriggerStreamsOrStreamHoldersActive];

  v4 = +[CSAudioRouteChangeMonitor sharedInstance];
  id v5 = [v4 hearstRouteStatus];

  if (v5 == (id)1) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)_addVoiceTriggerHearstAPEnabledPolicy
{
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self addConditions:&stru_10024EA70];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002C8B8;
  v3[3] = &unk_10024F700;
  v3[4] = self;
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self addConditions:v3];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self addConditions:&stru_10024EA90];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self addConditions:&stru_10024EAB0];
}

- (void)_subscribeEventMonitors
{
  unsigned __int8 v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self subscribeEventMonitor:v3];

  v4 = +[CSOpportuneSpeakEventMonitor sharedInstance];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self subscribeEventMonitor:v4];

  id v5 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self subscribeEventMonitor:v5];

  v6 = +[CSOtherAppRecordingStateMonitor sharedInstance];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self subscribeEventMonitor:v6];

  v7 = +[CSAudioStreamActivityMonitor sharedInstance];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self subscribeEventMonitor:v7];

  id v8 = +[CSAudioRouteChangeMonitor sharedInstance];
  [(CSVoiceTriggerHearstAPEnabledPolicy *)self subscribeEventMonitor:v8];
}

- (CSVoiceTriggerHearstAPEnabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerHearstAPEnabledPolicy;
  v2 = [(CSVoiceTriggerHearstAPEnabledPolicy *)&v5 init];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    [(CSVoiceTriggerHearstAPEnabledPolicy *)v2 _addVoiceTriggerHearstAPEnabledPolicy];
    [(CSVoiceTriggerHearstAPEnabledPolicy *)v3 _subscribeEventMonitors];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3668 != -1) {
    dispatch_once(&qword_1002A3668, &stru_10024EA50);
  }
  v2 = (void *)qword_1002A3660;
  return v2;
}

@end