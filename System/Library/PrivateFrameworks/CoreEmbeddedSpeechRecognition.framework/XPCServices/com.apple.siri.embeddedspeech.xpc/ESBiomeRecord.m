@interface ESBiomeRecord
- (BOOL)hasRecognizedAnything;
- (NSString)applicationName;
- (NSString)interactionId;
- (NSString)taskName;
- (double)recognitionEndTime;
- (void)markRecognition;
- (void)sendEvent;
- (void)setApplicationName:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setRecognitionEndTime:(double)a3;
- (void)setTaskName:(id)a3;
@end

@implementation ESBiomeRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);

  objc_storeStrong((id *)&self->_applicationName, 0);
}

- (BOOL)hasRecognizedAnything
{
  return self->_hasRecognizedAnything;
}

- (void)setTaskName:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setRecognitionEndTime:(double)a3
{
  self->_recognitionEndTime = a3;
}

- (double)recognitionEndTime
{
  return self->_recognitionEndTime;
}

- (void)sendEvent
{
  if (self->_hasRecognizedAnything
    && self->_recognitionEndTime > 0.0
    && [(NSString *)self->_applicationName isEqualToString:@"com.apple.MobileSMS"])
  {
    v3 = objc_opt_new();
    if (v3)
    {
      id v4 = [objc_alloc((Class)BMSiriDictationEvent) initWithAbsoluteTimestamp:self->_recognitionEndTime];
      v5 = [v3 source];
      [v5 sendEvent:v4];

      v6 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315138;
        v8 = "-[ESBiomeRecord sendEvent]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Biome Dictation: event is sent to Biome", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

@end