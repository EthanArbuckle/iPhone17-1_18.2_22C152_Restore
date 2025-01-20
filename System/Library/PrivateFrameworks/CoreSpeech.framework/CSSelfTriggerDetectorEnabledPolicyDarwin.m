@interface CSSelfTriggerDetectorEnabledPolicyDarwin
- (BOOL)_shouldEnableMyriadFriendlySelfTrigger;
- (CSPolicy)voiceTriggerEnabledPolicy;
- (CSSelfTriggerDetectorEnabledPolicyDarwin)init;
- (void)_addSelfTriggerDetectorEnabledConditions;
- (void)_subscribeEventMonitors;
- (void)setVoiceTriggerEnabledPolicy:(id)a3;
@end

@implementation CSSelfTriggerDetectorEnabledPolicyDarwin

- (void).cxx_destruct
{
}

- (void)setVoiceTriggerEnabledPolicy:(id)a3
{
}

- (CSPolicy)voiceTriggerEnabledPolicy
{
  return self->_voiceTriggerEnabledPolicy;
}

- (BOOL)_shouldEnableMyriadFriendlySelfTrigger
{
  v2 = +[CSSelfTriggerEnabledMonitorAccessory sharedInstance];
  unsigned int v3 = [v2 isEnabled];

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[CSSelfTriggerDetectorEnabledPolicyDarwin _shouldEnableMyriadFriendlySelfTrigger]";
    __int16 v9 = 2114;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Device meets myriad-friendly selfTrigger condition : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (void)_addSelfTriggerDetectorEnabledConditions
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10005AA30;
  v3[3] = &unk_10024F5F0;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(CSSelfTriggerDetectorEnabledPolicyDarwin *)self addConditions:v3];
  [(CSSelfTriggerDetectorEnabledPolicyDarwin *)self addConditions:&stru_10024F610];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_subscribeEventMonitors
{
  unsigned int v3 = +[CSSelfTriggerEnabledMonitorAccessory sharedInstance];
  [(CSSelfTriggerDetectorEnabledPolicyDarwin *)self subscribeEventMonitor:v3];

  id v4 = +[CSHostPowerStateMonitor sharedInstance];
  [(CSSelfTriggerDetectorEnabledPolicyDarwin *)self subscribeEventMonitor:v4];
}

- (CSSelfTriggerDetectorEnabledPolicyDarwin)init
{
  v13.receiver = self;
  v13.super_class = (Class)CSSelfTriggerDetectorEnabledPolicyDarwin;
  v2 = [(CSSelfTriggerDetectorEnabledPolicyDarwin *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy];
    voiceTriggerEnabledPolicy = v2->_voiceTriggerEnabledPolicy;
    v2->_voiceTriggerEnabledPolicy = (CSPolicy *)v3;

    objc_initWeak(&location, v2);
    CFStringRef v5 = v2->_voiceTriggerEnabledPolicy;
    int v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    __int16 v9 = sub_10005ADB0;
    CFStringRef v10 = &unk_100252EE0;
    objc_copyWeak(&v11, &location);
    [(CSPolicy *)v5 setCallback:&v7];
    [(CSSelfTriggerDetectorEnabledPolicyDarwin *)v2 _subscribeEventMonitors];
    [(CSSelfTriggerDetectorEnabledPolicyDarwin *)v2 _addSelfTriggerDetectorEnabledConditions];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

@end