@interface ESSelfHelper
+ (id)createANEModelInitializationEndedEventWithTimeStamp:(id)a3 fileName:(id)a4;
+ (id)createANEModelInitializationStartedEventWithTimeStamp:(id)a3 fileName:(id)a4;
+ (id)createPreheatEndedEventWithPreheatAlreadyDone:(BOOL)a3;
+ (id)createPreheatFailedEvent;
+ (id)createPreheatStartedOrChangedEvent;
+ (void)_logRequestLinkWithRequestId:(id)a3 asrId:(id)a4;
+ (void)initializeSharedPowerLoggerIfNeeded;
+ (void)logPowerSnapshotForProcessEnded;
+ (void)logPowerSnapshotForProcessStarted;
- (BOOL)_isLoggingAllowedForCurrentRequestWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4;
- (BOOL)_isNonTier1Message:(id)a3;
- (BOOL)_isTier1LoggingAllowedForCurrentRequestWithTask:(id)a3;
- (BOOL)continuousListeningEnabled;
- (ESSelfHelper)initWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4 requestId:(id)a5 language:(id)a6 asrId:(id)a7;
- (NSNumber)personalizedLmAgeInSec;
- (NSNumber)personalizedLmWeight;
- (NSString)recognitionTask;
- (NSString)unrepairedPostItn;
- (NSUUID)asrId;
- (NSUUID)requestId;
- (void)logActiveConfigUpdateEnded;
- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAppleNeuralEngineModelInitializationEnded;
- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3;
- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logESStartWithTimeInTicks:(id)a3;
- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalResultGeneratedWithEARPackage:(id)a3 correctAlignedPartialResultIndexList:(id)a4;
- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logFirstAudioPacketProcessed;
- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3;
- (void)logFrameProcessingReady;
- (void)logInitializationEndedIsSpeechRecognizerCreated:(BOOL)a3;
- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4;
- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4 unrepairedPostItn:(id)a5 loggableSharedUserId:(id)a6;
- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4;
- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3;
- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logLeadingSilenceProcessedWithTimestampInTicks:(id)a3;
- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4;
- (void)logPartialResultGenerated;
- (void)logPendingANEModelInitializationContextEvents:(id)a3;
- (void)logPendingPreheatContextEvents:(id)a3;
- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3;
- (void)logPostSpeechStartOneSecondAudioProcessedWithTimestampInTicks:(id)a3;
- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 totalITNDurationInNs:(id)a22 totalITNRuns:(id)a23 totalSecondaryPassDurationInNs:(id)a24 totalSecondaryPasses:(id)a25 cpuInstructionsInMillionsPerSecond:(id)a26 aneUsed:(id)a27;
- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12;
- (void)logSampledAudioFileStoredSuccessfully;
- (void)logSampledAudioFileStoredWithError:(id)a3 customFailureReason:(int64_t)a4;
- (void)setContinuousListeningEnabled:(BOOL)a3;
- (void)setPersonalizedLmAgeInSec:(id)a3;
- (void)setPersonalizedLmWeight:(id)a3;
- (void)setUnrepairedPostItn:(id)a3;
- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4;
@end

@implementation ESSelfHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedLmAgeInSec, 0);
  objc_storeStrong((id *)&self->_personalizedLmWeight, 0);
  objc_storeStrong((id *)&self->_unrepairedPostItn, 0);
  objc_storeStrong((id *)&self->_emojiUtils, 0);
  objc_storeStrong((id *)&self->_recognitionTask, 0);
  objc_storeStrong((id *)&self->_requestId, 0);

  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setContinuousListeningEnabled:(BOOL)a3
{
  self->_continuousListeningEnabled = a3;
}

- (BOOL)continuousListeningEnabled
{
  return self->_continuousListeningEnabled;
}

- (void)setPersonalizedLmAgeInSec:(id)a3
{
}

- (NSNumber)personalizedLmAgeInSec
{
  return self->_personalizedLmAgeInSec;
}

- (void)setPersonalizedLmWeight:(id)a3
{
}

- (NSNumber)personalizedLmWeight
{
  return self->_personalizedLmWeight;
}

- (void)setUnrepairedPostItn:(id)a3
{
}

- (NSString)unrepairedPostItn
{
  return self->_unrepairedPostItn;
}

- (NSString)recognitionTask
{
  return self->_recognitionTask;
}

- (NSUUID)requestId
{
  return self->_requestId;
}

- (NSUUID)asrId
{
  return self->_asrId;
}

- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init((Class)AIMLExperimentationAnalyticsManager);
    if (([v4 containsObject:@"PeopleSuggesterTop20"] & 1) != 0
      || [v4 containsObject:@"NoBoosting"])
    {
      id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"043fda7b-2fc0-489e-8cce-319c22dcf3ba"];
      [v5 emitTriggerForCodePathID:v6 requestID:self->_requestId completionHandler:&stru_100050B08];

      v7 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 136315394;
        v11 = "-[ESSelfHelper logPersonalizationExperimentTriggersForExperimentIds:]";
        __int16 v12 = 2112;
        CFStringRef v13 = @"043fda7b-2fc0-489e-8cce-319c22dcf3ba";
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s SELF: Emitting trigger log for Contact Boosting (codePathId=%@)", (uint8_t *)&v10, 0x16u);
      }
    }
    if (([v4 containsObject:@"RandomSongTitleSelection"] & 1) != 0
      || [v4 containsObject:@"PlayCountSongTitleSelection"])
    {
      id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"eb18055e-87c4-44c2-ab94-9275bec61c52"];
      [v5 emitTriggerForCodePathID:v8 requestID:self->_requestId completionHandler:&stru_100050B08];

      v9 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 136315394;
        v11 = "-[ESSelfHelper logPersonalizationExperimentTriggersForExperimentIds:]";
        __int16 v12 = 2112;
        CFStringRef v13 = @"eb18055e-87c4-44c2-ab94-9275bec61c52";
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s SELF: Emitting trigger log for Music Ranking Strategy (codePathId=%@)", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)wrapAndEmitTopLevelEvent:(id)a3 timestampInTicks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(ESSelfHelper *)self _isNonTier1Message:v6];
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
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          [v13 setAudioPacketContainingEndOfFirstWordReadyUpstream:v6];
                                                        }
                                                        else
                                                        {
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            [v13 setFirstAudioPacketReadyUpstream:v6];
                                                          }
                                                          else
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                            {
                                                              v20 = AFSiriLogContextSpeech;
                                                              if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
                                                              {
                                                                int v21 = 136315138;
                                                                v22 = "-[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]";
                                                                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggable message type in the ASR SELF schema.", (uint8_t *)&v21, 0xCu);
                                                              }
                                                              goto LABEL_70;
                                                            }
                                                            [v13 setFinalAudioPacketContainingSpeechReadyUpstream:v6];
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
      }
    }
    v14 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      v17 = v14;
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      int v21 = 136315394;
      v22 = "-[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]";
      __int16 v23 = 2112;
      v24 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s SELF: Wrapping and logging an event of type %@", (uint8_t *)&v21, 0x16u);
    }
    v15 = +[AssistantSiriAnalytics sharedStream];
    v16 = v15;
    if (v7) {
      objc_msgSend(v15, "emitMessage:timestamp:", v13, objc_msgSend(v7, "unsignedLongLongValue"));
    }
    else {
      [v15 emitMessage:v13];
    }

LABEL_70:
  }
}

- (void)logSampledAudioFileStoredWithError:(id)a3 customFailureReason:(int64_t)a4
{
  id v12 = a3;
  id v6 = objc_alloc_init((Class)ASRSchemaASRSampledAudioFileStorageFailed);
  if (v12)
  {
    objc_msgSend(v6, "setErrorCode:", objc_msgSend(v12, "code"));
    id v7 = [v12 domain];
    [v6 setErrorDomain:v7];

    unsigned __int8 v8 = [v12 userInfo];
    v9 = [v8 objectForKey:NSUnderlyingErrorKey];

    if (v9)
    {
      objc_msgSend(v6, "setUnderlyingErrorCode:", objc_msgSend(v9, "code"));
      int v10 = [v9 domain];
      [v6 setUnderlyingErrorDomain:v10];
    }
  }
  else
  {
    if ((unint64_t)(a4 - 1) < 4) {
      uint64_t v11 = a4;
    }
    else {
      uint64_t v11 = 0;
    }
    [v6 setSampledAudioStorageFailureReason:v11];
  }
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v6 timestampInTicks:0];
}

- (void)logSampledAudioFileStoredSuccessfully
{
  id v3 = objc_alloc_init((Class)ASRSchemaASRSampledAudioFileStored);
  [v3 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v3 timestampInTicks:0];
}

- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 totalITNDurationInNs:(id)a22 totalITNRuns:(id)a23 totalSecondaryPassDurationInNs:(id)a24 totalSecondaryPasses:(id)a25 cpuInstructionsInMillionsPerSecond:(id)a26 aneUsed:(id)a27
{
  id v97 = a3;
  id v99 = a4;
  id v85 = a5;
  id v102 = a6;
  id v86 = a7;
  id v100 = a8;
  id v101 = a9;
  id v87 = a10;
  id v88 = a13;
  id v89 = a14;
  id v90 = a15;
  id v98 = a16;
  id v91 = a17;
  id v92 = a21;
  id v93 = a22;
  id v94 = a23;
  id v81 = a24;
  id v83 = a25;
  id v95 = a26;
  id v96 = a27;
  id v32 = objc_alloc_init((Class)ASRSchemaASRRecognitionMetrics);
  personalizedLmAgeInSec = self->_personalizedLmAgeInSec;
  v103 = v32;
  if (personalizedLmAgeInSec)
  {
    [(NSNumber *)personalizedLmAgeInSec doubleValue];
    v35 = +[NSNumber numberWithDouble:v34 * 1000000000.0];
    objc_msgSend(v32, "setPersonalizedLanguageModelAgeInNs:", objc_msgSend(v35, "unsignedLongLongValue"));
  }
  personalizedLmWeight = self->_personalizedLmWeight;
  if (personalizedLmWeight)
  {
    [(NSNumber *)personalizedLmWeight floatValue];
    objc_msgSend(v32, "setPersonalizedLanguageModelWeight:");
  }
  if (v85)
  {
    [v85 floatValue];
    objc_msgSend(v32, "setAverageActiveTokensPerFrame:");
  }
  if (v86)
  {
    [v86 floatValue];
    objc_msgSend(v32, "setSignalToNoiseRatioInDecibels:");
  }
  if (v100)
  {
    [v100 doubleValue];
    v38 = +[NSNumber numberWithDouble:v37 * 1000000000.0];
    objc_msgSend(v32, "setRecognitionDurationInNs:", objc_msgSend(v38, "unsignedLongLongValue"));
  }
  if (v101)
  {
    [v101 doubleValue];
    v40 = +[NSNumber numberWithDouble:v39 * 1000000.0];
    objc_msgSend(v32, "setAudioDurationInNs:", objc_msgSend(v40, "unsignedLongLongValue"));
  }
  if (v87) {
    objc_msgSend(v32, "setEagerEnabled:", objc_msgSend(v87, "BOOLValue"));
  }
  if (v88)
  {
    [v88 floatValue];
    objc_msgSend(v32, "setCpuRealTimeFactor:");
  }
  if (v89)
  {
    [v89 floatValue];
    [v32 setNumLanguageModelEnrollmentDataStreams:v41];
  }
  if (v96)
  {
    if ([v96 BOOLValue]) {
      uint64_t v42 = 2;
    }
    else {
      uint64_t v42 = 1;
    }
  }
  else
  {
    uint64_t v42 = 0;
  }
  objc_msgSend(v32, "setRecognitionHardware:", v42, v81);
  [v32 setUtteranceDetectionEnabled:a11];
  [v32 setUtteranceConcatenationEnabled:a12];
  [v32 setContinuousListeningEnabled:self->_continuousListeningEnabled];
  [v32 setPhoneticMatchDecoderName:v90];
  objc_msgSend(v32, "setInverseTextNormalizationDurationForFinalResultInNs:", objc_msgSend(v91, "unsignedLongLongValue"));
  objc_msgSend(v32, "setInverseTextNormalizationDurationInNs:", objc_msgSend(v93, "unsignedLongLongValue"));
  objc_msgSend(v32, "setNumberOfInverseTextNormalizationRuns:", objc_msgSend(v94, "unsignedIntValue"));
  [v95 doubleValue];
  [v32 setCpuInstructionsInMillionsPerSecond:(unint64_t)v43];
  id v44 = objc_alloc_init((Class)ASRSchemaASREmojiMetrics);
  [v44 setIsEmojiPersonalizationUsed:a18];
  [v44 setIsEmojiDisambiguationUsed:a19];
  [v44 setIsEmojiExpectedButNotRecognized:a20];
  [v44 setRecognizedEmojis:v92];
  v84 = v44;
  [v32 setEmojiMetrics:v44];
  if (v99)
  {
    v45 = [v99 componentsSeparatedByString:@"::"];
    id v46 = objc_alloc_init((Class)ASRSchemaASRRecognizerComponents);
    v47 = [v45 objectAtIndexedSubscript:0];
    [v46 setFrontend:v47];

    v48 = [v45 objectAtIndexedSubscript:1];
    [v46 setDecoder:v48];

    v49 = [v45 objectAtIndexedSubscript:2];
    [v46 setDecodable:v49];

    [v32 setRecognizerComponents:v46];
  }
  if (v102)
  {
    id v50 = objc_alloc_init((Class)NSMutableArray);
    [v102 componentsSeparatedByString:@";"];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v51 = [obj countByEnumeratingWithState:&v110 objects:v115 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v111;
      do
      {
        for (i = 0; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v111 != v52) {
            objc_enumerationMutation(obj);
          }
          v54 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          id v55 = objc_alloc_init((Class)ASRSchemaASRInterpolationWeightBundle);
          v56 = [v54 componentsSeparatedByString:@":"];
          v57 = [v56 objectAtIndexedSubscript:1];
          [v57 doubleValue];
          v58 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

          v59 = [v56 objectAtIndexedSubscript:2];
          [v59 doubleValue];
          v60 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

          [v58 doubleValue];
          v62 = +[NSNumber numberWithDouble:v61 * 1000000.0];
          objc_msgSend(v55, "setStartTimeInNs:", objc_msgSend(v62, "unsignedLongLongValue"));

          [v60 doubleValue];
          v64 = +[NSNumber numberWithDouble:v63 * 1000000.0];
          objc_msgSend(v55, "setEndTimeInNs:", objc_msgSend(v64, "unsignedLongLongValue"));

          v65 = [v56 objectAtIndexedSubscript:0];
          v66 = [v65 componentsSeparatedByString:@","];

          v67 = [v66 valueForKey:@"floatValue"];
          [v55 setWeights:v67];

          [v50 addObject:v55];
        }
        id v51 = [obj countByEnumeratingWithState:&v110 objects:v115 count:16];
      }
      while (v51);
    }

    [v103 setLanguageModelInterpolationWeights:v50];
  }
  if (v98)
  {
    v68 = +[NSMutableArray array];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v69 = v98;
    id v70 = [v69 countByEnumeratingWithState:&v106 objects:v114 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v107;
      do
      {
        for (j = 0; j != v70; j = (char *)j + 1)
        {
          if (*(void *)v107 != v71) {
            objc_enumerationMutation(v69);
          }
          [*(id *)(*((void *)&v106 + 1) + 8 * (void)j) doubleValue];
          v74 = +[NSNumber numberWithDouble:v73 * 1000000000.0];
          [v68 addObject:v74];
        }
        id v70 = [v69 countByEnumeratingWithState:&v106 objects:v114 count:16];
      }
      while (v70);
    }

    [v103 setPausedAudioDurationsInNs:v68];
  }
  id v75 = objc_alloc_init((Class)ASRSchemaASRRequestContext);
  if (!v97)
  {
    if (self->_packageLogged)
    {
      id v76 = objc_alloc_init((Class)ASRSchemaASREnded);
      [v76 setMetrics:v103];
      [v75 setEnded:v76];
      v77 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFra"
               "me:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationM"
               "s:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:p"
               "honeticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUs"
               "ed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassD"
               "urationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
        v78 = "%s SELF: Logging ASRRequestContext->ended in SELF based on success status from recognizer.";
        goto LABEL_59;
      }
    }
    else
    {
      id v76 = objc_alloc_init((Class)ASRSchemaASRCancelled);
      [v76 setReason:3];
      [v76 setMetrics:v103];
      [v75 setCancelled:v76];
      v77 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFra"
               "me:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationM"
               "s:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:p"
               "honeticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUs"
               "ed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassD"
               "urationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
        v78 = "%s SELF: Logging ASRRequestContext->cancelled with reason RECOGNITION_REJECTED in SELF because nothing was"
              " recognized (SpeechNoMatch).";
        goto LABEL_59;
      }
    }
LABEL_60:

    goto LABEL_61;
  }
  if (![v97 code])
  {
    id v76 = objc_alloc_init((Class)ASRSchemaASRFailed);
    [v76 setMetrics:v103];
    [v75 setFailed:v76];
    v77 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame"
             ":languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:ea"
             "gerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneti"
             "cMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmo"
             "jiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInN"
             "s:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      v78 = "%s SELF: Logging ASRRequestContext->failed in SELF based on error result from recognizer.";
      goto LABEL_59;
    }
    goto LABEL_60;
  }
  if ([v97 code] == (id)2)
  {
    id v76 = objc_alloc_init((Class)ASRSchemaASRCancelled);
    [v76 setReason:2];
    [v76 setMetrics:v103];
    [v75 setCancelled:v76];
    v77 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame"
             ":languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:ea"
             "gerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneti"
             "cMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmo"
             "jiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInN"
             "s:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      v78 = "%s SELF: Logging ASRRequestContext->cancelled with reason RECOGNITION_CANCELLED in SELF based on error resul"
            "t from recognizer.";
LABEL_59:
      _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, v78, buf, 0xCu);
      goto LABEL_60;
    }
    goto LABEL_60;
  }
  if ([v97 code] == (id)3)
  {
    id v76 = objc_alloc_init((Class)ASRSchemaASRCancelled);
    [v76 setReason:3];
    [v76 setMetrics:v103];
    [v75 setCancelled:v76];
    v77 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame"
             ":languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:ea"
             "gerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneti"
             "cMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmo"
             "jiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInN"
             "s:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      v78 = "%s SELF: Logging ASRRequestContext->cancelled with reason RECOGNITION_REJECTED in SELF based on error result"
            " from recognizer.";
      goto LABEL_59;
    }
    goto LABEL_60;
  }
LABEL_61:
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v75 timestampInTicks:0];
  v79 = [(id)qword_10005D9A8 captureSnapshot];
  v80 = +[SPIAsrRequestEndedOrFailedOrCancelledEventContext context];
  [v79 logWithEventContext:v80 asrIdentifier:self->_asrId];
}

- (void)logFinalResultGeneratedWithEARPackage:(id)a3 correctAlignedPartialResultIndexList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)ASRSchemaASRFinalResultGenerated);
  unsigned __int8 v8 = [v5 correctPartialResultIndexList];
  [v7 setCorrectPartialResultIndexLists:v8];

  v40 = v7;
  float v41 = v6;
  [v7 setCorrectAlignedPartialResultIndexLists:v6];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v11 = [v5 preITNRecognition];
  id v12 = [v11 oneBest];

  id v13 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v17 silenceStart];
        double v19 = v18;
        [v5 utteranceStart];
        int v21 = +[NSNumber numberWithDouble:v19 + v20];
        [v9 addObject:v21];

        [v17 silenceStart];
        double v23 = v22;
        [v5 utteranceStart];
        v25 = +[NSNumber numberWithDouble:v23 + v24];
        [v25 doubleValue];
        v27 = +[NSNumber numberWithDouble:v26 * 1000000000.0];
        [v10 addObject:v27];
      }
      id v14 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v14);
  }

  [v40 setTokenSilenceStartTimeInNsLists:v10];
  objc_msgSend(v40, "setIsAfterResume:", objc_msgSend(v5, "firstResultAfterResume"));
  v28 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    log = v28;
    v31 = [v5 correctPartialResultIndexList];
    id v37 = [v31 componentsJoinedByString:@","];
    id v32 = [v37 UTF8String];
    id v33 = [v41 componentsJoinedByString:@","];
    id v34 = [v33 UTF8String];
    id v35 = [v9 componentsJoinedByString:@","];
    id v36 = [v35 UTF8String];
    *(_DWORD *)buf = 136315906;
    v47 = "-[ESSelfHelper logFinalResultGeneratedWithEARPackage:correctAlignedPartialResultIndexList:]";
    __int16 v48 = 2080;
    id v49 = v32;
    __int16 v50 = 2080;
    id v51 = v34;
    __int16 v52 = 2080;
    id v53 = v36;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s SELF: Correct Partial Result Index List is %s, Correct Aligned Partial Result Index List is %s, Silence Start Time List is %s", buf, 0x2Au);
  }
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v40 timestampInTicks:0];
  v29 = [(id)qword_10005D9A8 captureSnapshot];
  v30 = +[SPIAsrFinalResultGeneratedEventContext context];
  [v29 logWithEventContext:v30 asrIdentifier:self->_asrId];
}

- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4
{
  id v23 = a3;
  id v5 = [v23 recognition];
  id v6 = [v5 interpretationIndices];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)ASRSchemaASRPackageGenerated);
    objc_msgSend(v8, "setIsFinal:", objc_msgSend(v23, "isFinal"));
    BOOL isTier1LoggingAllowedForCurrentRequest = self->_isTier1LoggingAllowedForCurrentRequest;
    emojiUtils = self->_emojiUtils;
    id v24 = 0;
    id v25 = 0;
    id v11 = v23;
    id v12 = emojiUtils;
    id v13 = objc_alloc_init((Class)ASRSchemaASRPackage);
    id v14 = [v11 preITNRecognition];
    uint64_t v15 = sub_1000078BC(isTier1LoggingAllowedForCurrentRequest, v14, v12, &v25);
    [v13 setRawRecognition:v15];

    v16 = [v11 recognition];

    v17 = sub_1000078BC(isTier1LoggingAllowedForCurrentRequest, v16, v12, &v24);

    [v13 setPostItn:v17];
    id v18 = v25;
    id v19 = v24;
    [v8 setPackage:v13];

    double v20 = earPackageResultCandidateId();
    unsigned __int8 v21 = [v11 isFinal];
    double v22 = @"-1";
    if ((v21 & 1) == 0 && v20)
    {
      double v22 = [v20 stringValue];
    }
    [v8 setResultCandidateId:v22];
    [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v8 timestampInTicks:0];
    self->_packageLogged = 1;
    if (self->_isTier1LoggingAllowedForCurrentRequest)
    {
      [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v18 timestampInTicks:0];
      [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v19 timestampInTicks:0];
    }
  }
}

- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4 unrepairedPostItn:(id)a5 loggableSharedUserId:(id)a6
{
  if (self->_isTier1LoggingAllowedForCurrentRequest)
  {
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    id v12 = objc_alloc_init((Class)ASRSchemaASRIntermediateUtteranceInfoTier1);
    [v12 setPhoneticMatchInput:v11];

    [v12 setPhoneticMatchOutput:v10];
    [v12 setUnrepairedPostItn:v9];

    [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v12 timestampInTicks:0];
  }
}

- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4
{
}

- (void)logPartialResultGenerated
{
  id v5 = objc_alloc_init((Class)ASRSchemaASRPartialResultGenerated);
  [v5 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:0];
  id v3 = [(id)qword_10005D9A8 captureSnapshot];
  id v4 = +[SPIAsrPartialResultGeneratedEventContext context];
  [v3 logWithEventContext:v4 asrIdentifier:self->_asrId];
}

- (void)logPostSpeechStartOneSecondAudioProcessedWithTimestampInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed);
  [v5 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logLeadingSilenceProcessedWithTimestampInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ASRSchemaASRLeadingSilenceProcessed);
  [v5 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a6;
  id v17 = a10;
  id v18 = a11;
  id v19 = a12;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = objc_alloc_init((Class)ASRSchemaASRStarted);
  if (v37)
  {
    id v24 = v37;
    if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging])
    {
      uint64_t v25 = 1;
    }
    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation])
    {
      uint64_t v25 = 2;
    }
    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch])
    {
      uint64_t v25 = 3;
    }
    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskTshot])
    {
      uint64_t v25 = 4;
    }
    else if ([v24 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation])
    {
      uint64_t v25 = 5;
    }
    else
    {
      uint64_t v25 = 0;
    }

    [v23 setTask:v25];
  }
  if (v36)
  {
    double v26 = [v36 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    objc_msgSend(v23, "setModelLocale:", +[SIUtilities convertLanguageCodeToSchemaLocale:](SIUtilities, "convertLanguageCodeToSchemaLocale:", v26));
  }
  if (v35) {
    objc_msgSend(v23, "setIsHighQualityAsset:", objc_msgSend(v35, "BOOLValue"));
  }
  if (v18)
  {
    id v27 = [objc_alloc((Class)NSUUID) initWithUUIDString:v18];
    if (v27)
    {
      id v28 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v27];
      [v23 setDictationUiInteractionId:v28];
    }
  }
  if (v17)
  {
    [v17 doubleValue];
    v30 = +[NSNumber numberWithDouble:v29 * 1000000000.0];
    objc_msgSend(v23, "setSpeechProfileAgeInNs:", objc_msgSend(v30, "unsignedLongLongValue"));
  }
  else
  {
    [v23 setSpeechProfileAgeInNs:0x7FFFFFFFFFFFFFFFLL];
  }
  [v23 setDatapackVersion:v22];

  [v23 setHammerVersion:v21];
  [v23 setGeoLanguageModelRegion:v20];

  [v23 setGeoLanguageModelLoaded:a9];
  [v23 setPortraitExperimentVariantName:v19];

  id v31 = objc_alloc_init((Class)ASRSchemaASRRequestContext);
  [v31 setStartedOrChanged:v23];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v31 timestampInTicks:0];
  id v32 = [(id)qword_10005D9A8 captureSnapshot];
  id v33 = +[SPIAsrRequestStartedOrChangedEventContext context];
  [v32 logWithEventContext:v33 asrIdentifier:self->_asrId];
}

- (void)logFrameProcessingReady
{
  id v3 = objc_alloc_init((Class)ASRSchemaASRFrameProcessingReady);
  [v3 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v3 timestampInTicks:0];
}

- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v12 = objc_alloc_init((Class)ASRSchemaASRFinalAudioPacketContainingSpeechReceived);
  [v12 setExists:1];
  id v9 = earPackageResultCandidateId();
  unsigned __int8 v10 = [v7 isFinal];

  id v11 = @"-1";
  if ((v10 & 1) == 0 && v9)
  {
    id v11 = [v9 stringValue];
  }
  [v12 setResultCandidateId:v11];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v12 timestampInTicks:v8];
}

- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
  id v12 = a5;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream);
  if ([v12 isFinal])
  {
    id v9 = @"-1";
  }
  else
  {
    unsigned __int8 v10 = earPackageResultCandidateId();
    if (v10)
    {
      id v11 = earPackageResultCandidateId();
      id v9 = [v11 stringValue];
    }
    else
    {
      id v9 = @"-1";
    }
  }
  [v8 setResultCandidateId:v9];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v8 timestampInTicks:v7];
}

- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived);
  [v6 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v6 timestampInTicks:v5];
}

- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
  id v5 = a3;
  id v7 = objc_alloc_init((Class)ASRSchemaASRAudioSpeechPacketArrivalStarted);
  [v7 setExists:1];
  id v6 = objc_alloc_init((Class)ASRSchemaASRAudioSpeechPacketArrivalContext);
  [v6 setStartedOrChanged:v7];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v6 timestampInTicks:v5];
}

- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream);
  [v5 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logFirstAudioPacketProcessed
{
  id v5 = objc_alloc_init((Class)ASRSchemaASRFirstAudioPacketProcessed);
  [v5 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:0];
  id v3 = [(id)qword_10005D9A8 captureSnapshot];
  id v4 = +[SPIAsrFirstAudioPacketProcessedEventContext context];
  [v3 logWithEventContext:v4 asrIdentifier:self->_asrId];
}

- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ASRSchemaASRFirstAudioPacketReadyUpstream);
  [v5 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ASRSchemaASRFirstAudioPacketRecorded);
  [v5 setExists:1];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)ASRSchemaASRAudioPacketArrivalEnded);
  [v8 setExists:1];
  id v5 = objc_alloc_init((Class)ASRSchemaASRAudioPacketArrivalContext);
  [v5 setEnded:v8];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];

  id v6 = [(id)qword_10005D9A8 captureSnapshot];
  id v7 = +[SPIAsrAudioPacketArrivalEndedEventContext context];
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)ASRSchemaASRAudioPacketArrivalStarted);
  [v8 setExists:1];
  id v5 = objc_alloc_init((Class)ASRSchemaASRAudioPacketArrivalContext);
  [v5 setStartedOrChanged:v8];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];

  id v6 = [(id)qword_10005D9A8 captureSnapshot];
  id v7 = +[SPIAsrAudioPacketArrivalStartedOrChangedEventContext context];
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init((Class)ASRSchemaASRJitLanguageModelEnrollmentEndedTier1);
  id v5 = objc_alloc((Class)SISchemaUUID);
  id v6 = +[NSUUID UUID];
  id v7 = [v5 initWithNSUUID:v6];

  [v10 setLinkId:v7];
  [v10 setDialogContexts:v4];

  id v8 = objc_alloc_init((Class)ASRSchemaASRJitLanguageModelEnrollmentEnded);
  [v8 setLinkId:v7];
  id v9 = objc_alloc_init((Class)ASRSchemaASRJitLanguageModelEnrollmentContext);
  [v9 setEnded:v8];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v10 timestampInTicks:0];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v9 timestampInTicks:0];
}

- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)ASRSchemaASRJitLanguageModelEnrollmentStarted);
  [v6 setExists:1];
  id v5 = objc_alloc_init((Class)ASRSchemaASRJitLanguageModelEnrollmentContext);
  [v5 setStartedOrChanged:v6];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logAppleNeuralEngineModelInitializationEnded
{
  id v4 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationEnded);
  [v4 setExists:1];
  id v3 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  [v3 setEnded:v4];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v3 timestampInTicks:0];
}

- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationStarted);
  [v6 setExists:1];
  id v5 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  [v5 setStartedOrChanged:v6];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logActiveConfigUpdateEnded
{
  id v6 = objc_alloc_init((Class)ASRSchemaASRActiveConfigUpdateEnded);
  [v6 setExists:1];
  id v3 = objc_alloc_init((Class)ASRSchemaASRActiveConfigUpdateContext);
  [v3 setEnded:v6];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v3 timestampInTicks:0];
  id v4 = [(id)qword_10005D9A8 captureSnapshot];
  id v5 = +[SPIAsrAssetLoadEndedEventContext context];
  [v4 logWithEventContext:v5 asrIdentifier:self->_asrId];
}

- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)ASRSchemaASRActiveConfigUpdateStarted);
  [v8 setExists:1];
  id v5 = objc_alloc_init((Class)ASRSchemaASRActiveConfigUpdateContext);
  [v5 setStartedOrChanged:v8];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];

  id v6 = [(id)qword_10005D9A8 captureSnapshot];
  id v7 = +[SPIAsrAssetLoadStartedOrChangedEventContext context];
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logInitializationEndedIsSpeechRecognizerCreated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = objc_alloc_init((Class)ASRSchemaASRInitializationEnded);
  [v8 setExists:1];
  [v8 setIsSpeechRecognizerCreated:v3];
  id v5 = objc_alloc_init((Class)ASRSchemaASRInitializationContext);
  [v5 setEnded:v8];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:0];
  id v6 = [(id)qword_10005D9A8 captureSnapshot];
  id v7 = +[SPIAsrInitializationEndedEventContext context];
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)ASRSchemaASRInitializationStarted);
  [v8 setExists:1];
  id v5 = objc_alloc_init((Class)ASRSchemaASRInitializationContext);
  [v5 setStartedOrChanged:v8];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];

  id v6 = [(id)qword_10005D9A8 captureSnapshot];
  id v7 = +[SPIAsrInitializationStartedOrChangedEventContext context];
  [v6 logWithEventContext:v7 asrIdentifier:self->_asrId];
}

- (void)logESStartWithTimeInTicks:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)ASRSchemaASREmbeddedSpeechProcessStarted);
  [v6 setExists:1];
  id v5 = objc_alloc_init((Class)ASRSchemaASREmbeddedSpeechProcessContext);
  [v5 setStartedOrChanged:v6];
  [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v5 timestampInTicks:v4];
}

- (void)logPendingANEModelInitializationContextEvents:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [v9 timestampInTicks];
        [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v9 timestampInTicks:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)logPendingPreheatContextEvents:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 preheatContext];
        long long v11 = [v9 preheatContext];
        long long v12 = [v11 timestampInTicks];
        [(ESSelfHelper *)self wrapAndEmitTopLevelEvent:v10 timestampInTicks:v12];

        long long v13 = [v9 powerSnapshot];
        long long v14 = [v9 powerEventContext];
        [v13 logWithEventContext:v14 asrIdentifier:self->_asrId];
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isNonTier1Message:(id)a3
{
  id v22 = a3;
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v20, v19, v18, v17, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(),
  long long v13 = 0);
  uint64_t v14 = objc_opt_class();

  LOBYTE(v14) = [v13 containsObject:v14];
  return v14;
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

- (BOOL)_isLoggingAllowedForCurrentRequestWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging] & 1) != 0
    || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation] & 1) != 0
    || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation]
      ? (BOOL v6 = !v4)
      : (BOOL v6 = 0),
        v6
     || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch] & 1) != 0
     || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskTshot] & 1) != 0
     || ([v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto] & 1) != 0))
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = [v5 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBetoDictation];
  }

  return v7;
}

- (ESSelfHelper)initWithTask:(id)a3 isSpeechAPIRequest:(BOOL)a4 requestId:(id)a5 language:(id)a6 asrId:(id)a7
{
  BOOL v10 = a4;
  id v13 = (NSUUID *)a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v43.receiver = self;
  v43.super_class = (Class)ESSelfHelper;
  uint64_t v17 = [(ESSelfHelper *)&v43 init];
  uint64_t v18 = v17;
  if (!v17)
  {
LABEL_9:
    id v22 = 0;
    goto LABEL_25;
  }
  if (![(ESSelfHelper *)v17 _isLoggingAllowedForCurrentRequestWithTask:v13 isSpeechAPIRequest:v10])
  {
    uint64_t v20 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      CFStringRef v21 = @"NO";
      *(_DWORD *)buf = 136315650;
      long long v45 = "-[ESSelfHelper initWithTask:isSpeechAPIRequest:requestId:language:asrId:]";
      __int16 v46 = 2112;
      v47 = v13;
      if (v10) {
        CFStringRef v21 = @"YES";
      }
      __int16 v48 = 2112;
      CFStringRef v49 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s SELF: Logging disabled because it is not allowed for the current request. recognitionTask=%@, isSpeechAPIRequest=%@", buf, 0x20u);
    }
    goto LABEL_9;
  }
  if (v16)
  {
    uint64_t v19 = (NSUUID *)v16;
  }
  else
  {
    id v23 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v45 = "-[ESSelfHelper initWithTask:isSpeechAPIRequest:requestId:language:asrId:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s SELF: asrId is nil, creating a new UUID for this request.", buf, 0xCu);
    }
    uint64_t v19 = +[NSUUID UUID];
  }
  asrId = v18->_asrId;
  v18->_asrId = v19;

  uint64_t v25 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v14];
  requestId = v18->_requestId;
  v18->_requestId = v25;

  objc_storeStrong((id *)&v18->_recognitionTask, a3);
  id v27 = (_EAREmojiRecognition *)[objc_alloc((Class)_EAREmojiRecognition) initWithLanguage:v15];
  emojiUtils = v18->_emojiUtils;
  v18->_emojiUtils = v27;

  v18->_BOOL isTier1LoggingAllowedForCurrentRequest = [(ESSelfHelper *)v18 _isTier1LoggingAllowedForCurrentRequestWithTask:v13];
  double v29 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    double v39 = v18->_asrId;
    v40 = v18->_requestId;
    recognitionTask = v18->_recognitionTask;
    if (v10) {
      CFStringRef v30 = @"YES";
    }
    else {
      CFStringRef v30 = @"NO";
    }
    CFStringRef v38 = v30;
    long long v42 = v29;
    id v37 = +[AFPreferences sharedPreferences];
    if ([v37 isDictationHIPAACompliant]) {
      CFStringRef v31 = @"YES";
    }
    else {
      CFStringRef v31 = @"NO";
    }
    id v32 = +[AFPreferences sharedPreferences];
    [v32 siriDataSharingOptInStatus];
    uint64_t v33 = AFSiriDataSharingOptInStatusGetName();
    id v34 = (void *)v33;
    if (v18->_isTier1LoggingAllowedForCurrentRequest) {
      CFStringRef v35 = @"YES";
    }
    else {
      CFStringRef v35 = @"NO";
    }
    *(_DWORD *)buf = 136316930;
    long long v45 = "-[ESSelfHelper initWithTask:isSpeechAPIRequest:requestId:language:asrId:]";
    __int16 v46 = 2112;
    v47 = v39;
    __int16 v48 = 2112;
    CFStringRef v49 = (const __CFString *)v40;
    __int16 v50 = 2112;
    id v51 = recognitionTask;
    __int16 v52 = 2112;
    CFStringRef v53 = v38;
    __int16 v54 = 2112;
    CFStringRef v55 = v31;
    __int16 v56 = 2112;
    uint64_t v57 = v33;
    __int16 v58 = 2112;
    CFStringRef v59 = v35;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s SELF: Logging object created successfully (logging allowed for current request). asrId=%@, requestId=%@, recognitionTask=%@, isSpeechAPIRequest=%@, isHipaaCompliant=%@, siriOptInStatus=%@, isTier1LoggingAllowed=%@", buf, 0x52u);
  }
  +[ESSelfHelper _logRequestLinkWithRequestId:v18->_requestId asrId:v18->_asrId];
  id v22 = v18;
LABEL_25:

  return v22;
}

+ (void)logPowerSnapshotForProcessEnded
{
  id v3 = [(id)qword_10005D9A8 captureSnapshot];
  v2 = +[SPIProcessEndedEventContext context];
  [v3 logWithEventContext:v2];
}

+ (void)logPowerSnapshotForProcessStarted
{
  id v3 = [(id)qword_10005D9A8 captureSnapshot];
  v2 = +[SPIProcessStartedEventContext context];
  [v3 logWithEventContext:v2];
}

+ (void)initializeSharedPowerLoggerIfNeeded
{
  if (!qword_10005D9A8)
  {
    qword_10005D9A8 = (uint64_t)[objc_alloc((Class)SPIPowerLogger) initWithCurrentProcess];
    _objc_release_x1();
  }
}

+ (id)createANEModelInitializationEndedEventWithTimeStamp:(id)a3 fileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationEnded);
  [v7 setExists:1];
  id v8 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  [v8 setTimestampInTicks:v6];

  [v8 setFileName:v5];
  [v8 setEnded:v7];

  return v8;
}

+ (id)createANEModelInitializationStartedEventWithTimeStamp:(id)a3 fileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationStarted);
  [v7 setExists:1];
  id v8 = objc_alloc_init((Class)ASRSchemaASRAppleNeuralEngineModelInitializationContext);
  [v8 setFileName:v5];

  [v8 setTimestampInTicks:v6];
  [v8 setStartedOrChanged:v7];

  return v8;
}

+ (id)createPreheatEndedEventWithPreheatAlreadyDone:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)ASRSchemaASRPreheatEnded);
  id v5 = v4;
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  if (v3) {
    id v7 = (id *)SPIAsrPreheatEndedAlreadyDoneEventContext_ptr;
  }
  else {
    id v7 = (id *)SPIAsrPreheatEndedSuccessEventContext_ptr;
  }
  [v4 setStatus:v6];
  id v8 = [*v7 context];
  id v9 = objc_alloc_init((Class)ASRSchemaASRPreheatContext);
  BOOL v10 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v9 setTimestampInTicks:v10];
  [v9 setEnded:v5];
  uint64_t v11 = [(id)qword_10005D9A8 captureSnapshot];
  uint64_t v12 = [[ESSelfPreheatWithPowerContainer alloc] initWithPreheatContext:v9 powerSnapshot:v11 powerEventContext:v8];

  return v12;
}

+ (id)createPreheatFailedEvent
{
  id v2 = objc_alloc_init((Class)ASRSchemaASRPreheatFailed);
  [v2 setExists:1];
  id v3 = objc_alloc_init((Class)ASRSchemaASRPreheatContext);
  id v4 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v3 setTimestampInTicks:v4];
  [v3 setFailed:v2];
  id v5 = [(id)qword_10005D9A8 captureSnapshot];
  uint64_t v6 = [ESSelfPreheatWithPowerContainer alloc];
  id v7 = +[SPIAsrPreheatFailedEventContext context];
  id v8 = [(ESSelfPreheatWithPowerContainer *)v6 initWithPreheatContext:v3 powerSnapshot:v5 powerEventContext:v7];

  return v8;
}

+ (id)createPreheatStartedOrChangedEvent
{
  id v2 = objc_alloc_init((Class)ASRSchemaASRPreheatStarted);
  [v2 setExists:1];
  id v3 = objc_alloc_init((Class)ASRSchemaASRPreheatContext);
  id v4 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v3 setTimestampInTicks:v4];
  [v3 setStartedOrChanged:v2];
  id v5 = [(id)qword_10005D9A8 captureSnapshot];
  uint64_t v6 = [ESSelfPreheatWithPowerContainer alloc];
  id v7 = +[SPIAsrPreheatStartedOrChangedEventContext context];
  id v8 = [(ESSelfPreheatWithPowerContainer *)v6 initWithPreheatContext:v3 powerSnapshot:v5 powerEventContext:v7];

  return v8;
}

+ (void)_logRequestLinkWithRequestId:(id)a3 asrId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)SISchemaRequestLinkInfo);
  id v8 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v6];
  [v7 setUuid:v8];

  [v7 setComponent:8];
  id v9 = objc_alloc_init((Class)SISchemaRequestLinkInfo);
  id v10 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v5];
  [v9 setUuid:v10];

  [v9 setComponent:1];
  id v11 = objc_alloc_init((Class)SISchemaRequestLink);
  [v11 setSource:v7];
  [v11 setTarget:v9];
  uint64_t v12 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    id v15 = "+[ESSelfHelper _logRequestLinkWithRequestId:asrId:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s SELF: Emitting request link message with asrId=%@ and requestID=%@", (uint8_t *)&v14, 0x20u);
  }
  id v13 = +[AssistantSiriAnalytics sharedStream];
  [v13 emitMessage:v11];
}

@end