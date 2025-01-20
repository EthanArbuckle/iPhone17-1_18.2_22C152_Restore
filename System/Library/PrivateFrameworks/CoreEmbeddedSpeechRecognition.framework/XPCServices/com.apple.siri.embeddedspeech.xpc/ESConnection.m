@interface ESConnection
+ (id)_bestGuessTaskStringsFromPreheatSource:(id)a3;
+ (id)_languagesToCompileForAssetType:(unint64_t)a3 assetManager:(id)a4;
+ (id)_speechRecognizerWithAssetConfig:(id)a3 enableITN:(BOOL)a4 isHighPriority:(BOOL)a5 error:(id *)a6;
+ (id)_speechRecognizerWithAssetConfig:(id)a3 geoLMRegionId:(id)a4 enableITN:(BOOL)a5 overrides:(id)a6 modelOverrideURL:(id)a7 preloadModels:(BOOL)a8 requestSource:(id)a9 enableParallelLoading:(BOOL)a10 isHighPriority:(BOOL)a11 geoLMLoadedOut:(id *)a12 error:(id *)a13;
+ (id)getRecognizerQueue;
+ (id)getSharedUaapLm;
+ (unint64_t)_cooldownTimerTimeoutSeconds;
+ (void)_addPendingAnalyticsEvent:(id)a3;
+ (void)_addPendingProfilerANEModelInitializationEvent:(id)a3;
+ (void)_addPendingProfilerPreheatEvent:(id)a3;
+ (void)_cachedRecognizerCleanUp;
+ (void)_cancelCooldownTimer;
+ (void)_clearPendingAnalyticsEvents;
+ (void)_clearPendingProfilerEvents;
+ (void)_cooldownTimerFired;
+ (void)_discardCachedRecognizer;
+ (void)_replaceCachedRecognizerIfNeeded;
+ (void)_scheduleCooldownTimer;
+ (void)_sendPendingAnalyticsEvents;
+ (void)captureESStartTimeInTicks;
+ (void)didFinishModelInitializing:(id)a3;
+ (void)didStartModelInitializing:(id)a3;
+ (void)initialize;
+ (void)prepareToExit;
- (BOOL)_invalidated;
- (BOOL)shouldWriteDictationRecord:(id)a3;
- (BOOL)siriDataSharingOptedIn;
- (ESConnection)init;
- (ESConnection)initWithXPCConnection:(id)a3;
- (id)_audioDataPostRecognitionStart:(id)a3;
- (id)_delegate;
- (id)_fidesEvalQueue;
- (id)_modelRootWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 error:(id *)a6;
- (id)_packetReadyUpstreamTimestampsFromAudioTime:(float)a3;
- (id)_recordedTimestampFromAudioTime:(float)a3;
- (id)_redecodeQueue;
- (id)_sLowPrioritySerialQueue;
- (id)_userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8;
- (id)dummyResultPackage:(id)a3;
- (id)geoLMRegionIdWithLanguage:(id)a3 location:(id)a4;
- (id)personalizedLMWithTask:(id)a3 applicationName:(id)a4 recognizer:(id)a5 weightOut:(float *)a6 ageOut:(double *)a7;
- (id)statusForError:(id)a3;
- (void)_processAudioPacket:(id)a3;
- (void)_processBufferedAudioPackets;
- (void)_scheduleCacheResetTimer:(id)a3;
- (void)_scheduleCompilationTimerForAssetType:(unint64_t)a3 completion:(id)a4;
- (void)_updateAudioDuration:(id)a3;
- (void)_writeDESRecord:(id *)a3;
- (void)_writeDESRecord:(id *)a3 oneRecordPerDay:(BOOL)a4;
- (void)addAudioPacket:(id)a3;
- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5;
- (void)adjustAppleTVLogLevelForSecureOfflineOnly:(BOOL)a3;
- (void)cleanupUnusedSubscriptions;
- (void)compileAllAssetsWithCompletion:(id)a3;
- (void)compileAllAssetsWithType:(unint64_t)a3 completion:(id)a4;
- (void)compilePrimaryAssistantAssetWithCompletion:(id)a3;
- (void)createSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)deleteAllDESRecordsForDictationPersonalizationWithCompletion:(id)a3;
- (void)fetchModelInfoForAssetConfig:(id)a3 completion:(id)a4;
- (void)fetchModelInfoForAssetConfig:(id)a3 triggerDownload:(BOOL)a4 completion:(id)a5;
- (void)fetchModelPropertiesForAssetConfig:(id)a3 completion:(id)a4;
- (void)finishAudio;
- (void)forceCooldownIfIdleWithCompletion:(id)a3;
- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withCompletion:(id)a5;
- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withCompletion:(id)a6;
- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 withCompletion:(id)a4;
- (void)handlePostUpgradeSubscriptions;
- (void)invalidatePersonalizedLM;
- (void)invalidateUaapLm;
- (void)pauseRecognition;
- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5;
- (void)preheatSpeechRecognitionWithLanguage:(id)a3 modelOverrideURL:(id)a4;
- (void)processPartialResultMetricsWithTokens:(id)a3 preITNTokens:(id)a4 timestamp:(double)a5;
- (void)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 completion:(id)a5;
- (void)purgeInstalledAssetsExceptLanguages:(id)a3 completion:(id)a4;
- (void)readProfileAndUserDataWithLanguage:(id)a3 allowOverride:(BOOL)a4 completion:(id)a5;
- (void)redecodeWithAudioDatas:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 completion:(id)a7;
- (void)removePersonalizedLMForFidesOnly:(BOOL)a3 completion:(id)a4;
- (void)requestEagerResult;
- (void)resetCacheWithCompletion:(id)a3;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)runCorrectedTextEvaluationWithAudioDatas:(id)a3 recordDatas:(id)a4 language:(id)a5 samplingRate:(unint64_t)a6 caseSensitive:(BOOL)a7 skipLME:(BOOL)a8 wordSenseAccessListSet:(id)a9 completion:(id)a10;
- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 attachments:(id)a6 fidesPersonalizedLMPath:(id)a7 fidesPersonalizedLMTrainingAsset:(id)a8 scrubResult:(BOOL)a9 completion:(id)a10;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10;
- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5;
- (void)startRequestActivityWithCompletion:(id)a3;
- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandler:(id)a4;
- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4;
- (void)stopAudioDecoding;
- (void)updateSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 existingProfile:(id)a5 existingAssetPath:(id)a6 completion:(id)a7;
- (void)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 completion:(id)a7;
@end

@implementation ESConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_cacheResetTimer, 0);
  objc_storeStrong((id *)&self->_compilationTimerForAssetType, 0);
  objc_storeStrong((id *)&self->_firstSeenPartialResultTokens, 0);
  objc_storeStrong((id *)&self->_partialResultsTimeList, 0);
  objc_storeStrong((id *)&self->_taskToUse, 0);
  objc_storeStrong((id *)&self->_redecodeQueue, 0);
  objc_storeStrong((id *)&self->_fidesEvalQueue, 0);
  objc_destroyWeak((id *)&self->_weakFidesRecognizer);
  objc_storeStrong((id *)&self->_speakerCodeWriter, 0);
  objc_storeStrong((id *)&self->_localMetrics, 0);
  objc_storeStrong((id *)&self->_processedPacketsCumulativeAudioDurationBuffer, 0);
  objc_storeStrong((id *)&self->_processedPacketsReadyUpstreamTimestampsBuffer, 0);
  objc_storeStrong((id *)&self->_lastAudioPacketReceivedTimeInTicks, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketReceivedTimeInTicks, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketRecordedTimeInTicks, 0);
  objc_storeStrong((id *)&self->_biomeRecord, 0);
  objc_storeStrong((id *)&self->_storeAudioData, 0);
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_validDomains, 0);
  objc_storeStrong((id *)&self->_bufferedRequestEagerResultData, 0);
  objc_storeStrong((id *)&self->_bufferedAudioPackets, 0);
  objc_storeStrong((id *)&self->_lastRecognizedMetadataPackage, 0);
  objc_storeStrong((id *)&self->_lastRecognizedPackage, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_audioBuffer);

  objc_destroyWeak((id *)&self->_recognizer);
}

- (void)speechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (AFDeviceSupportsSiriUOD())
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000179D0;
    v14[3] = &unk_100051588;
    v8 = (id *)v15;
    v15[0] = v7;
    v15[1] = self;
    id v9 = v7;
    [v6 getFormatterWithBlock:v14];
  }
  else
  {
    v10 = qword_10005D9E8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100017AAC;
    v12[3] = &unk_1000513D0;
    v8 = (id *)v13;
    v13[0] = v7;
    v13[1] = self;
    id v11 = v7;
    dispatch_async(v10, v12);
  }
}

- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5
{
  id v6 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  v5 = +[ESProfiler sharedProfiler];
  [v5 logFrameProcessingReadyWithTimeInTicks:v6];
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v6 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  id v7 = qword_10005D9E8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E60;
  block[3] = &unk_100051470;
  double v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = qword_10005D9E8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018038;
  block[3] = &unk_1000514D8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (id)statusForError:(id)a3
{
  v3 = @"RECOGNITION_SUCCESS";
  if (a3)
  {
    id v4 = a3;
    v5 = +[NSNumber numberWithUnsignedInt:0];
    v13[0] = v5;
    v14[0] = @"RECOGNITION_FAILED";
    id v6 = +[NSNumber numberWithUnsignedInt:1];
    v13[1] = v6;
    v14[1] = @"RECOGNITION_SUCCESS";
    id v7 = +[NSNumber numberWithUnsignedInt:2];
    void v13[2] = v7;
    v14[2] = @"RECOGNITION_CANCELLED";
    id v8 = +[NSNumber numberWithUnsignedInt:3];
    v13[3] = v8;
    v14[3] = @"RECOGNITION_REJECTED";
    id v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

    id v10 = [v4 code];
    double v11 = +[NSNumber numberWithInteger:v10];
    v3 = [v9 objectForKey:v11];
  }

  return v3;
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = qword_10005D9E8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019314;
  block[3] = &unk_1000514D8;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v5 = a4;
  id v6 = qword_10005D9E8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019D34;
  v8[3] = &unk_1000513D0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (id)dummyResultPackage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AFSpeechToken);
  [v5 setText:@"DUMMYTOKEN"];
  [v5 setStartTime:0.0];
  [v5 setEndTime:0.0];
  [v5 setSilenceStartTime:0.0];
  [v5 setRemoveSpaceAfter:0];
  [v5 setRemoveSpaceBefore:0];
  [v5 setPhoneSequence:&stru_1000519F0];
  [v5 setIpaPhoneSequence:&stru_1000519F0];
  id v6 = objc_alloc_init((Class)AFSpeechInterpretation);
  id v26 = v5;
  id v7 = +[NSArray arrayWithObjects:&v26 count:1];
  [v6 setTokens:v7];

  id v8 = objc_alloc((Class)AFSpeechPhrase);
  id v25 = v6;
  id v9 = +[NSArray arrayWithObjects:&v25 count:1];
  id v10 = [v8 initWithInterpretations:v9 isLowConfidence:0];

  id v11 = [objc_alloc((Class)AFSpeechUtterance) initWithInterpretationIndices:&off_1000542E0 confidenceScore:0];
  [v11 setSource:2];
  id v12 = objc_alloc((Class)AFSpeechRecognition);
  id v24 = v10;
  id v13 = +[NSArray arrayWithObjects:&v24 count:1];
  id v23 = v11;
  id v14 = +[NSArray arrayWithObjects:&v23 count:1];
  id v15 = [v12 initWithPhrases:v13 utterances:v14 processedAudioDuration:self->_processedAudioDuration];

  id v16 = objc_alloc((Class)AFSpeechPackage);
  id v17 = [v4 isFinal];
  [v4 utteranceStart];
  double v19 = v18;
  LOBYTE(v14) = [v4 recognitionPaused];

  LOBYTE(v22) = (_BYTE)v14;
  id v20 = [v16 initWithRecognition:v15 unfilteredRecognition:v15 rawRecognition:v15 audioAnalytics:0 isFinal:v17 utteranceStart:0 latticeMitigatorResult:v19 recognitionPaused:v22];

  return v20;
}

- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4
{
  id v5 = a4;
  id v6 = qword_10005D9E8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001A1E4;
  v8[3] = &unk_1000513D0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6
{
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResultPackage:(id)a4
{
  id v5 = a4;
  id v6 = +[NSProcessInfo processInfo];
  [v6 systemUptime];
  uint64_t v8 = v7;

  id v9 = qword_10005D9E8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A4B8;
  block[3] = &unk_100051470;
  id v12 = v5;
  id v13 = self;
  uint64_t v14 = v8;
  id v10 = v5;
  dispatch_async(v9, block);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSProcessInfo processInfo];
  [v8 systemUptime];
  uint64_t v10 = v9;

  id v11 = qword_10005D9E8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A734;
  v14[3] = &unk_100051448;
  id v15 = v7;
  id v16 = v6;
  id v17 = self;
  uint64_t v18 = v10;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v11, v14);
}

- (void)processPartialResultMetricsWithTokens:(id)a3 preITNTokens:(id)a4 timestamp:(double)a5
{
  id v8 = a3;
  uint64_t v9 = qword_10005D9E8;
  id v10 = a4;
  dispatch_assert_queue_V2(v9);
  id v11 = (void *)qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    *(_DWORD *)buf = 136315394;
    v33 = "-[ESConnection processPartialResultMetricsWithTokens:preITNTokens:timestamp:]";
    __int16 v34 = 2048;
    double v35 = COERCE_DOUBLE([v8 count]);
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s %lu results", buf, 0x16u);
  }
  if (self->_firstAudioPacketTimeUntilFirstPartial > 0.0)
  {
    id v13 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      firstAudioPacketRecordedTimeInTicks = self->_firstAudioPacketRecordedTimeInTicks;
      id v15 = v13;
      +[CESRUtilities hostTimeToSeconds:[(NSNumber *)firstAudioPacketRecordedTimeInTicks unsignedLongLongValue]];
      *(_DWORD *)buf = 136315394;
      v33 = "-[ESConnection processPartialResultMetricsWithTokens:preITNTokens:timestamp:]";
      __int16 v34 = 2048;
      double v35 = a5 - v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s EmbeddedSpeechMetric: first audio packet recorded to first partial result = %lf secs", buf, 0x16u);

      id v13 = AFSiriLogContextSpeech;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v17 = a5 - self->_firstAudioPacketTimeUntilFirstPartial;
      *(_DWORD *)buf = 136315394;
      v33 = "-[ESConnection processPartialResultMetricsWithTokens:preITNTokens:timestamp:]";
      __int16 v34 = 2048;
      double v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s EmbeddedSpeechMetric: first audio packet received to first partial result = %lf secs", buf, 0x16u);
    }
    self->_firstAudioPacketTimeUntilFirstPartial = 0.0;
  }
  partialResultsTimeList = self->_partialResultsTimeList;
  double v19 = +[NSNumber numberWithDouble:a5];
  [(NSMutableArray *)partialResultsTimeList addObject:v19];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001AC04;
  v31[3] = &unk_100051420;
  v31[4] = self;
  [v10 enumerateObjectsUsingBlock:v31];

  id v20 = [v8 count];
  id v21 = v20;
  if ((uint64_t)v20 > self->_lastWordCount) {
    self->_lastWordCount = (int64_t)v20;
  }
  +[NSMutableString string];
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_10001AD50;
  v29 = &unk_100051420;
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v30;
  [v8 enumerateObjectsUsingBlock:&v26];
  id v23 = +[ESProfiler sharedProfiler];
  id v24 = +[NSNumber numberWithInteger:v21];
  id v25 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  [v23 logPartialResultGenerated:v22 ofSize:v24 timeInTicks:v25];

  ++self->_partialResultCount;
}

- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4
{
  id v5 = a4;
  id v6 = qword_10005D9E8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001AE54;
  v8[3] = &unk_1000513D0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  id v17 = a7;
  uint64_t v18 = v17;
  if (!self->_disableDeliveringAsrFeatures)
  {
    double v19 = qword_10005D9E8;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001B9D4;
    v20[3] = &unk_1000513F8;
    int64_t v23 = a4;
    int64_t v24 = a5;
    double v25 = a6;
    double v26 = a8;
    double v27 = a10;
    id v21 = v17;
    id v22 = self;
    int64_t v28 = a9;
    dispatch_async(v19, v20);
  }
}

- (void)_writeDESRecord:(id *)a3 oneRecordPerDay:(BOOL)a4
{
  if (*a3)
  {
    if ([*a3 hasData]
      && ([*a3 hasRecognizedAnything] & 1) != 0)
    {
      id v6 = *a3;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001BCC8;
      v16[3] = &unk_1000513A8;
      BOOL v18 = a4;
      id v17 = v6;
      id v7 = v6;
      id v8 = objc_retainBlock(v16);
      ((void (*)(void *, uint64_t, uint64_t, uint64_t))v8[2])(v8, v9, v10, v11);
      id v12 = *a3;
      *a3 = 0;
    }
    else
    {
      id v13 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "-[ESConnection _writeDESRecord:oneRecordPerDay:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Not saving DES Record with no data or recognition", buf, 0xCu);
      }
      id v14 = *a3;
      *a3 = 0;
    }
  }
  else
  {
    id v15 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ESConnection _writeDESRecord:oneRecordPerDay:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s No DES record, nothing to write", buf, 0xCu);
    }
  }
}

- (void)_writeDESRecord:(id *)a3
{
}

- (void)forceCooldownIfIdleWithCompletion:(id)a3
{
  v3 = (void (**)(id, BOOL))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v4 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ESConnection forceCooldownIfIdleWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = qword_10005DA00;
  if (qword_10005DA00)
  {
    id v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ESConnection forceCooldownIfIdleWithCompletion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Not cooling down now because recognition is active", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    +[ESConnection _cancelCooldownTimer];
    +[ESConnection _cachedRecognizerCleanUp];
  }
  if (v3) {
    v3[2](v3, v5 == 0);
  }
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[ESConnection resumeRecognitionWithPrefixText:postfixText:selectedText:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
  }
  if (qword_10005DA30 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v11 = +[ESProfiler sharedProfiler];
    id v12 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v11 logResumeRecognitionWithTimeInTicks:v12];

    [(id)qword_10005DA30 resumeRecognitionWithLeftContext:v7 rightContext:v8 selectedText:v9];
  }
}

- (void)pauseRecognition
{
  v2 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ESConnection pauseRecognition]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  if (qword_10005DA30)
  {
    if (objc_opt_respondsToSelector())
    {
      [(id)qword_10005DA30 pauseRecognition];
      v3 = +[ESProfiler sharedProfiler];
      id v4 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      [v3 logPauseRecognitionWithTimeInTicks:v4];
    }
  }
}

- (void)deleteAllDESRecordsForDictationPersonalizationWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    id v7 = objc_alloc((Class)BMStreamDatastorePruner);
    id v8 = +[BMStoreConfig newRestrictedStreamDefaultConfiguration];
    id v9 = [v7 initWithStream:v6 config:v8];

    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_10001C2B8;
    v13[3] = &unk_100051380;
    void v13[4] = &v14;
    uint64_t v10 = objc_retainBlock(v13);
    [v9 removeEventsFrom:2 to:v10 reason:0.0 usingBlock:CFAbsoluteTimeGetCurrent()];
    uint64_t v11 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v15[3];
      *(_DWORD *)buf = 136315394;
      double v19 = "-[ESConnection deleteAllDESRecordsForDictationPersonalizationWithCompletion:]";
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Biome Dictation: Removed %zu dictation events from Biome", buf, 0x16u);
    }

    _Block_object_dispose(&v14, 8);
  }
  +[CESRFidesASRRecord deleteAllRecordsForPlugin:@"com.apple.siri.speech-dictation-personalization" completion:v3];
}

- (void)removePersonalizedLMForFidesOnly:(BOOL)a3 completion:(id)a4
{
  int v5 = (void (**)(void))a4;
  id v6 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v7 = [v6 firstObject];

  v19[0] = v7;
  v19[1] = @"/Assistant";
  v19[2] = @"SpeechPersonalizedLM_Fides";
  id v8 = +[NSArray arrayWithObjects:v19 count:3];
  id v9 = +[NSString pathWithComponents:v8];

  uint64_t v10 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[ESConnection removePersonalizedLMForFidesOnly:completion:]";
    __int16 v17 = 2112;
    BOOL v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s PLM: Removing if exists: %@", buf, 0x16u);
  }
  +[_EARLmModel removeWithDirectory:v9];
  if (!a3)
  {
    v14[0] = v7;
    v14[1] = @"/Assistant";
    v14[2] = @"SpeechPersonalizedLM";
    uint64_t v11 = +[NSArray arrayWithObjects:v14 count:3];
    uint64_t v12 = +[NSString pathWithComponents:v11];

    int v13 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[ESConnection removePersonalizedLMForFidesOnly:completion:]";
      __int16 v17 = 2112;
      BOOL v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s PLM: Removing if exists: %@", buf, 0x16u);
    }
    +[_EARLmModel removeWithDirectory:v12];
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)invalidateUaapLm
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  v2 = (void *)qword_10005DA80;

  [v2 invalidate];
}

- (void)invalidatePersonalizedLM
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  v2 = (void *)qword_10005DA60;

  [v2 invalidate];
}

- (void)compilePrimaryAssistantAssetWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_10001CDFC;
  v53 = sub_10001CE0C;
  id v54 = 0;
  int v5 = AFPreferencesMobileUserSessionLanguage();
  if (v5)
  {
    SFEntitledAssetTypeToString();
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v6 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v5 assetType:3];
    id v7 = [v6 language];

    id v8 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v62 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
      __int16 v63 = 2112;
      CFStringRef v64 = v41;
      __int16 v65 = 2112;
      id v66 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Requesting model compilation for the primary %@ asset: %@", buf, 0x20u);
    }
    id v9 = objc_alloc_init((Class)SFEntitledAssetManager);
    uint64_t v10 = [v9 installedAssetWithConfig:v6];
    if (v10)
    {
      uint64_t v11 = +[NSFileManager defaultManager];
      unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

      if (v12)
      {
        v40 = [v9 modelQualityTypeStatusStringWithConfig:v6];
        if ([v40 isEqualToString:@"HQ"])
        {
          int v13 = +[SFEntitledAssetManager jsonFilenameForAssetType:3];
          uint64_t v14 = [v10 stringByAppendingPathComponent:v13];

          id v15 = +[NSFileManager defaultManager];
          unsigned __int8 v16 = [v15 fileExistsAtPath:v14];

          if (v16)
          {
            __int16 v17 = (void *)os_transaction_create();
            BOOL v18 = [(ESConnection *)self _sLowPrioritySerialQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10001CE14;
            block[3] = &unk_100051358;
            CFStringRef v19 = v41;
            v43 = (__CFString *)v19;
            id v20 = v7;
            id v44 = v20;
            id v45 = v14;
            v48 = &v49;
            id v47 = v4;
            id v21 = v17;
            id v46 = v21;
            dispatch_async(v18, block);

            id v22 = qword_10005D9F8;
            if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v62 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
              __int16 v63 = 2112;
              CFStringRef v64 = v19;
              __int16 v65 = 2112;
              id v66 = v20;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Requested model compilation for the primary %@ asset: %@", buf, 0x20u);
            }

            int64_t v23 = 0;
            goto LABEL_24;
          }
          int64_t v23 = +[NSString stringWithFormat:@"No accessible config for the primary %@ asset: %@", v41, v7];
          NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
          v56 = v23;
          v36 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          uint64_t v37 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:600 userInfo:v36];
          v38 = (void *)v50[5];
          v50[5] = v37;

          v39 = AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
            __int16 v63 = 2112;
            CFStringRef v64 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
            if (!v4) {
              goto LABEL_24;
            }
          }
          else if (!v4)
          {
LABEL_24:

            goto LABEL_25;
          }
          (*((void (**)(id, uint64_t))v4 + 2))(v4, v50[5]);
          goto LABEL_24;
        }
        int64_t v23 = +[NSString stringWithFormat:@"The primary %@ asset: %@, is ineligible for compilation.", v41, v7];
        NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
        v58 = v23;
        v32 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        uint64_t v33 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:600 userInfo:v32];
        __int16 v34 = (void *)v50[5];
        v50[5] = v33;

        double v35 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v62 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
          __int16 v63 = 2112;
          CFStringRef v64 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
          if (!v4) {
            goto LABEL_25;
          }
        }
        else if (!v4)
        {
LABEL_25:

          goto LABEL_26;
        }
        (*((void (**)(id, uint64_t))v4 + 2))(v4, v50[5]);
        goto LABEL_25;
      }
    }
    int64_t v23 = +[NSString stringWithFormat:@"No accessible root path for the primary %@ asset: %@", v41, v7];
    NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
    v60 = v23;
    int64_t v24 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    uint64_t v25 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:600 userInfo:v24];
    double v26 = (void *)v50[5];
    v50[5] = v25;

    double v27 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
      __int16 v63 = 2112;
      CFStringRef v64 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (!v4) {
        goto LABEL_26;
      }
    }
    else if (!v4)
    {
LABEL_26:

      goto LABEL_27;
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v50[5]);
    goto LABEL_26;
  }
  NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
  CFStringRef v68 = @"No language for the current user session.";
  int64_t v28 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  uint64_t v29 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:0 userInfo:v28];
  id v30 = (void *)v50[5];
  v50[5] = v29;

  v31 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]";
    __int16 v63 = 2112;
    CFStringRef v64 = @"No language for the current user session.";
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v4) {
LABEL_16:
  }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v50[5]);
LABEL_17:
  int64_t v23 = @"No language for the current user session.";
LABEL_27:
  _Block_object_dispose(&v49, 8);
}

- (void)compileAllAssetsWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  uint64_t v37 = SFEntitledAssetTypeToString();
  id v7 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v51 = "-[ESConnection compileAllAssetsWithType:completion:]";
    __int16 v52 = 2112;
    id v53 = v37;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Requesting model compilation for %@ assets.", buf, 0x16u);
  }
  if (qword_10005DA00)
  {
    id v8 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v51 = "-[ESConnection compileAllAssetsWithType:completion:]";
      __int16 v52 = 2112;
      id v53 = v37;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Deferring model compilation for %@ assets due to active recognition.", buf, 0x16u);
    }
    [(ESConnection *)self _scheduleCompilationTimerForAssetType:a3 completion:v6];
  }
  else
  {
    id v9 = +[ESProfiler sharedProfiler];
    [v9 logAssetsCompilationEventsWithPowerLogEvent:@"compileAllAssetsWithCompletion"];

    id v10 = objc_alloc_init((Class)SFEntitledAssetManager);
    uint64_t v11 = +[ESConnection _languagesToCompileForAssetType:a3 assetManager:v10];
    if ([v11 count])
    {
      double v35 = self;
      v36 = v6;
      v38 = +[NSMutableDictionary dictionary];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      __int16 v34 = v11;
      id v12 = v11;
      id v40 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v40)
      {
        uint64_t v13 = *(void *)v47;
        uint64_t v39 = *(void *)v47;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v47 != v13) {
              objc_enumerationMutation(v12);
            }
            id v15 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v14);
            id v16 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v15 assetType:a3];
            __int16 v17 = [v10 installedAssetWithConfig:v16];
            if (v17
              && (+[NSFileManager defaultManager],
                  BOOL v18 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v19 = [v18 fileExistsAtPath:v17],
                  v18,
                  (v19 & 1) != 0))
            {
              id v20 = v12;
              id v21 = v10;
              id v22 = +[SFEntitledAssetManager jsonFilenameForAssetType:a3];
              int64_t v23 = [v17 stringByAppendingPathComponent:v22];

              int64_t v24 = +[NSFileManager defaultManager];
              unsigned __int8 v25 = [v24 fileExistsAtPath:v23];

              if (v25)
              {
                [v38 setObject:v23 forKey:v15];
              }
              else
              {
                double v27 = AFSiriLogContextSpeech;
                if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  uint64_t v51 = "-[ESConnection compileAllAssetsWithType:completion:]";
                  __int16 v52 = 2112;
                  id v53 = v37;
                  __int16 v54 = 2112;
                  id v55 = v15;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s No accessible config for %@ asset: %@", buf, 0x20u);
                }
              }

              id v10 = v21;
              id v12 = v20;
              uint64_t v13 = v39;
            }
            else
            {
              double v26 = AFSiriLogContextSpeech;
              if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v51 = "-[ESConnection compileAllAssetsWithType:completion:]";
                __int16 v52 = 2112;
                id v53 = v37;
                __int16 v54 = 2112;
                id v55 = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s No accessible root path for %@ asset: %@", buf, 0x20u);
              }
            }

            uint64_t v14 = (char *)v14 + 1;
          }
          while (v40 != v14);
          id v40 = [v12 countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v40);
      }

      int64_t v28 = (void *)os_transaction_create();
      uint64_t v29 = [(ESConnection *)v35 _sLowPrioritySerialQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001D614;
      block[3] = &unk_100051330;
      id v30 = v38;
      id v42 = v30;
      id v31 = v37;
      id v43 = v31;
      id v6 = v36;
      id v45 = v36;
      id v32 = v28;
      id v44 = v32;
      dispatch_async(v29, block);

      uint64_t v33 = qword_10005D9F8;
      if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v51 = "-[ESConnection compileAllAssetsWithType:completion:]";
        __int16 v52 = 2112;
        id v53 = v31;
        __int16 v54 = 2112;
        id v55 = v12;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s Requested model compilation for %@ assets: %@", buf, 0x20u);
      }

      uint64_t v11 = v34;
    }
    else if (v6)
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)compileAllAssetsWithCompletion:(id)a3
{
}

- (void)resetCacheWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  int v5 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ESConnection resetCacheWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Requesting cache reset.", (uint8_t *)&v7, 0xCu);
  }
  if (qword_10005DA00)
  {
    id v6 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[ESConnection resetCacheWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Deferring cache reset due to active recognition.", (uint8_t *)&v7, 0xCu);
    }
    [(ESConnection *)self _scheduleCacheResetTimer:v4];
  }
  else
  {
    +[ESConnection _cachedRecognizerCleanUp];
    v4[2](v4, 0);
  }
}

- (void)requestEagerResult
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (WeakRetained)
  {
    id v10 = objc_alloc_init((Class)NSMutableArray);
    id v4 = +[NSNumber numberWithDouble:self->_audioDurationMs / 1000.0];
    [v10 addObject:v4];

    p_recognizer = &self->_recognizer;
    id v6 = objc_loadWeakRetained((id *)p_recognizer);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_recognizer);
      [v8 requestEagerResult:v10];
    }
  }
  else
  {
    bufferedRequestEagerResultData = self->_bufferedRequestEagerResultData;
    id v10 = [objc_alloc((Class)NSNumber) initWithUnsignedLong:self->_bufferedAudioDataLength];
    -[NSMutableArray addObject:](bufferedRequestEagerResultData, "addObject:");
  }
}

- (void)purgeInstalledAssetsExceptLanguages:(id)a3 assetType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = qword_10005D9F0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DC90;
  block[3] = &unk_1000512E0;
  id v14 = v8;
  unint64_t v15 = a4;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)purgeInstalledAssetsExceptLanguages:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = qword_10005D9F0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001DE60;
  v10[3] = &unk_1000510B8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)runEvaluationWithDESRecordDatas:(id)a3 language:(id)a4 recipe:(id)a5 attachments:(id)a6 fidesPersonalizedLMPath:(id)a7 fidesPersonalizedLMTrainingAsset:(id)a8 scrubResult:(BOOL)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  int64_t v23 = [(ESConnection *)self _fidesEvalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E148;
  block[3] = &unk_100051268;
  id v32 = v18;
  id v33 = v17;
  __int16 v34 = self;
  id v35 = v20;
  id v36 = v21;
  id v37 = v16;
  BOOL v40 = a9;
  id v38 = v19;
  id v39 = v22;
  id v24 = v22;
  id v25 = v19;
  id v26 = v16;
  id v27 = v21;
  id v28 = v20;
  id v29 = v17;
  id v30 = v18;
  dispatch_async(v23, block);
}

- (id)_modelRootWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10 && AFIsInternalInstall())
  {
    id v12 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[ESConnection _modelRootWithAssetConfig:modelOverridePath:overrides:error:]";
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Set model root to %@", buf, 0x16u);
    }
    id v13 = v10;
    id v14 = 0;
  }
  else
  {
    unint64_t v15 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[ESConnection _modelRootWithAssetConfig:modelOverridePath:overrides:error:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Use currently installed asset.", buf, 0xCu);
    }
    id v16 = +[ESAssetManager sharedInstance];
    id v20 = 0;
    id v13 = [v16 installedQuasarModelPathForAssetConfig:v9 error:&v20];
    id v14 = v20;

    if (!v13)
    {
      if (a6)
      {
        uint64_t v17 = kAFAssistantErrorDomain;
        if (v14)
        {
          NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
          id v22 = v14;
          id v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        }
        else
        {
          id v18 = 0;
        }
        *a6 = +[NSError errorWithDomain:v17 code:600 userInfo:v18];
        if (v14) {
      }
        }
      id v13 = 0;
    }
  }

  return v13;
}

- (id)_userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [v13 language];
  unsigned int v17 = [(id)qword_10005DAC8 isEqualToString:v16];
  if (v15 || (v17 ? (BOOL v18 = qword_10005DAD0 == 0) : (BOOL v18 = 1), v18 || v10))
  {
    id v19 = +[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:v13 modelOverridePath:v14 overrides:v15 isJit:v10 returningFoundPath:a7 error:a8];
    if (!v15 && !v10)
    {
      objc_storeStrong((id *)&qword_10005DAD0, v19);
      id v20 = [v16 copy];
      NSErrorUserInfoKey v21 = (void *)qword_10005DAC8;
      qword_10005DAC8 = (uint64_t)v20;
    }
  }
  else
  {
    id v19 = (id)qword_10005DAD0;
  }

  return v19;
}

- (void)runCorrectedTextEvaluationWithAudioDatas:(id)a3 recordDatas:(id)a4 language:(id)a5 samplingRate:(unint64_t)a6 caseSensitive:(BOOL)a7 skipLME:(BOOL)a8 wordSenseAccessListSet:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  NSErrorUserInfoKey v21 = [(ESConnection *)self _fidesEvalQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000234D4;
  v27[3] = &unk_1000511F0;
  id v28 = v18;
  id v29 = self;
  id v30 = v17;
  id v31 = v16;
  id v33 = v20;
  unint64_t v34 = a6;
  BOOL v35 = a7;
  BOOL v36 = a8;
  id v32 = v19;
  id v22 = v19;
  id v23 = v16;
  id v24 = v17;
  id v25 = v20;
  id v26 = v18;
  dispatch_async(v21, v27);
}

- (void)redecodeWithAudioDatas:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(ESConnection *)self _redecodeQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100025094;
  v21[3] = &unk_100051178;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  id v25 = self;
  id v26 = v15;
  unint64_t v27 = a6;
  id v17 = v12;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  dispatch_async(v16, v21);
}

- (void)_scheduleCompilationTimerForAssetType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  if (!self->_compilationTimerForAssetType)
  {
    id v7 = +[NSMutableDictionary dictionary];
    compilationTimerForAssetType = self->_compilationTimerForAssetType;
    self->_compilationTimerForAssetType = v7;
  }
  id v9 = SFEntitledAssetTypeToString();
  BOOL v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10005D9E8);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100025C7C;
  id v18 = &unk_1000510E0;
  id v11 = v9;
  id v19 = v11;
  id v20 = self;
  unint64_t v22 = a3;
  id v12 = v6;
  id v21 = v12;
  dispatch_source_set_event_handler(v10, &v15);
  -[NSMutableDictionary setObject:forKey:](self->_compilationTimerForAssetType, "setObject:forKey:", v10, v11, v15, v16, v17, v18);
  dispatch_time_t v13 = dispatch_time(0, 120000000000);
  dispatch_source_set_timer(v10, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(v10);
  id v14 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v24 = "-[ESConnection _scheduleCompilationTimerForAssetType:completion:]";
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = 120;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Model compilation for %@ assets scheduled for %zus.", buf, 0x20u);
  }
}

- (void)_scheduleCacheResetTimer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10005D9E8);
  cacheResetTimer = self->_cacheResetTimer;
  self->_cacheResetTimer = v5;

  id v7 = self->_cacheResetTimer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100025ED8;
  v11[3] = &unk_1000510B8;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  dispatch_source_set_event_handler(v7, v11);
  dispatch_time_t v9 = dispatch_time(0, 120000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_cacheResetTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_cacheResetTimer);
  BOOL v10 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[ESConnection _scheduleCacheResetTimer:]";
    __int16 v15 = 2048;
    uint64_t v16 = 120;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Cache reset scheduled for %zus.", buf, 0x16u);
  }
}

- (void)updateSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 existingProfile:(id)a5 existingAssetPath:(id)a6 completion:(id)a7
{
  id v7 = a7;
  id v8 = objc_alloc((Class)NSError);
  uint64_t v9 = kAFAssistantErrorDomain;
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  CFStringRef v13 = @"updateSpeechProfileWithLanguage is currently unsupported.";
  BOOL v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v11 = [v8 initWithDomain:v9 code:1102 userInfo:v10];

  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v11);
}

- (void)createSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v26 = a5;
  NSErrorUserInfoKey v12 = (void (**)(id, void))a6;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  BOOL v35 = sub_10001CDFC;
  BOOL v36 = sub_10001CE0C;
  id v37 = 0;
  id v13 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v10 assetType:3];
  id v14 = (id *)(v33 + 5);
  id obj = (id)v33[5];
  __int16 v15 = [(ESConnection *)self _userProfileWithAssetConfig:v13 modelOverridePath:v11 overrides:0 isJit:0 returningFoundPath:0 error:&obj];
  objc_storeStrong(v14, obj);
  if (v15)
  {
    uint64_t v16 = +[ESProfiler sharedProfiler];
    [v16 logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent:@"createSpeechProfileWithLanguage" language:v10];

    [v15 removeAllWords];
    id v17 = (id *)(v33 + 5);
    id v30 = (id)v33[5];
    id v18 = +[NSJSONSerialization JSONObjectWithData:v26 options:0 error:&v30];
    objc_storeStrong(v17, v30);
    if (v18)
    {
      id v19 = [v18 objectEnumerator];
      id v20 = [v19 nextObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100026464;
        v27[3] = &unk_100051090;
        id v29 = &v32;
        id v21 = v15;
        id v28 = v21;
        [v20 enumerateKeysAndObjectsUsingBlock:v27];
        if (v33[5])
        {
          v12[2](v12, 0);
        }
        else
        {
          __int16 v25 = [v21 dataProfile];
          ((void (*)(void (**)(id, void), void *, void))v12[2])(v12, v25, 0);
        }
        unint64_t v22 = v28;
      }
      else
      {
        NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
        unint64_t v22 = +[NSString stringWithFormat:@"Not a dictionary: %@", v20];
        id v39 = v22;
        id v23 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        id v24 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1102 userInfo:v23];
        ((void (*)(void (**)(id, void), void, void *))v12[2])(v12, 0, v24);
      }
    }
    else
    {
      ((void (*)(void (**)(id, void), void, uint64_t))v12[2])(v12, 0, v33[5]);
    }
  }
  else
  {
    ((void (*)(void (**)(id, void), void, uint64_t))v12[2])(v12, 0, v33[5]);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)readProfileAndUserDataWithLanguage:(id)a3 allowOverride:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = (__CFString *)a3;
  id v8 = (void (**)(id, void *, void))a5;
  if (v6)
  {
    uint64_t v9 = +[AFPreferences sharedPreferences];
    id v10 = [v9 offlineDictationProfileOverridePath];

    if (v10)
    {
      id v26 = 0;
      id v11 = +[NSData dataWithContentsOfFile:v10 options:0 error:&v26];
      NSErrorUserInfoKey v12 = (__CFString *)v26;
      id v13 = AFSiriLogContextSpeech;
      BOOL v14 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136315394;
          id v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
          __int16 v29 = 2112;
          id v30 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Using override profile at %@", buf, 0x16u);
        }
        v8[2](v8, v11, 0);

        goto LABEL_24;
      }
      if (v14)
      {
        *(_DWORD *)buf = 136315650;
        id v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
        __int16 v29 = 2112;
        id v30 = 0;
        __int16 v31 = 2112;
        CFStringRef v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Could not use override profile at %@: %@", buf, 0x20u);
      }
    }
  }
  id v25 = 0;
  NSErrorUserInfoKey v12 = +[CoreEmbeddedSpeechRecognizer dictionaryWithContentsProfilePathForLanguage:v7 errorOut:&v25];
  id v10 = (__CFString *)v25;
  if (!v12) {
    goto LABEL_23;
  }
  __int16 v15 = [(__CFString *)v12 valueForKey:@"language"];
  unsigned int v16 = [v15 isEqual:v7];

  if ((v16 & 1) == 0)
  {
    id v17 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      id v23 = v17;
      id v24 = [(__CFString *)v12 objectForKeyedSubscript:@"language"];
      *(_DWORD *)buf = 136315650;
      id v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
      __int16 v29 = 2114;
      id v30 = v24;
      __int16 v31 = 2114;
      CFStringRef v32 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Mismatch in speech profile language in content (%{public}@) and filename (%{public}@)", buf, 0x20u);
    }
  }
  id v18 = [(__CFString *)v12 valueForKey:@"version"];
  if (([(__CFString *)v18 isEqual:@"2.0"] & 1) == 0)
  {
    unint64_t v22 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
      __int16 v29 = 2114;
      id v30 = v18;
      __int16 v31 = 2114;
      CFStringRef v32 = @"2.0";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Profile version on disk (%{public}@) does not match the expected version (%{public}@)", buf, 0x20u);
    }

    goto LABEL_23;
  }

  if (!v16)
  {
LABEL_23:
    v8[2](v8, 0, 0);
    goto LABEL_24;
  }
  id v19 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[ESConnection readProfileAndUserDataWithLanguage:allowOverride:completion:]";
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Successfully deserialized existing speech profile for %@", buf, 0x16u);
  }
  id v20 = [(__CFString *)v12 valueForKey:@"data"];
  id v21 = [(__CFString *)v12 valueForKey:@"assetPath"];
  ((void (**)(id, void *, void *))v8)[2](v8, v20, v21);

LABEL_24:
}

- (void)cleanupUnusedSubscriptions
{
}

- (void)handlePostUpgradeSubscriptions
{
}

- (id)_audioDataPostRecognitionStart:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_timeUntilRecognitionStartInMs <= 0.0)
  {
    id v9 = v4;
  }
  else
  {
    +[CESRUtilities audioDurationInMs:v4 samplingRate:self->_samplingRate];
    double v7 = self->_timeUntilRecognitionStartInMs - v6;
    self->_timeUntilRecognitionStartInMs = v7;
    if (v7 >= 0.0)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    +[CESRUtilities audioData:withBytesFromEnd:](CESRUtilities, "audioData:withBytesFromEnd:", v5, +[CESRUtilities audioLengthInBytes:self->_samplingRate samplingRate:fabs(v7)]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v9;
LABEL_7:

  return v8;
}

- (void)_updateAudioDuration:(id)a3
{
  +[CESRUtilities audioDurationInMs:a3 samplingRate:self->_samplingRate];
  self->_audioDurationMs = v4 + self->_audioDurationMs;
}

- (void)_processAudioPacket:(id)a3
{
  id v4 = a3;
  id v5 = [v4 data];
  double v6 = [v4 packetTimestamps];

  double v7 = [v6 packetRecordedTimeInTicks];
  [v6 packetReceivedTime];
  double v9 = v8;
  id v10 = [v6 packetReceivedTimeInTicks];
  if (!self->_firstAudioPacketRecordedTimeInTicks) {
    objc_storeStrong((id *)&self->_firstAudioPacketRecordedTimeInTicks, v7);
  }
  if (self->_firstAudioPacketReceivedTime == 2.22507386e-308)
  {
    self->_firstAudioPacketReceivedTime = v9;
    objc_storeStrong((id *)&self->_firstAudioPacketReceivedTimeInTicks, v10);
  }
  if (self->_firstAudioPacketTimeUntilFirstPartial == 2.22507386e-308) {
    self->_firstAudioPacketTimeUntilFirstPartial = v9;
  }
  self->_lastAudioPacketReceivedTime = v9;
  objc_storeStrong((id *)&self->_lastAudioPacketReceivedTimeInTicks, v10);
  unint64_t v11 = (unint64_t)[v5 length] >> 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);
  id v19 = v5;
  objc_msgSend(WeakRetained, "addAudioSamples:count:", objc_msgSend(v19, "bytes"), v11);

  [(ESConnection *)self _updateAudioDuration:v19];
  [v6 setCumulativeAudioDuration:self->_audioDurationMs / 1000.0];
  id v13 = [v6 packetReadyUpstreamTimeInTicks];
  if (v13) {
    [(NSMutableArray *)self->_processedPacketsReadyUpstreamTimestampsBuffer addObject:v13];
  }
  [v6 cumulativeAudioDuration];
  BOOL v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (v14) {
    [(NSMutableArray *)self->_processedPacketsCumulativeAudioDurationBuffer addObject:v14];
  }
  if (!self->_firstAudioPacketProcessed)
  {
    self->_firstAudioPacketProcessed = 1;
    __int16 v15 = +[ESProfiler sharedProfiler];
    unsigned int v16 = [v6 packetReadyUpstreamTimeInTicks];
    [v15 logFirstAudioPacketReadyUpstreamWithTimeInTicks:v16];

    id v17 = +[ESProfiler sharedProfiler];
    id v18 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v17 logFirstAudioPacketProcessedWithTimeInTicks:v18];
  }
  [(id)qword_10005DA78 addAudioPacket:v19];
}

- (id)_packetReadyUpstreamTimestampsFromAudioTime:(float)a3
{
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10001CDFC;
  BOOL v14 = sub_10001CE0C;
  id v15 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:0];
  processedPacketsReadyUpstreamTimestampsBuffer = self->_processedPacketsReadyUpstreamTimestampsBuffer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027308;
  v8[3] = &unk_100051028;
  float v9 = a3;
  v8[4] = self;
  void v8[5] = &v10;
  [(NSMutableArray *)processedPacketsReadyUpstreamTimestampsBuffer enumerateObjectsUsingBlock:v8];
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_recordedTimestampFromAudioTime:(float)a3
{
  firstAudioPacketRecordedTimeInTicks = self->_firstAudioPacketRecordedTimeInTicks;
  if (firstAudioPacketRecordedTimeInTicks)
  {
    id v5 = (char *)[firstAudioPacketRecordedTimeInTicks unsignedLongLongValue];
    *(float *)&double v6 = a3;
    firstAudioPacketRecordedTimeInTicks = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", &v5[(void)+[CESRUtilities secondsToHostTime:v6]]);
  }

  return firstAudioPacketRecordedTimeInTicks;
}

- (void)_processBufferedAudioPackets
{
  if (self->_bufferedRequestEagerResultData)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = self->_bufferedRequestEagerResultData;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = (double)((unint64_t)[*(id *)(*((void *)&v16 + 1) + 8 * (void)v8) unsignedLongValue] >> 1)/ (double)self->_samplingRate* 1000.0- self->_timeUntilRecognitionStartInMs;
          if (v9 >= 0.0)
          {
            uint64_t v10 = +[NSNumber numberWithDouble:v9 / 1000.0];
            [v3 addObject:v10];
          }
          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    if ([v3 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_recognizer);
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_recognizer);
        [v13 requestEagerResult:v3];
      }
    }
  }
  bufferedAudioPackets = self->_bufferedAudioPackets;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_100027658;
  v15[3] = &unk_100051000;
  v15[4] = self;
  [(NSMutableArray *)bufferedAudioPackets enumerateObjectsUsingBlock:v15];
  self->_bufferedAudioDataLength = 0;
  [(NSMutableArray *)self->_bufferedRequestEagerResultData removeAllObjects];
  [(NSMutableArray *)self->_bufferedAudioPackets removeAllObjects];
}

- (void)stopAudioDecoding
{
  p_audioBuffer = &self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (WeakRetained)
  {
    id v4 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[ESConnection stopAudioDecoding]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stopping audio decoding since RC has been accepted", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)p_audioBuffer);
    [v5 stopAudioDecoding];
  }
}

- (void)finishAudio
{
  p_audioBuffer = &self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_audioBuffer);
    [v5 endAudio];
  }
  else
  {
    self->_bufferedAudioEnded = 1;
  }
}

- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unint64_t v11 = [ESAudioPacketTimestamps alloc];
  char v12 = +[NSProcessInfo processInfo];
  [v12 systemUptime];
  double v14 = v13;
  id v15 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  long long v19 = [(ESAudioPacketTimestamps *)v11 initWithPacketRecordedTimeInTicks:v10 packetReadyUpstreamTimeInTicks:v9 packetReceivedTime:v15 packetReceivedTimeInTicks:v14];

  long long v16 = [[ESAudioPacket alloc] initWithData:v8 packetTimestamps:v19];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (WeakRetained)
  {
    [(ESStoreAudioData *)self->_storeAudioData addAudioPacket:v8];
    uint64_t v18 = [(ESConnection *)self _audioDataPostRecognitionStart:v8];

    [(ESAudioPacket *)v16 setData:v18];
    if (!v18) {
      goto LABEL_6;
    }
    [(ESConnection *)self _processAudioPacket:v16];
    id v8 = (id)v18;
  }
  else
  {
    [(NSMutableArray *)self->_bufferedAudioPackets addObject:v16];
    self->_bufferedAudioDataLength += (unint64_t)[v8 length];
  }

LABEL_6:
}

- (void)addAudioPacket:(id)a3
{
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 correctedText];
  id v8 = [v5 recognizedTextInfo];
  id v9 = [v8 objectForKeyedSubscript:@"userEditedText"];

  if ([v7 length] && objc_msgSend(v6, "length"))
  {
    id v10 = qword_10005D9E8;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100027B34;
    v11[3] = &unk_100050FD8;
    id v12 = v6;
    id v13 = v7;
    id v14 = v9;
    id v15 = v5;
    dispatch_async(v10, v11);
  }
}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4
{
  id v5 = a3;
  v355 = (void (**)(id, void, id))a4;
  id v6 = [v5 task];
  if (+[CESRUtilities isTaskDictationSpecific:v6])
  {
    uint64_t v7 = [v5 location];

    if (v7)
    {
      id v8 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s Location data was provided in the context of a Dictation request!", buf, 0xCu);
      }

      uint64_t v9 = [v5 mutatedCopyWithMutator:&stru_100050F38];

      id v5 = (id)v9;
    }
  }
  else
  {
  }
  id v10 = (id)qword_10005D9F8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Starting", buf, 0xCu);
  }

  -[ESConnection adjustAppleTVLogLevelForSecureOfflineOnly:](self, "adjustAppleTVLogLevelForSecureOfflineOnly:", [v5 secureOfflineOnly]);
  v354 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  os_signpost_id_t v11 = os_signpost_id_generate(AFSiriLogContextSpeech);
  id v12 = AFSiriLogContextSpeech;
  id v13 = v12;
  os_signpost_id_t spid = v11;
  unint64_t v343 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "SiriX";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ES: Recognizer Init", "%s %s", buf, 0x16u);
  }

  self->_recognitionBeginTime = 0.0;
  self->_resultCandidateId = 0;
  self->_audioDurationMs = 0.0;
  self->_processedAudioDuration = 0.0;
  self->_recognitionEndTime = 0.0;
  self->_recognitionAbsoluteEndTime = 0.0;
  self->_BOOL isSpeechAPIRequest = [v5 isSpeechAPIRequest];
  +[ESConnection _sendPendingAnalyticsEvents];
  p_audioBuffer = (id *)&self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);

  if (!WeakRetained)
  {
    if (qword_10005DA00)
    {
      uint64_t v18 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Previous recognizer on other XPC connection is busy. Send sync cancel", buf, 0xCu);
      }

      os_signpost_id_t v19 = os_signpost_id_generate(AFSiriLogContextSpeech);
      id v20 = AFSiriLogContextSpeech;
      id v21 = v20;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        uint64_t v22 = mach_continuous_time();
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = v22;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ES: Previous Request Cancellation", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
      }

      [(id)qword_10005DA30 cancelRecognition];
      id v23 = AFSiriLogContextSpeech;
      id v24 = v23;
      if (v19 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
      {
        uint64_t v25 = mach_continuous_time();
        *(_DWORD *)buf = 134349056;
        *(void *)&uint8_t buf[4] = v25;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v19, "ES: Previous Request Cancellation", "%{public, signpost.description:end_time}llu", buf, 0xCu);
      }

      id v26 = (void *)qword_10005DA00;
      qword_10005DA00 = 0;
    }
    [v5 recognitionStart];
    self->_timeUntilRecognitionStartInMs = v27 * 1000.0;
    id v28 = [v5 applicationName];
    if (v28)
    {
      applicationName = [v5 applicationName];
      p_applicationName = &self->_applicationName;
      objc_storeStrong((id *)&self->_applicationName, applicationName);
    }
    else
    {
      p_applicationName = &self->_applicationName;
      applicationName = self->_applicationName;
      self->_applicationName = (NSString *)&stru_1000519F0;
    }

    id v30 = [v5 overrides];
    __int16 v31 = v30;
    if (v30)
    {
      id v32 = [v30 mutableCopy];
      id v33 = [v32 objectForKey:@"continuousListening"];

      if (v33)
      {
        uint64_t v34 = [v32 objectForKey:@"continuousListening"];
        unsigned int v352 = [v34 BOOLValue];

        [v32 removeObjectForKey:@"continuousListening"];
      }
      else
      {
        unsigned int v352 = 0;
      }
      BOOL v35 = [v32 objectForKey:@"shouldHandleCapitalization"];

      if (v35)
      {
        BOOL v36 = [v32 objectForKey:@"shouldHandleCapitalization"];
        unsigned int v330 = [v36 BOOLValue];

        [v32 removeObjectForKey:@"shouldHandleCapitalization"];
      }
      else
      {
        unsigned int v330 = 0;
      }
      if ([v32 count])
      {
        id v347 = [v32 copy];

        __int16 v31 = v347;
      }
      else
      {
        id v347 = 0;
      }
    }
    else
    {
      unsigned int v330 = 0;
      unsigned int v352 = 0;
      id v347 = 0;
    }
    unsigned int v337 = [v5 continuousListening];
    unsigned int v328 = [v5 shouldHandleCapitalization];
    id v37 = [v5 modelOverrideURL];
    sub_10002B2F4(v347, v37);
    id v342 = (id)objc_claimAutoreleasedReturnValue();

    id v38 = objc_alloc((Class)SFEntitledAssetConfig);
    id v39 = [v5 language];
    BOOL v40 = [v5 task];
    id v346 = [v38 initWithLanguage:v39 task:v40];

    dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
    v41 = [v5 language];
    id v42 = [v5 location];
    id obj = [(ESConnection *)self geoLMRegionIdWithLanguage:v41 location:v42];

    location = (id *)&self->_recognizer;
    objc_storeWeak((id *)&self->_recognizer, 0);
    v350 = (void *)qword_10005DA30;
    if (!qword_10005DA30)
    {
      id v55 = (id)qword_10005D9F8;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s No cached recognizer.", buf, 0xCu);
      }

      goto LABEL_70;
    }
    id v43 = [v5 task];
    unsigned int v44 = [v350 isSpeakerCodeTrainingSupported:v43];

    if (v44) {
      [(id)qword_10005DA30 interruptTraining];
    }
    unsigned int v45 = qword_10005DA38 == 0;
    if (obj) {
      unsigned int v45 = objc_msgSend((id)qword_10005DA38, "isEqualToString:");
    }
    long long v46 = (void *)qword_10005DA28;
    long long v47 = [v5 language];
    if ([v46 isEqualToString:v47])
    {
      unsigned int v48 = [v342 isEqualToDictionary:qword_10005DA48];

      if (v48)
      {
        long long v49 = (id)qword_10005D9F8;
        BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
        if (v45)
        {
          if (v50)
          {
            uint64_t v51 = [v5 language];
            __int16 v52 = (void *)v51;
            CFStringRef v53 = @"(none)";
            *(_DWORD *)buf = 136315651;
            *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            if (obj) {
              CFStringRef v53 = obj;
            }
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v51;
            *(_WORD *)&buf[22] = 2113;
            v401 = (uint64_t (*)(uint64_t, uint64_t))v53;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%s Cached recognizer for language: %{public}@, regionId: %{private}@ already loaded.", buf, 0x20u);
          }
          __int16 v54 = 0;
        }
        else
        {
          if (v50)
          {
            CFStringRef v124 = (const __CFString *)qword_10005DA38;
            CFStringRef v125 = @"(none)";
            if (!qword_10005DA38) {
              CFStringRef v124 = @"(none)";
            }
            if (obj) {
              CFStringRef v125 = obj;
            }
            *(_DWORD *)buf = 136315907;
            *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = qword_10005DA28;
            *(_WORD *)&buf[22] = 2113;
            v401 = (uint64_t (*)(uint64_t, uint64_t))v124;
            *(_WORD *)v402 = 2113;
            *(void *)&v402[2] = v125;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%s Cached recognizer is for language: %{public}@, regionId: %{private}@, but this request specifies a different regionId: %{private}@. Discarding the cached recognizer upon cooldown.", buf, 0x2Au);
          }

          __int16 v54 = obj;
        }
        v126 = (void *)qword_10005DA68;
        qword_10005DA68 = (uint64_t)v54;

        v127 = (void *)qword_10005DA30;
        id v128 = objc_storeWeak(location, (id)qword_10005DA30);
        v348 = [v127 modelInfo];

        if (v348)
        {
          id v129 = objc_loadWeakRetained(location);
          BOOL v130 = v129 == 0;

          if (!v130)
          {
            unsigned int v340 = 0;
            id v72 = 0;
            goto LABEL_76;
          }
LABEL_71:
          id v66 = [v5 modelOverrideURL];
          NSErrorUserInfoKey v67 = [v5 task];
          CFStringRef v68 = +[CESRUtilities recognizerSourceForTask:v67];
          BOOL isHighPriority = self->_isHighPriority;
          v388 = &off_100054168;
          id v387 = 0;
          BYTE1(v309) = isHighPriority;
          LOBYTE(v309) = 0;
          uint64_t v70 = +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:](ESConnection, "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:", v346, obj, 1, v347, v66, 0, v68, v309, &v388, &v387);
          v71 = v388;
          id v72 = v387;
          v73 = (void *)qword_10005DA30;
          qword_10005DA30 = v70;

          if (!qword_10005DA40)
          {
            uint64_t v74 = +[NSHashTable weakObjectsHashTable];
            v75 = (void *)qword_10005DA40;
            qword_10005DA40 = v74;
          }
          v76 = (void *)qword_10005DA30;
          if (qword_10005DA30)
          {
            id v77 = objc_storeWeak(location, (id)qword_10005DA30);
            uint64_t v78 = [v76 modelInfo];

            [(id)qword_10005DA40 addObject:qword_10005DA30];
            uint64_t v79 = [v5 language];
            v80 = (void *)qword_10005DA28;
            qword_10005DA28 = v79;

            objc_storeStrong((id *)&qword_10005DA38, obj);
            objc_storeStrong((id *)&qword_10005DA48, v342);
            byte_10005DA50 = [v71 BOOLValue];
            v348 = (void *)v78;
          }

          unsigned int v340 = 1;
LABEL_76:
          if (qword_10005DA30) {
            +[ESConnection _scheduleCooldownTimer];
          }
          id v81 = objc_loadWeakRetained(location);
          BOOL v82 = v81 == 0;

          if (v82)
          {
            if (v355) {
              v355[2](v355, 0, v72);
            }
            [(ESConnection *)self startRequestActivityWithCompletion:0];
            goto LABEL_243;
          }
          v83 = [v5 task];
          id v386 = v72;
          sub_1000223E0(v348, v83, &v386);
          v84 = (NSString *)objc_claimAutoreleasedReturnValue();
          id v332 = v386;

          taskToUse = self->_taskToUse;
          self->_taskToUse = v84;

          if (!self->_taskToUse)
          {
            if (v355) {
              v355[2](v355, 0, v332);
            }
            [(ESConnection *)self startRequestActivityWithCompletion:0];
            goto LABEL_242;
          }
          id v86 = objc_alloc((Class)CESRModelProperties);
          v87 = [v348 version];
          id v88 = objc_loadWeakRetained(location);
          v89 = [v88 modelType];
          id v90 = objc_loadWeakRetained(location);
          v91 = [v90 modelRoot];
          id v335 = [v86 initWithModelVersion:v87 modelType:v89 modelRoot:v91];

          v92 = [(ESConnection *)self _delegate];
          [v92 speechServiceDidSelectRecognitionModelWithModelProperties:v335];

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v401 = sub_10001CDFC;
          *(void *)v402 = sub_10001CE0C;
          *(void *)&v402[8] = 0;
          v383[0] = _NSConcreteStackBlock;
          v383[1] = 3221225472;
          v383[2] = sub_10002B380;
          v383[3] = &unk_100050F60;
          v385 = buf;
          id v333 = v346;
          id v384 = v333;
          v320 = objc_retainBlock(v383);
          v93 = [ESSelfHelper alloc];
          v94 = self->_taskToUse;
          BOOL isSpeechAPIRequest = self->_isSpeechAPIRequest;
          v96 = [v5 requestIdentifier];
          v97 = [v5 language];
          v98 = [v5 asrId];
          v323 = [(ESSelfHelper *)v93 initWithTask:v94 isSpeechAPIRequest:isSpeechAPIRequest requestId:v96 language:v97 asrId:v98];

          v99 = +[ESProfiler sharedProfiler];
          [v99 setESSelfHelper:v323];
          unsigned int v318 = v337 | v352;
          v353 = v99;
          if (v99)
          {
            v100 = +[SFEntitledAssetManager sharedInstance];
            v338 = [v100 modelQualityTypeStatusStringWithConfig:v333];

            if (v338)
            {
              v321 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v338 isEqualToString:@"HQ"]);
            }
            else
            {
              v321 = 0;
            }
            v101 = [v5 language];
            v326 = +[CESRUtilities speechProfileDateLastModifiedForLanguage:v101];

            if (v326)
            {
              [v326 timeIntervalSinceNow];
              v316 = +[NSNumber numberWithDouble:fabs(v102)];
            }
            else
            {
              v316 = 0;
            }
            v103 = +[ESAssetManager sharedInstance];
            v104 = [v5 language];
            dispatch_group_t groupa = [v103 installedHammerConfigFileForLanguage:v104];

            id v314 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:groupa];
            v105 = +[PPConfigStore defaultStore];
            id v382 = 0;
            v106 = [v105 variantNameWithError:&v382];
            id v312 = v382;

            [v353 logPendingPreheatContextEvents:qword_10005DA70];
            +[ESConnection _clearPendingProfilerEvents];
            v107 = self->_taskToUse;
            v108 = [v348 language];
            v109 = [v348 version];
            v110 = [v314 version];
            uint64_t v111 = qword_10005DA38;
            LODWORD(v104) = byte_10005DA50;
            v112 = [v5 dictationUIInteractionIdentifier];
            LOBYTE(v308) = v104 != 0;
            [v353 logRequestStartedOrChangedWithTask:v107 modelLocale:v108 modelVersion:v109 isHighQualityAsset:v321 hammerVersion:v110 geoLanguageModelRegion:v111 geoLanguageModelLoaded:v308 speechProfileAgeInSec:v316 dictationUIInteractionId:v112 portraitExperimentVariantName:v106 applicationName:*p_applicationName powerLogEvent:@"startSpeechRecognitionWithParameters"];

            v113 = [v353 selfHelper];
            [v113 setContinuousListeningEnabled:v318];

            [v353 logInitializationStartedOrChangedWithTimeInTicks:v354 cachedRecognizerExisted:v350 != 0 newRecognizerCreated:v340];
            v99 = v353;
          }
          v114 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
          [v99 logInitializationEndedWithTimeInTicks:v114 isSpeechRecognizerCreated:v340];

          if (qword_10005DA18)
          {
            objc_msgSend(v353, "logESStartWithTimeInTicks:");
            v115 = (void *)qword_10005DA18;
            qword_10005DA18 = 0;
          }
          v116 = +[NSProcessInfo processInfo];
          [v116 systemUptime];
          self->_recognitionBeginTime = v117;

          if ([v5 censorSpeech])
          {
            ((void (*)(void))v320[2])();
            id v322 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v322 = 0;
          }
          id v118 = objc_loadWeakRetained(location);
          [v118 setRecognitionReplacements:v322];

          if ([(NSString *)self->_taskToUse isEqualToString:CoreEmbeddedSpeechRecognizerTaskVoiceMail])
          {
            id v119 = v333;
            uint64_t v120 = objc_opt_class();
            sub_10002B424(v119, @"voicemail_confidence_subtraction.json", v120);
            id v121 = (id)objc_claimAutoreleasedReturnValue();

            if (!v121)
            {
              v122 = ((void (*)(void))v320[2])();
              if (v122)
              {
                v380[0] = _NSConcreteStackBlock;
                v380[1] = 3221225472;
                v380[2] = sub_10002B87C;
                v380[3] = &unk_100050F88;
                id v123 = objc_alloc_init((Class)NSMutableDictionary);
                id v381 = v123;
                [v122 enumerateKeysAndObjectsUsingBlock:v380];
                id v121 = [v123 copy];
              }
              else
              {
                id v121 = 0;
              }
            }
            id v131 = objc_loadWeakRetained(location);
            [v131 setRecognitionConfidenceSubtraction:v121];
          }
          if ([v5 disableDeliveringAsrFeatures])
          {
            [v5 endpointStart];
            if (v132 > 0.0)
            {
              v133 = AFSiriLogContextConnection;
              if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v395 = 136315138;
                *(void *)&v395[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                _os_log_error_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_ERROR, "%s EndpointStart > 0 but asr features delivery is disabled!", v395, 0xCu);
              }
            }
          }
          self->_disableDeliveringAsrFeatures = [v5 disableDeliveringAsrFeatures];
          [v5 endpointStart];
          if (v134 >= 0.0)
          {
            v135 = objc_loadWeakRetained(location);
            [v5 endpointStart];
            -[NSObject setEndpointStart:](v135, "setEndpointStart:");
          }
          else
          {
            v135 = AFSiriLogContextConnection;
            if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v395 = 136315138;
              *(void *)&v395[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              _os_log_error_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_ERROR, "%s EndpointStart < 0", v395, 0xCu);
            }
          }

          v136 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
          [v353 logAotLmeStartedOrChangedWithTimeInTicks:v136];

          v137 = [v5 profile];
          LODWORD(v136) = v137 == 0;

          if (v136)
          {
            if (qword_10005DA58)
            {
              id v139 = (id)qword_10005DA58;
              id v140 = (id)qword_10005DA58;
              qword_10005DA58 = (uint64_t)v139;
            }
            else
            {
              id v140 = objc_alloc_init((Class)NSMutableDictionary);
              objc_storeStrong((id *)&qword_10005DA58, v140);
            }

            uint64_t v141 = qword_10005DA58;
            v142 = [v5 language];
            +[CESRUtilities loadSpeechProfiles:v141 language:v142];

            id v138 = objc_alloc_init((Class)NSMutableArray);
            long long v378 = 0u;
            long long v379 = 0u;
            long long v376 = 0u;
            long long v377 = 0u;
            id v143 = (id)qword_10005DA58;
            id v144 = [v143 countByEnumeratingWithState:&v376 objects:v399 count:16];
            if (v144)
            {
              uint64_t v145 = *(void *)v377;
              do
              {
                for (i = 0; i != v144; i = (char *)i + 1)
                {
                  if (*(void *)v377 != v145) {
                    objc_enumerationMutation(v143);
                  }
                  v147 = [(id)qword_10005DA58 objectForKeyedSubscript:*(void *)(*((void *)&v376 + 1) + 8 * i)];
                  [v138 addObject:v147];
                }
                id v144 = [v143 countByEnumeratingWithState:&v376 objects:v399 count:16];
              }
              while (v144);
            }

            if ([v138 count])
            {
              id v148 = objc_loadWeakRetained(location);
              [v148 setUserProfileData:0];
            }
          }
          else
          {
            id v138 = 0;
          }
          v149 = AFSiriLogContextSpeech;
          if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
          {
            id v301 = [v138 count];
            v302 = [v5 profile];
            *(_DWORD *)v395 = 136315650;
            *(void *)&v395[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            *(_WORD *)&v395[12] = 1024;
            *(_DWORD *)&v395[14] = v301 != 0;
            *(_WORD *)&v395[18] = 1024;
            *(_DWORD *)&v395[20] = v302 != 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_DEBUG, "%s Setting new profile: %d, old profile: %d", v395, 0x18u);
          }
          id v150 = objc_loadWeakRetained(location);
          v151 = [v138 firstObject];
          [v150 setUserProfile:v151];

          v152 = [v138 firstObject];
          v153 = [v152 experimentIds];
          [v353 logPersonalizationExperimentTriggersForExperimentIds:v153];

          v154 = [v5 profile];

          if (v154)
          {
            id v155 = objc_loadWeakRetained(location);
            v156 = [v5 profile];
            [v155 setUserProfileData:v156];
          }
          v157 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
          [v353 logAotLmeEndedWithTimeInTicks:v157];

          dispatch_time_t v158 = dispatch_time(0, 500000000);
          *(void *)v395 = 0;
          *(void *)&v395[8] = v395;
          *(void *)&v395[16] = 0x3032000000;
          v396 = sub_10001CDFC;
          v397 = sub_10001CE0C;
          id v398 = 0;
          id v341 = objc_alloc_init((Class)NSMutableArray);
          v315 = +[NSProcessInfo processInfo];
          [v315 systemUptime];
          double v160 = v159;
          v317 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
          uint64_t v370 = 0;
          v371 = &v370;
          uint64_t v372 = 0x3032000000;
          v373 = sub_10001CDFC;
          v374 = sub_10001CE0C;
          id v375 = 0;
          if ([(id)qword_10005DA20 length])
          {
            v161 = [ESContextualData alloc];
            uint64_t v162 = qword_10005DA20;
            v163 = self->_taskToUse;
            v164 = [v5 applicationName];
            id v327 = [(ESContextualData *)v161 initWithConfiguration:v162 taskName:v163 applicationName:v164];
          }
          else
          {
            v164 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v389 = 136315394;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              __int16 v391 = 2112;
              double v392 = 0.0;
              _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_INFO, "%s Failed to get model root, error: %@", v389, 0x16u);
            }
            id v327 = 0;
          }

          v165 = [v5 jitGrammar];

          if (v165)
          {
            v166 = [v5 jitGrammar];
            [v341 addObjectsFromArray:v166];
          }
          unint64_t v167 = (unint64_t)[v341 count] | (unint64_t)v327;
          BOOL v168 = v167 != 0;
          if (v167)
          {
            group = dispatch_group_create();
            if (self->_isHighPriority)
            {
              v169 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
            }
            else
            {
              v169 = 0;
            }
            v170 = dispatch_queue_create("jitDataProcessing", v169);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10002B890;
            block[3] = &unk_100050FB0;
            id v362 = v327;
            v363 = self;
            id v364 = v341;
            id v365 = v333;
            id v366 = v5;
            id v367 = v347;
            v368 = v395;
            v369 = &v370;
            dispatch_group_async(group, v170, block);
          }
          else
          {
            group = 0;
          }
          v171 = [v5 inputOrigin];

          if (v171)
          {
            id v172 = objc_loadWeakRetained(location);
            v173 = [v5 inputOrigin];
            [v172 setInputOrigin:v173];

            v174 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
            {
              double v305 = [v5 inputOrigin];
              *(_DWORD *)v389 = 136315394;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              __int16 v391 = 2112;
              double v392 = v305;
              _os_log_debug_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEBUG, "%s Set inputOrigin to: %@", v389, 0x16u);
            }
          }
          if (!self->_localMetrics)
          {
            v175 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            localMetrics = self->_localMetrics;
            self->_localMetrics = v175;
          }
          v339 = +[NSMutableArray array];
          int v360 = 0;
          double v359 = 0.0;
          v177 = self->_taskToUse;
          v178 = self->_applicationName;
          id v179 = objc_loadWeakRetained(location);
          v334 = [(ESConnection *)self personalizedLMWithTask:v177 applicationName:v178 recognizer:v179 weightOut:&v360 ageOut:&v359];

          if (v334)
          {
            [v339 addObject:v334];
            [(id)qword_10005DA78 setPersonalizedLMUsed:1];
          }
          v181 = self->_localMetrics;
          LODWORD(v180) = v360;
          v182 = +[NSNumber numberWithFloat:v180];
          [(NSMutableDictionary *)v181 setValue:v182 forKey:@"personalizedLMWeight"];

          v183 = self->_localMetrics;
          v184 = +[NSNumber numberWithDouble:v359];
          [(NSMutableDictionary *)v183 setValue:v184 forKey:@"personalizedLMAge"];

          v185 = [v353 selfHelper];
          v186 = +[NSNumber numberWithDouble:v359];
          [v185 setPersonalizedLmAgeInSec:v186];

          v187 = [v353 selfHelper];
          LODWORD(v188) = v360;
          v189 = +[NSNumber numberWithFloat:v188];
          [v187 setPersonalizedLmWeight:v189];

          if (_os_feature_enabled_impl()
            && [(NSString *)self->_taskToUse isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging])
          {
            v190 = (void *)qword_10005DA80;
            if (!qword_10005DA80)
            {
              id v191 = [[ESUaapLm alloc] initUaapLm];
              v192 = (void *)qword_10005DA80;
              qword_10005DA80 = (uint64_t)v191;

              v190 = (void *)qword_10005DA80;
            }
            v193 = [v5 language];
            id v194 = objc_loadWeakRetained(location);
            v195 = [v190 readUaapLMsForLanguage:v193 recognizer:v194];

            [v339 addObjectsFromArray:v195];
          }
          id v196 = objc_loadWeakRetained(location);
          [v196 setExtraLmList:v339];

          id v197 = objc_loadWeakRetained(location);
          [v197 setDetectUtterances:1];

          id v198 = objc_loadWeakRetained(location);
          objc_msgSend(v198, "setConcatenateUtterances:", objc_msgSend(v5, "detectUtterances") ^ 1);

          if ([v5 deliverEagerPackage])
          {
            id v199 = objc_loadWeakRetained(location);
            [v199 setDetectUtterances:0];

            id v200 = objc_loadWeakRetained(location);
            [v200 setConcatenateUtterances:0];

            v201 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(v201, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v389 = 136315138;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_DEBUG, "%s Switching off UC/UD for this request", v389, 0xCu);
            }
          }
          id v202 = objc_loadWeakRetained(location);
          [v5 maximumRecognitionDuration];
          objc_msgSend(v202, "setMaximumRecognitionDuration:");

          id v203 = objc_loadWeakRetained(location);
          objc_msgSend(v203, "setFarField:", objc_msgSend(v5, "farField"));

          id v204 = objc_loadWeakRetained(location);
          [v204 setAllowUtteranceDelay:v318];

          id v205 = objc_loadWeakRetained(location);
          [v205 setFormatAcrossUtterances:v328 | v330];

          id v206 = objc_loadWeakRetained(location);
          objc_msgSend(v206, "setDisableAutoPunctuation:", objc_msgSend(v5, "enableAutoPunctuation") ^ 1);

          id v207 = objc_loadWeakRetained(location);
          objc_msgSend(v207, "setRecognizeEmoji:", objc_msgSend(v5, "enableEmojiRecognition"));

          id v208 = objc_loadWeakRetained(location);
          uint64_t v209 = [v5 prefixText];
          [v208 setLeftContextText:v209];

          id v210 = objc_loadWeakRetained(location);
          LOBYTE(v209) = objc_opt_respondsToSelector();

          if (v209)
          {
            id v211 = objc_loadWeakRetained(location);
            v212 = [v5 postfixText];
            [v211 setRightContext:v212];
          }
          id v213 = objc_loadWeakRetained(location);
          char v214 = objc_opt_respondsToSelector();

          if (v214)
          {
            id v215 = objc_loadWeakRetained(location);
            v216 = [v5 selectedText];
            [v215 setSelectedText:v216];
          }
          id v217 = objc_loadWeakRetained(location);
          objc_msgSend(v217, "setEnableVoiceCommands:", objc_msgSend(v5, "enableVoiceCommands"));

          if ([v5 enableVoiceCommands]) {
            uint64_t v218 = 1;
          }
          else {
            uint64_t v218 = (uint64_t)[v5 shouldGenerateVoiceCommandCandidates];
          }
          id v219 = objc_loadWeakRetained(location);
          [v219 setShouldGenerateVoiceCommandCandidates:v218];

          unsigned int v220 = [v5 narrowband];
          unint64_t v221 = 16000;
          if (v220) {
            unint64_t v221 = 8000;
          }
          self->_samplingRate = v221;
          v222 = [v5 codec];
          if (v222)
          {
            v319 = [v5 codec];
          }
          else
          {
            v319 = &stru_1000519F0;
          }

          id v223 = objc_loadWeakRetained(location);
          v331 = [v223 activeConfiguration];

          id v351 = [v331 copy];
          v224 = [v351 farFieldFilter];
          LOBYTE(v223) = v224 == 0;

          if ((v223 & 1) == 0)
          {
            v225 = [v351 farFieldFilter];
            v226 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 farField]);
            v227 = [v225 setByAddingObject:v226];
            [v351 setFarFieldFilter:v227];
          }
          v228 = [v351 samplingRateFilter];
          BOOL v229 = v228 == 0;

          if (!v229)
          {
            v230 = [v351 samplingRateFilter];
            v231 = +[NSNumber numberWithUnsignedInteger:self->_samplingRate];
            v232 = [v230 setByAddingObject:v231];
            [v351 setSamplingRateFilter:v232];
          }
          v233 = [v351 taskTypeFilter];
          BOOL v234 = v233 == 0;

          if (!v234)
          {
            v235 = [v351 taskTypeFilter];
            v236 = [v235 setByAddingObject:self->_taskToUse];
            [v351 setTaskTypeFilter:v236];
          }
          [v351 setDeviceIdFilter:0];
          [v351 setAneContextFilter:0];
          [v351 setCpuContextFilter:0];
          [v351 setGpuContextFilter:0];
          v237 = AFSiriLogContextSpeech;
          if (os_log_type_enabled(v237, OS_LOG_TYPE_DEBUG))
          {
            sub_10002BC1C(v331);
            double v303 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
            sub_10002BC1C(v351);
            id v304 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v389 = 136315650;
            v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            __int16 v391 = 2112;
            double v392 = v303;
            __int16 v393 = 2112;
            id v394 = v304;
            _os_log_debug_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_DEBUG, "%s Changing active configuration from \n%@ to \n%@", v389, 0x20u);
          }
          v238 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
          [v353 logActiveConfigUpdateStartedOrChangedWithTimeInTicks:v238];

          id v239 = objc_loadWeakRetained(location);
          [v239 setActiveConfiguration:v351];

          v240 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
          [v353 logActiveConfigUpdateEndedWithTimeInTicks:v240];

          v241 = (_EARSpeakerCodeWriter *)objc_alloc_init((Class)_EARSpeakerCodeWriter);
          speakerCodeWriter = self->_speakerCodeWriter;
          self->_speakerCodeWriter = v241;

          if (group) {
            BOOL v243 = v168;
          }
          else {
            BOOL v243 = 0;
          }
          if (v243 && !dispatch_group_wait(group, v158) && (v294 = *(void **)(*(void *)&v395[8] + 40)) != 0)
          {
            id v329 = v294;
            v295 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(v295, OS_LOG_TYPE_INFO))
            {
              double v296 = COERCE_DOUBLE([v341 count]);
              id v297 = [*(id *)(*(void *)&v395[8] + 40) length];
              *(_DWORD *)v389 = 136315650;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              __int16 v391 = 2048;
              double v392 = v296;
              __int16 v393 = 2048;
              id v394 = v297;
              _os_log_impl((void *)&_mh_execute_header, v295, OS_LOG_TYPE_INFO, "%s Injected %lu jit strings or contextual data to recognizer, length: %lu", v389, 0x20u);
            }

            if (v371[5])
            {
              [v353 logJitLmeStartedOrChangedWithTimeInTicks:v317];
              [v353 logJitLmeEndedAndEndedTier1WithDialogContext:v341 timeInTicks:v371[5]];
              +[CESRUtilities hostTimeToSeconds:](CESRUtilities, "hostTimeToSeconds:", [(id)v371[5] unsignedLongLongValue]);
              float v299 = v298;
              v300 = AFSiriLogContextSpeech;
              if (os_log_type_enabled(v300, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v389 = 136315394;
                v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                __int16 v391 = 2050;
                double v392 = v299 - v160;
                _os_log_impl((void *)&_mh_execute_header, v300, OS_LOG_TYPE_INFO, "%s Duration spent in jit processing on critical path = %{public}lfs", v389, 0x16u);
              }
            }
          }
          else
          {
            id v329 = 0;
          }
          id v244 = objc_loadWeakRetained(location);
          [v244 setJitProfileData:v329];

          id v245 = objc_loadWeakRetained(location);
          v246 = self->_speakerCodeWriter;
          v247 = [v5 language];
          locationa = [v245 runRecognitionWithResultStream:self speakerCodeWriter:v246 language:v247 task:self->_taskToUse samplingRate:self->_samplingRate];

          objc_storeStrong((id *)&qword_10005DA00, locationa);
          objc_storeWeak(p_audioBuffer, locationa);
          if (v355) {
            ((void (**)(id, id, id))v355)[2](v355, v335, 0);
          }
          self->_shouldStoreDictationAudioOnDevice = 0;
          v248 = [v5 task];
          unsigned int v249 = +[CESRUtilities isTaskDictationSpecific:v248];

          if (v249 && !self->_isSpeechAPIRequest)
          {
            v250 = +[CESRDictationOnDeviceSampling sharedManager];
            v251 = [v5 language];
            self->_shouldStoreDictationAudioOnDevice = [v250 isRequestSelectedForSamplingFromConfigForLanguage:v251];
          }
          v252 = AFSiriLogContextSpeech;
          if (os_log_type_enabled(v252, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v389 = 136315138;
            v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            _os_log_debug_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEBUG, "%s Audio storing from embeddedspeech not supported on this platform.", v389, 0xCu);
          }

          if (qword_10005DA88)
          {
            v253 = AFSiriLogContextFides;
            if (os_log_type_enabled(v253, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v389 = 136315138;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_DEBUG, "%s Cancelling delayedBlock", v389, 0xCu);
            }

            dispatch_block_cancel((dispatch_block_t)qword_10005DA88);
            v254 = (void *)qword_10005DA88;
            qword_10005DA88 = 0;
          }
          if (![(ESConnection *)self shouldWriteDictationRecord:self->_taskToUse]) {
            goto LABEL_216;
          }
          v255 = AFSiriLogContextFides;
          if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
          {
            double v256 = [v5 dictationUIInteractionIdentifier];
            *(_DWORD *)v389 = 136315394;
            v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
            __int16 v391 = 2112;
            double v392 = v256;
            _os_log_impl((void *)&_mh_execute_header, v255, OS_LOG_TYPE_INFO, "%s Create DES record for Dictation with interactionId=%@", v389, 0x16u);
          }
          if ([(ESConnection *)self siriDataSharingOptedIn]
            && self->_shouldStoreDictationAudioOnDevice)
          {
            v257 = [v5 language];
            v311 = self->_taskToUse;
            v313 = [v5 loggingContext];
            unsigned int v310 = [v5 narrowband];
            id v258 = [v5 farField];
            v259 = [v5 dictationUIInteractionIdentifier];
            v260 = [v353 selfHelper];
            v261 = [v260 asrId];
            v262 = [v261 UUIDString];
            uint64_t v263 = +[CESRFidesASRRecord recordWithLanguage:v257 task:v311 context:v313 narrowband:v310 farField:v258 interactionIdentifier:v259 asrSelfComponentIdentifier:v262 pluginId:@"com.apple.siri.speech-dictation-personalization" frequency:1];
            v264 = (void *)qword_10005DA78;
            qword_10005DA78 = v263;
          }
          else
          {
LABEL_216:
            v257 = (void *)qword_10005DA78;
            qword_10005DA78 = 0;
          }

          if (qword_10005DA78)
          {
            [(id)qword_10005DA78 setApplicationName:*p_applicationName];
            v265 = [v5 profile];

            if (v265)
            {
              v266 = (void *)qword_10005DA78;
              v267 = [v5 profile];
              [v266 setProfile:v267];
            }
            else
            {
              if ([v138 count] != (id)1) {
                goto LABEL_221;
              }
              v291 = [v138 firstObject];
              v267 = [v291 data];

              if (v267)
              {
                v292 = AFSiriLogContextFides;
                if (os_log_type_enabled(v292, OS_LOG_TYPE_INFO))
                {
                  double v293 = COERCE_DOUBLE([v267 length]);
                  *(_DWORD *)v389 = 136315394;
                  v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                  __int16 v391 = 2048;
                  double v392 = v293;
                  _os_log_impl((void *)&_mh_execute_header, v292, OS_LOG_TYPE_INFO, "%s Saving profile snapshot: %lu bytes", v389, 0x16u);
                }

                [(id)qword_10005DA78 setProfile:v267];
              }
            }
          }
LABEL_221:
          if (qword_10005DA90)
          {
            v268 = AFSiriLogContextFides;
            if (os_log_type_enabled(v268, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v389 = 136315138;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_DEBUG, "%s Cancelling edit delayedBlock", v389, 0xCu);
            }

            dispatch_block_cancel((dispatch_block_t)qword_10005DA90);
            v269 = (void *)qword_10005DA90;
            qword_10005DA90 = 0;
          }
          v270 = [ESBiomeAsrRecord alloc];
          v271 = [v353 selfHelper];
          v272 = [v271 asrId];
          v273 = [v272 UUIDString];
          v274 = [v5 dictationUIInteractionIdentifier];
          v275 = [v5 language];
          v276 = [v5 task];
          v277 = [(ESBiomeAsrRecord *)v270 initWithAsrId:v273 interactionId:v274 language:v275 taskName:v276 samplingRate:self->_samplingRate];
          v278 = (void *)qword_10005DA98;
          qword_10005DA98 = (uint64_t)v277;

          if (qword_10005DA98)
          {
            v279 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(v279, OS_LOG_TYPE_DEBUG))
            {
              double v306 = [(id)qword_10005DA98 asrId];
              id v307 = [(id)qword_10005DA98 interactionId];
              *(_DWORD *)v389 = 136315650;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              __int16 v391 = 2112;
              double v392 = v306;
              __int16 v393 = 2112;
              id v394 = v307;
              _os_log_debug_impl((void *)&_mh_execute_header, v279, OS_LOG_TYPE_DEBUG, "%s Created edited record, asrId: %@, interactionId: %@", v389, 0x20u);
            }
          }
          if (self->_storeAudioData)
          {
            v280 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v389 = 136315138;
              v390 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
              _os_log_error_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_ERROR, "%s _storeAudioData should be nil. Critical Error. Please check.", v389, 0xCu);
            }

            storeAudioData = self->_storeAudioData;
            self->_storeAudioData = 0;
          }
          v282 = objc_alloc_init(ESBiomeRecord);
          biomeRecord = self->_biomeRecord;
          self->_biomeRecord = v282;

          [(ESBiomeRecord *)self->_biomeRecord setApplicationName:self->_applicationName];
          v284 = self->_biomeRecord;
          v285 = [v5 dictationUIInteractionIdentifier];
          [(ESBiomeRecord *)v284 setInteractionId:v285];

          [(ESBiomeRecord *)self->_biomeRecord setTaskName:self->_taskToUse];
          if (qword_10005DAA0)
          {
            [(id)qword_10005DAA0 removeAllObjects];
          }
          else
          {
            id v286 = objc_alloc_init((Class)NSMutableDictionary);
            v287 = (void *)qword_10005DAA0;
            qword_10005DAA0 = (uint64_t)v286;
          }
          v288 = AFSiriLogContextSpeech;
          v289 = v288;
          if (v343 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v288))
          {
            *(_DWORD *)v389 = 136315394;
            v390 = "SiriX";
            __int16 v391 = 2080;
            double v392 = COERCE_DOUBLE("enableTelemetry=YES");
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v289, OS_SIGNPOST_INTERVAL_END, spid, "ES: Recognizer Init", "%s %s", v389, 0x16u);
          }

          [(ESConnection *)self _processBufferedAudioPackets];
          if (self->_bufferedAudioEnded)
          {
            id v290 = objc_loadWeakRetained(p_audioBuffer);
            [v290 endAudio];

            self->_bufferedAudioEnded = 0;
          }
          +[ESConnection _cancelCooldownTimer];

          _Block_object_dispose(&v370, 8);
          _Block_object_dispose(v395, 8);

          _Block_object_dispose(buf, 8);
LABEL_242:
          id v72 = v332;
LABEL_243:

          goto LABEL_244;
        }
LABEL_70:
        v348 = 0;
        goto LABEL_71;
      }
    }
    else
    {
    }
    v56 = (id)qword_10005D9F8;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v57 = qword_10005DA28;
      if (qword_10005DA38) {
        CFStringRef v58 = (const __CFString *)qword_10005DA38;
      }
      else {
        CFStringRef v58 = @"(none)";
      }
      uint64_t v59 = [v5 language];
      v60 = (void *)v59;
      *(_DWORD *)buf = 136316163;
      CFStringRef v61 = obj;
      if (!obj) {
        CFStringRef v61 = @"(none)";
      }
      *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2113;
      v401 = (uint64_t (*)(uint64_t, uint64_t))v58;
      *(_WORD *)v402 = 2114;
      *(void *)&v402[2] = v59;
      *(_WORD *)&v402[10] = 2113;
      *(void *)&v402[12] = v61;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s Cached recognizer is for language: %{public}@, regionId: %{private}@, requesting recognizer for language: %{public}@, regionId: %{private}@", buf, 0x34u);
    }
    v62 = (void *)qword_10005DA68;
    qword_10005DA68 = 0;

    uint64_t v63 = qword_10005DA28;
    CFStringRef v64 = [v5 language];
    LOBYTE(v63) = [(id)v63 isEqualToString:v64];

    if ((v63 & 1) == 0)
    {
      __int16 v65 = +[SFEntitledAssetManager sharedInstance];
      [v65 refreshAssetSetWithConfig:v346 regionId:obj];
    }
    +[ESConnection _discardCachedRecognizer];
    goto LABEL_70;
  }
  id v15 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Recognizer is busy", buf, 0xCu);
  }
  if (v355)
  {
    NSErrorUserInfoKey v403 = NSLocalizedDescriptionKey;
    CFStringRef v404 = @"Recognizer is busy";
    long long v16 = +[NSDictionary dictionaryWithObjects:&v404 forKeys:&v403 count:1];
    long long v17 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1100 userInfo:v16];
    v355[2](v355, 0, v17);
  }
  [(ESConnection *)self startRequestActivityWithCompletion:0];
LABEL_244:
}

- (void)adjustAppleTVLogLevelForSecureOfflineOnly:(BOOL)a3
{
  BOOL v3 = a3;
  if (AFIsATV() && AFIsInternalInstall())
  {
    id v4 = AFSiriLogContextSpeech;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        int v6 = 136315138;
        uint64_t v7 = "-[ESConnection adjustAppleTVLogLevelForSecureOfflineOnly:]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Setting Quasar log level to WARN", (uint8_t *)&v6, 0xCu);
      }
      +[_EARLogHelper setCustomQuasarLogLevel:2];
    }
    else
    {
      if (v5)
      {
        int v6 = 136315138;
        uint64_t v7 = "-[ESConnection adjustAppleTVLogLevelForSecureOfflineOnly:]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Settting Quasar log level to System Default", (uint8_t *)&v6, 0xCu);
      }
      +[_EARLogHelper setQuasarLogLevelToSystemDefault];
    }
  }
}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C05C;
  v7[3] = &unk_100050EF8;
  id v8 = a4;
  id v6 = v8;
  [(ESConnection *)self startSpeechRecognitionWithParameters:a3 didStartHandlerWithInfo:v7];
}

- (id)geoLMRegionIdWithLanguage:(id)a3 location:(id)a4
{
  id v5 = a3;
  id v6 = (void *)qword_10005DA28;
  id v7 = a4;
  if (![v6 isEqualToString:v5]
    || (+[ESAssetManager sharedInstance],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 geoLmInitialized],
        v8,
        (v9 & 1) == 0))
  {
    id v10 = +[ESAssetManager sharedInstance];
    [v10 initializeGeoLMWithLanguage:v5];
  }
  os_signpost_id_t v11 = +[ESAssetManager sharedInstance];
  id v12 = [v11 geoLMRegionIdForLocation:v7];

  return v12;
}

- (BOOL)shouldWriteDictationRecord:(id)a3
{
  id v3 = a3;
  uint64_t v4 = AFDeviceHighestLanguageModelCapabilityIdentifier();
  id v5 = (void *)AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v9 = v5;
    int v10 = 136315906;
    os_signpost_id_t v11 = "-[ESConnection shouldWriteDictationRecord:]";
    __int16 v12 = 1024;
    int v13 = AFOfflineDictationCapable();
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 1024;
    BOOL v17 = v4 > 9;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s dictationCapable=%d task=%@ aneCapable=%d", (uint8_t *)&v10, 0x22u);
  }
  if (AFOfflineDictationCapable())
  {
    unsigned __int8 v6 = +[CESRUtilities isTaskDictationSpecific:v3];
    if (v4 > 9) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)siriDataSharingOptedIn
{
  v2 = +[AFPreferences sharedPreferences];
  id v3 = [v2 siriDataSharingOptInStatus];

  return v3 == (id)1;
}

- (id)personalizedLMWithTask:(id)a3 applicationName:(id)a4 recognizer:(id)a5 weightOut:(float *)a6 ageOut:(double *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  size_t v14 = sysconf(71);
  if (v14 == -1)
  {
    id v15 = 0;
  }
  else
  {
    memset(&v32, 0, sizeof(v32));
    __int16 v31 = 0;
    id v15 = 0;
    if (!getpwnam_r("mobile", &v32, (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14, &v31) && v31)
    {
      __int16 v16 = +[NSString stringWithUTF8String:v32.pw_dir];
      v45[0] = v16;
      v45[1] = @"Library";
      v45[2] = @"/Assistant";
      v45[3] = @"SpeechPersonalizedLM";
      BOOL v17 = +[NSArray arrayWithObjects:v45 count:4];
      uint64_t v18 = +[NSString pathWithComponents:v17];

      if (!v18) {
        goto LABEL_17;
      }
      os_signpost_id_t v19 = (void *)qword_10005DA60;
      if (!qword_10005DA60)
      {
        id v20 = objc_alloc_init((Class)_EARLmLoader);
        id v21 = (void *)qword_10005DA60;
        qword_10005DA60 = (uint64_t)v20;

        os_signpost_id_t v19 = (void *)qword_10005DA60;
      }
      uint64_t v22 = [v19 loadForRecognitionWithDirectory:v18 recognizer:v13 task:v11 applicationName:v12];
      if (v22)
      {
        id v23 = v22;
        id v15 = [v22 handle];
        if (v15)
        {
          [v23 weight];
          float v25 = v24;
          [v23 age];
          uint64_t v27 = v26;
          if (a6) {
            *a6 = v25;
          }
          if (a7) {
            *(void *)a7 = v26;
          }
          id v28 = qword_10005D9F8;
          if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316419;
            uint64_t v34 = "-[ESConnection personalizedLMWithTask:applicationName:recognizer:weightOut:ageOut:]";
            __int16 v35 = 2113;
            BOOL v36 = v18;
            __int16 v37 = 2113;
            id v38 = v11;
            __int16 v39 = 2113;
            id v40 = v12;
            __int16 v41 = 2048;
            double v42 = v25;
            __int16 v43 = 2048;
            uint64_t v44 = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s PLM: Loaded path=%{private}@ task=%{private}@ applicationName=%{private}@ weight=%f age=%f", buf, 0x3Eu);
          }
        }
      }
      else
      {
LABEL_17:
        id v15 = 0;
      }
    }
  }

  return v15;
}

- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v11 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v74 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
    __int16 v75 = 2114;
    id v76 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Preheat for %{public}@", buf, 0x16u);
  }
  if (qword_10005DA00)
  {
    id v12 = (void *)qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      [v8 assetType];
      size_t v14 = SFEntitledAssetTypeToString();
      *(_DWORD *)buf = 136315394;
      uint64_t v74 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
      __int16 v75 = 2114;
      id v76 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Preheat for %{public}@ dismissed because recognition in progress", buf, 0x16u);
    }
  }
  else
  {
    +[ESConnection _clearPendingAnalyticsEvents];
    id v66 = AFAnalyticsEventCreateCurrent();
    +[ESConnection _addPendingAnalyticsEvent:](ESConnection, "_addPendingAnalyticsEvent:");
    +[ESConnection _clearPendingProfilerEvents];
    CFStringRef v64 = +[ESSelfHelper createPreheatStartedOrChangedEvent];
    +[ESConnection _addPendingProfilerPreheatEvent:](ESConnection, "_addPendingProfilerPreheatEvent:");
    id v15 = [v8 language];
    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    sub_10002B2F4(0, v10);
    id v68 = (id)objc_claimAutoreleasedReturnValue();
    id obj = v15;
    unsigned int v17 = [(id)qword_10005DA28 isEqualToString:v15];
    if (qword_10005DA30) {
      unsigned int v18 = v17;
    }
    else {
      unsigned int v18 = 0;
    }
    +[ESConnection _scheduleCooldownTimer];
    unsigned int v63 = v18;
    v69 = v16;
    id v67 = v9;
    if (v18 == 1)
    {
      [v16 setObject:@"AlreadyLoaded" forKey:@"Preheating"];
      os_signpost_id_t v19 = qword_10005D9F8;
      BOOL v20 = 0;
      if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v74 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
        __int16 v75 = 2114;
        id v76 = v15;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Skipping preheat for %{public}@; recognizer already loaded",
          buf,
          0x16u);
        BOOL v20 = 0;
      }
    }
    else
    {
      if (v10)
      {
        id v21 = +[NSString stringWithFormat:@" with CustomModelURL %@", v10];
      }
      else
      {
        id v21 = &stru_1000519F0;
      }
      if (!qword_10005DA38)
      {
        uint64_t v22 = +[CESRGeoLMRegionIDCache sharedInstance];
        uint64_t v23 = [v22 lastUsedGeoLMRegionIdForLanguage:v15];
        float v24 = (void *)qword_10005DA38;
        qword_10005DA38 = v23;
      }
      if (qword_10005DA30)
      {
        if (([(id)qword_10005DA28 isEqualToString:v15] & 1) == 0)
        {
          float v25 = +[SFEntitledAssetManager sharedInstance];
          [v25 refreshAssetSetWithConfig:v8 regionId:qword_10005DA38];
        }
        uint64_t v26 = (void *)qword_10005DA30;
        uint64_t v27 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing];
        [v26 setActiveConfiguration:v27];

        id v28 = (void *)qword_10005DA30;
        qword_10005DA30 = 0;
      }
      __int16 v29 = [(id)qword_10005DA40 allObjects];
      id v30 = [v29 count];

      if (v30)
      {
        __int16 v31 = (void *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
        {
          uint64_t v57 = (void *)qword_10005DA40;
          CFStringRef v58 = v31;
          uint64_t v59 = [v57 allObjects];
          id v60 = [v59 count];
          *(_DWORD *)buf = 136315394;
          uint64_t v74 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
          __int16 v75 = 2048;
          id v76 = v60;
          _os_log_fault_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_FAULT, "%s sRecognizerTracker: Too many recognizers active during preheat: %lu", buf, 0x16u);
        }
      }
      BOOL isHighPriority = self->_isHighPriority;
      id v71 = 0;
      id v72 = &off_100054168;
      BYTE1(v62) = isHighPriority;
      LOBYTE(v62) = 0;
      uint64_t v33 = +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:](ESConnection, "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:", v8, qword_10005DA38, 1, 0, v10, 1, v9, v62, &v72, &v71);
      uint64_t v34 = v72;
      id v35 = v71;
      BOOL v36 = (void *)qword_10005DA30;
      qword_10005DA30 = v33;

      if (!qword_10005DA40)
      {
        uint64_t v37 = +[NSHashTable weakObjectsHashTable];
        id v38 = (void *)qword_10005DA40;
        qword_10005DA40 = v37;
      }
      BOOL v20 = qword_10005DA30 == 0;
      __int16 v65 = v34;
      if (qword_10005DA30)
      {
        objc_storeStrong((id *)&qword_10005DA28, v15);
        objc_storeStrong((id *)&qword_10005DA48, v68);
        byte_10005DA50 = [v34 BOOLValue];
        [(id)qword_10005DA40 addObject:qword_10005DA30];
        __int16 v39 = [(id)qword_10005DA30 modelInfo];
        id v40 = [v39 version];

        [v69 setObject:@"Success" forKey:@"Preheating"];
        __int16 v41 = qword_10005D9F8;
        if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v42 = (const __CFString *)qword_10005DA38;
          *(_DWORD *)buf = 136316163;
          if (!qword_10005DA38) {
            CFStringRef v42 = @"(none)";
          }
          uint64_t v74 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
          __int16 v75 = 2114;
          id v76 = v15;
          __int16 v77 = 2114;
          id v78 = v67;
          __int16 v79 = 2113;
          CFStringRef v80 = v42;
          __int16 v81 = 2114;
          BOOL v82 = v21;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s Preheated for language %{public}@, source %{public}@, regionId %{private}@%{public}@", buf, 0x34u);
        }
      }
      else
      {
        [v69 setObject:@"Failure" forKey:@"Preheating"];
        __int16 v43 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v61 = (const __CFString *)qword_10005DA38;
          if (!qword_10005DA38) {
            CFStringRef v61 = @"(none)";
          }
          *(_DWORD *)buf = 136316419;
          uint64_t v74 = "-[ESConnection preheatSpeechRecognitionWithAssetConfig:preheatSource:modelOverrideURL:]";
          __int16 v75 = 2114;
          id v76 = v15;
          __int16 v77 = 2114;
          id v78 = v67;
          __int16 v79 = 2113;
          CFStringRef v80 = v61;
          __int16 v81 = 2114;
          BOOL v82 = v21;
          __int16 v83 = 2112;
          id v84 = v35;
          _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s Could not preheat for language %{public}@, source %{public}@, regionId %{private}@%{public}@: %@", buf, 0x3Eu);
          id v40 = &stru_1000519F0;
        }
        else
        {
          id v40 = &stru_1000519F0;
        }
      }
      uint64_t v44 = +[ESProfiler sharedProfiler];
      [v44 logPreheatOnlyEventsWithPowerLogEvent:@"preheatSpeechRecognitionWithAssetConfig" language:v15 modelVersion:v40];

      unsigned int v45 = +[ESAssetManager sharedInstance];
      [v45 purgeUnusedGeoLMAssetsForLanguage:v15];
    }
    if (qword_10005DA58) {
      id v46 = (id)qword_10005DA58;
    }
    else {
      id v46 = objc_alloc_init((Class)NSMutableDictionary);
    }
    long long v47 = (void *)qword_10005DA58;
    qword_10005DA58 = (uint64_t)v46;

    +[CESRUtilities loadSpeechProfiles:qword_10005DA58 language:v15];
    if (v20) {
      +[ESSelfHelper createPreheatFailedEvent];
    }
    else {
    unsigned int v48 = +[ESSelfHelper createPreheatEndedEventWithPreheatAlreadyDone:v63];
    }
    +[ESConnection _addPendingProfilerPreheatEvent:v48];
    long long v49 = [v48 preheatContext];
    BOOL v50 = [v49 timestampInTicks];
    uint64_t v51 = [v50 unsignedLongLongValue];
    __int16 v52 = [v64 preheatContext];
    CFStringRef v53 = [v52 timestampInTicks];
    int64_t v54 = v51 - (unsigned char *)[v53 unsignedLongLongValue];

    +[CESRUtilities hostTimeToSeconds:v54];
    NSLog(@"Preheat time interval in seconds: %lf", v55);
    v56 = AFAnalyticsEventCreateCurrent();
    +[ESConnection _addPendingAnalyticsEvent:v56];

    id v9 = v67;
  }
}

- (void)preheatSpeechRecognitionWithLanguage:(id)a3 modelOverrideURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v7 assetType:3];

  [(ESConnection *)self preheatSpeechRecognitionWithAssetConfig:v8 preheatSource:0 modelOverrideURL:v6];
}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withDetailedStatus:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v9 = (void (**)(id, void *, id))a6;
  id v10 = +[ESAssetManager sharedInstance];
  id v14 = 0;
  id v11 = [v10 installationStatusForLanguagesIgnoringCache:v8 assetType:a4 withDetailedStatus:v6 withError:&v14];
  id v12 = v14;

  if (!v11)
  {
    id v13 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[ESConnection getOfflineAssetStatusIgnoringCache:assetType:withDetailedStatus:withCompletion:]";
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Could not get installed offline language statuses: %{public}@", buf, 0x16u);
    }
  }
  v9[2](v9, v11, v12);
}

- (void)getOfflineAssetStatusIgnoringCache:(BOOL)a3 assetType:(unint64_t)a4 withCompletion:(id)a5
{
}

- (void)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 completion:(id)a7
{
  id v13 = 0;
  id v11 = (void (**)(id, id))a7;
  +[CESRUaapData writeUaapOovsForLanguage:a3 bundleId:a4 customProns:a5 newOovs:a6 error:&v13];
  id v12 = v13;
  v11[2](v11, v12);
}

- (void)fetchModelPropertiesForAssetConfig:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D230;
  v7[3] = &unk_100050EB0;
  id v8 = a4;
  id v6 = v8;
  [(ESConnection *)self fetchModelInfoForAssetConfig:a3 triggerDownload:0 completion:v7];
}

- (void)fetchModelInfoForAssetConfig:(id)a3 triggerDownload:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [v7 language];
  if (v9)
  {
    id v10 = +[ESAssetManager sharedInstance];
    id v36 = 0;
    id v11 = [v10 installedModelInfoForAssetConfig:v7 error:&v36 triggerDownload:v6];
    id v12 = v36;

    uint64_t v13 = [v11 objectForKey:@"quasarModelPath"];
    if (v13)
    {
      id v14 = (void *)v13;
LABEL_17:
      if (v8)
      {
        if (v11) {
          id v31 = 0;
        }
        else {
          id v31 = v12;
        }
        ((void (**)(id, void *, id))v8)[2](v8, v11, v31);
      }

      goto LABEL_23;
    }
    id v16 = +[ESAssetManager sharedInstance];
    id v35 = v12;
    __int16 v17 = objc_msgSend(v16, "installationStatusForLanguagesIgnoringCache:assetType:withDetailedStatus:withError:", 0, objc_msgSend(v7, "assetType"), 0, &v35);
    id v18 = v35;

    if (!v17)
    {
      id v30 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v38 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
        __int16 v39 = 2114;
        id v40 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Could not get offline language for fetch fallback: %{public}@", buf, 0x16u);
      }
      id v12 = v18;
      goto LABEL_16;
    }
    os_signpost_id_t v19 = [v17 allKeys];
    uint64_t v20 = +[NSSet setWithArray:v19];

    uint64_t v33 = (void *)v20;
    uint64_t v32 = AFOfflineDictationLanguageForKeyboardLanguage();
    id v21 = objc_msgSend(objc_alloc((Class)SFEntitledAssetConfig), "initWithLanguage:assetType:", v32, objc_msgSend(v7, "assetType"));
    uint64_t v22 = +[ESAssetManager sharedInstance];
    id v34 = v18;
    uint64_t v23 = [v22 installedModelInfoForAssetConfig:v21 error:&v34 triggerDownload:v6];
    id v12 = v34;

    id v14 = [v23 objectForKey:@"quasarModelPath"];
    float v24 = AFSiriLogContextSpeech;
    BOOL v25 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      uint64_t v26 = (void *)v32;
      if (!v25) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315650;
      id v38 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
      __int16 v39 = 2114;
      id v40 = v9;
      __int16 v41 = 2114;
      uint64_t v42 = v32;
      uint64_t v27 = "%s Fell back asset fetch from %{public}@ to %{public}@";
      id v28 = v24;
      uint32_t v29 = 32;
    }
    else
    {
      uint64_t v26 = (void *)v32;
      if (!v25) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315906;
      id v38 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
      __int16 v39 = 2114;
      id v40 = v9;
      __int16 v41 = 2114;
      uint64_t v42 = v32;
      __int16 v43 = 2114;
      id v44 = v12;
      uint64_t v27 = "%s Failed to fall back asset fetch from %{public}@ to %{public}@, got %{public}@";
      id v28 = v24;
      uint32_t v29 = 42;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_15:

    id v11 = v23;
    if (v14) {
      goto LABEL_17;
    }
LABEL_16:

    id v14 = 0;
    id v11 = 0;
    goto LABEL_17;
  }
  id v15 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v38 = "-[ESConnection fetchModelInfoForAssetConfig:triggerDownload:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Failing to fetch assets for nil language", buf, 0xCu);
  }
  id v12 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1104 userInfo:0];
  ((void (**)(id, void *, id))v8)[2](v8, 0, v12);
LABEL_23:
}

- (void)fetchModelInfoForAssetConfig:(id)a3 completion:(id)a4
{
}

- (void)startRequestActivityWithCompletion:(id)a3
{
  id v7 = a3;
  requestCompletion = (void (**)(void))self->_requestCompletion;
  if (requestCompletion) {
    requestCompletion[2]();
  }
  id v5 = objc_retainBlock(v7);
  id v6 = self->_requestCompletion;
  self->_requestCompletion = v5;
}

- (id)_sLowPrioritySerialQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  v2 = (void *)qword_10005DA08;
  if (!qword_10005DA08)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.ESConnection.lowPrioritySerial", v4);
    id v6 = (void *)qword_10005DA08;
    qword_10005DA08 = (uint64_t)v5;

    v2 = (void *)qword_10005DA08;
  }

  return v2;
}

- (id)_redecodeQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  redecodeQueue = self->_redecodeQueue;
  if (!redecodeQueue)
  {
    uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.ESConnection.redecode", 0);
    dispatch_queue_t v5 = self->_redecodeQueue;
    self->_redecodeQueue = v4;

    redecodeQueue = self->_redecodeQueue;
  }

  return redecodeQueue;
}

- (BOOL)_invalidated
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)qword_10005D9E8);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002DB70;
  v4[3] = &unk_100050E88;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)qword_10005D9E8, v4);
  LOBYTE(self) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)self;
}

- (id)_fidesEvalQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  fidesEvalQueue = self->_fidesEvalQueue;
  if (!fidesEvalQueue)
  {
    uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.ESConnection.fidesEval", 0);
    uint64_t v5 = self->_fidesEvalQueue;
    self->_fidesEvalQueue = v4;

    fidesEvalQueue = self->_fidesEvalQueue;
  }

  return fidesEvalQueue;
}

- (id)_delegate
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (void)dealloc
{
  p_audioBuffer = &self->_audioBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);
  [WeakRetained cancelRecognition];

  id v5 = objc_loadWeakRetained((id *)p_audioBuffer);
  uint64_t v6 = qword_10005DA00;

  if (v5 == (id)v6)
  {
    uint64_t v7 = (void *)qword_10005DA00;
    qword_10005DA00 = 0;
  }
  [(NSXPCConnection *)self->_connection invalidate];
  char v8 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ESConnection dealloc]";
    __int16 v12 = 2114;
    uint64_t v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ deallocating", buf, 0x16u);
  }
  v9.receiver = self;
  v9.super_class = (Class)ESConnection;
  [(ESConnection *)&v9 dealloc];
}

- (ESConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ESConnection;
  uint64_t v6 = [(ESConnection *)&v31 init];
  if (v6)
  {
    uint64_t v7 = (void *)qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = v7;
      objc_super v9 = +[NSXPCListener _UUID];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ESConnection initWithXPCConnection:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Instantiating ESConnection %{public}@", buf, 0x16u);
    }
    v6->_resultCandidateId = 0;
    v6->_lastWordCount = 0;
    v6->_disableDeliveringAsrFeatures = 0;
    objc_storeStrong((id *)&v6->_connection, a3);
    id v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    bufferedAudioPackets = v6->_bufferedAudioPackets;
    v6->_bufferedAudioPackets = v10;

    v6->_bufferedAudioDataLength = 0;
    __int16 v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    bufferedRequestEagerResultData = v6->_bufferedRequestEagerResultData;
    v6->_bufferedRequestEagerResultData = v12;

    firstAudioPacketRecordedTimeInTicks = v6->_firstAudioPacketRecordedTimeInTicks;
    v6->_firstAudioPacketRecordedTimeInTicks = 0;

    v6->_firstAudioPacketReceivedTime = 2.22507386e-308;
    firstAudioPacketReceivedTimeInTicks = v6->_firstAudioPacketReceivedTimeInTicks;
    v6->_firstAudioPacketReceivedTimeInTicks = 0;

    v6->_firstAudioPacketTimeUntilFirstPartial = 2.22507386e-308;
    v6->_timeUntilRecognitionStartInMs = 0.0;
    id v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    processedPacketsReadyUpstreamTimestampsBuffer = v6->_processedPacketsReadyUpstreamTimestampsBuffer;
    v6->_processedPacketsReadyUpstreamTimestampsBuffer = v16;

    id v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    processedPacketsCumulativeAudioDurationBuffer = v6->_processedPacketsCumulativeAudioDurationBuffer;
    v6->_processedPacketsCumulativeAudioDurationBuffer = v18;

    v6->_partialResultCount = 0;
    v6->_partialResultOffset = 0;
    uint64_t v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    partialResultsTimeList = v6->_partialResultsTimeList;
    v6->_partialResultsTimeList = v20;

    uint64_t v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    firstSeenPartialResultTokens = v6->_firstSeenPartialResultTokens;
    v6->_firstSeenPartialResultTokens = v22;

    if ((AFDeviceSupportsSiriUOD() & 1) != 0 || AFOfflineDictationCapable())
    {
      float v24 = +[AFPreferences sharedPreferences];
      unsigned int v25 = [v24 infersQoSFromInstanceUUIDForEAR];

      if (v25)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        uuid_clear(buf);
        if (xpc_get_instance())
        {
          if (CoreEmbeddedSpeechRecognizerGetIsHighPriorityFromInstanceUUID())
          {
            uint64_t v26 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t v32 = 136315138;
              uint64_t v33 = "-[ESConnection initWithXPCConnection:]";
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s ASR: Using high priority configuration.", v32, 0xCu);
            }
            v6->_BOOL isHighPriority = 1;
          }
        }
      }
    }
    [(NSXPCConnection *)v6->_connection _setQueue:qword_10005D9E8];
    objc_initWeak((id *)buf, v6);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002E080;
    v29[3] = &unk_100050E60;
    objc_copyWeak(&v30, (id *)buf);
    uint64_t v27 = objc_retainBlock(v29);
    [v5 setInterruptionHandler:v27];
    [v5 setInvalidationHandler:v27];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (ESConnection)init
{
  return 0;
}

+ (id)getSharedUaapLm
{
  return (id)qword_10005DA80;
}

+ (id)getRecognizerQueue
{
  return (id)qword_10005D9E8;
}

+ (void)didFinishModelInitializing:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  id v5 = qword_10005D9E8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E364;
  v8[3] = &unk_1000513D0;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  dispatch_async(v5, v8);
}

+ (void)didStartModelInitializing:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  id v5 = qword_10005D9E8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E4F8;
  v8[3] = &unk_1000513D0;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  dispatch_async(v5, v8);
}

+ (id)_languagesToCompileForAssetType:(unint64_t)a3 assetManager:(id)a4
{
  id v5 = a4;
  id v6 = SFEntitledAssetTypeToString();
  id v7 = +[NSMutableSet set];
  if (a3 == 7)
  {
    id v16 = [v5 installedLanguagesForAssetType:7];
    id v17 = [v16 mutableCopy];

    id v7 = v17;
  }
  else if (a3 == 3)
  {
    char v8 = [v5 installationStatusForLanguagesWithAssetType:3];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = objc_msgSend(v8, "allKeys", 0);
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v15 = [v8 objectForKey:v14];
          if (SFEntitledAssetStatusIsInstalled() && SFEntitledAssetStatusIsHighQuality()) {
            [v7 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v18 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v31 = "+[ESConnection _languagesToCompileForAssetType:assetManager:]";
      __int16 v32 = 2112;
      uint64_t v33 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s %@ assets do not support model compilation.", buf, 0x16u);
    }
  }
  id v19 = [v7 count];
  uint64_t v20 = qword_10005D9F8;
  BOOL v21 = os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (!v21) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315650;
    objc_super v31 = "+[ESConnection _languagesToCompileForAssetType:assetManager:]";
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    uint64_t v22 = "%s %@ assets eligible for model compilation: %@";
    uint64_t v23 = v20;
    uint32_t v24 = 32;
  }
  else
  {
    if (!v21) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    objc_super v31 = "+[ESConnection _languagesToCompileForAssetType:assetManager:]";
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    uint64_t v22 = "%s No %@ assets eligible for model compilation.";
    uint64_t v23 = v20;
    uint32_t v24 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_23:

  return v7;
}

+ (void)_clearPendingProfilerEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  [(id)qword_10005DA70 removeAllObjects];
  v2 = (void *)qword_10005DA70;
  qword_10005DA70 = 0;

  [(id)qword_10005DAC0 removeAllObjects];
  id v3 = (void *)qword_10005DAC0;
  qword_10005DAC0 = 0;
}

+ (void)_addPendingProfilerANEModelInitializationEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v3 = (void *)qword_10005DAC0;
  if (!qword_10005DAC0)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = (void *)qword_10005DAC0;
    qword_10005DAC0 = (uint64_t)v4;

    id v3 = (void *)qword_10005DAC0;
  }
  [v3 addObject:v6];
}

+ (void)_addPendingProfilerPreheatEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v3 = (void *)qword_10005DA70;
  if (!qword_10005DA70)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = (void *)qword_10005DA70;
    qword_10005DA70 = (uint64_t)v4;

    id v3 = (void *)qword_10005DA70;
  }
  [v3 addObject:v6];
}

+ (void)_clearPendingAnalyticsEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  [(id)qword_10005DAB8 removeAllObjects];
  v2 = (void *)qword_10005DAB8;
  qword_10005DAB8 = 0;
}

+ (void)_sendPendingAnalyticsEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  if ([(id)qword_10005DAB8 count])
  {
    v2 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v3 = (void *)qword_10005DAB8;
      id v4 = v2;
      int v7 = 136315394;
      char v8 = "+[ESConnection _sendPendingAnalyticsEvents]";
      __int16 v9 = 2048;
      id v10 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Sending %lu events", (uint8_t *)&v7, 0x16u);
    }
    id v5 = +[AFAnalytics sharedAnalytics];
    id v6 = [(id)qword_10005DAB8 copy];
    [v5 logEvents:v6];
  }
  +[ESConnection _clearPendingAnalyticsEvents];
}

+ (void)_addPendingAnalyticsEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v3 = (void *)qword_10005DAB8;
  if (!qword_10005DAB8)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = (void *)qword_10005DAB8;
    qword_10005DAB8 = (uint64_t)v4;

    id v3 = (void *)qword_10005DAB8;
  }
  [v3 addObject:v6];
}

+ (void)prepareToExit
{
  v2 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "+[ESConnection prepareToExit]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Received termination signal. Cleaning up immediately", (uint8_t *)&v4, 0xCu);
  }
  id v3 = (void *)qword_10005DAB0;
  qword_10005DAB0 = 0;
}

+ (void)_cachedRecognizerCleanUp
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v3 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    BOOL v21 = "+[ESConnection _cachedRecognizerCleanUp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v20, 0xCu);
  }
  int v4 = (void *)qword_10005DA30;
  id v5 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing];
  [v4 setActiveConfiguration:v5];

  id v6 = (void *)qword_10005DA30;
  qword_10005DA30 = 0;

  int v7 = (void *)qword_10005DA28;
  qword_10005DA28 = 0;

  char v8 = (void *)qword_10005DA48;
  qword_10005DA48 = 0;

  byte_10005DA50 = 0;
  __int16 v9 = (void *)qword_10005DA80;
  qword_10005DA80 = 0;

  [(id)qword_10005DA60 invalidate];
  id v10 = (void *)qword_10005DA58;
  qword_10005DA58 = 0;

  id v11 = (void *)qword_10005DA20;
  qword_10005DA20 = 0;

  uint64_t v12 = (void *)qword_10005DA38;
  qword_10005DA38 = 0;

  [a1 _cancelCooldownTimer];
  uint64_t v13 = (void *)qword_10005DAB0;
  qword_10005DAB0 = 0;

  [a1 _clearPendingAnalyticsEvents];
  [a1 _clearPendingProfilerEvents];
  uint64_t v14 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    BOOL v21 = "+[ESConnection _cachedRecognizerCleanUp]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Releasing all asset sets.", (uint8_t *)&v20, 0xCu);
  }
  id v15 = +[SFEntitledAssetManager sharedInstance];
  [v15 releaseAssetSets];

  id v16 = (void *)qword_10005DA88;
  qword_10005DA88 = 0;

  id v17 = (void *)qword_10005DA78;
  qword_10005DA78 = 0;

  id v18 = (void *)qword_10005DA90;
  qword_10005DA90 = 0;

  id v19 = (void *)qword_10005DA98;
  qword_10005DA98 = 0;
}

+ (void)_cooldownTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  id v3 = qword_10005D9F8;
  if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "+[ESConnection _cooldownTimerFired]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (+[CESRUtilities cooldownDisabledForDevice])
  {
    id v10 = 0;
    unsigned __int8 v4 = +[CESRUtilities isCommonUserWithReason:&v10];
    id v5 = v10;
    if (v4)
    {
      id v6 = qword_10005D9F8;
      if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = "+[ESConnection _cooldownTimerFired]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s On-Device ASR: Cooldown is disabled.", buf, 0xCu);
      }
      +[ESConnection _replaceCachedRecognizerIfNeeded];
      [a1 _cancelCooldownTimer];
      goto LABEL_14;
    }
    int v7 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "+[ESConnection _cooldownTimerFired]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Overriding and cooling down for reason: %@", buf, 0x16u);
    }
  }
  else
  {
    id v5 = 0;
  }
  if (qword_10005DA68)
  {
    char v8 = +[ESAssetManager sharedInstance];
    id v9 = [v8 installedGeoLMRegionSpecificAssetForLanguage:qword_10005DA28 regionId:qword_10005DA68 mainAssetConfig:qword_10005DA20];
  }
  [a1 _cachedRecognizerCleanUp];
LABEL_14:
}

+ (void)_cancelCooldownTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  v2 = qword_10005DAA8;
  if (qword_10005DAA8)
  {
    id v3 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "+[ESConnection _cancelCooldownTimer]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
      v2 = qword_10005DAA8;
    }
    dispatch_source_cancel(v2);
    unsigned __int8 v4 = (void *)qword_10005DAA8;
    qword_10005DAA8 = 0;
  }
}

+ (void)_scheduleCooldownTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D9E8);
  [a1 _cancelCooldownTimer];
  if (!qword_10005DAA8)
  {
    if (!qword_10005DAB0)
    {
      id v3 = qword_10005D9F8;
      if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        __int16 v13 = "+[ESConnection _scheduleCooldownTimer]";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Acquired os_transaction during cooldown start", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v4 = os_transaction_create();
      int v5 = (void *)qword_10005DAB0;
      qword_10005DAB0 = v4;
    }
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10005D9E8);
    int v7 = (void *)qword_10005DAA8;
    qword_10005DAA8 = (uint64_t)v6;

    dispatch_source_set_event_handler((dispatch_source_t)qword_10005DAA8, &stru_100051100);
    unint64_t v8 = +[ESConnection _cooldownTimerTimeoutSeconds];
    id v9 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      __int16 v13 = "+[ESConnection _scheduleCooldownTimer]";
      __int16 v14 = 2048;
      unint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s On-Device ASR: Cooldown scheduled for %zus.", (uint8_t *)&v12, 0x16u);
    }
    id v10 = qword_10005DAA8;
    dispatch_time_t v11 = dispatch_time(0, 1000000000 * v8);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)qword_10005DAA8);
  }
}

+ (unint64_t)_cooldownTimerTimeoutSeconds
{
  if (!AFIsInternalInstall()) {
    return 120;
  }
  v2 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = (unint64_t)[v2 unsignedIntegerValue];
  }
  else {
    unint64_t v3 = 120;
  }

  return v3;
}

+ (void)_replaceCachedRecognizerIfNeeded
{
  uint64_t v2 = qword_10005DA68;
  if (qword_10005DA30) {
    BOOL v3 = qword_10005DA68 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    uint64_t v4 = qword_10005D9F8;
    if (os_log_type_enabled((os_log_t)qword_10005D9F8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = (const __CFString *)qword_10005DA38;
      if (!qword_10005DA38) {
        CFStringRef v5 = @"(none)";
      }
      *(_DWORD *)buf = 136315907;
      BOOL v21 = "+[ESConnection _replaceCachedRecognizerIfNeeded]";
      __int16 v22 = 2114;
      uint64_t v23 = qword_10005DA28;
      __int16 v24 = 2113;
      CFStringRef v25 = v5;
      __int16 v26 = 2113;
      uint64_t v27 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s On-Device ASR: Replacing the cached recognizer for language: %{public}@, regionId: %{private}@ to account for the pending regionId: %{private}@", buf, 0x2Au);
    }
    +[ESConnection _discardCachedRecognizer];
    id v6 = objc_alloc((Class)SFEntitledAssetConfig);
    id v7 = [v6 initWithLanguage:qword_10005DA28 assetType:3];
    id v18 = 0;
    id v19 = &off_100054168;
    LOWORD(v17) = 256;
    uint64_t v8 = +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:](ESConnection, "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:", v7, qword_10005DA68, 1, qword_10005DA48, 0, 1, 0, v17, &v19, &v18);
    id v9 = v19;
    id v10 = v18;
    dispatch_time_t v11 = (void *)qword_10005DA30;
    qword_10005DA30 = v8;

    if (v10)
    {
      int v12 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v21 = "+[ESConnection _replaceCachedRecognizerIfNeeded]";
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v10;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Error replacing the cached recognizer: %@", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)&qword_10005DA38, (id)qword_10005DA68);
    byte_10005DA50 = [v9 BOOLValue];
    __int16 v13 = (void *)qword_10005DA68;
    qword_10005DA68 = 0;

    __int16 v14 = (void *)qword_10005DA40;
    if (!qword_10005DA40)
    {
      uint64_t v15 = +[NSHashTable weakObjectsHashTable];
      id v16 = (void *)qword_10005DA40;
      qword_10005DA40 = v15;

      __int16 v14 = (void *)qword_10005DA40;
    }
    [v14 addObject:qword_10005DA30];
  }
}

+ (void)_discardCachedRecognizer
{
  os_signpost_id_t v3 = os_signpost_id_generate(AFSiriLogContextSpeech);
  uint64_t v4 = AFSiriLogContextSpeech;
  CFStringRef v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v19 = 134349056;
    int v20 = (const char *)mach_continuous_time();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ES: Previous Recognizer Unload", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v19, 0xCu);
  }

  id v6 = (void *)qword_10005DA30;
  id v7 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing];
  [v6 setActiveConfiguration:v7];

  uint64_t v8 = (void *)qword_10005DA30;
  qword_10005DA30 = 0;

  id v9 = AFSiriLogContextSpeech;
  id v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v11 = mach_continuous_time();
    int v19 = 134349056;
    int v20 = (const char *)v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v3, "ES: Previous Recognizer Unload", "%{public, signpost.description:end_time}llu", (uint8_t *)&v19, 0xCu);
  }

  int v12 = [(id)qword_10005DA40 allObjects];
  id v13 = [v12 count];

  if (v13)
  {
    __int16 v14 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = (void *)qword_10005DA40;
      id v16 = v14;
      uint64_t v17 = [v15 allObjects];
      id v18 = [v17 count];
      int v19 = 136315394;
      int v20 = "+[ESConnection _discardCachedRecognizer]";
      __int16 v21 = 2048;
      id v22 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s sRecognizerTracker: Too many recognizers active: %lu", (uint8_t *)&v19, 0x16u);
    }
  }
}

+ (id)_bestGuessTaskStringsFromPreheatSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:CoreEmbeddedSpeechRecognizerSourceAssistant])
  {
    int v4 = AFIsHorseman();
    CFStringRef v5 = &CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;
    if (v4) {
      CFStringRef v5 = &CoreEmbeddedSpeechRecognizerTaskBeto;
    }
  }
  else
  {
    if (![v3 isEqualToString:CoreEmbeddedSpeechRecognizerSourceDictation]
      || (AFIsHorseman() & 1) != 0)
    {
      id v6 = 0;
      goto LABEL_10;
    }
    CFStringRef v5 = &CoreEmbeddedSpeechRecognizerTaskDictation;
  }
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", *v5, 0);
LABEL_10:

  return v6;
}

+ (id)_speechRecognizerWithAssetConfig:(id)a3 geoLMRegionId:(id)a4 enableITN:(BOOL)a5 overrides:(id)a6 modelOverrideURL:(id)a7 preloadModels:(BOOL)a8 requestSource:(id)a9 enableParallelLoading:(BOOL)a10 isHighPriority:(BOOL)a11 geoLMLoadedOut:(id *)a12 error:(id *)a13
{
  BOOL v122 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v130 = a9;
  id v131 = [v16 language];
  os_signpost_id_t v20 = os_signpost_id_generate(AFSiriLogContextSpeech);
  __int16 v21 = AFSiriLogContextSpeech;
  id v22 = v21;
  unint64_t v116 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 136315394;
    v135 = "SiriX";
    __int16 v136 = 2080;
    v137 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "ondevice_CreateRecognizer", "%s %s", buf, 0x16u);
  }
  id v129 = v18;

  os_signpost_id_t v23 = os_signpost_id_generate(AFSiriLogContextSpeech);
  __int16 v24 = AFSiriLogContextSpeech;
  CFStringRef v25 = v24;
  unint64_t v115 = v23 - 1;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    uint64_t v26 = mach_continuous_time();
    *(_DWORD *)buf = 134349056;
    v135 = (const char *)v26;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ES: Recognizer Create", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
  }
  os_signpost_id_t spid = v20;
  os_signpost_id_t v113 = v23;

  id v128 = v19;
  if (v19 && AFIsInternalInstall())
  {
    uint64_t v27 = [v19 path];
    v127 = 0;
    long long v28 = 0;
    id v29 = 0;
    if (!v27) {
      goto LABEL_10;
    }
  }
  else
  {
    objc_super v31 = +[SFEntitledAssetManager sharedInstance];
    [v31 refreshAssetSetWithConfig:v16 regionId:v17];

    __int16 v32 = +[ESAssetManager sharedInstance];
    id v133 = 0;
    uint64_t v33 = [v32 installedModelInfoForAssetConfig:v16 error:&v133];
    id v29 = v133;

    uint64_t v27 = [v33 objectForKey:@"quasarModelPath"];
    v127 = v33;
    long long v28 = [v33 objectForKey:@"type"];
    if (!v27)
    {
LABEL_10:
      if (a13)
      {
        id v29 = v29;
        id v30 = 0;
        *a13 = v29;
      }
      else
      {
        id v30 = 0;
      }
LABEL_27:
      float v55 = v129;
      goto LABEL_80;
    }
  }

  __int16 v34 = +[NSProcessInfo processInfo];
  [v34 systemUptime];
  double v36 = v35;

  uint64_t v37 = [v27 stringByAppendingPathComponent:@"mini.json"];
  id v38 = (void *)qword_10005DA20;
  qword_10005DA20 = v37;

  id v125 = v17;
  v126 = v28;
  if ((+[CESRUtilities isFilePathValid:qword_10005DA20] & 1) == 0)
  {
    uint64_t v44 = kAFAssistantErrorDomain;
    NSErrorUserInfoKey v148 = NSLocalizedDescriptionKey;
    unsigned int v45 = +[NSString stringWithFormat:@"No file at path: %@", qword_10005DA20];
    v149 = v45;
    id v46 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
    long long v47 = +[NSError errorWithDomain:v44 code:600 userInfo:v46];

    unsigned int v48 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadM"
             "odels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
      __int16 v136 = 2112;
      v137 = v47;
      _os_log_fault_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_FAULT, "%s %@", buf, 0x16u);
    }

    id v29 = 0;
    id v30 = 0;
    id v17 = v125;
    long long v28 = v126;
    goto LABEL_27;
  }
  id v123 = objc_alloc_init((Class)NSMutableDictionary);
  if (a10)
  {
    __int16 v39 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadM"
             "odels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s ASR: enable parallel loading", buf, 0xCu);
    }
    [v123 setValue:@"YES" forKey:@"enableParallelLoading"];
  }
  if (v122)
  {
    v114 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything];
    id v40 = +[ESConnection _bestGuessTaskStringsFromPreheatSource:v130];
    if (v40)
    {
      __int16 v41 = [v114 taskTypeFilter];
      uint64_t v42 = v41;
      if (v41)
      {
        id v43 = v41;
      }
      else
      {
        id v43 = +[NSSet set];
      }
      v56 = v43;

      uint64_t v57 = [v56 setByAddingObjectsFromSet:v40];
      [v114 setTaskTypeFilter:v57];

      CFStringRef v58 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        uint64_t v59 = v58;
        id v60 = [v114 taskTypeFilter];
        *(_DWORD *)buf = 136315395;
        v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloa"
               "dModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
        __int16 v136 = 2113;
        v137 = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s ASR: filtering for tasks: %{private}@", buf, 0x16u);
      }
      id v17 = v125;
    }
    if (v130) {
      [v123 setValue:v130 forKey:@"preheatSource"];
    }
  }
  else
  {
    id v49 = objc_alloc_init((Class)_EARSpeechRecognitionActiveConfiguration);
    BOOL v50 = +[NSSet set];
    [v49 setSamplingRateFilter:v50];

    uint64_t v51 = +[NSSet set];
    [v49 setTaskTypeFilter:v51];

    __int16 v52 = +[NSSet set];
    [v49 setFarFieldFilter:v52];

    [v49 setDeviceIdFilter:0];
    CFStringRef v53 = +[NSSet set];
    [v49 setAneContextFilter:v53];

    int64_t v54 = +[NSSet set];
    [v49 setCpuContextFilter:v54];

    id v40 = +[NSSet set];
    v114 = v49;
    [v49 setGpuContextFilter:v40];
  }

  CFStringRef v61 = _AFPreferencesValueForKeyWithContext();
  objc_opt_class();
  uint64_t v62 = 0;
  if (objc_opt_isKindOfClass()) {
    uint64_t v62 = v61;
  }
  uint64_t v111 = v61;
  unsigned int v63 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadMod"
           "els:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
    __int16 v136 = 2113;
    v137 = v62;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%s ASR: taskForMemoryLock: %{private}@", buf, 0x16u);
  }
  if (v62) {
    [v123 setValue:v62 forKey:@"taskForMemoryLock"];
  }
  v110 = (char *)v62;
  id v121 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v64 = +[ESAssetManager sharedInstance];
  __int16 v65 = [v64 installedHammerConfigFileForLanguage:v131];

  if (v65)
  {
    id v66 = +[ESAssetManager sharedInstance];
    unsigned int v67 = [v66 validateHammerConfigFile:v65];

    if (v67) {
      [v121 addObject:v65];
    }

    id v17 = v125;
  }
  if (v17)
  {
    id v68 = +[ESAssetManager sharedInstance];
    v69 = [v68 installedGeoLMRegionSpecificAssetForLanguage:v131 regionId:v17 mainAssetConfig:qword_10005DA20];

    if (v69)
    {
      [v121 addObject:v69];
      if (a12) {
        *a12 = &off_100054150;
      }
    }
  }
  uint64_t v70 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadMod"
           "els:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
    __int16 v136 = 2112;
    v137 = (const char *)v121;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s Override json files=%@", buf, 0x16u);
  }
  char v109 = _os_feature_enabled_impl();
  id v71 = AFSiriLogContextSpeech;
  long long v28 = v126;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadMod"
           "els:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
    __int16 v136 = 2112;
    v137 = @"NO";
    _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: isSpellingUseCase: %@", buf, 0x16u);
  }
  if (_os_feature_enabled_impl())
  {
    id v72 = [v27 stringByAppendingPathComponent:@"TP/voice-commands"];
    v73 = [v72 stringByAppendingPathComponent:@"textfield-editing-suite.plist"];
    uint64_t v74 = +[NSURL fileURLWithPath:v73];
    id v132 = 0;
    __int16 v75 = +[NSMutableDictionary dictionaryWithContentsOfURL:v74 error:&v132];
    id v76 = v132;

    if (v76)
    {
      __int16 v77 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloa"
               "dModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
        __int16 v136 = 2112;
        v137 = v73;
        __int16 v138 = 2112;
        uint64_t v139 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%s Voice Command: Failed to read editing suite plist at path: %@, error: %@", buf, 0x20u);
      }
    }
    id v78 = &OBJC_IVAR___ESBiomeAsrRecord__recognizedNbest;
    if (!v75) {
      goto LABEL_60;
    }
    id v79 = [objc_alloc((Class)EARVoiceCommandSuite) initWithPlistJSONDictionary:v75];
    if (!v79) {
      goto LABEL_60;
    }
    CFStringRef v80 = v79;
    +[NSSet setWithObject:v79];
    __int16 v81 = v108 = v73;
    BOOL v82 = +[NSURL fileURLWithPath:v72 isDirectory:1];
    id v83 = [objc_alloc((Class)EARVoiceCommandActiveSet) initWithSuites:v81 resourceBaseURL:v82];

    v73 = v108;
    id v78 = &OBJC_IVAR___ESBiomeAsrRecord__recognizedNbest;

    if (!v83)
    {
LABEL_60:
      id v84 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloa"
               "dModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
        _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%s Unable to locate or read dictation voice commands assets", buf, 0xCu);
      }
      id v83 = 0;
    }

    id v17 = v125;
    long long v28 = v126;
    float v55 = v129;
  }
  else
  {
    id v83 = 0;
    float v55 = v129;
    id v78 = &OBJC_IVAR___ESBiomeAsrRecord__recognizedNbest;
  }
  LOBYTE(v107) = a5;
  BYTE1(v106) = v109;
  LOBYTE(v106) = 1;
  id v30 = objc_msgSend(objc_alloc((Class)_EARSpeechRecognizer), "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:", *((void *)v78 + 324), v55, v121, v131, v114, v123, v106, v83, a1, v107);

  if (v30)
  {
    [v30 setHighPriority:a11];
    [v30 setDetectUtterances:1];
    [v30 setRecognizeEagerCandidates:1];
    [v30 setConcatenateUtterances:1];
    [v30 setModelType:v28];
    [v30 setModelRoot:v27];
    v85 = +[NSProcessInfo processInfo];
    [v85 systemUptime];
    double v87 = v86 - v36;

    id v88 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadM"
             "odels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
      __int16 v136 = 2048;
      v137 = *(const char **)&v87;
      __int16 v138 = 2112;
      uint64_t v139 = qword_10005DA20;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "%s EmbeddedSpeechMetric: Created recognizer in %lf sec from %@", buf, 0x20u);
    }
    +[AFAggregator logLocalRecognitionLoadedForLanguage:v131 duration:v87];
    v89 = AFSiriLogContextSpeech;
    id v90 = v89;
    if (v116 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
    {
      *(_DWORD *)buf = 136315394;
      v135 = "SiriX";
      __int16 v136 = 2080;
      v137 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v90, OS_SIGNPOST_INTERVAL_END, spid, "ondevice_CreateRecognizer", "%s %s", buf, 0x16u);
    }

    v91 = AFSiriLogContextSpeech;
    v92 = v91;
    if (v115 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
    {
      uint64_t v120 = mach_continuous_time();
      id v124 = [v123 valueForKey:@"keepANEModelLoaded"];
      id v118 = (const char *)[v124 UTF8String];
      id v93 = [v123 valueForKey:@"enableParallelLoading"];
      id v94 = [v93 UTF8String];
      id v95 = [v123 valueForKey:@"preheatSource"];
      id v96 = [v95 UTF8String];
      id v97 = [v123 valueForKey:@"taskForMemoryLock"];
      id v98 = [v97 UTF8String];
      *(_DWORD *)buf = 134350338;
      v135 = (const char *)v120;
      __int16 v136 = 2080;
      v137 = v118;
      __int16 v138 = 2080;
      uint64_t v139 = (uint64_t)v94;
      __int16 v140 = 1024;
      BOOL v141 = v122;
      __int16 v142 = 2080;
      id v143 = v96;
      id v17 = v125;
      long long v28 = v126;
      __int16 v144 = 2080;
      id v145 = v98;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_END, v113, "ES: Recognizer Create", "%{public, signpost.description:end_time}llu keepANEModelLoaded = %s, enableParallelLoading = %s, preloadModels = %u, preheatSource = %s, taskForMemoryLock = %s", buf, 0x3Au);

      float v55 = v129;
    }

    id v99 = v30;
  }
  else
  {
    v100 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v135 = "+[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadM"
             "odels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]";
      __int16 v136 = 2114;
      v137 = (const char *)qword_10005DA20;
      _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "%s Failed to create recognizer from %{public}@", buf, 0x16u);
    }
    if (a13)
    {
      uint64_t v101 = kAFAssistantErrorDomain;
      NSErrorUserInfoKey v146 = NSLocalizedDescriptionKey;
      double v102 = +[NSString stringWithFormat:@"Failed to create recognizer from %@", qword_10005DA20];
      v147 = v102;
      v103 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
      uint64_t v104 = v101;
      long long v28 = v126;
      *a13 = +[NSError errorWithDomain:v104 code:1105 userInfo:v103];

      id v17 = v125;
    }
  }

  id v29 = 0;
LABEL_80:

  return v30;
}

+ (id)_speechRecognizerWithAssetConfig:(id)a3 enableITN:(BOOL)a4 isHighPriority:(BOOL)a5 error:(id *)a6
{
  BYTE1(v7) = a5;
  LOBYTE(v7) = 0;
  return objc_msgSend(a1, "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:", a3, 0, a4, 0, 0, 1, 0, v7, 0, a6);
}

+ (void)captureESStartTimeInTicks
{
  if (qword_10005DA10 != -1) {
    dispatch_once(&qword_10005DA10, &stru_100050ED0);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.siri.ESConnection", 0);
    id v3 = (void *)qword_10005D9E8;
    qword_10005D9E8 = (uint64_t)v2;

    qword_10005D9F0 = dispatch_get_global_queue(9, 0);
    _objc_release_x1();
  }
}

@end