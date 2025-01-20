@interface CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS
- (BOOL)_deviceSupportMyriadFriendlySelfTrigger;
- (BOOL)_shouldEnableMyriadFriendlySelfTrigger;
- (CSPolicy)voiceTriggerEnabledPolicy;
- (CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS)init;
- (void)_addSelfTriggerDetectorEnabledConditions;
- (void)_subscribeEventMonitors;
- (void)setVoiceTriggerEnabledPolicy:(id)a3;
@end

@implementation CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS

- (BOOL)_shouldEnableMyriadFriendlySelfTrigger
{
  if (_os_feature_enabled_impl())
  {
    v3 = +[CSSiriEnabledMonitor sharedInstance];
    unsigned int v4 = [v3 isEnabled];

    if ([(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self _deviceSupportMyriadFriendlySelfTrigger])
    {
      v5 = +[CSAVCallConnectedMonitor sharedInstance];
      if (([v5 hasConnectedAVCall] & v4) == 1)
      {
        v6 = +[CSSystemShellStartMonitorFactory defaultShellStartMonitor];
        if ([v6 isSystemShellStarted])
        {
          v7 = +[CSFirstUnlockMonitor sharedInstance];
          unsigned int v8 = [v7 isFirstUnlocked];
        }
        else
        {
          unsigned int v8 = 0;
        }
      }
      else
      {
        unsigned int v8 = 0;
      }
    }
    else
    {
      unsigned int v8 = 0;
    }
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v8) {
        CFStringRef v10 = @"YES";
      }
      int v12 = 136315394;
      v13 = "-[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS _shouldEnableMyriadFriendlySelfTrigger]";
      __int16 v14 = 2112;
      CFStringRef v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s shouldEnableMyriadFriendly STS? %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (CSPolicy)voiceTriggerEnabledPolicy
{
  return self->_voiceTriggerEnabledPolicy;
}

- (BOOL)_deviceSupportMyriadFriendlySelfTrigger
{
  unsigned int v2 = +[CSUtils isIOSDeviceSupportingBargeIn];
  if (v2)
  {
    LOBYTE(v2) = +[CSUtils supportHandsFree];
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setVoiceTriggerEnabledPolicy:(id)a3
{
}

- (void)_addSelfTriggerDetectorEnabledConditions
{
  objc_initWeak(&location, self);
  v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  v5 = sub_100004450;
  v6 = &unk_100253730;
  objc_copyWeak(&v7, &location);
  [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self addConditions:&v3];
  -[CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS addConditions:](self, "addConditions:", &stru_10024ED40, v3, v4, v5, v6);
  [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self addConditions:&stru_10024ED60];
  [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self addConditions:&stru_10024ED80];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_subscribeEventMonitors
{
  v3 = +[CSSpeechDetectionDevicePresentMonitor sharedInstance];
  [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v3];

  uint64_t v4 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v4];

  v5 = +[CSBuiltinSpeakerStateMonitor sharedInstance];
  [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v5];

  v6 = +[CSPlaybackVolumeStatusMonitor sharedInstance];
  [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v6];

  if ([(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self _deviceSupportMyriadFriendlySelfTrigger])
  {
    id v7 = +[CSSiriEnabledMonitor sharedInstance];
    [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v7];

    unsigned int v8 = +[CSSystemShellStartMonitorFactory defaultShellStartMonitor];
    [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v8];

    v9 = +[CSFirstUnlockMonitor sharedInstance];
    [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v9];

    id v10 = +[CSAVCallConnectedMonitor sharedInstance];
    [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)self subscribeEventMonitor:v10];
  }
}

- (CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS)init
{
  v13.receiver = self;
  v13.super_class = (Class)CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS;
  unsigned int v2 = [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy];
    voiceTriggerEnabledPolicy = v2->_voiceTriggerEnabledPolicy;
    v2->_voiceTriggerEnabledPolicy = (CSPolicy *)v3;

    objc_initWeak(&location, v2);
    v5 = v2->_voiceTriggerEnabledPolicy;
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_100034334;
    id v10 = &unk_100252EE0;
    objc_copyWeak(&v11, &location);
    [(CSPolicy *)v5 setCallback:&v7];
    [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)v2 _subscribeEventMonitors];
    [(CSSelfTriggerDetectorUseAVVCEnabledPolicyIOS *)v2 _addSelfTriggerDetectorEnabledConditions];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

@end