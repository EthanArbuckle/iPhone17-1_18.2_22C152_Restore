@interface ADRequestDispatcherService
- (ADRequestDispatcherService)init;
- (ADRequestDispatcherService)initWithBridgeConnectionListeners:(id)a3;
- (ADRequestDispatcherService)initWithRequestDispatcher:(id)a3;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_getDefaultAssistantIdForAssistantId:(id)a3;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)sanitizeVoiceTriggerEventInfo:(id)a3;
- (void)_logPowerContextForRequest:(id)a3;
- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4;
- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)endDictationSessionWithAssistantId:(id)a3;
- (void)endSessionWithAssistantId:(id)a3;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4;
- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6;
- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5;
- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6;
- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4;
- (void)requestFailedWithAssistantId:(id)a3 requestId:(id)a4;
- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7;
- (void)startCorrectionSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8;
- (void)startDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6;
- (void)startDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5 shouldClassifyIntent:(BOOL)a6 understandingOnDevice:(BOOL)a7;
- (void)startDirectActionRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 directAction:(id)a7 requestExecutionParameters:(id)a8 requestContextData:(id)a9;
- (void)startLocalRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6;
- (void)startSessionIfNeededWithConfiguration:(id)a3;
- (void)startSessionWithConfiguration:(id)a3;
- (void)startSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8;
- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10;
- (void)startTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)startUnderstandingOnServerRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5;
- (void)startUnderstandingOnServerTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12;
@end

@implementation ADRequestDispatcherService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_defaultDictationAssistantId, 0);
  objc_storeStrong((id *)&self->_requestDispatcher, 0);
}

- (id)sanitizeVoiceTriggerEventInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    +[NSMutableDictionary dictionary];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10021E0F4;
    v8[3] = &unk_100507340;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
    id v6 = [v5 copy];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5
{
}

- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6
{
}

- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10
{
}

- (id)_getDefaultAssistantIdForAssistantId:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  defaultDictationAssistantId = self->_defaultDictationAssistantId;
  if (defaultDictationAssistantId)
  {
    v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      v13 = "-[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]";
      __int16 v14 = 2112;
      v15 = defaultDictationAssistantId;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Using defaultDictationAssistantId since assistantId it is not nil %@", (uint8_t *)&v12, 0x16u);
      defaultDictationAssistantId = self->_defaultDictationAssistantId;
    }
    v8 = defaultDictationAssistantId;
    goto LABEL_7;
  }
  if (v4)
  {
    v8 = (NSString *)v4;
LABEL_7:
    id v9 = v8;
    goto LABEL_8;
  }
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    v13 = "-[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]";
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Processing dictation request without an assistantId and defaultDictationAssistantId is also nil. This is unexpected (did Assistant + Siri was disabled during request?), request will likely timeout", (uint8_t *)&v12, 0xCu);
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4
{
  id v6 = [(ADRequestDispatcherService *)self _getDefaultAssistantIdForAssistantId:a3];
  if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher announceNotificationHandlingStateUpdatedWithAssistantId:v6 toState:a4];
  }
  else
  {
    v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADRequestDispatcherService announceNotificationHandlingStateUpdatedWithAssistantId:toState:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s SRD has not implemented announceNotificationHandlingStateUpdatedWithAssistantId:toState: yet. Ignoring", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12
{
  id v27 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = [(ADRequestDispatcherService *)self _getDefaultAssistantIdForAssistantId:a3];
  if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher updateVoiceCommandContextWithAssistantId:v26 requestId:v27 prefixText:v18 postfixText:v19 selectedText:v20 disambiguationActive:v21 cursorInVisibleText:v22 favorCommandSuppression:v23 abortCommandSuppression:v24 undoEvent:v25];
  }
  else if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher updateVoiceCommandContextWithAssistantId:v26 requestId:v27 prefixText:v18 postfixText:v19 selectedText:v20 disambiguationActive:v21 cursorInVisibleText:v22 favorCommandSuppression:v23 abortCommandSuppression:v24];
  }
}

- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(ADRequestDispatcherService *)self _getDefaultAssistantIdForAssistantId:a3];
  if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher resumeDictationRecognitionWithAssistantId:v16 requestId:v12 prefixText:v13 postfixText:v14 selectedText:v15];
  }
  else
  {
    v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      id v19 = "-[ADRequestDispatcherService resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selectedText:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s SRD has not implemented resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selected yet. Ignoring", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4
{
  id v6 = a4;
  v7 = [(ADRequestDispatcherService *)self _getDefaultAssistantIdForAssistantId:a3];
  if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher pauseDictationRecognitionWithAssistantId:v7 requestId:v6];
  }
  else
  {
    int v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[ADRequestDispatcherService pauseDictationRecognitionWithAssistantId:requestId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s SRD has not implemented pauseDictationRecognitionWithAssistantId:requestId: yet. Ignoring", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)endDictationSessionWithAssistantId:(id)a3
{
  id v4 = [(ADRequestDispatcherService *)self _getDefaultAssistantIdForAssistantId:a3];
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    int v9 = "-[ADRequestDispatcherService endDictationSessionWithAssistantId:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Clearing defaultDictationAssistantId at the end of dictation session", (uint8_t *)&v8, 0xCu);
  }
  defaultDictationAssistantId = self->_defaultDictationAssistantId;
  self->_defaultDictationAssistantId = 0;

  if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher endDictationSessionWithAssistantId:v4];
  }
  else
  {
    v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      int v9 = "-[ADRequestDispatcherService endDictationSessionWithAssistantId:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s SRD has not implemented endDictationSessionWithAssistantId yet.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)startDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(ADRequestDispatcherService *)self _getDefaultAssistantIdForAssistantId:a3];
  if (![v12 shouldClassifyIntent])
  {
    if (objc_opt_respondsToSelector())
    {
      [(AFRequestDispatcher *)self->_requestDispatcher startSpeechDictationRequestWithAssistantId:v13 requestId:v10 inputOrigin:v11 dictationOptions:v12];
      goto LABEL_9;
    }
    id v14 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v16 = 136315138;
    v17 = "-[ADRequestDispatcherService startDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:]";
    id v15 = "%s SRD has not implemented startSpeechDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions: "
          "yet. Request will have undefined behavior (will likely timeout)";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v14 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v16 = 136315138;
    v17 = "-[ADRequestDispatcherService startDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:]";
    id v15 = "%s SRD has not implemented startUnderstandingDictationRequestWithAssistantId:requestId:inputOrigin:dictationOp"
          "tions: yet. Request will have undefined behavior (will likely timeout)";
    goto LABEL_11;
  }
  [(AFRequestDispatcher *)self->_requestDispatcher startUnderstandingDictationRequestWithAssistantId:v13 requestId:v10 inputOrigin:v11 dictationOptions:v12];
LABEL_9:
}

- (void)startDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5 shouldClassifyIntent:(BOOL)a6 understandingOnDevice:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = (NSString *)a3;
  id v13 = a4;
  defaultDictationAssistantId = self->_defaultDictationAssistantId;
  if (v12)
  {
    if (defaultDictationAssistantId)
    {
      id v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 136315138;
        id v26 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldC"
              "lassifyIntent:understandingOnDevice:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Starting a dictation session but defaultDictationAssistantId is not nil, was endSession for last session called? Resetting defaultDictationAssistantId to nil, SRD will end previous session automatically", (uint8_t *)&v25, 0xCu);
        defaultDictationAssistantId = self->_defaultDictationAssistantId;
      }
      self->_defaultDictationAssistantId = 0;
    }
  }
  else
  {
    if (defaultDictationAssistantId)
    {
      int v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136315394;
        id v26 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldC"
              "lassifyIntent:understandingOnDevice:]";
        __int16 v27 = 2112;
        v28 = defaultDictationAssistantId;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Starting dictation session without an assistantId but defaultDictationAssistantId is not nil %@. This is unexpected, but still creating a new defaultDictationAssistantId", (uint8_t *)&v25, 0x16u);
      }
    }
    v17 = +[NSUUID UUID];
    int v18 = [v17 UUIDString];
    id v19 = [v18 stringByAppendingString:@"-defaultDictationAssistantId"];
    id v20 = self->_defaultDictationAssistantId;
    self->_defaultDictationAssistantId = v19;

    id v12 = self->_defaultDictationAssistantId;
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v24 = self->_defaultDictationAssistantId;
      int v25 = 136315394;
      id v26 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldCla"
            "ssifyIntent:understandingOnDevice:]";
      __int16 v27 = 2112;
      v28 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s Created a new default assistantId for dictation %@", (uint8_t *)&v25, 0x16u);
    }
  }
  if (!v8)
  {
    if (objc_opt_respondsToSelector())
    {
      [(AFRequestDispatcher *)self->_requestDispatcher startSpeechDictationSessionWithAssistantId:v12 languageCode:v13 recognitionOnDevice:v9];
      goto LABEL_19;
    }
    id v22 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v25 = 136315138;
    id v26 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldClass"
          "ifyIntent:understandingOnDevice:]";
    id v23 = "%s SRD has not implemented startSpeechDictationSessionWithAssistantId:languageCode:recognitionOnDevice: yet. R"
          "equest will have undefined behavior (will likely timeout)";
LABEL_21:
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v25, 0xCu);
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v22 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v25 = 136315138;
    id v26 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldClass"
          "ifyIntent:understandingOnDevice:]";
    id v23 = "%s SRD has not implemented startUnderstandingDictationSessionWithAssistantId:languageCode:understandingOnDevic"
          "e: yet. Request will have undefined behavior (will likely timeout)";
    goto LABEL_21;
  }
  [(AFRequestDispatcher *)self->_requestDispatcher startUnderstandingDictationSessionWithAssistantId:v12 languageCode:v13 understandingOnDevice:v7];
LABEL_19:
}

- (void)endSessionWithAssistantId:(id)a3
{
}

- (void)startSessionWithConfiguration:(id)a3
{
}

- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6
{
}

- (void)startSessionIfNeededWithConfiguration:(id)a3
{
  id v4 = a3;
  requestDispatcher = self->_requestDispatcher;
  id v6 = [v4 assistantId];
  unsigned __int8 v7 = [(AFRequestDispatcher *)requestDispatcher sessionExistsForAssistantId:v6];

  BOOL v8 = (void *)AFSiriLogContextDaemon;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      id v10 = v8;
      id v11 = [v4 assistantId];
      int v14 = 136315394;
      id v15 = "-[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]";
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s session for assistantId: %@ exists not creating one", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      id v12 = v8;
      id v13 = [v4 assistantId];
      int v14 = 136315394;
      id v15 = "-[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]";
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s session for assistantId: %@ not exists creating one", (uint8_t *)&v14, 0x16u);
    }
    [(ADRequestDispatcherService *)self startSessionWithConfiguration:v4];
  }
}

- (void)startUnderstandingOnServerTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [(ADRequestDispatcherService *)self startSessionIfNeededWithConfiguration:v16];
  requestDispatcher = self->_requestDispatcher;
  id v18 = [v16 assistantId];

  [(AFRequestDispatcher *)requestDispatcher startUnderstandingOnServerTextRequestWithAssistantId:v18 requestId:v15 inputOrigin:v14 utterance:v13 requestContextData:v12];
}

- (void)startTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [(ADRequestDispatcherService *)self startSessionIfNeededWithConfiguration:v16];
  requestDispatcher = self->_requestDispatcher;
  id v18 = [v16 assistantId];

  [(AFRequestDispatcher *)requestDispatcher startTextRequestWithAssistantId:v18 requestId:v15 inputOrigin:v14 utterance:v13 requestContextData:v12];
}

- (void)startDirectActionRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 directAction:(id)a7 requestExecutionParameters:(id)a8 requestContextData:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  [(ADRequestDispatcherService *)self startSessionIfNeededWithConfiguration:v22];
  requestDispatcher = self->_requestDispatcher;
  id v24 = [v22 assistantId];

  [(AFRequestDispatcher *)requestDispatcher startDirectActionRequestWithAssistantId:v24 requestId:v21 inputOrigin:v20 utterance:v19 directAction:v18 requestExecutionParameters:v17 requestContextData:v16];
}

- (void)startUnderstandingOnServerRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(ADRequestDispatcherService *)self startSessionIfNeededWithConfiguration:v10];
  requestDispatcher = self->_requestDispatcher;
  id v12 = [v10 assistantId];

  [(AFRequestDispatcher *)requestDispatcher startUnderstandingOnServerRequestWithAssistantId:v12 requestId:v9 inputOrigin:v8];
}

- (void)startCorrectionSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8
{
  requestDispatcher = self->_requestDispatcher;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [a3 assistantId];
  [(AFRequestDispatcher *)requestDispatcher startCorrectionSpeechRequestWithAssistantId:v19 requestId:v18 inputOrigin:v17 utterance:v16 previousUtterance:v15 requestContextData:v14];
}

- (void)startLocalRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6
{
  requestDispatcher = self->_requestDispatcher;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 assistantId];
  [(AFRequestDispatcher *)requestDispatcher startLocalRequestWithAssistantId:v13 requestId:v12 inputOrigin:v11 requestContextData:v10];
}

- (void)startSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  [(ADRequestDispatcherService *)self startSessionIfNeededWithConfiguration:v18];
  requestDispatcher = self->_requestDispatcher;
  id v20 = [v18 assistantId];

  [(AFRequestDispatcher *)requestDispatcher startSpeechRequestWithAssistantId:v20 requestId:v17 inputOrigin:v16 location:v15 asrOnServer:v8 requestContextData:v14];
}

- (void)_logPowerContextForRequest:(id)a3
{
  id v3 = [(AFPowerContextClient *)self->_powerContext currentPowerPolicyWithError:0];
  id v4 = AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      id v16 = v4;
      id v17 = [v3 description];
      int v18 = 136315394;
      id v19 = "-[ADRequestDispatcherService _logPowerContextForRequest:]";
      __int16 v20 = 2112;
      id v21 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Power context policy exists: %@", (uint8_t *)&v18, 0x16u);
    }
    if (AFIsInternalInstall())
    {
      id v6 = AFSiriLogContextPower;
      os_signpost_id_t v7 = os_signpost_id_generate(AFSiriLogContextPower);
      if (v7 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_15;
      }
      os_signpost_id_t v8 = v7;
      if (!os_signpost_enabled(v6)) {
        goto LABEL_15;
      }
      unsigned int v9 = [v3 thermalMitigationLevel];
      int v18 = 67109120;
      LODWORD(v19) = v9;
      id v10 = "%d";
      id v11 = v6;
      os_signpost_id_t v12 = v8;
      uint32_t v13 = 8;
LABEL_14:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, v12, "ThermalMitigationLevel", v10, (uint8_t *)&v18, v13);
LABEL_15:
    }
  }
  else
  {
    if (v5)
    {
      int v18 = 136315138;
      id v19 = "-[ADRequestDispatcherService _logPowerContextForRequest:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Power context policy is nil", (uint8_t *)&v18, 0xCu);
    }
    if (AFIsInternalInstall())
    {
      id v6 = AFSiriLogContextPower;
      os_signpost_id_t v14 = os_signpost_id_generate(AFSiriLogContextPower);
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_15;
      }
      os_signpost_id_t v15 = v14;
      if (!os_signpost_enabled(v6)) {
        goto LABEL_15;
      }
      LOWORD(v18) = 0;
      id v10 = "UNKNOWN";
      id v11 = v6;
      os_signpost_id_t v12 = v15;
      uint32_t v13 = 2;
      goto LABEL_14;
    }
  }
}

- (void)requestFailedWithAssistantId:(id)a3 requestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher requestFailedWithAssistantId:v6 requestId:v7];
  }
  else
  {
    os_signpost_id_t v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      id v10 = "-[ADRequestDispatcherService requestFailedWithAssistantId:requestId:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s SRD has not implemented requestFailedWithAssistantId:requestId: yet, failling back to cancelRequestWithAssistantId:requestId:reason", (uint8_t *)&v9, 0xCu);
    }
    [(AFRequestDispatcher *)self->_requestDispatcher cancelRequestWithAssistantId:v6 requestId:v7 reason:3];
  }
  [(ADRequestDispatcherService *)self _logPowerContextForRequest:v7];
}

- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4
{
  requestDispatcher = self->_requestDispatcher;
  id v7 = a4;
  [(AFRequestDispatcher *)requestDispatcher requestCompletedWithAssistantId:a3 requestId:v7];
  [(ADRequestDispatcherService *)self _logPowerContextForRequest:v7];
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_signpost_id_t v14 = (void (**)(void, void, void))v13;
  requestDispatcher = self->_requestDispatcher;
  if (requestDispatcher)
  {
    id v16 = [v12 info];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10021FBB4;
    v18[3] = &unk_10050CF00;
    id v19 = v14;
    [(AFRequestDispatcher *)requestDispatcher handleCommand:v10 executionContextInfo:v16 reply:v18];
  }
  else if (v13)
  {
    id v17 = +[AFError errorWithCode:44];
    ((void (**)(void, void, void *))v14)[2](v14, 0, v17);
  }
}

- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315650;
    os_signpost_id_t v15 = "-[ADRequestDispatcherService cancelOperationsForRequestID:forAssistantID:fromRemote:reason:]";
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s request Id: %@, from remote: %d", (uint8_t *)&v14, 0x1Cu);
  }
  if (objc_opt_respondsToSelector())
  {
    [(AFRequestDispatcher *)self->_requestDispatcher cancelRequestWithAssistantId:v11 requestId:v10 reason:a6];
  }
  else
  {
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      os_signpost_id_t v15 = "-[ADRequestDispatcherService cancelOperationsForRequestID:forAssistantID:fromRemote:reason:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s SRD has not implemented cancelRequestWithAssistantId:requestId:reason: yet, failing back to cancelRequestWithAssistantId:requestId:", (uint8_t *)&v14, 0xCu);
    }
    [(AFRequestDispatcher *)self->_requestDispatcher cancelRequestWithAssistantId:v11 requestId:v10];
  }
  [(ADRequestDispatcherService *)self _logPowerContextForRequest:v10];
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return [(AFRequestDispatcher *)self->_requestDispatcher implementsCommand:a3 forDomain:a4];
}

- (id)commandsForDomain:(id)a3
{
  return [(AFRequestDispatcher *)self->_requestDispatcher commandsForDomain:a3];
}

- (id)domains
{
  return [(AFRequestDispatcher *)self->_requestDispatcher domains];
}

- (ADRequestDispatcherService)initWithRequestDispatcher:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADRequestDispatcherService;
  id v6 = [(ADRequestDispatcherService *)&v11 init];
  BOOL v7 = v6;
  if (v6)
  {
    [(ADService *)v6 setIdentifier:@"RequestDispatcherService"];
    objc_storeStrong((id *)&v7->_requestDispatcher, a3);
    uint64_t v8 = objc_opt_new();
    powerContext = v7->_powerContext;
    v7->_powerContext = (AFPowerContextClient *)v8;
  }
  return v7;
}

- (ADRequestDispatcherService)initWithBridgeConnectionListeners:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)SRDRequestDispatcher);
  char v6 = objc_opt_respondsToSelector();
  id v7 = v5;
  uint64_t v8 = objc_alloc_init(ADRequestDispatcherServiceHelper);
  if (v6) {
    id v9 = [v7 initWithRequestDispatcherServiceHelper:v8 bridgeConnectionListeners:v4];
  }
  else {
    id v9 = [v7 initWithRequestDispatcherServiceHelper:v8];
  }
  id v10 = v9;

  objc_super v11 = [(ADRequestDispatcherService *)self initWithRequestDispatcher:v10];
  return v11;
}

- (ADRequestDispatcherService)init
{
  id v3 = objc_alloc_init((Class)NSArray);
  id v4 = [(ADRequestDispatcherService *)self initWithBridgeConnectionListeners:v3];

  return v4;
}

@end