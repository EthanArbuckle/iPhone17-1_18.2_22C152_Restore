@interface AFDictationConnection
+ (BOOL)dictationIsEnabled;
+ (BOOL)dictationIsSupportedForLanguageCode:(id)a3 error:(id *)a4;
+ (BOOL)languageDetectorIsEnabled;
+ (void)fetchSupportedLanguageCodes:(id)a3;
+ (void)getForcedOfflineDictationSupportedLanguagesWithCompletion:(id)a3;
- (AFDictationConnection)init;
- (AFDictationConnection)initWithInstanceContext:(id)a3;
- (AFDictationDelegate)delegate;
- (BOOL)dictationIsAvailableForLanguage:(id)a3;
- (BOOL)dictationIsAvailableForLanguage:(id)a3 synchronous:(BOOL)a4;
- (BOOL)forcedOfflineDictationIsAvailableForLanguage:(id)a3;
- (BOOL)forcedOfflineDictationIsAvailableForLanguage:(id)a3 synchronous:(BOOL)a4;
- (OS_dispatch_queue)delegateQueue;
- (float)averagePower;
- (float)peakPower;
- (id)_connection;
- (id)_dequeueAudioWithLength:(unint64_t)a3;
- (id)_dictationService;
- (id)_dictationServiceWithErrorHandler:(id)a3;
- (id)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5;
- (void)_LogUEIRequestCategorization:(int)a3;
- (void)_addPreheatAnalyticsEvent;
- (void)_cancelBufferFlushTimer;
- (void)_cancelRequestTimeout;
- (void)_cancelTimerClearBuffer;
- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3;
- (void)_clearConnection;
- (void)_connectionClearedForInterruption:(BOOL)a3;
- (void)_delayedStopSpeechWithOptions:(id)a3;
- (void)_delegateDidRecognizePartialSpeechPackage:(id)a3 nluResult:(id)a4 languageModel:(id)a5 delegate:(id)a6;
- (void)_delegateDidRecognizeSpeechTokens:(id)a3 nluResult:(id)a4 languageModel:(id)a5 delegate:(id)a6;
- (void)_dispatchAsync:(id)a3;
- (void)_dispatchCallbackGroupBlock:(id)a3;
- (void)_extendRequestTimeout;
- (void)_invokeRequestTimeout;
- (void)_logRequestCompetionStatusWithEventType:(int64_t)a3 error:(id)a4;
- (void)_registerInvalidationHandlerForXPCConnection:(id)a3;
- (void)_scheduleRequestTimeout;
- (void)_sendDataIfNeeded;
- (void)_sendPendingAnalyticsEvents;
- (void)_setActivationTimeOnOptionsIfNecessary:(id)a3;
- (void)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3;
- (void)_stopInputAudioPowerUpdates;
- (void)_tellSpeechDelegateAudioFileFinished:(id)a3 error:(id)a4;
- (void)_tellSpeechDelegateAvailabilityChanged;
- (void)_tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo:(id)a3;
- (void)_tellSpeechDelegateDidPauseRecognition;
- (void)_tellSpeechDelegateDidProcessAudioDuration:(double)a3;
- (void)_tellSpeechDelegateDidRecognizeFinalResultCandidatePackage:(id)a3;
- (void)_tellSpeechDelegateDidRecognizePackage:(id)a3;
- (void)_tellSpeechDelegateDidRecognizePartialResult:(id)a3;
- (void)_tellSpeechDelegateDidRecognizePartialSpeechPackage:(id)a3 nluResult:(id)a4 languageModel:(id)a5;
- (void)_tellSpeechDelegateDidRecognizeSpeechPhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 languageModel:(id)a8 correctionIdentifier:(id)a9 audioAnalytics:(id)a10;
- (void)_tellSpeechDelegateDidRecognizeSpeechTokens:(id)a3 nluResult:(id)a4 languageModel:(id)a5;
- (void)_tellSpeechDelegateDidRecognizeTranscriptionObjects:(id)a3 languageModel:(id)a4;
- (void)_tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4;
- (void)_tellSpeechDelegateLanguageDetected:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5;
- (void)_tellSpeechDelegateLanguageDetectorDidFail:(id)a3;
- (void)_tellSpeechDelegateMultilingualSpeechRecognized:(id)a3;
- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3;
- (void)_tellSpeechDelegateRecordingDidBeginWithOptions:(id)a3;
- (void)_tellSpeechDelegateRecordingDidCancel;
- (void)_tellSpeechDelegateRecordingDidEnd;
- (void)_tellSpeechDelegateRecordingDidFail:(id)a3;
- (void)_tellSpeechDelegateRecordingWillBegin;
- (void)_tellSpeechDelegateSearchResultsReceived:(id)a3 recognitionText:(id)a4 stable:(BOOL)a5 final:(BOOL)a6;
- (void)_tellSpeechDelegateSpeechRecognitionDidSucceed;
- (void)_updateBufferFlushTimerWithDelay:(double)a3;
- (void)_willCancelDictation;
- (void)_willCompleteDictation;
- (void)_willFailDictationWithError:(id)a3;
- (void)_willStartDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 machAbsoluteTime:(unint64_t)a6;
- (void)addRecordedSpeechSampleData:(id)a3;
- (void)beginAvailabilityMonitoring;
- (void)cancelAvailabilityMonitoring;
- (void)cancelSpeech;
- (void)dealloc;
- (void)endSession;
- (void)getEuclidPhonetic:(id)a3 maxResultsCount:(int)a4 completion:(id)a5;
- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4;
- (void)pauseRecognition;
- (void)preheat;
- (void)preheatEuclidModelWithLanguage:(id)a3 clientID:(id)a4;
- (void)preheatTestWithLanguage:(id)a3 options:(id)a4;
- (void)preheatWithRecordDeviceIdentifier:(id)a3;
- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 context:(id)a5;
- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 subtype:(id)a5 context:(id)a6;
- (void)requestOfflineAssistantSupportForLanguage:(id)a3 completion:(id)a4;
- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4;
- (void)sendSpeechCorrection:(id)a3 forIdentifier:(id)a4;
- (void)sendSpeechCorrection:(id)a3 interactionIdentifier:(id)a4;
- (void)sendUserSelectedAlternativeDictationLanguageCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4;
- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5;
- (void)startDictationWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4 options:(id)a5 forLanguage:(id)a6;
- (void)startDictationWithSpeechFileAtURL:(id)a3 options:(id)a4 forLanguage:(id)a5;
- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4;
- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4 narrowband:(BOOL)a5;
- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4 narrowband:(BOOL)a5 forceSampling:(BOOL)a6;
- (void)stopSpeech;
- (void)stopSpeechWithOptions:(id)a3;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)updateSpeechOptions:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
@end

@implementation AFDictationConnection

- (void)beginAvailabilityMonitoring
{
  id v3 = +[AFNetworkAvailability sharedAvailability];
  [v3 addObserver:self];
}

- (BOOL)dictationIsAvailableForLanguage:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    languagesLoggingInfo = self->_languagesLoggingInfo;
    if (!languagesLoggingInfo)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->_languagesLoggingInfo;
      self->_languagesLoggingInfo = v8;

      languagesLoggingInfo = self->_languagesLoggingInfo;
    }
    v10 = [(NSMutableDictionary *)languagesLoggingInfo objectForKeyedSubscript:v6];
    v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v14 = v12;

    v15 = [v14 objectForKeyedSubscript:@"CheckLanguageAvailable"];
    char v16 = [v15 BOOLValue];

    v17 = [v14 objectForKeyedSubscript:@"LanguageAvailableOverNetwork"];
    char v18 = [v17 BOOLValue];

    v19 = [v14 objectForKeyedSubscript:@"HQAssetsAvailable"];
    int v20 = [v19 BOOLValue];

    v21 = [v14 objectForKeyedSubscript:@"LQAssetsAvailable"];
    int v22 = [v21 BOOLValue];

    if ((v16 & 1) == 0)
    {
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v40 = 136315650;
        *(void *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
        *(_WORD *)&v40[12] = 2048;
        *(void *)&v40[14] = self;
        *(_WORD *)&v40[22] = 2112;
        id v41 = v6;
        _os_log_debug_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_DEBUG, "%s %p Checking if language %@ is available", v40, 0x20u);
      }
      v24 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
      [v14 setObject:v24 forKeyedSubscript:@"CheckLanguageAvailable"];

      [(NSMutableDictionary *)self->_languagesLoggingInfo setObject:v14 forKeyedSubscript:v6];
    }
    v25 = +[AFPreferences sharedPreferences];
    int v26 = [v25 isDictationHIPAACompliant];

    if (v26)
    {
      v27 = +[AFPreferences sharedPreferences];
      v28 = [v27 offlineDictationStatus];
      uint64_t v13 = AFIsDictationLanguageSupportedForOnDeviceDictation(v6, v28);

      if (!v14 || v20 == v13) {
        goto LABEL_29;
      }
      v29 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      v30 = "is not";
      *(void *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
      *(_WORD *)&v40[12] = 2048;
      *(_DWORD *)v40 = 136315906;
      *(void *)&v40[14] = self;
      if (v13) {
        v30 = "is";
      }
      *(_WORD *)&v40[22] = 2112;
      id v41 = v6;
      LOWORD(v42) = 2080;
      *(void *)((char *)&v42 + 2) = v30;
      v31 = "%s %p Language %@ %s available on-device (HQ assets)";
      goto LABEL_34;
    }
    v32 = +[AFNetworkAvailability sharedAvailability];
    int v33 = [v32 isAvailable];

    if (v33)
    {
      if ((v18 & 1) == 0)
      {
        v36 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v40 = 136315650;
          *(void *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
          *(_WORD *)&v40[12] = 2048;
          *(void *)&v40[14] = self;
          *(_WORD *)&v40[22] = 2112;
          id v41 = v6;
          _os_log_debug_impl(&dword_19CF1D000, v36, OS_LOG_TYPE_DEBUG, "%s %p Language %@ is available over network", v40, 0x20u);
        }
        v34 = (void *)MEMORY[0x1E4F28ED0];
        LOBYTE(v13) = 1;
        uint64_t v35 = 1;
        goto LABEL_28;
      }
      LOBYTE(v13) = 1;
    }
    else
    {
      uint64_t v13 = [(AFDictationConnection *)self forcedOfflineDictationIsAvailableForLanguage:v6 synchronous:v4];
      if (v22 != v13)
      {
        v29 = AFSiriLogContextConnection;
        if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
LABEL_24:
          v34 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v35 = v13;
LABEL_28:
          v37 = objc_msgSend(v34, "numberWithBool:", v35, *(_OWORD *)v40, *(void *)&v40[16], v41, v42);
          [v14 setObject:v37 forKeyedSubscript:@"LanguageAvailableOverNetwork"];

          [(NSMutableDictionary *)self->_languagesLoggingInfo setObject:v14 forKeyedSubscript:v6];
          goto LABEL_29;
        }
        v39 = "is not";
        *(void *)&v40[4] = "-[AFDictationConnection dictationIsAvailableForLanguage:synchronous:]";
        *(_WORD *)&v40[12] = 2048;
        *(_DWORD *)v40 = 136315906;
        *(void *)&v40[14] = self;
        if (v13) {
          v39 = "is";
        }
        *(_WORD *)&v40[22] = 2112;
        id v41 = v6;
        LOWORD(v42) = 2080;
        *(void *)((char *)&v42 + 2) = v39;
        v31 = "%s %p Language %@ %s available on-device (LQ assets)";
LABEL_34:
        _os_log_debug_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_DEBUG, v31, v40, 0x2Au);
        goto LABEL_24;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  LOBYTE(v13) = 0;
LABEL_30:

  return v13;
}

+ (BOOL)dictationIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (AFDictationCapable_onceToken != -1) {
    dispatch_once(&AFDictationCapable_onceToken, &__block_literal_global_76_45529);
  }
  if (AFDictationCapable_isCapable)
  {
    if (AFPreferencesLanguageIsSupportedForDictation((uint64_t)v5))
    {
      id v6 = 0;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v7 = 401;
  }
  else
  {
    uint64_t v7 = 400;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:v7 userInfo:0];
  if (a4) {
LABEL_10:
  }
    *a4 = v6;
LABEL_11:

  return v6 == 0;
}

- (BOOL)dictationIsAvailableForLanguage:(id)a3
{
  return [(AFDictationConnection *)self dictationIsAvailableForLanguage:a3 synchronous:0];
}

uint64_t __57__AFDictationConnection_networkAvailability_isAvailable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _availabilityChanged];
}

- (void)setDelegate:(id)a3
{
}

- (AFDictationConnection)init
{
  id v3 = +[AFInstanceContext currentContext];
  BOOL v4 = [(AFDictationConnection *)self initWithInstanceContext:v3];

  return v4;
}

- (AFDictationConnection)initWithInstanceContext:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AFDictationConnection;
  id v6 = [(AFDictationConnection *)&v28 init];
  if (v6)
  {
    if (v3 && (memset(&v29, 0, sizeof(v29)), dladdr(v3, &v29)))
    {
      if (v29.dli_fname && *v29.dli_fname)
      {
        id v7 = [NSString alloc];
        v8 = (void *)[v7 initWithUTF8String:v29.dli_fname];
      }
      else
      {
        v8 = 0;
      }
      if (v29.dli_sname && *v29.dli_sname)
      {
        id v10 = [NSString alloc];
        v11 = (void *)[v10 initWithUTF8String:v29.dli_sname];
      }
      else
      {
        v11 = 0;
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __49__AFDictationConnection_initWithInstanceContext___block_invoke;
      v25[3] = &unk_1E592A130;
      id v26 = v8;
      id v27 = v11;
      id v12 = v11;
      id v13 = v8;
      v9 = +[AFCallSiteInfo newWithBuilder:v25];
    }
    else
    {
      v9 = 0;
    }
    initiationCallSiteInfo = v6->_initiationCallSiteInfo;
    v6->_initiationCallSiteInfo = v9;

    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      char v16 = v6->_initiationCallSiteInfo;
      LODWORD(v29.dli_fname) = 136315650;
      *(const char **)((char *)&v29.dli_fname + 4) = "-[AFDictationConnection initWithInstanceContext:]";
      WORD2(v29.dli_fbase) = 2048;
      *(void **)((char *)&v29.dli_fbase + 6) = v6;
      HIWORD(v29.dli_sname) = 2112;
      v29.dli_saddr = v16;
      _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s %p (Caller = %@)", (uint8_t *)&v29, 0x20u);
    }
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(0, v17);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v6->_delegateQueue, MEMORY[0x1E4F14428]);
    int v20 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    buffer = v6->_buffer;
    v6->_buffer = v20;

    v6->_audioStartTime = -1.0;
    if (v5)
    {
      int v22 = (AFInstanceContext *)v5;
    }
    else
    {
      int v22 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v6->_instanceContext;
    v6->_instanceContext = v22;
  }
  return v6;
}

void __49__AFDictationConnection_initWithInstanceContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImagePath:v3];
  [v4 setSymbolName:*(void *)(a1 + 40)];
}

void __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

void __63__AFDictationConnection__tellSpeechDelegateAvailabilityChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnnectionDidChangeAvailability:*(void *)(a1 + 32)];
  }
}

- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AFDictationConnection_networkAvailability_isAvailable___block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_tellSpeechDelegateAvailabilityChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__AFDictationConnection__tellSpeechDelegateAvailabilityChanged__block_invoke;
  v2[3] = &unk_1E5926FC8;
  v2[4] = self;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v2];
}

- (void)_dispatchCallbackGroupBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
    if (self->_speechCallbackGroup)
    {
      objc_copyWeak(&to, (id *)&self->_delegate);
      speechCallbackGroup = self->_speechCallbackGroup;
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke;
      block[3] = &unk_1E5926FA0;
      id v11 = v4;
      objc_copyWeak(&v12, &to);
      dispatch_group_notify(speechCallbackGroup, delegateQueue, block);
      objc_destroyWeak(&v12);

      objc_destroyWeak(&to);
    }
    else
    {
      id v7 = self->_delegateQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke_2;
      v8[3] = &unk_1E592C6E8;
      v8[4] = self;
      id v9 = v4;
      dispatch_async(v7, v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_languagesLoggingInfo, 0);
  objc_storeStrong((id *)&self->_intstrumentationContext, 0);
  objc_storeStrong((id *)&self->_preheatEvent, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_onDeviceDictationUIInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_previouslyRecognizedPhrases, 0);
  objc_storeStrong((id *)&self->_requestIdString, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_stopOptions, 0);
  objc_storeStrong((id *)&self->_bufferTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_speechCallbackGroup, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_initiationCallSiteInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_knownOfflineInstalledLanguages, 0);
  objc_storeStrong((id *)&self->_lastUsedLanguage, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (AFDictationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFDictationDelegate *)WeakRetained;
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v32 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __189__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke;
  block[3] = &unk_1E59272E8;
  void block[4] = self;
  id v34 = v32;
  id v35 = v16;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v39 = v20;
  id v40 = v21;
  id v41 = v22;
  id v24 = v22;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v16;
  id v31 = v32;
  dispatch_async(internalQueue, block);
}

void __189__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke(void *a1)
{
  v2 = (unsigned char *)a1[4];
  if (v2[57])
  {
    id v3 = [v2 _dictationService];
    [v3 updateVoiceCommandContextWithPrefixText:a1[5] postfixText:a1[6] selectedText:a1[7] disambiguationActive:a1[8] cursorInVisibleText:a1[9] favorCommandSuppression:a1[10] abortCommandSuppression:a1[11] undoEvent:a1[12]];
  }
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  internalQueue = self->_internalQueue;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __179__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression___block_invoke;
  v30[3] = &unk_1E59272C0;
  v30[4] = self;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_async(internalQueue, v30);
}

void __179__AFDictationConnection_updateVoiceCommandContextWithPrefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression___block_invoke(void *a1)
{
  v2 = (unsigned char *)a1[4];
  if (v2[57])
  {
    id v3 = [v2 _dictationService];
    [v3 updateVoiceCommandContextWithPrefixText:a1[5] postfixText:a1[6] selectedText:a1[7] disambiguationActive:a1[8] cursorInVisibleText:a1[9] favorCommandSuppression:a1[10] abortCommandSuppression:a1[11] undoEvent:0];
  }
}

- (void)getEuclidPhonetic:(id)a3 maxResultsCount:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__AFDictationConnection_getEuclidPhonetic_maxResultsCount_completion___block_invoke;
  v13[3] = &unk_1E5927298;
  v13[4] = self;
  id v14 = v8;
  int v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void __70__AFDictationConnection_getEuclidPhonetic_maxResultsCount_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 findAlternativesForString:*(void *)(a1 + 40) maxResults:*(unsigned int *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)preheatEuclidModelWithLanguage:(id)a3 clientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFDictationConnection_preheatEuclidModelWithLanguage_clientID___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __65__AFDictationConnection_preheatEuclidModelWithLanguage_clientID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 preheatEuclidModelWithLanguage:*(void *)(a1 + 40) clientID:*(void *)(a1 + 48)];
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__AFDictationConnection_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke;
  v15[3] = &unk_1E592C220;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __82__AFDictationConnection_resumeRecognitionWithPrefixText_postfixText_selectedText___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 57))
  {
    id v4 = [*(id *)(a1 + 32) _dictationService];
    [v4 resumeRecognitionWithPrefixText:*(void *)(a1 + 40) postfixText:*(void *)(a1 + 48) selectedText:*(void *)(a1 + 56)];
  }
  else
  {
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v6 = "-[AFDictationConnection resumeRecognitionWithPrefixText:postfixText:selectedText:]_block_invoke";
      __int16 v7 = 2048;
      uint64_t v8 = v1;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p ignoring - no active request", buf, 0x16u);
    }
  }
}

- (void)pauseRecognition
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[AFDictationConnection pauseRecognition]";
    __int16 v8 = 2048;
    uint64_t v9 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AFDictationConnection_pauseRecognition__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __41__AFDictationConnection_pauseRecognition__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 57))
  {
    id v3 = [*(id *)(a1 + 32) _dictationService];
    [v3 pauseRecognition];
  }
  else
  {
    id v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v5 = "-[AFDictationConnection pauseRecognition]_block_invoke";
      __int16 v6 = 2048;
      uint64_t v7 = v1;
      _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s %p ignoring - no active request", buf, 0x16u);
    }
  }
}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    id v12 = [(AFDictationConnection *)self _dictationService];
    [v12 reportIssueForError:v13 eventType:a4 subtype:v10 context:v11];
  }
}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 context:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    uint64_t v9 = [(AFDictationConnection *)self _dictationService];
    [v9 reportIssueForError:v10 eventType:a4 context:v8];
  }
}

- (void)_cancelTimerClearBuffer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  [(AFDictationConnection *)self _cancelBufferFlushTimer];
  id v3 = [MEMORY[0x1E4F1CA58] data];
  buffer = self->_buffer;
  self->_buffer = v3;
}

- (void)_cancelBufferFlushTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  bufferTimer = self->_bufferTimer;
  if (bufferTimer)
  {
    dispatch_source_cancel(bufferTimer);
    id v4 = self->_bufferTimer;
    self->_bufferTimer = 0;
  }
}

- (void)_updateBufferFlushTimerWithDelay:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[AFDictationConnection _updateBufferFlushTimerWithDelay:]";
    __int16 v15 = 2048;
    double v16 = a3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Schedule timer with delay: %.2f", buf, 0x16u);
  }
  bufferTimer = self->_bufferTimer;
  if (!bufferTimer)
  {
    uint64_t v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_internalQueue);
    id v8 = self->_bufferTimer;
    self->_bufferTimer = v7;

    objc_initWeak((id *)buf, self);
    uint64_t v9 = self->_bufferTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__AFDictationConnection__updateBufferFlushTimerWithDelay___block_invoke;
    handler[3] = &unk_1E592B978;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_bufferTimer);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
    bufferTimer = self->_bufferTimer;
  }
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(bufferTimer, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __58__AFDictationConnection__updateBufferFlushTimerWithDelay___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 _cancelBufferFlushTimer];

  id v2 = objc_loadWeakRetained(&to);
  [v2 _sendDataIfNeeded];

  objc_destroyWeak(&to);
}

- (id)_dequeueAudioWithLength:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = -[NSMutableData subdataWithRange:](self->_buffer, "subdataWithRange:", 0, a3);
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_buffer, "replaceBytesInRange:withBytes:length:", 0, a3, 0, 0);
  return v5;
}

- (void)_sendDataIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_stopOptions && ![(NSMutableData *)self->_buffer length])
  {
    stopOptions = self->_stopOptions;
    [(AFDictationConnection *)self _delayedStopSpeechWithOptions:stopOptions];
  }
  else if (!self->_bufferTimer && [(NSMutableData *)self->_buffer length])
  {
    if (self->_audioStartTime < 0.0)
    {
      id v3 = [MEMORY[0x1E4F28F80] processInfo];
      [v3 systemUptime];
      self->_audioStartTime = v4;
    }
    id v5 = [MEMORY[0x1E4F28F80] processInfo];
    [v5 systemUptime];
    double v7 = v6 - self->_audioStartTime;

    double v8 = v7 + 15.0 - self->_amountDataSent;
    unint64_t v9 = [(NSMutableData *)self->_buffer length];
    double v10 = dbl_19D0E24E0[!self->_narrowband];
    double v11 = fmin(v8, (double)v9 / v10);
    double v12 = v10 * v11;
    double v13 = (double)[(NSMutableData *)self->_buffer length];
    if (v12 < v13) {
      double v13 = v12;
    }
    id v14 = [(AFDictationConnection *)self _dequeueAudioWithLength:(unint64_t)v13];
    __int16 v15 = [(AFDictationConnection *)self _dictationService];
    [v15 addRecordedSpeechSampleData:v14];

    double v16 = v11 + self->_amountDataSent;
    self->_amountDataSent = v16;
    uint64_t v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315906;
      id v20 = "-[AFDictationConnection _sendDataIfNeeded]";
      __int16 v21 = 2048;
      double v22 = v7;
      __int16 v23 = 2048;
      double v24 = v16;
      __int16 v25 = 2048;
      double v26 = v11;
      _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s Sent data from buffer, actualRuntime=%f, amountSent=%f, outgoingDuration=%f", (uint8_t *)&v19, 0x2Au);
    }
    if ([(NSMutableData *)self->_buffer length])
    {
      [(AFDictationConnection *)self _updateBufferFlushTimerWithDelay:2.0];
    }
    else if (self->_stopOptions)
    {
      -[AFDictationConnection _delayedStopSpeechWithOptions:](self, "_delayedStopSpeechWithOptions:");
    }
  }
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AFDictationConnection_suppressLowStorageNotificationForLanguage_suppress___block_invoke;
  block[3] = &unk_1E5927270;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __76__AFDictationConnection_suppressLowStorageNotificationForLanguage_suppress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 suppressLowStorageNotificationForLanguage:*(void *)(a1 + 40) suppress:*(unsigned __int8 *)(a1 + 48)];
}

- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AFDictationConnection_requestOfflineDictationSupportForLanguage_completion___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __78__AFDictationConnection_requestOfflineDictationSupportForLanguage_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 requestOfflineDictationSupportForLanguage:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)requestOfflineAssistantSupportForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AFDictationConnection_requestOfflineAssistantSupportForLanguage_completion___block_invoke;
  block[3] = &unk_1E592C598;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __78__AFDictationConnection_requestOfflineAssistantSupportForLanguage_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 requestOfflineAssistantSupportForLanguage:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)endSession
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[AFDictationConnection endSession]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AFDictationConnection_endSession__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __35__AFDictationConnection_endSession__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 endSession];

  id v3 = *(void **)(a1 + 32);
  return [v3 _clearConnection];
}

- (float)peakPower
{
  [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater _unsafePeakPower];
  return result;
}

- (float)averagePower
{
  [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater _unsafeAveragePower];
  return result;
}

- (void)sendUserSelectedAlternativeDictationLanguageCode:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__AFDictationConnection_sendUserSelectedAlternativeDictationLanguageCode___block_invoke;
    v7[3] = &unk_1E5929FC0;
    objc_copyWeak(&v9, location);
    id v8 = v4;
    dispatch_async(internalQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[AFDictationConnection sendUserSelectedAlternativeDictationLanguageCode:]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Language code is nil.", (uint8_t *)location, 0xCu);
    }
  }
}

void __74__AFDictationConnection_sendUserSelectedAlternativeDictationLanguageCode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _dictationService];
  [v2 sendUserSelectedAlternativeDictationLanguageCode:*(void *)(a1 + 32)];
}

- (void)sendSpeechCorrection:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AFDictationConnection_sendSpeechCorrection_interactionIdentifier___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __68__AFDictationConnection_sendSpeechCorrection_interactionIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 sendSpeechCorrectionInfo:*(void *)(a1 + 40) interactionIdentifier:*(void *)(a1 + 48)];
}

- (void)sendSpeechCorrection:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AFDictationConnection_sendSpeechCorrection_forIdentifier___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __60__AFDictationConnection_sendSpeechCorrection_forIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 sendSpeechCorrectionInfo:*(void *)(a1 + 40) forCorrectionContext:*(void *)(a1 + 48)];
}

- (void)updateSpeechOptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v12 = "-[AFDictationConnection updateSpeechOptions:]";
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__AFDictationConnection_updateSpeechOptions___block_invoke;
  v8[3] = &unk_1E592C710;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(internalQueue, v8);
}

void __45__AFDictationConnection_updateSpeechOptions___block_invoke(uint64_t a1)
{
  AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[AFAnalytics sharedAnalytics];
  [v2 logEventWithType:2202 context:v4 contextNoCopy:1];

  id v3 = [*(id *)(a1 + 40) _dictationService];
  [v3 updateSpeechOptions:*(void *)(a1 + 32)];
}

- (void)stopSpeech
{
}

- (void)_delayedStopSpeechWithOptions:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  internalQueue = self->_internalQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    BOOL v11 = "-[AFDictationConnection _delayedStopSpeechWithOptions:]";
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Delayed stop after buffer cleared", (uint8_t *)&v10, 0xCu);
  }
  kdebug_trace();
  id v7 = AFAnalyticsContextCreateWithSpeechRequestOptions(v5);
  id v8 = +[AFAnalytics sharedAnalytics];
  [v8 logEventWithType:2203 context:v7 contextNoCopy:1];

  [(AFDictationConnection *)self _checkAndSetIsCapturingSpeech:0];
  id v9 = [(AFDictationConnection *)self _dictationService];
  [v9 stopSpeechWithOptions:v5];
}

- (void)stopSpeechWithOptions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v11 = "-[AFDictationConnection stopSpeechWithOptions:]";
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__AFDictationConnection_stopSpeechWithOptions___block_invoke;
  v8[3] = &unk_1E592C710;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(internalQueue, v8);
}

void __47__AFDictationConnection_stopSpeechWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 96))
  {
LABEL_2:
    uint64_t v3 = *(void *)(a1 + 40);
    [(id)v2 _delayedStopSpeechWithOptions:v3];
    return;
  }
  if (![*(id *)(v2 + 112) length])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    goto LABEL_2;
  }
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[AFDictationConnection stopSpeechWithOptions:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Stop requested, delaying till buffer is empty", (uint8_t *)&v7, 0xCu);
  }
  if (*(void *)(a1 + 40)) {
    id v5 = (AFSpeechRequestOptions *)[*(id *)(a1 + 40) copy];
  }
  else {
    id v5 = objc_alloc_init(AFSpeechRequestOptions);
  }
  id v6 = v5;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v5);
}

- (void)cancelSpeech
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v7 = "-[AFDictationConnection cancelSpeech]";
    __int16 v8 = 2048;
    uint64_t v9 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AFDictationConnection_cancelSpeech__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __37__AFDictationConnection_cancelSpeech__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[AFAnalytics sharedAnalytics];
  [v2 logEventWithType:2204 context:0];

  [*(id *)(a1 + 32) _cancelTimerClearBuffer];
  [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:0];
  [*(id *)(a1 + 32) _willCancelDictation];
  id v3 = [*(id *)(a1 + 32) _dictationService];
  [v3 cancelSpeech];
}

- (void)addRecordedSpeechSampleData:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AFDictationConnection_addRecordedSpeechSampleData___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __53__AFDictationConnection_addRecordedSpeechSampleData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 96))
  {
    id v4 = [(id)v2 _dictationService];
    [v4 addRecordedSpeechSampleData:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(v2 + 112) appendData:*(void *)(a1 + 40)];
    id v3 = *(void **)(a1 + 32);
    [v3 _sendDataIfNeeded];
  }
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4 narrowband:(BOOL)a5 forceSampling:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  __int16 v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v23 = "-[AFDictationConnection startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:]";
    __int16 v24 = 2048;
    __int16 v25 = self;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s %p %@ %@ %d", buf, 0x30u);
  }
  __int16 v13 = (void *)[v10 copy];
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__AFDictationConnection_startRecordedAudioDictationWithOptions_forLanguage_narrowband_forceSampling___block_invoke;
  v17[3] = &unk_1E5927248;
  v17[4] = self;
  id v18 = v11;
  id v19 = v13;
  BOOL v20 = v7;
  BOOL v21 = a6;
  id v15 = v13;
  id v16 = v11;
  dispatch_async(internalQueue, v17);
}

void __101__AFDictationConnection_startRecordedAudioDictationWithOptions_forLanguage_narrowband_forceSampling___block_invoke(uint64_t a1)
{
  BOOL v7 = objc_alloc_init(AFSpeechRequestOptions);
  [(AFSpeechRequestOptions *)v7 setActivationEvent:12];
  [*(id *)(a1 + 32) _willStartDictationWithLanguageCode:*(void *)(a1 + 40) options:*(void *)(a1 + 48) speechOptions:v7 machAbsoluteTime:mach_absolute_time()];
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = [*(id *)(a1 + 48) forceOfflineRecognition];
  *(unsigned char *)(*(void *)(a1 + 32) + 59) = [*(id *)(a1 + 48) incremental];
  *(unsigned char *)(*(void *)(a1 + 32) + 60) = [*(id *)(a1 + 48) shouldClassifyIntent];
  *(unsigned char *)(*(void *)(a1 + 32) + 61) = [*(id *)(a1 + 48) shouldRecognizeCommands];
  uint64_t v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 startRequestActivityWithCompletion:&__block_literal_global_321];

  id v3 = [*(id *)(a1 + 48) offlineLanguage];

  if (!v3)
  {
    id v4 = *(void **)(a1 + 48);
    id v5 = AFOfflineDictationLanguageForKeyboardLanguage(*(void **)(a1 + 40), *(void **)(*(void *)(a1 + 32) + 24));
    [v4 setOfflineLanguage:v5];
  }
  id v6 = [*(id *)(a1 + 32) _dictationService];
  [v6 startRecordedAudioDictationWithOptions:*(void *)(a1 + 48) language:*(void *)(a1 + 40) narrowband:*(unsigned __int8 *)(a1 + 56) forceSampling:*(unsigned __int8 *)(a1 + 57)];
}

void __101__AFDictationConnection_startRecordedAudioDictationWithOptions_forLanguage_narrowband_forceSampling___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[AFDictationConnection startRecordedAudioDictationWithOptions:forLanguage:narrowband:forceSampling:]_block_invoke_2";
    _os_log_impl(&dword_19CF1D000, v0, OS_LOG_TYPE_INFO, "%s Recorded audio dictation request completed", (uint8_t *)&v1, 0xCu);
  }
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4 narrowband:(BOOL)a5
{
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 forLanguage:(id)a4
{
}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4
{
}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    double v22 = "-[AFDictationConnection startDictationWithLanguageCode:options:speechOptions:]";
    __int16 v23 = 2048;
    __int16 v24 = self;
    __int16 v25 = 2112;
    __int16 v26 = v10;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p %@ %@ %@", buf, 0x34u);
  }
  __int16 v12 = (void *)[v8 copy];
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__AFDictationConnection_startDictationWithLanguageCode_options_speechOptions___block_invoke;
  v17[3] = &unk_1E592C220;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(internalQueue, v17);
}

void __78__AFDictationConnection_startDictationWithLanguageCode_options_speechOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:1];
  [*(id *)(a1 + 32) _setActivationTimeOnOptionsIfNecessary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _willStartDictationWithLanguageCode:*(void *)(a1 + 48) options:*(void *)(a1 + 56) speechOptions:*(void *)(a1 + 40) machAbsoluteTime:v2];
  uint64_t v3 = [*(id *)(a1 + 48) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  *(unsigned char *)(*(void *)(a1 + 32) + 96) = [*(id *)(a1 + 56) forceOfflineRecognition];
  *(unsigned char *)(*(void *)(a1 + 32) + 59) = [*(id *)(a1 + 56) incremental];
  *(unsigned char *)(*(void *)(a1 + 32) + 60) = [*(id *)(a1 + 56) shouldClassifyIntent];
  *(unsigned char *)(*(void *)(a1 + 32) + 61) = [*(id *)(a1 + 56) shouldRecognizeCommands];
  id v6 = [*(id *)(a1 + 32) _dictationService];
  [v6 startRequestActivityWithCompletion:&__block_literal_global_318];

  BOOL v7 = [*(id *)(a1 + 56) offlineLanguage];

  if (!v7)
  {
    id v8 = *(void **)(a1 + 56);
    id v9 = AFOfflineDictationLanguageForKeyboardLanguage(*(void **)(a1 + 48), *(void **)(*(void *)(a1 + 32) + 24));
    [v8 setOfflineLanguage:v9];
  }
  id v10 = [*(id *)(a1 + 32) _dictationService];
  [v10 startDictationWithLanguageCode:*(void *)(a1 + 48) options:*(void *)(a1 + 56) speechOptions:*(void *)(a1 + 40)];
}

void __78__AFDictationConnection_startDictationWithLanguageCode_options_speechOptions___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[AFDictationConnection startDictationWithLanguageCode:options:speechOptions:]_block_invoke_2";
    _os_log_impl(&dword_19CF1D000, v0, OS_LOG_TYPE_INFO, "%s Dictation request completed", (uint8_t *)&v1, 0xCu);
  }
}

- (id)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    id v35 = v8;
    *(_WORD *)id v36 = 2112;
    *(void *)&v36[2] = v9;
    *(_WORD *)&v36[10] = 2112;
    *(void *)&v36[12] = v10;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p %@ %@ %@", buf, 0x34u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v35 = __Block_byref_object_copy__13572;
  *(void *)id v36 = __Block_byref_object_dispose__13573;
  *(void *)&v36[8] = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__295;
  v32[4] = __Block_byref_object_dispose__296;
  id v33 = 0;
  dispatch_group_t v12 = dispatch_group_create();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke;
  block[3] = &unk_1E59271D0;
  void block[4] = self;
  id v26 = v10;
  __int16 v27 = v8;
  id v28 = v9;
  id v14 = v12;
  __int16 v29 = v14;
  id v30 = v32;
  uint64_t v31 = buf;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  dispatch_sync(internalQueue, block);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_3;
  v21[3] = &unk_1E5927220;
  double v22 = v14;
  __int16 v23 = v32;
  __int16 v24 = buf;
  id v18 = v14;
  id v19 = (void *)MEMORY[0x19F3A50D0](v21);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(buf, 8);

  return v19;
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = [*(id *)(a1 + 32) _dictationService];
  [v3 startRequestActivityWithCompletion:&__block_literal_global_298];

  [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:1];
  [*(id *)(a1 + 32) _setActivationTimeOnOptionsIfNecessary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _willStartDictationWithLanguageCode:*(void *)(a1 + 48) options:*(void *)(a1 + 56) speechOptions:*(void *)(a1 + 40) machAbsoluteTime:v2];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
  kdebug_trace();
  uint64_t v4 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_299;
  v25[3] = &unk_1E592C248;
  id v26 = *(id *)(a1 + 64);
  id v5 = [v4 _dictationServiceWithErrorHandler:v25];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_300;
  v21[3] = &unk_1E59271A8;
  uint64_t v24 = *(void *)(a1 + 72);
  id v22 = v8;
  id v23 = *(id *)(a1 + 64);
  [v5 startRecordingForPendingDictationWithLanguageCode:v7 options:v6 speechOptions:v22 reply:v21];

  if ([*(id *)(a1 + 40) pendCallbacksUntilAfterContinuation])
  {
    id v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    id v10 = [AFSafetyBlock alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_2_309;
    v19[3] = &unk_1E5928308;
    id v11 = v9;
    id v20 = v11;
    uint64_t v12 = [(AFSafetyBlock *)v10 initWithBlock:v19];
    uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 64);
    *(void *)(v15 + 64) = v11;
    id v17 = v11;
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id v17 = *(NSObject **)(v18 + 64);
    *(void *)(v18 + 64) = 0;
  }
}

uint64_t __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_3(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  [v2 systemUptime];
  uint64_t v4 = v3;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_4;
  v7[3] = &unk_1E59271F8;
  id v5 = a1[4];
  void v7[4] = a1[5];
  void v7[5] = v4;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v7);
  return [*(id *)(*(void *)(a1[6] + 8) + 40) invoke];
}

uint64_t __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(*(double *)(a1 + 40));
  }
  return result;
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_299(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v5, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_300(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v3];
  id v6 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6EE8];
  [v5 setRemoteObjectInterface:v6];

  __int16 v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(0, v7);

  [v5 _setQueue:v8];
  [v5 resume];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_301;
  v13[3] = &unk_1E5927180;
  id v14 = *(id *)(a1 + 32);
  id v15 = v5;
  id v9 = v5;
  uint64_t v10 = MEMORY[0x19F3A50D0](v13);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_2_309(uint64_t a1)
{
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_301(uint64_t a1, double a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Continuing pending speech request %p", buf, 0x16u);
  }
  id v6 = [*(id *)(a1 + 40) remoteObjectProxyWithErrorHandler:&__block_literal_global_304];
  [v6 continuePendingSpeechRequestFromTimestamp:a2];

  __int16 v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_305;
  v8[3] = &unk_1E592C678;
  id v9 = v7;
  [v9 addBarrierBlock:v8];
}

uint64_t __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_305(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_302(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

void __97__AFDictationConnection_startRecordingForPendingDictationWithLanguageCode_options_speechOptions___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[AFDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:]_block_invoke_2";
    _os_log_impl(&dword_19CF1D000, v0, OS_LOG_TYPE_INFO, "%s Pending dictation request completed", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_setActivationTimeOnOptionsIfNecessary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 expectedActivationEventTime];
  if (v4 <= 0.0)
  {
    uint64_t v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[AFDictationConnection _setActivationTimeOnOptionsIfNecessary:]";
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Inserting activation timestamps since client did not set them", (uint8_t *)&v10, 0xCu);
    }
    [v3 activationEventTime];
    if (v6 <= 0.0)
    {
      id v7 = [MEMORY[0x1E4F28F80] processInfo];
      [v7 systemUptime];
      double v9 = v8;

      [v3 setActivationEventTime:v9];
    }
    [v3 activationEventTime];
    objc_msgSend(v3, "setExpectedActivationEventTime:");
  }
}

- (void)preheatWithRecordDeviceIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[AFDictationConnection preheatWithRecordDeviceIdentifier:]";
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__AFDictationConnection_preheatWithRecordDeviceIdentifier___block_invoke;
  v8[3] = &unk_1E592C710;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(internalQueue, v8);
}

void __59__AFDictationConnection_preheatWithRecordDeviceIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addPreheatAnalyticsEvent];
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 preheatWithRecordDeviceIdentifier:*(void *)(a1 + 40)];
}

- (void)preheat
{
  id v4 = +[AFPreferences sharedPreferences];
  id v3 = [v4 languageCode];
  [(AFDictationConnection *)self preheatForLanguageCode:v3];
}

- (void)_sendPendingAnalyticsEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_preheatEvent)
  {
    id v3 = AFSiriLogContextSpeech;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[AFDictationConnection _sendPendingAnalyticsEvents]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Sending 1 event", (uint8_t *)&v6, 0xCu);
    }
    id v4 = +[AFAnalytics sharedAnalytics];
    [v4 logEvent:self->_preheatEvent];

    preheatEvent = self->_preheatEvent;
    self->_preheatEvent = 0;
  }
}

- (void)_addPreheatAnalyticsEvent
{
  AFAnalyticsEventCreateCurrent(2225, 0);
  id v3 = (AFAnalyticsEvent *)objc_claimAutoreleasedReturnValue();
  preheatEvent = self->_preheatEvent;
  self->_preheatEvent = v3;
}

- (void)_willCompleteDictation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[AFDictationConnection _willCompleteDictation]";
    __int16 v16 = 2048;
    id v17 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_hasActiveRequest)
  {
    self->_hasActiveRequest = 0;
    if (self->_intstrumentationContext)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FA1350]);
      [(AFAnalyticsTurnBasedInstrumentationContext *)self->_intstrumentationContext emitInstrumentation:v4];
      [(AFDictationConnection *)self _LogUEIRequestCategorization:3];
    }
    if (AFIsInternalInstall_onceToken != -1) {
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
    }
    if (AFIsInternalInstall_isInternal)
    {
      uint64_t v5 = (id)AFSiriLogContextSpeech;
      os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)AFSiriLogContextSpeech);
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19CF1D000, v5, OS_SIGNPOST_EVENT, v7, "UsefulUserFacingResults", (const char *)&unk_19D12666E, buf, 2u);
        }
      }
    }
    requestIdString = self->_requestIdString;
    if (requestIdString)
    {
      __int16 v12 = @"id";
      uint64_t v13 = requestIdString;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    }
    else
    {
      id v9 = 0;
    }
    int v10 = +[AFAnalytics sharedAnalytics];
    [v10 logEventWithType:2207 context:v9];

    [(AFDictationConnection *)self _logRequestCompetionStatusWithEventType:2207 error:0];
    +[AFAggregator logDictationSucceeded];
    uint64_t v11 = [(AFDictationConnection *)self _dictationService];
    [v11 recordAWDSuccessMetrics];
  }
}

- (void)_willFailDictationWithError:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "-[AFDictationConnection _willFailDictationWithError:]";
    __int16 v27 = 2048;
    id v28 = self;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_hasActiveRequest)
  {
    self->_hasActiveRequest = 0;
    if (self->_intstrumentationContext)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FA12E0]);
      os_signpost_id_t v7 = AFPNRFatalErrorInfoFromNSError(v4);
      [v6 setError:v7];

      uint64_t v8 = [v4 userInfo];
      uint64_t v9 = *MEMORY[0x1E4F28A50];
      int v10 = [v8 objectForKey:*MEMORY[0x1E4F28A50]];

      uint64_t v11 = AFPNRFatalErrorInfoFromNSError(v10);
      [v6 setUnderlyingError:v11];

      __int16 v12 = [v10 userInfo];
      uint64_t v13 = [v12 objectForKey:v9];

      __int16 v14 = AFPNRFatalErrorInfoFromNSError(v13);
      [v6 setUnderUnderlyingError:v14];

      [(AFAnalyticsTurnBasedInstrumentationContext *)self->_intstrumentationContext emitInstrumentation:v6];
      [(AFDictationConnection *)self _LogUEIRequestCategorization:2];
    }
    requestIdString = self->_requestIdString;
    if (requestIdString)
    {
      id v22 = @"id";
      id v23 = requestIdString;
      __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x1E4F1CC08];
    }
    v24[0] = v16;
    id v17 = AFAnalyticsContextCreateWithError(v4);
    v24[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    id v19 = AFAnalyticsContextsMerge(v18);

    if (requestIdString) {
    id v20 = +[AFAnalytics sharedAnalytics];
    }
    [v20 logEventWithType:2206 context:v19];

    [(AFDictationConnection *)self _logRequestCompetionStatusWithEventType:2206 error:v4];
    +[AFAggregator logDictationFailedWithError:v4];
    BOOL v21 = [(AFDictationConnection *)self _dictationService];
    [v21 recordFailureMetricsForError:v4];

    [(AFDictationConnection *)self reportIssueForError:v4 eventType:2206 subtype:@"Dictation" context:v19];
  }
}

- (void)_willCancelDictation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v10 = "-[AFDictationConnection _willCancelDictation]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_hasActiveRequest)
  {
    self->_hasActiveRequest = 0;
    if (self->_intstrumentationContext) {
      [(AFDictationConnection *)self _LogUEIRequestCategorization:1];
    }
    requestIdString = self->_requestIdString;
    if (requestIdString)
    {
      os_signpost_id_t v7 = @"id";
      uint64_t v8 = requestIdString;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v6 = +[AFAnalytics sharedAnalytics];
    [v6 logEventWithType:2205 context:v5];

    [(AFDictationConnection *)self _logRequestCompetionStatusWithEventType:2205 error:0];
    +[AFAggregator logDictationCancelled];
  }
}

- (void)_LogUEIRequestCategorization:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA1348]);
  [v5 setRequestStatus:v3];
  [v5 setRequestType:6];
  [(AFAnalyticsTurnBasedInstrumentationContext *)self->_intstrumentationContext emitInstrumentation:v5];
}

- (void)_logRequestCompetionStatusWithEventType:(int64_t)a3 error:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_signpost_id_t v7 = v6;
  if (self->_onDeviceDictationUIInteractionIdentifier)
  {
    switch(a3)
    {
      case 2205:
        uint64_t v8 = @"canceled";
        break;
      case 2206:
        if (v6)
        {
          uint64_t v9 = [v6 domain];
          int v10 = [v9 isEqualToString:@"kAFAssistantErrorDomain"];

          uint64_t v8 = @"failure";
          if (v10)
          {
            uint64_t v11 = [v7 code];
            __int16 v12 = @"interrupted";
            if (v11 != 1107) {
              __int16 v12 = @"failure";
            }
            if (v11 == 1110) {
              uint64_t v8 = @"noMatch";
            }
            else {
              uint64_t v8 = v12;
            }
          }
        }
        else
        {
          uint64_t v8 = @"failure";
        }
        break;
      case 2207:
        uint64_t v8 = @"success";
        break;
      default:
        uint64_t v8 = @"unknown";
        break;
    }
    uint64_t v13 = +[AFAnalytics sharedAnalytics];
    v16[0] = @"requestStatus";
    v16[1] = @"dictationUIInteractionIdentifier";
    onDeviceDictationUIInteractionIdentifier = self->_onDeviceDictationUIInteractionIdentifier;
    v17[0] = v8;
    v17[1] = onDeviceDictationUIInteractionIdentifier;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v13 logEventWithType:2222 context:v15];
  }
}

- (void)_willStartDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 machAbsoluteTime:(unint64_t)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v80 = "-[AFDictationConnection _willStartDictationWithLanguageCode:options:speechOptions:machAbsoluteTime:]";
    __int16 v81 = 2048;
    v82 = self;
    __int16 v83 = 2112;
    id v84 = v10;
    __int16 v85 = 2112;
    id v86 = v11;
    __int16 v87 = 2112;
    id v88 = v12;
    __int16 v89 = 2048;
    unint64_t v90 = a6;
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s %p %@ %@ %@ %llu", buf, 0x3Eu);
  }
  unint64_t v71 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  self->_isDetectingUtterances = 0;
  __int16 v14 = [v12 turnIdentifier];
  if (v14)
  {
    id v15 = [AFAnalyticsTurnBasedInstrumentationContext alloc];
    __int16 v16 = [v12 turnIdentifier];
    id v17 = [(AFAnalyticsTurnBasedInstrumentationContext *)v15 initWithTurnIdentifier:v16];
    p_intstrumentationContext = &self->_intstrumentationContext;
    intstrumentationContext = self->_intstrumentationContext;
    self->_intstrumentationContext = v17;
  }
  else
  {
    p_intstrumentationContext = &self->_intstrumentationContext;
    __int16 v16 = self->_intstrumentationContext;
    self->_intstrumentationContext = 0;
  }

  self->_hasActiveRequest = 1;
  id v20 = objc_alloc_init(MEMORY[0x1E4F29128]);
  BOOL v21 = [v20 UUIDString];
  requestIdString = self->_requestIdString;
  self->_requestIdString = v21;

  self->_isWaitingForAudioFile = [v12 audioFileType] != 0;
  uint64_t v23 = [v11 interactionIdentifier];
  if (!v23
    || (uint64_t v24 = (void *)v23,
        [v11 fieldLabel],
        __int16 v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = [v25 hasPrefix:@"SFSpeech"],
        v25,
        v24,
        v26))
  {
    __int16 v27 = [MEMORY[0x1E4F29128] UUID];
    id v28 = [v27 UUIDString];
    [v11 setInteractionIdentifier:v28];
  }
  onDeviceDictationUIInteractionIdentifier = self->_onDeviceDictationUIInteractionIdentifier;
  self->_onDeviceDictationUIInteractionIdentifier = 0;

  v72 = v12;
  if (AFIsDictationRequestEligibleForOnDeviceDictation(v11))
  {
    id v30 = +[AFPreferences sharedPreferencesWithInstanceContext:self->_instanceContext];
    uint64_t v31 = [v30 offlineDictationStatus];

    if (v31)
    {
      uint64_t v32 = AFOfflineDictationStatusForLanguage(v10, v31);
      id v33 = [v32 objectForKeyedSubscript:@"Installed"];
      int v34 = [v33 BOOLValue];

      if (v34)
      {
        id v35 = [v32 objectForKeyedSubscript:@"High Quality"];
        int v36 = [v35 BOOLValue];

        int v37 = v36 ^ 1;
      }
      else
      {
        int v37 = 1;
      }
      id v38 = [v32 objectForKeyedSubscript:@"On Device Search"];
      int v39 = [v38 BOOLValue];

      if ([v11 returnKeyType] == 7) {
        int v40 = ([v11 preferOnDeviceRecognition] | v39) ^ 1;
      }
      else {
        int v40 = 0;
      }
      if (((v37 | v40) & 1) == 0)
      {
        id v41 = [v11 interactionIdentifier];
        long long v42 = self->_onDeviceDictationUIInteractionIdentifier;
        self->_onDeviceDictationUIInteractionIdentifier = v41;
      }
    }
  }
  uint64_t v43 = self->_onDeviceDictationUIInteractionIdentifier;
  if (self->_intstrumentationContext)
  {
    id v44 = objc_alloc_init(MEMORY[0x1E4FA12F0]);
    v45 = v44;
    if (v43) {
      uint64_t v46 = 1;
    }
    else {
      uint64_t v46 = 2;
    }
    [v44 setSpeechRecognitionSource:v46];
    [(AFAnalyticsTurnBasedInstrumentationContext *)self->_intstrumentationContext emitInstrumentation:v45];
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_requestIdString];
    if (v47)
    {
      v48 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v47];
      id v49 = objc_alloc_init(MEMORY[0x1E4FA1328]);
      [v49 setMteRequestId:v48];
      [(AFAnalyticsTurnBasedInstrumentationContext *)*p_intstrumentationContext emitInstrumentation:v49];
    }
  }
  +[AFAggregator logDictationStarted];
  v70 = v10;
  if (v10)
  {
    v76 = @"languageCode";
    id v77 = v10;
    uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  }
  else
  {
    uint64_t v50 = MEMORY[0x1E4F1CC08];
  }
  v67 = (void *)v50;
  v78[0] = v50;
  AFAnalyticsContextCreateWithSpeechRequestOptions(v72);
  v69 = v68 = v11;
  v78[1] = v69;
  v51 = AFAnalyticsContextCreateWithDictationOptions(v11);
  v78[2] = v51;
  v52 = AFAnalyticsContextCreateForCurrentProcess();
  v78[3] = v52;
  v74[0] = @"unixTime";
  v53 = (void *)MEMORY[0x1E4F28ED0];
  v54 = [MEMORY[0x1E4F1C9C8] date];
  [v54 timeIntervalSince1970];
  v55 = objc_msgSend(v53, "numberWithDouble:");
  v56 = self->_requestIdString;
  v75[0] = v55;
  v75[1] = v56;
  v74[1] = @"id";
  v74[2] = @"systemVersion";
  v57 = AFProductAndBuildVersion();
  v75[2] = v57;
  v74[3] = @"isOnDeviceDictationExpected";
  v58 = [MEMORY[0x1E4F28ED0] numberWithBool:v43 != 0];
  v75[3] = v58;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:4];
  v78[4] = v59;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:5];
  v61 = AFAnalyticsContextsMerge(v60);

  if (v70) {
  if (AFIsInternalInstall_onceToken != -1)
  }
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  if (AFIsInternalInstall_isInternal)
  {
    v73[0] = v61;
    v62 = v72;
    v63 = AFAnalyticsTurnContextCreateWithSpeechRequestOptions(v72);
    v73[1] = v63;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
    uint64_t v65 = AFAnalyticsContextsMerge(v64);

    v61 = (void *)v65;
  }
  else
  {
    v62 = v72;
  }
  [(AFDictationConnection *)self _sendPendingAnalyticsEvents];
  v66 = +[AFAnalytics sharedAnalytics];
  [v66 logEventWithType:2201 machAbsoluteTime:v71 context:v61];
}

- (void)cancelAvailabilityMonitoring
{
  id v3 = +[AFNetworkAvailability sharedAvailability];
  [v3 removeObserver:self];
}

- (BOOL)forcedOfflineDictationIsAvailableForLanguage:(id)a3 synchronous:(BOOL)a4
{
  id v5 = a3;
  knownOfflineInstalledLanguages = self->_knownOfflineInstalledLanguages;
  if (!knownOfflineInstalledLanguages)
  {
    os_signpost_id_t v7 = +[AFPreferences sharedPreferencesWithInstanceContext:self->_instanceContext];
    uint64_t v8 = [v7 offlineDictationStatus];
    uint64_t v9 = [v8 keysOfEntriesPassingTest:&__block_literal_global_240];
    id v10 = self->_knownOfflineInstalledLanguages;
    self->_knownOfflineInstalledLanguages = v9;

    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__AFDictationConnection_forcedOfflineDictationIsAvailableForLanguage_synchronous___block_invoke_2;
    block[3] = &unk_1E592C678;
    void block[4] = self;
    dispatch_async(internalQueue, block);
    knownOfflineInstalledLanguages = self->_knownOfflineInstalledLanguages;
  }
  id v12 = AFOfflineDictationLanguageForKeyboardLanguage(v5, knownOfflineInstalledLanguages);
  BOOL v13 = v12 != 0;

  return v13;
}

uint64_t __82__AFDictationConnection_forcedOfflineDictationIsAvailableForLanguage_synchronous___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _availabilityChanged];
}

uint64_t __82__AFDictationConnection_forcedOfflineDictationIsAvailableForLanguage_synchronous___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKey:@"Installed"];
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)forcedOfflineDictationIsAvailableForLanguage:(id)a3
{
  return [(AFDictationConnection *)self forcedOfflineDictationIsAvailableForLanguage:a3 synchronous:1];
}

- (void)_stopInputAudioPowerUpdates
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  if (inputAudioPowerUpdater)
  {
    [(AFAudioPowerUpdater *)inputAudioPowerUpdater endUpdate];
    [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater invalidate];
    id v4 = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = 0;

    uint64_t v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      os_signpost_id_t v7 = "-[AFDictationConnection _stopInputAudioPowerUpdates]";
      __int16 v8 = 2048;
      uint64_t v9 = self;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p Stopped input audio power updates.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AFDictationConnection *)self _stopInputAudioPowerUpdates];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (v4)
  {
    uint64_t v5 = [[AFAudioPowerXPCProvider alloc] initWithXPCWrapper:v4];
    int v6 = [[AFAudioPowerUpdater alloc] initWithProvider:v5 queue:self->_internalQueue frequency:0 delegate:0];
    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v6;

    [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater beginUpdate];
    __int16 v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AFDictationConnection _startInputAudioPowerUpdatesWithXPCWrapper:]";
      __int16 v11 = 2048;
      id v12 = self;
      _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p Started input audio power updates.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_extendRequestTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  [(AFDictationConnection *)self _cancelRequestTimeout];
  if (self->_hasActiveRequest)
  {
    [(AFDictationConnection *)self _scheduleRequestTimeout];
  }
}

- (void)_invokeRequestTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v3 = +[AFAnalytics sharedAnalytics];
  [v3 logEventWithType:2208 context:0];

  id v4 = [(AFDictationConnection *)self _dictationService];
  [v4 cancelSpeech];

  id v5 = +[AFError errorWithCode:1];
  [(AFDictationConnection *)self _tellSpeechDelegateRecognitionDidFail:v5];
}

- (void)_cancelRequestTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
  }
}

- (void)_scheduleRequestTimeout
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  timeoutTimer = self->_timeoutTimer;
  if (!timeoutTimer)
  {
    id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_internalQueue);
    id v5 = self->_timeoutTimer;
    self->_timeoutTimer = v4;

    int v6 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __48__AFDictationConnection__scheduleRequestTimeout__block_invoke;
    handler[3] = &unk_1E592C678;
    void handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    timeoutTimer = self->_timeoutTimer;
  }
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(timeoutTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
}

uint64_t __48__AFDictationConnection__scheduleRequestTimeout__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invokeRequestTimeout];
  id v2 = *(void **)(a1 + 32);
  return [v2 _cancelRequestTimeout];
}

- (id)_dictationServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AFDictationConnection *)self _connection];
  int v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_dictationService
{
  id v2 = [(AFDictationConnection *)self _connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  connection = self->_connection;
  if (!connection)
  {
    id v4 = [(AFInstanceContext *)self->_instanceContext createXPCConnectionWithMachServiceName:@"com.apple.assistant.dictation" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    [(AFDictationConnection *)self _registerInvalidationHandlerForXPCConnection:self->_connection];
    objc_initWeak(&location, self);
    int v6 = self->_connection;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __36__AFDictationConnection__connection__block_invoke;
    id v20 = &unk_1E592B978;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v6 setInterruptionHandler:&v17];
    dispatch_time_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v9 = dispatch_queue_create("AFDictationConnection.connection", v8);
    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", v9, v17, v18, v19, v20);
    uint64_t v10 = self->_connection;
    __int16 v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6AC8];
    [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

    id v12 = self->_connection;
    uint64_t v13 = AFDictationServiceDelegateXPCInterface();
    [(NSXPCConnection *)v12 setExportedInterface:v13];

    __int16 v14 = self->_connection;
    id v15 = [[AFDictationConnectionServiceDelegate alloc] initWithDictationConnection:self];
    [(NSXPCConnection *)v14 setExportedObject:v15];

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __36__AFDictationConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__AFDictationConnection__connection__block_invoke_2;
  v3[3] = &unk_1E592C678;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  [v2 _dispatchAsync:v3];
}

uint64_t __36__AFDictationConnection__connection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionClearedForInterruption:1];
}

- (void)_registerInvalidationHandlerForXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke;
  v5[3] = &unk_1E592B978;
  objc_copyWeak(&v6, &location);
  [v4 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[9];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke_2;
    block[3] = &unk_1E592C678;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __70__AFDictationConnection__registerInvalidationHandlerForXPCConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearConnection];
}

- (void)_clearConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  [(AFDictationConnection *)self _cancelTimerClearBuffer];
  [(AFDictationConnection *)self _connectionClearedForInterruption:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)_connectionClearedForInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    __int16 v11 = "-[AFDictationConnection _connectionClearedForInterruption:]";
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %d", (uint8_t *)&v10, 0x1Cu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_isCapturingSpeech || self->_isWaitingForAudioFile || self->_hasActiveRequest)
  {
    if (v3)
    {
      if (AFIsInternalInstall_onceToken != -1) {
        dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
      }
      if (AFIsInternalInstall_isInternal && (_connectionClearedForInterruption__hasAskedOnceForARadar & 1) == 0)
      {
        _connectionClearedForInterruption__hasAskedOnceForARadar = 1;
        dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_13696);
      }
    }
    if (self->_isCapturingSpeech || self->_hasActiveRequest)
    {
      self->_isCapturingSpeech = 0;
      if (v3) {
        uint64_t v6 = 7;
      }
      else {
        uint64_t v6 = 23;
      }
      dispatch_time_t v7 = +[AFError errorWithCode:v6];
      [(AFDictationConnection *)self _tellSpeechDelegateRecognitionDidFail:v7];
    }
    if (self->_isWaitingForAudioFile)
    {
      if (v3) {
        uint64_t v8 = 7;
      }
      else {
        uint64_t v8 = 23;
      }
      dispatch_queue_t v9 = +[AFError errorWithCode:v8];
      [(AFDictationConnection *)self _tellSpeechDelegateAudioFileFinished:0 error:v9];
    }
  }
  [(AFDictationConnection *)self _stopInputAudioPowerUpdates];
}

uint64_t __59__AFDictationConnection__connectionClearedForInterruption___block_invoke()
{
  return CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, @"Please file radar", @"Sorry internal user, assistantd crashed during dictation", @"OK");
}

- (void)_tellSpeechDelegateDidPauseRecognition
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "-[AFDictationConnection _tellSpeechDelegateDidPauseRecognition]";
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p Speech recognition is paused", buf, 0x16u);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__AFDictationConnection__tellSpeechDelegateDidPauseRecognition__block_invoke;
  v4[3] = &unk_1E5926FC8;
  v4[4] = self;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v4];
}

void __63__AFDictationConnection__tellSpeechDelegateDidPauseRecognition__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnectionDidPauseRecognition:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v10 = "-[AFDictationConnection _tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p Local speech recognizer model info: %@", buf, 0x20u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__AFDictationConnection__tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo___block_invoke;
  v7[3] = &unk_1E5926FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __82__AFDictationConnection__tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) didBeginLocalRecognitionWithModelInfo:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateLanguageDetectorDidFail:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "-[AFDictationConnection _tellSpeechDelegateLanguageDetectorDidFail:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__AFDictationConnection__tellSpeechDelegateLanguageDetectorDidFail___block_invoke;
  v7[3] = &unk_1E5926FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __68__AFDictationConnection__tellSpeechDelegateLanguageDetectorDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) languageDetectorFailedWithError:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateMultilingualSpeechRecognized:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "-[AFDictationConnection _tellSpeechDelegateMultilingualSpeechRecognized:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__AFDictationConnection__tellSpeechDelegateMultilingualSpeechRecognized___block_invoke;
  v7[3] = &unk_1E5926FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __73__AFDictationConnection__tellSpeechDelegateMultilingualSpeechRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) didRecognizeMultilingualSpeech:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateLanguageDetected:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[AFDictationConnection _tellSpeechDelegateLanguageDetected:confidenceScores:isConfident:]";
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__AFDictationConnection__tellSpeechDelegateLanguageDetected_confidenceScores_isConfident___block_invoke;
  v13[3] = &unk_1E5927130;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v13];
}

void __90__AFDictationConnection__tellSpeechDelegateLanguageDetected_confidenceScores_isConfident___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    [v3 dictationConnection:*(void *)(a1 + 32) didDetectLanguage:*(void *)(a1 + 40) confidenceScores:*(void *)(a1 + 48) isConfident:*(unsigned __int8 *)(a1 + 56)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 dictationConnection:*(void *)(a1 + 32) didDetectLanguage:*(void *)(a1 + 40) confidenceScores:*(void *)(a1 + 48)];
  }
}

- (void)_tellSpeechDelegateSearchResultsReceived:(id)a3 recognitionText:(id)a4 stable:(BOOL)a5 final:(BOOL)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[AFDictationConnection _tellSpeechDelegateSearchResultsReceived:recognitionText:stable:final:]";
    _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__AFDictationConnection__tellSpeechDelegateSearchResultsReceived_recognitionText_stable_final___block_invoke;
  v15[3] = &unk_1E5927108;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  BOOL v18 = a5;
  BOOL v19 = a6;
  id v13 = v11;
  id v14 = v10;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v15];
}

void __95__AFDictationConnection__tellSpeechDelegateSearchResultsReceived_recognitionText_stable_final___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) didReceiveSearchResults:*(void *)(a1 + 40) recognizedText:*(void *)(a1 + 48) stable:*(unsigned __int8 *)(a1 + 56) final:*(unsigned __int8 *)(a1 + 57)];
  }
}

- (void)_tellSpeechDelegateAudioFileFinished:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_isWaitingForAudioFile)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__AFDictationConnection__tellSpeechDelegateAudioFileFinished_error___block_invoke;
    v8[3] = &unk_1E5927018;
    void v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v8];
    self->_isWaitingForAudioFile = 0;
  }
}

void __68__AFDictationConnection__tellSpeechDelegateAudioFileFinished_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:a1[4] didFinishWritingAudioFile:a1[5] error:a1[6]];
  }
}

- (void)_tellSpeechDelegateSpeechRecognitionDidSucceed
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[AFDictationConnection _tellSpeechDelegateSpeechRecognitionDidSucceed]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(AFDictationConnection *)self _willCompleteDictation];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__AFDictationConnection__tellSpeechDelegateSpeechRecognitionDidSucceed__block_invoke;
  v4[3] = &unk_1E5926FC8;
  v4[4] = self;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v4];
}

void __71__AFDictationConnection__tellSpeechDelegateSpeechRecognitionDidSucceed__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnectionSpeechRecognitionDidSucceed:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDictationConnection _tellSpeechDelegateRecognitionDidFail:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(AFDictationConnection *)self _willFailDictationWithError:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AFDictationConnection__tellSpeechDelegateRecognitionDidFail___block_invoke;
  v7[3] = &unk_1E5926FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __63__AFDictationConnection__tellSpeechDelegateRecognitionDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) speechRecognitionDidFail:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateDidRecognizeTranscriptionObjects:(id)a3 languageModel:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeTranscriptionObjects:languageModel:]";
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(AFDictationConnection *)self _willCompleteDictation];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__AFDictationConnection__tellSpeechDelegateDidRecognizeTranscriptionObjects_languageModel___block_invoke;
  v11[3] = &unk_1E5927018;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v11];
}

void __91__AFDictationConnection__tellSpeechDelegateDidRecognizeTranscriptionObjects_languageModel___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:a1[4] didRecognizeTranscriptionObjects:a1[5] languageModel:a1[6]];
  }
}

- (void)_tellSpeechDelegateDidProcessAudioDuration:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__AFDictationConnection__tellSpeechDelegateDidProcessAudioDuration___block_invoke;
  v3[3] = &unk_1E59270E0;
  void v3[4] = self;
  *(double *)&v3[5] = a3;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v3];
}

void __68__AFDictationConnection__tellSpeechDelegateDidProcessAudioDuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) didProcessAudioDuration:*(double *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateDidRecognizePartialSpeechPackage:(id)a3 nluResult:(id)a4 languageModel:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizePartialSpeechPackage:nluResult:languageModel:]";
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__AFDictationConnection__tellSpeechDelegateDidRecognizePartialSpeechPackage_nluResult_languageModel___block_invoke;
  v15[3] = &unk_1E59270B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v15];
}

uint64_t __101__AFDictationConnection__tellSpeechDelegateDidRecognizePartialSpeechPackage_nluResult_languageModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _delegateDidRecognizePartialSpeechPackage:*(void *)(a1 + 40) nluResult:*(void *)(a1 + 48) languageModel:*(void *)(a1 + 56) delegate:a2];
}

- (void)_tellSpeechDelegateDidRecognizeSpeechTokens:(id)a3 nluResult:(id)a4 languageModel:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeSpeechTokens:nluResult:languageModel:]";
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechTokens_nluResult_languageModel___block_invoke;
  v15[3] = &unk_1E59270B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v15];
}

uint64_t __93__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechTokens_nluResult_languageModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _delegateDidRecognizeSpeechTokens:*(void *)(a1 + 40) nluResult:*(void *)(a1 + 48) languageModel:*(void *)(a1 + 56) delegate:a2];
}

- (void)_tellSpeechDelegateDidRecognizePartialResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke;
  v6[3] = &unk_1E5926FF0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) language];
  id v5 = (void *)[v4 copy];

  id v6 = [*(id *)(a1 + 32) tokens];
  uint64_t v7 = [v6 count];

  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizePartialResult:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    int v26 = v5;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %@ - %@", buf, 0x20u);
  }
  id v10 = +[AFAnalytics sharedAnalytics];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke_73;
  id v18 = &unk_1E5927090;
  uint64_t v20 = v7;
  id v11 = v5;
  id v19 = v11;
  [v10 logEventWithType:2214 contextProvider:&v15];

  id v12 = *(unsigned char **)(a1 + 40);
  if (v12[59] || (v13 = objc_opt_respondsToSelector(), id v12 = *(unsigned char **)(a1 + 40), (v13 & 1) == 0))
  {
    id v14 = objc_msgSend(*(id *)(a1 + 32), "af_tokens", v15, v16, v17, v18);
    [v12 _delegateDidRecognizeSpeechTokens:v14 nluResult:0 languageModel:v11 delegate:v3];
  }
  else
  {
    objc_msgSend(v3, "dictationConnection:didRecognizePartialResult:", *(void *)(a1 + 40), *(void *)(a1 + 32), v15, v16, v17, v18);
  }
}

id __70__AFDictationConnection__tellSpeechDelegateDidRecognizePartialResult___block_invoke_73(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKey:@"tokensCount"];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:@"languageModel"];
  }
  return v2;
}

- (void)_delegateDidRecognizePartialSpeechPackage:(id)a3 nluResult:(id)a4 languageModel:(id)a5 delegate:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    id v17 = "-[AFDictationConnection _delegateDidRecognizePartialSpeechPackage:nluResult:languageModel:delegate:]";
    _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v16, 0xCu);
  }
  if (self->_shouldClassifyIntent || self->_shouldRecognizeCommands) && (objc_opt_respondsToSelector())
  {
    [v13 dictationConnection:self didRecognizePartialPackage:v10 nluResult:v11 languageModel:v12];
  }
  else
  {
    uint64_t v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      id v17 = "-[AFDictationConnection _delegateDidRecognizePartialSpeechPackage:nluResult:languageModel:delegate:]";
      _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s No opt-in to command recognition, intent classification or no partial package delegate callback implemented. Dropping.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_delegateDidRecognizeSpeechTokens:(id)a3 nluResult:(id)a4 languageModel:(id)a5 delegate:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[AFDictationConnection _delegateDidRecognizeSpeechTokens:nluResult:languageModel:delegate:]";
    _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_recognizingIncrementally && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v30 = self;
    id v31 = v12;
    id v32 = v11;
    uint64_t v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[AFDictationConnection _delegateDidRecognizeSpeechTokens:nluResult:languageModel:delegate:]";
      _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s Recognizing incrementally.", buf, 0xCu);
    }
    int v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v10;
    uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v22 = objc_alloc_init(AFSpeechInterpretation);
          uint64_t v39 = v21;
          __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
          [(AFSpeechInterpretation *)v22 setTokens:v23];

          uint64_t v24 = [AFSpeechPhrase alloc];
          id v38 = v22;
          __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
          int v26 = [(AFSpeechPhrase *)v24 initWithInterpretations:v25 isLowConfidence:0];
          [v16 addObject:v26];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v18);
    }

    *(void *)buf = 0;
    uint64_t v27 = DeltaPhrases(v16, v30->_previouslyRecognizedPhrases, buf);
    id v12 = v31;
    [v13 dictationConnection:v30 didRecognizePhrases:v27 languageModel:v31 correctionIdentifier:0 replacingPreviousPhrasesCount:*(void *)buf];
    uint64_t v28 = [v16 copy];
    previouslyRecognizedPhrases = v30->_previouslyRecognizedPhrases;
    v30->_previouslyRecognizedPhrases = (NSArray *)v28;

    id v11 = v32;
  }
  else if (self->_shouldClassifyIntent || self->_shouldRecognizeCommands) && (objc_opt_respondsToSelector())
  {
    [v13 dictationConnection:self didRecognizeTokens:v10 nluResult:v11 languageModel:v12];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v13 dictationConnection:self didRecognizeTokens:v10 languageModel:v12];
  }
}

- (void)_tellSpeechDelegateDidRecognizeSpeechPhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 languageModel:(id)a8 correctionIdentifier:(id)a9 audioAnalytics:(id)a10
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  uint64_t v24 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v44 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeSpeechPhrases:rawPhrases:utterances:rawUtterances:nluRe"
          "sult:languageModel:correctionIdentifier:audioAnalytics:]";
    _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (!self->_isDetectingUtterances) {
    [(AFDictationConnection *)self _willCompleteDictation];
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke;
  v33[3] = &unk_1E5927068;
  id v34 = v16;
  id v35 = v18;
  id v36 = v17;
  id v37 = v19;
  id v38 = v23;
  uint64_t v39 = self;
  id v40 = v21;
  id v41 = v22;
  id v42 = v20;
  id v25 = v20;
  id v26 = v22;
  id v27 = v21;
  id v28 = v23;
  id v29 = v19;
  id v30 = v17;
  id v31 = v18;
  id v32 = v16;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v33];
}

void __166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke_2;
  v15[3] = &unk_1E5927040;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  uint64_t v4 = (void (**)(void))MEMORY[0x19F3A50D0](v15);
  uint64_t v5 = *(void *)(a1 + 72);
  if (*(unsigned char *)(v5 + 59))
  {
    char v6 = objc_opt_respondsToSelector();
    uint64_t v5 = *(void *)(a1 + 72);
    if (v6)
    {
      uint64_t v14 = 0;
      uint64_t v7 = DeltaPhrases(*(void **)(a1 + 32), *(void **)(v5 + 152), &v14);
      [v3 dictationConnection:*(void *)(a1 + 72) didRecognizePhrases:v7 languageModel:*(void *)(a1 + 80) correctionIdentifier:*(void *)(a1 + 88) replacingPreviousPhrasesCount:v14];
      uint64_t v8 = [*(id *)(a1 + 32) copy];
      uint64_t v9 = *(void *)(a1 + 72);
      id v10 = *(void **)(v9 + 152);
      *(void *)(v9 + 152) = v8;

LABEL_10:
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)(v5 + 60) || *(unsigned char *)(v5 + 61)) && (objc_opt_respondsToSelector())
  {
    uint64_t v11 = *(void *)(a1 + 72);
    id v12 = v4[2](v4);
    [v3 dictationConnection:v11 didRecognizePackage:v12 nluResult:*(void *)(a1 + 96)];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = *(void *)(a1 + 72);
      uint64_t v7 = v4[2](v4);
      [v3 dictationConnection:v13 didRecognizePackage:v7];
      goto LABEL_10;
    }
    if (objc_opt_respondsToSelector()) {
      [v3 dictationConnection:*(void *)(a1 + 72) didRecognizePhrases:*(void *)(a1 + 32) languageModel:*(void *)(a1 + 80) correctionIdentifier:*(void *)(a1 + 88)];
    }
  }
LABEL_11:
}

AFSpeechPackage *__166__AFDictationConnection__tellSpeechDelegateDidRecognizeSpeechPhrases_rawPhrases_utterances_rawUtterances_nluResult_languageModel_correctionIdentifier_audioAnalytics___block_invoke_2(uint64_t a1)
{
  id v2 = [[AFSpeechRecognition alloc] initWithPhrases:*(void *)(a1 + 32) utterances:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) count] && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    id v3 = [[AFSpeechRecognition alloc] initWithPhrases:*(void *)(a1 + 48) utterances:*(void *)(a1 + 56)];
    uint64_t v4 = [AFSpeechPackage alloc];
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = [AFSpeechPackage alloc];
  }
  id v3 = (AFSpeechRecognition *)[(AFSpeechRecognition *)v2 copy];
LABEL_7:
  uint64_t v5 = [(AFSpeechPackage *)v4 initWithRecognition:v2 rawRecognition:v3 audioAnalytics:*(void *)(a1 + 64) isFinal:1 utteranceStart:0.0];

  return v5;
}

- (void)_tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage:nluResult:]";
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__AFDictationConnection__tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke;
  v11[3] = &unk_1E5927018;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v11];
}

void __95__AFDictationConnection__tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:a1[4] didRecognizeVoiceCommandCandidatePackage:a1[5] nluResult:a1[6]];
  }
}

- (void)_tellSpeechDelegateDidRecognizeFinalResultCandidatePackage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizeFinalResultCandidatePackage:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__AFDictationConnection__tellSpeechDelegateDidRecognizeFinalResultCandidatePackage___block_invoke;
  v7[3] = &unk_1E5926FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __84__AFDictationConnection__tellSpeechDelegateDidRecognizeFinalResultCandidatePackage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) didRecognizeFinalResultCandidatePackage:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateDidRecognizePackage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDictationConnection _tellSpeechDelegateDidRecognizePackage:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(AFDictationConnection *)self _willCompleteDictation];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__AFDictationConnection__tellSpeechDelegateDidRecognizePackage___block_invoke;
  v7[3] = &unk_1E5926FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __64__AFDictationConnection__tellSpeechDelegateDidRecognizePackage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 59) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v15 = 0;
    id v4 = [*(id *)(a1 + 40) recognition];
    uint64_t v5 = [v4 phrases];
    id v6 = DeltaPhrases(v5, *(void **)(*(void *)(a1 + 32) + 152), &v15);

    [v3 dictationConnection:*(void *)(a1 + 32) didRecognizePhrases:v6 languageModel:&stru_1EEE35D28 correctionIdentifier:0 replacingPreviousPhrasesCount:v15];
    id v7 = [*(id *)(a1 + 40) recognition];
    id v8 = [v7 phrases];
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 152);
    *(void *)(v10 + 152) = v9;
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 dictationConnection:*(void *)(a1 + 32) didRecognizePackage:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [*(id *)(a1 + 40) recognition];
    uint64_t v14 = [v13 phrases];
    [v3 dictationConnection:v12 didRecognizePhrases:v14 languageModel:&stru_1EEE35D28 correctionIdentifier:0];
  }
}

- (void)_tellSpeechDelegateRecordingDidFail:(id)a3
{
  id v4 = a3;
  [(AFDictationConnection *)self _willFailDictationWithError:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__AFDictationConnection__tellSpeechDelegateRecordingDidFail___block_invoke;
  v6[3] = &unk_1E5926FF0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __61__AFDictationConnection__tellSpeechDelegateRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnection:*(void *)(a1 + 32) speechRecordingDidFail:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingDidCancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__AFDictationConnection__tellSpeechDelegateRecordingDidCancel__block_invoke;
  v2[3] = &unk_1E5926FC8;
  v2[4] = self;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v2];
}

void __62__AFDictationConnection__tellSpeechDelegateRecordingDidCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnectionSpeechRecordingDidCancel:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingDidEnd
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__AFDictationConnection__tellSpeechDelegateRecordingDidEnd__block_invoke;
  v2[3] = &unk_1E5926FC8;
  v2[4] = self;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v2];
}

void __59__AFDictationConnection__tellSpeechDelegateRecordingDidEnd__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnectionSpeechRecordingDidEnd:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingDidBeginWithOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[AFDictationConnection _tellSpeechDelegateRecordingDidBeginWithOptions:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  self->_isDetectingUtterances = [v4 detectUtterances];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__AFDictationConnection__tellSpeechDelegateRecordingDidBeginWithOptions___block_invoke;
  v7[3] = &unk_1E5926FF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __73__AFDictationConnection__tellSpeechDelegateRecordingDidBeginWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 dictationConnection:*(void *)(a1 + 32) speechRecordingDidBeginWithOptions:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 dictationConnectionSpeechRecordingDidBegin:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingWillBegin
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__AFDictationConnection__tellSpeechDelegateRecordingWillBegin__block_invoke;
  v2[3] = &unk_1E5926FC8;
  v2[4] = self;
  [(AFDictationConnection *)self _dispatchCallbackGroupBlock:v2];
}

void __62__AFDictationConnection__tellSpeechDelegateRecordingWillBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dictationConnectionSpeechRecordingWillBegin:*(void *)(a1 + 32)];
  }
}

void __53__AFDictationConnection__dispatchCallbackGroupBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

- (void)_dispatchAsync:(id)a3
{
}

- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (v3 && self->_isCapturingSpeech)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[AFDictationConnection _checkAndSetIsCapturingSpeech:]";
      _os_log_fault_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_FAULT, "%s Trying to start speech capture while we are already capturing. This is a client app logic error, cancelling dictation", buf, 0xCu);
    }
    id v6 = [(AFDictationConnection *)self _dictationService];
    [v6 cancelSpeech];

    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    uint64_t v11 = @"Trying to start speech capture while we are already capturing. This is a client app logic error, cancelling dictation";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"kAFAssistantErrorDomain" code:205 userInfo:v8];
    [(AFDictationConnection *)self _tellSpeechDelegateRecordingDidFail:v9];

    self->_isCapturingSpeech = 0;
  }
  else
  {
    [(AFDictationConnection *)self _stopInputAudioPowerUpdates];
    self->_isCapturingSpeech = v3;
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSXPCConnection *)self->_connection invalidate];
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[AFDictationConnection dealloc]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFDictationConnection;
  [(AFDictationConnection *)&v4 dealloc];
}

+ (void)fetchSupportedLanguageCodes:(id)a3
{
  id v3 = a3;
  if (AFDictationCapable_onceToken != -1)
  {
    id v7 = v3;
    dispatch_once(&AFDictationCapable_onceToken, &__block_literal_global_76_45529);
    id v3 = v7;
  }
  if (AFDictationCapable_isCapable)
  {
    if (!v3) {
      goto LABEL_9;
    }
    id v6 = v3;
    objc_super v4 = AFPreferencesSupportedDictationLanguages();
    id v5 = (void (*)(void))*((void *)v6 + 2);
  }
  else
  {
    if (!v3) {
      goto LABEL_9;
    }
    id v6 = v3;
    objc_super v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:400 userInfo:0];
    id v5 = (void (*)(void))*((void *)v6 + 2);
  }
  v5();

  id v3 = v6;
LABEL_9:
}

+ (BOOL)dictationIsEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  if ([v2 dictationIsEnabled])
  {
    int v3 = AFDictationRestricted() ^ 1;
  }
  else
  {
    objc_super v4 = +[AFPreferences sharedPreferences];
    if ([v4 assistantIsEnabled]) {
      int v3 = AFDictationRestricted() ^ 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (BOOL)languageDetectorIsEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  if ([v2 isLanguageDetectorEnabled]) {
    char v3 = [v2 isLanguageDetectorEnabledByServer];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

+ (void)getForcedOfflineDictationSupportedLanguagesWithCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.assistant.dictation" options:0];
  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6AC8];
  [v4 setRemoteObjectInterface:v5];

  [v4 resume];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke;
  v14[3] = &unk_1E5929680;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  id v16 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke_243;
  v11[3] = &unk_1E592C008;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 getInstalledOfflineLanguagesWithCompletion:v11];
}

void __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "+[AFDictationConnection getForcedOfflineDictationSupportedLanguagesWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Offline language fetch failed: %@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __83__AFDictationConnection_getForcedOfflineDictationSupportedLanguagesWithCompletion___block_invoke_243(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

- (void)sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__AFDictationConnection_Private__sendEngagementFeedback_voiceQueryIdentifier___block_invoke;
  v8[3] = &unk_1E592B3C0;
  id v9 = v6;
  int64_t v10 = a3;
  void v8[4] = self;
  id v7 = v6;
  [(AFDictationConnection *)self _dispatchAsync:v8];
}

void __78__AFDictationConnection_Private__sendEngagementFeedback_voiceQueryIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 _sendEngagementFeedback:*(void *)(a1 + 48) voiceQueryIdentifier:*(void *)(a1 + 40)];
}

- (void)startDictationWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4 options:(id)a5 forLanguage:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __101__AFDictationConnection_Private__startDictationWithSpeechFileAtURL_isNarrowBand_options_forLanguage___block_invoke;
  v16[3] = &unk_1E5927310;
  BOOL v20 = a4;
  v16[4] = self;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  [(AFDictationConnection *)self _dispatchAsync:v16];
}

void __101__AFDictationConnection_Private__startDictationWithSpeechFileAtURL_isNarrowBand_options_forLanguage___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = *(unsigned char *)(a1 + 64);
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = [*(id *)(a1 + 40) forceOfflineRecognition];
  *(unsigned char *)(*(void *)(a1 + 32) + 59) = [*(id *)(a1 + 40) incremental];
  *(unsigned char *)(*(void *)(a1 + 32) + 60) = [*(id *)(a1 + 40) shouldClassifyIntent];
  *(unsigned char *)(*(void *)(a1 + 32) + 61) = [*(id *)(a1 + 40) shouldRecognizeCommands];
  [*(id *)(a1 + 32) _checkAndSetIsCapturingSpeech:1];
  id v2 = [*(id *)(a1 + 32) _dictationService];
  [v2 _startDictationWithURL:*(void *)(a1 + 48) isNarrowBand:*(unsigned __int8 *)(a1 + 64) language:*(void *)(a1 + 56) options:*(void *)(a1 + 40)];
}

- (void)startDictationWithSpeechFileAtURL:(id)a3 options:(id)a4 forLanguage:(id)a5
{
}

- (void)preheatTestWithLanguage:(id)a3 options:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[AFDictationConnection(Private) preheatTestWithLanguage:options:]";
    __int16 v17 = 2048;
    id v18 = self;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AFDictationConnection_Private__preheatTestWithLanguage_options___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

void __66__AFDictationConnection_Private__preheatTestWithLanguage_options___block_invoke(uint64_t a1)
{
  id v2 = +[AFAnalytics sharedAnalytics];
  [v2 logEventWithType:2225 context:0];

  id v3 = [*(id *)(a1 + 32) _dictationService];
  [v3 preheatTestWithLanguage:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

@end