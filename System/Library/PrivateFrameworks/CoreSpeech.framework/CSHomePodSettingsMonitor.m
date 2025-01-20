@interface CSHomePodSettingsMonitor
+ (id)sharedInstance;
- (BOOL)shouldAudioMonitoringRecording;
- (BOOL)shouldVoiceTriggerRun;
- (void)_stopMonitoring;
@end

@implementation CSHomePodSettingsMonitor

- (BOOL)shouldAudioMonitoringRecording
{
  return 1;
}

- (BOOL)shouldVoiceTriggerRun
{
  return 1;
}

- (void)_stopMonitoring
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSHomePodSettingsMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : HomePod voiceTriggerAssertion", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)sharedInstance
{
  if (qword_1002A37A8 != -1) {
    dispatch_once(&qword_1002A37A8, &stru_10024FA80);
  }
  v2 = (void *)qword_1002A37A0;
  return v2;
}

@end