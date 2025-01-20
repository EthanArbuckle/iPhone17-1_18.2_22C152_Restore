@interface CSVoiceTriggerXPCServiceProxy
+ (id)sharedInstance;
- (BOOL)isPhraseSpotterBypassed;
- (BOOL)isRaiseToSpeakBypassed;
- (CSSiriAssertionMonitor)assertionMonitor;
- (CSVoiceTriggerXPCServiceProxy)init;
- (CSVoiceTriggerXPCServiceProxy)initWithAssertionMonitor:(id)a3;
- (NSHashTable)observers;
- (NSMutableSet)activationAssertions;
- (id)_fetchAssertionMonitor;
- (id)fetchVoiceTriggerStats;
- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5;
- (void)notifyServiceConnectionLost;
- (void)notifyVoiceTriggeredSiriSessionCancelled;
- (void)registerObserver:(id)a3;
- (void)setActivationAssertions:(id)a3;
- (void)setAssertionMonitor:(id)a3;
- (void)setIsPhraseSpotterBypassed:(BOOL)a3;
- (void)setIsRaiseToSpeakBypassed:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4;
- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSVoiceTriggerXPCServiceProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activationAssertions, 0);
}

- (void)setAssertionMonitor:(id)a3
{
}

- (CSSiriAssertionMonitor)assertionMonitor
{
  return self->_assertionMonitor;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setIsRaiseToSpeakBypassed:(BOOL)a3
{
  self->_isRaiseToSpeakBypassed = a3;
}

- (BOOL)isRaiseToSpeakBypassed
{
  return self->_isRaiseToSpeakBypassed;
}

- (void)setIsPhraseSpotterBypassed:(BOOL)a3
{
  self->_isPhraseSpotterBypassed = a3;
}

- (BOOL)isPhraseSpotterBypassed
{
  return self->_isPhraseSpotterBypassed;
}

- (void)setActivationAssertions:(id)a3
{
}

- (NSMutableSet)activationAssertions
{
  return self->_activationAssertions;
}

- (id)fetchVoiceTriggerStats
{
  v2 = +[CSVoiceTriggerDataCollector sharedInstance];
  v3 = [v2 fetchVoiceTriggerHeartBeatMetrics];

  return v3;
}

- (void)notifyServiceConnectionLost
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSVoiceTriggerXPCServiceProxy notifyServiceConnectionLost]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s HandleDisconnect", buf, 0xCu);
  }
  id v4 = [(NSMutableSet *)self->_activationAssertions copy];
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v9);
          v11 = +[NSProcessInfo processInfo];
          [v11 systemUptime];
          -[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:](self, "enableVoiceTrigger:withAssertion:timestamp:", 0, v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  -[CSVoiceTriggerXPCServiceProxy setPhraseSpotterBypassing:timeout:](self, "setPhraseSpotterBypassing:timeout:", 0, 0.0, (void)v12);
  [(CSVoiceTriggerXPCServiceProxy *)self setRaiseToSpeakBypassing:0 timeout:0.0];
}

- (void)notifyVoiceTriggeredSiriSessionCancelled
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSVoiceTriggerXPCServiceProxy notifyVoiceTriggeredSiriSessionCancelled]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  if (qword_1002A3608 != -1) {
    dispatch_once(&qword_1002A3608, &stru_10024E738);
  }
  objc_initWeak(&location, self);
  id v7 = qword_1002A3610;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DFA4;
  block[3] = &unk_10024E718;
  block[4] = self;
  BOOL v10 = a3;
  v9[1] = *(id *)&a4;
  objc_copyWeak(v9, &location);
  dispatch_sync(v7, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  if (qword_1002A35F0 != -1) {
    dispatch_once(&qword_1002A35F0, &stru_10024E6F0);
  }
  objc_initWeak(&location, self);
  id v7 = qword_1002A35F8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E560;
  block[3] = &unk_10024E718;
  block[4] = self;
  BOOL v10 = a3;
  v9[1] = *(id *)&a4;
  objc_copyWeak(v9, &location);
  dispatch_sync(v7, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v18 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    __int16 v19 = 2082;
    v20 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    __int16 v21 = 1026;
    BOOL v22 = v6;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2050;
    double v26 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s ::: %{public}s enable: %{public}d reason: %{public}@ timestamp : %{public}lf", buf, 0x30u);
  }
  if (qword_1002A35D0 == -1)
  {
    if (v8)
    {
LABEL_5:
      BOOL v10 = qword_1002A35E8;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001EC1C;
      v12[3] = &unk_1002507D8;
      BOOL v16 = v6;
      double v15 = a5;
      id v13 = v8;
      long long v14 = self;
      dispatch_sync(v10, v12);

      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&qword_1002A35D0, &stru_10024E6D0);
    if (v8) {
      goto LABEL_5;
    }
  }
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Ignoring request to enable/disable voice trigger with nil reason.", buf, 0xCu);
  }
LABEL_9:
}

- (id)_fetchAssertionMonitor
{
  assertionMonitor = self->_assertionMonitor;
  if (assertionMonitor)
  {
    int v3 = assertionMonitor;
  }
  else
  {
    int v3 = +[CSSiriAssertionMonitor sharedInstance];
  }
  return v3;
}

- (void)unregisterObserver:(id)a3
{
}

- (void)registerObserver:(id)a3
{
}

- (CSVoiceTriggerXPCServiceProxy)initWithAssertionMonitor:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSVoiceTriggerXPCServiceProxy;
  BOOL v6 = [(CSVoiceTriggerXPCServiceProxy *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    if (v5) {
      objc_storeStrong((id *)&v6->_assertionMonitor, a3);
    }
    uint64_t v8 = +[NSMutableSet set];
    activationAssertions = v7->_activationAssertions;
    v7->_activationAssertions = (NSMutableSet *)v8;

    *(_WORD *)&v7->_isPhraseSpotterBypassed = 0;
    uint64_t v10 = +[NSHashTable weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;
  }
  return v7;
}

- (CSVoiceTriggerXPCServiceProxy)init
{
  return [(CSVoiceTriggerXPCServiceProxy *)self initWithAssertionMonitor:0];
}

+ (id)sharedInstance
{
  if (qword_1002A35C8 != -1) {
    dispatch_once(&qword_1002A35C8, &stru_10024E6B0);
  }
  v2 = (void *)qword_1002A35C0;
  return v2;
}

@end