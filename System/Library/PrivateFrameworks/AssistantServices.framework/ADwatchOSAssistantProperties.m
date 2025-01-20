@interface ADwatchOSAssistantProperties
- (BOOL)_getIsRaiseToSpeakEnabled;
- (BOOL)_getIsSiriTryItCompleted;
- (id)getODDwatchOSAssistantProperties;
@end

@implementation ADwatchOSAssistantProperties

- (BOOL)_getIsSiriTryItCompleted
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.SiriCarouselAlert"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"TryItCompleted"];

  return v3;
}

- (BOOL)_getIsRaiseToSpeakEnabled
{
  return 0;
}

- (id)getODDwatchOSAssistantProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[ADwatchOSAssistantProperties getODDwatchOSAssistantProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDwatchOSAssistantProperties);
  objc_msgSend(v4, "setIsRaiseToSpeakEnabled:", -[ADwatchOSAssistantProperties _getIsRaiseToSpeakEnabled](self, "_getIsRaiseToSpeakEnabled"));
  objc_msgSend(v4, "setIsSiriTryItCompleted:", -[ADwatchOSAssistantProperties _getIsSiriTryItCompleted](self, "_getIsSiriTryItCompleted"));
  return v4;
}

@end