@interface ADDictationConnection
- (ADDictationConnection)initWithServiceDelegate:(id)a3;
- (BOOL)adSpeechSessionEnded;
- (BOOL)adWaitingForAudioFile;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_dictationWillStartWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6;
- (id)_localSpeechRecognizerSupportingBackground:(BOOL)a3;
- (id)_updateDictationOptionsForOnDeviceDictation:(id)a3 language:(id)a4;
- (void)_addAudioSessionAssertion:(id)a3;
- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3;
- (void)_invokeRequestCompletion;
- (void)_removeAllAudioSessionAssertionsForReason:(id)a3;
- (void)_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4;
- (void)_speechRecordingDidFinish;
- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6;
- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6;
- (void)_updateDictationOptions:(id)a3;
- (void)adAudioFileFinishedWriting:(id)a3 error:(id)a4 context:(id)a5;
- (void)adPronunciationRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechDidBeginLocalRecognitionWithModelInfo:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechDidFindVoiceSearchFinalResult:(id)a3;
- (void)adSpeechDidFindVoiceSearchPartialResult:(id)a3;
- (void)adSpeechDidPauseRecognition;
- (void)adSpeechLanguageDetectorFailedWithError:(id)a3;
- (void)adSpeechLocalRecognitionDidSucceedWithSessionUUID:(id)a3;
- (void)adSpeechMultilingualSpeechRecognized:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecognizedPartialResult:(id)a3;
- (void)adSpeechRecognizedStructuredResult:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8;
- (void)adSpeechRecordingDidCancelWithContext:(id)a3;
- (void)adSpeechRecordingDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5;
- (void)adSpeechRecordingDidEndWithContext:(id)a3;
- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4;
- (void)adSpeechRecordingDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecordingDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidRecognizePhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 sessionUUID:(id)a8 refId:(id)a9;
- (void)adSpeechRecordingDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4;
- (void)addRecordedSpeechSampleData:(id)a3;
- (void)cancelSpeech;
- (void)connectionDisconnected;
- (void)continuePendingSpeechRequestFromTimestamp:(double)a3;
- (void)dealloc;
- (void)endSession;
- (void)findAlternativesForString:(id)a3 maxResults:(int)a4 completion:(id)a5;
- (void)getInstalledOfflineLanguagesWithCompletion:(id)a3;
- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4;
- (void)pauseRecognition;
- (void)preheat;
- (void)preheatEuclidModelWithLanguage:(id)a3 clientID:(id)a4;
- (void)preheatForLanguageCode:(id)a3;
- (void)preheatTestWithLanguage:(id)a3 options:(id)a4;
- (void)preheatWithRecordDeviceIdentifier:(id)a3;
- (void)recordAWDSuccessMetrics;
- (void)recordFailureMetricsForError:(id)a3;
- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 context:(id)a5;
- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 subtype:(id)a5 context:(id)a6;
- (void)requestOfflineAssistantSupportForLanguage:(id)a3 completion:(id)a4;
- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)sendUserSelectedAlternativeDictationLanguageCode:(id)a3;
- (void)setAdSpeechSessionEnded:(BOOL)a3;
- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5;
- (void)startRecordedAudioDictationWithOptions:(id)a3 language:(id)a4 narrowband:(BOOL)a5 forceSampling:(BOOL)a6;
- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 reply:(id)a6;
- (void)startRequestActivityWithCompletion:(id)a3;
- (void)stopSpeechWithOptions:(id)a3;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)updateSpeechOptions:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
@end

@implementation ADDictationConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionAssertions, 0);
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong(&self->_pendingSpeechRequestContinue, 0);
  objc_storeStrong((id *)&self->_pendingSpeechRequestConnection, 0);
  objc_storeStrong((id *)&self->_pendingSpeechRequestListener, 0);
  objc_storeStrong((id *)&self->_sessionTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dictationOptions, 0);
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
  objc_storeStrong((id *)&self->_localSpeechRecognizer, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAdSpeechSessionEnded:(BOOL)a3
{
  self->adSpeechSessionEnded = a3;
}

- (BOOL)adSpeechSessionEnded
{
  return self->adSpeechSessionEnded;
}

- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3
{
  pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
  if (pendingSpeechRequestContinue)
  {
    v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[ADDictationConnection _continuePendingSpeechRequestFromTimestamp:]";
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s timestamp = %f", (uint8_t *)&v10, 0x16u);
      pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
    }
    pendingSpeechRequestContinue[2](pendingSpeechRequestContinue, a3);
    id v7 = self->_pendingSpeechRequestContinue;
    self->_pendingSpeechRequestContinue = 0;
  }
  [(NSXPCListener *)self->_pendingSpeechRequestListener invalidate];
  pendingSpeechRequestListener = self->_pendingSpeechRequestListener;
  self->_pendingSpeechRequestListener = 0;

  [(NSXPCConnection *)self->_pendingSpeechRequestConnection invalidate];
  pendingSpeechRequestConnection = self->_pendingSpeechRequestConnection;
  self->_pendingSpeechRequestConnection = 0;
}

- (void)continuePendingSpeechRequestFromTimestamp:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100321470;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[ADDictationConnection listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v7 = AFPendingSpeechRequestServiceInterface();
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10032160C;
  v9[3] = &unk_10050E160;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003217AC;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    id v9 = "-[ADDictationConnection localSpeechRecognizer:didRecognizeRawEagerRecognitionCandidate:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %@ raw eager candidate: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100321914;
  v5[3] = &unk_10050D8C0;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003219C0;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (id)_localSpeechRecognizerSupportingBackground:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v5 = (const unsigned __int8 *)&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground;
  }
  else {
    id v5 = (const unsigned __int8 *)&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive;
  }
  localSpeechRecognizer = self->_localSpeechRecognizer;
  if (!localSpeechRecognizer
    || (uuid_copy((unsigned __int8 *)&v13, (const unsigned __int8 *)[(CoreEmbeddedSpeechRecognizer *)localSpeechRecognizer instanceUUID]), uuid_compare((const unsigned __int8 *)&v13, v5)))
  {
    id v7 = (CoreEmbeddedSpeechRecognizer *)[objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:self instanceUUID:v5];
    int v8 = self->_localSpeechRecognizer;
    self->_localSpeechRecognizer = v7;

    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = self->_localSpeechRecognizer;
      int v13 = 136316418;
      v14 = "-[ADDictationConnection _localSpeechRecognizerSupportingBackground:]";
      __int16 v15 = 2112;
      v16 = self;
      __int16 v17 = 1040;
      int v18 = 16;
      __int16 v19 = 2096;
      v20 = v5;
      __int16 v21 = 1024;
      BOOL v22 = v3;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ created speech recognizer (instanceUUID = %{uuid_t}.16P, for background = %{BOOL}d) %@", (uint8_t *)&v13, 0x36u);
    }
  }
  id v11 = self->_localSpeechRecognizer;
  return v11;
}

- (id)_updateDictationOptionsForOnDeviceDictation:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[AFPreferences sharedPreferences];
  unsigned int v9 = [v8 isOnDeviceDictationForced];

  if ((v9 & 1) == 0)
  {
    if ((AFIsATVOnly() & 1) != 0
      || !AFIsDictationRequestEligibleForOnDeviceDictation()
      || (+[AFPreferences sharedPreferences],
          v27 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v28 = [v27 preferOnlineRecognitionEnabled],
          v27,
          (v28 & 1) != 0))
    {
LABEL_45:
      v34 = 0;
      goto LABEL_46;
    }
  }
  __int16 v10 = +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver];
  id v11 = [v10 offlineDictationStatus];

  int v12 = AFIsSearchDictationRequest();
  v44 = self;
  if (!v11)
  {
    int v29 = 0;
    unsigned int v46 = 0;
    unsigned int v25 = 0;
    v16 = 0;
    goto LABEL_22;
  }
  int v13 = [v7 componentsSeparatedByString:@"_"];
  v14 = [v13 componentsJoinedByString:@"-"];

  uint64_t v15 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
  v16 = (void *)v15;
  if (v15) {
    __int16 v17 = (void *)v15;
  }
  else {
    __int16 v17 = v14;
  }
  id v18 = v17;

  v45 = v18;
  __int16 v19 = [v11 objectForKeyedSubscript:v18];
  v20 = v19;
  if (v19)
  {
    __int16 v21 = [v19 objectForKeyedSubscript:AFOfflineDictationStatusInstalledKey];
    unsigned int v22 = [v21 BOOLValue];

    __int16 v23 = [v20 objectForKeyedSubscript:AFOfflineDictationStatusHighQualityKey];
    unsigned int v46 = [v23 BOOLValue];

    v24 = [v20 objectForKeyedSubscript:AFOfflineDictationStatusOnDeviceSearchKey];
    unsigned int v25 = [v24 BOOLValue];

    if ((v12 ^ 1 | v9))
    {
      unsigned int v26 = 1;
      if (!v22) {
        goto LABEL_20;
      }
LABEL_17:
      if ((v46 & v26 & 1) == 0)
      {
        v30 = +[AFPreferences sharedPreferences];
        if ([v30 forceOfflineRecognitionEnabled])
        {
        }
        else
        {
          unsigned int v35 = [v6 forceOfflineRecognition];

          if (!v35)
          {
            int v29 = 1;
            goto LABEL_21;
          }
        }
      }
      v36 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        if (v16) {
          id v37 = v16;
        }
        else {
          id v37 = v7;
        }
        v38 = v36;
        v39 = +[NSNumber numberWithBool:v46];
        *(_DWORD *)buf = 136315906;
        v48 = "-[ADDictationConnection _updateDictationOptionsForOnDeviceDictation:language:]";
        __int16 v49 = 2112;
        id v50 = v7;
        __int16 v51 = 2112;
        *(void *)v52 = v37;
        *(_WORD *)&v52[8] = 2112;
        v53[0] = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Dictation: force offline speech recognition. Language code: %@, asset language code: %@, status: High Quality model: %@", buf, 0x2Au);
      }
      [v6 setForceOfflineRecognition:1];
      [v6 setSecureOfflineOnly:1];
      if ([v6 continuousListening])
      {
        v40 = [v20 objectForKeyedSubscript:AFOfflineDictationStatusContinuousListeningKey];
        if ([v40 BOOLValue])
        {
        }
        else
        {
          v41 = +[AFPreferences sharedPreferences];
          unsigned __int8 v42 = [v41 utteranceDetectionEnabled];

          if ((v42 & 1) == 0)
          {
            [v6 setDetectUtterances:0];
            [v6 setContinuousListening:0];
          }
        }
      }

      goto LABEL_45;
    }
    unsigned int v26 = [v6 preferOnDeviceRecognition] | v25;
    if (v22) {
      goto LABEL_17;
    }
  }
  else
  {
    unsigned int v25 = 0;
    unsigned int v46 = 0;
  }
LABEL_20:
  int v29 = 0;
LABEL_21:

LABEL_22:
  v31 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    if (v16) {
      id v32 = v16;
    }
    else {
      id v32 = v7;
    }
    v48 = "-[ADDictationConnection _updateDictationOptionsForOnDeviceDictation:language:]";
    __int16 v49 = 2112;
    id v50 = v7;
    __int16 v51 = 2112;
    *(void *)v52 = v32;
    *(_WORD *)&v52[8] = 1024;
    LODWORD(v53[0]) = v12;
    WORD2(v53[0]) = 1024;
    *(_DWORD *)((char *)v53 + 6) = v25;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s Dictation: offline speech recognition not available. Language code: %@, asset language code: %@, searchRequest=%d, searchModel=%d", buf, 0x2Cu);
  }

  if (!v9) {
    goto LABEL_45;
  }
  v33 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v48 = "-[ADDictationConnection _updateDictationOptionsForOnDeviceDictation:language:]";
    __int16 v49 = 2114;
    id v50 = v7;
    __int16 v51 = 1024;
    *(_DWORD *)v52 = v46;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Dictation for %{public}@ is supported=%d, installed=%d on device with forced offline recognition", buf, 0x22u);
  }
  if (v46) {
    [(ADDictationConnection *)v44 requestOfflineDictationSupportForLanguage:v7 completion:&stru_10050C3C8];
  }
  v34 = +[AFError errorWithCode:602];
LABEL_46:

  return v34;
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = +[ADCommandCenter sharedCommandCenter];
  [v24 updateVoiceCommandContextWithPrefixText:v23 postfixText:v22 selectedText:v21 disambiguationActive:v20 cursorInVisibleText:v19 favorCommandSuppression:v18 abortCommandSuppression:v17 undoEvent:v16];
}

- (void)findAlternativesForString:(id)a3 maxResults:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  unsigned int v9 = +[ADPhoneticEmbedder sharedEmbedder];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10032228C;
  v11[3] = &unk_10050C2C8;
  id v12 = v7;
  id v10 = v7;
  [v9 findAlternativesForString:v8 maxResults:v5 completion:v11];
}

- (void)preheatEuclidModelWithLanguage:(id)a3 clientID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ADPhoneticEmbedder sharedEmbedder];
  [v7 preheatEuclidModelWithLanguageCode:v6 clientID:v5];
}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (AFIsInternalInstall())
  {
    id v12 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = v12;
      v14 = [v9 localizedDescription];
      uint64_t v15 = AFAnalyticsEventTypeGetName();
      *(_DWORD *)buf = 136315906;
      id v22 = "-[ADDictationConnection reportIssueForError:eventType:subtype:context:]";
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      unsigned int v26 = v15;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Reporting issue for error %@, event %@ with context %@", buf, 0x2Au);
    }
    id v16 = +[SiriCoreSymptomsReporter sharedInstance];
    id v17 = +[NSXPCConnection currentConnection];
    id v18 = [v17 processIdentifier];
    uint64_t v19 = byte_100585E38;
    id v20 = sub_100078668();
    [v16 reportIssueForError:v9 type:a4 subtype:v10 context:v11 processIdentifier:v18 walkboutStatus:v19 triggerForIDSIdentifiers:v20];
  }
}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (AFIsInternalInstall())
  {
    id v9 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      id v11 = [v7 localizedDescription];
      id v12 = AFAnalyticsEventTypeGetName();
      int v18 = 136315906;
      uint64_t v19 = "-[ADDictationConnection reportIssueForError:eventType:context:]";
      __int16 v20 = 2112;
      id v21 = v11;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Reporting issue for error %@, event %@ with context %@", (uint8_t *)&v18, 0x2Au);
    }
    int v13 = +[SiriCoreSymptomsReporter sharedInstance];
    v14 = +[NSXPCConnection currentConnection];
    id v15 = [v14 processIdentifier];
    uint64_t v16 = byte_100585E38;
    id v17 = sub_100078668();
    [v13 reportIssueForError:v7 type:a4 context:v8 processIdentifier:v15 walkboutStatus:v16 triggerForIDSIdentifiers:v17];
  }
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = @"Siri Event";
  CFStringRef v16 = @"Siri Event";
  CFStringRef v17 = @"Dictation resume";
  id v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  sub_1001FC5E0(v11);

  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    id v15 = "-[ADDictationConnection resumeRecognitionWithPrefixText:postfixText:selectedText:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }
  int v13 = +[ADCommandCenter sharedCommandCenter];
  [v13 resumeRecognitionWithPrefixText:v9 postfixText:v8 selectedText:v7];
}

- (void)pauseRecognition
{
  v2 = @"Siri Event";
  CFStringRef v8 = @"Siri Event";
  CFStringRef v9 = @"Dictation pause";
  BOOL v3 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  sub_1001FC5E0(v3);

  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADDictationConnection pauseRecognition]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v5 = +[ADCommandCenter sharedCommandCenter];
  [v5 pauseRecognition];
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  int v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    CFStringRef v9 = "-[ADDictationConnection suppressLowStorageNotificationForLanguage:suppress:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 suppressLowStorageNotificationForLanguage:v5 suppress:v4];
}

- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  id v10 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v6 assetType:3];

  id v7 = +[SFEntitledAssetManager sharedInstance];
  int v8 = +[SFEntitledAssetManager subscriberIdForDictationAssets];
  CFStringRef v9 = [v7 installedAssetWithConfig:v10 regionId:0 shouldSubscribe:1 subscriberId:v8 expiration:0];

  v5[2](v5, v9 != 0, 0);
}

- (void)requestOfflineAssistantSupportForLanguage:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  id v10 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v6 assetType:3];

  id v7 = +[SFEntitledAssetManager sharedInstance];
  int v8 = +[SFEntitledAssetManager subscriberIdForDictationAssets];
  CFStringRef v9 = [v7 installedAssetWithConfig:v10 regionId:0 shouldSubscribe:1 subscriberId:v8 expiration:0];

  v5[2](v5, v9 != 0, 0);
}

- (void)getInstalledOfflineLanguagesWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[ADCommandCenter sharedCommandCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100322C4C;
  v6[3] = &unk_10050D058;
  id v7 = v3;
  id v5 = v3;
  [v4 getOfflineDictationStatusIgnoringCache:1 completion:v6];
}

- (void)_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 sendEngagementFeedback:a3 voiceQueryIdentifier:v6];
}

- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v13 = +[NSXPCConnection currentConnection];
  if (v13 && (AFConnectionHasEntitlement() & 1) == 0)
  {
    int v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[ADDictationConnection _startDictationWithURL:isNarrowBand:language:options:]";
      __int16 v23 = 2114;
      __int16 v24 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Connection (%{public}@) requires entitlement for pre-recorded dictation", buf, 0x16u);
    }
  }
  else
  {
    int v14 = @"Siri Event";
    CFStringRef v19 = @"Siri Event";
    CFStringRef v20 = @"Dictation startWithURL";
    id v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    sub_1001FC5E0(v15);

    [(ADDictationConnection *)self _updateDictationOptions:v12];
    self->_waitingForSpeechRecognition = 1;
    CFStringRef v16 = [(ADDictationSessionTracker *)self->_sessionTracker startSessionForReason:@"file-based dictation is starting" languageCode:v11 options:v12 speechRequestOptions:0];
    CFStringRef v17 = +[ADCommandCenter sharedCommandCenter];
    [v17 startDictationWithURL:v10 isNarrowBand:v8 language:v11 options:v12 sessionUUID:v16 delegate:self];
  }
}

- (void)addRecordedSpeechSampleData:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_usingLocalSpeechRecognizer)
  {
    [(CoreEmbeddedSpeechRecognizer *)self->_localSpeechRecognizer addAudioPacket:v5];
  }
  else
  {
    BOOL v4 = +[ADCommandCenter sharedCommandCenter];
    [v4 addRecordedSpeechSampleData:v5 delegate:self];
  }
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 language:(id)a4 narrowband:(BOOL)a5 forceSampling:(BOOL)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v11 = +[NSXPCConnection currentConnection];
  id v12 = v11;
  if (v11)
  {
    if (sub_100323678(v11, 1))
    {
      if ([v9 forceOfflineRecognition])
      {
        [(ADDictationConnection *)self _updateDictationOptions:v9];
        char v13 = 1;
        self->_waitingForSpeechRecognition = 1;
        self->_usingLocalSpeechRecognizer = 1;
        v54 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskDictation;
        uint64_t v14 = 0;
        switch((unint64_t)[v9 taskHint])
        {
          case 1uLL:
            id v15 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskVoiceMail;

            char v13 = 0;
            uint64_t v14 = 1;
            goto LABEL_17;
          case 2uLL:
            break;
          case 3uLL:
            id v15 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;

            uint64_t v14 = 0;
            goto LABEL_17;
          case 4uLL:
            id v15 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskWebSearch;

            uint64_t v14 = 0;
            char v13 = 0;
LABEL_17:
            v54 = v15;
            break;
          case 5uLL:

            uint64_t v14 = 0;
            char v13 = 0;
            v54 = @"DictationCC";
            break;
          default:
            uint64_t v14 = 0;
            char v13 = 0;
            break;
        }
        uint64_t v22 = [v9 offlineLanguage];
        __int16 v23 = (void *)v22;
        if (v22) {
          __int16 v24 = (void *)v22;
        }
        else {
          __int16 v24 = v10;
        }
        id v53 = v24;

        uint64_t v50 = [v9 modelOverrideURL];
        uint64_t v49 = [v9 recognitionOverrides];
        id v25 = [(AFDictationOptions *)self->_dictationOptions fieldLabel];
        char v26 = AFIsDictationRequestSpeechApiRequest();

        uint64_t v27 = [v9 interactionIdentifier];
        uint64_t v51 = [(AFDictationOptions *)self->_dictationOptions applicationName];
        id v28 = [(ADDictationConnection *)self _localSpeechRecognizerSupportingBackground:v14];
        v52 = (void *)v27;
        if (v28)
        {
          id v47 = objc_alloc((Class)CESRSpeechParameters);
          unsigned int v46 = [v9 originalAudioFileURL];
          unsigned __int8 v48 = [v9 detectUtterances];
          char v45 = sub_1001FB870();
          BOOL v29 = v6;
          unsigned __int8 v30 = [v9 farField];
          [v9 maximumRecognitionDuration];
          double v32 = v31;
          unsigned __int8 v33 = [v9 emojiRecognition];
          BYTE1(v44) = [v9 autoPunctuation];
          LOBYTE(v44) = v33;
          LOWORD(v43) = 0;
          LOBYTE(v42) = v26;
          HIBYTE(v41) = 0;
          *(_WORD *)((char *)&v41 + 5) = 0;
          BYTE4(v41) = v13;
          BYTE3(v41) = v30;
          BYTE2(v41) = v45;
          BYTE1(v41) = v48;
          LOBYTE(v41) = v29;
          unsigned int v35 = (void *)v49;
          v34 = (void *)v50;
          v36 = (void *)v51;
          id v37 = v52;
          id v38 = objc_msgSend(v47, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:", v53, 0, v52, v54, 0, v51, v32, 0.0, 0, v49, v50, v46, 0,
                  v41,
                  v42,
                  0,
                  0,
                  0,
                  v43,
                  0,
                  v44);

          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_10032389C;
          v55[3] = &unk_10050C360;
          v55[4] = self;
          [v28 startSpeechRecognitionWithParameters:v38 didStartHandler:v55];
        }
        else
        {
          unsigned int v35 = (void *)v49;
          v34 = (void *)v50;
          v39 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v57 = "-[ADDictationConnection startRecordedAudioDictationWithOptions:language:narrowband:forceSampling:]";
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s Could not make recognizer", buf, 0xCu);
          }
          serviceDelegate = self->_serviceDelegate;
          id v38 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:601 userInfo:0];
          [(AFDictationServiceDelegate *)serviceDelegate speechRecognitionDidFinishWithError:v38];
          v36 = (void *)v51;
          id v37 = v52;
        }

        goto LABEL_28;
      }
      int v18 = [(ADDictationConnection *)self _updateDictationOptionsForOnDeviceDictation:v9 language:v10];
      if (!v18)
      {
        [(ADDictationConnection *)self _updateDictationOptions:v9];
        self->_waitingForSpeechRecognition = 1;
        CFStringRef v20 = [(ADDictationSessionTracker *)self->_sessionTracker startSessionForReason:@"recorded audio dictation is starting" languageCode:v10 options:v9 speechRequestOptions:0];
        id v21 = +[ADCommandCenter sharedCommandCenter];
        [v21 startRecordedDictationWithLanguage:v10 options:v9 sessionUUID:v20 narrowband:v6 delegate:self];

        goto LABEL_12;
      }
      CFStringRef v19 = self->_serviceDelegate;
    }
    else
    {
      CFStringRef v17 = self->_serviceDelegate;
      int v18 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1700 userInfo:0];
      CFStringRef v19 = v17;
    }
    [(AFDictationServiceDelegate *)v19 speechRecognitionDidFinishWithError:v18];
LABEL_12:

    goto LABEL_28;
  }
  CFStringRef v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[ADDictationConnection startRecordedAudioDictationWithOptions:language:narrowband:forceSampling:]";
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Called from outside of an XPC connection", buf, 0xCu);
  }
LABEL_28:
}

- (void)recordAWDSuccessMetrics
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  objc_msgSend(v2, "_metrics_awdRequestEnd");
}

- (void)recordFailureMetricsForError:(id)a3
{
  id v3 = a3;
  id v4 = +[ADCommandCenter sharedCommandCenter];
  objc_msgSend(v4, "_metrics_recordFailureMetricsForError:", v3);
}

- (void)endSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = @"Siri Event";
  CFStringRef v6 = @"Siri Event";
  CFStringRef v7 = @"Dictation endSession";
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  sub_1001FC5E0(v4);

  [(ADDictationConnection *)self _removeAllAudioSessionAssertionsForReason:@"Dictation Connection Requested End Session"];
  id v5 = +[ADCommandCenter sharedCommandCenter];
  [v5 endSessionForDelegate:self];
}

- (void)preheatWithRecordDeviceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = @"Siri Event";
  CFStringRef v7 = @"Siri Event";
  CFStringRef v8 = @"Dictation preheatWithRecordDeviceIdentifier";
  id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  sub_1001FC5E0(v5);

  CFStringRef v6 = +[ADCommandCenter sharedCommandCenter];
  [v6 preheatWithRecordDeviceIdentifier:v3];
}

- (void)preheatTestWithLanguage:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CFStringRef v7 = @"Siri Event";
  CFStringRef v13 = @"Siri Event";
  CFStringRef v14 = @"Dictation Preheat Test";
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  sub_1001FC5E0(v8);

  id v9 = objc_alloc_init((Class)AFSpeechRequestOptions);
  if (AFIsNano()) {
    uint64_t v10 = 5;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setIsTest:1];
  [v9 setPreheatLanguage:v6];

  id v11 = [v5 modelOverrideURL];

  [v9 setPreheatTestModelPath:v11];
  id v12 = +[ADCommandCenter sharedCommandCenter];
  [v12 preheatWithStyle:v10 forOptions:v9 completion:0];
}

- (void)preheat
{
  id v4 = +[AFPreferences sharedPreferences];
  id v3 = [v4 languageCode];
  [(ADDictationConnection *)self preheatForLanguageCode:v3];
}

- (void)preheatForLanguageCode:(id)a3
{
  id v3 = a3;
  id v4 = @"Siri Event";
  CFStringRef v13 = @"Siri Event";
  CFStringRef v14 = @"Dictation preheat";
  id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  sub_1001FC5E0(v5);

  int v6 = AFIsNano();
  if (!v3)
  {
    CFStringRef v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[ADDictationConnection preheatForLanguageCode:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s No language provided, no language specific prewarm work will be done", (uint8_t *)&v11, 0xCu);
    }
  }
  if (v6) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = objc_alloc_init((Class)AFSpeechRequestOptions);
  [v9 setPreheatLanguage:v3];

  uint64_t v10 = +[ADCommandCenter sharedCommandCenter];
  [v10 preheatWithStyle:v8 forOptions:v9 completion:0];
}

- (void)sendUserSelectedAlternativeDictationLanguageCode:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[ADDictationConnection sendUserSelectedAlternativeDictationLanguageCode:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100323F60;
  block[3] = &unk_10050E138;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, block);
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  id v8 = +[ADCommandCenter sharedCommandCenter];
  [v8 sendSpeechCorrectionInfo:v7 interactionIdentifier:v6];
}

- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_usingLocalSpeechRecognizer)
  {
    id v7 = +[ADCommandCenter sharedCommandCenter];
    [v7 sendSpeechCorrectionInfo:v8 forCorrectionContext:v6];
  }
}

- (void)updateSpeechOptions:(id)a3
{
  id v10 = a3;
  id v4 = +[NSXPCConnection currentConnection];
  uint64_t v5 = [v10 audioFileHandle];
  if (v5 && (v6 = (void *)v5, BOOL v7 = sub_1003241C0(v4), v6, !v7))
  {
    serviceDelegate = self->_serviceDelegate;
    id v8 = +[AFError errorWithCode:1700];
    [(AFDictationServiceDelegate *)serviceDelegate speechRecognitionDidFinishWithError:v8];
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_usingLocalSpeechRecognizer) {
      goto LABEL_7;
    }
    sub_100324220(v10);
    id v8 = +[ADCommandCenter sharedCommandCenter];
    [v8 updateSpeechOptions:v10 forDelegate:self];
  }

LABEL_7:
}

- (void)stopSpeechWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = @"Siri Event";
  v18[0] = @"Siri Event";
  v18[1] = @"stopReason";
  v19[0] = @"Dictation stop";
  id v6 = [v4 stopContext];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"stopDictation"];
  id v8 = (void *)v7;
  CFStringRef v9 = &stru_10050F7D8;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  v19[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  sub_1001FC5E0(v10);

  int v11 = +[NSXPCConnection currentConnection];
  uint64_t v12 = [v4 audioFileHandle];
  if (v12 && (CFStringRef v13 = (void *)v12, v14 = sub_1003241C0(v11), v13, !v14))
  {
    serviceDelegate = self->_serviceDelegate;
    CFStringRef v16 = +[AFError errorWithCode:1700];
    [(AFDictationServiceDelegate *)serviceDelegate speechRecognitionDidFinishWithError:v16];
  }
  else
  {
    kdebug_trace();
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_usingLocalSpeechRecognizer)
    {
      [(CoreEmbeddedSpeechRecognizer *)self->_localSpeechRecognizer finishAudio];
    }
    else
    {
      sub_100324220(v4);
      CFStringRef v17 = +[ADCommandCenter sharedCommandCenter];
      [v17 stopSpeechWithOptions:v4 forDelegate:self];

      [(ADDictationSessionTracker *)self->_sessionTracker stopSessionForReason:@"dictation is stopping"];
      if (!self->_shouldFinalizeRequestOnNextFinalResult && !self->_didFinalizeUtteranceDetectionRequest) {
        self->_shouldFinalizeRequestOnNextFinalResult = 1;
      }
    }
  }
}

- (void)cancelSpeech
{
  id v3 = @"Siri Event";
  CFStringRef v7 = @"Siri Event";
  CFStringRef v8 = @"Dictation cancel";
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  sub_1001FC5E0(v4);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_usingLocalSpeechRecognizer)
  {
    [(CoreEmbeddedSpeechRecognizer *)self->_localSpeechRecognizer invalidate];
    localSpeechRecognizer = self->_localSpeechRecognizer;
    self->_localSpeechRecognizer = 0;

    self->_waitingForSpeechRecognition = 0;
    self->_usingLocalSpeechRecognizer = 0;
  }
  else
  {
    [(ADDictationConnection *)self _continuePendingSpeechRequestFromTimestamp:0.0];
    id v6 = +[ADCommandCenter sharedCommandCenter];
    [v6 cancelSpeechForDelegate:self];

    [(ADDictationSessionTracker *)self->_sessionTracker stopSessionForReason:@"dictation is canceling"];
  }
}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5
{
  CFStringRef v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 audioFileHandle];
  if (v11
    && (uint64_t v12 = (void *)v11,
        +[NSXPCConnection currentConnection],
        CFStringRef v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = sub_1003241C0(v13),
        v13,
        v12,
        !v14))
  {
    serviceDelegate = self->_serviceDelegate;
    uint64_t v23 = 1700;
  }
  else
  {
    id v15 = +[AFPreferences sharedPreferences];
    unsigned __int8 v16 = [v15 dictationIsEnabled];

    if (v16)
    {
      CFStringRef v17 = +[NSXPCConnection currentConnection];
      if (!AFDictationRequiresRequestValidation()
        || (sub_100323678(v17, 0) & 1) != 0
        || (AFIsDictationRequestFromAppleClient() & 1) != 0)
      {
        uint64_t v18 = [(ADDictationConnection *)self _updateDictationOptionsForOnDeviceDictation:v9 language:v8];
        if (!v18)
        {
          __int16 v24 = [v9 applicationName];
          if (v8) {
            CFStringRef v25 = v8;
          }
          else {
            CFStringRef v25 = &stru_10050F7D8;
          }
          CFStringRef v29 = @"language-code";
          CFStringRef v30 = v25;
          char v26 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          +[AFDictationDiscoverabilitySignalsStreamManager sendDictationRequestStartedEventWithBundleIdentifier:v24 context:0 userInfo:v26];

          sub_100324220(v10);
          [(ADDictationConnection *)self _startDictationWithLanguageCode:v8 options:v9 speechOptions:v10 xpcconnection:v17];
          CFStringRef v19 = 0;
          goto LABEL_19;
        }
        CFStringRef v19 = (void *)v18;
        CFStringRef v20 = self->_serviceDelegate;
      }
      else
      {
        uint64_t v27 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          double v32 = "-[ADDictationConnection startDictationWithLanguageCode:options:speechOptions:]";
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Dictation request validation failed", buf, 0xCu);
        }
        id v28 = self->_serviceDelegate;
        CFStringRef v19 = +[AFError errorWithCode:1700];
        CFStringRef v20 = v28;
      }
      [(AFDictationServiceDelegate *)v20 speechRecognitionDidFinishWithError:v19];
LABEL_19:

      goto LABEL_20;
    }
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v32 = "-[ADDictationConnection startDictationWithLanguageCode:options:speechOptions:]";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Dictation requested even though it is disabled", buf, 0xCu);
    }
    serviceDelegate = self->_serviceDelegate;
    uint64_t v23 = 34;
  }
  CFStringRef v17 = +[AFError errorWithCode:v23];
  [(AFDictationServiceDelegate *)serviceDelegate speechRecognitionDidFinishWithError:v17];
LABEL_20:
}

- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CFStringRef v13 = (void (**)(id, void))a6;
  uint64_t v14 = [v12 audioFileHandle];
  if (v14)
  {
    id v15 = (void *)v14;
    unsigned __int8 v16 = +[NSXPCConnection currentConnection];
    BOOL v17 = sub_1003241C0(v16);

    if (!v17)
    {
      serviceDelegate = self->_serviceDelegate;
      uint64_t v24 = 1700;
LABEL_9:
      CFStringRef v25 = +[AFError errorWithCode:v24];
      [(AFDictationServiceDelegate *)serviceDelegate speechRecognitionDidFinishWithError:v25];

      v13[2](v13, 0);
      goto LABEL_10;
    }
  }
  uint64_t v18 = +[AFPreferences sharedPreferences];
  unsigned __int8 v19 = [v18 dictationIsEnabled];

  if ((v19 & 1) == 0)
  {
    uint64_t v22 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      CFStringRef v29 = "-[ADDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:reply:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Dictation requested even though it is disabled", buf, 0xCu);
    }
    serviceDelegate = self->_serviceDelegate;
    uint64_t v24 = 34;
    goto LABEL_9;
  }
  CFStringRef v20 = [(ADDictationConnection *)self _dictationWillStartWithLanguageCode:v10 options:v11 speechOptions:v12 xpcconnection:0];
  id v21 = +[ADCommandCenter sharedCommandCenter];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100324C98;
  v26[3] = &unk_10050C338;
  v26[4] = self;
  uint64_t v27 = v13;
  [v21 startRecordingForPendingDictationWithLanguageCode:v10 options:v11 speechOptions:v12 sessionUUID:v20 delegate:self completion:v26];

LABEL_10:
}

- (void)_invokeRequestCompletion
{
  requestCompletion = (void (**)(id))self->_requestCompletion;
  if (requestCompletion)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      CFStringRef v7 = "-[ADDictationConnection _invokeRequestCompletion]";
      __int16 v8 = 2048;
      id v9 = self;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %p request completion invoked", (uint8_t *)&v6, 0x16u);
      requestCompletion = (void (**)(id))self->_requestCompletion;
    }
    requestCompletion[2](requestCompletion);
    id v5 = self->_requestCompletion;
  }
  else
  {
    id v5 = 0;
  }
  self->_requestCompletion = 0;
}

- (void)startRequestActivityWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100324FBC;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(ADDictationConnection *)self _dictationWillStartWithLanguageCode:v12 options:v11 speechOptions:v10 xpcconnection:a6];
  CFStringRef v13 = +[ADCommandCenter sharedCommandCenter];
  [v13 startDictationWithLanguageCode:v12 options:v11 speechOptions:v10 sessionUUID:v14 delegate:self];
}

- (id)_dictationWillStartWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v14 = [(ADDictationSessionTracker *)self->_sessionTracker startSessionForReason:@"dictation is starting" languageCode:v10 options:v11 speechRequestOptions:v12];
  unint64_t v15 = (unint64_t)[v11 transcriptionMode];
  CFStringRef v16 = &stru_10050F7D8;
  if (v15 <= 3) {
    CFStringRef v16 = off_10050C3E8[v15];
  }
  BOOL v17 = @"Siri Event";
  v50[0] = @"Siri Event";
  v50[1] = @"mode";
  v51[0] = @"Dictation start";
  v51[1] = v16;
  v50[2] = @"startReason";
  uint64_t v18 = [v12 startContext];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"startDictation"];
  CFStringRef v20 = (void *)v19;
  if (v19) {
    CFStringRef v21 = (const __CFString *)v19;
  }
  else {
    CFStringRef v21 = &stru_10050F7D8;
  }
  v51[2] = v21;
  v50[3] = @"appBundleID";
  uint64_t v22 = [v11 applicationName];
  uint64_t v23 = (void *)v22;
  if (v22) {
    CFStringRef v24 = (const __CFString *)v22;
  }
  else {
    CFStringRef v24 = &stru_10050F7D8;
  }
  v51[3] = v24;
  v50[4] = @"recognition";
  CFStringRef v25 = @"server";
  if ([v11 forceOfflineRecognition]
    && [v11 secureOfflineOnly])
  {
    CFStringRef v25 = @"on-device";
  }
  v51[4] = v25;
  char v26 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:5];
  sub_1001FC5E0(v26);

  if ([v11 detectUtterances]
    && ([v11 forceOfflineRecognition] & 1) == 0)
  {
    uint64_t v27 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315138;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Utterance detection for live recognition not yet supported; disabling. <rdar://problem/23691545>",
        (uint8_t *)&v46,
        0xCu);
    }
    [v11 setDetectUtterances:0];
  }
  if ([v11 shouldClassifyIntent]
    && ([v11 detectUtterances] & 1) == 0)
  {
    id v28 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315138;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Dictation intent classification is only supported with utterance detection enabled; disabling.",
        (uint8_t *)&v46,
        0xCu);
    }
    [v11 setShouldClassifyIntent:0];
  }
  if (!+[AFFeatureFlags isDictationVoiceCommandsEnabled])goto LABEL_27; {
  if ([v11 shouldRecognizeCommands]
  }
    && ([v11 detectUtterances] & 1) == 0)
  {
    CFStringRef v29 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315138;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Dictation command recognition is only supported with utterance detection enabled; disabling.",
        (uint8_t *)&v46,
        0xCu);
    }
LABEL_27:
    [v11 setShouldRecognizeCommands:0];
  }
  if ([v11 shouldRecognizeCommands]
    && [v11 shouldClassifyIntent])
  {
    CFStringRef v30 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315138;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s We can only support either Dictation intent classification or Dictation command recognition; disabling intent"
        " classification.",
        (uint8_t *)&v46,
        0xCu);
    }
    [v11 setShouldClassifyIntent:0];
  }
  if ([v11 shouldGenerateVoiceCommandCandidates]
    && ([v11 detectUtterances] & 1) == 0)
  {
    double v31 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315138;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s Dictation voice command candidates generation is only supported with utterance detection enabled; disabling.",
        (uint8_t *)&v46,
        0xCu);
    }
    [v11 setShouldGenerateVoiceCommandCandidates:0];
  }
  double v32 = +[AFPreferences sharedPreferences];
  unsigned __int8 v33 = [v32 dictationAutoPunctuationSupportedLocales];

  v34 = [v10 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  unsigned __int8 v35 = [v33 containsObject:v34];

  if ((v35 & 1) == 0)
  {
    v36 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315394;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      __int16 v48 = 2112;
      id v49 = v10;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s Disabling auto punctuation for unsupported language %@.", (uint8_t *)&v46, 0x16u);
    }
    [v11 setAutoPunctuation:0];
  }
  [(ADDictationConnection *)self _updateDictationOptions:v11];
  BOOL v37 = 1;
  self->_waitingForSpeechRecognition = 1;
  if (![v11 transcriptionMode]) {
    BOOL v37 = [v11 voiceSearchTypeOptions] != 0;
  }
  self->_waitingForStructuredResultsOrVoiceSearch = v37;
  self->_waitingForAudioFile = 0;
  if ([v12 audioFileType])
  {
    if (v13)
    {
      id v38 = (void *)kAssistantDictationPrerecordedEntitlement;
      if (AFConnectionHasEntitlement())
      {
LABEL_47:
        self->_waitingForAudioFile = 1;
        goto LABEL_51;
      }
    }
    else
    {
      v39 = +[NSXPCConnection currentConnection];
      id v38 = (void *)kAssistantDictationPrerecordedEntitlement;
      char HasEntitlement = AFConnectionHasEntitlement();

      if (HasEntitlement) {
        goto LABEL_47;
      }
    }
    [v12 setAudioFileType:0];
    uint64_t v41 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315394;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      __int16 v48 = 2112;
      id v49 = v38;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s Need %@ entitlement to use audioFileType; ignoring.",
        (uint8_t *)&v46,
        0x16u);
    }
  }
LABEL_51:
  self->_isDetectingUtterances = [(AFDictationOptions *)self->_dictationOptions detectUtterances];
  *(_WORD *)&self->_shouldFinalizeRequestOnNextFinalResult = 0;
  self->_waitingForKeyboardVisibleCheck = 0;
  if (v13)
  {
    if (sub_100323678(v13, 0)) {
      goto LABEL_60;
    }
  }
  else
  {
    uint64_t v42 = +[NSXPCConnection currentConnection];
    char v43 = sub_100323678(v42, 0);

    if (v43) {
      goto LABEL_60;
    }
  }
  if ((sub_1003258A8() & 1) == 0 && (sub_100325988() & 1) == 0)
  {
    uint64_t v44 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v46 = 136315138;
      id v47 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Keyboard not yet visible, delaying visibility check to first result", (uint8_t *)&v46, 0xCu);
    }
    self->_waitingForKeyboardVisibleCheck = 1;
  }
LABEL_60:

  return v14;
}

- (void)adSpeechDidPauseRecognition
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100325ADC;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adSpeechDidBeginLocalRecognitionWithModelInfo:(id)a3 sessionUUID:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100325B80;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)adSpeechMultilingualSpeechRecognized:(id)a3 sessionUUID:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100325C24;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)adSpeechLanguageDetectorFailedWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100325D04;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecordingDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100325DDC;
  v13[3] = &unk_10050CAD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (BOOL)adWaitingForAudioFile
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100325EA0;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)adAudioFileFinishedWriting:(id)a3 error:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(AFDictationServiceDelegate *)self->_serviceDelegate speechDidFinishWritingAudioFile:v8 error:v9];
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100325FB4;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)adPronunciationRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10032612C;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)adSpeechLocalRecognitionDidSucceedWithSessionUUID:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADDictationConnection adSpeechLocalRecognitionDidSucceedWithSessionUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Sending local recognition succeeded", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003263D0;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADDictationConnection adSpeechRecognitionDidFail:sessionUUID:]";
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Sending recognition failed %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100326630;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)adSpeechRecognizedStructuredResult:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 items];
  id v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = [v8 items];
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      __int16 v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v17), "ad_transcriptionResults");
        [v12 addObjectsFromArray:v18];

        __int16 v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  queue = self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1003268C0;
  v23[3] = &unk_10050DC68;
  v23[4] = self;
  id v24 = v12;
  id v25 = v9;
  id v26 = v10;
  id v20 = v10;
  id v21 = v9;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)adSpeechRecordingDidRecognizePhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 sessionUUID:(id)a8 refId:(id)a9
{
  id v15 = a3;
  id v16 = a8;
  [(AFDictationServiceDelegate *)self->_serviceDelegate speechDidRecognizePhrases:v15 rawPhrases:a4 utterances:a5 rawUtterances:a6 nluResult:a7 usingSpeechModel:&stru_10050F7D8 correctionContext:0 audioAnalytics:0];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100326A48;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v21 = v15;
  id v22 = v16;
  id v18 = v16;
  id v19 = v15;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
}

- (void)adSpeechRecordingDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4
{
}

- (void)adSpeechRecordingDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
}

- (void)adSpeechRecordingDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
}

- (void)adSpeechDidFindVoiceSearchFinalResult:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100326DB4;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechDidFindVoiceSearchPartialResult:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100326EFC;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecognizedPartialResult:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100327020;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003272BC;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = @"Siri Event";
  CFStringRef v16 = @"Siri Event";
  CFStringRef v17 = @"Dictation speechRecordingDidFail";
  id v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  sub_1001FC5E0(v9);

  [(ADDictationConnection *)self _speechRecordingDidFinish];
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003275C0;
  v13[3] = &unk_10050DCB8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, v13);
}

- (void)adSpeechRecordingDidCancelWithContext:(id)a3
{
  id v4 = a3;
  id v5 = @"Siri Event";
  CFStringRef v11 = @"Siri Event";
  CFStringRef v12 = @"Dictation speechRecordingDidCancel";
  id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  sub_1001FC5E0(v6);

  [(ADDictationConnection *)self _speechRecordingDidFinish];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100327804;
  block[3] = &unk_10050E160;
  void block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingDidEndWithContext:(id)a3
{
  id v4 = @"Siri Event";
  CFStringRef v6 = @"Siri Event";
  CFStringRef v7 = @"Dictation speechRecordingDidEnd";
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  sub_1001FC5E0(v5);

  [(ADDictationConnection *)self _speechRecordingDidFinish];
  [(AFDictationServiceDelegate *)self->_serviceDelegate speechRecordingDidEnd];
}

- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8
{
  id v11 = a8;
  id v12 = a7;
  id v13 = a6;
  kdebug_trace();
  id v14 = @"Siri Event";
  CFStringRef v18 = @"Siri Event";
  CFStringRef v19 = @"Dictation speechRecordingDidBegin";
  id v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  sub_1001FC5E0(v15);

  serviceDelegate = self->_serviceDelegate;
  CFStringRef v17 = [v11 sessionUUID];

  [(AFDictationServiceDelegate *)serviceDelegate speechRecordingDidBeginWithOptions:v12 sessionUUID:v17 sessionRequestUUID:v13];
}

- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4
{
}

- (void)_removeAllAudioSessionAssertionsForReason:(id)a3
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100327CF8;
  v17[3] = &unk_10050C310;
  id v12 = a3;
  id v18 = v12;
  CFStringRef v19 = self;
  id v4 = +[AFAssertionContext newWithBuilder:v17];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_audioSessionAssertions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          id v21 = "-[ADDictationConnection _removeAllAudioSessionAssertionsForReason:]";
          __int16 v22 = 2048;
          uint64_t v23 = self;
          __int16 v24 = 2112;
          id v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %p audioSessionAssertion = %@", buf, 0x20u);
        }
        [v10 relinquishWithContext:v4 options:0];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v26 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_audioSessionAssertions removeAllObjects];
}

- (void)_addAudioSessionAssertion:(id)a3
{
  id v4 = a3;
  audioSessionAssertions = self->_audioSessionAssertions;
  id v8 = v4;
  if (!audioSessionAssertions)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_audioSessionAssertions;
    self->_audioSessionAssertions = v6;

    id v4 = v8;
    audioSessionAssertions = self->_audioSessionAssertions;
  }
  [(NSMutableArray *)audioSessionAssertions addObject:v4];
}

- (void)_speechRecordingDidFinish
{
  char v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    dictationOptions = self->_dictationOptions;
    id v6 = v3;
    LODWORD(dictationOptions) = [(AFDictationOptions *)dictationOptions releaseAudioSessionOnRecordingCompletion];
    id v7 = AFSetAudioSessionInactiveOptionsGetNames();
    *(_DWORD *)buf = 136315650;
    id v10 = "-[ADDictationConnection _speechRecordingDidFinish]";
    __int16 v11 = 1024;
    int v12 = (int)dictationOptions;
    __int16 v13 = 2112;
    long long v14 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s _speechRecordingDidFinish _dictationOptions releaseAudioSessionOnRecordingCompletion: %d, AFSetAudioSessionInactiveOptions: %@", buf, 0x1Cu);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100327FD4;
  v8[3] = &unk_10050D8C0;
  v8[4] = self;
  void v8[5] = 1;
  dispatch_async(queue, v8);
}

- (void)_updateDictationOptions:(id)a3
{
  id v4 = (AFDictationOptions *)[a3 copy];
  dictationOptions = self->_dictationOptions;
  self->_dictationOptions = v4;
  _objc_release_x1(v4, dictationOptions);
}

- (void)connectionDisconnected
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100328130;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
  self->_disconnected = 1;
  localSpeechRecognizer = self->_localSpeechRecognizer;
  if (localSpeechRecognizer)
  {
    [(CoreEmbeddedSpeechRecognizer *)localSpeechRecognizer invalidate];
    id v5 = self->_localSpeechRecognizer;
    self->_localSpeechRecognizer = 0;
  }
}

- (void)dealloc
{
  char v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[ADDictationConnection dealloc]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }
  [(ADDictationConnection *)self _continuePendingSpeechRequestFromTimestamp:0.0];
  v4.receiver = self;
  v4.super_class = (Class)ADDictationConnection;
  [(ADDictationConnection *)&v4 dealloc];
}

- (ADDictationConnection)initWithServiceDelegate:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADDictationConnection;
  id v6 = [(ADDictationConnection *)&v15 init];
  if (v6)
  {
    __int16 v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      CFStringRef v17 = "-[ADDictationConnection initWithServiceDelegate:]";
      __int16 v18 = 2048;
      CFStringRef v19 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
    }
    objc_storeStrong((id *)&v6->_serviceDelegate, a3);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v10 = dispatch_queue_create("ADDictationConnection", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    int v12 = objc_alloc_init(ADDictationSessionTracker);
    sessionTracker = v6->_sessionTracker;
    v6->_sessionTracker = v12;

    if (qword_1005863B0 != -1) {
      dispatch_once(&qword_1005863B0, &stru_10050C2E8);
    }
  }

  return v6;
}

@end