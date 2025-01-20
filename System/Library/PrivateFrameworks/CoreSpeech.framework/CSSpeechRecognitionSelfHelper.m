@interface CSSpeechRecognitionSelfHelper
- (BOOL)_isNonTier1Message:(id)a3;
- (BOOL)_isTier1LoggingAllowedForCurrentRequestWithTask:(id)a3;
- (BOOL)isSamplingForDictation;
- (BOOL)isTier1LoggingAllowedForCurrentRequest;
- (CSSpeechRecognitionSelfHelper)initWithAsrId:(id)a3 taskName:(id)a4 isSamplingForDictation:(BOOL)a5;
- (NSString)taskName;
- (NSUUID)asrId;
- (void)logAssistantSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5;
- (void)logDictationSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5;
- (void)logSampledAudioFileStoredSuccessfully;
- (void)logSampledAudioFileStoredWithError:(id)a3;
- (void)logSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5;
- (void)setAsrId:(id)a3;
- (void)setIsSamplingForDictation:(BOOL)a3;
- (void)setIsTier1LoggingAllowedForCurrentRequest:(BOOL)a3;
- (void)setTaskName:(id)a3;
- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4;
@end

@implementation CSSpeechRecognitionSelfHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setIsTier1LoggingAllowedForCurrentRequest:(BOOL)a3
{
  self->_isTier1LoggingAllowedForCurrentRequest = a3;
}

- (BOOL)isTier1LoggingAllowedForCurrentRequest
{
  return self->_isTier1LoggingAllowedForCurrentRequest;
}

- (void)setTaskName:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setIsSamplingForDictation:(BOOL)a3
{
  self->_isSamplingForDictation = a3;
}

- (BOOL)isSamplingForDictation
{
  return self->_isSamplingForDictation;
}

- (void)setAsrId:(id)a3
{
}

- (NSUUID)asrId
{
  return self->_asrId;
}

- (void)logDictationSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    id v9 = objc_alloc((Class)NSMutableDictionary);
    v34[0] = v7;
    v10 = +[NSDate date];
    [v10 timeIntervalSince1970];
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v34[1] = v11;
    v33[2] = @"samplingDate";
    uint64_t v12 = +[AFDictationSamplingUtilities samplingDateAsString];
    v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_100254530;
    }
    v34[2] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    id v16 = [v9 initWithDictionary:v15];

    if (a3 == 1)
    {
      if (v8)
      {
        v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
        [v16 setObject:v19 forKeyedSubscript:@"errorCode"];

        uint64_t v20 = [v8 domain];
        v21 = (void *)v20;
        if (v20) {
          CFStringRef v22 = (const __CFString *)v20;
        }
        else {
          CFStringRef v22 = &stru_100254530;
        }
        [v16 setObject:v22 forKeyedSubscript:@"errorDomain"];

        uint64_t v23 = [v8 localizedDescription];
        v24 = (void *)v23;
        if (v23) {
          CFStringRef v25 = (const __CFString *)v23;
        }
        else {
          CFStringRef v25 = @"UNDEFINED";
        }
        [v16 setObject:v25 forKeyedSubscript:@"description"];

        v26 = [v8 userInfo];
        v27 = [v26 objectForKey:NSUnderlyingErrorKey];

        if (v27)
        {
          v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v27 code]);
          [v16 setObject:v28 forKeyedSubscript:@"underlyingErrorCode"];

          uint64_t v29 = [v27 domain];
          v30 = (void *)v29;
          if (v29) {
            CFStringRef v31 = (const __CFString *)v29;
          }
          else {
            CFStringRef v31 = &stru_100254530;
          }
          [v16 setObject:v31 forKeyedSubscript:@"underlyingErrorDomain"];
        }
      }
      CFStringRef v17 = @"failed";
    }
    else if (a3)
    {
      CFStringRef v17 = &stru_100254530;
    }
    else
    {
      CFStringRef v17 = @"success";
    }
    [v16 setObject:v17 forKeyedSubscript:@"status"];
    v32 = +[AFAnalytics sharedAnalytics];
    [v32 logEventWithType:2224 context:v16];
  }
  else
  {
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSSpeechRecognitionSelfHelper logDictationSamplingEventStatus:requestId:error:]";
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Unable to log sampling event since requestId is nil", buf, 0xCu);
    }
  }
}

- (BOOL)_isNonTier1Message:(id)a3
{
  id v3 = a3;
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v19, v18, v17, v16, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t v14 = objc_opt_class();

  LOBYTE(v3) = [v13 containsObject:v14];
  return (char)v3;
}

- (BOOL)_isTier1LoggingAllowedForCurrentRequestWithTask:(id)a3
{
  uint64_t v3 = CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;
  uint64_t v4 = CoreEmbeddedSpeechRecognizerTaskSiriDictation;
  uint64_t v5 = CoreEmbeddedSpeechRecognizerTaskBeto;
  uint64_t v6 = CoreEmbeddedSpeechRecognizerTaskBetoDictation;
  id v7 = a3;
  uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, 0);
  uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CoreEmbeddedSpeechRecognizerTaskDictation, CoreEmbeddedSpeechRecognizerTaskWebSearch, 0);
  unsigned __int8 v10 = [v8 containsObject:v7];
  LODWORD(v4) = [v9 containsObject:v7];

  uint64_t v11 = +[AFPreferences sharedPreferences];
  LOBYTE(v5) = [v11 isDictationHIPAACompliant];

  uint64_t v12 = +[AFPreferences sharedPreferences];
  id v13 = [v12 siriDataSharingOptInStatus];

  char v14 = (v13 == (id)1) & ~(_BYTE)v5;
  if (!v4) {
    char v14 = v10;
  }
  if (v10) {
    BOOL v15 = v10;
  }
  else {
    BOOL v15 = v14;
  }

  return v15;
}

- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(CSSpeechRecognitionSelfHelper *)self _isNonTier1Message:v6];
  BOOL isTier1LoggingAllowedForCurrentRequest = self->_isTier1LoggingAllowedForCurrentRequest;
  int v10 = objc_opt_respondsToSelector();
  if ((v8 & 1) != 0 || isTier1LoggingAllowedForCurrentRequest)
  {
    if (!isTier1LoggingAllowedForCurrentRequest && ((v10 ^ 1) & 1) == 0) {
      ((void (*)(id, const char *))[v6 methodForSelector:"deleteLinkId"])(v6, "deleteLinkId");
    }
    id v11 = objc_alloc_init((Class)ASRSchemaASRClientEventMetadata);
    id v12 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_asrId];
    [v11 setAsrId:v12];
    id v13 = objc_alloc_init((Class)ASRSchemaASRClientEvent);
    [v13 setEventMetadata:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 setPreheatContext:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 setRequestContext:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v13 setPartialResultGenerated:v6];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v13 setPackageGenerated:v6];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v13 setRecognitionResultTier1:v6];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v13 setFinalResultGenerated:v6];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v13 setIntermediateUtteranceInfoTier1:v6];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v13 setInitializationContext:v6];
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v13 setAssetLoadContext:v6];
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v13 setLanguageModelEnrollmentContext:v6];
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v13 setJitLanguageModelEnrollmentEndedTier1:v6];
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [v13 setAudioPacketArrivalContext:v6];
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              [v13 setFirstAudioPacketProcessed:v6];
                            }
                            else
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                [v13 setFinalAudioPacketContainingSpeechReceived:v6];
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  [v13 setSampledAudioFileStored:v6];
                                }
                                else
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    [v13 setSampledAudioFileStorageFailed:v6];
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      [v13 setAppleNeuralEngineCompilationContext:v6];
                                    }
                                    else
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        [v13 setEmbeddedSpeechProcessContext:v6];
                                      }
                                      else
                                      {
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          [v13 setActiveConfigUpdateContext:v6];
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            [v13 setAppleNeuralEngineModelInitializationContext:v6];
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              [v13 setAudioSpeechPacketArrivalContext:v6];
                                            }
                                            else
                                            {
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                [v13 setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:v6];
                                              }
                                              else
                                              {
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  [v13 setFrameProcessingReady:v6];
                                                }
                                                else
                                                {
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    [v13 setLeadingSilenceProcessed:v6];
                                                  }
                                                  else
                                                  {
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      [v13 setFirstSecondAfterLeadingSilenceProcessed:v6];
                                                    }
                                                    else
                                                    {
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        [v13 setFirstAudioPacketRecorded:v6];
                                                      }
                                                      else
                                                      {
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                        {
                                                          uint64_t v20 = CSLogContextFacilityCoreSpeech;
                                                          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
                                                          {
                                                            int v21 = 136315138;
                                                            CFStringRef v22 = "-[CSSpeechRecognitionSelfHelper wrapAndEmitTopLevelEve"
                                                                  "nt:timestampInTicks:]";
                                                            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggable message type in the ASR SELF schema.", (uint8_t *)&v21, 0xCu);
                                                          }
                                                          goto LABEL_66;
                                                        }
                                                        [v13 setAudioPacketContainingEndOfFirstWordReadyUpstream:v6];
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    char v14 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v14;
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      int v21 = 136315394;
      CFStringRef v22 = "-[CSSpeechRecognitionSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]";
      __int16 v23 = 2112;
      v24 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s SELF: Wrapping and logging an event of type %@", (uint8_t *)&v21, 0x16u);
    }
    BOOL v15 = +[AssistantSiriAnalytics sharedStream];
    uint64_t v16 = v15;
    if (v7) {
      objc_msgSend(v15, "emitMessage:timestamp:", v13, objc_msgSend(v7, "unsignedLongLongValue"));
    }
    else {
      [v15 emitMessage:v13];
    }

LABEL_66:
  }
}

- (void)logSampledAudioFileStoredWithError:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init((Class)ASRSchemaASRSampledAudioFileStorageFailed);
  if (v13)
  {
    uint64_t v5 = [v13 domain];
    if ([v5 isEqualToString:CSErrorDomain]
      && (unint64_t)[v13 code] >= 0x92F)
    {
      id v6 = [v13 code];

      if ((unint64_t)v6 <= 0x932)
      {
        unint64_t v7 = (unint64_t)[v13 code] - 2351;
        if (v7 > 3) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = dword_1001AC740[v7];
        }
        [v4 setSampledAudioStorageFailureReason:v8];
        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_msgSend(v4, "setErrorCode:", objc_msgSend(v13, "code"));
    uint64_t v9 = [v13 domain];
    [v4 setErrorDomain:v9];

    int v10 = [v13 userInfo];
    id v11 = [v10 objectForKey:NSUnderlyingErrorKey];

    if (v11)
    {
      objc_msgSend(v4, "setUnderlyingErrorCode:", objc_msgSend(v11, "code"));
      id v12 = [v11 domain];
      [v4 setUnderlyingErrorDomain:v12];
    }
  }
LABEL_11:
  [(CSSpeechRecognitionSelfHelper *)self wrapAndEmitTopLevelEvent:v4 timestampInTicks:0];
}

- (void)logSampledAudioFileStoredSuccessfully
{
  id v3 = objc_alloc_init((Class)ASRSchemaASRSampledAudioFileStored);
  [v3 setExists:1];
  [(CSSpeechRecognitionSelfHelper *)self wrapAndEmitTopLevelEvent:v3 timestampInTicks:0];
}

- (void)logAssistantSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5
{
  if (a3) {
    -[CSSpeechRecognitionSelfHelper logSampledAudioFileStoredWithError:](self, "logSampledAudioFileStoredWithError:");
  }
  else {
    [(CSSpeechRecognitionSelfHelper *)self logSampledAudioFileStoredSuccessfully];
  }
}

- (void)logSamplingEventStatus:(unint64_t)a3 requestId:(id)a4 error:(id)a5
{
  if (self->_isSamplingForDictation) {
    [(CSSpeechRecognitionSelfHelper *)self logDictationSamplingEventStatus:a3 requestId:a4 error:a5];
  }
  else {
    [(CSSpeechRecognitionSelfHelper *)self logAssistantSamplingEventStatus:a3 requestId:a4 error:a5];
  }
}

- (CSSpeechRecognitionSelfHelper)initWithAsrId:(id)a3 taskName:(id)a4 isSamplingForDictation:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSSpeechRecognitionSelfHelper;
  id v11 = [(CSSpeechRecognitionSelfHelper *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asrId, a3);
    objc_storeStrong((id *)&v12->_taskName, a4);
    v12->_isSamplingForDictation = a5;
    v12->_BOOL isTier1LoggingAllowedForCurrentRequest = [(CSSpeechRecognitionSelfHelper *)v12 _isTier1LoggingAllowedForCurrentRequestWithTask:v10];
  }

  return v12;
}

@end