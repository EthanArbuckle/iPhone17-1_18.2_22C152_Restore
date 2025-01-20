@interface CSAttSiriSpeechRecognitionNode
+ (int64_t)endpointModeFromEndpointMetrics:(id)a3;
- (BOOL)_shouldDisableLocalSpeechRecognizerWithOption:(id)a3 audioRecordContext:(id)a4;
- (BOOL)_shouldTriggerEagerResultForInterval:(double)a3;
- (BOOL)didDetectedEndpoint;
- (BOOL)disableEndpointer;
- (BOOL)isReady;
- (BOOL)onDeviceAssistantSampled;
- (BOOL)onDeviceDictationSampled;
- (BOOL)shouldProcessAudio;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSpeechRecognitionNode)init;
- (CSAttSiriSpeechRecognitionNode)initWithAttSiriController:(id)a3;
- (CSAttSiriSpeechRecognitionNode)initWithLocalSpeechRecognizer:(id)a3 fileLoggingDecisionBuilder:(id)a4;
- (CSAudioProcessWaitingBuffer)audioWaitingBuffer;
- (CSAudioRecordContext)recordContext;
- (CSEndpointDelayReporter)endpointDelayReporter;
- (CSOSTransaction)asrResultDeliveryTransaction;
- (CSOSTransaction)recordingTransaction;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSpeechRecognitionSelfHelper)asrSelfHelper;
- (CSUncompressedAudioLogging)audioLogging;
- (CoreEmbeddedSpeechRecognizerProvider)interactiveLocalSpeechRecognizer;
- (CoreEmbeddedSpeechRecognizerProvider)presetLocalSpeechRecognizer;
- (LBLocalSpeechRecognitionSettings)speechRecognitionSettings;
- (NSArray)requiredNodes;
- (NSHashTable)endpointFeatureReceivers;
- (NSHashTable)recognitionTaskCompletionReceivers;
- (NSHashTable)resultCandidateReceivers;
- (NSHashTable)speechRecognitionReceivers;
- (NSMutableArray)detectedEndpointTimes;
- (NSString)language;
- (NSString)localSpeechRecognizerTaskString;
- (NSString)mhId;
- (NSString)requestId;
- (NSString)siriSessionUUID;
- (NSUUID)recordingToken;
- (OS_dispatch_queue)localSpeechRecognizerQueue;
- (double)endpointStartTimeInSec;
- (double)localSpeechRecognizerDeliverAudioDuration;
- (double)timeToSpeakFirstWord;
- (id)_fetchInputOriginWithRecordContext:(id)a3;
- (id)_fetchRecognizerLanguageWithSiriLanguage:(id)a3 UILanguage:(id)a4 taskString:(id)a5 asrLocale:(id)a6;
- (id)_getAsrInputoriginFromContext:(id)a3;
- (id)_interactiveLocalSpeechRecognizer;
- (id)_sourceStringFromPreheatSource:(unint64_t)a3;
- (id)_stateToString:(unint64_t)a3;
- (id)fileLoggingDecisionBuilder;
- (int64_t)endpointMode;
- (unint64_t)audioSampleCountToSkip;
- (unint64_t)eagerResultId;
- (unint64_t)fetchCurrentState;
- (unint64_t)firstPartialResultTime;
- (unint64_t)lastEndpointEagerResultTime;
- (unint64_t)localSpeechRecognizerState;
- (unint64_t)recordingStartTime;
- (unint64_t)speechRecognitionMode;
- (unint64_t)type;
- (unint64_t)voiceTriggerFireMachTime;
- (unsigned)activeChannel;
- (void)_adjustEndpointStartTimeWithVoiceTriggerEvent:(id)a3;
- (void)_clearAudioProcessWaitingBufferIfNeeded;
- (void)_disableLocalSpeechRecognitionForRequestId:(id)a3 force:(BOOL)a4;
- (void)_handleDidRecognizedFinalSpeechPackage:(id)a3 requestId:(id)a4 metadata:(id)a5;
- (void)_handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:(id)a3 requestId:(id)a4 rcId:(unint64_t)a5 metadata:(id)a6;
- (void)_handleStopDeliverLocalSpeechRecognitionWithRequestId:(id)a3 reason:(unint64_t)a4;
- (void)_handleStopSpeechRecognitionTaskIfNeeded:(BOOL)a3;
- (void)_invalidateLocalSpeechRecognizer;
- (void)_markTimeToFirstWordMetric;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5;
- (void)_processAudioChunk:(id)a3 withReadyTimestamp:(id)a4;
- (void)_releaseRecordingTransactionIfNeededWithToken:(id)a3;
- (void)_resetLocalSpeechRecognizerParameters;
- (void)_scheduleRecordingTransactionReleaseTimer;
- (void)_setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)_setRecordingStartTimeWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)_setUpAudioLogging;
- (void)_startDeliverLocalSpeechRecognitionResultsWithRequestId:(id)a3;
- (void)_startLocalSpeechRecognizerIfNeeded;
- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3;
- (void)_stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)addEndpointFeatureReceiver:(id)a3;
- (void)addRecognitionTaskCompletionReceiver:(id)a3;
- (void)addResultCandidateReceiver:(id)a3;
- (void)addSpeechRecognitionReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)disableLocalSpeechRecognitionForRequestId:(id)a3;
- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)localSpeechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10;
- (void)localSpeechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didRecognizePartialPackage:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didSelectRecognitionModelWithModelProperties:(id)a4;
- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3;
- (void)preheatWithLanguage:(id)a3 source:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5;
- (void)prepareToStartSpeechRequestWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)registerEndpointerNode:(id)a3;
- (void)registerSSRNode:(id)a3;
- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)setActiveChannel:(unsigned int)a3;
- (void)setAsrResultDeliveryTransaction:(id)a3;
- (void)setAsrSelfHelper:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioLogging:(id)a3;
- (void)setAudioSampleCountToSkip:(unint64_t)a3;
- (void)setAudioWaitingBuffer:(id)a3;
- (void)setDetectedEndpointTimes:(id)a3;
- (void)setDidDetectedEndpoint:(BOOL)a3;
- (void)setDisableEndpointer:(BOOL)a3;
- (void)setEagerResultId:(unint64_t)a3;
- (void)setEndpointDelayReporter:(id)a3;
- (void)setEndpointFeatureReceivers:(id)a3;
- (void)setEndpointMode:(int64_t)a3;
- (void)setEndpointStartTimeInSec:(double)a3;
- (void)setFileLoggingDecisionBuilder:(id)a3;
- (void)setFirstPartialResultTime:(unint64_t)a3;
- (void)setInteractiveLocalSpeechRecognizer:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLastEndpointEagerResultTime:(unint64_t)a3;
- (void)setLocalSpeechRecognizerDeliverAudioDuration:(double)a3;
- (void)setLocalSpeechRecognizerQueue:(id)a3;
- (void)setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)setLocalSpeechRecognizerTaskString:(id)a3;
- (void)setMhId:(id)a3;
- (void)setOnDeviceAssistantSampled:(BOOL)a3;
- (void)setOnDeviceDictationSampled:(BOOL)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPresetLocalSpeechRecognizer:(id)a3;
- (void)setRecognitionTaskCompletionReceivers:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingStartTime:(unint64_t)a3;
- (void)setRecordingToken:(id)a3;
- (void)setRecordingTransaction:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setResultCandidateReceivers:(id)a3;
- (void)setShouldProcessAudio:(BOOL)a3;
- (void)setSiriSessionUUID:(id)a3;
- (void)setSpeechRecognitionMode:(unint64_t)a3;
- (void)setSpeechRecognitionReceivers:(id)a3;
- (void)setSpeechRecognitionSettings:(id)a3;
- (void)setTimeToSpeakFirstWord:(double)a3;
- (void)setVoiceTriggerFireMachTime:(unint64_t)a3;
- (void)start;
- (void)startSpeechRecognitionResultsWithSettings:(id)a3;
- (void)stop;
- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)stopWithReason:(unint64_t)a3 stopStreamOption:(id)a4;
- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11;
@end

@implementation CSAttSiriSpeechRecognitionNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrSelfHelper, 0);
  objc_storeStrong((id *)&self->_audioLogging, 0);
  objc_storeStrong((id *)&self->_endpointDelayReporter, 0);
  objc_storeStrong((id *)&self->_detectedEndpointTimes, 0);
  objc_storeStrong(&self->_fileLoggingDecisionBuilder, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_recordingToken, 0);
  objc_storeStrong((id *)&self->_siriSessionUUID, 0);
  objc_storeStrong((id *)&self->_recordingTransaction, 0);
  objc_storeStrong((id *)&self->_asrResultDeliveryTransaction, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_speechRecognitionSettings, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_audioWaitingBuffer, 0);
  objc_storeStrong((id *)&self->_localSpeechRecognizerTaskString, 0);
  objc_storeStrong((id *)&self->_presetLocalSpeechRecognizer, 0);
  objc_storeStrong((id *)&self->_interactiveLocalSpeechRecognizer, 0);
  objc_storeStrong((id *)&self->_recognitionTaskCompletionReceivers, 0);
  objc_storeStrong((id *)&self->_speechRecognitionReceivers, 0);
  objc_storeStrong((id *)&self->_resultCandidateReceivers, 0);
  objc_storeStrong((id *)&self->_endpointFeatureReceivers, 0);
  objc_storeStrong((id *)&self->_localSpeechRecognizerQueue, 0);
  objc_destroyWeak((id *)&self->_ssrNode);
  objc_destroyWeak((id *)&self->_endpointerNode);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
}

- (void)setAsrSelfHelper:(id)a3
{
}

- (CSSpeechRecognitionSelfHelper)asrSelfHelper
{
  return self->_asrSelfHelper;
}

- (void)setOnDeviceAssistantSampled:(BOOL)a3
{
  self->_onDeviceAssistantSampled = a3;
}

- (BOOL)onDeviceAssistantSampled
{
  return self->_onDeviceAssistantSampled;
}

- (void)setOnDeviceDictationSampled:(BOOL)a3
{
  self->_onDeviceDictationSampled = a3;
}

- (BOOL)onDeviceDictationSampled
{
  return self->_onDeviceDictationSampled;
}

- (void)setAudioLogging:(id)a3
{
}

- (CSUncompressedAudioLogging)audioLogging
{
  return self->_audioLogging;
}

- (void)setSpeechRecognitionMode:(unint64_t)a3
{
  self->_speechRecognitionMode = a3;
}

- (unint64_t)speechRecognitionMode
{
  return self->_speechRecognitionMode;
}

- (void)setTimeToSpeakFirstWord:(double)a3
{
  self->_timeToSpeakFirstWord = a3;
}

- (double)timeToSpeakFirstWord
{
  return self->_timeToSpeakFirstWord;
}

- (void)setFirstPartialResultTime:(unint64_t)a3
{
  self->_firstPartialResultTime = a3;
}

- (unint64_t)firstPartialResultTime
{
  return self->_firstPartialResultTime;
}

- (void)setRecordingStartTime:(unint64_t)a3
{
  self->_recordingStartTime = a3;
}

- (unint64_t)recordingStartTime
{
  return self->_recordingStartTime;
}

- (void)setEndpointDelayReporter:(id)a3
{
}

- (CSEndpointDelayReporter)endpointDelayReporter
{
  return self->_endpointDelayReporter;
}

- (void)setDisableEndpointer:(BOOL)a3
{
  self->_disableEndpointer = a3;
}

- (BOOL)disableEndpointer
{
  return self->_disableEndpointer;
}

- (void)setLastEndpointEagerResultTime:(unint64_t)a3
{
  self->_lastEndpointEagerResultTime = a3;
}

- (unint64_t)lastEndpointEagerResultTime
{
  return self->_lastEndpointEagerResultTime;
}

- (void)setDetectedEndpointTimes:(id)a3
{
}

- (NSMutableArray)detectedEndpointTimes
{
  return self->_detectedEndpointTimes;
}

- (void)setDidDetectedEndpoint:(BOOL)a3
{
  self->_didDetectedEndpoint = a3;
}

- (void)setAudioSampleCountToSkip:(unint64_t)a3
{
  self->_audioSampleCountToSkip = a3;
}

- (unint64_t)audioSampleCountToSkip
{
  return self->_audioSampleCountToSkip;
}

- (void)setEndpointStartTimeInSec:(double)a3
{
  self->_endpointStartTimeInSec = a3;
}

- (double)endpointStartTimeInSec
{
  return self->_endpointStartTimeInSec;
}

- (void)setFileLoggingDecisionBuilder:(id)a3
{
}

- (id)fileLoggingDecisionBuilder
{
  return self->_fileLoggingDecisionBuilder;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setVoiceTriggerFireMachTime:(unint64_t)a3
{
  self->_voiceTriggerFireMachTime = a3;
}

- (unint64_t)voiceTriggerFireMachTime
{
  return self->_voiceTriggerFireMachTime;
}

- (void)setRecordingToken:(id)a3
{
}

- (NSUUID)recordingToken
{
  return self->_recordingToken;
}

- (void)setSiriSessionUUID:(id)a3
{
}

- (NSString)siriSessionUUID
{
  return self->_siriSessionUUID;
}

- (void)setRecordingTransaction:(id)a3
{
}

- (CSOSTransaction)recordingTransaction
{
  return self->_recordingTransaction;
}

- (void)setAsrResultDeliveryTransaction:(id)a3
{
}

- (CSOSTransaction)asrResultDeliveryTransaction
{
  return self->_asrResultDeliveryTransaction;
}

- (void)setEndpointMode:(int64_t)a3
{
  self->_endpointMode = a3;
}

- (int64_t)endpointMode
{
  return self->_endpointMode;
}

- (void)setShouldProcessAudio:(BOOL)a3
{
  self->_shouldProcessAudio = a3;
}

- (BOOL)shouldProcessAudio
{
  return self->_shouldProcessAudio;
}

- (void)setRecordContext:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setSpeechRecognitionSettings:(id)a3
{
}

- (LBLocalSpeechRecognitionSettings)speechRecognitionSettings
{
  return self->_speechRecognitionSettings;
}

- (void)setEagerResultId:(unint64_t)a3
{
  self->_eagerResultId = a3;
}

- (unint64_t)eagerResultId
{
  return self->_eagerResultId;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setActiveChannel:(unsigned int)a3
{
  self->_activeChannel = a3;
}

- (unsigned)activeChannel
{
  return self->_activeChannel;
}

- (void)setLocalSpeechRecognizerDeliverAudioDuration:(double)a3
{
  self->_localSpeechRecognizerDeliverAudioDuration = a3;
}

- (void)setAudioWaitingBuffer:(id)a3
{
}

- (CSAudioProcessWaitingBuffer)audioWaitingBuffer
{
  return self->_audioWaitingBuffer;
}

- (void)setLocalSpeechRecognizerState:(unint64_t)a3
{
  self->_localSpeechRecognizerState = a3;
}

- (unint64_t)localSpeechRecognizerState
{
  return self->_localSpeechRecognizerState;
}

- (void)setLocalSpeechRecognizerTaskString:(id)a3
{
}

- (NSString)localSpeechRecognizerTaskString
{
  return self->_localSpeechRecognizerTaskString;
}

- (void)setPresetLocalSpeechRecognizer:(id)a3
{
}

- (CoreEmbeddedSpeechRecognizerProvider)presetLocalSpeechRecognizer
{
  return self->_presetLocalSpeechRecognizer;
}

- (void)setInteractiveLocalSpeechRecognizer:(id)a3
{
}

- (CoreEmbeddedSpeechRecognizerProvider)interactiveLocalSpeechRecognizer
{
  return self->_interactiveLocalSpeechRecognizer;
}

- (void)setRecognitionTaskCompletionReceivers:(id)a3
{
}

- (NSHashTable)recognitionTaskCompletionReceivers
{
  return self->_recognitionTaskCompletionReceivers;
}

- (void)setSpeechRecognitionReceivers:(id)a3
{
}

- (NSHashTable)speechRecognitionReceivers
{
  return self->_speechRecognitionReceivers;
}

- (void)setResultCandidateReceivers:(id)a3
{
}

- (NSHashTable)resultCandidateReceivers
{
  return self->_resultCandidateReceivers;
}

- (void)setEndpointFeatureReceivers:(id)a3
{
}

- (NSHashTable)endpointFeatureReceivers
{
  return self->_endpointFeatureReceivers;
}

- (void)setLocalSpeechRecognizerQueue:(id)a3
{
}

- (OS_dispatch_queue)localSpeechRecognizerQueue
{
  return self->_localSpeechRecognizerQueue;
}

- (CSAttSiriSSRNode)ssrNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ssrNode);
  return (CSAttSiriSSRNode *)WeakRetained;
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
  return (CSAttSiriEndpointerNode *)WeakRetained;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (void)_markTimeToFirstWordMetric
{
  unint64_t recordingStartTime = self->_recordingStartTime;
  if (recordingStartTime && self->_firstPartialResultTime && self->_timeToSpeakFirstWord > 0.0)
  {
    os_signpost_id_t v4 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    v5 = CSLogContextFacilityCoreSpeech;
    v6 = v5;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v9 = CSLogContextFacilityCoreSpeech;
    }
    else
    {
      if (os_signpost_enabled(v5))
      {
        unint64_t v7 = self->_recordingStartTime;
        double timeToSpeakFirstWord = self->_timeToSpeakFirstWord;
        *(float *)&double timeToSpeakFirstWord = timeToSpeakFirstWord;
        int v14 = 134349570;
        v15 = (char *)+[CSFTimeUtils secondsToHostTime:timeToSpeakFirstWord]+ v7;
        __int16 v16 = 2080;
        v17 = "SiriX";
        __int16 v18 = 2080;
        v19 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ondevice_TimeToFirstWord", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v14, 0x20u);
      }

      v9 = CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v9))
      {
        unint64_t firstPartialResultTime = self->_firstPartialResultTime;
        int v14 = 134349570;
        v15 = (const char *)firstPartialResultTime;
        __int16 v16 = 2080;
        v17 = "SiriX";
        __int16 v18 = 2080;
        v19 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v4, "ondevice_TimeToFirstWord", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v14, 0x20u);
      }
    }
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = self->_firstPartialResultTime;
      double v13 = self->_timeToSpeakFirstWord;
      int v14 = 136315906;
      v15 = "-[CSAttSiriSpeechRecognitionNode _markTimeToFirstWordMetric]";
      __int16 v16 = 2048;
      v17 = (const char *)recordingStartTime;
      __int16 v18 = 2048;
      v19 = (const char *)v12;
      __int16 v20 = 2048;
      double v21 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Can't calculate TTFW due to missing metric: %llu %llu %f", (uint8_t *)&v14, 0x2Au);
    }
  }
}

- (id)_fetchRecognizerLanguageWithSiriLanguage:(id)a3 UILanguage:(id)a4 taskString:(id)a5 asrLocale:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging]) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = [v11 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation] ^ 1;
  }
  if (v12) {
    unsigned int v13 = 1;
  }
  int v14 = v13 ^ 1;
  if (v12) {
    int v14 = 1;
  }
  if (v13) {
    v15 = v12;
  }
  else {
    v15 = v9;
  }
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = v9;
  }
  if (!v14) {
    v15 = v16;
  }
  id v17 = v15;
  __int16 v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    double v21 = "-[CSAttSiriSpeechRecognitionNode _fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:]";
    __int16 v22 = 2114;
    id v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Selected recognizer language : %{public}@", (uint8_t *)&v20, 0x16u);
  }

  return v17;
}

- (id)_sourceStringFromPreheatSource:(unint64_t)a3
{
  if (a3 == 1)
  {
    os_signpost_id_t v4 = (id *)&CoreEmbeddedSpeechRecognizerSourceAssistant;
LABEL_5:
    id v5 = *v4;
    return v5;
  }
  if (a3 == 2)
  {
    os_signpost_id_t v4 = (id *)&CoreEmbeddedSpeechRecognizerSourceDictation;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (id)_stateToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"[Unknown]";
  }
  else {
    return off_10024FEC0[a3];
  }
}

- (void)_setLocalSpeechRecognizerState:(unint64_t)a3
{
  id v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    unint64_t v7 = v5;
    v8 = [(CSAttSiriSpeechRecognitionNode *)self _stateToString:localSpeechRecognizerState];
    id v9 = [(CSAttSiriSpeechRecognitionNode *)self _stateToString:a3];
    int v10 = 136315650;
    id v11 = "-[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:]";
    __int16 v12 = 2114;
    unsigned int v13 = v8;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s set current state from %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);
  }
  self->_unint64_t localSpeechRecognizerState = a3;
}

- (void)_clearAudioProcessWaitingBufferIfNeeded
{
  if (self->_audioWaitingBuffer)
  {
    audioWaitingBuffer = self->_audioWaitingBuffer;
    self->_audioWaitingBuffer = 0;
  }
}

- (id)_getAsrInputoriginFromContext:(id)a3
{
  id v3 = a3;
  if ([v3 isVoiceTriggered]
    && ![v3 isRequestFromSpokenNotification])
  {
    CFStringRef v4 = @"VoiceTrigger";
  }
  else
  {
    CFStringRef v4 = @"HomeButton";
    if (([v3 isiOSButtonPress] & 1) == 0)
    {
      if ([v3 isRTSTriggered])
      {
        CFStringRef v4 = @"RaiseToSpeak";
      }
      else if ([v3 isContinuousConversation])
      {
        CFStringRef v4 = @"MagusFollowup";
      }
    }
  }

  return (id)v4;
}

- (id)_fetchInputOriginWithRecordContext:(id)a3
{
  id v4 = a3;
  id v5 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings inputOrigin];
  if ([v4 isRequestFromTriggerless]
    && +[CSUtils supportMedocAnnounce])
  {

    v6 = @"MagusFollowup";
  }
  else
  {
    if (!v5)
    {
      unint64_t v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315394;
        int v10 = "-[CSAttSiriSpeechRecognitionNode _fetchInputOriginWithRecordContext:]";
        __int16 v11 = 2114;
        uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Received inputOrigin: %{public}@ from Request Dispatcher, use hard-coded map", (uint8_t *)&v9, 0x16u);
      }
      id v5 = [(CSAttSiriSpeechRecognitionNode *)self _getAsrInputoriginFromContext:v4];
    }
    v6 = v5;
  }

  return v6;
}

- (double)localSpeechRecognizerDeliverAudioDuration
{
  uint64_t v6 = 0;
  unint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007BC0C;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)didDetectedEndpoint
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007BCCC;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)fetchCurrentState
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 100;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007BD90;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)localSpeechRecognizer:(id)a3 didSelectRecognitionModelWithModelProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    int v10 = [v7 modelRoot];
    *(_DWORD *)buf = 136315394;
    v24 = "-[CSAttSiriSpeechRecognitionNode localSpeechRecognizer:didSelectRecognitionModelWithModelProperties:]";
    __int16 v25 = 2114;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Received ASR datapack root directory: %{public}@", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  __int16 v11 = [(CSAttSiriSpeechRecognitionNode *)self speechRecognitionReceivers];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v15);
        if (objc_opt_respondsToSelector())
        {
          id v17 = [v7 modelRoot];
          [v16 didSelectRecognitionModelWithModelRoot:v17];
        }
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)localSpeechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  id v17 = a7;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007C060;
  v20[3] = &unk_1002510E0;
  int64_t v22 = a4;
  int64_t v23 = a5;
  v20[4] = self;
  id v21 = v17;
  double v24 = a6;
  double v25 = a8;
  int64_t v26 = a9;
  double v27 = a10;
  id v19 = v17;
  dispatch_async(localSpeechRecognizerQueue, v20);
}

- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007C36C;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)_handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:(id)a3 requestId:(id)a4 rcId:(unint64_t)a5 metadata:(id)a6
{
  id v10 = a3;
  id v30 = a4;
  id v29 = a6;
  __int16 v11 = v10;
  +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:v10];
  double v13 = v12 * 1000.0;
  id v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[CSAttSiriSpeechRecognitionNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:requestId:rcId:metadata:]";
    __int16 v43 = 2048;
    double v44 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s SpeechPackage processed audio duration: %f ms", buf, 0x16u);
  }
  if ([(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableVoiceCommands])
  {
    long long v37 = 0uLL;
    long long v38 = 0uLL;
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    v15 = [(CSAttSiriSpeechRecognitionNode *)self resultCandidateReceivers];
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v20 didReceiveResultCandidateWithRequestId:v30 rcId:a5 speechPackage:v11 duration:v29 metadata:self->_localSpeechRecognizerTaskString taskName:v13];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v17);
    }
  }
  else
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    v15 = [(CSAttSiriSpeechRecognitionNode *)self resultCandidateReceivers];
    id v21 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v15);
          }
          double v25 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          if (objc_opt_respondsToSelector())
          {
            int64_t v26 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings inputOrigin];
            [v25 didReceiveResultCandidateWithRequestId:v30 rcId:a5 inputOrigin:v26 speechPackage:v11 duration:self->_localSpeechRecognizerTaskString taskName:v13];
          }
        }
        id v22 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v22);
    }
  }

  self->_lastEndpointEagerResultTime = mach_continuous_time();
  endpointDelayReporter = self->_endpointDelayReporter;
  +[CSAttSiriSpeechPackageHelper getLastTokenSilenceStartFromSpeechPackage:v11];
  [(CSEndpointDelayReporter *)endpointDelayReporter setUserSpeakingEndedTimeInMs:v28 * 1000.0];
}

- (void)_handleDidRecognizedFinalSpeechPackage:(id)a3 requestId:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(CSAttSiriSpeechRecognitionNode *)self _markTimeToFirstWordMetric];
  if (self->_localSpeechRecognizerState == 2)
  {
    if ([(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableVoiceCommands])
    {
      long long v28 = 0uLL;
      long long v29 = 0uLL;
      long long v26 = 0uLL;
      long long v27 = 0uLL;
      __int16 v11 = [(CSAttSiriSpeechRecognitionNode *)self resultCandidateReceivers];
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v16 didReceiveFinalResultWithRequestId:v9 speechPackage:v8 metadata:v10 taskName:self->_localSpeechRecognizerTaskString];
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v13);
      }
    }
    else
    {
      long long v24 = 0uLL;
      long long v25 = 0uLL;
      *((void *)&v22 + 1) = 0;
      long long v23 = 0uLL;
      __int16 v11 = [(CSAttSiriSpeechRecognitionNode *)self resultCandidateReceivers];
      id v17 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v11);
            }
            id v21 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector()) {
              [v21 didReceiveFinalResultWithRequestId:v9 speechPackage:v8 taskName:self->_localSpeechRecognizerTaskString];
            }
          }
          id v18 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v18);
      }
    }
  }
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007D178;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D418;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D694;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007D928;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v6 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DB84;
  block[3] = &unk_1002532A8;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePartialPackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007DDE0;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007E0E8;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E3D0;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_resetLocalSpeechRecognizerParameters
{
  self->_eagerResultId = 0;
  self->_unint64_t firstPartialResultTime = 0;
  self->_double timeToSpeakFirstWord = 0.0;
}

- (void)_invalidateLocalSpeechRecognizer
{
  interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
  if (interactiveLocalSpeechRecognizer)
  {
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[CSAttSiriSpeechRecognitionNode _invalidateLocalSpeechRecognizer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
      interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
    }
    [(CoreEmbeddedSpeechRecognizerProvider *)interactiveLocalSpeechRecognizer invalidate];
    id v5 = self->_interactiveLocalSpeechRecognizer;
    self->_interactiveLocalSpeechRecognizer = 0;
  }
  localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
  self->_localSpeechRecognizerTaskString = 0;
}

- (id)_interactiveLocalSpeechRecognizer
{
  if (!+[CSUtils supportsSpeechRecognitionOnDevice])
  {
    id v4 = 0;
    goto LABEL_13;
  }
  if (!self->_interactiveLocalSpeechRecognizer)
  {
    presetLocalSpeechRecognizer = self->_presetLocalSpeechRecognizer;
    if (!presetLocalSpeechRecognizer)
    {
      if (+[CSUtils isASRViaSpeechAPIEnabled])
      {
        id v5 = (CoreEmbeddedSpeechRecognizerProvider *)[objc_alloc((Class)CoreEmbeddedSpeechAnalyzer) initWithDelegate:self instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
        interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
        self->_interactiveLocalSpeechRecognizer = v5;

        int v7 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        id v8 = self->_interactiveLocalSpeechRecognizer;
        int v14 = 136315650;
        v15 = "-[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]";
        __int16 v16 = 2112;
        id v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        id v9 = "%s %@ created speech analyzer (v2) %@";
      }
      else
      {
        id v10 = (CoreEmbeddedSpeechRecognizerProvider *)[objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:self instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
        double v11 = self->_interactiveLocalSpeechRecognizer;
        self->_interactiveLocalSpeechRecognizer = v10;

        int v7 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        id v12 = self->_interactiveLocalSpeechRecognizer;
        int v14 = 136315650;
        v15 = "-[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]";
        __int16 v16 = 2112;
        id v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        id v9 = "%s %@ created speech recognizer (v1) %@";
      }
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 0x20u);
      goto LABEL_12;
    }
    objc_storeStrong((id *)&self->_interactiveLocalSpeechRecognizer, presetLocalSpeechRecognizer);
  }
LABEL_12:
  id v4 = self->_interactiveLocalSpeechRecognizer;
LABEL_13:
  return v4;
}

- (void)_releaseRecordingTransactionIfNeededWithToken:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    recordingToken = self->_recordingToken;
    int v10 = 136315650;
    double v11 = "-[CSAttSiriSpeechRecognitionNode _releaseRecordingTransactionIfNeededWithToken:]";
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2114;
    v15 = recordingToken;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Token : %{public}@, currentToken : %{public}@", (uint8_t *)&v10, 0x20u);
  }
  if ([v4 isEqual:self->_recordingToken])
  {
    [(CSAttSiriSpeechRecognitionNode *)self _clearAudioProcessWaitingBufferIfNeeded];
    int v7 = self->_recordingToken;
    self->_recordingToken = 0;

    recordingTransaction = self->_recordingTransaction;
    self->_recordingTransaction = 0;
  }
  else
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      double v11 = "-[CSAttSiriSpeechRecognitionNode _releaseRecordingTransactionIfNeededWithToken:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s recordingToken doesn't match, ignore", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_scheduleRecordingTransactionReleaseTimer
{
  objc_initWeak(&location, self);
  unint64_t v3 = self->_recordingToken;
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    recordingToken = self->_recordingToken;
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[CSAttSiriSpeechRecognitionNode _scheduleRecordingTransactionReleaseTimer]";
    __int16 v15 = 2114;
    __int16 v16 = recordingToken;
    __int16 v17 = 2050;
    uint64_t v18 = 0x4014000000000000;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Schedule RecordingTransactionReleaseTimer %{public}@ for %{public}lf seconds", buf, 0x20u);
  }
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EB64;
  block[3] = &unk_100253798;
  objc_copyWeak(&v11, &location);
  int v10 = v3;
  id v8 = v3;
  dispatch_after(v6, localSpeechRecognizerQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_handleStopSpeechRecognitionTaskIfNeeded:(BOOL)a3
{
  if (!self->_shouldProcessAudio && !a3) {
    return;
  }
  self->_shouldProcessAudio = 0;
  [(CSAttSiriSpeechRecognitionNode *)self _scheduleRecordingTransactionReleaseTimer];
  localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
  if (localSpeechRecognizerTaskString)
  {
    dispatch_time_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v17 = 136315394;
      *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = localSpeechRecognizerTaskString;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Stopping task %@", v17, 0x16u);
    }
    [(CoreEmbeddedSpeechRecognizerProvider *)self->_interactiveLocalSpeechRecognizer finishAudio];
    [(CSPlainAudioFileWriter *)self->_audioFileWriter endAudio];
  }
  unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
  if (localSpeechRecognizerState != 1)
  {
    id v9 = self->_localSpeechRecognizerTaskString;
    if (v9 && self->_interactiveLocalSpeechRecognizer)
    {
      if (localSpeechRecognizerState != 3)
      {
LABEL_22:
        recordContext = self->_recordContext;
        self->_recordContext = 0;

        self->_endpointStartTimeInSec = 0.0;
        self->_audioSampleCountToSkip = 0;
        [(CSAttSiriSpeechRecognitionNode *)self _clearAudioProcessWaitingBufferIfNeeded];
        return;
      }
      int v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v17 = 136315138;
        *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
        id v11 = "%s Complete task now since local SR is disabled";
        __int16 v12 = v10;
        uint32_t v13 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, v17, v13);
      }
    }
    else
    {
      __int16 v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
        *(_DWORD *)__int16 v17 = 136315650;
        *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
        *(_WORD *)&v17[12] = 2114;
        *(void *)&v17[14] = v9;
        *(_WORD *)&v17[22] = 2050;
        uint64_t v18 = interactiveLocalSpeechRecognizer;
        id v11 = "%s Complete task now since taskString(%{public}@) or localSR(%{public}p) is nil";
        __int16 v12 = v14;
        uint32_t v13 = 32;
        goto LABEL_20;
      }
    }
    -[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 0, *(_OWORD *)v17, *(void *)&v17[16], v18);
    goto LABEL_22;
  }
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int16 v17 = 136315138;
    *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Request dispatcher didn't ask to start until end", v17, 0xCu);
  }
  [(CSAttSiriSpeechRecognitionNode *)self _setLocalSpeechRecognizerState:4];
}

- (void)_processAudioChunk:(id)a3 withReadyTimestamp:(id)a4
{
  id v6 = a3;
  if (self->_localSpeechRecognizerTaskString)
  {
    id v7 = a4;
    float v8 = (float)(unint64_t)[v6 numSamples];
    +[CSConfig inputRecordingSampleRate];
    self->_localSpeechRecognizerDeliverAudioDuration = self->_localSpeechRecognizerDeliverAudioDuration
                                                     + (float)(v8 / v9);
    int v10 = [v6 dataForChannel:self->_activeChannel];
    audioFileWriter = self->_audioFileWriter;
    id v12 = v10;
    -[CSPlainAudioFileWriter addSamples:numSamples:](audioFileWriter, "addSamples:numSamples:", [v12 bytes], objc_msgSend(v6, "numSamples"));
    if (+[CSConfig inputRecordingIsFloat])
    {
      uint64_t v13 = +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:v12];

      id v12 = (id)v13;
    }
    __int16 v14 = [(CSAttSiriSpeechRecognitionNode *)self _interactiveLocalSpeechRecognizer];
    [v6 hostTime];
    __int16 v15 = +[NSNumber numberWithUnsignedLongLong:CSMachAbsoluteTimeToMachContinuousTime()];
    [v14 addAudioPacket:v12 packetRecordedTime:v15 packetReadyUpstreamTime:v7];

    if (+[CSUtils isMedocFeatureEnabled]
      && [(CSAttSiriSpeechRecognitionNode *)self _shouldTriggerEagerResultForInterval:self->_localSpeechRecognizerDeliverAudioDuration])
    {
      __int16 v16 = [(CSAttSiriSpeechRecognitionNode *)self _interactiveLocalSpeechRecognizer];
      [v16 requestEagerResult];
    }
    [(CSUncompressedAudioLogging *)self->_audioLogging appendAudioData:v12];
    __int16 v17 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v17;
      int v19 = 136315394;
      long long v20 = "-[CSAttSiriSpeechRecognitionNode _processAudioChunk:withReadyTimestamp:]";
      __int16 v21 = 2050;
      id v22 = [v6 numSamples];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Added %{public}lu samples to local speech recognizer", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (BOOL)_shouldTriggerEagerResultForInterval:(double)a3
{
  id v5 = (char *)[(NSMutableArray *)self->_detectedEndpointTimes count] + 1;
  while (1)
  {
    id v6 = v5--;
    if (!v5) {
      break;
    }
    id v7 = [(NSMutableArray *)self->_detectedEndpointTimes objectAtIndexedSubscript:v6 - 2];
    [v7 doubleValue];
    double v9 = v8;

    if (v9 < a3)
    {
      -[NSMutableArray removeObjectsInRange:](self->_detectedEndpointTimes, "removeObjectsInRange:", 0, v5);
      int v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = "-[CSAttSiriSpeechRecognitionNode _shouldTriggerEagerResultForInterval:]";
        __int16 v14 = 2048;
        double v15 = a3;
        __int16 v16 = 2048;
        __int16 v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Triggering eager RC generation at time %f, removing %lu entries", (uint8_t *)&v12, 0x20u);
      }
      return v6 != (char *)1;
    }
  }
  return v6 != (char *)1;
}

- (void)_startLocalSpeechRecognizerIfNeeded
{
  unint64_t v3 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    id v5 = v3;
    id v6 = [(CSAttSiriSpeechRecognitionNode *)self _stateToString:localSpeechRecognizerState];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s current state = %{public}@", buf, 0x16u);
  }
  if (self->_localSpeechRecognizerState == 2)
  {
    id v7 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    language = self->_language;
    self->_language = v7;

    self->_didDetectedEndpoint = 0;
    self->_localSpeechRecognizerDeliverAudioDuration = 0.0;
    self->_lastEndpointEagerResultTime = 0;
    double v9 = [[CSEndpointDelayReporter alloc] initWithRequestMHUUID:0 turnIdentifier:0];
    endpointDelayReporter = self->_endpointDelayReporter;
    self->_endpointDelayReporter = v9;

    [(NSMutableArray *)self->_detectedEndpointTimes removeAllObjects];
    if (!self->_disableEndpointer)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
      int v12 = +[LBLocalSpeechRecognitionSettings getTaskStringFromSpeechRecognitionSettings:self->_speechRecognitionSettings];
      [WeakRetained processTaskString:v12];
    }
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    uint64_t v13 = [(CSAttSiriSpeechRecognitionNode *)self speechRecognitionReceivers];
    id v14 = [v13 countByEnumeratingWithState:&v156 objects:v177 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v157;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v157 != v15) {
            objc_enumerationMutation(v13);
          }
          __int16 v17 = *(void **)(*((void *)&v156 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            requestId = self->_requestId;
            localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
            long long v20 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings sharedUserInfos];
            [v17 didReceiveStartRecognitionRequest:requestId taskName:localSpeechRecognizerTaskString sharedUserInfo:v20];
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v156 objects:v177 count:16];
      }
      while (v14);
    }

    id v21 = objc_loadWeakRetained((id *)&self->_ssrNode);
    id v22 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings sharedUserInfos];
    [v21 cacheSharedUserInfos:v22];

    long long v23 = self->_language;
    if (v23 && self->_localSpeechRecognizerTaskString)
    {
      unsigned __int8 v131 = [(CSAudioRecordContext *)self->_recordContext isVoiceTriggered];
      v142 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings dictationUIInteractionId];
      unsigned __int8 v132 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings shouldStoreAudioOnDevice];
      v137 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings overrideModelPath];
      int v133 = CSShouldCensorSpeech();
      v141 = [(CSAttSiriSpeechRecognitionNode *)self _fetchInputOriginWithRecordContext:self->_recordContext];
      unsigned __int8 v130 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings deliverEagerPackage];
      long long v24 = self->_language;
      long long v25 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings UILanguage];
      long long v26 = self->_localSpeechRecognizerTaskString;
      long long v27 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings asrLocale];
      v136 = [(CSAttSiriSpeechRecognitionNode *)self _fetchRecognizerLanguageWithSiriLanguage:v24 UILanguage:v25 taskString:v26 asrLocale:v27];

      [(CSAttSiriSpeechRecognitionNode *)self _setUpAudioLogging];
      if (v137)
      {
        v135 = +[NSURL fileURLWithPath:v137 isDirectory:1];
      }
      else
      {
        v135 = 0;
      }
      double v29 = 0.0;
      double endpointStartTimeInSec = 0.0;
      if ([(CSAudioRecordContext *)self->_recordContext isVoiceTriggered])
      {
        double endpointStartTimeInSec = self->_endpointStartTimeInSec;
        unint64_t audioSampleCountToSkip = self->_audioSampleCountToSkip;
        +[CSConfig inputRecordingSampleRate];
        double v29 = (float)((float)audioSampleCountToSkip / v32);
      }
      [(CSAttSiriSpeechRecognitionNode *)self _resetLocalSpeechRecognizerParameters];
      if (v142)
      {
        v134 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings applicationName];
      }
      else
      {
        v134 = @"com.apple.siri.assistant";
      }
      id v129 = objc_alloc((Class)CESRSpeechParameters);
      v127 = self->_localSpeechRecognizerTaskString;
      v128 = self->_requestId;
      v140 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings recognitionOverrides];
      unsigned __int8 v126 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings detectUtterances];
      unsigned __int8 v125 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings secureOfflineOnly];
      unsigned __int8 v124 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings continuousListening];
      unsigned __int8 v123 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings shouldHandleCapitalization];
      [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings maximumRecognitionDuration];
      double v34 = v33;
      v139 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings location];
      v138 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings jitGrammar];
      BOOL disableEndpointer = self->_disableEndpointer;
      unsigned __int8 v35 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableEmojiRecognition];
      unsigned __int8 v36 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableAutoPunctuation];
      unsigned __int8 v37 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableVoiceCommands];
      long long v38 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings sharedUserInfos];
      v39 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings prefixText];
      v40 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings postfixText];
      v41 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings selectedText];
      v42 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings powerContext];
      LOBYTE(v121) = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings shouldGenerateVoiceCommandCandidates];
      BYTE4(v120) = v37;
      BYTE3(v120) = v36;
      BYTE2(v120) = v35;
      BYTE1(v120) = disableEndpointer;
      LOBYTE(v120) = v130;
      LOBYTE(v119) = 0;
      HIBYTE(v118) = v123;
      BYTE6(v118) = v124;
      BYTE5(v118) = v132;
      BYTE4(v118) = v125;
      BYTE3(v118) = v131;
      BYTE2(v118) = v133;
      BYTE1(v118) = v126;
      LOBYTE(v118) = 0;
      id v43 = objc_msgSend(v129, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:", v136, v128, v142, v127, 0, v134, v34, endpointStartTimeInSec, v29, 0, v140, v135,
              0,
              0,
              v118,
              v119,
              v141,
              v139,
              v138,
              v120,
              v38,
              v39,
              v40,
              v41,
              v42,
              v121);

      double v44 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        p_speechRecognitionSettings = &self->_speechRecognitionSettings;
        speechRecognitionSettings = self->_speechRecognitionSettings;
        v47 = self->_localSpeechRecognizerTaskString;
        v48 = v44;
        v49 = [(LBLocalSpeechRecognitionSettings *)speechRecognitionSettings location];
        if (v133) {
          CFStringRef v50 = @"YES";
        }
        else {
          CFStringRef v50 = @"NO";
        }
        v51 = [(LBLocalSpeechRecognitionSettings *)*p_speechRecognitionSettings jitGrammar];
        if ([(LBLocalSpeechRecognitionSettings *)*p_speechRecognitionSettings enableVoiceCommands])CFStringRef v52 = @"YES"; {
        else
        }
          CFStringRef v52 = @"NO";
        *(_DWORD *)buf = 136316930;
        *(void *)&uint8_t buf[4] = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v47;
        *(_WORD *)&buf[22] = 2050;
        v166 = *(const char **)&endpointStartTimeInSec;
        __int16 v167 = 2114;
        v168 = v141;
        __int16 v169 = 2112;
        v170 = v49;
        __int16 v171 = 2114;
        CFStringRef v172 = v50;
        __int16 v173 = 2112;
        v174 = v51;
        __int16 v175 = 2114;
        CFStringRef v176 = v52;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s Calling local speech recognition with settings : task(%{public}@), endpointStart(%{public}.3f), inputOrigin(%{public}@), location(%@), shouldCensorSpeech(%{public}@), jitGrammar(%@), enableVoiceCommands(%{public}@)", buf, 0x52u);
      }
      v53 = +[NSUUID UUID];
      v54 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = [v53 UUIDString];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s Setting ASR UUID : %@", buf, 0x16u);
      }
      v154[0] = _NSConcreteStackBlock;
      v154[1] = 3221225472;
      v154[2] = sub_100080290;
      v154[3] = &unk_100250FF0;
      id v57 = v53;
      id v155 = v57;
      v58 = [v43 mutatedCopyWithMutator:v154];
      if (self->_voiceTriggerFireMachTime)
      {
        uint64_t v59 = mach_absolute_time();
        os_signpost_id_t v60 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
        v61 = CSLogContextFacilityCoreSpeech;
        v62 = v61;
        if (v60 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v64 = CSLogContextFacilityCoreSpeech;
        }
        else
        {
          if (os_signpost_enabled(v61))
          {
            unint64_t voiceTriggerFireMachTime = self->_voiceTriggerFireMachTime;
            *(_DWORD *)buf = 134349570;
            *(void *)&uint8_t buf[4] = voiceTriggerFireMachTime;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "SiriX";
            *(_WORD *)&buf[22] = 2080;
            v166 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "ondevice_VoiceTriggerEndToASRStartLatency", "%{public, signpost.description:begin_time}llu, %s %s", buf, 0x20u);
          }

          v64 = CSLogContextFacilityCoreSpeech;
          if (os_signpost_enabled(v64))
          {
            *(_DWORD *)buf = 134349570;
            *(void *)&uint8_t buf[4] = v59;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "SiriX";
            *(_WORD *)&buf[22] = 2080;
            v166 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_END, v60, "ondevice_VoiceTriggerEndToASRStartLatency", "%{public, signpost.description:end_time}llu, %s %s", buf, 0x20u);
          }
        }

        CSMachAbsoluteTimeGetTimeInterval();
        double v66 = v65;
        v67 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          float v68 = v66 * 1000.0;
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
          *(_WORD *)&buf[12] = 2050;
          *(double *)&buf[14] = v68;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%s Voice trigger end to ASR Start Latency: %{public}.2f ms", buf, 0x16u);
        }
      }
      *(_WORD *)&self->_onDeviceDictationSampled = 0;
      self->_unint64_t voiceTriggerFireMachTime = 0;
      if (!+[CSUtils isOnDeviceASRAudioLoggingEnabled](CSUtils, "isOnDeviceASRAudioLoggingEnabled")|| ([v58 task], v69 = objc_claimAutoreleasedReturnValue(), unsigned int v70 = +[CESRUtilities isSamplingSupportedForTask:](CESRUtilities, "isSamplingSupportedForTask:", v69), v69, !v70))
      {
        v73 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%s Request is ineligible for sampling. Disabling audio logging.", buf, 0xCu);
        }
        audioLogging = self->_audioLogging;
        self->_audioLogging = 0;
        goto LABEL_72;
      }
      v71 = [v58 task];
      if ([v71 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation])
      {
        uint64_t v72 = 1;
      }
      else
      {
        v75 = [v58 task];
        uint64_t v72 = (uint64_t)[v75 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch];
      }
      v76 = [CSSpeechRecognitionSelfHelper alloc];
      v77 = [v58 task];
      v78 = [(CSSpeechRecognitionSelfHelper *)v76 initWithAsrId:v57 taskName:v77 isSamplingForDictation:v72];
      asrSelfHelper = self->_asrSelfHelper;
      self->_asrSelfHelper = v78;

      p_onDeviceAssistantSampled = &self->_onDeviceAssistantSampled;
      if (v72)
      {
        v81 = +[CESRDictationOnDeviceSampling sharedManager];
        unsigned __int8 v82 = [v81 isRequestSelectedForSamplingFromConfigForLanguage:self->_language];
        p_onDeviceDictationSampled = &self->_onDeviceDictationSampled;
      }
      else
      {
        if ((v132 & 1) == 0)
        {
          BOOL *p_onDeviceAssistantSampled = 0;
          goto LABEL_66;
        }
        v81 = +[CESRAssistantOnDeviceSampling sharedManager];
        unsigned __int8 v82 = [v81 isRequestSelectedForSamplingForTask:self->_localSpeechRecognizerTaskString];
        p_onDeviceDictationSampled = &self->_onDeviceAssistantSampled;
      }
      BOOL *p_onDeviceDictationSampled = v82;

      if (*p_onDeviceAssistantSampled)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v166) = 0;
        if ([(CSAudioRecordContext *)self->_recordContext isVoiceTriggered])
        {
          dispatch_semaphore_t v84 = dispatch_semaphore_create(0);
          v85 = +[SSRRPISampler sharedInstance];
          v86 = self->_language;
          v151[0] = _NSConcreteStackBlock;
          v151[1] = 3221225472;
          v151[2] = sub_10008029C;
          v151[3] = &unk_10024FE50;
          v153 = buf;
          v87 = v84;
          v152 = v87;
          [v85 getEnrollmentSelectionStatusWithLocale:v86 completion:v151];

          dispatch_time_t v88 = dispatch_time(0, 500000000);
          dispatch_semaphore_wait(v87, v88);
        }
        id v89 = objc_alloc((Class)CSUncompressedAudioLogging);
        v90 = self->_requestId;
        v91 = [v57 UUIDString];
        v92 = self->_language;
        v93 = [v58 task];
        v94 = (CSUncompressedAudioLogging *)[v89 initWithRequestId:v90 asrId:v91 languageCode:v92 task:v93 rpiEnabled:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
        v95 = self->_audioLogging;
        self->_audioLogging = v94;

        v96 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          v97 = [v58 task];
          *(_DWORD *)v161 = 136315394;
          v162 = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
          __int16 v163 = 2112;
          v164 = v97;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%s asr task checking: %@", v161, 0x16u);
        }
        _Block_object_dispose(buf, 8);
LABEL_71:
        v107 = self->_asrSelfHelper;
        v108 = self->_audioLogging;
        v148[0] = _NSConcreteStackBlock;
        v148[1] = 3221225472;
        v148[2] = sub_1000802F0;
        v148[3] = &unk_100253B30;
        v149 = v107;
        v150 = self;
        audioLogging = v107;
        [(CSUncompressedAudioLogging *)v108 prepareLogging:v148];

LABEL_72:
        v109 = [(CSAttSiriSpeechRecognitionNode *)self _interactiveLocalSpeechRecognizer];
        v147[0] = _NSConcreteStackBlock;
        v147[1] = 3221225472;
        v147[2] = sub_100080310;
        v147[3] = &unk_100251018;
        v147[4] = self;
        [v109 startSpeechRecognitionWithParameters:v58 didStartHandlerWithInfo:v147];

        v110 = [(CSAudioProcessWaitingBuffer *)self->_audioWaitingBuffer fetchAudioChunksFromBuffer];
        v111 = v110;
        if (v110)
        {
          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          id v112 = [v110 countByEnumeratingWithState:&v143 objects:v160 count:16];
          if (v112)
          {
            uint64_t v113 = *(void *)v144;
            do
            {
              for (j = 0; j != v112; j = (char *)j + 1)
              {
                if (*(void *)v144 != v113) {
                  objc_enumerationMutation(v111);
                }
                v115 = *(void **)(*((void *)&v143 + 1) + 8 * (void)j);
                v116 = [v115 audioChunk];
                v117 = [v115 bufferedTimestamp];
                [(CSAttSiriSpeechRecognitionNode *)self _processAudioChunk:v116 withReadyTimestamp:v117];
              }
              id v112 = [v111 countByEnumeratingWithState:&v143 objects:v160 count:16];
            }
            while (v112);
          }
          [(CSAttSiriSpeechRecognitionNode *)self _clearAudioProcessWaitingBufferIfNeeded];
        }

        return;
      }
LABEL_66:
      if (self->_onDeviceDictationSampled)
      {
        id v99 = objc_alloc((Class)CSUncompressedAudioLogging);
        v100 = [v57 UUIDString];
        v101 = self->_language;
        v102 = [v58 task];
        v103 = (CSUncompressedAudioLogging *)[v99 initWithDictationInteractionId:v142 asrId:v100 languageCode:v101 task:v102];
        v104 = self->_audioLogging;
        self->_audioLogging = v103;
      }
      else
      {
        v105 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
          _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%s Request was not selected for sampling. Disabling audio logging.", buf, 0xCu);
        }
        v106 = self->_audioLogging;
        self->_audioLogging = 0;
      }
      goto LABEL_71;
    }
    long long v28 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v98 = self->_localSpeechRecognizerTaskString;
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      v166 = (const char *)v98;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Local speech recognizer can't started : locale(%{public}@), taskName(%{public}@)", buf, 0x20u);
    }
    [(CSAttSiriSpeechRecognitionNode *)self _setLocalSpeechRecognizerState:3];
    [(CSAttSiriSpeechRecognitionNode *)self _clearAudioProcessWaitingBufferIfNeeded];
  }
}

- (void)_setUpAudioLogging
{
  fileLoggingDecisionBuilder = (uint64_t (**)(id, SEL))self->_fileLoggingDecisionBuilder;
  if (fileLoggingDecisionBuilder) {
    int v4 = fileLoggingDecisionBuilder[2](fileLoggingDecisionBuilder, a2);
  }
  else {
    int v4 = 0;
  }
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    uint64_t v18 = "-[CSAttSiriSpeechRecognitionNode _setUpAudioLogging]";
    __int16 v19 = 1024;
    LODWORD(v20) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s fileLogging enabled:%u", (uint8_t *)&v17, 0x12u);
  }
  if (v4)
  {
    id v6 = +[CSFPreferences sharedPreferences];
    unsigned int v7 = [v6 isSpeechStudyLoggingEnabled];

    double v8 = +[CSFPreferences sharedPreferences];
    double v9 = [v8 mhLogDirectory];
    if (v7) {
      +[CSUtils loggingFilePathWithDirectory:v9 requestId:self->_requestId token:@"asr" postfix:@"wav"];
    }
    else {
    int v10 = +[CSUtils loggingFilePathWithDirectory:v9 token:@"localASR" postfix:@"wav"];
    }

    id v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      int v17 = 136315650;
      uint64_t v18 = "-[CSAttSiriSpeechRecognitionNode _setUpAudioLogging]";
      __int16 v19 = 2112;
      long long v20 = v10;
      __int16 v21 = 2112;
      id v22 = mhId;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s asrAudioLoggingPath:%@, mhID:%@", (uint8_t *)&v17, 0x20u);
    }
    id v13 = objc_alloc((Class)CSPlainAudioFileWriter);
    id v14 = +[NSURL URLWithString:v10];
    uint64_t v15 = (CSPlainAudioFileWriter *)[v13 initWithURL:v14];
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v15;
  }
  else
  {
    int v10 = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }
}

- (void)setMhId:(id)a3
{
  int v4 = (NSString *)a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[CSAttSiriSpeechRecognitionNode setMhId:]";
    __int16 v9 = 2112;
    int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s mhID : %@", (uint8_t *)&v7, 0x16u);
  }
  mhId = self->_mhId;
  self->_mhId = v4;
}

- (BOOL)_shouldDisableLocalSpeechRecognizerWithOption:(id)a3 audioRecordContext:(id)a4
{
  id v5 = a4;
  if (([a3 disableLocalSpeechRecognizer] & 1) == 0)
  {
    if (![v5 isDictation]
      || (+[CSUtils supportsDictationOnDevice] & 1) != 0)
    {
      BOOL v6 = 0;
      goto LABEL_6;
    }
    double v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[CSAttSiriSpeechRecognitionNode _shouldDisableLocalSpeechRecognizerWithOption:audioRecordContext:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Disable local SR for dictation", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v6 = 1;
LABEL_6:

  return v6;
}

- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3
{
  id v4 = a3;
  requestId = self->_requestId;
  if (requestId && ![(NSString *)requestId isEqualToString:v4])
  {
    BOOL v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = self->_requestId;
      int v8 = 136315650;
      int v9 = "-[CSAttSiriSpeechRecognitionNode _stopPreviousRecognitionTaskIfNeededWithNewRequestId:]";
      __int16 v10 = 2112;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s cached requestId : %@, newRequestId : %@", (uint8_t *)&v8, 0x20u);
    }
    [(CSAttSiriSpeechRecognitionNode *)self _handleStopDeliverLocalSpeechRecognitionWithRequestId:self->_requestId reason:3];
  }
}

- (void)prepareToStartSpeechRequestWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100080D18;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (v6)
  {
    id v8 = (NSString *)v6;
  }
  else
  {
    id v8 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  }
  language = self->_language;
  self->_language = v8;

  id v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = self->_language;
    int v15 = 136315394;
    id v16 = "-[CSAttSiriSpeechRecognitionNode _preheatWithLanguage:preheatSource:]";
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Preheat local speech recognizer with language : %@", (uint8_t *)&v15, 0x16u);
  }
  id v12 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:self->_language assetType:3];
  id v13 = [(CSAttSiriSpeechRecognitionNode *)self _sourceStringFromPreheatSource:a4];
  id v14 = [(CSAttSiriSpeechRecognitionNode *)self _interactiveLocalSpeechRecognizer];
  [v14 preheatSpeechRecognitionWithAssetConfig:v12 preheatSource:v13 modelOverrideURL:0];
}

- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (v5)
  {
    id v8 = [(CSAttSiriSpeechRecognitionNode *)self _interactiveLocalSpeechRecognizer];
    [v8 startMissingAssetDownload];
  }
  [(CSAttSiriSpeechRecognitionNode *)self _preheatWithLanguage:v9 preheatSource:a4];
}

- (void)preheatWithLanguage:(id)a3 source:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5
{
  id v8 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008122C;
  v11[3] = &unk_1002507D8;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(localSpeechRecognizerQueue, v11);
}

- (void)start
{
  unint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[CSAttSiriSpeechRecognitionNode start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081340;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  id v11 = a3;
  id v12 = a6;
  unint64_t v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v19 = "-[CSAttSiriSpeechRecognitionNode attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000816D8;
  block[3] = &unk_1002513B8;
  void block[4] = self;
  void block[5] = a5;
  *(double *)&block[6] = a4;
  dispatch_async(localSpeechRecognizerQueue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
  unsigned int v16 = [WeakRetained getUsesAutomaticEndpointing];

  if (v16) {
    self->_endpointMode = 4;
  }
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v8 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081910;
  block[3] = &unk_1002537C0;
  void block[4] = self;
  id v12 = v8;
  BOOL v13 = a6;
  id v10 = v8;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081A08;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100081B58;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(localSpeechRecognizerQueue, v8);
}

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100081D58;
  v6[3] = &unk_100253AB8;
  v6[4] = self;
  BOOL v7 = a4;
  dispatch_async(localSpeechRecognizerQueue, v6);
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081E80;
  block[3] = &unk_100253540;
  id v12 = v6;
  id v13 = v7;
  BOOL v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11
{
  id v35 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  long long v25 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[CSAttSiriSpeechRecognitionNode updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:di"
          "sambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]";
    __int16 v47 = 2112;
    id v48 = v35;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082194;
  block[3] = &unk_100250FA0;
  void block[4] = self;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  id v41 = v21;
  id v42 = v22;
  id v43 = v23;
  id v44 = v24;
  id v27 = v24;
  id v28 = v23;
  id v29 = v22;
  id v30 = v21;
  id v31 = v20;
  id v32 = v19;
  id v33 = v18;
  id v34 = v17;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v24 = "-[CSAttSiriSpeechRecognitionNode resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:]";
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100082388;
  v19[3] = &unk_100252E18;
  v19[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(localSpeechRecognizerQueue, v19);
}

- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[CSAttSiriSpeechRecognitionNode pauseLocalSpeechRecognitionForRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082500;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_disableLocalSpeechRecognitionForRequestId:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSString *)a3;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[CSAttSiriSpeechRecognitionNode _disableLocalSpeechRecognitionForRequestId:force:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s requestId : %@, force : %d", (uint8_t *)&v10, 0x1Cu);
  }
  if (!v6 || [(NSString *)v6 isEqualToString:self->_siriSessionUUID] || v4)
  {
    [(CSAttSiriSpeechRecognitionNode *)self _setLocalSpeechRecognizerState:3];
    [(CSAttSiriSpeechRecognitionNode *)self _clearAudioProcessWaitingBufferIfNeeded];
  }
  else
  {
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      siriSessionUUID = self->_siriSessionUUID;
      int v10 = 136315394;
      id v11 = "-[CSAttSiriSpeechRecognitionNode _disableLocalSpeechRecognitionForRequestId:force:]";
      __int16 v12 = 2112;
      id v13 = siriSessionUUID;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s requestId doesn't match current siriSessionUUID (%@), ignore", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)disableLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100082750;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)_stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!v6 || ([v6 isEqualToString:self->_requestId] & 1) == 0)
  {
    if (self->_requestId)
    {
      id v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315138;
        __int16 v14 = "-[CSAttSiriSpeechRecognitionNode _stopSpeechRecognitionWithReason:requestId:]";
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Received unexpected requestId", (uint8_t *)&v13, 0xCu);
      }
      id v9 = +[CSDiagnosticReporter sharedInstance];
      [v9 submitASRIssueReport:kCSDiagnosticReporterReceivedInvalidRequestId];
    }
    if (!v7) {
      goto LABEL_9;
    }
  }
  if (![v7 isEqualToString:self->_requestId])
  {
    id v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      requestId = self->_requestId;
      int v13 = 136315394;
      __int16 v14 = "-[CSAttSiriSpeechRecognitionNode _stopSpeechRecognitionWithReason:requestId:]";
      __int16 v15 = 2112;
      id v16 = requestId;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s requestId doesn't match current one (%@), ignore", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
LABEL_9:
    [(CSAttSiriSpeechRecognitionNode *)self _handleStopDeliverLocalSpeechRecognitionWithRequestId:self->_requestId reason:a3];
    asrResultDeliveryTransaction = self->_asrResultDeliveryTransaction;
    self->_asrResultDeliveryTransaction = 0;

    if (a3 == 1)
    {
      [(CSAttSiriSpeechRecognitionNode *)self _invalidateLocalSpeechRecognizer];
      [(CSUncompressedAudioLogging *)self->_audioLogging endAudioWithCancellation:1 completion:0];
    }
  }
}

- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4
{
  id v6 = a4;
  id v7 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[CSAttSiriSpeechRecognitionNode stopSpeechRecognitionWithReason:requestId:]";
    __int16 v15 = 2050;
    unint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "KeyLog - %s Reason : %{public}lu, requestId : %@", buf, 0x20u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082A70;
  block[3] = &unk_1002532A8;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_startDeliverLocalSpeechRecognitionResultsWithRequestId:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    int v16 = 136315394;
    __int16 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2048;
    unint64_t v19 = localSpeechRecognizerState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s _localSpeechRecognizerState:%lu", (uint8_t *)&v16, 0x16u);
    id v5 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    int v16 = 136315394;
    __int16 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2112;
    unint64_t v19 = (unint64_t)requestId;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Start deliver asr results with requestId: %@", (uint8_t *)&v16, 0x16u);
  }
  unint64_t v8 = self->_localSpeechRecognizerState;
  if (v8 != 3)
  {
    [(CSAttSiriSpeechRecognitionNode *)self _setLocalSpeechRecognizerState:2];
    if (v8 == 4)
    {
      id v9 = [(CSAudioProcessWaitingBuffer *)self->_audioWaitingBuffer uuid];
      unsigned int v10 = [v9 isEqualToString:self->_requestId];

      if (v10)
      {
        id v11 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          __int16 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Handle late start request from Request Dispatcher", (uint8_t *)&v16, 0xCu);
        }
        [(CSAttSiriSpeechRecognitionNode *)self _startLocalSpeechRecognizerIfNeeded];
        [(CSAttSiriSpeechRecognitionNode *)self _handleStopSpeechRecognitionTaskIfNeeded:1];
      }
      else
      {
        audioWaitingBuffer = self->_audioWaitingBuffer;
        if (audioWaitingBuffer)
        {
          int v13 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v14 = v13;
            __int16 v15 = [(CSAudioProcessWaitingBuffer *)audioWaitingBuffer uuid];
            int v16 = 136315650;
            __int16 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
            __int16 v18 = 2112;
            unint64_t v19 = (unint64_t)v4;
            __int16 v20 = 2114;
            id v21 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Clear audio waiting buffer since current requestId(%@) doesn't match expected one (%{public}@)", (uint8_t *)&v16, 0x20u);
          }
          [(CSAttSiriSpeechRecognitionNode *)self _clearAudioProcessWaitingBufferIfNeeded];
        }
      }
    }
    else if (v8 == 1)
    {
      [(CSAttSiriSpeechRecognitionNode *)self _startLocalSpeechRecognizerIfNeeded];
    }
  }
}

- (void)startSpeechRecognitionResultsWithSettings:(id)a3
{
  id v4 = a3;
  id v5 = [v4 speechRecognitionMode];
  [(CSAttSiriSpeechRecognitionNode *)self setSpeechRecognitionMode:v5];
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082DC8;
  block[3] = &unk_1002532A8;
  void block[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v7 = v4;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_handleStopDeliverLocalSpeechRecognitionWithRequestId:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  if (self->_speechRecognitionMode != 1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(CSAttSiriSpeechRecognitionNode *)self speechRecognitionReceivers];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
          if (objc_opt_respondsToSelector()) {
            [v12 didReceiveStopRecognitionRequest:v6 stopReason:a4];
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  [(CSAttSiriSpeechRecognitionNode *)self _setLocalSpeechRecognizerState:0];
  speechRecognitionSettings = self->_speechRecognitionSettings;
  self->_speechRecognitionSettings = 0;

  requestId = self->_requestId;
  self->_requestId = 0;
}

- (void)_setRecordingStartTimeWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  unsigned int v9 = [a4 isVoiceTriggered];
  if (v8
    && v9
    && (uint64_t v10 = kVTEItriggerEndMachTime,
        [v8 objectForKeyedSubscript:kVTEItriggerEndMachTime],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    unint64_t v12 = [v8 objectForKeyedSubscript:v10];
    self->_unint64_t recordingStartTime = (unint64_t)+[CSFTimeUtils absoluteHostTimeToContinuousHostTime:](CSFTimeUtils, "absoluteHostTimeToContinuousHostTime:", [v12 unsignedLongLongValue]);
  }
  else
  {
    if ([v14 startRecordingHostTime]) {
      id v13 = +[CSFTimeUtils absoluteHostTimeToContinuousHostTime:](CSFTimeUtils, "absoluteHostTimeToContinuousHostTime:", [v14 startRecordingHostTime]);
    }
    else {
      id v13 = (id)mach_continuous_time();
    }
    self->_unint64_t recordingStartTime = (unint64_t)v13;
  }
}

- (void)_adjustEndpointStartTimeWithVoiceTriggerEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = kVTEIclientStartSampleCount;
    uint64_t v7 = [v4 objectForKeyedSubscript:kVTEIclientStartSampleCount];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = kVTEItriggerEndSampleCount;
      uint64_t v10 = [v5 objectForKeyedSubscript:kVTEItriggerEndSampleCount];

      if (v10)
      {
        id v11 = [v5 objectForKeyedSubscript:v9];
        unint64_t v12 = [v11 unsignedIntegerValue];
        id v13 = [v5 objectForKeyedSubscript:v6];
        unint64_t v14 = v12 - (unsigned char *)[v13 unsignedIntegerValue];

        +[CSConfig inputRecordingSampleRate];
        double v16 = (float)((float)v14 / v15);
        self->_double endpointStartTimeInSec = v16;
        long long v17 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 136315394;
          id v35 = "-[CSAttSiriSpeechRecognitionNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
          __int16 v36 = 2050;
          double v37 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Updated endpoint start time in sec : %{public}.3f", (uint8_t *)&v34, 0x16u);
        }
      }
    }
    uint64_t v18 = kVTEIextraSamplesAtStart;
    unint64_t v19 = [v5 objectForKeyedSubscript:kVTEIextraSamplesAtStart];

    if (v19)
    {
      __int16 v20 = [v5 objectForKeyedSubscript:v18];
      self->_float audioSampleCountToSkip = (unint64_t)[v20 unsignedIntegerValue];

      double endpointStartTimeInSec = self->_endpointStartTimeInSec;
      float audioSampleCountToSkip = (float)self->_audioSampleCountToSkip;
      +[CSConfig inputRecordingSampleRate];
      double v24 = (float)(audioSampleCountToSkip / v23);
      double v25 = 0.0;
      if (endpointStartTimeInSec > v24)
      {
        double v26 = self->_endpointStartTimeInSec;
        float v27 = (float)self->_audioSampleCountToSkip;
        +[CSConfig inputRecordingSampleRate];
        double v25 = v26 - (float)(v27 / v28);
      }
      self->_double endpointStartTimeInSec = v25;
      id v29 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v30 = self->_audioSampleCountToSkip;
        int v34 = 136315650;
        id v35 = "-[CSAttSiriSpeechRecognitionNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
        __int16 v36 = 2050;
        double v37 = v25;
        __int16 v38 = 2050;
        unint64_t v39 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s Adjusted endpoint start time to : %{public}.3f, audioSampleCountToSkip : %{public}lu", (uint8_t *)&v34, 0x20u);
      }
    }
    uint64_t v31 = kVTEItriggerFireMachTime;
    id v32 = [v5 objectForKeyedSubscript:kVTEItriggerFireMachTime];

    if (v32)
    {
      id v33 = [v5 objectForKeyedSubscript:v31];
      self->_unint64_t voiceTriggerFireMachTime = (unint64_t)[v33 unsignedLongLongValue];
    }
  }
}

- (void)registerSSRNode:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000837FC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)registerEndpointerNode:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000838A0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)addRecognitionTaskCompletionReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CSAttSiriSpeechRecognitionNode *)self localSpeechRecognizerQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100083964;
    v6[3] = &unk_100253B08;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)addSpeechRecognitionReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CSAttSiriSpeechRecognitionNode *)self localSpeechRecognizerQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100083A28;
    v6[3] = &unk_100253B08;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)addEndpointFeatureReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CSAttSiriSpeechRecognitionNode *)self localSpeechRecognizerQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100083AEC;
    v6[3] = &unk_100253B08;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)addResultCandidateReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CSAttSiriSpeechRecognitionNode *)self localSpeechRecognizerQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100083BB0;
    v6[3] = &unk_100253B08;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)stopWithReason:(unint64_t)a3 stopStreamOption:(id)a4
{
  id v6 = a4;
  id v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [v6 description];
    *(_DWORD *)buf = 136315650;
    double v16 = "-[CSAttSiriSpeechRecognitionNode stopWithReason:stopStreamOption:]";
    __int16 v17 = 2050;
    unint64_t v18 = a3;
    __int16 v19 = 2114;
    __int16 v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Reason : %{public}lu, option : %{public}@", buf, 0x20u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083D34;
  block[3] = &unk_1002532A8;
  id v13 = v6;
  unint64_t v14 = a3;
  void block[4] = self;
  id v11 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)stop
{
}

- (CSAttSiriSpeechRecognitionNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriSpeechRecognitionNode *)self init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriSpeechRecognitionNode)initWithLocalSpeechRecognizer:(id)a3 fileLoggingDecisionBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CSAttSiriSpeechRecognitionNode;
  uint64_t v9 = [(CSAttSiriSpeechRecognitionNode *)&v28 init];
  uint64_t v10 = v9;
  if (v9)
  {
    requiredNodes = v9->_requiredNodes;
    v9->_type = 2;
    v9->_requiredNodes = (NSArray *)&off_10025E748;

    v10->_isReady = 0;
    uint64_t v12 = +[CSUtils getSerialQueueWithQOS:33 name:@"localSpeechRecognizerQueue Queue" fixedPriority:kCSDefaultSerialQueueFixedPriority];
    localSpeechRecognizerQueue = v10->_localSpeechRecognizerQueue;
    v10->_localSpeechRecognizerQueue = (OS_dispatch_queue *)v12;

    v10->_activeChannel = 0;
    requestId = v10->_requestId;
    v10->_requestId = 0;

    v10->_eagerResultId = 0;
    v10->_BOOL disableEndpointer = 0;
    v10->_double endpointStartTimeInSec = 0.0;
    v10->_float audioSampleCountToSkip = 0;
    [(CSAttSiriSpeechRecognitionNode *)v10 _setLocalSpeechRecognizerState:0];
    v10->_shouldProcessAudio = 0;
    objc_storeStrong((id *)&v10->_presetLocalSpeechRecognizer, a3);
    v10->_endpointMode = 0;
    id v15 = objc_retainBlock(v8);
    id fileLoggingDecisionBuilder = v10->_fileLoggingDecisionBuilder;
    v10->_id fileLoggingDecisionBuilder = v15;

    v10->_unint64_t voiceTriggerFireMachTime = 0;
    uint64_t v17 = +[NSHashTable weakObjectsHashTable];
    speechRecognitionReceivers = v10->_speechRecognitionReceivers;
    v10->_speechRecognitionReceivers = (NSHashTable *)v17;

    uint64_t v19 = +[NSHashTable weakObjectsHashTable];
    resultCandidateReceivers = v10->_resultCandidateReceivers;
    v10->_resultCandidateReceivers = (NSHashTable *)v19;

    uint64_t v21 = +[NSHashTable weakObjectsHashTable];
    endpointFeatureReceivers = v10->_endpointFeatureReceivers;
    v10->_endpointFeatureReceivers = (NSHashTable *)v21;

    uint64_t v23 = +[NSHashTable weakObjectsHashTable];
    recognitionTaskCompletionReceivers = v10->_recognitionTaskCompletionReceivers;
    v10->_recognitionTaskCompletionReceivers = (NSHashTable *)v23;

    uint64_t v25 = +[NSMutableArray array];
    detectedEndpointTimes = v10->_detectedEndpointTimes;
    v10->_detectedEndpointTimes = (NSMutableArray *)v25;
  }
  return v10;
}

- (CSAttSiriSpeechRecognitionNode)init
{
  return [(CSAttSiriSpeechRecognitionNode *)self initWithLocalSpeechRecognizer:0 fileLoggingDecisionBuilder:&stru_10024FE28];
}

+ (int64_t)endpointModeFromEndpointMetrics:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 endpointerType];
  if (v3 > 4) {
    return 0;
  }
  else {
    return qword_1001AC778[v3];
  }
}

@end