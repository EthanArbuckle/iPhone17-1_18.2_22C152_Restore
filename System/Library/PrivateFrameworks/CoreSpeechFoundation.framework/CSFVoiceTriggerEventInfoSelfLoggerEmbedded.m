@interface CSFVoiceTriggerEventInfoSelfLoggerEmbedded
+ (double)_round:(double)a3 withPlaces:(int)a4;
+ (id)_convertToFirstPassChannelSelectionScores:(id)a3;
+ (id)_convertToSELFVTEI:(id)a3;
+ (id)_getStartedMessageWithFirstPassInfo:(id)a3;
+ (id)sanitizeEventInfoForLogging:(id)a3;
+ (int)_convertJarvisTriggerModeString:(id)a3;
+ (int)_convertPowerState:(unsigned int)a3;
+ (int)_convertToFirstPassSource:(id)a3;
+ (int)_convertToMatchResult:(unsigned int)a3;
+ (int)_convertToSELFRejectedReason:(unint64_t)a3;
+ (int)_convertToTwoShotPromptType:(int64_t)a3;
+ (void)_emitTwoShotClientEventWithTwoShotTransitionContext:(id)a3 withMHUUID:(id)a4;
+ (void)_emitVTClientEventWithVTContext:(id)a3 withMHUUID:(id)a4;
- (CSFVoiceTriggerEventInfoSelfLoggerEmbedded)init;
- (void)logCancelledEventWithMHUUID:(id)a3;
- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5;
- (void)logSiriLaunchCompletedWithVoiceTriggerEventInfo:(id)a3;
- (void)logSiriLaunchStartedWithVoiceTriggerEventInfo:(id)a3;
- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4;
- (void)logTriggerEventWithVTEI:(id)a3 withMHUUID:(id)a4;
- (void)logTwoShotDetectedWithMHUUID:(id)a3;
- (void)logTwoShotEndEventWithSuppresedAlert:(BOOL)a3 withTimedOut:(BOOL)a4 withMHUUID:(id)a5;
- (void)logTwoShotStartEventWithPromptType:(unsigned int)a3 withMHUUID:(id)a4;
@end

@implementation CSFVoiceTriggerEventInfoSelfLoggerEmbedded

- (void)logSiriLaunchCompletedWithVoiceTriggerEventInfo:(id)a3
{
  id v10 = [a3 objectForKeyedSubscript:@"selfLoggingMHUUID"];
  if (v10)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0890]);
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v3];
    [v4 setMhId:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4FA08F8]);
    [v6 setExists:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4FA08F0]);
    [v7 setEnded:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
    [v8 setEventMetadata:v4];
    [v8 setSiriLaunchRequestContext:v7];
    v9 = [MEMORY[0x1E4F9F9B0] sharedStream];
    [v9 emitMessage:v8];
  }
}

- (void)logSiriLaunchStartedWithVoiceTriggerEventInfo:(id)a3
{
  id v10 = [a3 objectForKeyedSubscript:@"selfLoggingMHUUID"];
  if (v10)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0890]);
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v3];
    [v4 setMhId:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4FA0900]);
    [v6 setExists:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4FA08F0]);
    [v7 setStartedOrChanged:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
    [v8 setEventMetadata:v4];
    [v8 setSiriLaunchRequestContext:v7];
    v9 = [MEMORY[0x1E4F9F9B0] sharedStream];
    [v9 emitMessage:v8];
  }
}

- (void)logTriggerEventWithVTEI:(id)a3 withMHUUID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0968]);
    id v8 = +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToSELFVTEI:v5];
    [v7 setVoiceTriggerEventInfo:v8];
    id v9 = objc_alloc_init(MEMORY[0x1E4FA0930]);
    [v9 setEnded:v7];
    [v9 setHasEnded:1];
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:v9 withMHUUID:v6];
  }
  else
  {
    id v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      v12 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logTriggerEventWithVTEI:withMHUUID:]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v11, 0xCu);
    }
    id v7 = +[CSDiagnosticReporter sharedInstance];
    [v7 submitSELFIssueReport:@"mhVoiceTriggerContextMhIdMissing"];
  }
}

- (void)logCancelledEventWithMHUUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA0950]);
    id v5 = objc_alloc_init(MEMORY[0x1E4FA0930]);
    [v5 setCancelled:v4];
    [v5 setHasCancelled:1];
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:v5 withMHUUID:v3];
  }
  else
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logCancelledEventWithMHUUID:]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v7, 0xCu);
    }
    id v4 = +[CSDiagnosticReporter sharedInstance];
    [v4 submitSELFIssueReport:@"mhVoiceTriggerContextMhIdMissing"];
  }
}

- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FA0958]);
    id v10 = +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded sanitizeEventInfoForLogging:v7];
    int v11 = +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToSELFVTEI:v10];
    [v9 setVoiceTriggerEventInfo:v11];
    objc_msgSend(v9, "setReason:", +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToSELFRejectedReason:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_convertToSELFRejectedReason:", a5));
    id v12 = objc_alloc_init(MEMORY[0x1E4FA0930]);
    [v12 setFailed:v9];
    [v12 setHasFailed:1];
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:v12 withMHUUID:v8];
  }
  else
  {
    uint64_t v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logRejectEventWithVTEI:withMHUUID:withSecondPassResult:]";
      _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v14, 0xCu);
    }
    id v9 = +[CSDiagnosticReporter sharedInstance];
    [v9 submitSELFIssueReport:@"mhVoiceTriggerContextMhIdMissing"];
  }
}

- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded sanitizeEventInfoForLogging:v5];
    id v8 = +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _getStartedMessageWithFirstPassInfo:v7];
    id v9 = objc_alloc_init(MEMORY[0x1E4FA0930]);
    [v9 setStartedOrChanged:v8];
    [v9 setHasStartedOrChanged:1];
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:v9 withMHUUID:v6];
  }
  else
  {
    id v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logStartEventWithFirstPassStartedInfo:withMHUUID:]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v11, 0xCu);
    }
    id v7 = +[CSDiagnosticReporter sharedInstance];
    [v7 submitSELFIssueReport:@"mhVoiceTriggerContextMhIdMissing"];
  }
}

- (void)logTwoShotStartEventWithPromptType:(unsigned int)a3 withMHUUID:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FA0858];
  id v6 = a4;
  id v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setPromptType:", +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToTwoShotPromptType:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_convertToTwoShotPromptType:", a3));
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0848]);
  [v7 setStartedOrChanged:v8];
  [v7 setHasStartedOrChanged:1];
  +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitTwoShotClientEventWithTwoShotTransitionContext:v7 withMHUUID:v6];
}

- (void)logTwoShotEndEventWithSuppresedAlert:(BOOL)a3 withTimedOut:(BOOL)a4 withMHUUID:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4FA0850];
  id v8 = a5;
  id v10 = objc_alloc_init(v7);
  [v10 setSuppresedAlert:v6];
  [v10 setTimedOut:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0848]);
  [v9 setEnded:v10];
  [v9 setHasEnded:1];
  +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitTwoShotClientEventWithTwoShotTransitionContext:v9 withMHUUID:v8];
}

- (void)logTwoShotDetectedWithMHUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FA0970];
  id v4 = a3;
  id v9 = objc_alloc_init(v3);
  [v9 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v4];

  [v6 setMhId:v7];
  [v5 setEventMetadata:v6];
  [v5 setVoiceTriggerTwoShotDetected:v9];
  id v8 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v8 emitMessage:v5];
}

- (CSFVoiceTriggerEventInfoSelfLoggerEmbedded)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSFVoiceTriggerEventInfoSelfLoggerEmbedded;
    self = [(CSFVoiceTriggerEventInfoSelfLoggerEmbedded *)&v5 init];
    id v3 = self;
  }

  return v3;
}

+ (void)_emitVTClientEventWithVTContext:(id)a3 withMHUUID:(id)a4
{
  objc_super v5 = (objc_class *)MEMORY[0x1E4FA0888];
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_alloc_init(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v8 setMhId:v9];
  [v11 setEventMetadata:v8];
  [v11 setVoiceTriggerContext:v7];

  id v10 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v10 emitMessage:v11];
}

+ (void)_emitTwoShotClientEventWithTwoShotTransitionContext:(id)a3 withMHUUID:(id)a4
{
  objc_super v5 = (objc_class *)MEMORY[0x1E4FA0888];
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_alloc_init(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v8 setMhId:v9];
  [v11 setEventMetadata:v8];
  [v11 setAssistantDaemonAudioTwoShotTransitionContext:v7];

  id v10 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v10 emitMessage:v11];
}

+ (id)_getStartedMessageWithFirstPassInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0960]);
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"firstPassDetectedChannel"];
    objc_msgSend(v5, "setFirstPassDetectedChannel:", objc_msgSend(v6, "intValue"));

    id v7 = [v4 objectForKeyedSubscript:@"firstPassScore"];
    [v7 floatValue];
    objc_msgSend(v5, "setFirstPassScore:");

    id v8 = [v4 objectForKeyedSubscript:@"firstPassOnsetChannel"];
    objc_msgSend(v5, "setFirstPassOnsetChannel:", objc_msgSend(v8, "intValue"));

    id v9 = [v4 objectForKeyedSubscript:@"firstPassOnsetScore"];
    [v9 floatValue];
    objc_msgSend(v5, "setFirstPassOnsetScore:");

    id v10 = [v4 objectForKeyedSubscript:@"firstPassChannelSelectionScores"];
    id v11 = [a1 _convertToFirstPassChannelSelectionScores:v10];

    [v5 setChannelSelectionScores:v11];
    id v12 = [v4 objectForKeyedSubscript:@"firstPassChannelSelectionDelaySeconds"];
    [v12 floatValue];
    objc_msgSend(v5, "setFirstPassChannelSelectionDelayNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

    uint64_t v13 = [v4 objectForKeyedSubscript:@"firstPassMasterChannelScoreBoost"];
    [v13 floatValue];
    objc_msgSend(v5, "setFirstPassPrimaryChannelScoreBoost:");

    int v14 = [v4 objectForKeyedSubscript:@"firstPassStartSampleCount"];
    objc_msgSend(v5, "setFirstPassStartSampleCount:", (int)objc_msgSend(v14, "intValue"));

    v15 = [v4 objectForKeyedSubscript:@"firstPassEndSampleCount"];
    objc_msgSend(v5, "setFirstPassEndSampleCount:", (int)objc_msgSend(v15, "intValue"));

    uint64_t v16 = [v4 objectForKeyedSubscript:@"firstPassFireSampleCount"];
    objc_msgSend(v5, "setFirstPassFireSampleCount:", (int)objc_msgSend(v16, "intValue"));

    v17 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
    objc_msgSend(v5, "setFirstPassTriggerSource:", objc_msgSend(a1, "_convertToFirstPassSource:", v17));

    v18 = [v4 objectForKeyedSubscript:@"earlyDetectFiredTime"];
    [v18 floatValue];
    objc_msgSend(v5, "setEarlyDetectFiredTime:");

    v19 = [v4 objectForKeyedSubscript:@"earlyDetectFiredMachTime"];
    uint64_t v20 = (int)[v19 intValue];
    v21 = [v4 objectForKeyedSubscript:@"earlyDetectFiredTime"];
    [v21 floatValue];
    objc_msgSend(v5, "setEarlyDetectFiredTimeOffsetInNs:", v20 - +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

    v22 = [v4 objectForKey:@"firstPassInfoGeneratedTime"];

    if (v22)
    {
      v23 = [v4 objectForKeyedSubscript:@"firstPassInfoGeneratedTime"];
      objc_msgSend(v5, "setFirstPassInfoDispatchTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", objc_msgSend(v23, "unsignedLongLongValue")));

      v24 = [v4 objectForKeyedSubscript:@"firstPassInfoProcessedTime"];
      objc_msgSend(v5, "setFirstPassInfoReceptionTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", objc_msgSend(v24, "unsignedLongLongValue")));
    }
  }

  return v5;
}

+ (id)_convertToFirstPassChannelSelectionScores:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_alloc_init(MEMORY[0x1E4FA06C0]);
        objc_msgSend(v11, "setChannelString:", v10, (void)v14);
        id v12 = [v5 objectForKey:v10];
        [v12 floatValue];
        objc_msgSend(v11, "setFirstPassScore:");

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (int)_convertToTwoShotPromptType:(int64_t)a3
{
  if ((unint64_t)a3 < 3) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)_convertToFirstPassSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ApplicationProcessor"])
  {
    int v4 = 2;
  }
  else if (([v3 isEqualToString:@"ApplicationProcessorWithRingtone"] & 1) != 0 {
         || ([v3 isEqualToString:@"ApplicationProcessorWithConnectedCall"] & 1) != 0)
  }
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BuiltInAlwaysOnProcessor"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Hearst"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Jarvis"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Remora"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HearstAP"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Watch"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Darwin"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = [v3 isEqualToString:@"Default"];
  }

  return v4;
}

+ (int)_convertToSELFRejectedReason:(unint64_t)a3
{
  if (a3 > 0xB) {
    return 1;
  }
  else {
    return dword_1BA25EA08[a3];
  }
}

+ (int)_convertToMatchResult:(unsigned int)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)_convertJarvisTriggerModeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VoiceActivityDetection"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VoiceTriggerDetection"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)_convertPowerState:(unsigned int)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (id)_convertToSELFVTEI:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0938]);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"secondPassAnalyerStartSampleCount"];
  objc_msgSend(v5, "setSecondPassAnalyerStartSampleCount:", (int)objc_msgSend(v6, "intValue"));

  uint64_t v7 = [v4 objectForKeyedSubscript:@"secondPassAnalyerEndSampleCount"];
  objc_msgSend(v5, "setSecondPassAnalyerEndSampleCount:", (int)objc_msgSend(v7, "intValue"));

  uint64_t v8 = [v4 objectForKeyedSubscript:@"satScore"];
  [v8 floatValue];
  objc_msgSend(v5, "setSatScore:");

  id v9 = [v4 objectForKeyedSubscript:@"satNumTrainingUtts"];
  objc_msgSend(v5, "setSatNumTrainingUtterances:", objc_msgSend(v9, "intValue"));

  uint64_t v10 = [v4 objectForKeyedSubscript:@"satThreshold"];
  [v10 floatValue];
  objc_msgSend(v5, "setSatThreshold:");

  id v11 = [v4 objectForKeyedSubscript:@"satTriggered"];
  objc_msgSend(v5, "setSatTriggered:", objc_msgSend(v11, "BOOLValue"));

  id v12 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerScore"];
  [v12 floatValue];
  objc_msgSend(v5, "setTdSpeakerRecognizerScore:");

  uint64_t v13 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];
  [v13 floatValue];
  objc_msgSend(v5, "setTdSpeakerRecognizerCombinedScore:");

  long long v14 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedThreshold"];
  [v14 floatValue];
  objc_msgSend(v5, "setTdSpeakerRecognizerCombinedThreshold:");

  long long v15 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinationWeight"];
  [v15 floatValue];
  objc_msgSend(v5, "setTdSpeakerRecognizerCombinationWeight:");

  long long v16 = [v4 objectForKeyedSubscript:@"biometricClue"];
  objc_msgSend(v5, "setBiometricClue:", objc_msgSend(a1, "_convertToMatchResult:", objc_msgSend(v16, "intValue")));

  long long v17 = [v4 objectForKeyedSubscript:@"satBeingTrained"];
  objc_msgSend(v5, "setSatBeingTrained:", objc_msgSend(v17, "BOOLValue"));

  v18 = [v4 objectForKeyedSubscript:@"lastConsecutivePHSRejects"];
  objc_msgSend(v5, "setLastConsecutivePHSRejects:", objc_msgSend(v18, "intValue"));

  uint64_t v19 = [v4 objectForKeyedSubscript:@"deltaTimeFromlastPHSReject"];
  [v19 floatValue];
  objc_msgSend(v5, "setDeltaTimeInNsFromlastPHSReject:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  uint64_t v20 = [v4 objectForKeyedSubscript:@"triggerExplicitSatScore"];
  [v20 floatValue];
  objc_msgSend(v5, "setTriggerExplicitSatScore:");

  v21 = [v4 objectForKeyedSubscript:@"triggerExplicitTDSRSatScore"];
  [v21 floatValue];
  objc_msgSend(v5, "setTriggerExplicitTDSRSatScore:");

  v22 = [v4 objectForKeyedSubscript:@"shadowMicScore"];
  [v22 floatValue];
  objc_msgSend(v5, "setShadowMicScore:");

  v23 = [v4 objectForKeyedSubscript:@"shadowMicScoreThresholdForVAD"];
  [v23 floatValue];
  objc_msgSend(v5, "setShadowMicScoreThresholdForVAD:");

  v24 = [v4 objectForKeyedSubscript:@"remoteMicVADScore"];
  [v24 floatValue];
  objc_msgSend(v5, "setRemoteMicVADScore:");

  v25 = [v4 objectForKeyedSubscript:@"remoteMicVADThreshold"];
  [v25 floatValue];
  objc_msgSend(v5, "setRemoteMicVADThreshold:");

  v26 = [v4 objectForKeyedSubscript:@"remoteMicVADMyriadThreshold"];
  [v26 floatValue];
  objc_msgSend(v5, "setRemoteMicVADMyriadThreshold:");

  v27 = [v4 objectForKeyedSubscript:@"firstPassJarvisTriggerMode"];
  objc_msgSend(v5, "setEnhancedCarplayTriggerMode:", objc_msgSend(a1, "_convertJarvisTriggerModeString:", v27));

  v28 = [v4 objectForKeyedSubscript:@"triggerStartSampleCount"];
  objc_msgSend(v5, "setTriggerStartSampleCount:", (int)objc_msgSend(v28, "intValue"));

  v29 = [v4 objectForKeyedSubscript:@"clientStartSampleCount"];
  objc_msgSend(v5, "setClientStartSampleCount:", (int)objc_msgSend(v29, "intValue"));

  v30 = [v4 objectForKeyedSubscript:@"triggerEndSampleCount"];
  objc_msgSend(v5, "setTriggerEndSampleCount:", (int)objc_msgSend(v30, "intValue"));

  v31 = [v4 objectForKeyedSubscript:@"triggerFireSampleCount"];
  objc_msgSend(v5, "setTriggerFireSampleCount:", (int)objc_msgSend(v31, "intValue"));

  v32 = [v4 objectForKeyedSubscript:@"triggerStartSeconds"];
  [v32 floatValue];
  objc_msgSend(v5, "setTriggerStartNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  v33 = [v4 objectForKeyedSubscript:@"triggerEndSeconds"];
  [v33 floatValue];
  objc_msgSend(v5, "setTriggerEndNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  v34 = [v4 objectForKeyedSubscript:@"triggerFireSeconds"];
  [v34 floatValue];
  objc_msgSend(v5, "setTriggerFireNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  v35 = [v4 objectForKeyedSubscript:@"extraSamplesAtStart"];
  objc_msgSend(v5, "setExtraSamplesAtStart:", (int)objc_msgSend(v35, "intValue"));

  v36 = [v4 objectForKeyedSubscript:@"analyzerPrependingSamples"];
  objc_msgSend(v5, "setAnalyzerPrependingSamples:", (int)objc_msgSend(v36, "intValue"));

  v37 = [v4 objectForKeyedSubscript:@"analyzerTrailingSamples"];
  objc_msgSend(v5, "setAnalyzerTrailingSamples:", (int)objc_msgSend(v37, "intValue"));

  v38 = [v4 objectForKeyedSubscript:@"isTriggerEvent"];
  objc_msgSend(v5, "setIsTriggerEvent:", objc_msgSend(v38, "BOOLValue"));

  v39 = [v4 objectForKeyedSubscript:@"totalSampleCount"];
  objc_msgSend(v5, "setTotalSampleCount:", (int)objc_msgSend(v39, "intValue"));

  v40 = [v4 objectForKeyedSubscript:@"triggerScore"];
  [v40 floatValue];
  objc_msgSend(v5, "setTriggerScore:");

  v41 = [v4 objectForKeyedSubscript:@"isMaximized"];
  objc_msgSend(v5, "setIsMaximized:", objc_msgSend(v41, "BOOLValue"));

  v42 = [v4 objectForKeyedSubscript:@"effectiveThreshold"];
  [v42 floatValue];
  objc_msgSend(v5, "setEffectiveThreshold:");

  v43 = [v4 objectForKeyedSubscript:@"recognizerScore"];
  [v43 floatValue];
  objc_msgSend(v5, "setRecognizerScore:");

  v44 = [v4 objectForKeyedSubscript:@"recognizerThresholdOffset"];
  [v44 floatValue];
  objc_msgSend(v5, "setRecognizerThresholdOffset:");

  v45 = [v4 objectForKeyedSubscript:@"recognizerWaitTime"];
  [v45 floatValue];
  objc_msgSend(v5, "setRecognizerWaitTimeInNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  v46 = [v4 objectForKeyedSubscript:@"recognizerScaleFactor"];
  [v46 floatValue];
  objc_msgSend(v5, "setRecognizerScaleFactor:");

  v47 = [v4 objectForKeyedSubscript:@"threshold"];
  [v47 floatValue];
  objc_msgSend(v5, "setThreshold:");

  v48 = [v4 objectForKeyedSubscript:@"triggeredPhrase"];
  [v5 setTriggerPhrase:v48];

  uint64_t v49 = mach_absolute_time();
  v50 = [v4 objectForKeyedSubscript:@"triggerStartMachTime"];
  unint64_t v51 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - [v50 unsignedLongLongValue]);

  v52 = [v4 objectForKeyedSubscript:@"triggerEndMachTime"];
  unint64_t v53 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - [v52 unsignedLongLongValue]);

  v54 = [v4 objectForKeyedSubscript:@"triggerFireMachTime"];
  unint64_t v55 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - [v54 unsignedLongLongValue]);

  v56 = [v4 objectForKey:@"displayWakeMachTime"];

  if (v56)
  {
    id v108 = a1;
    v57 = [v4 objectForKey:@"extraSamplesAtStart"];

    unint64_t v58 = v51;
    if (v57)
    {
      v59 = [v4 objectForKeyedSubscript:@"extraSamplesAtStart"];
      uint64_t v60 = (int)[v59 intValue];

      +[CSConfig inputRecordingSampleRate];
      unint64_t v58 = v51
          - +[CSFTimeUtils convertSampleCountToNs:sampleRate:](CSFTimeUtils, "convertSampleCountToNs:sampleRate:", v60);
    }
    v61 = [v4 objectForKeyedSubscript:@"displayWakeMachTime"];
    unint64_t v62 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - [v61 unsignedLongLongValue]);

    [v5 setIsHSJSTriggerFromAlwaysOnMicBuffer:v58 > v62];
    [v5 setDisplayWakeTimeOffsetInNs:v62];
    a1 = v108;
  }
  [v5 setTriggerStartTimeOffsetInNs:v51];
  [v5 setTriggerEndTimeOffsetInNs:v53];
  [v5 setTriggerFireTimeOffsetInNs:v55];
  v63 = [v4 objectForKeyedSubscript:@"triggerStartTime"];
  [v63 doubleValue];
  objc_msgSend(v5, "setTriggerStartTime:");

  v64 = [v4 objectForKeyedSubscript:@"triggerEndTime"];
  [v64 doubleValue];
  objc_msgSend(v5, "setTriggerEndTime:");

  v65 = [v4 objectForKeyedSubscript:@"triggerFiredTime"];
  [v65 doubleValue];
  objc_msgSend(v5, "setTriggerFiredTime:");

  v66 = [v4 objectForKeyedSubscript:@"hardwareSamplerate"];
  objc_msgSend(v5, "setHardwareSamplerate:", objc_msgSend(v66, "intValue"));

  v67 = [v4 objectForKeyedSubscript:@"isContinuous"];
  objc_msgSend(v5, "setIsContinuous:", objc_msgSend(v67, "BOOLValue"));

  v68 = [v4 objectForKeyedSubscript:@"triggerDuration"];
  [v68 floatValue];
  *(float *)&double v69 = (float)+[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:");
  [v5 setTriggerDurationInNs:v69];

  v70 = [v4 objectForKeyedSubscript:@"totalSamplesAtTriggerStart"];
  objc_msgSend(v5, "setTotalSamplesAtTriggerStart:", (int)objc_msgSend(v70, "intValue"));

  v71 = [v4 objectForKeyedSubscript:@"totalSamplesAtTriggerEnd"];
  objc_msgSend(v5, "setTotalSamplesAtTriggerEnd:", (int)objc_msgSend(v71, "intValue"));

  v72 = [v4 objectForKeyedSubscript:@"totalSamplesAtEndOfCapture"];
  objc_msgSend(v5, "setTotalSamplesAtEndOfCapture:", (int)objc_msgSend(v72, "intValue"));

  v73 = [v4 objectForKeyedSubscript:@"configVersion"];
  [v5 setConfigVersion:v73];

  v74 = [v4 objectForKeyedSubscript:@"configPath"];
  [v5 setConfigPath:v74];

  v75 = [v4 objectForKeyedSubscript:@"isSecondChance"];
  objc_msgSend(v5, "setIsSecondChance:", objc_msgSend(v75, "BOOLValue"));

  v76 = [v4 objectForKeyedSubscript:@"deviceHandHeld"];
  objc_msgSend(v5, "setDeviceHandheld:", objc_msgSend(v76, "BOOLValue"));

  v77 = [v4 objectForKeyedSubscript:@"activeChannel"];
  objc_msgSend(v5, "setActiveChannel:", objc_msgSend(v77, "intValue"));

  v78 = [v4 objectForKeyedSubscript:@"twoShotAudibleFeedbackDelay"];
  [v78 floatValue];
  objc_msgSend(v5, "setTwoShotAudibleFeedbackDelayInNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  v79 = [v4 objectForKeyedSubscript:@"cumulativeUptime"];
  [v79 floatValue];
  objc_msgSend(v5, "setCumulativeUptimeInSec:");

  v80 = [v4 objectForKeyedSubscript:@"cumulativeDowntime"];
  [v80 floatValue];
  objc_msgSend(v5, "setCumulativeDowntimeInSec:");

  v81 = [v4 objectForKeyedSubscript:@"hostPowerStateAtTrigger"];
  objc_msgSend(v5, "setHostPowerStateAtTrigger:", objc_msgSend(a1, "_convertPowerState:", objc_msgSend(v81, "intValue")));

  v82 = [v4 objectForKeyedSubscript:@"isMediaPlaying"];
  objc_msgSend(v5, "setIsMediaPlaying:", objc_msgSend(v82, "BOOLValue"));

  v83 = [v4 objectForKeyedSubscript:@"mediaVolume"];
  [v83 floatValue];
  objc_msgSend(v5, "setMediaVolume:");

  id v84 = objc_alloc(MEMORY[0x1E4F29128]);
  v85 = [v4 objectForKeyedSubscript:@"audioProviderUUID"];
  v86 = (void *)[v84 initWithUUIDString:v85];

  v87 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v86];
  [v5 setAudioProviderUUID:v87];

  v88 = [v4 objectForKeyedSubscript:@"onBatteryPower"];
  objc_msgSend(v5, "setOnBatteryPower:", objc_msgSend(v88, "BOOLValue"));

  v89 = [v4 objectForKeyedSubscript:@"didWakeAP"];
  objc_msgSend(v5, "setDidWakeAP:", objc_msgSend(v89, "BOOLValue"));

  v90 = [v4 objectForKeyedSubscript:@"uptime"];
  [v90 floatValue];
  objc_msgSend(v5, "setUptimeInSec:");

  v91 = [v4 objectForKeyedSubscript:@"downtime"];
  [v91 floatValue];
  objc_msgSend(v5, "setDowntimeInSec:");

  v92 = [v4 objectForKeyedSubscript:@"lastConsecutiveVTRejects"];
  objc_msgSend(v5, "setLastConsecutiveVTRejects:", objc_msgSend(v92, "intValue"));

  v93 = [v4 objectForKeyedSubscript:@"captureFilePath"];
  [v5 setCaptureFilePath:v93];

  v94 = [v4 objectForKeyedSubscript:@"configDataHash"];
  [v5 setConfigDataHash:v94];

  v95 = [v4 objectForKeyedSubscript:@"siriIsActiveOrOtherAssertion"];
  objc_msgSend(v5, "setSiriIsActiveOrOtherAssertion:", objc_msgSend(v95, "BOOLValue"));

  v96 = [v4 objectForKeyedSubscript:@"DarwinVoiceTriggeredWhenHostInSleep"];
  objc_msgSend(v5, "setIsWakeFromSleep:", objc_msgSend(v96, "BOOLValue"));

  v97 = [v4 objectForKey:@"secondPassAssetQueryStartTime"];
  objc_msgSend(v5, "setSecondPassAssetQueryStartTimeInNs:", objc_msgSend(v97, "unsignedLongLongValue"));

  v98 = [v4 objectForKey:@"secondPassAssetQueryCompleteTime"];
  objc_msgSend(v5, "setSecondPassAssetQueryCompleteTimeInNs:", objc_msgSend(v98, "unsignedLongLongValue"));

  v99 = [v4 objectForKey:@"secondPassAssetLoadStartTime"];
  objc_msgSend(v5, "setSecondPassAssetLoadStartTimeInNs:", objc_msgSend(v99, "unsignedLongLongValue"));

  v100 = [v4 objectForKey:@"secondPassAssetLoadCompleteTime"];
  objc_msgSend(v5, "setSecondPassAssetLoadCompleteTimeInNs:", objc_msgSend(v100, "unsignedLongLongValue"));

  v101 = [v4 objectForKey:@"secondPassAudioStreamStartTime"];
  objc_msgSend(v5, "setSecondPassAudioStreamStartTimeInNs:", objc_msgSend(v101, "unsignedLongLongValue"));

  v102 = [v4 objectForKey:@"secondPassAudioStreamReadyTime"];
  objc_msgSend(v5, "setSecondPassAudioStreamReadyTimeInNs:", objc_msgSend(v102, "unsignedLongLongValue"));

  v103 = [v4 objectForKey:@"secondPassFirstAudioPacketReceptionTime"];
  objc_msgSend(v5, "setSecondPassFirstAudioPacketReceptionTimeInNs:", objc_msgSend(v103, "unsignedLongLongValue"));

  v104 = [v4 objectForKey:@"secondPassLastAudioPacketReceptionTime"];
  objc_msgSend(v5, "setSecondPassLastAudioPacketReceptionTimeInNs:", objc_msgSend(v104, "unsignedLongLongValue"));

  v105 = [v4 objectForKey:@"secondPassCheckerModelKeywordDetectionStartTime"];
  objc_msgSend(v5, "setSecondPassCheckerModelKeywordDetectionStartTimeInNs:", objc_msgSend(v105, "unsignedLongLongValue"));

  v106 = [v4 objectForKey:@"secondPassCheckerModelKeywordDetectionEndTime"];
  objc_msgSend(v5, "setSecondPassCheckerModelKeywordDetectionEndTimeInNs:", objc_msgSend(v106, "unsignedLongLongValue"));

  return v5;
}

+ (double)_round:(double)a3 withPlaces:(int)a4
{
  double v5 = __exp10((double)a4);
  return round(v5 * a3) / v5;
}

+ (id)sanitizeEventInfoForLogging:(id)a3
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0xBFF0000000000000;
    double v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = @"triggerStartTime";
    v20[1] = @"triggerEndTime";
    v20[2] = @"earlyDetectFiredTime";
    v20[3] = @"triggerFiredTime";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
    uint64_t v8 = [v6 setWithArray:v7];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__CSFVoiceTriggerEventInfoSelfLoggerEmbedded_sanitizeEventInfoForLogging___block_invoke;
    v14[3] = &unk_1E62007C0;
    id v9 = v8;
    id v15 = v9;
    long long v17 = v19;
    id v10 = v5;
    id v16 = v10;
    id v18 = a1;
    [v4 enumerateKeysAndObjectsUsingBlock:v14];
    id v11 = v16;
    id v12 = v10;

    _Block_object_dispose(v19, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __74__CSFVoiceTriggerEventInfoSelfLoggerEmbedded_sanitizeEventInfoForLogging___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v15]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    uint64_t v7 = v6;
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v8 < 0.0)
    {
      [v6 doubleValue];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9 + -10.0;
      double v8 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    id v10 = *(void **)(a1 + 40);
    id v11 = NSNumber;
    id v12 = *(void **)(a1 + 56);
    [v7 doubleValue];
    [v12 _round:2 withPlaces:v13 - v8];
    long long v14 = objc_msgSend(v11, "numberWithDouble:");
    [v10 setObject:v14 forKey:v15];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v5 forKey:v15];
  }
}

@end