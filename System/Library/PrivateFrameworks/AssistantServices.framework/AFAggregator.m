@interface AFAggregator
+ (id)_fullAggDKeyWithPrefix:(id)a3 error:(id)a4;
+ (id)_stringForGatekeeperType:(unint64_t)a3;
+ (void)logCDMAssetEvictedForAssetType:(id)a3 language:(id)a4;
+ (void)logCreateAssistant;
+ (void)logDESEvaluationForLanguage:(id)a3 error:(id)a4;
+ (void)logDESRecordingForLanguage:(id)a3 error:(id)a4;
+ (void)logDictationCancelled;
+ (void)logDictationFailedWithError:(id)a3;
+ (void)logDictationFollowedByContinueOccurredForLanguage:(id)a3;
+ (void)logDictationFollowedByKeyboardDeleteOccurredForLanguage:(id)a3;
+ (void)logDictationFollowedByKeyboardInputOccurredForLanguage:(id)a3;
+ (void)logDictationStarted;
+ (void)logDictationSucceeded;
+ (void)logEnabledState:(unint64_t)a3;
+ (void)logHomeButtonPressToActivationDuration:(double)a3;
+ (void)logKeyboardInputFollowedByContinueOccurredForLanguage:(id)a3;
+ (void)logLoadAssistant;
+ (void)logLocalFinalSpeechRecognitionWithDuration:(double)a3;
+ (void)logLocalRecognitionAssetEvictedForLanguage:(id)a3;
+ (void)logLocalRecognitionLoadedForLanguage:(id)a3 duration:(double)a4;
+ (void)logLocalRecognitionLostForLanguage:(id)a3;
+ (void)logLocalRecognitionWonForLanguage:(id)a3;
+ (void)logLocalSpeechStartedWithDuration:(double)a3;
+ (void)logPingTimeout;
+ (void)logRequestCancelAfterSeconds:(double)a3;
+ (void)logRequestCompletedWithDuration:(double)a3;
+ (void)logRequestLaunchedApp;
+ (void)logSiriInvokedVia:(int64_t)a3;
+ (void)logSiriMediaVolumeAction:(int64_t)a3;
+ (void)logSiriOtherRequestStarted;
+ (void)logSiriPausedMedia;
+ (void)logSiriQuickStopAction:(unint64_t)a3;
+ (void)logSiriRequestCancelled;
+ (void)logSiriRequestFailedWithError:(id)a3;
+ (void)logSiriRequestSucceeded;
+ (void)logSiriSpeechRequestStarted;
+ (void)logStarkGatekeeperAppearedForType:(unint64_t)a3;
+ (void)logStarkGatekeeperDismissedManuallyForType:(unint64_t)a3;
+ (void)logTimeToBeepWithDuration:(double)a3;
+ (void)logUILockCanceledVTActivation;
+ (void)missedAlertContextForRequest;
+ (void)missedAppContextForRequest;
- (BOOL)hasActiveRequest;
- (unint64_t)connectionType;
- (void)beginSessionRetryPreferringWWAN:(BOOL)a3;
- (void)connectionDidDrop;
- (void)connectionDidFail;
- (void)recordFailure:(int)a3 forConnectionType:(unint64_t)a4;
- (void)recordSessionRetrySuccess;
- (void)recordSuccessForConnectionType:(unint64_t)a3 isWarm:(BOOL)a4 forTimeInterval:(double)a5;
- (void)setConnectionType:(unint64_t)a3;
- (void)setHasActiveRequest:(BOOL)a3;
- (void)speechResponseReceived;
- (void)startWaitingForSpeechResponse;
@end

@implementation AFAggregator

+ (void)logCDMAssetEvictedForAssetType:(id)a3 language:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "+[AFAggregator logCDMAssetEvictedForAssetType:language:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  v8 = [@"com.apple.siri.CDMAssetEvicted." stringByAppendingFormat:@"%@-%@", v5, v6];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v8, 1);
}

+ (void)logDESEvaluationForLanguage:(id)a3 error:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v8 = v5;
    id v6 = [@"com.apple.siri.DESEvaluation." stringByAppendingString:a3];
    if (v8)
    {
      uint64_t v7 = objc_msgSend(v6, "stringByAppendingFormat:", @".%ld", objc_msgSend(v8, "code"));

      id v6 = (void *)v7;
    }
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

    id v5 = v8;
  }
}

+ (void)logDESRecordingForLanguage:(id)a3 error:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v8 = v5;
    id v6 = [@"com.apple.siri.DESRecording." stringByAppendingString:a3];
    if (v8)
    {
      uint64_t v7 = objc_msgSend(v6, "stringByAppendingFormat:", @".%ld", objc_msgSend(v8, "code"));

      id v6 = (void *)v7;
    }
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

    id v5 = v8;
  }
}

+ (void)logLocalRecognitionLostForLanguage:(id)a3
{
  if (a3)
  {
    objc_msgSend(@"com.apple.siri.LocalRecognitionLost.", "stringByAppendingString:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v3, 1);
  }
}

+ (void)logLocalRecognitionWonForLanguage:(id)a3
{
  if (a3)
  {
    objc_msgSend(@"com.apple.siri.LocalRecognitionWon.", "stringByAppendingString:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v3, 1);
  }
}

+ (void)logLocalRecognitionLoadedForLanguage:(id)a3 duration:(double)a4
{
  if (a3)
  {
    objc_msgSend(@"com.apple.siri.LocalRecognitionLoaded.", "stringByAppendingString:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    _AFAggregatorClientPushValueForDistributionKey((uint64_t)v5, a4);
  }
}

+ (void)logLocalFinalSpeechRecognitionWithDuration:(double)a3
{
}

+ (void)logLocalSpeechStartedWithDuration:(double)a3
{
}

+ (void)logLocalRecognitionAssetEvictedForLanguage:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[AFAggregator logLocalRecognitionAssetEvictedForLanguage:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = [@"com.apple.siri.LocalRecognitionAssetEvicted." stringByAppendingString:v3];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v5, 1);
}

+ (void)logEnabledState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "+[AFAggregator logEnabledState:]";
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %tu", buf, 0x16u);
  }
  if ((a3 & 2) != 0) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v8[0] = @"com.apple.message.siri.enabled";
  v8[1] = @"com.apple.message.dictation.enabled";
  if ((a3 & 4) != 0) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  v9[0] = v5;
  v9[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  AnalyticsSendEvent();
}

+ (void)logPingTimeout
{
}

+ (void)logLoadAssistant
{
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.LoadAssistant", 1);
  AnalyticsSendEvent();
}

+ (void)logCreateAssistant
{
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.CreateAssistant", 1);
  AnalyticsSendEvent();
}

+ (void)logUILockCanceledVTActivation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "+[AFAggregator logUILockCanceledVTActivation]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.VTActivationCancel.UILocked", 1);
}

+ (void)logKeyboardInputFollowedByContinueOccurredForLanguage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "+[AFAggregator logKeyboardInputFollowedByContinueOccurredForLanguage:]";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = @"unknown";
  }
  int v6 = [@"com.apple.siri.KeyboardEntryFollowedByContinue." stringByAppendingString:v5];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);
}

+ (void)logDictationFollowedByKeyboardDeleteOccurredForLanguage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "+[AFAggregator logDictationFollowedByKeyboardDeleteOccurredForLanguage:]";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = @"unknown";
  }
  int v6 = [@"com.apple.siri.DictationFollowedByKeyboardDelete." stringByAppendingString:v5];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);
}

+ (void)logDictationFollowedByKeyboardInputOccurredForLanguage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "+[AFAggregator logDictationFollowedByKeyboardInputOccurredForLanguage:]";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = @"unknown";
  }
  int v6 = [@"com.apple.siri.DictationFollowedByKeyboardEntry." stringByAppendingString:v5];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);
}

+ (void)logDictationFollowedByContinueOccurredForLanguage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "+[AFAggregator logDictationFollowedByContinueOccurredForLanguage:]";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = @"unknown";
  }
  int v6 = [@"com.apple.siri.DictationFollowedByContinue." stringByAppendingString:v5];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);
}

+ (void)logDictationCancelled
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "+[AFAggregator logDictationCancelled]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.DictationCancelled", 1);
}

+ (void)logDictationSucceeded
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "+[AFAggregator logDictationSucceeded]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.DictationSucceeded", 1);
}

+ (void)logDictationFailedWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    __int16 v8 = "+[AFAggregator logDictationFailedWithError:]";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }
  int v6 = [a1 _fullAggDKeyWithPrefix:@"com.apple.siri.DictationFailed." error:v4];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);
}

+ (void)logDictationStarted
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[AFAggregator logDictationStarted]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.DictationStarted", 1);
}

+ (void)logSiriRequestCancelled
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[AFAggregator logSiriRequestCancelled]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.SiriCancelled", 1);
}

+ (void)logSiriRequestSucceeded
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[AFAggregator logSiriRequestSucceeded]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.SiriSucceeded", 1);
}

+ (void)logSiriRequestFailedWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    __int16 v8 = "+[AFAggregator logSiriRequestFailedWithError:]";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }
  int v6 = [a1 _fullAggDKeyWithPrefix:@"com.apple.siri.SiriFailed." error:v4];
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);
}

+ (void)logSiriOtherRequestStarted
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[AFAggregator logSiriOtherRequestStarted]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.SiriStarted.Other", 1);
}

+ (void)logSiriSpeechRequestStarted
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[AFAggregator logSiriSpeechRequestStarted]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.SiriStarted.Speech", 1);
}

+ (void)logRequestLaunchedApp
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[AFAggregator logRequestLaunchedApp]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.SiriSucceeded", 1);
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.SiriCancelled", -1);
}

+ (id)_fullAggDKeyWithPrefix:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  __int16 v8 = [v6 domain];
  uint64_t v9 = [v6 code];
  id v10 = [v6 userInfo];
  uint64_t v11 = [v10 objectForKey:*MEMORY[0x1E4F28A50]];

  __int16 v12 = [v6 domain];
  int v13 = [v12 isEqualToString:@"kAFAssistantErrorDomain"];

  if (!v13) {
    goto LABEL_10;
  }
  if (v9 == 1 && v11)
  {
    uint64_t v14 = [v7 stringByAppendingFormat:@"%@.%ld.", v8, 1];

    goto LABEL_6;
  }
  uint64_t v14 = v7;
  if (!v11)
  {
LABEL_10:
    uint64_t v14 = v7;
    if (v8) {
      goto LABEL_7;
    }
LABEL_11:
    v18 = [v14 stringByAppendingString:@"Other"];
    goto LABEL_12;
  }
LABEL_6:
  id v15 = v11;

  uint64_t v16 = [v15 domain];

  uint64_t v9 = [v15 code];
  id v6 = v15;
  __int16 v8 = (void *)v16;
  if (!v16) {
    goto LABEL_11;
  }
LABEL_7:
  if ((unint64_t)[v8 length] >= 0x1F)
  {
    uint64_t v17 = [v8 substringToIndex:30];

    __int16 v8 = (void *)v17;
  }
  v18 = [v14 stringByAppendingFormat:@"%@.%ld", v8, v9];

  id v7 = v8;
LABEL_12:

  return v18;
}

+ (void)logSiriPausedMedia
{
}

+ (void)logSiriMediaVolumeAction:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 2) {
    ADClientAddValueForScalarKey();
  }
}

+ (void)logSiriQuickStopAction:(unint64_t)a3
{
  char v3 = a3;
  if (a3)
  {
    ADClientAddValueForScalarKey();
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      ADClientAddValueForScalarKey();
      if ((v3 & 8) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  ADClientAddValueForScalarKey();
  if ((v3 & 4) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v3 & 8) == 0) {
    return;
  }
LABEL_9:
  ADClientAddValueForScalarKey();
}

+ (void)logSiriInvokedVia:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    char v3 = @"hardware_button";
  }
  else
  {
    if (a3 != 8) {
      return;
    }
    char v3 = @"voice_trigger";
  }
  ADClientAddValueForScalarKey();
  id v5 = @"via";
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  AnalyticsSendEvent();
}

+ (void)logRequestCancelAfterSeconds:(double)a3
{
  if (a3 >= 0.0)
  {
    if (a3 >= 1.0)
    {
      if (a3 >= 2.0)
      {
        if (a3 >= 3.0)
        {
          if (a3 >= 4.0)
          {
            if (a3 >= 5.0)
            {
              if (a3 >= 6.0)
              {
                if (a3 >= 7.0)
                {
                  if (a3 >= 8.0)
                  {
                    if (a3 >= 9.0)
                    {
                      if (a3 >= 10.0)
                      {
                        if (a3 >= 11.0)
                        {
                          if (a3 >= 12.0)
                          {
                            if (a3 >= 13.0)
                            {
                              if (a3 >= 14.0)
                              {
                                if (a3 >= 15.0)
                                {
                                  if (a3 >= 20.0)
                                  {
                                    if (a3 >= 25.0)
                                    {
                                      if (a3 >= 30.0)
                                      {
                                        if (a3 >= 35.0)
                                        {
                                          if (a3 >= 40.0) {
                                            char v3 = @"com.apple.siri.RequestCancel.40SecondsOrMore";
                                          }
                                          else {
                                            char v3 = @"com.apple.siri.RequestCancel.40Seconds";
                                          }
                                        }
                                        else
                                        {
                                          char v3 = @"com.apple.siri.RequestCancel.35Seconds";
                                        }
                                      }
                                      else
                                      {
                                        char v3 = @"com.apple.siri.RequestCancel.30Seconds";
                                      }
                                    }
                                    else
                                    {
                                      char v3 = @"com.apple.siri.RequestCancel.25Seconds";
                                    }
                                  }
                                  else
                                  {
                                    char v3 = @"com.apple.siri.RequestCancel.20Seconds";
                                  }
                                }
                                else
                                {
                                  char v3 = @"com.apple.siri.RequestCancel.15Seconds";
                                }
                              }
                              else
                              {
                                char v3 = @"com.apple.siri.RequestCancel.14Seconds";
                              }
                            }
                            else
                            {
                              char v3 = @"com.apple.siri.RequestCancel.13Seconds";
                            }
                          }
                          else
                          {
                            char v3 = @"com.apple.siri.RequestCancel.12Seconds";
                          }
                        }
                        else
                        {
                          char v3 = @"com.apple.siri.RequestCancel.11Seconds";
                        }
                      }
                      else
                      {
                        char v3 = @"com.apple.siri.RequestCancel.10Seconds";
                      }
                    }
                    else
                    {
                      char v3 = @"com.apple.siri.RequestCancel.9Seconds";
                    }
                  }
                  else
                  {
                    char v3 = @"com.apple.siri.RequestCancel.8Seconds";
                  }
                }
                else
                {
                  char v3 = @"com.apple.siri.RequestCancel.7Seconds";
                }
              }
              else
              {
                char v3 = @"com.apple.siri.RequestCancel.6Seconds";
              }
            }
            else
            {
              char v3 = @"com.apple.siri.RequestCancel.5Seconds";
            }
          }
          else
          {
            char v3 = @"com.apple.siri.RequestCancel.4Seconds";
          }
        }
        else
        {
          char v3 = @"com.apple.siri.RequestCancel.3Seconds";
        }
      }
      else
      {
        char v3 = @"com.apple.siri.RequestCancel.2Seconds";
      }
    }
    else
    {
      char v3 = @"com.apple.siri.RequestCancel.LessThan1";
    }
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v3, 1);
  }
}

+ (void)missedAlertContextForRequest
{
}

+ (void)missedAppContextForRequest
{
}

+ (void)logRequestCompletedWithDuration:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 > 10.0) {
    a3 = 10.0;
  }
  unsigned int v3 = a3;
  id v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "+[AFAggregator logRequestCompletedWithDuration:]";
    __int16 v7 = 1024;
    unsigned int v8 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v5, 0x12u);
  }
  _AFAggregatorClientAddValueForScalarKey(*((void *)&off_1E592A5B8 + v3), 1);
}

- (void)setHasActiveRequest:(BOOL)a3
{
  self->_hasActiveRequest = a3;
}

- (BOOL)hasActiveRequest
{
  return self->_hasActiveRequest;
}

- (void)setConnectionType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)connectionType
{
  return self->_type;
}

- (void)speechResponseReceived
{
  speechResponseReceived_sIsWarm = 1;
  if (self->_sessionIsRetrying)
  {
    [(AFAggregator *)self recordSessionRetrySuccess];
    self->_sessionIsRetrying = 0;
  }
}

- (void)startWaitingForSpeechResponse
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  self->_sessionIsRetrying = 0;
}

- (void)beginSessionRetryPreferringWWAN:(BOOL)a3
{
  self->_sessionIsRetrying = 1;
  self->_retryPrefersWWAN = a3;
}

- (void)connectionDidDrop
{
  if (self->_hasActiveRequest && !self->_sessionIsRetrying) {
    [(AFAggregator *)self recordFailure:1 forConnectionType:self->_type];
  }
}

- (void)connectionDidFail
{
  if (self->_hasActiveRequest && !self->_sessionIsRetrying) {
    [(AFAggregator *)self recordFailure:0 forConnectionType:self->_type];
  }
}

- (void)recordSessionRetrySuccess
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    id v4 = @"YES";
    if (!self->_retryPrefersWWAN) {
      id v4 = @"NO";
    }
    int v5 = 136315394;
    id v6 = "-[AFAggregator recordSessionRetrySuccess]";
    __int16 v7 = 2112;
    unsigned int v8 = v4;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s WWAN fallback %@", (uint8_t *)&v5, 0x16u);
  }
  _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.RetrySuccess", 1);
  if (self->_retryPrefersWWAN) {
    _AFAggregatorClientAddValueForScalarKey(@"com.apple.siri.WWAN.FallbackSuccess", 1);
  }
}

- (void)recordFailure:(int)a3 forConnectionType:(unint64_t)a4
{
  Mutable = CFStringCreateMutable(0, 31);
  CFStringAppendCString(Mutable, "com.apple.siri.", 0x600u);
  if (a4 - 1 > 8) {
    __int16 v7 = "Unknown.";
  }
  else {
    __int16 v7 = off_1E592A670[a4 - 1];
  }
  CFStringAppendCString(Mutable, v7, 0x600u);
  if (a3) {
    unsigned int v8 = "Dropped";
  }
  else {
    unsigned int v8 = "Failed";
  }
  CFStringAppendCString(Mutable, v8, 0x600u);
  _AFAggregatorClientAddValueForScalarKey((uint64_t)Mutable, 1);
  CFRelease(Mutable);
}

- (void)recordSuccessForConnectionType:(unint64_t)a3 isWarm:(BOOL)a4 forTimeInterval:(double)a5
{
  BOOL v6 = a4;
  Mutable = CFStringCreateMutable(0, 52);
  CFStringAppendCString(Mutable, "com.apple.siri.", 0x600u);
  if (v6) {
    uint64_t v9 = "";
  }
  else {
    uint64_t v9 = "Cold.";
  }
  CFStringAppendCString(Mutable, v9, 0x600u);
  if (a3 - 1 > 8) {
    id v10 = "Unknown.";
  }
  else {
    id v10 = off_1E592A670[a3 - 1];
  }
  CFStringAppendCString(Mutable, v10, 0x600u);
  double v11 = 0.0;
  if (a5 >= 0.0) {
    double v11 = a5;
  }
  if (v11 > 10.0) {
    double v11 = 10.0;
  }
  CFStringAppendCString(Mutable, off_1E592A618[v11], 0x600u);
  _AFAggregatorClientAddValueForScalarKey((uint64_t)Mutable, 1);
  CFRelease(Mutable);
}

+ (id)_stringForGatekeeperType:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E592A6D0[a3];
  }
}

+ (void)logStarkGatekeeperAppearedForType:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _stringForGatekeeperType:a3];
  id v4 = (void *)v3;
  if (v3)
  {
    int v5 = [@"com.apple.siri.Car.GateKeeper.Appeared" stringByAppendingFormat:@".%@", v3];
  }
  else
  {
    int v5 = @"com.apple.siri.Car.GateKeeper.Appeared";
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v5, 1);
  BOOL v6 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "+[AFAggregator(AssistantUI) logStarkGatekeeperAppearedForType:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s logged for key: %@", buf, 0x16u);
  }
}

+ (void)logStarkGatekeeperDismissedManuallyForType:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _stringForGatekeeperType:a3];
  id v4 = (void *)v3;
  if (v3)
  {
    int v5 = [@"com.apple.siri.Car.GateKeeper.Dismissed.Manual" stringByAppendingFormat:@".%@", v3];
  }
  else
  {
    int v5 = @"com.apple.siri.Car.GateKeeper.Dismissed.Manual";
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v5, 1);
  BOOL v6 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "+[AFAggregator(AssistantUI) logStarkGatekeeperDismissedManuallyForType:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s logged for key: %@", buf, 0x16u);
  }
}

+ (void)logHomeButtonPressToActivationDuration:(double)a3
{
}

+ (void)logTimeToBeepWithDuration:(double)a3
{
}

@end