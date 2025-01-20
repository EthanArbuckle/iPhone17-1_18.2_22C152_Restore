@interface ESProfiler
+ (id)sharedProfiler;
- (CESRSignpostHelper)signpostHelper;
- (ESProfiler)initWithESSelfHelper:(id)a3 signpostHelper:(id)a4;
- (ESSelfHelper)selfHelper;
- (id)powerLogEventDictionaryWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5 applicationName:(id)a6;
- (id)timestampInTicksForAudioProcessed:(double)a3;
- (void)logActiveConfigUpdateEndedWithTimeInTicks:(id)a3;
- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAotLmeEndedWithTimeInTicks:(id)a3;
- (void)logAotLmeStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAppleNeuralEngineModelInitializationEndedWithTimeInTicks:(id)a3 fileName:(id)a4;
- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3 fileName:(id)a4;
- (void)logAssetsCompilationEventsWithPowerLogEvent:(id)a3;
- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3;
- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logESStartWithTimeInTicks:(id)a3;
- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5;
- (void)logFinalResultGeneratedWithEARPackage:(id)a3 firstSeenPartialResultTokens:(id)a4 partialResultOffset:(unint64_t)a5 timeInTicks:(id)a6;
- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logFirstAudioPacketProcessedWithTimeInTicks:(id)a3;
- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3;
- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3;
- (void)logFrameProcessingReadyWithTimeInTicks:(id)a3;
- (void)logInitializationEndedWithTimeInTicks:(id)a3 isSpeechRecognizerCreated:(BOOL)a4;
- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3 cachedRecognizerExisted:(BOOL)a4 newRecognizerCreated:(BOOL)a5;
- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4;
- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4;
- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3 timeInTicks:(id)a4;
- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3;
- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4 timeInTicks:(id)a5;
- (void)logPartialResultGenerated:(id)a3 ofSize:(id)a4 timeInTicks:(id)a5;
- (void)logPauseRecognitionWithTimeInTicks:(id)a3;
- (void)logPendingANEModelInitializationContextEvents:(id)a3;
- (void)logPendingPreheatContextEvents:(id)a3;
- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3;
- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4;
- (void)logPreheatOnlyEventsWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5;
- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 allItnRunIntervals:(id)a22 allSecondaryPassIntervals:(id)a23 powerLogEvent:(id)a24 aneUsed:(id)a25 language:(id)a26 modelVersion:(id)a27 applicationName:(id)a28;
- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12 applicationName:(id)a13 powerLogEvent:(id)a14;
- (void)logResumeRecognitionWithTimeInTicks:(id)a3;
- (void)logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent:(id)a3 language:(id)a4;
- (void)logTotalAudioProcessedOfDuration:(double)a3 timeInTicks:(id)a4;
- (void)setESSelfHelper:(id)a3;
@end

@implementation ESProfiler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostHelper, 0);
  objc_storeStrong((id *)&self->_selfHelper, 0);

  objc_storeStrong((id *)&self->_audioDurationProcessingTimestampInTicks, 0);
}

- (CESRSignpostHelper)signpostHelper
{
  return self->_signpostHelper;
}

- (ESSelfHelper)selfHelper
{
  return self->_selfHelper;
}

- (void)logPersonalizationExperimentTriggersForExperimentIds:(id)a3
{
}

- (void)logResumeRecognitionWithTimeInTicks:(id)a3
{
  id v3 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [a3 unsignedLongLongValue]);
  os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextSpeech);
  v5 = AFSiriLogContextSpeech;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134349056;
    id v8 = v3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v4, "ES: Resume Recognition", "%{public, signpost.description:event_time}llu", (uint8_t *)&v7, 0xCu);
  }
}

- (void)logPauseRecognitionWithTimeInTicks:(id)a3
{
  id v3 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [a3 unsignedLongLongValue]);
  os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextSpeech);
  v5 = AFSiriLogContextSpeech;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134349056;
    id v8 = v3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v4, "ES: Pause Recognition", "%{public, signpost.description:event_time}llu", (uint8_t *)&v7, 0xCu);
  }
}

- (void)logTotalAudioProcessedOfDuration:(double)a3 timeInTicks:(id)a4
{
  id v6 = a4;
  int v7 = +[NSNumber numberWithDouble:a3];
  v9[0] = v7;
  v9[1] = v6;
  id v8 = +[NSArray arrayWithObjects:v9 count:2];

  [(NSMutableArray *)self->_audioDurationProcessingTimestampInTicks addObject:v8];
}

- (void)logRequestEndedOrFailedOrCancelledWithError:(id)a3 recognizerComponents:(id)a4 averageActiveTokensPerFrame:(id)a5 languageModelInterpolationWeights:(id)a6 signalToNoiseRatioInDecibels:(id)a7 recognitionDurationInSec:(id)a8 audioDurationMs:(id)a9 eagerUsed:(id)a10 utteranceDetectionEnabled:(BOOL)a11 utteranceConcatenationEnabled:(BOOL)a12 cpuRealTimeFactor:(id)a13 numLmeDataStreams:(id)a14 phoneticMatchDecoderName:(id)a15 pauseDurations:(id)a16 itnDurationInNs:(id)a17 isEmojiPersonalizationUsed:(BOOL)a18 isEmojiDisambiguationUsed:(BOOL)a19 isEmojiExpectedButNotRecognized:(BOOL)a20 recognizedEmojis:(id)a21 allItnRunIntervals:(id)a22 allSecondaryPassIntervals:(id)a23 powerLogEvent:(id)a24 aneUsed:(id)a25 language:(id)a26 modelVersion:(id)a27 applicationName:(id)a28
{
  id v65 = a3;
  id v66 = a4;
  id v67 = a5;
  id v68 = a6;
  id v78 = a7;
  id v79 = a8;
  id v80 = a9;
  id v69 = a10;
  id v81 = a13;
  id v70 = a14;
  id v71 = a15;
  id v72 = a16;
  id v73 = a17;
  id v74 = a21;
  id v77 = a22;
  id v76 = a23;
  id v34 = a24;
  id v75 = a25;
  id v35 = a26;
  id v36 = a27;
  id v37 = a28;
  v62 = v34;
  v63 = v35;
  v64 = v36;
  v38 = [(ESProfiler *)self powerLogEventDictionaryWithPowerLogEvent:v34 language:v35 modelVersion:v36 applicationName:v37];
  +[CESRUtilities logToPowerLogForEventCategory:@"ESConnection" eventDictionary:v38];

  long long v138 = 0u;
  long long v137 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  *(_OWORD *)buffer = 0u;
  pid_t v39 = getpid();
  proc_pid_rusage(v39, 6, buffer);
  uint64_t v40 = *((void *)&v125 + 1);
  uint64_t ri_instructions = self->usage_start.ri_instructions;
  uint64_t v96 = 0;
  v97 = (double *)&v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  int v95 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_1000144E4;
  v91[3] = &unk_100050E38;
  v91[4] = self;
  v91[5] = &v96;
  v91[6] = &v92;
  [v77 enumerateObjectsUsingBlock:v91];
  double v42 = v97[3];
  uint64_t v87 = 0;
  v88 = (double *)&v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  int v86 = 0;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_1000146D4;
  v82[3] = &unk_100050E38;
  v43 = self;
  v82[4] = self;
  v82[5] = &v87;
  v82[6] = &v83;
  [v76 enumerateObjectsUsingBlock:v82];
  double v44 = v88[3];
  selfHelper = self->_selfHelper;
  v46 = +[NSNumber numberWithDouble:v42 * 1000000000.0];
  v47 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v93 + 6)];
  v48 = +[NSNumber numberWithDouble:v44 * 1000000000.0];
  v49 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v84 + 6)];
  v50 = +[NSNumber numberWithDouble:(double)((v40 - ri_instructions) / 0xF4240)];
  BYTE2(v61) = a20;
  LOWORD(v61) = __PAIR16__(a19, a18);
  LOWORD(v60) = __PAIR16__(a12, a11);
  -[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:](selfHelper, "logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInNs:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:", v65, v66, v67, v68, v78, v79, v80, v69, v60, v81, v70, v71, v72,
    v73,
    v61,
    v74,
    v46,
    v47,
    v48,
    v49,
    v50,
    v75);

  if (v43->_signpostHelper)
  {
    os_signpost_id_t v51 = os_signpost_id_generate(AFSiriLogContextSpeech);
    v52 = AFSiriLogContextSpeech;
    v53 = v52;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      uint64_t v54 = mach_continuous_time();
      [v78 floatValue];
      float v56 = v55;
      id v57 = [v80 unsignedLongLongValue];
      id v58 = [v79 unsignedLongLongValue];
      [v81 floatValue];
      *(_DWORD *)buf = 134350080;
      uint64_t v101 = v54;
      __int16 v102 = 2048;
      double v103 = v56;
      __int16 v104 = 2048;
      id v105 = v57;
      __int16 v106 = 2048;
      uint64_t v107 = 1000 * (void)v58;
      __int16 v108 = 2048;
      double v109 = v59;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_EVENT, v51, "ES: Engine Complete", "%{public, signpost.description:event_time}llu SNR = %f, AudioDurationMs = %llu, RecognitionDurationMs = %llu, CPU RTF = %f", buf, 0x34u);
    }
  }
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);
}

- (void)logFinalResultGeneratedWithEARPackage:(id)a3 firstSeenPartialResultTokens:(id)a4 partialResultOffset:(unint64_t)a5 timeInTicks:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v57 = a6;
  v12 = [v10 recognition];
  v13 = [v12 oneBest];
  v14 = [v13 firstObject];
  [v14 start];
  double v16 = v15;

  float v59 = [(ESProfiler *)self timestampInTicksForAudioProcessed:0.0];
  uint64_t v58 = [(ESProfiler *)self timestampInTicksForAudioProcessed:v16];
  uint64_t v60 = [(ESProfiler *)self timestampInTicksForAudioProcessed:v16 + 1.0];
  float v56 = v10;
  v17 = [v10 preITNRecognition];
  v18 = [v17 oneBest];
  float v55 = v11;
  v19 = +[CESRUtilities alignedPartialResultIndicesForTokens:v18 firstSeenPartialResultTokens:v11];

  v20 = +[NSMutableArray array];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v21 = v19;
  id v22 = [v21 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v62;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v62 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ([v26 isEqualToNumber:&off_100054138])
        {
          [v20 addObject:v26];
        }
        else
        {
          v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v26 unsignedIntegerValue] + a5);
          [v20 addObject:v27];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v23);
  }

  [(ESSelfHelper *)self->_selfHelper logFinalResultGeneratedWithEARPackage:v10 correctAlignedPartialResultIndexList:v20];
  v28 = (void *)v58;
  if (v58) {
    [(ESSelfHelper *)self->_selfHelper logLeadingSilenceProcessedWithTimestampInTicks:v58];
  }
  v29 = v57;
  v30 = v60;
  if (v60) {
    [(ESSelfHelper *)self->_selfHelper logPostSpeechStartOneSecondAudioProcessedWithTimestampInTicks:v60];
  }
  if (self->_signpostHelper)
  {
    id v31 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v57 unsignedLongLongValue]);
    v32 = earPackageResultCandidateId();
    os_signpost_id_t v33 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v34 = AFSiriLogContextSpeech;
    id v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      uint64_t v54 = [v56 recognition];
      v53 = [v54 oneBest];
      +[CESRUtilities earTokensToString:](CESRUtilities, "earTokensToString:");
      id v52 = objc_claimAutoreleasedReturnValue();
      id v51 = [v52 UTF8String];
      unsigned int v50 = [v56 isFinal];
      unsigned int v36 = [v56 firstResultAfterResume];
      unsigned __int8 v37 = [v56 isFinal];
      uint64_t v38 = -1;
      if ((v37 & 1) == 0 && v32) {
        uint64_t v38 = (uint64_t)[v32 unsignedLongValue];
      }
      *(_DWORD *)buf = 134350082;
      id v66 = v31;
      __int16 v67 = 2080;
      id v68 = v51;
      __int16 v69 = 1024;
      unsigned int v70 = v50;
      __int16 v71 = 1024;
      unsigned int v72 = v36;
      __int16 v73 = 2048;
      uint64_t v74 = v38;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, v33, "ES: Final Recognition", "%{public, signpost.description:event_time}llu OneBest=%s, isFinal=%u, isAfterResume=%u, rcId=%ld", buf, 0x2Cu);
    }
    v28 = (void *)v58;
    v30 = v60;
  }
  if (v28)
  {
    id v39 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v59 unsignedLongLongValue]);
    id v40 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v28 unsignedLongLongValue]);
    os_signpost_id_t v41 = os_signpost_id_generate(AFSiriLogContextSpeech);
    double v42 = AFSiriLogContextSpeech;
    v43 = v42;
    if (v41 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      double v44 = AFSiriLogContextSpeech;
    }
    else
    {
      if (os_signpost_enabled(v42))
      {
        *(_DWORD *)buf = 134349056;
        id v66 = v39;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "ES: Leading Silence Process", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
      }

      double v44 = AFSiriLogContextSpeech;
      if (os_signpost_enabled(v44))
      {
        *(_DWORD *)buf = 134349056;
        id v66 = v40;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v41, "ES: Leading Silence Process", "%{public, signpost.description:end_time}llu", buf, 0xCu);
      }
    }

    v30 = v60;
    if (v60)
    {
      id v45 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v60 unsignedLongLongValue]);
      os_signpost_id_t v46 = os_signpost_id_generate(AFSiriLogContextSpeech);
      v47 = AFSiriLogContextSpeech;
      v48 = v47;
      if (v46 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v49 = AFSiriLogContextSpeech;
      }
      else
      {
        if (os_signpost_enabled(v47))
        {
          *(_DWORD *)buf = 134349056;
          id v66 = v40;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "ES: First Speech Second Process", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
        }

        v49 = AFSiriLogContextSpeech;
        if (os_signpost_enabled(v49))
        {
          *(_DWORD *)buf = 134349056;
          id v66 = v45;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v46, "ES: First Speech Second Process", "%{public, signpost.description:end_time}llu", buf, 0xCu);
        }
        v29 = v57;
      }
      v30 = v60;
    }
  }
}

- (void)logPackageGeneratedAndRecognitionResultTier1WithEARPackage:(id)a3 loggableSharedUserId:(id)a4 timeInTicks:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(ESSelfHelper *)self->_selfHelper logPackageGeneratedAndRecognitionResultTier1WithEARPackage:v8 loggableSharedUserId:a4];
  if (self->_signpostHelper)
  {
    id v10 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v9 unsignedLongLongValue]);
    id v11 = earPackageResultCandidateId();
    os_signpost_id_t v12 = os_signpost_id_generate(AFSiriLogContextSpeech);
    v13 = AFSiriLogContextSpeech;
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      id v22 = [v8 recognition];
      id v21 = [v22 oneBest];
      +[CESRUtilities earTokensToString:](CESRUtilities, "earTokensToString:");
      id v15 = objc_claimAutoreleasedReturnValue();
      id v16 = [v15 UTF8String];
      unsigned int v17 = [v8 isFinal];
      unsigned int v18 = [v8 firstResultAfterResume];
      unsigned __int8 v19 = [v8 isFinal];
      uint64_t v20 = -1;
      if ((v19 & 1) == 0 && v11) {
        uint64_t v20 = (uint64_t)[v11 unsignedLongValue];
      }
      *(_DWORD *)buf = 134350082;
      id v24 = v10;
      __int16 v25 = 2080;
      id v26 = v16;
      __int16 v27 = 1024;
      unsigned int v28 = v17;
      __int16 v29 = 1024;
      unsigned int v30 = v18;
      __int16 v31 = 2048;
      uint64_t v32 = v20;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, v12, "ES: Package Recognition", "%{public, signpost.description:event_time}lluOneBest=%s, isFinal=%u, isAfterResume=%u, rcId=%ld", buf, 0x2Cu);
    }
  }
}

- (void)logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logIntermediateUtteranceInfoTier1WithPmInput:(id)a3 pmOutput:(id)a4
{
}

- (void)logPartialResultGenerated:(id)a3 ofSize:(id)a4 timeInTicks:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(ESSelfHelper *)self->_selfHelper logPartialResultGenerated];
  if (self->_signpostHelper)
  {
    id v11 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v10 unsignedLongLongValue]);
    os_signpost_id_t v12 = os_signpost_id_generate(AFSiriLogContextSpeech);
    v13 = AFSiriLogContextSpeech;
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v15 = 134349570;
      id v16 = v11;
      __int16 v17 = 2080;
      id v18 = [v8 UTF8String];
      __int16 v19 = 1024;
      unsigned int v20 = [v9 unsignedIntValue];
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, v12, "ES: Partial Recognition", "%{public, signpost.description:event_time}lluWords=%s, WordCount=%u", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)logRequestStartedOrChangedWithTask:(id)a3 modelLocale:(id)a4 modelVersion:(id)a5 isHighQualityAsset:(id)a6 hammerVersion:(id)a7 geoLanguageModelRegion:(id)a8 geoLanguageModelLoaded:(BOOL)a9 speechProfileAgeInSec:(id)a10 dictationUIInteractionId:(id)a11 portraitExperimentVariantName:(id)a12 applicationName:(id)a13 powerLogEvent:(id)a14
{
  id v21 = a12;
  id v22 = a11;
  id v23 = a10;
  id v24 = a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = a5;
  id v28 = a4;
  id v31 = a3;
  __int16 v29 = [(ESProfiler *)self powerLogEventDictionaryWithPowerLogEvent:a14 language:v28 modelVersion:v27 applicationName:a13];
  +[CESRUtilities logToPowerLogForEventCategory:@"ESConnection" eventDictionary:v29];

  LOBYTE(v30) = a9;
  [(ESSelfHelper *)self->_selfHelper logRequestStartedOrChangedWithTask:v31 modelLocale:v28 modelVersion:v27 isHighQualityAsset:v26 hammerVersion:v25 geoLanguageModelRegion:v24 geoLanguageModelLoaded:v30 speechProfileAgeInSec:v23 dictationUIInteractionId:v22 portraitExperimentVariantName:v21];
}

- (void)logFrameProcessingReadyWithTimeInTicks:(id)a3
{
  if (self->_signpostHelper)
  {
    id v4 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [a3 unsignedLongLongValue]);
    os_signpost_id_t v5 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v6 = AFSiriLogContextSpeech;
    int v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v8 = 134349056;
      id v9 = v4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v5, "ES: Frame Processing Ready", "%{public, signpost.description:event_time}llu", (uint8_t *)&v8, 0xCu);
    }
  }
  [(ESSelfHelper *)self->_selfHelper logFrameProcessingReady];
}

- (void)logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
  id v8 = a3;
  [(ESSelfHelper *)self->_selfHelper logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:v8 loggableSharedUserId:a4 earPackage:a5];
  if (self->_signpostHelper)
  {
    id v9 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v8 unsignedLongLongValue]);
    os_signpost_id_t v10 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v11 = AFSiriLogContextSpeech;
    os_signpost_id_t v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      int v13 = 134349056;
      id v14 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, v10, "ES: Last Speech Audio Packet", "%{public, signpost.description:event_time}llu", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4 earPackage:(id)a5
{
}

- (void)logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:(id)a3 loggableSharedUserId:(id)a4
{
}

- (void)logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:(id)a3
{
}

- (void)logFirstAudioPacketProcessedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logFirstAudioPacketProcessed];
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    int v7 = AFSiriLogContextSpeech;
    id v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, v6, "ES: First Audio Packet Process", "%{public, signpost.description:event_time}llu", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)logFirstAudioPacketReadyUpstreamWithTimeInTicks:(id)a3
{
}

- (void)logFirstAudioPacketRecordedWithTimeInTicks:(id)a3
{
}

- (void)logAudioPacketArrivalEndedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logAudioPacketArrivalEndedWithTimeInTicks:v4];
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    int v7 = AFSiriLogContextSpeech;
    id v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, v6, "ES: Last Audio Packet", "%{public, signpost.description:event_time}llu", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)logAudioPacketArrivalStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logAudioPacketArrivalStartedOrChangedWithTimeInTicks:v4];
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    int v7 = AFSiriLogContextSpeech;
    id v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, v6, "ES: First Audio Packet", "%{public, signpost.description:event_time}llu", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)logAotLmeEndedWithTimeInTicks:(id)a3
{
  if (self->_signpostHelper)
  {
    id v4 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [a3 unsignedLongLongValue]);
    id v5 = (char *)[(CESRSignpostHelper *)self->_signpostHelper fetchAndDestroySignpostIdForEventName:@"ES: AOT Profile Load"];
    os_signpost_id_t v6 = AFSiriLogContextSpeech;
    int v7 = v6;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v8 = 134349056;
      id v9 = v4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v5, "ES: AOT Profile Load", "%{public, signpost.description:end_time}llu", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)logAotLmeStartedOrChangedWithTimeInTicks:(id)a3
{
  if (self->_signpostHelper)
  {
    id v4 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [a3 unsignedLongLongValue]);
    os_signpost_id_t v5 = os_signpost_id_generate(AFSiriLogContextSpeech);
    os_signpost_id_t v6 = AFSiriLogContextSpeech;
    int v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v8 = 134349056;
      id v9 = v4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ES: AOT Profile Load", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v8, 0xCu);
    }

    [(CESRSignpostHelper *)self->_signpostHelper storeSignpostId:v5 forEventName:@"ES: AOT Profile Load"];
  }
}

- (void)logJitLmeEndedAndEndedTier1WithDialogContext:(id)a3 timeInTicks:(id)a4
{
  id v6 = a4;
  [(ESSelfHelper *)self->_selfHelper logJitLmeEndedAndEndedTier1WithDialogContext:a3];
  if (self->_signpostHelper)
  {
    id v7 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v6 unsignedLongLongValue]);
    int v8 = (char *)[(CESRSignpostHelper *)self->_signpostHelper fetchAndDestroySignpostIdForEventName:@"ES: JIT Profile Build Load"];
    id v9 = AFSiriLogContextSpeech;
    id v10 = v9;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v11 = 134349056;
      id v12 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v8, "ES: JIT Profile Build Load", "%{public, signpost.description:end_time}llu", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)logJitLmeStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logJitLmeStartedOrChangedWithTimeInTicks:v4];
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v7 = AFSiriLogContextSpeech;
    int v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ES: JIT Profile Build Load", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v9, 0xCu);
    }

    [(CESRSignpostHelper *)self->_signpostHelper storeSignpostId:v6 forEventName:@"ES: JIT Profile Build Load"];
  }
}

- (void)logActiveConfigUpdateEndedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logActiveConfigUpdateEnded];
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = (char *)[(CESRSignpostHelper *)self->_signpostHelper fetchAndDestroySignpostIdForEventName:@"ES: Update Active Config"];
    id v7 = AFSiriLogContextSpeech;
    int v8 = v7;
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v6, "ES: Update Active Config", "%{public, signpost.description:end_time}llu", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)logActiveConfigUpdateStartedOrChangedWithTimeInTicks:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logActiveConfigUpdateStartedOrChangedWithTimeInTicks:v4];
  if (self->_signpostHelper)
  {
    id v5 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v4 unsignedLongLongValue]);
    os_signpost_id_t v6 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v7 = AFSiriLogContextSpeech;
    int v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 134349056;
      id v10 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ES: Update Active Config", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v9, 0xCu);
    }

    [(CESRSignpostHelper *)self->_signpostHelper storeSignpostId:v6 forEventName:@"ES: Update Active Config"];
  }
}

- (void)logAppleNeuralEngineModelInitializationEndedWithTimeInTicks:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ESSelfHelper *)self->_selfHelper logAppleNeuralEngineModelInitializationEnded];
  if (self->_signpostHelper)
  {
    id v8 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v6 unsignedLongLongValue]);
    int v9 = (char *)[(CESRSignpostHelper *)self->_signpostHelper fetchAndDestroySignpostIdForEventName:@"ES: ANE Model Init"];
    id v10 = AFSiriLogContextSpeech;
    int v11 = v10;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      int v12 = 134349314;
      id v13 = v8;
      __int16 v14 = 2080;
      id v15 = [v7 UTF8String];
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v9, "ES: ANE Model Init", "%{public, signpost.description:end_time}llu FileName=%s", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ESSelfHelper *)self->_selfHelper logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:v6];
  if (self->_signpostHelper)
  {
    id v8 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v6 unsignedLongLongValue]);
    os_signpost_id_t v9 = os_signpost_id_generate(AFSiriLogContextSpeech);
    id v10 = AFSiriLogContextSpeech;
    int v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      int v12 = 134349314;
      id v13 = v8;
      __int16 v14 = 2080;
      id v15 = [v7 UTF8String];
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ES: ANE Model Init", "%{public, signpost.description:begin_time}llu FileName=%s", (uint8_t *)&v12, 0x16u);
    }

    [(CESRSignpostHelper *)self->_signpostHelper storeSignpostId:v9 forEventName:@"ES: ANE Model Init"];
  }
}

- (void)logInitializationEndedWithTimeInTicks:(id)a3 isSpeechRecognizerCreated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ESSelfHelper *)self->_selfHelper logInitializationEndedIsSpeechRecognizerCreated:v4];
  if (self->_signpostHelper)
  {
    id v7 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v6 unsignedLongLongValue]);
    id v8 = (char *)[(CESRSignpostHelper *)self->_signpostHelper fetchAndDestroySignpostIdForEventName:@"ES: Engine Init"];
    os_signpost_id_t v9 = AFSiriLogContextSpeech;
    id v10 = v9;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v11 = 134349056;
      id v12 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v8, "ES: Engine Init", "%{public, signpost.description:end_time}llu", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)logInitializationStartedOrChangedWithTimeInTicks:(id)a3 cachedRecognizerExisted:(BOOL)a4 newRecognizerCreated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [(ESSelfHelper *)self->_selfHelper logInitializationStartedOrChangedWithTimeInTicks:v8];
  if (self->_signpostHelper)
  {
    id v9 = +[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v8 unsignedLongLongValue]);
    os_signpost_id_t v10 = os_signpost_id_generate(AFSiriLogContextSpeech);
    int v11 = AFSiriLogContextSpeech;
    id v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      int v14 = 134349568;
      id v15 = v9;
      __int16 v16 = 1024;
      BOOL v17 = v6;
      __int16 v18 = 1024;
      BOOL v19 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ES: Engine Init", "%{public, signpost.description:begin_time}llu cachedRecognizerExisted = %u, newRecognizerCreated = %u", (uint8_t *)&v14, 0x18u);
    }

    [(CESRSignpostHelper *)self->_signpostHelper storeSignpostId:v10 forEventName:@"ES: Engine Init"];
  }
  pid_t v13 = getpid();
  proc_pid_rusage(v13, 6, (rusage_info_t *)&self->usage_start);
}

- (void)logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent:(id)a3 language:(id)a4
{
  id v4 = [(ESProfiler *)self powerLogEventDictionaryWithPowerLogEvent:a3 language:a4 modelVersion:0 applicationName:0];
  +[CESRUtilities logToPowerLogForEventCategory:@"ESConnection" eventDictionary:v4];
}

- (void)logESStartWithTimeInTicks:(id)a3
{
}

- (void)logPendingANEModelInitializationContextEvents:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logPendingANEModelInitializationContextEvents:v4];
  if (self->_signpostHelper)
  {
    if ([v4 count] == (id)2)
    {
      BOOL v5 = [v4 objectAtIndex:0];
      BOOL v6 = [v5 startedOrChanged];
      unsigned int v7 = [v6 exists];

      if (v7)
      {
        id v8 = [v5 timestampInTicks];
        id v9 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v8 unsignedLongLongValue]);

        os_signpost_id_t v10 = os_signpost_id_generate(AFSiriLogContextSpeech);
        int v11 = AFSiriLogContextSpeech;
        id v12 = v11;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          id v13 = [v5 fileName];
          int v25 = 134349314;
          id v26 = v9;
          __int16 v27 = 2080;
          id v28 = [v13 UTF8String];
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ES: ANE Model Init", "%{public, signpost.description:begin_time}llu FileName=%s", (uint8_t *)&v25, 0x16u);
        }
        [(CESRSignpostHelper *)self->_signpostHelper storeSignpostId:v10 forEventName:@"ES: ANE Model Init"];
        int v14 = [v4 objectAtIndex:1];
        id v15 = [v14 ended];
        unsigned int v16 = [v15 exists];

        if (v16)
        {
          BOOL v17 = [v14 timestampInTicks];
          __int16 v18 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v17 unsignedLongLongValue]);

          BOOL v19 = (char *)[(CESRSignpostHelper *)self->_signpostHelper fetchAndDestroySignpostIdForEventName:@"ES: ANE Model Init"];
          unsigned int v20 = AFSiriLogContextSpeech;
          id v21 = v20;
          if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            id v22 = [v14 fileName];
            id v23 = [v22 UTF8String];
            int v25 = 134349314;
            id v26 = v18;
            __int16 v27 = 2080;
            id v28 = v23;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v19, "ES: ANE Model Init", "%{public, signpost.description:end_time}llu FileName=%s", (uint8_t *)&v25, 0x16u);
          }
        }
      }
      goto LABEL_16;
    }
    if ([v4 count])
    {
      id v24 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        BOOL v5 = v24;
        int v25 = 136315394;
        id v26 = "-[ESProfiler logPendingANEModelInitializationContextEvents:]";
        __int16 v27 = 2048;
        id v28 = [v4 count];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Unexpected pending ane model initialization event count %lu", (uint8_t *)&v25, 0x16u);
LABEL_16:
      }
    }
  }
}

- (void)logAssetsCompilationEventsWithPowerLogEvent:(id)a3
{
  id v3 = [(ESProfiler *)self powerLogEventDictionaryWithPowerLogEvent:a3 language:0 modelVersion:0 applicationName:0];
  +[CESRUtilities logToPowerLogForEventCategory:@"ESConnection" eventDictionary:v3];
}

- (void)logPendingPreheatContextEvents:(id)a3
{
  id v4 = a3;
  [(ESSelfHelper *)self->_selfHelper logPendingPreheatContextEvents:v4];
  if (self->_signpostHelper)
  {
    if ([v4 count] == (id)2)
    {
      BOOL v5 = [v4 objectAtIndex:0];
      BOOL v6 = [v5 preheatContext];
      unsigned int v7 = [v6 startedOrChanged];
      unsigned int v8 = [v7 exists];

      if (!v8)
      {
LABEL_24:

        goto LABEL_25;
      }
      id v9 = [v6 timestampInTicks];
      os_signpost_id_t v10 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v9 unsignedLongLongValue]);

      os_signpost_id_t v11 = os_signpost_id_generate(AFSiriLogContextSpeech);
      id v12 = AFSiriLogContextSpeech;
      id v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        int v28 = 134349056;
        __int16 v29 = v10;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ondevice_preheat_time", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v28, 0xCu);
      }

      [(CESRSignpostHelper *)self->_signpostHelper storeSignpostId:v11 forEventName:@"ondevice_preheat_time"];
      int v14 = [v4 objectAtIndex:1];
      id v15 = [v14 preheatContext];
      unsigned int v16 = [v15 ended];
      if (v16)
      {
      }
      else
      {
        __int16 v18 = [v15 failed];

        if (!v18)
        {
LABEL_23:

          goto LABEL_24;
        }
      }
      BOOL v19 = [v15 ended];

      if (v19)
      {
        unsigned int v20 = [v15 ended];
        if ([v20 status] == 1) {
          id v21 = @"Success";
        }
        else {
          id v21 = @"AlreadyLoaded";
        }
      }
      else
      {
        id v21 = @"Failed";
      }
      id v22 = [v15 timestampInTicks];
      id v23 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:](CESRUtilities, "machAbsoluteTimeToMachContinuousTime:", [v22 unsignedLongLongValue]);

      id v24 = (char *)[(CESRSignpostHelper *)self->_signpostHelper fetchAndDestroySignpostIdForEventName:@"ondevice_preheat_time"];
      int v25 = AFSiriLogContextSpeech;
      id v26 = v25;
      if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        id v27 = [(__CFString *)v21 UTF8String];
        int v28 = 134349314;
        __int16 v29 = v23;
        __int16 v30 = 2080;
        id v31 = v27;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v24, "ondevice_preheat_time", "%{public, signpost.description:end_time}llu Status=%s", (uint8_t *)&v28, 0x16u);
      }

      goto LABEL_23;
    }
    if ([v4 count])
    {
      BOOL v17 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        BOOL v5 = v17;
        int v28 = 136315394;
        __int16 v29 = "-[ESProfiler logPendingPreheatContextEvents:]";
        __int16 v30 = 2048;
        id v31 = [v4 count];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Unexpected pending preheat event count %lu", (uint8_t *)&v28, 0x16u);
LABEL_25:
      }
    }
  }
}

- (void)logPreheatOnlyEventsWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5
{
  id v5 = [(ESProfiler *)self powerLogEventDictionaryWithPowerLogEvent:a3 language:a4 modelVersion:a5 applicationName:0];
  +[CESRUtilities logToPowerLogForEventCategory:@"ESConnection" eventDictionary:v5];
}

- (id)powerLogEventDictionaryWithPowerLogEvent:(id)a3 language:(id)a4 modelVersion:(id)a5 applicationName:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (__CFString *)a3;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  int v14 = v13;
  if (v12) {
    CFStringRef v15 = v12;
  }
  else {
    CFStringRef v15 = @"undefined ASR event";
  }
  [v13 setObject:v15 forKeyedSubscript:CESRPowerLogEventString];

  if (v9) {
    [v14 setObject:v9 forKeyedSubscript:@"Language"];
  }
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"ModelVersion"];
  }
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:@"ApplicationName"];
  }

  return v14;
}

- (id)timestampInTicksForAudioProcessed:(double)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_audioDurationProcessingTimestampInTicks count] < 2) {
    goto LABEL_6;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017020;
  block[3] = &unk_100051540;
  block[4] = self;
  if (qword_10005D9D8 != -1) {
    dispatch_once(&qword_10005D9D8, block);
  }
  unint64_t v5 = vcvtad_u64_f64(a3 / *(double *)&qword_10005D9E0);
  if ((unint64_t)[(NSMutableArray *)self->_audioDurationProcessingTimestampInTicks count] <= v5)
  {
LABEL_6:
    unsigned int v7 = 0;
  }
  else
  {
    BOOL v6 = [(NSMutableArray *)self->_audioDurationProcessingTimestampInTicks objectAtIndex:v5];
    unsigned int v7 = [v6 objectAtIndex:1];
  }

  return v7;
}

- (void)setESSelfHelper:(id)a3
{
  objc_storeStrong((id *)&self->_selfHelper, a3);
  id v5 = a3;
  [(NSMutableArray *)self->_audioDurationProcessingTimestampInTicks removeAllObjects];
}

- (ESProfiler)initWithESSelfHelper:(id)a3 signpostHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ESProfiler;
  id v9 = [(ESProfiler *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_selfHelper, a3);
    objc_storeStrong((id *)&v10->_signpostHelper, a4);
    id v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    audioDurationProcessingTimestampInTicks = v10->_audioDurationProcessingTimestampInTicks;
    v10->_audioDurationProcessingTimestampInTicks = v11;
  }
  return v10;
}

+ (id)sharedProfiler
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000172B4;
  block[3] = &unk_100051540;
  id v7 = objc_alloc_init((Class)CESRSignpostHelper);
  uint64_t v2 = qword_10005D9D0;
  id v3 = v7;
  if (v2 != -1) {
    dispatch_once(&qword_10005D9D0, block);
  }
  id v4 = (id)qword_10005D9C8;

  return v4;
}

@end