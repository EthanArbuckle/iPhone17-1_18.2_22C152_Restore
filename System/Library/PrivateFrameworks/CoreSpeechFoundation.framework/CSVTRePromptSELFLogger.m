@interface CSVTRePromptSELFLogger
+ (NSUUID)voiceTriggerRePromptIsolatedStreamID;
+ (id)sharedLogger;
+ (void)initialize;
- (void)logRePromptFinishedWithSiriSpeechID:(id)a3 withRePromptDate:(id)a4 withIsRePrompted:(BOOL)a5 withLocale:(id)a6;
@end

@implementation CSVTRePromptSELFLogger

- (void)logRePromptFinishedWithSiriSpeechID:(id)a3 withRePromptDate:(id)a4 withIsRePrompted:(BOOL)a5 withLocale:(id)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = SSRLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SSRLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v20 = "-[CSVTRePromptSELFLogger logRePromptFinishedWithSiriSpeechID:withRePromptDate:withIsRePrompted:withLocale:]";
    v13 = @"NO";
    int v19 = 136316162;
    if (v7) {
      v13 = @"YES";
    }
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    v26 = v13;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s RePrompt SELF Log for siri speech ID %@, repromptDate %@, isRePrompted %@, locale %@", (uint8_t *)&v19, 0x34u);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4FA0940]);
  [v14 setSiriSpeechID:v9];
  [v14 setIsRePrompted:v7];
  [v14 setLastWhenRePrompted:v10];
  id v15 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  [v15 setVoiceTriggerRePrompted:v14];
  v16 = [MEMORY[0x1E4F9F9B0] sharedAnalytics];
  v17 = [v16 defaultMessageStream];
  v18 = +[CSVTRePromptSELFLogger voiceTriggerRePromptIsolatedStreamID];
  [v17 emitMessage:v15 isolatedStreamUUID:v18];
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_6085 != -1) {
    dispatch_once(&sharedLogger_onceToken_6085, &__block_literal_global_6086);
  }
  v2 = (void *)sharedLogger_shared;
  return v2;
}

uint64_t __38__CSVTRePromptSELFLogger_sharedLogger__block_invoke()
{
  sharedLogger_shared = objc_alloc_init(CSVTRePromptSELFLogger);
  return MEMORY[0x1F41817F8]();
}

+ (NSUUID)voiceTriggerRePromptIsolatedStreamID
{
  return (NSUUID *)(id)_voiceTriggerRePromptIsolatedStreamID;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _voiceTriggerRePromptIsolatedStreamID = [MEMORY[0x1E4F29128] UUID];
    MEMORY[0x1F41817F8]();
  }
}

@end