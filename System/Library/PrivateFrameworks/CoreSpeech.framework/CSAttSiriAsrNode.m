@interface CSAttSiriAsrNode
+ (int64_t)endpointModeFromEndpointMetrics:(id)a3;
- (BOOL)_shouldDisableLocalSpeechRecognizerWithOption:(id)a3 audioRecordContext:(id)a4;
- (BOOL)didDetectedEndpoint;
- (BOOL)disableEndpointer;
- (BOOL)isFileLoggingEnabled;
- (BOOL)isReady;
- (BOOL)onDeviceAssistantSampled;
- (BOOL)onDeviceDictationSampled;
- (BOOL)shouldProcessAudio;
- (BOOL)shouldStopProcessASROnEndpoint;
- (BOOL)speechHasAcceptedResultCandidate;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAsrNode)init;
- (CSAttSiriAsrNode)initWithAttSiriController:(id)a3;
- (CSAttSiriAsrNode)initWithLocalSpeechRecognizer:(id)a3 isFileLoggingEnabled:(BOOL)a4;
- (CSAttSiriController)attSiriController;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriUresNode)uresNode;
- (CSAudioProcessWaitingBuffer)audioWaitingBuffer;
- (CSAudioRecordContext)recordContext;
- (CSConnectionListener)localSRBridgeListener;
- (CSEndpointDelayReporter)endpointDelayReporter;
- (CSOSTransaction)asrResultDeliveryTransaction;
- (CSOSTransaction)recordingTransaction;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSpeechRecognitionSelfHelper)asrSelfHelper;
- (CSUncompressedAudioLogging)audioLogging;
- (CoreEmbeddedSpeechRecognizerProvider)interactiveLocalSpeechRecognizer;
- (CoreEmbeddedSpeechRecognizerProvider)presetLocalSpeechRecognizer;
- (LBLocalSpeechRecognitionSettings)speechRecognitionSettings;
- (NSArray)lastEndpointHintFeatures;
- (NSArray)requiredNodes;
- (NSString)language;
- (NSString)localSpeechRecognizerTaskString;
- (NSString)mhId;
- (NSString)requestId;
- (NSString)siriSessionUUID;
- (NSUUID)recordingToken;
- (OS_dispatch_queue)localSpeechRecognizerQueue;
- (OS_dispatch_queue)targetQueue;
- (double)detectedEndpointTime;
- (double)endpointStartTimeInSec;
- (double)firstWordDuration;
- (double)lastEndpointHintDuration;
- (double)leadingSilenceDuration;
- (double)localSpeechRecognizerDeliverAudioDuration;
- (id)_fetchInputOriginWithRecordContext:(id)a3;
- (id)_fetchRecognizerLanguageWithSiriLanguage:(id)a3 UILanguage:(id)a4 taskString:(id)a5 asrLocale:(id)a6;
- (id)_getAsrInputoriginFromContext:(id)a3;
- (id)_interactiveLocalSpeechRecognizer;
- (id)_sourceStringFromPreheatSource:(unint64_t)a3;
- (id)_stateToString:(unint64_t)a3;
- (int64_t)endpointMode;
- (int64_t)lastEndpointHintRCId;
- (unint64_t)audioSampleCountToSkip;
- (unint64_t)eagerResultId;
- (unint64_t)fetchCurrentState;
- (unint64_t)firstPartialResultTime;
- (unint64_t)lastEndpointEagerResultTime;
- (unint64_t)localSpeechRecognizerState;
- (unint64_t)recordingStartTime;
- (unint64_t)type;
- (unint64_t)voiceTriggerFireMachTime;
- (unsigned)activeChannel;
- (void)_adjustEndpointStartTimeWithVoiceTriggerEvent:(id)a3;
- (void)_clearAudioProcessWaitingBufferIfNeeded;
- (void)_clearEndpointHint;
- (void)_disableLocalSpeechRecognitionForRequestId:(id)a3 force:(BOOL)a4;
- (void)_enforceEndpointHintWithRequestId:(id)a3 rcId:(unint64_t)a4 shouldAccept:(BOOL)a5 featuresToLog:(id)a6;
- (void)_handleDidRecognizedFinalSpeechPackage:(id)a3 requestId:(id)a4 metadata:(id)a5;
- (void)_handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:(id)a3 requestId:(id)a4 rcId:(unint64_t)a5 metadata:(id)a6;
- (void)_handleShouldAcceptEagerResultWithRequestId:(id)a3 rcId:(unint64_t)a4 duration:(double)a5 shouldAccept:(BOOL)a6 featuresToLog:(id)a7;
- (void)_handleStopDeliverLocalSpeechRecognitionWithStopUresProcessing:(BOOL)a3;
- (void)_handleStopSpeechRecognitionTaskIfNeeded:(BOOL)a3;
- (void)_invalidateLocalSpeechRecognizer;
- (void)_markTimeToFirstWordMetric;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5;
- (void)_processAudioChunk:(id)a3 withReadyTimestamp:(id)a4;
- (void)_queryShouldAcceptEagerResultForDuration:(double)a3 requestId:(id)a4 rcId:(unint64_t)a5;
- (void)_releaseRecordingTransactionIfNeededWithToken:(id)a3;
- (void)_resetLocalSpeechRecognizerParameters;
- (void)_scheduleRecordingTransactionReleaseTimer;
- (void)_setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)_setRecordingStartTimeWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)_setupRecognizerStateForMagusAsrNode;
- (void)_startDeliverLocalSpeechRecognitionResultsWithRequestId:(id)a3;
- (void)_startLocalSpeechRecognizerIfNeeded;
- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3 stopUresProcessing:(BOOL)a4;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
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
- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4;
- (void)preheatWithLanguage:(id)a3 shouldDownloadMissingAsset:(BOOL)a4;
- (void)prepareToStartSpeechRequestWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)registerEndpointerNode:(id)a3;
- (void)registerSSRNode:(id)a3;
- (void)registerUresNode:(id)a3;
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
- (void)setDetectedEndpointTime:(double)a3;
- (void)setDidDetectedEndpoint:(BOOL)a3;
- (void)setDisableEndpointer:(BOOL)a3;
- (void)setEagerResultId:(unint64_t)a3;
- (void)setEndpointDelayReporter:(id)a3;
- (void)setEndpointMode:(int64_t)a3;
- (void)setEndpointStartTimeInSec:(double)a3;
- (void)setFirstPartialResultTime:(unint64_t)a3;
- (void)setFirstWordDuration:(double)a3;
- (void)setInteractiveLocalSpeechRecognizer:(id)a3;
- (void)setIsFileLoggingEnabled:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLastEndpointEagerResultTime:(unint64_t)a3;
- (void)setLastEndpointHintDuration:(double)a3;
- (void)setLastEndpointHintFeatures:(id)a3;
- (void)setLastEndpointHintRCId:(int64_t)a3;
- (void)setLeadingSilenceDuration:(double)a3;
- (void)setLocalSRBridgeListener:(id)a3;
- (void)setLocalSpeechRecognizerDeliverAudioDuration:(double)a3;
- (void)setLocalSpeechRecognizerQueue:(id)a3;
- (void)setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)setLocalSpeechRecognizerTaskString:(id)a3;
- (void)setMhId:(id)a3;
- (void)setOnDeviceAssistantSampled:(BOOL)a3;
- (void)setOnDeviceDictationSampled:(BOOL)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPresetLocalSpeechRecognizer:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingStartTime:(unint64_t)a3;
- (void)setRecordingToken:(id)a3;
- (void)setRecordingTransaction:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setShouldProcessAudio:(BOOL)a3;
- (void)setShouldStopProcessASROnEndpoint:(BOOL)a3;
- (void)setSiriSessionUUID:(id)a3;
- (void)setSpeechHasAcceptedResultCandidate:(BOOL)a3;
- (void)setSpeechRecognitionSettings:(id)a3;
- (void)setVoiceTriggerFireMachTime:(unint64_t)a3;
- (void)start;
- (void)startSpeechRecognitionResultsWithSettings:(id)a3;
- (void)stop;
- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)stopWithReason:(unint64_t)a3;
- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4;
- (void)updateTCUState:(id)a3;
- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11;
@end

@implementation CSAttSiriAsrNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSRBridgeListener, 0);
  objc_storeStrong((id *)&self->_asrSelfHelper, 0);
  objc_storeStrong((id *)&self->_audioLogging, 0);
  objc_storeStrong((id *)&self->_endpointDelayReporter, 0);
  objc_storeStrong((id *)&self->_lastEndpointHintFeatures, 0);
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
  objc_storeStrong((id *)&self->_localSpeechRecognizerQueue, 0);
  objc_destroyWeak((id *)&self->_ssrNode);
  objc_destroyWeak((id *)&self->_uresNode);
  objc_destroyWeak((id *)&self->_endpointerNode);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
}

- (void)setLocalSRBridgeListener:(id)a3
{
}

- (CSConnectionListener)localSRBridgeListener
{
  return self->_localSRBridgeListener;
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

- (void)setLeadingSilenceDuration:(double)a3
{
  self->_leadingSilenceDuration = a3;
}

- (double)leadingSilenceDuration
{
  return self->_leadingSilenceDuration;
}

- (void)setFirstWordDuration:(double)a3
{
  self->_firstWordDuration = a3;
}

- (double)firstWordDuration
{
  return self->_firstWordDuration;
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

- (void)setLastEndpointHintFeatures:(id)a3
{
}

- (NSArray)lastEndpointHintFeatures
{
  return self->_lastEndpointHintFeatures;
}

- (void)setLastEndpointEagerResultTime:(unint64_t)a3
{
  self->_lastEndpointEagerResultTime = a3;
}

- (unint64_t)lastEndpointEagerResultTime
{
  return self->_lastEndpointEagerResultTime;
}

- (void)setLastEndpointHintRCId:(int64_t)a3
{
  self->_lastEndpointHintRCId = a3;
}

- (int64_t)lastEndpointHintRCId
{
  return self->_lastEndpointHintRCId;
}

- (void)setLastEndpointHintDuration:(double)a3
{
  self->_lastEndpointHintDuration = a3;
}

- (double)lastEndpointHintDuration
{
  return self->_lastEndpointHintDuration;
}

- (void)setShouldStopProcessASROnEndpoint:(BOOL)a3
{
  self->_shouldStopProcessASROnEndpoint = a3;
}

- (void)setDetectedEndpointTime:(double)a3
{
  self->_detectedEndpointTime = a3;
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

- (void)setIsFileLoggingEnabled:(BOOL)a3
{
  self->_isFileLoggingEnabled = a3;
}

- (BOOL)isFileLoggingEnabled
{
  return self->_isFileLoggingEnabled;
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

- (void)setSpeechHasAcceptedResultCandidate:(BOOL)a3
{
  self->_speechHasAcceptedResultCandidate = a3;
}

- (BOOL)speechHasAcceptedResultCandidate
{
  return self->_speechHasAcceptedResultCandidate;
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

- (CSAttSiriUresNode)uresNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
  return (CSAttSiriUresNode *)WeakRetained;
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
  return (CSAttSiriEndpointerNode *)WeakRetained;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
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

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)_setupRecognizerStateForMagusAsrNode
{
  [(CSAttSiriAsrNode *)self _setLocalSpeechRecognizerState:2];
  [(CSAttSiriAsrNode *)self _startLocalSpeechRecognizerIfNeeded];
}

- (void)_markTimeToFirstWordMetric
{
  unint64_t recordingStartTime = self->_recordingStartTime;
  if (recordingStartTime
    && self->_firstPartialResultTime
    && self->_firstWordDuration > 0.0
    && self->_leadingSilenceDuration > 0.0)
  {
    os_signpost_id_t v4 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    v5 = CSLogContextFacilityCoreSpeech;
    v6 = v5;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v11 = CSLogContextFacilityCoreSpeech;
    }
    else
    {
      if (os_signpost_enabled(v5))
      {
        unint64_t v7 = self->_recordingStartTime;
        double leadingSilenceDuration = self->_leadingSilenceDuration;
        *(float *)&double leadingSilenceDuration = leadingSilenceDuration;
        v9 = (char *)+[CSFTimeUtils secondsToHostTime:leadingSilenceDuration]+ v7;
        double firstWordDuration = self->_firstWordDuration;
        *(float *)&double firstWordDuration = firstWordDuration;
        int v37 = 134349570;
        v38 = (char *)+[CSFTimeUtils secondsToHostTime:firstWordDuration]+ (void)v9;
        __int16 v39 = 2080;
        v40 = "SiriX";
        __int16 v41 = 2080;
        v42 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ondevice_TimeToFirstWord", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v37, 0x20u);
      }

      v11 = CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v11))
      {
        unint64_t firstPartialResultTime = self->_firstPartialResultTime;
        int v37 = 134349570;
        v38 = (const char *)firstPartialResultTime;
        __int16 v39 = 2080;
        v40 = "SiriX";
        __int16 v41 = 2080;
        v42 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v4, "ondevice_TimeToFirstWord", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v37, 0x20u);
      }
    }

    os_signpost_id_t v17 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    v18 = CSLogContextFacilityCoreSpeech;
    v19 = v18;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v21 = CSLogContextFacilityCoreSpeech;
    }
    else
    {
      if (os_signpost_enabled(v18))
      {
        unint64_t v20 = self->_recordingStartTime;
        int v37 = 134349314;
        v38 = (const char *)v20;
        __int16 v39 = 2080;
        v40 = "SiriX";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ondevice_LeadingSilence", "%{public, signpost.description:begin_time}llu, %s", (uint8_t *)&v37, 0x16u);
      }

      v21 = CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v21))
      {
        unint64_t v22 = self->_recordingStartTime;
        double v23 = self->_leadingSilenceDuration;
        *(float *)&double v23 = v23;
        v24 = (char *)+[CSFTimeUtils secondsToHostTime:v23];
        int v37 = 134349314;
        v38 = &v24[v22];
        __int16 v39 = 2080;
        v40 = "SiriX";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v17, "ondevice_LeadingSilence", "%{public, signpost.description:end_time}llu, %s", (uint8_t *)&v37, 0x16u);
      }
    }

    os_signpost_id_t v25 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    v26 = CSLogContextFacilityCoreSpeech;
    v27 = v26;
    if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v31 = CSLogContextFacilityCoreSpeech;
    }
    else
    {
      if (os_signpost_enabled(v26))
      {
        unint64_t v28 = self->_recordingStartTime;
        double v29 = self->_leadingSilenceDuration;
        *(float *)&double v29 = v29;
        v30 = (char *)+[CSFTimeUtils secondsToHostTime:v29];
        int v37 = 134349314;
        v38 = &v30[v28];
        __int16 v39 = 2080;
        v40 = "SiriX";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "ondevice_FirstWordDuration", "%{public, signpost.description:begin_time}llu, %s", (uint8_t *)&v37, 0x16u);
      }

      v31 = CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v31))
      {
        unint64_t v32 = self->_recordingStartTime;
        double v33 = self->_leadingSilenceDuration;
        *(float *)&double v33 = v33;
        v34 = (char *)+[CSFTimeUtils secondsToHostTime:v33] + v32;
        double v35 = self->_firstWordDuration;
        *(float *)&double v35 = v35;
        v36 = (char *)+[CSFTimeUtils secondsToHostTime:v35];
        int v37 = 134349314;
        v38 = &v36[(void)v34];
        __int16 v39 = 2080;
        v40 = "SiriX";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v25, "ondevice_FirstWordDuration", "%{public, signpost.description:end_time}llu, %s", (uint8_t *)&v37, 0x16u);
      }
    }
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = self->_firstPartialResultTime;
      double v15 = self->_firstWordDuration;
      double v16 = self->_leadingSilenceDuration;
      int v37 = 136316162;
      v38 = "-[CSAttSiriAsrNode _markTimeToFirstWordMetric]";
      __int16 v39 = 2048;
      v40 = (const char *)recordingStartTime;
      __int16 v41 = 2048;
      v42 = (const char *)v14;
      __int16 v43 = 2048;
      double v44 = v15;
      __int16 v45 = 2048;
      double v46 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Can't calculate TTFW due to missing metric: %llu %llu %f %f", (uint8_t *)&v37, 0x34u);
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
    double v15 = v12;
  }
  else {
    double v15 = v9;
  }
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = v9;
  }
  if (!v14) {
    double v15 = v16;
  }
  id v17 = v15;
  v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    v21 = "-[CSAttSiriAsrNode _fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:]";
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
    return off_100251100[a3];
  }
}

- (void)_setLocalSpeechRecognizerState:(unint64_t)a3
{
  id v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    unint64_t v7 = v5;
    v8 = [(CSAttSiriAsrNode *)self _stateToString:localSpeechRecognizerState];
    id v9 = [(CSAttSiriAsrNode *)self _stateToString:a3];
    int v10 = 136315650;
    id v11 = "-[CSAttSiriAsrNode _setLocalSpeechRecognizerState:]";
    __int16 v12 = 2114;
    unsigned int v13 = v8;
    __int16 v14 = 2114;
    double v15 = v9;
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
        int v10 = "-[CSAttSiriAsrNode _fetchInputOriginWithRecordContext:]";
        __int16 v11 = 2114;
        uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Received inputOrigin: %{public}@ from Request Dispatcher, use hard-coded map", (uint8_t *)&v9, 0x16u);
      }
      id v5 = [(CSAttSiriAsrNode *)self _getAsrInputoriginFromContext:v4];
    }
    v6 = v5;
  }

  return v6;
}

- (double)detectedEndpointTime
{
  uint64_t v6 = 0;
  unint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D49E4;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
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
  v5[2] = sub_1000D4AA4;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldStopProcessASROnEndpoint
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D4B64;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
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
  v5[2] = sub_1000D4C24;
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
  v5[2] = sub_1000D4CE8;
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
  id v5 = a4;
  uint64_t v6 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = v6;
    uint64_t v8 = [v5 modelRoot];
    int v11 = 136315394;
    uint64_t v12 = "-[CSAttSiriAsrNode localSpeechRecognizer:didSelectRecognitionModelWithModelProperties:]";
    __int16 v13 = 2114;
    __int16 v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received ASR datapack root directory: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
  int v10 = [v5 modelRoot];
  [WeakRetained setASRModelRootDirectory:v10];
}

- (void)localSpeechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  id v17 = a7;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D4EF8;
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
  v15[2] = sub_1000D5190;
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
  id v11 = a4;
  id v12 = a6;
  if (self->_speechHasAcceptedResultCandidate)
  {
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSAttSiriAsrNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:requestId:rcId:metadata:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Already accepted result candidate for request", buf, 0xCu);
    }
  }
  else
  {
    +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:v10];
    double v15 = v14 * 1000.0;
    id v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSAttSiriAsrNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:requestId:rcId:metadata:]";
      __int16 v31 = 2048;
      double v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s SpeechPackage processed audio duration: %f ms", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
    [WeakRetained processResultCandidate:v10 forRCId:a5 forTask:self->_localSpeechRecognizerTaskString forRequestId:v11 completion:0];

    if (self->_localSpeechRecognizerState == 2)
    {
      id v18 = [(CSAttSiriAsrNode *)self localSRBridgeListener];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000D5AE4;
      v23[3] = &unk_100251090;
      v23[4] = self;
      id v24 = v11;
      unint64_t v27 = a5;
      id v25 = v10;
      double v28 = v15;
      id v26 = v12;
      [v18 notifyClientsWithBlock:v23];
    }
    id v19 = objc_loadWeakRetained((id *)&self->_endpointerNode);
    int v20 = +[LBLocalSpeechRecognitionSettings getTaskStringFromSpeechRecognitionSettings:self->_speechRecognitionSettings];
    [v19 processSpeechPackage:v10 taskName:v20];

    self->_lastEndpointHintDuration = v15;
    self->_lastEndpointHintRCId = a5;
    self->_lastEndpointEagerResultTime = mach_continuous_time();
    endpointDelayReporter = self->_endpointDelayReporter;
    +[CSAttSiriSpeechPackageHelper getLastTokenSilenceStartFromSpeechPackage:v10];
    [(CSEndpointDelayReporter *)endpointDelayReporter setUserSpeakingEndedTimeInMs:v22 * 1000.0];
    [(CSAttSiriAsrNode *)self _queryShouldAcceptEagerResultForDuration:v11 requestId:a5 rcId:v15];
  }
}

- (void)_handleDidRecognizedFinalSpeechPackage:(id)a3 requestId:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t lastEndpointHintRCId = self->_lastEndpointHintRCId;
  id v12 = CSLogContextFacilityCoreSpeech;
  if (lastEndpointHintRCId < 0)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSAttSiriAsrNode _handleDidRecognizedFinalSpeechPackage:requestId:metadata:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s There is no valid RC to deliver, or previous RC already got accepted", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[CSAttSiriAsrNode _handleDidRecognizedFinalSpeechPackage:requestId:metadata:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Enforce previous endpointHint", buf, 0xCu);
      int64_t lastEndpointHintRCId = self->_lastEndpointHintRCId;
    }
    [(CSAttSiriAsrNode *)self _enforceEndpointHintWithRequestId:self->_requestId rcId:lastEndpointHintRCId shouldAccept:1 featuresToLog:self->_lastEndpointHintFeatures];
  }
  [(CSAttSiriAsrNode *)self _markTimeToFirstWordMetric];
  if (self->_localSpeechRecognizerState == 2)
  {
    id v13 = [(CSAttSiriAsrNode *)self localSRBridgeListener];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000D5D64;
    v14[3] = &unk_1002539B8;
    v14[4] = self;
    id v15 = v9;
    id v16 = v8;
    id v17 = v10;
    [v13 notifyClientsWithBlock:v14];
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
  v15[2] = sub_1000D5EBC;
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
  block[2] = sub_1000D615C;
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
  v15[2] = sub_1000D640C;
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

- (void)localSpeechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6664;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_handleShouldAcceptEagerResultWithRequestId:(id)a3 rcId:(unint64_t)a4 duration:(double)a5 shouldAccept:(BOOL)a6 featuresToLog:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D68D0;
  v17[3] = &unk_100251068;
  BOOL v22 = a6;
  double v20 = a5;
  v17[4] = self;
  id v18 = v13;
  id v19 = v12;
  unint64_t v21 = a4;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(localSpeechRecognizerQueue, v17);
}

- (void)_queryShouldAcceptEagerResultForDuration:(double)a3 requestId:(id)a4 rcId:(unint64_t)a5
{
  id v8 = a4;
  if (self->_speechHasAcceptedResultCandidate)
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)location = 136315138;
      *(void *)&location[4] = "-[CSAttSiriAsrNode _queryShouldAcceptEagerResultForDuration:requestId:rcId:]";
      id v10 = "%s Skip query as already accepted result candidate for request";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, location, v13);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
    unsigned int v15 = [WeakRetained getUsesAutomaticEndpointing];

    BOOL didDetectedEndpoint = self->_didDetectedEndpoint;
    if (self->_didDetectedEndpoint && v15)
    {
      objc_initWeak((id *)location, self);
      id v17 = objc_loadWeakRetained((id *)&self->_endpointerNode);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000D6CBC;
      v21[3] = &unk_100251040;
      objc_copyWeak(v23, (id *)location);
      id v22 = v8;
      v23[1] = (id)a5;
      v23[2] = *(id *)&a3;
      [v17 shouldAcceptEagerResultForDuration:v21 resultsCompletionHandler:(double)(uint64_t)a3];

      objc_destroyWeak(v23);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v18 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v19 = @"YES";
        *(void *)&location[4] = "-[CSAttSiriAsrNode _queryShouldAcceptEagerResultForDuration:requestId:rcId:]";
        if (didDetectedEndpoint) {
          CFStringRef v20 = @"YES";
        }
        else {
          CFStringRef v20 = @"NO";
        }
        *(_DWORD *)location = 136315650;
        __int16 v25 = 2114;
        CFStringRef v26 = v20;
        if (!v15) {
          CFStringRef v19 = @"NO";
        }
        __int16 v27 = 2114;
        CFStringRef v28 = v19;
        id v10 = "%s didDetectedEndpoint = %{public}@, usesAutomaticEndpointing = %{public}@, waiting";
        id v11 = v18;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 32;
        goto LABEL_14;
      }
    }
  }
}

- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v6 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6DE4;
  block[3] = &unk_1002532A8;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D7040;
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

- (void)localSpeechRecognizer:(id)a3 didRecognizePartialPackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D7334;
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
  block[2] = sub_1000D7608;
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
  self->_speechHasAcceptedResultCandidate = 0;
  self->_double firstWordDuration = 0.0;
  self->_double leadingSilenceDuration = 0.0;
  self->_unint64_t firstPartialResultTime = 0;
}

- (void)_invalidateLocalSpeechRecognizer
{
  interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
  if (interactiveLocalSpeechRecognizer)
  {
    [(CoreEmbeddedSpeechRecognizerProvider *)interactiveLocalSpeechRecognizer invalidate];
    id v4 = self->_interactiveLocalSpeechRecognizer;
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

        id v7 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        id v8 = self->_interactiveLocalSpeechRecognizer;
        int v14 = 136315650;
        unsigned int v15 = "-[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer]";
        __int16 v16 = 2112;
        id v17 = self;
        __int16 v18 = 2112;
        CFStringRef v19 = v8;
        id v9 = "%s %@ created speech recognizer (v2) %@";
      }
      else
      {
        id v10 = (CoreEmbeddedSpeechRecognizerProvider *)[objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:self instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
        double v11 = self->_interactiveLocalSpeechRecognizer;
        self->_interactiveLocalSpeechRecognizer = v10;

        id v7 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        id v12 = self->_interactiveLocalSpeechRecognizer;
        int v14 = 136315650;
        unsigned int v15 = "-[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer]";
        __int16 v16 = 2112;
        id v17 = self;
        __int16 v18 = 2112;
        CFStringRef v19 = v12;
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
    double v11 = "-[CSAttSiriAsrNode _releaseRecordingTransactionIfNeededWithToken:]";
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2114;
    unsigned int v15 = recordingToken;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Token : %{public}@, currentToken : %{public}@", (uint8_t *)&v10, 0x20u);
  }
  if ([v4 isEqual:self->_recordingToken])
  {
    [(CSAttSiriAsrNode *)self _clearAudioProcessWaitingBufferIfNeeded];
    id v7 = self->_recordingToken;
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
      double v11 = "-[CSAttSiriAsrNode _releaseRecordingTransactionIfNeededWithToken:]";
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
    __int16 v14 = "-[CSAttSiriAsrNode _scheduleRecordingTransactionReleaseTimer]";
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
  block[2] = sub_1000D7CF0;
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
  [(CSAttSiriAsrNode *)self _scheduleRecordingTransactionReleaseTimer];
  localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
  if (localSpeechRecognizerTaskString)
  {
    dispatch_time_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v17 = 136315394;
      *(void *)&v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
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
        [(CSAttSiriAsrNode *)self _clearAudioProcessWaitingBufferIfNeeded];
        return;
      }
      int v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v17 = 136315138;
        *(void *)&v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
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
        *(void *)&v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
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
    -[CSAttSiriAsrNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 0, *(_OWORD *)v17, *(void *)&v17[16], v18);
    goto LABEL_22;
  }
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int16 v17 = 136315138;
    *(void *)&v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Request dispatcher didn't ask to start until end", v17, 0xCu);
  }
  [(CSAttSiriAsrNode *)self _setLocalSpeechRecognizerState:4];
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
    __int16 v14 = [(CSAttSiriAsrNode *)self _interactiveLocalSpeechRecognizer];
    [v6 hostTime];
    __int16 v15 = +[NSNumber numberWithUnsignedLongLong:CSMachAbsoluteTimeToMachContinuousTime()];
    [v14 addAudioPacket:v12 packetRecordedTime:v15 packetReadyUpstreamTime:v7];

    [(CSUncompressedAudioLogging *)self->_audioLogging appendAudioData:v12];
    __int16 v16 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = v16;
      int v18 = 136315394;
      CFStringRef v19 = "-[CSAttSiriAsrNode _processAudioChunk:withReadyTimestamp:]";
      __int16 v20 = 2050;
      id v21 = [v6 numSamples];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Added %{public}lu samples to local speech recognizer", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)_startLocalSpeechRecognizerIfNeeded
{
  unint64_t v3 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    id v5 = v3;
    double v6 = [(CSAttSiriAsrNode *)self _stateToString:localSpeechRecognizerState];
    *(_DWORD *)buf = 136315394;
    v148 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
    __int16 v149 = 2114;
    double v150 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s current state = %{public}@", buf, 0x16u);
  }
  if (self->_localSpeechRecognizerState == 2)
  {
    id v7 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    language = self->_language;
    self->_language = v7;

    *(_WORD *)&self->_BOOL didDetectedEndpoint = 0;
    self->_localSpeechRecognizerDeliverAudioDuration = 0.0;
    self->_lastEndpointEagerResultTime = 0;
    float v9 = [[CSEndpointDelayReporter alloc] initWithRequestMHUUID:0 turnIdentifier:0];
    endpointDelayReporter = self->_endpointDelayReporter;
    self->_endpointDelayReporter = v9;

    [(CSAttSiriAsrNode *)self _clearEndpointHint];
    if (!self->_disableEndpointer)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
      id v12 = +[LBLocalSpeechRecognitionSettings getTaskStringFromSpeechRecognitionSettings:self->_speechRecognitionSettings];
      [WeakRetained processTaskString:v12];
    }
    id v13 = objc_loadWeakRetained((id *)&self->_ssrNode);
    __int16 v14 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings sharedUserInfos];
    [v13 cacheSharedUserInfos:v14];

    __int16 v15 = self->_language;
    if (*(double *)&v15 != 0.0 && self->_localSpeechRecognizerTaskString)
    {
      if (self->_isFileLoggingEnabled)
      {
        __int16 v16 = +[CSFPreferences sharedPreferences];
        __int16 v17 = [v16 mhLogDirectory];
        int v18 = +[CSUtils loggingFilePathWithDirectory:v17 token:@"localASR" postfix:@"wav"];

        id v19 = objc_alloc((Class)CSPlainAudioFileWriter);
        __int16 v20 = +[NSURL URLWithString:v18];
        id v21 = (CSPlainAudioFileWriter *)[v19 initWithURL:v20];
        audioFileWriter = self->_audioFileWriter;
        self->_audioFileWriter = v21;
      }
      else
      {
        int v18 = self->_audioFileWriter;
        self->_audioFileWriter = 0;
      }

      unsigned __int8 v126 = [(CSAudioRecordContext *)self->_recordContext isVoiceTriggered];
      v135 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings dictationUIInteractionId];
      unsigned __int8 v130 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings shouldStoreAudioOnDevice];
      uint64_t v24 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings overrideModelPath];
      int v128 = CSShouldCensorSpeech();
      v133 = [(CSAttSiriAsrNode *)self _fetchInputOriginWithRecordContext:self->_recordContext];
      unsigned __int8 v125 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings deliverEagerPackage];
      __int16 v25 = self->_language;
      CFStringRef v26 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings UILanguage];
      localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
      CFStringRef v28 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings asrLocale];
      v132 = [(CSAttSiriAsrNode *)self _fetchRecognizerLanguageWithSiriLanguage:v25 UILanguage:v26 taskString:localSpeechRecognizerTaskString asrLocale:v28];

      if (v24)
      {
        v131 = +[NSURL fileURLWithPath:v24 isDirectory:1];
      }
      else
      {
        v131 = 0;
      }
      double v29 = 0.0;
      double endpointStartTimeInSec = 0.0;
      if ([(CSAudioRecordContext *)self->_recordContext isVoiceTriggered])
      {
        double endpointStartTimeInSec = self->_endpointStartTimeInSec;
        float audioSampleCountToSkip = (float)self->_audioSampleCountToSkip;
        +[CSConfig inputRecordingSampleRate];
        double v29 = (float)(audioSampleCountToSkip / v32);
      }
      [(CSAttSiriAsrNode *)self _resetLocalSpeechRecognizerParameters];
      v129 = (void *)v24;
      if (v135)
      {
        CFStringRef v134 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings applicationName];
      }
      else
      {
        CFStringRef v134 = @"com.apple.siri.assistant";
      }
      id v33 = objc_alloc((Class)CESRSpeechParameters);
      requestId = self->_requestId;
      id v122 = v33;
      v123 = self->_localSpeechRecognizerTaskString;
      v121 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings recognitionOverrides];
      unsigned __int8 v120 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings detectUtterances];
      unsigned __int8 v119 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings secureOfflineOnly];
      unsigned __int8 v118 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings continuousListening];
      unsigned __int8 v117 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings shouldHandleCapitalization];
      [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings maximumRecognitionDuration];
      double v35 = v34;
      v36 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings location];
      v116 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings jitGrammar];
      HIDWORD(v115) = self->_disableEndpointer;
      unsigned __int8 v37 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableEmojiRecognition];
      unsigned __int8 v38 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableAutoPunctuation];
      unsigned __int8 v39 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableVoiceCommands];
      v40 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings sharedUserInfos];
      __int16 v41 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings prefixText];
      v42 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings postfixText];
      __int16 v43 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings selectedText];
      double v44 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings powerContext];
      LOBYTE(v115) = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings shouldGenerateVoiceCommandCandidates];
      BYTE4(v114) = v39;
      BYTE3(v114) = v38;
      BYTE2(v114) = v37;
      BYTE1(v114) = BYTE4(v115);
      LOBYTE(v114) = v125;
      LOBYTE(v113) = 0;
      HIBYTE(v112) = v117;
      BYTE6(v112) = v118;
      BYTE5(v112) = v130;
      BYTE4(v112) = v119;
      BYTE3(v112) = v126;
      BYTE2(v112) = v128;
      BYTE1(v112) = v120;
      LOBYTE(v112) = 0;
      id v127 = objc_msgSend(v122, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:", v132, requestId, v135, v123, 0, v134, v35, endpointStartTimeInSec, v29, 0, v121, v131,
               0,
               0,
               v112,
               v113,
               v133,
               v36,
               v116,
               v114,
               v40,
               v41,
               v42,
               v43,
               v44,
               v115);

      __int16 v45 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        double v46 = self->_localSpeechRecognizerTaskString;
        speechRecognitionSettings = self->_speechRecognitionSettings;
        v48 = v45;
        v49 = [(LBLocalSpeechRecognitionSettings *)speechRecognitionSettings location];
        if (v128) {
          CFStringRef v50 = @"YES";
        }
        else {
          CFStringRef v50 = @"NO";
        }
        v51 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings jitGrammar];
        unsigned int v52 = [(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings enableVoiceCommands];
        *(_DWORD *)buf = 136316930;
        v148 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
        if (v52) {
          CFStringRef v53 = @"YES";
        }
        else {
          CFStringRef v53 = @"NO";
        }
        __int16 v149 = 2114;
        double v150 = *(double *)&v46;
        __int16 v151 = 2050;
        v152 = *(const char **)&endpointStartTimeInSec;
        __int16 v153 = 2114;
        v154 = v133;
        __int16 v155 = 2112;
        v156 = v49;
        __int16 v157 = 2114;
        CFStringRef v158 = v50;
        __int16 v159 = 2112;
        v160 = v51;
        __int16 v161 = 2114;
        CFStringRef v162 = v53;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s Calling local speech recognition with settings : task(%{public}@), endpointStart(%{public}.3f), inputOrigin(%{public}@), location(%@), shouldCensorSpeech(%{public}@), jitGrammar(%@), enableVoiceCommands(%{public}@)", buf, 0x52u);
      }
      v54 = +[NSUUID UUID];
      v55 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v55;
        double v57 = [v54 UUIDString];
        *(_DWORD *)buf = 136315394;
        v148 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
        __int16 v149 = 2112;
        double v150 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s Setting ASR UUID : %@", buf, 0x16u);
      }
      v144[0] = _NSConcreteStackBlock;
      v144[1] = 3221225472;
      v144[2] = sub_1000D9084;
      v144[3] = &unk_100250FF0;
      id v58 = v54;
      id v145 = v58;
      v59 = [v127 mutatedCopyWithMutator:v144];
      if (self->_voiceTriggerFireMachTime)
      {
        uint64_t v60 = mach_absolute_time();
        os_signpost_id_t v61 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
        v62 = CSLogContextFacilityCoreSpeech;
        v63 = v62;
        if (v61 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v65 = CSLogContextFacilityCoreSpeech;
        }
        else
        {
          if (os_signpost_enabled(v62))
          {
            unint64_t voiceTriggerFireMachTime = self->_voiceTriggerFireMachTime;
            *(_DWORD *)buf = 134349570;
            v148 = (const char *)voiceTriggerFireMachTime;
            __int16 v149 = 2080;
            double v150 = COERCE_DOUBLE("SiriX");
            __int16 v151 = 2080;
            v152 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_BEGIN, v61, "ondevice_VoiceTriggerEndToASRStartLatency", "%{public, signpost.description:begin_time}llu, %s %s", buf, 0x20u);
          }

          v65 = CSLogContextFacilityCoreSpeech;
          if (os_signpost_enabled(v65))
          {
            *(_DWORD *)buf = 134349570;
            v148 = (const char *)v60;
            __int16 v149 = 2080;
            double v150 = COERCE_DOUBLE("SiriX");
            __int16 v151 = 2080;
            v152 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, v61, "ondevice_VoiceTriggerEndToASRStartLatency", "%{public, signpost.description:end_time}llu, %s %s", buf, 0x20u);
          }
        }

        CSMachAbsoluteTimeGetTimeInterval();
        double v67 = v66;
        v68 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          float v69 = v67 * 1000.0;
          *(_DWORD *)buf = 136315394;
          v148 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
          __int16 v149 = 2050;
          double v150 = v69;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%s Voice trigger end to ASR Start Latency: %{public}.2f ms", buf, 0x16u);
        }
      }
      *(_WORD *)&self->_onDeviceDictationSampled = 0;
      self->_unint64_t voiceTriggerFireMachTime = 0;
      if (!+[CSUtils isOnDeviceASRAudioLoggingEnabled](CSUtils, "isOnDeviceASRAudioLoggingEnabled")|| ([v59 task], v70 = objc_claimAutoreleasedReturnValue(), unsigned int v71 = +[CESRUtilities isSamplingSupportedForTask:](CESRUtilities, "isSamplingSupportedForTask:", v70), v70, !v71))
      {
        v74 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v148 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%s Request is ineligible for sampling. Disabling audio logging.", buf, 0xCu);
        }
        audioLogging = self->_audioLogging;
        self->_audioLogging = 0;
        goto LABEL_62;
      }
      v72 = [v59 task];
      if ([v72 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation])
      {
        uint64_t v73 = 1;
      }
      else
      {
        v76 = [v59 task];
        uint64_t v73 = (uint64_t)[v76 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch];
      }
      p_onDeviceAssistantSampled = &self->_onDeviceAssistantSampled;

      v78 = [CSSpeechRecognitionSelfHelper alloc];
      v79 = [v59 task];
      v80 = [(CSSpeechRecognitionSelfHelper *)v78 initWithAsrId:v58 taskName:v79 isSamplingForDictation:v73];
      asrSelfHelper = self->_asrSelfHelper;
      self->_asrSelfHelper = v80;

      if (v73)
      {
        v82 = +[CESRDictationOnDeviceSampling sharedManager];
        unsigned __int8 v83 = [v82 isRequestSelectedForSamplingFromConfigForLanguage:self->_language];
        p_onDeviceDictationSampled = &self->_onDeviceDictationSampled;
      }
      else
      {
        if ((v130 & 1) == 0)
        {
          BOOL *p_onDeviceAssistantSampled = 0;
          goto LABEL_56;
        }
        v82 = +[CESRAssistantOnDeviceSampling sharedManager];
        unsigned __int8 v83 = [v82 isRequestSelectedForSamplingForTask:self->_localSpeechRecognizerTaskString];
        p_onDeviceDictationSampled = &self->_onDeviceAssistantSampled;
      }
      BOOL *p_onDeviceDictationSampled = v83;

      if (*p_onDeviceAssistantSampled)
      {
        id v85 = objc_alloc((Class)CSUncompressedAudioLogging);
        v86 = self->_requestId;
        v87 = [v58 UUIDString];
        v88 = self->_language;
        v89 = [v59 task];
        v90 = (CSUncompressedAudioLogging *)[v85 initWithRequestId:v86 asrId:v87 languageCode:v88 task:v89];
        v91 = self->_audioLogging;
        self->_audioLogging = v90;

LABEL_61:
        v99 = self->_asrSelfHelper;
        v100 = self->_audioLogging;
        v141[0] = _NSConcreteStackBlock;
        v141[1] = 3221225472;
        v141[2] = sub_1000D9090;
        v141[3] = &unk_100253B30;
        v142 = v99;
        v143 = self;
        audioLogging = v99;
        [(CSUncompressedAudioLogging *)v100 prepareLogging:v141];

LABEL_62:
        v101 = (__CFString *)v134;

        v102 = [(CSAttSiriAsrNode *)self _interactiveLocalSpeechRecognizer];
        v140[0] = _NSConcreteStackBlock;
        v140[1] = 3221225472;
        v140[2] = sub_1000D90B0;
        v140[3] = &unk_100251018;
        v140[4] = self;
        [v102 startSpeechRecognitionWithParameters:v59 didStartHandlerWithInfo:v140];

        v103 = [(CSAudioProcessWaitingBuffer *)self->_audioWaitingBuffer fetchAudioChunksFromBuffer];
        v104 = v103;
        if (v103)
        {
          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          id v105 = [v103 countByEnumeratingWithState:&v136 objects:v146 count:16];
          if (v105)
          {
            id v106 = v105;
            uint64_t v107 = *(void *)v137;
            do
            {
              for (i = 0; i != v106; i = (char *)i + 1)
              {
                if (*(void *)v137 != v107) {
                  objc_enumerationMutation(v104);
                }
                v109 = *(void **)(*((void *)&v136 + 1) + 8 * i);
                v110 = [v109 audioChunk];
                v111 = [v109 bufferedTimestamp];
                [(CSAttSiriAsrNode *)self _processAudioChunk:v110 withReadyTimestamp:v111];
              }
              id v106 = [v104 countByEnumeratingWithState:&v136 objects:v146 count:16];
            }
            while (v106);
          }
          [(CSAttSiriAsrNode *)self _clearAudioProcessWaitingBufferIfNeeded];
          v101 = (__CFString *)v134;
        }

        return;
      }
LABEL_56:
      if (self->_onDeviceDictationSampled)
      {
        id v93 = objc_alloc((Class)CSUncompressedAudioLogging);
        v87 = [v58 UUIDString];
        v94 = self->_language;
        v95 = [v59 task];
        v96 = (CSUncompressedAudioLogging *)[v93 initWithDictationInteractionId:v135 asrId:v87 languageCode:v94 task:v95];
        v97 = self->_audioLogging;
        self->_audioLogging = v96;
      }
      else
      {
        v98 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v148 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%s Request was not selected for sampling. Disabling audio logging.", buf, 0xCu);
        }
        v87 = self->_audioLogging;
        self->_audioLogging = 0;
      }
      goto LABEL_61;
    }
    int64_t v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v92 = self->_localSpeechRecognizerTaskString;
      *(_DWORD *)buf = 136315650;
      v148 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
      __int16 v149 = 2114;
      double v150 = *(double *)&v15;
      __int16 v151 = 2114;
      v152 = (const char *)v92;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Local speech recognizer can't started : locale(%{public}@), taskName(%{public}@)", buf, 0x20u);
    }
    [(CSAttSiriAsrNode *)self _setLocalSpeechRecognizerState:3];
    [(CSAttSiriAsrNode *)self _clearAudioProcessWaitingBufferIfNeeded];
  }
}

- (void)setMhId:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    float v8 = "-[CSAttSiriAsrNode setMhId:]";
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
    float v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[CSAttSiriAsrNode _shouldDisableLocalSpeechRecognizerWithOption:audioRecordContext:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Disable local SR for dictation", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v6 = 1;
LABEL_6:

  return v6;
}

- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3 stopUresProcessing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  requestId = self->_requestId;
  if (requestId && ![(NSString *)requestId isEqualToString:v6])
  {
    float v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_requestId;
      int v10 = 136315906;
      id v11 = "-[CSAttSiriAsrNode _stopPreviousRecognitionTaskIfNeededWithNewRequestId:stopUresProcessing:]";
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s cached requestId : %@, newRequestId : %@, stopUresProcessing : %d", (uint8_t *)&v10, 0x26u);
    }
    [(CSAttSiriAsrNode *)self _handleStopDeliverLocalSpeechRecognitionWithStopUresProcessing:v4];
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
  v15[2] = sub_1000D9790;
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
    id v16 = "-[CSAttSiriAsrNode _preheatWithLanguage:preheatSource:]";
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Preheat local speech recognizer with language : %@", (uint8_t *)&v15, 0x16u);
  }
  id v12 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:self->_language assetType:3];
  id v13 = [(CSAttSiriAsrNode *)self _sourceStringFromPreheatSource:a4];
  id v14 = [(CSAttSiriAsrNode *)self _interactiveLocalSpeechRecognizer];
  [v14 preheatSpeechRecognitionWithAssetConfig:v12 preheatSource:v13 modelOverrideURL:0];
}

- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (v5)
  {
    id v8 = [(CSAttSiriAsrNode *)self _interactiveLocalSpeechRecognizer];
    [v8 startMissingAssetDownload];
  }
  [(CSAttSiriAsrNode *)self _preheatWithLanguage:v9 preheatSource:a4];
}

- (void)preheatWithLanguage:(id)a3 shouldDownloadMissingAsset:(BOOL)a4
{
  id v6 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D9C08;
  block[3] = &unk_1002537C0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)start
{
  unint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[CSAttSiriAsrNode start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D9D1C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_clearEndpointHint
{
  self->_lastEndpointHintDuration = 0.0;
  self->_int64_t lastEndpointHintRCId = -1;
  lastEndpointHintFeatures = self->_lastEndpointHintFeatures;
  self->_lastEndpointHintFeatures = 0;
}

- (void)_enforceEndpointHintWithRequestId:(id)a3 rcId:(unint64_t)a4 shouldAccept:(BOOL)a5 featuresToLog:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (self->_speechHasAcceptedResultCandidate)
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSAttSiriAsrNode _enforceEndpointHintWithRequestId:rcId:shouldAccept:featuresToLog:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Already accepted result candidate for request", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    self->_speechHasAcceptedResultCandidate = 1;
    if (self->_localSpeechRecognizerState == 2)
    {
      if (+[CSUtils isMedocFeatureEnabled])
      {
        id v13 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[CSAttSiriAsrNode _enforceEndpointHintWithRequestId:rcId:shouldAccept:featuresToLog:]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s isMedocFeatureEnabled - don't need to send mitigationSignal", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v24 = 0x2020000000;
        unsigned __int8 v25 = 0;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
        unsigned __int8 v15 = [WeakRetained getMitigationDecisionForRCId:a4 forRequestId:v10];

        unsigned __int8 v25 = v15;
        id v16 = [(CSAttSiriAsrNode *)self localSRBridgeListener];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000DA1E4;
        v17[3] = &unk_100250FC8;
        p_long long buf = &buf;
        unint64_t v21 = a4;
        BOOL v22 = a5;
        id v18 = v10;
        id v19 = v11;
        [v16 notifyClientsWithBlock:v17];

        _Block_object_dispose(&buf, 8);
      }
    }
    [(CSAttSiriAsrNode *)self _clearEndpointHint];
  }
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v8 = a5;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA3AC;
  block[3] = &unk_1002532A8;
  double v13 = a4;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA5AC;
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
  v8[2] = sub_1000DA6FC;
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
  v6[2] = sub_1000DA978;
  v6[3] = &unk_100253AB8;
  v6[4] = self;
  BOOL v7 = a4;
  dispatch_async(localSpeechRecognizerQueue, v6);
}

- (void)updateTCUState:(id)a3
{
  unint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[CSAttSiriAsrNode updateTCUState:]";
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v4, 0xCu);
  }
}

- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4
{
  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[CSAttSiriAsrNode trpCandidateReadyForExecutionForRequestId:withTrpId:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DABF8;
  block[3] = &unk_100253540;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
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
  unsigned __int8 v25 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    double v46 = "-[CSAttSiriAsrNode updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:disambiguationAc"
          "tive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]";
    __int16 v47 = 2112;
    id v48 = v35;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DAF0C;
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
  id v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v24 = "-[CSAttSiriAsrNode resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:]";
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000DB100;
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
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v9 = "-[CSAttSiriAsrNode pauseLocalSpeechRecognitionForRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB278;
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
    id v11 = "-[CSAttSiriAsrNode _disableLocalSpeechRecognitionForRequestId:force:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s requestId : %@, force : %d", (uint8_t *)&v10, 0x1Cu);
  }
  if (!v6 || [(NSString *)v6 isEqualToString:self->_siriSessionUUID] || v4)
  {
    [(CSAttSiriAsrNode *)self _setLocalSpeechRecognizerState:3];
    [(CSAttSiriAsrNode *)self _clearAudioProcessWaitingBufferIfNeeded];
  }
  else
  {
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      siriSessionUUID = self->_siriSessionUUID;
      int v10 = 136315394;
      id v11 = "-[CSAttSiriAsrNode _disableLocalSpeechRecognitionForRequestId:force:]";
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
  v7[2] = sub_1000DB4C8;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4
{
  id v6 = a4;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    *(_DWORD *)long long buf = 136315906;
    id v16 = "-[CSAttSiriAsrNode stopSpeechRecognitionWithReason:requestId:]";
    __int16 v17 = 2050;
    unint64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = requestId;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Reason : %{public}lu, requestId: %@, cached requestId : %@", buf, 0x2Au);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB62C;
  block[3] = &unk_1002532A8;
  id v12 = v6;
  id v13 = self;
  unint64_t v14 = a3;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_startDeliverLocalSpeechRecognitionResultsWithRequestId:(id)a3
{
  id v4 = a3;
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    int v16 = 136315394;
    __int16 v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2048;
    unint64_t v19 = localSpeechRecognizerState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s _localSpeechRecognizerState:%lu", (uint8_t *)&v16, 0x16u);
    int v5 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    int v16 = 136315394;
    __int16 v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2112;
    unint64_t v19 = (unint64_t)requestId;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Start deliver asr results with requestId: %@", (uint8_t *)&v16, 0x16u);
  }
  unint64_t v8 = self->_localSpeechRecognizerState;
  if (v8 != 3)
  {
    [(CSAttSiriAsrNode *)self _setLocalSpeechRecognizerState:2];
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
          __int16 v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Handle late start request from Request Dispatcher", (uint8_t *)&v16, 0xCu);
        }
        [(CSAttSiriAsrNode *)self _startLocalSpeechRecognizerIfNeeded];
        [(CSAttSiriAsrNode *)self _handleStopSpeechRecognitionTaskIfNeeded:1];
      }
      else
      {
        audioWaitingBuffer = self->_audioWaitingBuffer;
        if (audioWaitingBuffer)
        {
          id v13 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v14 = v13;
            BOOL v15 = [(CSAudioProcessWaitingBuffer *)audioWaitingBuffer uuid];
            int v16 = 136315650;
            __int16 v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
            __int16 v18 = 2112;
            unint64_t v19 = (unint64_t)v4;
            __int16 v20 = 2114;
            __int16 v21 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Clear audio waiting buffer since current requestId(%@) doesn't match expected one (%{public}@)", (uint8_t *)&v16, 0x20u);
          }
          [(CSAttSiriAsrNode *)self _clearAudioProcessWaitingBufferIfNeeded];
        }
      }
    }
    else if (v8 == 1)
    {
      [(CSAttSiriAsrNode *)self _startLocalSpeechRecognizerIfNeeded];
    }
  }
}

- (void)startSpeechRecognitionResultsWithSettings:(id)a3
{
  id v4 = a3;
  id v5 = [v4 speechRecognitionMode];
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DBAA0;
  block[3] = &unk_1002532A8;
  void block[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v7 = v4;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DBEA8;
  block[3] = &unk_1002532A8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_handleStopDeliverLocalSpeechRecognitionWithStopUresProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSAttSiriAsrNode *)self _setLocalSpeechRecognizerState:0];
  speechRecognitionSettings = self->_speechRecognitionSettings;
  self->_speechRecognitionSettings = 0;

  if ([(LBLocalSpeechRecognitionSettings *)self->_speechRecognitionSettings speechRecognitionMode] != (id)1)
  {
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
      [WeakRetained stopUresProcessingForRequest:self->_requestId];
    }
    requestId = self->_requestId;
    self->_requestId = 0;
  }
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
        unint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    id v12 = [v8 objectForKeyedSubscript:v10];
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
        unint64_t v11 = [v5 objectForKeyedSubscript:v9];
        id v12 = [v11 unsignedIntegerValue];
        id v13 = [v5 objectForKeyedSubscript:v6];
        unint64_t v14 = v12 - (unsigned char *)[v13 unsignedIntegerValue];

        +[CSConfig inputRecordingSampleRate];
        double v16 = (float)((float)v14 / v15);
        self->_double endpointStartTimeInSec = v16;
        __int16 v17 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 136315394;
          id v35 = "-[CSAttSiriAsrNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
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
        id v35 = "-[CSAttSiriAsrNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
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
  v7[2] = sub_1000DC464;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)registerUresNode:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DC508;
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
  v7[2] = sub_1000DC5AC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)stopWithReason:(unint64_t)a3
{
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v9 = "-[CSAttSiriAsrNode stopWithReason:]";
    __int16 v10 = 2050;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Reason : %{public}lu", buf, 0x16u);
  }
  localSpeechRecognizerQueue = self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DC6D8;
  v7[3] = &unk_100253B58;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)stop
{
}

- (CSAttSiriAsrNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriAsrNode *)self init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriAsrNode)initWithLocalSpeechRecognizer:(id)a3 isFileLoggingEnabled:(BOOL)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSAttSiriAsrNode;
  id v8 = [(CSAttSiriAsrNode *)&v18 init];
  uint64_t v9 = v8;
  if (v8)
  {
    requiredNodes = v8->_requiredNodes;
    v8->_type = 2;
    v8->_requiredNodes = (NSArray *)&off_10025E7C0;

    v9->_isReady = 0;
    targetQueue = v9->_targetQueue;
    v9->_targetQueue = 0;

    if (+[CSUtils supportsDispatchWorkloop])
    {
      uint64_t v12 = +[CSUtils getSerialQueueWithQOS:33 name:@"localSpeechRecognizerQueue Queue" fixedPriority:kCSDefaultSerialQueueFixedPriority];
    }
    else
    {
      uint64_t v13 = +[CSUtils rootQueueWithFixedPriority:kCSDefaultSerialQueueFixedPriority];
      unint64_t v14 = v9->_targetQueue;
      v9->_targetQueue = (OS_dispatch_queue *)v13;

      uint64_t v12 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[@"localSpeechRecognizerQueue Queue" UTF8String], 0, (dispatch_queue_t)v9->_targetQueue);
    }
    localSpeechRecognizerQueue = v9->_localSpeechRecognizerQueue;
    v9->_localSpeechRecognizerQueue = (OS_dispatch_queue *)v12;

    v9->_activeChannel = 0;
    requestId = v9->_requestId;
    v9->_requestId = 0;

    v9->_eagerResultId = 0;
    v9->_disableEndpointer = 0;
    v9->_double endpointStartTimeInSec = 0.0;
    v9->_float audioSampleCountToSkip = 0;
    [(CSAttSiriAsrNode *)v9 _setLocalSpeechRecognizerState:0];
    v9->_shouldProcessAudio = 0;
    objc_storeStrong((id *)&v9->_presetLocalSpeechRecognizer, a3);
    v9->_endpointMode = 0;
    v9->_isFileLoggingEnabled = a4;
    v9->_unint64_t voiceTriggerFireMachTime = 0;
  }

  return v9;
}

- (CSAttSiriAsrNode)init
{
  BOOL v3 = +[CSFPreferences sharedPreferences];
  id v4 = -[CSAttSiriAsrNode initWithLocalSpeechRecognizer:isFileLoggingEnabled:](self, "initWithLocalSpeechRecognizer:isFileLoggingEnabled:", 0, [v3 fileLoggingIsEnabled]);

  return v4;
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