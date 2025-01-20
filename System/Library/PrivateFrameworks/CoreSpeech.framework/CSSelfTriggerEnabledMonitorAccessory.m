@interface CSSelfTriggerEnabledMonitorAccessory
+ (id)sharedInstance;
- (BOOL)enabled;
- (BOOL)isEnabled;
- (CSSelfTriggerEnabledMonitorAccessory)init;
- (void)_didReceiveSelfTriggerChanged:(BOOL)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setEnable:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CSSelfTriggerEnabledMonitorAccessory

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnable:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Disable";
    if (v3) {
      CFStringRef v6 = @"Enable";
    }
    int v8 = 136315394;
    v9 = "-[CSSelfTriggerEnabledMonitorAccessory setEnable:]";
    __int16 v10 = 2114;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Set SelfTrigger Enable = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v7 = +[CSFPreferences sharedPreferences];
  [v7 setSelfTriggerEnabledAccessory:v3];

  [(CSSelfTriggerEnabledMonitorAccessory *)self _didReceiveSelfTriggerChanged:v3];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_didReceiveSelfTriggerChanged:(BOOL)a3
{
  self->_enabled = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100123164;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSSelfTriggerEnabledMonitorAccessory *)self enumerateObserversInQueue:v3];
}

- (void)_stopMonitoring
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    BOOL v4 = "-[CSSelfTriggerEnabledMonitorAccessory _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : SelfTrigger switch", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  BOOL v4 = +[CSFPreferences sharedPreferences];
  self->_enabled = [v4 isSelfTriggerEnabledAccessory];

  [(CSSelfTriggerEnabledMonitorAccessory *)self _didReceiveSelfTriggerChanged:self->_enabled];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_enabled) {
      CFStringRef v6 = @"Enabled";
    }
    else {
      CFStringRef v6 = @"Disabled";
    }
    int v7 = 136315394;
    int v8 = "-[CSSelfTriggerEnabledMonitorAccessory _startMonitoringWithQueue:]";
    __int16 v9 = 2114;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : SelfTrigger switch, SelfTrigger is %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (CSSelfTriggerEnabledMonitorAccessory)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSelfTriggerEnabledMonitorAccessory;
  result = [(CSSelfTriggerEnabledMonitorAccessory *)&v3 init];
  if (result) {
    result->_enabled = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1002A3AB0 != -1) {
    dispatch_once(&qword_1002A3AB0, &stru_100251FF0);
  }
  v2 = (void *)qword_1002A3AA8;
  return v2;
}

@end