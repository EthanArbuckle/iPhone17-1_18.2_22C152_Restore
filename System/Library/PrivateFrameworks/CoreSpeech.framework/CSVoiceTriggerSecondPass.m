@interface CSVoiceTriggerSecondPass
+ (id)secondPassAudioLogDirectory;
+ (id)secondPassAudioLoggingFilePathWithDeviceId:(id)a3;
+ (id)stringForSecondPassResult:(unint64_t)a3;
+ (id)timeStampString;
- (BOOL)_isBuiltInFirstPassSource:(unint64_t)a3;
- (BOOL)_isFirstPassSourceExclave:(unint64_t)a3;
- (BOOL)_shouldLogMediaplayState:(unint64_t)a3;
- (BOOL)_usePHS;
- (BOOL)cancelSecondPassTrigger;
- (BOOL)didWakeAP;
- (BOOL)firstTimeAssetConfigured;
- (BOOL)hasLoggedSecondPass;
- (BOOL)hasTriggerCandidate;
- (BOOL)isAdBlockerMatchedBeforeSetResultCompletion;
- (BOOL)isPSRAudioFlushed;
- (BOOL)isStartSampleCountMarked;
- (BOOL)secondPassHasMadeDecision;
- (BOOL)shouldUsePHS;
- (BOOL)supportsMph;
- (CSAsset)currentAsset;
- (CSAudioCircularBuffer)audioBuffer;
- (CSAudioStream)audioStream;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSAudioTimeConverter)exclaveAudioTimeConverter;
- (CSExclaveSecondPassVoiceTriggerAnalyzing)exclaveClient;
- (CSPhraseDetector)phraseDetector;
- (CSPhraseNDEAPIScorer)phraseNDEAPIScorer;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSpeechManager)speechManager;
- (CSVTSecondPassLatencyMetrics)secondPassLatencyMetrics;
- (CSVoiceTriggerAwareZeroFilter)zeroFilter;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics;
- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3;
- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 speechManager:(id)a4 supportsMphDetection:(BOOL)a5 secondPassQueue:(id)a6;
- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 targetQueue:(id)a4;
- (CSVoiceTriggerSecondPassConfig)config;
- (NSDictionary)firstPassChannelSelectionScores;
- (NSMutableArray)assetConfigWaitingBuffer;
- (NSMutableDictionary)storedFirstPassInfo;
- (NSString)UUID;
- (NSString)audioProviderUUID;
- (NSString)currentLocale;
- (NSString)firstPassDeviceId;
- (NSUUID)secondPassCompleteWatchDogToken;
- (NSUUID)secondPassRejectionMHUUID;
- (OS_dispatch_queue)queue;
- (SSRSpeakerRecognitionContext)ssrContext;
- (SSRSpeakerRecognitionController)speakerRecognitionController;
- (double)cumulativeDowntime;
- (double)cumulativeUptime;
- (double)lastAggTime;
- (float)firstPassChannelSelectionDelaySeconds;
- (float)firstPassMasterChannelScoreBoost;
- (float)firstPassOnsetScore;
- (float)firstPassVoiceIsolationChannelScoreBoost;
- (float)mediaVolume;
- (float)phsRejectLoggingThreshold;
- (float)secondPassCompleteWatchDogTimeoutSec;
- (float)secondPassPrependingSec;
- (id)_fetchSiriLocale;
- (id)_getAudioTimeConverter;
- (id)_getExclaveAudioTimeConverter;
- (id)_getFirstPassTriggerSourceAsString:(unint64_t)a3;
- (id)_getVoiceTriggerInfoWithKeywordDetectorResult:(id)a3;
- (id)_runRecognizersWithChunk:(id)a3;
- (id)_voiceTriggerSecondPassLatencyMetrics;
- (id)resultCompletion;
- (int)modelFileDescriptor;
- (int64_t)mediaPlayingState;
- (os_unfair_lock_s)secondpassTriggerCancellationLock;
- (unint64_t)AOPVTTriggerLength;
- (unint64_t)activeChannel;
- (unint64_t)analyzerPrependingSamples;
- (unint64_t)analyzerTrailingSamples;
- (unint64_t)earlyDetectFiredMachTime;
- (unint64_t)extraSamplesAtStart;
- (unint64_t)firstPassFireHostTime;
- (unint64_t)firstPassOnsetChannel;
- (unint64_t)firstPassSource;
- (unint64_t)firstPassTriggerFireSampleCount;
- (unint64_t)firstPassTriggerStartSampleCount;
- (unint64_t)numAnalyzedSamples;
- (unint64_t)numProcessedSamples;
- (unint64_t)prewarmMmapedSize;
- (unint64_t)processedSampleCountsInPending;
- (unint64_t)secondPassAnalyzerStartSampleCount;
- (unint64_t)secondPassCheckerExecutionTime;
- (unint64_t)secondPassClient;
- (unint64_t)secondPassTimeout;
- (unint64_t)selectedChannelFromFirstPass;
- (unint64_t)timeBasedEstimatedTriggerLength;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4;
- (void)_addDeviceStatusInfoToDict:(id)a3;
- (void)_addLosingPhraseResultstoVTEI:(id)a3 withLosingPhraseResults:(id)a4;
- (void)_addPHSInfoToVTEI:(id)a3 fromSpeakerInfo:(id)a4 withThreshold:(float)a5;
- (void)_addRejectStatsToDict:(id)a3;
- (void)_analyzeForChannel:(unint64_t)a3 keywordDetectorResult:(id)a4 losingPhraseResults:(id)a5;
- (void)_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:(id)a3 completion:(id)a4;
- (void)_clearSecondPassCompletionWatchDog;
- (void)_clearTriggerCandidate;
- (void)_didStartAudioStream:(BOOL)a3;
- (void)_didStopAudioStream;
- (void)_getDidWakeAP:(id)a3;
- (void)_handleAudioChunk:(id)a3 shouldPreprocessedByZeroFilter:(BOOL)a4;
- (void)_handlePHSResults:(id)a3 voiceTriggerEventInfo:(id)a4 forPhId:(unint64_t)a5;
- (void)_handleResultCompletion:(unint64_t)a3 voiceTriggerInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5 error:(id)a6;
- (void)_handleSecondPassSuccess:(id)a3;
- (void)_handleVoiceTriggerFirstPassFromAOP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5;
- (void)_handleVoiceTriggerFirstPassFromAP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5;
- (void)_handleVoiceTriggerFirstPassFromExclave:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5;
- (void)_handleVoiceTriggerFirstPassFromHearst:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8;
- (void)_handleVoiceTriggerFirstPassFromHearstAP:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8;
- (void)_handleVoiceTriggerFirstPassFromJarvis:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7;
- (void)_handleVoiceTriggerFirstPassFromRemora:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7;
- (void)_initializeMediaPlayingState;
- (void)_logRejectionEventToSELF:(id)a3 result:(unint64_t)a4;
- (void)_logSecondPassResult:(unint64_t)a3 withVTEI:(id)a4;
- (void)_logUptimeWithVTSwitchChanged:(BOOL)a3 VTEnabled:(BOOL)a4;
- (void)_mmapModelForPreWarm;
- (void)_notifySecondPassReject:(id)a3 result:(unint64_t)a4 isSecondChanceCandidate:(BOOL)a5;
- (void)_prepareStartAudioStream;
- (void)_processSecondPassInExclave:(id)a3;
- (void)_reportDiagnosticsForDelayedVTLaunchIfNeeded:(float)a3;
- (void)_reportModelProcessingLatency;
- (void)_requestStartAudioStreamWitContext:(id)a3 audioProviderUUID:(id)a4 startStreamOption:(id)a5 completion:(id)a6;
- (void)_reset;
- (void)_resetStartAnalyzeTime;
- (void)_resetUpTime;
- (void)_resetVoiceTriggerLatencyMetrics;
- (void)_scheduleDidStartSecondPassCompletionWatchDogWithToken:(id)a3;
- (void)_scheduleSecondPassCompletionWatchDog;
- (void)_setAsset:(id)a3;
- (void)_setKeywordDetectorStartMachTime:(unint64_t)a3 detectorEndMachTime:(unint64_t)a4 lastAudioPacketAnalyzedMachTime:(unint64_t)a5;
- (void)_setStartAnalyzeTime:(unint64_t)a3;
- (void)_syncVoiceProfileEmbeddingsToExclave;
- (void)_unmapForPrewarmLoadedGraph;
- (void)_voiceTriggerFirstPassDidDetectKeywordFrom:(id)a3 completion:(id)a4;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7;
- (void)cancelCurrentRequest;
- (void)dealloc;
- (void)forceCancelSecondPassTrigger;
- (void)handleVoiceTriggerSecondPassFrom:(id)a3 completion:(id)a4;
- (void)prewarm;
- (void)prewarmModelGraph;
- (void)reset;
- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4;
- (void)setAOPVTTriggerLength:(unint64_t)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnalyzerPrependingSamples:(unint64_t)a3;
- (void)setAnalyzerTrailingSamples:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setAssetConfigWaitingBuffer:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioProviderUUID:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setCancelSecondPassTrigger:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setCumulativeDowntime:(double)a3;
- (void)setCumulativeUptime:(double)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentLocale:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidWakeAP:(BOOL)a3;
- (void)setEarlyDetectFiredMachTime:(unint64_t)a3;
- (void)setExclaveAudioTimeConverter:(id)a3;
- (void)setExclaveClient:(id)a3;
- (void)setExtraSamplesAtStart:(unint64_t)a3;
- (void)setFirstPassChannelSelectionDelaySeconds:(float)a3;
- (void)setFirstPassChannelSelectionScores:(id)a3;
- (void)setFirstPassDeviceId:(id)a3;
- (void)setFirstPassFireHostTime:(unint64_t)a3;
- (void)setFirstPassMasterChannelScoreBoost:(float)a3;
- (void)setFirstPassOnsetChannel:(unint64_t)a3;
- (void)setFirstPassOnsetScore:(float)a3;
- (void)setFirstPassSource:(unint64_t)a3;
- (void)setFirstPassTriggerFireSampleCount:(unint64_t)a3;
- (void)setFirstPassTriggerStartSampleCount:(unint64_t)a3;
- (void)setFirstPassVoiceIsolationChannelScoreBoost:(float)a3;
- (void)setFirstTimeAssetConfigured:(BOOL)a3;
- (void)setFirstpassMetrics:(id)a3;
- (void)setHasLoggedSecondPass:(BOOL)a3;
- (void)setHasTriggerCandidate:(BOOL)a3;
- (void)setIsAdBlockerMatchedBeforeSetResultCompletion:(BOOL)a3;
- (void)setIsPSRAudioFlushed:(BOOL)a3;
- (void)setIsStartSampleCountMarked:(BOOL)a3;
- (void)setLastAggTime:(double)a3;
- (void)setMediaPlayingState:(int64_t)a3;
- (void)setMediaVolume:(float)a3;
- (void)setModelFileDescriptor:(int)a3;
- (void)setNumAnalyzedSamples:(unint64_t)a3;
- (void)setNumProcessedSamples:(unint64_t)a3;
- (void)setPhraseDetector:(id)a3;
- (void)setPhraseNDEAPIScorer:(id)a3;
- (void)setPhsRejectLoggingThreshold:(float)a3;
- (void)setPrewarmMmapedSize:(unint64_t)a3;
- (void)setPrewarmModelGraph:(void *)a3;
- (void)setProcessedSampleCountsInPending:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setResultCompletion:(id)a3;
- (void)setSecondPassAnalyzerStartSampleCount:(unint64_t)a3;
- (void)setSecondPassCheckerExecutionTime:(unint64_t)a3;
- (void)setSecondPassClient:(unint64_t)a3;
- (void)setSecondPassCompleteWatchDogTimeoutSec:(float)a3;
- (void)setSecondPassCompleteWatchDogToken:(id)a3;
- (void)setSecondPassHasMadeDecision:(BOOL)a3;
- (void)setSecondPassLatencyMetrics:(id)a3;
- (void)setSecondPassPrependingSec:(float)a3;
- (void)setSecondPassRejectionMHUUID:(id)a3;
- (void)setSecondPassTimeout:(unint64_t)a3;
- (void)setSecondpassTriggerCancellationLock:(os_unfair_lock_s)a3;
- (void)setSelectedChannelFromFirstPass:(unint64_t)a3;
- (void)setShouldUsePHS:(BOOL)a3;
- (void)setSpeakerRecognitionController:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSsrContext:(id)a3;
- (void)setStoredFirstPassInfo:(id)a3;
- (void)setSupportsMph:(BOOL)a3;
- (void)setSupportsMultiPhraseDetection:(BOOL)a3;
- (void)setTimeBasedEstimatedTriggerLength:(unint64_t)a3;
- (void)setZeroFilter:(id)a3;
- (void)start;
- (void)voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:(id)a3 bestStartSampleCount:(unint64_t)a4 bestEndSampleCount:(unint64_t)a5;
- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5;
@end

@implementation CSVoiceTriggerSecondPass

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveClient, 0);
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_storeStrong((id *)&self->_secondPassLatencyMetrics, 0);
  objc_storeStrong((id *)&self->_firstpassMetrics, 0);
  objc_storeStrong((id *)&self->_secondPassRejectionMHUUID, 0);
  objc_storeStrong((id *)&self->_storedFirstPassInfo, 0);
  objc_storeStrong((id *)&self->_exclaveAudioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_assetConfigWaitingBuffer, 0);
  objc_storeStrong((id *)&self->_secondPassCompleteWatchDogToken, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_firstPassDeviceId, 0);
  objc_destroyWeak((id *)&self->_audioBuffer);
  objc_storeStrong((id *)&self->_firstPassChannelSelectionScores, 0);
  objc_storeStrong(&self->_resultCompletion, 0);
  objc_storeStrong((id *)&self->_ssrContext, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionController, 0);
  objc_storeStrong((id *)&self->_phraseNDEAPIScorer, 0);
  objc_storeStrong((id *)&self->_phraseDetector, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setSecondpassTriggerCancellationLock:(os_unfair_lock_s)a3
{
  self->_secondpassTriggerCancellationLock = a3;
}

- (os_unfair_lock_s)secondpassTriggerCancellationLock
{
  return self->_secondpassTriggerCancellationLock;
}

- (void)setCancelSecondPassTrigger:(BOOL)a3
{
  self->_cancelSecondPassTrigger = a3;
}

- (BOOL)cancelSecondPassTrigger
{
  return self->_cancelSecondPassTrigger;
}

- (void)setIsAdBlockerMatchedBeforeSetResultCompletion:(BOOL)a3
{
  self->_isAdBlockerMatchedBeforeSetResultCompletion = a3;
}

- (BOOL)isAdBlockerMatchedBeforeSetResultCompletion
{
  return self->_isAdBlockerMatchedBeforeSetResultCompletion;
}

- (void)setExclaveClient:(id)a3
{
}

- (CSExclaveSecondPassVoiceTriggerAnalyzing)exclaveClient
{
  return self->_exclaveClient;
}

- (void)setTimeBasedEstimatedTriggerLength:(unint64_t)a3
{
  self->_timeBasedEstimatedTriggerLength = a3;
}

- (unint64_t)timeBasedEstimatedTriggerLength
{
  return self->_timeBasedEstimatedTriggerLength;
}

- (void)setAOPVTTriggerLength:(unint64_t)a3
{
  self->_AOPVTTriggerLength = a3;
}

- (unint64_t)AOPVTTriggerLength
{
  return self->_AOPVTTriggerLength;
}

- (void)setIsPSRAudioFlushed:(BOOL)a3
{
  self->_isPSRAudioFlushed = a3;
}

- (BOOL)isPSRAudioFlushed
{
  return self->_isPSRAudioFlushed;
}

- (void)setModelFileDescriptor:(int)a3
{
  self->_modelFileDescriptor = a3;
}

- (int)modelFileDescriptor
{
  return self->_modelFileDescriptor;
}

- (void)setPrewarmModelGraph:(void *)a3
{
  self->_prewarmModelGraph = a3;
}

- (void)prewarmModelGraph
{
  return self->_prewarmModelGraph;
}

- (void)setPrewarmMmapedSize:(unint64_t)a3
{
  self->_prewarmMmapedSize = a3;
}

- (unint64_t)prewarmMmapedSize
{
  return self->_prewarmMmapedSize;
}

- (void)setZeroFilter:(id)a3
{
}

- (CSVoiceTriggerAwareZeroFilter)zeroFilter
{
  return self->_zeroFilter;
}

- (void)setSupportsMph:(BOOL)a3
{
  self->_supportsMph = a3;
}

- (BOOL)supportsMph
{
  return self->_supportsMph;
}

- (void)setSecondPassLatencyMetrics:(id)a3
{
}

- (CSVTSecondPassLatencyMetrics)secondPassLatencyMetrics
{
  return self->_secondPassLatencyMetrics;
}

- (void)setFirstpassMetrics:(id)a3
{
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (void)setHasLoggedSecondPass:(BOOL)a3
{
  self->_hasLoggedSecondPass = a3;
}

- (BOOL)hasLoggedSecondPass
{
  return self->_hasLoggedSecondPass;
}

- (void)setSecondPassRejectionMHUUID:(id)a3
{
}

- (NSUUID)secondPassRejectionMHUUID
{
  return self->_secondPassRejectionMHUUID;
}

- (void)setStoredFirstPassInfo:(id)a3
{
}

- (NSMutableDictionary)storedFirstPassInfo
{
  return self->_storedFirstPassInfo;
}

- (void)setExclaveAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)exclaveAudioTimeConverter
{
  return self->_exclaveAudioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAssetConfigWaitingBuffer:(id)a3
{
}

- (NSMutableArray)assetConfigWaitingBuffer
{
  return self->_assetConfigWaitingBuffer;
}

- (void)setFirstTimeAssetConfigured:(BOOL)a3
{
  self->_firstTimeAssetConfigured = a3;
}

- (BOOL)firstTimeAssetConfigured
{
  return self->_firstTimeAssetConfigured;
}

- (void)setSecondPassCompleteWatchDogToken:(id)a3
{
}

- (NSUUID)secondPassCompleteWatchDogToken
{
  return self->_secondPassCompleteWatchDogToken;
}

- (void)setMediaVolume:(float)a3
{
  self->_mediaVolume = a3;
}

- (float)mediaVolume
{
  return self->_mediaVolume;
}

- (void)setMediaPlayingState:(int64_t)a3
{
  self->_mediaPlayingState = a3;
}

- (int64_t)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setSecondPassHasMadeDecision:(BOOL)a3
{
  self->_secondPassHasMadeDecision = a3;
}

- (BOOL)secondPassHasMadeDecision
{
  return self->_secondPassHasMadeDecision;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setCurrentLocale:(id)a3
{
}

- (NSString)currentLocale
{
  return self->_currentLocale;
}

- (unint64_t)secondPassClient
{
  return self->_secondPassClient;
}

- (NSString)firstPassDeviceId
{
  return self->_firstPassDeviceId;
}

- (unint64_t)firstPassSource
{
  return self->_firstPassSource;
}

- (void)setAudioBuffer:(id)a3
{
}

- (CSAudioCircularBuffer)audioBuffer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioBuffer);
  return (CSAudioCircularBuffer *)WeakRetained;
}

- (void)setSecondPassCheckerExecutionTime:(unint64_t)a3
{
  self->_secondPassCheckerExecutionTime = a3;
}

- (unint64_t)secondPassCheckerExecutionTime
{
  return self->_secondPassCheckerExecutionTime;
}

- (void)setCumulativeDowntime:(double)a3
{
  self->_cumulativeDowntime = a3;
}

- (double)cumulativeDowntime
{
  return self->_cumulativeDowntime;
}

- (void)setCumulativeUptime:(double)a3
{
  self->_cumulativeUptime = a3;
}

- (double)cumulativeUptime
{
  return self->_cumulativeUptime;
}

- (void)setLastAggTime:(double)a3
{
  self->_lastAggTime = a3;
}

- (double)lastAggTime
{
  return self->_lastAggTime;
}

- (void)setSecondPassAnalyzerStartSampleCount:(unint64_t)a3
{
  self->_secondPassAnalyzerStartSampleCount = a3;
}

- (unint64_t)secondPassAnalyzerStartSampleCount
{
  return self->_secondPassAnalyzerStartSampleCount;
}

- (void)setIsStartSampleCountMarked:(BOOL)a3
{
  self->_isStartSampleCountMarked = a3;
}

- (BOOL)isStartSampleCountMarked
{
  return self->_isStartSampleCountMarked;
}

- (void)setHasTriggerCandidate:(BOOL)a3
{
  self->_hasTriggerCandidate = a3;
}

- (BOOL)hasTriggerCandidate
{
  return self->_hasTriggerCandidate;
}

- (void)setDidWakeAP:(BOOL)a3
{
  self->_didWakeAP = a3;
}

- (BOOL)didWakeAP
{
  return self->_didWakeAP;
}

- (void)setFirstPassFireHostTime:(unint64_t)a3
{
  self->_firstPassFireHostTime = a3;
}

- (unint64_t)firstPassFireHostTime
{
  return self->_firstPassFireHostTime;
}

- (void)setFirstPassOnsetChannel:(unint64_t)a3
{
  self->_firstPassOnsetChannel = a3;
}

- (unint64_t)firstPassOnsetChannel
{
  return self->_firstPassOnsetChannel;
}

- (void)setFirstPassOnsetScore:(float)a3
{
  self->_firstPassOnsetScore = a3;
}

- (float)firstPassOnsetScore
{
  return self->_firstPassOnsetScore;
}

- (void)setFirstPassVoiceIsolationChannelScoreBoost:(float)a3
{
  self->_firstPassVoiceIsolationChannelScoreBoost = a3;
}

- (float)firstPassVoiceIsolationChannelScoreBoost
{
  return self->_firstPassVoiceIsolationChannelScoreBoost;
}

- (void)setFirstPassMasterChannelScoreBoost:(float)a3
{
  self->_firstPassMasterChannelScoreBoost = a3;
}

- (float)firstPassMasterChannelScoreBoost
{
  return self->_firstPassMasterChannelScoreBoost;
}

- (void)setFirstPassChannelSelectionDelaySeconds:(float)a3
{
  self->_firstPassChannelSelectionDelaySeconds = a3;
}

- (float)firstPassChannelSelectionDelaySeconds
{
  return self->_firstPassChannelSelectionDelaySeconds;
}

- (void)setFirstPassChannelSelectionScores:(id)a3
{
}

- (NSDictionary)firstPassChannelSelectionScores
{
  return self->_firstPassChannelSelectionScores;
}

- (void)setFirstPassTriggerFireSampleCount:(unint64_t)a3
{
  self->_firstPassTriggerFireSampleCount = a3;
}

- (unint64_t)firstPassTriggerFireSampleCount
{
  return self->_firstPassTriggerFireSampleCount;
}

- (void)setFirstPassTriggerStartSampleCount:(unint64_t)a3
{
  self->_firstPassTriggerStartSampleCount = a3;
}

- (unint64_t)firstPassTriggerStartSampleCount
{
  return self->_firstPassTriggerStartSampleCount;
}

- (void)setProcessedSampleCountsInPending:(unint64_t)a3
{
  self->_processedSampleCountsInPending = a3;
}

- (unint64_t)processedSampleCountsInPending
{
  return self->_processedSampleCountsInPending;
}

- (void)setSelectedChannelFromFirstPass:(unint64_t)a3
{
  self->_selectedChannelFromFirstPass = a3;
}

- (unint64_t)selectedChannelFromFirstPass
{
  return self->_selectedChannelFromFirstPass;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setEarlyDetectFiredMachTime:(unint64_t)a3
{
  self->_earlyDetectFiredMachTime = a3;
}

- (unint64_t)earlyDetectFiredMachTime
{
  return self->_earlyDetectFiredMachTime;
}

- (void)setShouldUsePHS:(BOOL)a3
{
  self->_shouldUsePHS = a3;
}

- (BOOL)shouldUsePHS
{
  return self->_shouldUsePHS;
}

- (void)setAnalyzerTrailingSamples:(unint64_t)a3
{
  self->_analyzerTrailingSamples = a3;
}

- (unint64_t)analyzerTrailingSamples
{
  return self->_analyzerTrailingSamples;
}

- (void)setAnalyzerPrependingSamples:(unint64_t)a3
{
  self->_analyzerPrependingSamples = a3;
}

- (unint64_t)analyzerPrependingSamples
{
  return self->_analyzerPrependingSamples;
}

- (void)setExtraSamplesAtStart:(unint64_t)a3
{
  self->_extraSamplesAtStart = a3;
}

- (unint64_t)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (void)setPhsRejectLoggingThreshold:(float)a3
{
  self->_phsRejectLoggingThreshold = a3;
}

- (float)phsRejectLoggingThreshold
{
  return self->_phsRejectLoggingThreshold;
}

- (void)setSecondPassPrependingSec:(float)a3
{
  self->_secondPassPrependingSec = a3;
}

- (float)secondPassPrependingSec
{
  return self->_secondPassPrependingSec;
}

- (void)setNumAnalyzedSamples:(unint64_t)a3
{
  self->_numAnalyzedSamples = a3;
}

- (unint64_t)numAnalyzedSamples
{
  return self->_numAnalyzedSamples;
}

- (void)setNumProcessedSamples:(unint64_t)a3
{
  self->_numProcessedSamples = a3;
}

- (unint64_t)numProcessedSamples
{
  return self->_numProcessedSamples;
}

- (void)setSecondPassTimeout:(unint64_t)a3
{
  self->_secondPassTimeout = a3;
}

- (unint64_t)secondPassTimeout
{
  return self->_secondPassTimeout;
}

- (id)resultCompletion
{
  return self->_resultCompletion;
}

- (void)setSsrContext:(id)a3
{
}

- (SSRSpeakerRecognitionContext)ssrContext
{
  return self->_ssrContext;
}

- (void)setSpeakerRecognitionController:(id)a3
{
}

- (SSRSpeakerRecognitionController)speakerRecognitionController
{
  return self->_speakerRecognitionController;
}

- (void)setPhraseNDEAPIScorer:(id)a3
{
}

- (CSPhraseNDEAPIScorer)phraseNDEAPIScorer
{
  return self->_phraseNDEAPIScorer;
}

- (void)setPhraseDetector:(id)a3
{
}

- (CSPhraseDetector)phraseDetector
{
  return self->_phraseDetector;
}

- (void)setAudioProviderUUID:(id)a3
{
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setConfig:(id)a3
{
}

- (CSVoiceTriggerSecondPassConfig)config
{
  return self->_config;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSecondPassCompleteWatchDogTimeoutSec:(float)a3
{
  self->_secondPassCompleteWatchDogTimeoutSec = a3;
}

- (float)secondPassCompleteWatchDogTimeoutSec
{
  return self->_secondPassCompleteWatchDogTimeoutSec;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerDelegate *)WeakRetained;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)_syncVoiceProfileEmbeddingsToExclave
{
  ssrContext = self->_ssrContext;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AD404;
  v6[3] = &unk_100250878;
  v6[4] = self;
  +[SSRSpeakerProfileEmbeddingExtractor extractPSRVoiceProfileWithContext:ssrContext completion:v6];
  v4 = self->_ssrContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AD588;
  v5[3] = &unk_100250878;
  v5[4] = self;
  +[SSRSpeakerProfileEmbeddingExtractor extractSATVoiceProfileWithContext:v4 completion:v5];
}

- (BOOL)_isFirstPassSourceExclave:(unint64_t)a3
{
  return a3 - 11 < 4;
}

- (void)_unmapForPrewarmLoadedGraph
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t prewarmMmapedSize = self->_prewarmMmapedSize;
    int v6 = 136315394;
    v7 = "-[CSVoiceTriggerSecondPass _unmapForPrewarmLoadedGraph]";
    __int16 v8 = 2048;
    unint64_t v9 = prewarmMmapedSize;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s unmapping for graph with size: %lu", (uint8_t *)&v6, 0x16u);
  }
  size_t v5 = self->_prewarmMmapedSize;
  if (v5)
  {
    munmap(self->_prewarmModelGraph, v5);
    self->_unint64_t prewarmMmapedSize = 0;
    self->_prewarmModelGraph = 0;
  }
}

- (void)_resetVoiceTriggerLatencyMetrics
{
  firstpassMetrics = self->_firstpassMetrics;
  self->_firstpassMetrics = 0;

  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  self->_secondPassLatencyMetrics = 0;
}

- (id)_voiceTriggerSecondPassLatencyMetrics
{
  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (!secondPassLatencyMetrics)
  {
    v4 = objc_alloc_init(CSVTSecondPassLatencyMetrics);
    size_t v5 = self->_secondPassLatencyMetrics;
    self->_secondPassLatencyMetrics = v4;

    secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  }
  return secondPassLatencyMetrics;
}

- (void)setResultCompletion:(id)a3
{
  id v4 = a3;
  size_t v5 = v4;
  if (self->_isAdBlockerMatchedBeforeSetResultCompletion)
  {
    int v6 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "-[CSVoiceTriggerSecondPass setResultCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Ads is detected before result completion is set. Notifying VT reject because Ads was detected", (uint8_t *)&v11, 0xCu);
    }
    self->_isAdBlockerMatchedBeforeSetResultCompletion = 0;
    id v7 = objc_retainBlock(v5);
    id resultCompletion = self->_resultCompletion;
    self->_id resultCompletion = v7;

    [(CSVoiceTriggerSecondPass *)self _notifySecondPassReject:0 result:11 isSecondChanceCandidate:0];
  }
  else
  {
    id v9 = objc_retainBlock(v4);
    id v10 = self->_resultCompletion;
    self->_id resultCompletion = v9;
  }
}

- (void)_clearSecondPassCompletionWatchDog
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    int v6 = 136315394;
    id v7 = "-[CSVoiceTriggerSecondPass _clearSecondPassCompletionWatchDog]";
    __int16 v8 = 2114;
    id v9 = secondPassCompleteWatchDogToken;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing secondPassCompletion WatchDogTimer : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  size_t v5 = self->_secondPassCompleteWatchDogToken;
  self->_secondPassCompleteWatchDogToken = 0;
}

- (void)_scheduleDidStartSecondPassCompletionWatchDogWithToken:(id)a3
{
  id v4 = (NSUUID *)a3;
  size_t v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    int v11 = 136315650;
    v12 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
    __int16 v13 = 2114;
    double v14 = *(double *)&v4;
    __int16 v15 = 2114;
    v16 = secondPassCompleteWatchDogToken;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s secondPassComplete WDT did fire : %{public}@, currentToken : %{public}@", (uint8_t *)&v11, 0x20u);
  }
  if ([(NSUUID *)v4 isEqual:self->_secondPassCompleteWatchDogToken])
  {
    [(CSVoiceTriggerSecondPass *)self _notifySecondPassReject:0 result:10 isSecondChanceCandidate:0];
    id v7 = +[CSDiagnosticReporter sharedInstance];
    [v7 submitVoiceTriggerIssueReport:kCSDiagnosticReporterVoiceTriggerSecondPassCompleteWatchDogFire];

    __int16 v8 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      double secondPassCompleteWatchDogTimeoutSec = self->_secondPassCompleteWatchDogTimeoutSec;
      int v11 = 136315650;
      v12 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
      __int16 v13 = 2050;
      double v14 = secondPassCompleteWatchDogTimeoutSec;
      __int16 v15 = 2114;
      v16 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Secondpass didn't complete within %{public}lf seconds with token: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    id v10 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s secondPassComplete WDT token doesn't match. Ignore this fire", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_scheduleSecondPassCompletionWatchDog
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)NSUUID);
  objc_storeStrong((id *)&self->_secondPassCompleteWatchDogToken, v3);
  id v4 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    double secondPassCompleteWatchDogTimeoutSec = self->_secondPassCompleteWatchDogTimeoutSec;
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[CSVoiceTriggerSecondPass _scheduleSecondPassCompletionWatchDog]";
    __int16 v16 = 2114;
    v17 = secondPassCompleteWatchDogToken;
    __int16 v18 = 2050;
    double v19 = secondPassCompleteWatchDogTimeoutSec;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Schedule secondPassComplete WDT %{public}@ for %{public}lf seconds", buf, 0x20u);
  }
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(float)(self->_secondPassCompleteWatchDogTimeoutSec * 1000000000.0));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ADE10;
  block[3] = &unk_100253798;
  objc_copyWeak(&v12, &location);
  id v11 = v3;
  id v9 = v3;
  dispatch_after(v7, queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_handleResultCompletion:(unint64_t)a3 voiceTriggerInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v14 = a4;
  id v10 = a6;
  [(CSVoiceTriggerSecondPass *)self _logSecondPassResult:a3 withVTEI:v14];
  id resultCompletion = (void (**)(id, CSVoiceTriggerSecondPassResultHolder *, id))self->_resultCompletion;
  if (resultCompletion)
  {
    id v12 = [[CSVoiceTriggerSecondPassResultHolder alloc] initWithResult:a3 voiceTriggerEventInfo:v14 isSecondChanceCandidate:v7];
    resultCompletion[2](resultCompletion, v12, v10);

    id v13 = self->_resultCompletion;
    self->_id resultCompletion = 0;
  }
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_unint64_t secondPassAnalyzerStartSampleCount = a3;
    id v4 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      size_t v5 = v4;
      int v6 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t secondPassAnalyzerStartSampleCount = self->_secondPassAnalyzerStartSampleCount;
      int v8 = 136315650;
      id v9 = "-[CSVoiceTriggerSecondPass _setStartAnalyzeTime:]";
      __int16 v10 = 2114;
      id v11 = v6;
      __int16 v12 = 2050;
      unint64_t v13 = secondPassAnalyzerStartSampleCount;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:set StartAnalyzeSampleCount = %{public}llu", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_unint64_t secondPassAnalyzerStartSampleCount = 0;
}

- (BOOL)_shouldLogMediaplayState:(unint64_t)a3
{
  if (!+[CSUtils supportHearstVoiceTrigger]
    || (BOOL result = 1, a3 != 3) && a3 != 6)
  {
    if CSIsIOS() && a3 - 1 < 0xB && ((0x581u >> (a3 - 1)))
    {
      return 1;
    }
    else
    {
      BOOL result = CSIsHorseman();
      if (a3 != 1) {
        return 0;
      }
    }
  }
  return result;
}

- (void)_logSecondPassResult:(unint64_t)a3 withVTEI:(id)a4
{
  id v6 = a4;
  uint64_t v7 = kVTEIrecognizerScore;
  int v8 = [v6 objectForKeyedSubscript:kVTEIrecognizerScore];
  float v9 = 0.0;
  float v10 = 0.0;
  if (v8)
  {
    id v11 = [v6 objectForKeyedSubscript:v7];
    [v11 floatValue];
    float v10 = v12;
  }
  uint64_t v13 = kVTEItriggerScore;
  id v14 = [v6 objectForKeyedSubscript:kVTEItriggerScore];
  if (v14)
  {
    __int16 v15 = [v6 objectForKeyedSubscript:v13];
    [v15 floatValue];
    float v9 = v16;
  }
  uint64_t v17 = kVTEIsatScore;
  __int16 v18 = [v6 objectForKeyedSubscript:kVTEIsatScore];
  double v19 = 0.0;
  double v20 = 0.0;
  if (v18)
  {
    v21 = [v6 objectForKeyedSubscript:v17];
    [v21 floatValue];
    float v23 = v22;

    double v20 = v23;
  }

  uint64_t v24 = kVTEItdsrScore;
  v25 = [v6 objectForKeyedSubscript:kVTEItdsrScore];
  if (v25)
  {
    v26 = [v6 objectForKeyedSubscript:v24];
    [v26 floatValue];
    double v19 = v27;
  }
  double v67 = v19;

  uint64_t v28 = kVTEItdsrCombinedScore;
  v29 = [v6 objectForKeyedSubscript:kVTEItdsrCombinedScore];
  double v30 = 0.0;
  double v31 = 0.0;
  if (v29)
  {
    v32 = [v6 objectForKeyedSubscript:v28];
    [v32 floatValue];
    double v31 = v33;
  }
  uint64_t v34 = kVTEItotalSamplesAtEndOfCapture;
  v35 = [v6 objectForKeyedSubscript:kVTEItotalSamplesAtEndOfCapture];
  if (v35)
  {
    v36 = [v6 objectForKeyedSubscript:v34];
    float v37 = (float)(unint64_t)[v36 unsignedIntegerValue];
    +[CSConfig inputRecordingSampleRate];
    double v30 = (float)(v37 / v38);
  }
  uint64_t v39 = kVTEIeffectiveThreshold;
  v40 = [v6 objectForKeyedSubscript:kVTEIeffectiveThreshold];
  double v41 = 0.0;
  double v42 = 0.0;
  if (v40)
  {
    v43 = [v6 objectForKeyedSubscript:v39];
    [v43 floatValue];
    double v42 = v44;
  }
  uint64_t v45 = kVTEItdsrCombinedThreshold;
  v46 = [v6 objectForKeyedSubscript:kVTEItdsrCombinedThreshold];
  if (v46)
  {
    v47 = [v6 objectForKeyedSubscript:v45];
    [v47 floatValue];
    double v41 = v48;
  }
  uint64_t v49 = kVTEIsatNumberTrainingUtterances;
  v50 = [v6 objectForKeyedSubscript:kVTEIsatNumberTrainingUtterances];
  if (v50)
  {
    v51 = [v6 objectForKeyedSubscript:v49];
    id v52 = [v51 unsignedIntegerValue];
  }
  else
  {
    id v52 = 0;
  }

  uint64_t v53 = kVTEIfirstPassTriggerSource;
  v54 = [v6 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];
  if (v54)
  {
    v55 = [v6 objectForKeyedSubscript:v53];
  }
  else
  {
    v55 = @"n/a";
  }

  v56 = +[CSVoiceTriggerSecondPass stringForSecondPassResult:a3];
  v57 = [(CSVoiceTriggerSecondPass *)self _fetchSiriLocale];
  v58 = [v6 objectForKeyedSubscript:kVTEITriggeredPhId];
  id v59 = [v58 unsignedIntegerValue];

  v60 = +[NSString stringWithFormat:@"SecondPass Result Summary: \nLocale: %@\nAllowMultiPhrase: %d\nFirstPassSource: %@\nAnalyzedSecs: %.3f\nNdapiScore: %.3f\nCheckerScore: %.3f\nCombinedVTScore: %.3f\nEffectiveThreshold: %.3f\n", v57, self->_supportsMph, v55, *(void *)&v30, (float)(v9 - v10), v10, v9, *(void *)&v42];
  v61 = v60;
  if (self->_speakerRecognitionController)
  {
    uint64_t v62 = objc_msgSend(v60, "stringByAppendingFormat:", @"\nPHS Summary: \nDNNScore: %.3f\nLSTMScore: %.3f\nCombinedPHSScore: %.3f\nNumSATVectors: %lu\ntdsrCombinedThreshold: %.3f\n", *(void *)&v20, *(void *)&v67, *(void *)&v31, v52, *(void *)&v41);

    v61 = (void *)v62;
  }
  v63 = +[CSPowerLogger sharedPowerLogger];
  *(float *)&double v64 = v9;
  [v63 powerLogSecondPassWithResult:a3 withSecondPassScore:v59 withPhId:v64];

  v65 = [v61 stringByAppendingFormat:@"\nDecision: %@", v56];

  v66 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[CSVoiceTriggerSecondPass _logSecondPassResult:withVTEI:]";
    __int16 v70 = 2114;
    v71 = v65;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "KeyLog - %s %{public}@", buf, 0x16u);
  }
}

- (id)_getFirstPassTriggerSourceAsString:(unint64_t)a3
{
  if (a3 <= 0xE && ((0x7BFFu >> a3) & 1) != 0) {
    id v3 = (__CFString *)*(id *)*(&off_1002508F0 + a3);
  }
  else {
    id v3 = &stru_100254530;
  }

  return v3;
}

- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5
{
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  unint64_t v9 = (unint64_t)[v8 length] >> 1;
  float v10 = [(CSVoiceTriggerSecondPass *)self _getAudioTimeConverter];
  id v11 = [v10 sampleCountFromHostTime:a5];

  id v12 = objc_alloc((Class)CSAudioChunk);
  uint64_t v13 = +[CSConfig inputRecordingSampleByteDepth];
  LOBYTE(v14) = +[CSConfig inputRecordingIsFloat];
  id v15 = [v12 initWithData:v8 numChannels:1 numSamples:v9 sampleByteDepth:v13 startSampleCount:v11 hostTime:a5 remoteVAD:0 isFloat:v14];

  [(CSVoiceTriggerSecondPass *)self _handleAudioChunk:v15 shouldPreprocessedByZeroFilter:0];
}

- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AE7E0;
  v5[3] = &unk_1002533A8;
  v5[4] = self;
  float v6 = a4;
  dispatch_async(queue, v5);
}

- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AE864;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE8E4;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4 = a3;
  size_t v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = v5;
    uint64_t v7 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSVoiceTriggerSecondPass CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:audiomxd/bridgeaudiod recovered from crash", buf, 0x16u);
  }
  if ((CSIsHorseman() & 1) != 0 || CSHasAOP())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AEA3C;
    block[3] = &unk_100253AE0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_handlePHSResults:(id)a3 voiceTriggerEventInfo:(id)a4 forPhId:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [a4 mutableCopy];
  uint64_t v9 = kSSRSpeakerRecognitionKnownUserScoresKey;
  float v10 = [v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey];
  id v11 = [v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRScoresKey];
  __int16 v12 = [v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATScoresKey];
  uint64_t v13 = [v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRExpScoresKey];
  v96 = [v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATExpScoresKey];
  uint64_t v14 = [v10 allValues];
  id v15 = [v14 count];

  if (v15)
  {
    float v16 = [v7 objectForKeyedSubscript:kSSRSpeakerRecognitionPSRAdditionalContextKey];
    uint64_t v17 = kSSRSpeakerRecognitionNumSpeakerVector;
    __int16 v18 = [v16 objectForKeyedSubscript:kSSRSpeakerRecognitionNumSpeakerVector];

    double v19 = [v7 objectForKeyedSubscript:kSSRSpeakerRecognitionSATAdditionalContextKey];
    double v20 = [v19 objectForKeyedSubscript:v17];

    v94 = v20;
    if (v18)
    {
      v21 = [v18 allValues];
      float v22 = [v21 firstObject];
      unsigned int v88 = [v22 unsignedIntValue];

      double v20 = v94;
    }
    else
    {
      unsigned int v88 = -1;
    }
    v89 = v18;
    if (v20)
    {
      uint64_t v24 = [v20 allValues];
      v25 = [v24 firstObject];
      unsigned int v87 = [v25 unsignedIntValue];
    }
    else
    {
      unsigned int v87 = -1;
    }
    double v93 = -1000.0;
    v90 = v10;
    v26 = [v10 allValues];
    float v27 = [v26 firstObject];
    [v27 floatValue];
    float v29 = v28;

    double v30 = [v11 allValues];
    double v31 = [v30 firstObject];
    double v32 = -1000.0;
    float v33 = v13;
    if (v31)
    {
      uint64_t v34 = [v11 allValues];
      v35 = [v34 firstObject];
      [v35 floatValue];
      float v37 = v36;

      uint64_t v13 = v33;
      double v32 = v37;
    }
    double v86 = v32;
    v92 = v11;

    float v38 = [v12 allValues];
    uint64_t v39 = [v38 firstObject];
    v40 = v12;
    double v41 = -1000.0;
    if (v39)
    {
      double v42 = [v40 allValues];
      v43 = [v42 firstObject];
      [v43 floatValue];
      float v45 = v44;

      uint64_t v13 = v33;
      double v41 = v45;
    }
    v91 = v40;

    v46 = [v13 allValues];
    v47 = [v46 firstObject];
    double v48 = -1000.0;
    if (v47)
    {
      uint64_t v49 = [v13 allValues];
      v50 = [v49 firstObject];
      [v50 floatValue];
      float v52 = v51;

      double v48 = v52;
    }

    uint64_t v53 = [v96 allValues];
    v54 = [v53 firstObject];
    if (v54)
    {
      v55 = [v96 allValues];
      v56 = [v55 firstObject];
      [v56 floatValue];
      double v93 = v57;
    }
    [(CSAsset *)self->_currentAsset satScoreThresholdForPhId:a5];
    float v59 = v58;
    -[CSVoiceTriggerSecondPass _addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:](self, "_addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:", v8, v7);
    [(CSVoiceTriggerSecondPass *)self _addRejectStatsToDict:v8];
    if (CSIsInternalBuild())
    {
      v60 = +[CSFPreferences sharedPreferences];
      unsigned int v61 = [v60 isReducedPHSThresholdEnabled];

      if (v61)
      {
        uint64_t v62 = CSLogCategoryVT;
        float v59 = 0.0;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "%s Override PHS threshold to 0", buf, 0xCu);
        }
      }
    }
    v63 = (void *)CSLogCategoryVT;
    BOOL v64 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    if (v29 >= v59)
    {
      uint64_t v13 = v33;
      v72 = v89;
      if (v64)
      {
        v77 = v63;
        v78 = [(CSVoiceTriggerSecondPass *)self UUID];
        *(_DWORD *)buf = 136317442;
        v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
        __int16 v99 = 2114;
        v100 = v78;
        __int16 v101 = 2050;
        double v102 = v29;
        __int16 v103 = 1026;
        unsigned int v104 = v87;
        __int16 v105 = 1026;
        unsigned int v106 = v88;
        __int16 v107 = 2050;
        double v108 = v86;
        __int16 v109 = 2050;
        double v110 = v48;
        __int16 v111 = 2050;
        double v112 = v41;
        __int16 v113 = 2050;
        double v114 = v93;
        __int16 v115 = 2050;
        double v116 = v59;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Accept: Score %{public}.3f(%{public}d, %{public}d), PSR = [%{public}.3f, %{public}.3f], SAT = [%{public}.3f, %{public}.3f] Threshold %{public}f \n", buf, 0x5Eu);
      }
      objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanTrue, kVTEIsatTriggered, *(void *)&v86);
      v79 = +[CSVoiceTriggerStatistics sharedInstance];
      [v79 resetPHSRejectCount];

      [(CSVoiceTriggerSecondPass *)self _handleSecondPassSuccess:v8];
      __int16 v12 = v91;
      id v11 = v92;
      float v10 = v90;
      v80 = v94;
    }
    else
    {
      if (v64)
      {
        v65 = v63;
        v66 = [(CSVoiceTriggerSecondPass *)self UUID];
        *(_DWORD *)buf = 136317442;
        v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
        __int16 v99 = 2114;
        v100 = v66;
        __int16 v101 = 2050;
        double v102 = v29;
        __int16 v103 = 1026;
        unsigned int v104 = v87;
        __int16 v105 = 1026;
        unsigned int v106 = v88;
        __int16 v107 = 2050;
        double v108 = v86;
        __int16 v109 = 2050;
        double v110 = v48;
        __int16 v111 = 2050;
        double v112 = v41;
        __int16 v113 = 2050;
        double v114 = v93;
        __int16 v115 = 2050;
        double v116 = v59;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Reject: Score %{public}f(%{public}d, %{public}d) PSR = [%{public}.3f, %{public}.3f], SAT = [%{public}.3f, %{public}.3f] Threshold %{public}f \n", buf, 0x5Eu);
      }
      double v67 = objc_msgSend(v8, "objectForKeyedSubscript:", kVTEItriggerScore, *(void *)&v86);
      [v67 floatValue];
      float v69 = v68;

      [v8 setObject:&__kCFBooleanFalse forKey:kVTEIsatTriggered];
      __int16 v70 = [(CSVoiceTriggerSecondPassConfig *)self->_config phraseConfigs];
      id v71 = [v70 count];

      v72 = v89;
      if ((unint64_t)v71 <= a5)
      {
        float v76 = INFINITY;
      }
      else
      {
        v73 = [(CSVoiceTriggerSecondPassConfig *)self->_config phraseConfigs];
        v74 = [v73 objectAtIndex:a5];
        [v74 keywordRejectLoggingThreshold];
        float v76 = v75;
      }
      __int16 v12 = v91;
      id v11 = v92;
      uint64_t v13 = v33;
      v80 = v94;
      float v10 = v90;
      if (v29 >= self->_phsRejectLoggingThreshold && v69 >= v76)
      {
        v81 = +[CSVoiceTriggerDataCollector sharedInstance];
        [v81 addVTRejectEntry:v8 truncateData:0];
      }
      v82 = +[CSVoiceTriggerStatistics sharedInstance];
      [v82 incrementPHSRejectCount];

      [(CSVoiceTriggerSecondPass *)self _notifySecondPassReject:v8 result:9 isSecondChanceCandidate:0];
    }
  }
  else
  {
    float v23 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      v83 = v23;
      v84 = [(CSVoiceTriggerSecondPass *)self UUID];
      double v85 = [v7 objectForKeyedSubscript:v9];
      *(_DWORD *)buf = 136315650;
      v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
      __int16 v99 = 2114;
      v100 = v84;
      __int16 v101 = 2114;
      double v102 = v85;
      _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: Failed to retrieve PHS score, letting trigger through - %{public}@", buf, 0x20u);
    }
    [(CSVoiceTriggerSecondPass *)self _handleSecondPassSuccess:v8];
  }
}

- (void)_addPHSInfoToVTEI:(id)a3 fromSpeakerInfo:(id)a4 withThreshold:(float)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = kSSRSpeakerRecognitionKnownUserScoresKey;
  float v10 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey];

  if (!v10) {
    goto LABEL_38;
  }
  id v11 = [v8 objectForKeyedSubscript:v9];
  __int16 v12 = [v11 allKeys];
  uint64_t v13 = [v12 firstObject];

  if (v13)
  {
    uint64_t v14 = kSSRSpeakerRecognitionKnownUserPSRScoresKey;
    id v15 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRScoresKey];

    if (v15)
    {
      float v16 = [v8 objectForKeyedSubscript:v14];
      uint64_t v17 = v16;
      if (v16)
      {
        __int16 v18 = [v16 objectForKeyedSubscript:v13];

        if (v18)
        {
          double v19 = [v8 objectForKeyedSubscript:v9];
          double v20 = [v19 objectForKeyedSubscript:v13];
          [v20 floatValue];
          int v22 = v21;

          float v23 = [v17 objectForKeyedSubscript:v13];
          [v23 floatValue];
          int v25 = v24;

          v26 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionCombinationWeight];
          [v26 floatValue];
          int v28 = v27;

          LODWORD(v29) = v22;
          double v30 = +[NSNumber numberWithFloat:v29];
          [v7 setObject:v30 forKey:kVTEItdsrCombinedScore];

          LODWORD(v31) = v25;
          double v32 = +[NSNumber numberWithFloat:v31];
          [v7 setObject:v32 forKey:kVTEItdsrScore];

          *(float *)&double v33 = a5;
          uint64_t v34 = +[NSNumber numberWithFloat:v33];
          [v7 setObject:v34 forKey:kVTEItdsrCombinedThreshold];

          LODWORD(v35) = v28;
          float v36 = +[NSNumber numberWithFloat:v35];
          [v7 setObject:v36 forKey:kVTEItdsrCombinationWeight];
        }
      }
    }
    uint64_t v37 = kSSRSpeakerRecognitionKnownUserSATScoresKey;
    float v38 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATScoresKey];

    if (v38)
    {
      uint64_t v39 = [v8 objectForKeyedSubscript:v37];
      v40 = v39;
      if (v39)
      {
        double v41 = [v39 objectForKeyedSubscript:v13];

        if (v41)
        {
          double v42 = [v40 objectForKeyedSubscript:v13];
          [v42 floatValue];
          int v44 = v43;

          LODWORD(v45) = v44;
          v46 = +[NSNumber numberWithFloat:v45];
          [v7 setObject:v46 forKey:kVTEIsatScore];

          *(float *)&double v47 = a5;
          double v48 = +[NSNumber numberWithFloat:v47];
          [v7 setObject:v48 forKey:kVTEIsatThreshold];
        }
      }
    }
    uint64_t v49 = kSSRSpeakerRecognitionSATAdditionalContextKey;
    v50 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionSATAdditionalContextKey];

    if (v50)
    {
      float v51 = [v8 objectForKeyedSubscript:v49];
      float v52 = [v51 objectForKeyedSubscript:kSSRSpeakerRecognitionNumSpeakerVector];
      uint64_t v53 = v52;
      if (v52)
      {
        v54 = [v52 objectForKeyedSubscript:v13];

        if (v54)
        {
          v55 = [v53 objectForKeyedSubscript:v13];
          id v56 = [v55 unsignedIntegerValue];

          float v57 = +[NSNumber numberWithUnsignedInteger:v56];
          [v7 setObject:v57 forKey:kVTEIsatNumberTrainingUtterances];
        }
      }
    }
    uint64_t v58 = kSSRSpeakerRecognitionPSRAdditionalContextKey;
    float v59 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionPSRAdditionalContextKey];

    if (v59)
    {
      v60 = [v8 objectForKeyedSubscript:v58];
      unsigned int v61 = [v60 objectForKeyedSubscript:kSSRSpeakerRecognitionNumSpeakerVector];
      uint64_t v62 = v61;
      if (v61)
      {
        v63 = [v61 objectForKeyedSubscript:v13];

        if (v63)
        {
          BOOL v64 = [v62 objectForKeyedSubscript:v13];
          id v65 = [v64 unsignedIntegerValue];

          v66 = +[NSNumber numberWithUnsignedInteger:v65];
          [v7 setObject:v66 forKey:kVTEIsatNumberTrainingUtterances];
        }
      }
    }
    uint64_t v67 = kSSRSpeakerRecognitionNumEnrollmentUtterances;
    float v68 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionNumEnrollmentUtterances];

    if (v68)
    {
      float v69 = [v8 objectForKeyedSubscript:v67];
      __int16 v70 = v69;
      if (v69)
      {
        id v71 = [v69 objectForKeyedSubscript:v13];

        if (v71)
        {
          v72 = [v70 objectForKeyedSubscript:v13];
          id v73 = [v72 unsignedIntegerValue];

          v74 = +[NSNumber numberWithUnsignedInteger:v73];
          [v7 setObject:v74 forKey:kVTEINumHSUtterances];
        }
      }
    }
    uint64_t v75 = kSSRSpeakerRecognitionKnownUserPSRExpScoresKey;
    float v76 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRExpScoresKey];

    if (v76)
    {
      v77 = [v8 objectForKeyedSubscript:v75];
      v78 = v77;
      if (v77)
      {
        v79 = [v77 objectForKeyedSubscript:v13];

        if (v79)
        {
          v80 = [v78 objectForKeyedSubscript:v13];
          [v80 floatValue];
          int v82 = v81;

          LODWORD(v83) = v82;
          v84 = +[NSNumber numberWithFloat:v83];
          [v7 setObject:v84 forKey:kVTEItriggerExplicitTDSRSatScore];
        }
      }
    }
    uint64_t v85 = kSSRSpeakerRecognitionKnownUserSATExpScoresKey;
    double v86 = [v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATExpScoresKey];

    if (v86)
    {
      unsigned int v87 = [v8 objectForKeyedSubscript:v85];
      unsigned int v88 = v87;
      if (v87)
      {
        v89 = [v87 objectForKeyedSubscript:v13];

        if (v89)
        {
          v90 = [v88 objectForKeyedSubscript:v13];
          [v90 floatValue];
          int v92 = v91;

          LODWORD(v93) = v92;
          v94 = +[NSNumber numberWithFloat:v93];
          [v7 setObject:v94 forKey:kVTEItriggerExplicitSatScore];
        }
      }
    }
  }
  else
  {
LABEL_38:
    v95 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v96 = 136315394;
      v97 = "-[CSVoiceTriggerSecondPass _addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:]";
      __int16 v98 = 2112;
      id v99 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%s ERR: No known voice profile reported in %@", (uint8_t *)&v96, 0x16u);
    }
    uint64_t v13 = 0;
  }
}

- (void)_getDidWakeAP:(id)a3
{
  self->_didWakeAP = 0;
  if (a3)
  {
    id v4 = [a3 objectForKeyedSubscript:@"trigger-woke-ap"];
    size_t v5 = v4;
    if (v4)
    {
      id v7 = v4;
      unsigned int v6 = [v4 BOOLValue];
      size_t v5 = v7;
      if (v6) {
        self->_didWakeAP = 1;
      }
    }
  }
}

- (void)_addDeviceStatusInfoToDict:(id)a3
{
  id v11 = a3;
  id v3 = [v11 objectForKeyedSubscript:kVTEItriggerStartMachTime];
  id v4 = [v3 longLongValue];

  if (v4)
  {
    size_t v5 = +[CSGestureMonitor sharedInstance];
    id v6 = [v5 isTriggerHandheld];

    id v7 = +[CSSiriAssertionMonitor sharedInstance];
    id v8 = [v7 isEnabled];

    uint64_t v9 = +[NSNumber numberWithBool:v6];
    [v11 setObject:v9 forKey:kVTEIDeviceHandHeld];

    float v10 = +[NSNumber numberWithBool:v8];
    [v11 setObject:v10 forKey:kVTEISiriIsActiveOrOtherAssertion];
  }
}

- (void)_addRejectStatsToDict:(id)a3
{
  id v12 = a3;
  +[CSUtils systemUpTime];
  double v4 = v3;
  size_t v5 = +[CSVoiceTriggerStatistics sharedInstance];
  [v5 getLastPHSRejectTime];
  double v7 = v6;

  id v8 = +[CSVoiceTriggerStatistics sharedInstance];
  id v9 = [v8 getPHSRejectCount];

  float v10 = +[NSNumber numberWithUnsignedInteger:v9];
  [v12 setObject:v10 forKey:kVTEILastConsecutivePHSRejects];

  if (v9)
  {
    id v11 = +[NSNumber numberWithDouble:v4 - v7];
    [v12 setObject:v11 forKey:kVTEIDeltaTimeFromlastPHSReject];
  }
  else
  {
    [v12 setObject:&off_10025DDC8 forKey:kVTEIDeltaTimeFromlastPHSReject];
  }
}

- (void)_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, void, unint64_t))a4;
  uint64_t v8 = mach_absolute_time();
  LODWORD(v9) = 1.5;
  id v10 = +[CSFTimeUtils secondsToHostTime:v9];
  +[CSConfig inputRecordingSampleRate];
  float v12 = v11;
  uint64_t v13 = [v6 objectForKeyedSubscript:@"trigger-time"];

  uint64_t v14 = CESRUaapData_ptr;
  if (!v13)
  {
    float v16 = (unsigned char *)(v8 - (void)v10);
    unint64_t AOPVTTriggerLength = (unint64_t)(float)(v12 * 1.5);
    int v24 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v25 = v24;
    v26 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v47 = 136315394;
    double v48 = "-[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:]";
    __int16 v49 = 2114;
    v50 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get AOP trigger-time", (uint8_t *)&v47, 0x16u);
    goto LABEL_14;
  }
  id v15 = [v6 objectForKeyedSubscript:@"trigger-time"];
  float v16 = [v15 unsignedLongLongValue];

  +[CSFTimeUtils hostTimeToSeconds:mach_absolute_time() - (void)v16];
  float v18 = v17;
  +[CSConfig inputRecordingSampleRate];
  self->_timeBasedEstimatedTriggerLength = (unint64_t)(float)(v18 * v19);
  double v20 = [v6 objectForKeyedSubscript:@"trigger-length"];
  if (v20)
  {
    int v21 = [v6 objectForKeyedSubscript:@"trigger-length"];
    p_unint64_t AOPVTTriggerLength = &self->_AOPVTTriggerLength;
    self->_unint64_t AOPVTTriggerLength = (unint64_t)[v21 unsignedLongValue];
  }
  else
  {
    p_unint64_t AOPVTTriggerLength = &self->_AOPVTTriggerLength;
    self->_unint64_t AOPVTTriggerLength = self->_timeBasedEstimatedTriggerLength;
  }

  unint64_t AOPVTTriggerLength = self->_AOPVTTriggerLength;
  config = self->_config;
  unint64_t v28 = AOPVTTriggerLength;
  if (!config)
  {
LABEL_10:
    if (v28 < 0x13881) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (([(CSVoiceTriggerSecondPassConfig *)config useTimeBasedTriggerLength] & 1) == 0)
  {
    unint64_t v28 = *p_AOPVTTriggerLength;
    goto LABEL_10;
  }
LABEL_11:
  unint64_t AOPVTTriggerLength = self->_timeBasedEstimatedTriggerLength;
LABEL_12:
  double v29 = [v6 objectForKeyedSubscript:@"trigger-config-blob"];

  if (v29)
  {
    id v30 = objc_alloc((Class)CSKeywordAnalyzerNDEAPIResult);
    double v31 = [v6 objectForKeyedSubscript:@"trigger-config-blob"];
    int v25 = [v30 initWithBlob:v31 isEarlyDetected:0];

    +[CSFTimeUtils hostTimeToSeconds:mach_absolute_time() - (void)v16];
    float v33 = v32;
    uint64_t v34 = [v25 samplesFed];
    float v35 = (float)(unint64_t)(v34 - (unsigned char *)[v25 bestStart]);
    +[CSConfig inputRecordingSampleRate];
    float v37 = v33 - (float)(v35 / v36);
    uint64_t v14 = CESRUaapData_ptr;
    v26 = +[CSVoiceTriggerStatAggregator sharedAggregator];
    *(float *)&double v38 = v37;
    [v26 logAOPFirstPassTriggerWakeupLatency:v38];
LABEL_14:

    goto LABEL_16;
  }
  uint64_t v14 = CESRUaapData_ptr;
LABEL_16:
  uint64_t v39 = [v6 objectForKeyedSubscript:@"trigger-length"];

  if (v39)
  {
    v40 = [v14[113] sharedAggregator];
    [v40 logTimeBasedTriggerLengthSampleCountStatistics:self->_timeBasedEstimatedTriggerLength withAOPVTTriggerLengthSampleCount:self->_AOPVTTriggerLength];
LABEL_18:

    goto LABEL_20;
  }
  double v42 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    v40 = v42;
    v46 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v47 = 136315394;
    double v48 = "-[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:]";
    __int16 v49 = 2114;
    v50 = v46;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get AOP trigger-length", (uint8_t *)&v47, 0x16u);

    goto LABEL_18;
  }
LABEL_20:
  *(float *)&double v41 = self->_secondPassPrependingSec;
  int v43 = +[CSFTimeUtils secondsToHostTime:v41];
  float secondPassPrependingSec = self->_secondPassPrependingSec;
  +[CSConfig inputRecordingSampleRate];
  if (v7) {
    v7[2](v7, v16 - v43, (unint64_t)(float)((float)((float)AOPVTTriggerLength + (float)(secondPassPrependingSec * v45))+ (float)self->_analyzerTrailingSamples));
  }
}

- (void)_handleVoiceTriggerFirstPassFromAOP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[CSConfig channelForProcessedInput];
  self->_activeChannel = (unint64_t)v11;
  [(CSPhraseDetector *)self->_phraseDetector setActiveChannel:v11];
  uint64_t v47 = 0;
  double v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  int v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000B0724;
  v42[3] = &unk_100250760;
  v42[4] = &v47;
  v42[5] = &v43;
  [(CSVoiceTriggerSecondPass *)self _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:v8 completion:v42];
  unint64_t v12 = v44[3];
  self->_unint64_t secondPassTimeout = v12;
  +[CSConfig inputRecordingDurationInSecs];
  float v14 = v13;
  +[CSConfig inputRecordingSampleRate];
  if ((float)(v14 * v15) < (float)v12)
  {
    float v16 = CSLogCategoryVT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v35 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      +[CSConfig inputRecordingSampleRate];
      float v38 = v37;
      +[CSConfig inputRecordingDurationInSecs];
      *(_DWORD *)buf = 136315906;
      float v52 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
      __int16 v53 = 2114;
      id v54 = v35;
      __int16 v55 = 2050;
      double v56 = (float)((float)secondPassTimeout / v38);
      __int16 v57 = 2050;
      double v58 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the max size of %{public}.2fs, set to max size", buf, 0x2Au);
    }
    +[CSConfig inputRecordingDurationInSecs];
    float v18 = v17;
    +[CSConfig inputRecordingSampleRate];
    self->_unint64_t secondPassTimeout = (unint64_t)(float)(v18 * v19);
  }
  double v20 = CSLogCategoryVT;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [(CSVoiceTriggerSecondPass *)self UUID];
    unint64_t v22 = self->_secondPassTimeout;
    +[CSConfig inputRecordingSampleRate];
    *(_DWORD *)buf = 136315906;
    float v52 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
    __int16 v53 = 2114;
    id v54 = v21;
    __int16 v55 = 2050;
    double v56 = *(double *)&v22;
    __int16 v57 = 2050;
    double v58 = (float)((float)v22 / v23);
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs)", buf, 0x2Au);
  }
  if (CSIsIOS() && (+[CSUtils isDarwinOS] & 1) == 0) {
    unsigned int v24 = +[CSUtils supportZeroFilter:](CSUtils, "supportZeroFilter:", +[CSConfig inputRecordingNumberOfChannels]) ^ 1;
  }
  else {
    unsigned int v24 = 0;
  }
  int v25 = +[CSFPreferences sharedPreferences];
  unsigned int v26 = [v25 programmableAudioInjectionEnabled];

  if (v24 & ~v26)
  {
    int v27 = CSLogCategoryVT;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v28 = [(CSVoiceTriggerSecondPass *)self UUID];
      *(_DWORD *)buf = 136315394;
      float v52 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
      __int16 v53 = 2114;
      id v54 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Using zero filter for AOP trigger", buf, 0x16u);
    }
    double v29 = (CSVoiceTriggerAwareZeroFilter *)objc_alloc_init((Class)CSVoiceTriggerAwareZeroFilter);
    zeroFilter = self->_zeroFilter;
    self->_zeroFilter = v29;

    [(CSVoiceTriggerAwareZeroFilter *)self->_zeroFilter setDelegate:self];
    double v31 = self->_zeroFilter;
    +[CSConfig inputRecordingSampleRate];
    -[CSVoiceTriggerAwareZeroFilter resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:](v31, "resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:", 1, 0);
  }
  id v32 = objc_alloc_init((Class)CSAudioStartStreamOption);
  [v32 setRequestHistoricalAudioDataWithHostTime:1];
  [v32 setStartRecordingHostTime:v48[3]];
  [v32 setStartAlertBehavior:0];
  [v32 setStopAlertBehavior:0];
  [v32 setErrorAlertBehavior:0];
  float v33 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000B0740;
  v40[3] = &unk_100253100;
  id v34 = v10;
  id v41 = v34;
  [(CSVoiceTriggerSecondPass *)self _requestStartAudioStreamWitContext:v33 audioProviderUUID:v9 startStreamOption:v32 completion:v40];
  [(CSVoiceTriggerSecondPass *)self setResultCompletion:v34];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B0848;
  v5[3] = &unk_100253AB8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(queue, v5);
}

- (void)_resetUpTime
{
  self->_cumulativeUptime = 0.0;
  self->_cumulativeDowntime = 0.0;
  double v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = v3;
    size_t v5 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v6 = 136315394;
    double v7 = "-[CSVoiceTriggerSecondPass _resetUpTime]";
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:VoiceTrigger uptime/downtime reset", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_logUptimeWithVTSwitchChanged:(BOOL)a3 VTEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[CSUtils systemUpTime];
  double v8 = v7;
  double lastAggTime = self->_lastAggTime;
  if (lastAggTime > 0.0)
  {
    double v10 = v8 - lastAggTime;
    if (v5)
    {
      if (v4)
      {
        self->_cumulativeDowntime = v10 + self->_cumulativeDowntime;
        id v11 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v12 = v11;
          float v13 = [(CSVoiceTriggerSecondPass *)self UUID];
          int v16 = 136315650;
          float v17 = "-[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:]";
          __int16 v18 = 2114;
          float v19 = v13;
          __int16 v20 = 2050;
          double v21 = v10;
          float v14 = "%s CSVoiceTriggerSecondPass[%{public}@]:VT switch toggled: VoiceTrigger has been INACTIVE for an interva"
                "l of %{public}5.3f seconds.";
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x20u);
        }
      }
      else
      {
        self->_cumulativeUptime = v10 + self->_cumulativeUptime;
        float v15 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v12 = v15;
          float v13 = [(CSVoiceTriggerSecondPass *)self UUID];
          int v16 = 136315650;
          float v17 = "-[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:]";
          __int16 v18 = 2114;
          float v19 = v13;
          __int16 v20 = 2050;
          double v21 = v10;
          float v14 = "%s CSVoiceTriggerSecondPass[%{public}@]:VT switch toggled: VoiceTrigger has been ACTIVE for an interval "
                "of %{public}5.3f seconds.";
          goto LABEL_10;
        }
      }
    }
    else if (v4)
    {
      self->_cumulativeUptime = v10 + self->_cumulativeUptime;
    }
    else
    {
      self->_cumulativeDowntime = v10 + self->_cumulativeDowntime;
    }
  }
  self->_double lastAggTime = v8;
}

- (void)_reportDiagnosticsForDelayedVTLaunchIfNeeded:(float)a3
{
  if (a3 > 20.0)
  {
    BOOL v5 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      double v7 = v5;
      double v8 = [(CSVoiceTriggerSecondPass *)self _getAudioTimeConverter];
      id v9 = [v8 description];
      int v10 = 136315650;
      id v11 = "-[CSVoiceTriggerSecondPass _reportDiagnosticsForDelayedVTLaunchIfNeeded:]";
      __int16 v12 = 2048;
      double v13 = a3;
      __int16 v14 = 2112;
      float v15 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Report unexpectedly long launch latency %{publlic}.3f AudioTimeConverter: %@", (uint8_t *)&v10, 0x20u);
    }
    int v6 = +[CSDiagnosticReporter sharedInstance];
    [v6 submitVoiceTriggerIssueReport:kCSDiagnosticReporterVoiceTriggerLaunchDelayTooHigh];
  }
}

- (void)_handleSecondPassSuccess:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    double v7 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v61 = 136315394;
    uint64_t v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
    __int16 v63 = 2114;
    BOOL v64 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v61, 0x16u);
  }
  [(CSVoiceTriggerSecondPass *)self _reportModelProcessingLatency];
  uint64_t v8 = mach_absolute_time();
  id v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    id v11 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v61 = 136315650;
    uint64_t v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
    __int16 v63 = 2114;
    BOOL v64 = v11;
    __int16 v65 = 2048;
    double v66 = *(double *)&v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Marking SecondPassTriggerMachAbsoluteTime: %llu", (uint8_t *)&v61, 0x20u);
  }
  self->_secondPassHasMadeDecision = 1;
  kdebug_trace();
  id v12 = [v4 mutableCopy];
  double v13 = +[NSNumber numberWithUnsignedLongLong:v8];
  [v12 setObject:v13 forKey:kVTEItriggerFireMachTime];

  __int16 v14 = [v4 objectForKeyedSubscript:kVTEITriggeredPhId];
  id v15 = [v14 unsignedIntegerValue];

  int v16 = [(CSVoiceTriggerSecondPass *)self config];
  float v17 = [v16 phraseConfigs];
  id v18 = [v17 count];

  float v19 = 0;
  if (v18 > v15)
  {
    __int16 v20 = [(CSVoiceTriggerSecondPass *)self config];
    double v21 = [v20 phraseConfigs];
    float v19 = [v21 objectAtIndex:v15];

    if (v19)
    {
      [v19 twoShotFeedbackDelay];
      unint64_t v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      uint64_t v23 = kVTEItwoShotAudibleFeedbackDelay;
      [v12 setObject:v22 forKey:kVTEItwoShotAudibleFeedbackDelay];

      if (self->_firstPassSource == 7)
      {
        [v19 remoraTwoShotFeedbackDelay];
        unsigned int v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [v12 setObject:v24 forKey:v23];
      }
    }
  }
  [(CSPhraseNDEAPIScorer *)self->_phraseNDEAPIScorer currentShadowMicScore];
  int v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v12 setObject:v25 forKey:kVTEIShadowMicScore];

  [(CSPhraseNDEAPIScorer *)self->_phraseNDEAPIScorer shadowMicScoreThresholdForVAD];
  unsigned int v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v12 setObject:v26 forKey:kVTEIShadowMicScoreThresholdForVAD];

  [(CSVoiceTriggerSecondPass *)self _addDeviceStatusInfoToDict:v12];
  id v27 = v12;

  [(CSVoiceTriggerSecondPass *)self _resetUpTime];
  [(CSVoiceTriggerAwareZeroFilter *)self->_zeroFilter flush];
  [(CSVoiceTriggerSecondPass *)self _didStopAudioStream];
  [(CSVoiceTriggerSecondPass *)self _handleResultCompletion:1 voiceTriggerInfo:v27 isSecondChanceCandidate:0 error:0];
  unint64_t v28 = [(CSVoiceTriggerSecondPass *)self audioStream];

  if (v28)
  {
    double v29 = [(CSVoiceTriggerSecondPass *)self audioStream];
    [v29 stopAudioStreamWithOption:0 completion:0];
  }
  else
  {
    id v30 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v61 = 136315138;
      uint64_t v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s audioStream not existing", (uint8_t *)&v61, 0xCu);
    }
  }
  double v31 = +[CSVoiceTriggerDataCollector sharedInstance];
  [v31 addVTAcceptEntryAndSubmit:v27];

  uint64_t v32 = kVTEItriggerEndMachTime;
  float v33 = [v27 objectForKeyedSubscript:kVTEItriggerEndMachTime];

  if (v33)
  {
    os_signpost_id_t v34 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    id v35 = CSLogContextFacilityCoreSpeech;
    float v36 = v35;
    if (v34 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      float v39 = CSLogContextFacilityCoreSpeech;
    }
    else
    {
      if (os_signpost_enabled(v35))
      {
        float v37 = [v27 objectForKeyedSubscript:v32];
        float v38 = (const char *)[v37 unsignedLongLongValue];
        int v61 = 134349570;
        uint64_t v62 = v38;
        __int16 v63 = 2080;
        BOOL v64 = "SiriX";
        __int16 v65 = 2080;
        double v66 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "VoiceTriggerLatency", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v61, 0x20u);
      }
      float v39 = CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v39))
      {
        int v61 = 134349570;
        uint64_t v62 = (const char *)v8;
        __int16 v63 = 2080;
        BOOL v64 = "SiriX";
        __int16 v65 = 2080;
        double v66 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, v34, "VoiceTriggerLatency", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v61, 0x20u);
      }
    }

    v40 = [v27 objectForKeyedSubscript:v32];
    id v41 = (const char *)(v8 - (void)[v40 unsignedLongValue]);

    double v42 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = v42;
      +[CSFTimeUtils hostTimeToSeconds:v41];
      int v61 = 136315650;
      uint64_t v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
      __int16 v63 = 2048;
      BOOL v64 = v41;
      __int16 v65 = 2048;
      double v66 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s Reporting VT Latency: %lu, %.3f seconds", (uint8_t *)&v61, 0x20u);
    }
    uint64_t v45 = [v27 objectForKeyedSubscript:v32];
    uint64_t v46 = (const char *)[v45 unsignedLongValue];

    +[CSFTimeUtils hostTimeToSeconds:v41];
    -[CSVoiceTriggerSecondPass _reportDiagnosticsForDelayedVTLaunchIfNeeded:](self, "_reportDiagnosticsForDelayedVTLaunchIfNeeded:");
    unint64_t firstPassFireHostTime = self->_firstPassFireHostTime;
    if (firstPassFireHostTime)
    {
      double v48 = &v46[-firstPassFireHostTime];
      if ((unint64_t)v46 >= firstPassFireHostTime)
      {
        id v54 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v55 = v54;
          +[CSFTimeUtils hostTimeToSeconds:v48];
          int v61 = 136315650;
          uint64_t v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
          __int16 v63 = 2048;
          BOOL v64 = v48;
          __int16 v65 = 2048;
          double v66 = v56;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s Reporting First Pass fire ahead: %lu, %.3f seconds", (uint8_t *)&v61, 0x20u);
        }
      }
      else
      {
        os_signpost_id_t v49 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
        uint64_t v50 = CSLogContextFacilityCoreSpeech;
        float v51 = v50;
        if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          float v52 = CSLogContextFacilityCoreSpeech;
        }
        else
        {
          if (os_signpost_enabled(v50))
          {
            int v61 = 134349570;
            uint64_t v62 = v46;
            __int16 v63 = 2080;
            BOOL v64 = "SiriX";
            __int16 v65 = 2080;
            double v66 = COERCE_DOUBLE("enableTelemetry=YES");
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "firstPassReportFireLatency", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v61, 0x20u);
          }

          float v52 = CSLogContextFacilityCoreSpeech;
          if (os_signpost_enabled(v52))
          {
            unint64_t v53 = self->_firstPassFireHostTime;
            int v61 = 134349570;
            uint64_t v62 = (const char *)v53;
            __int16 v63 = 2080;
            BOOL v64 = "SiriX";
            __int16 v65 = 2080;
            double v66 = COERCE_DOUBLE("enableTelemetry=YES");
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, v49, "firstPassReportFireLatency", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v61, 0x20u);
          }
        }

        __int16 v57 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          double v58 = (const char *)(self->_firstPassFireHostTime - (void)v46);
          float v59 = v57;
          +[CSFTimeUtils hostTimeToSeconds:v58];
          int v61 = 136315650;
          uint64_t v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
          __int16 v63 = 2048;
          BOOL v64 = v58;
          __int16 v65 = 2048;
          double v66 = v60;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%s Reporting First Pass fire delay: %lu, %.3f seconds", (uint8_t *)&v61, 0x20u);
        }
      }
    }
  }
}

- (void)_reportModelProcessingLatency
{
  double v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = [(CSVoiceTriggerSecondPass *)self UUID];
    unint64_t secondPassCheckerExecutionTime = self->_secondPassCheckerExecutionTime;
    +[CSFTimeUtils hostTimeToSeconds:secondPassCheckerExecutionTime];
    double v8 = v7;
    id v9 = [(SSRSpeakerRecognitionController *)self->_speakerRecognitionController getPSRProcessingTime];
    +[CSFTimeUtils hostTimeToSeconds:[(SSRSpeakerRecognitionController *)self->_speakerRecognitionController getPSRProcessingTime]];
    int v11 = 136316418;
    id v12 = "-[CSVoiceTriggerSecondPass _reportModelProcessingLatency]";
    __int16 v13 = 2114;
    __int16 v14 = v5;
    __int16 v15 = 2048;
    unint64_t v16 = secondPassCheckerExecutionTime;
    __int16 v17 = 2048;
    double v18 = v8;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2048;
    double v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:secondPassChecker processing time: %lu, %.3f seconds\n speakerRecognition processing time: %lu, %.3f seconds", (uint8_t *)&v11, 0x3Eu);
  }
}

- (void)voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:(id)a3 bestStartSampleCount:(unint64_t)a4 bestEndSampleCount:(unint64_t)a5
{
  float v6 = (float)(a5 - a4);
  float secondPassPrependingSec = self->_secondPassPrependingSec;
  +[CSConfig inputRecordingSampleRate];
  self->_unint64_t secondPassTimeout = (unint64_t)(float)((float)(v6 + (float)(secondPassPrependingSec * v8))
                                                     + (float)self->_analyzerTrailingSamples);
  id v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    float v10 = v9;
    int v11 = [(CSVoiceTriggerSecondPass *)self UUID];
    unint64_t secondPassTimeout = self->_secondPassTimeout;
    float v13 = self->_secondPassPrependingSec;
    +[CSConfig inputRecordingSampleRate];
    unint64_t analyzerTrailingSamples = self->_analyzerTrailingSamples;
    int v16 = 136316162;
    __int16 v17 = "-[CSVoiceTriggerSecondPass voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:bestStartSampleCount:bestEndSampleCount:]";
    __int16 v18 = 2114;
    __int16 v19 = v11;
    __int16 v20 = 1026;
    int v21 = secondPassTimeout;
    __int16 v22 = 1026;
    int v23 = (int)(float)(v13 * v14);
    __int16 v24 = 1026;
    int v25 = analyzerTrailingSamples;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Setting unint64_t secondPassTimeout = %{public}d, PrependingSamples = %{public}d, analyzerTrailingSamples = %{public}d", (uint8_t *)&v16, 0x28u);
  }
}

- (void)_analyzeForChannel:(unint64_t)a3 keywordDetectorResult:(id)a4 losingPhraseResults:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [v7 decision];
  if (v9)
  {
    id v10 = v9;
    if (v9 == (id)1)
    {
      id v11 = [v7 phId];
      id v12 = [(CSVoiceTriggerSecondPassConfig *)self->_config phraseConfigs];
      id v13 = [v12 count];

      float v14 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315394;
        uint64_t v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
        __int16 v33 = 2048;
        id v34 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Asset config supports %lu phrase(s)", (uint8_t *)&v31, 0x16u);
      }
      BOOL v15 = (unint64_t)v13 <= 1 || !self->_supportsMph;
      if (!v15 || !v11)
      {
        __int16 v17 = [(CSVoiceTriggerSecondPass *)self _getVoiceTriggerInfoWithKeywordDetectorResult:v7];
        [(CSVoiceTriggerSecondPass *)self _addLosingPhraseResultstoVTEI:v17 withLosingPhraseResults:v8];
        [(CSPhraseDetector *)self->_phraseDetector reset];
        speakerRecognitionController = self->_speakerRecognitionController;
        if (speakerRecognitionController)
        {
          if (!self->_isPSRAudioFlushed)
          {
            [(SSRSpeakerRecognitionController *)speakerRecognitionController endAudio];
            self->_isPSRAudioFlushed = 1;
            speakerRecognitionController = self->_speakerRecognitionController;
          }
          int v23 = [(SSRSpeakerRecognitionController *)speakerRecognitionController getLatestSpeakerInfo];
          __int16 v24 = [v23 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey];

          if (v24)
          {
            -[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:](self, "_handlePHSResults:voiceTriggerEventInfo:forPhId:", v23, v17, [v7 phId]);
          }
          else
          {
            unint64_t v28 = (void *)CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              double v29 = v28;
              id v30 = [(CSVoiceTriggerSecondPass *)self UUID];
              int v31 = 136315394;
              uint64_t v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
              __int16 v33 = 2114;
              id v34 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Scores not available, ignoring for now !", (uint8_t *)&v31, 0x16u);
            }
            [(CSVoiceTriggerSecondPass *)self _handleSecondPassSuccess:v17];
          }

          goto LABEL_32;
        }
        if (!+[CSUtils supportRemoraVoiceTrigger]
          || (os_unfair_lock_lock(&self->_secondpassTriggerCancellationLock),
              BOOL cancelSecondPassTrigger = self->_cancelSecondPassTrigger,
              self->_BOOL cancelSecondPassTrigger = 0,
              os_unfair_lock_unlock(&self->_secondpassTriggerCancellationLock),
              !cancelSecondPassTrigger))
        {
          id v27 = +[CSVoiceTriggerStatistics sharedInstance];
          [v27 resetPHSRejectCount];

          [(CSVoiceTriggerSecondPass *)self _handleSecondPassSuccess:v17];
          goto LABEL_32;
        }
        [(CSPhraseDetector *)self->_phraseDetector reset];
        self->_unint64_t secondPassTimeout = 0;
        id v18 = [v7 isSecondChanceCandidate];
        __int16 v19 = self;
        __int16 v20 = v17;
        uint64_t v21 = 6;
        goto LABEL_23;
      }
      int v16 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315138;
        uint64_t v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Report as rejection since the detected phId is not the default", (uint8_t *)&v31, 0xCu);
      }
      __int16 v17 = [(CSVoiceTriggerSecondPass *)self _getVoiceTriggerInfoWithKeywordDetectorResult:v7];
      [(CSVoiceTriggerSecondPass *)self _addLosingPhraseResultstoVTEI:v17 withLosingPhraseResults:v8];
    }
    else
    {
      __int16 v17 = [(CSVoiceTriggerSecondPass *)self _getVoiceTriggerInfoWithKeywordDetectorResult:v7];
      [(CSVoiceTriggerSecondPass *)self _addLosingPhraseResultstoVTEI:v17 withLosingPhraseResults:v8];
      if (v10 == (id)2)
      {
        [(CSPhraseDetector *)self->_phraseDetector reset];
        int v25 = +[CSVoiceTriggerDataCollector sharedInstance];
        [v25 addVTRejectEntry:v17 truncateData:1];

        id v18 = [v7 isSecondChanceCandidate];
        __int16 v19 = self;
        __int16 v20 = v17;
        uint64_t v21 = 3;
        goto LABEL_23;
      }
      if (v10 != (id)3)
      {
LABEL_32:
        [(CSVoiceTriggerSecondPass *)self _resetVoiceTriggerLatencyMetrics];

        goto LABEL_33;
      }
    }
    [(CSPhraseDetector *)self->_phraseDetector reset];
    self->_unint64_t secondPassTimeout = 0;
    id v18 = [v7 isSecondChanceCandidate];
    __int16 v19 = self;
    __int16 v20 = v17;
    uint64_t v21 = 2;
LABEL_23:
    [(CSVoiceTriggerSecondPass *)v19 _notifySecondPassReject:v20 result:v21 isSecondChanceCandidate:v18];
    goto LABEL_32;
  }
LABEL_33:
}

- (void)_setKeywordDetectorStartMachTime:(unint64_t)a3 detectorEndMachTime:(unint64_t)a4 lastAudioPacketAnalyzedMachTime:(unint64_t)a5
{
  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (secondPassLatencyMetrics)
  {
    [(CSVTSecondPassLatencyMetrics *)secondPassLatencyMetrics setSecondPassCheckerModelKeywordDetectionStartTime:a3];
    [(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics setSecondPassCheckerModelKeywordDetectionEndTime:a4];
    id v9 = self->_secondPassLatencyMetrics;
    [(CSVTSecondPassLatencyMetrics *)v9 setSecondPassLastAudioPacketReceptionTime:a5];
  }
  else
  {
    id v10 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSVoiceTriggerSecondPass _setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s nil second pass metrics instance", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_addLosingPhraseResultstoVTEI:(id)a3 withLosingPhraseResults:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  float v6 = +[NSMutableArray array];
  if ([v5 count] != (id)-1)
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = +[NSDictionary dictionary];
      [v6 addObject:v8];

      ++v7;
    }
    while (v7 < (unint64_t)[v5 count] + 1);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = kVTEIrecognizerScore;
    uint64_t v13 = kVTEItriggerScore;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v15)
        {
          int v16 = +[NSMutableDictionary dictionary];
          [v15 recognizerScore];
          __int16 v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          [v16 setObject:v17 forKey:v12];

          [v15 combinedScore];
          id v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          [v16 setObject:v18 forKey:v13];

          id v19 = [v16 copy];
          objc_msgSend(v6, "setObject:atIndexedSubscript:", v19, objc_msgSend(v15, "phId"));
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  if ([v6 count])
  {
    id v20 = [v6 copy];
    [v21 setObject:v20 forKey:kVTEILosingPhraseScores];
  }
}

- (id)_getVoiceTriggerInfoWithKeywordDetectorResult:(id)a3
{
  id v4 = a3;
  id v144 = [v4 phId];
  v148 = [(CSPhraseDetector *)self->_phraseDetector phraseDetectorInfoFromPhId:v144];
  v133 = [v148 phraseConfig];
  id v5 = [v4 ndapiResult];
  [v4 combinedScore];
  int v141 = v6;
  unint64_t v7 = (char *)[v5 samplesFed];
  v139 = v7;
  id v8 = (char *)[v5 bestStart];
  id v9 = [v5 bestEnd];
  id v10 = (char *)[v5 samplesAtFire] + self->_processedSampleCountsInPending;
  v137 = v10;
  v147 = v5;
  id v11 = [v5 startSampleCount];
  unint64_t v138 = self->_numAnalyzedSamples + self->_secondPassAnalyzerStartSampleCount;
  if (self->_extraSamplesAtStart >= (unint64_t)v8) {
    unint64_t extraSamplesAtStart = (unint64_t)v8;
  }
  else {
    unint64_t extraSamplesAtStart = self->_extraSamplesAtStart;
  }
  unint64_t v140 = extraSamplesAtStart;
  uint64_t v13 = &v8[-extraSamplesAtStart];
  unint64_t v14 = v9 - &v8[-extraSamplesAtStart];
  BOOL v15 = v13;
  float v16 = (float)v14;
  +[CSConfig inputRecordingSampleRate];
  double v18 = (float)(v16 / v17);
  +[CSConfig inputRecordingSampleRate];
  double v20 = (float)((float)(unint64_t)(v10 - v15) / v19);
  id v21 = [(CSVoiceTriggerSecondPass *)self _getAudioTimeConverter];
  v135 = v15;
  id v142 = [v21 hostTimeFromSampleCount:v15];

  __int16 v22 = [(CSVoiceTriggerSecondPass *)self _getAudioTimeConverter];
  v136 = v9;
  id v143 = [v22 hostTimeFromSampleCount:v9];

  long long v23 = +[CSBatteryMonitor sharedInstance];
  BOOL v149 = [v23 batteryState] == 2;

  [(CSVoiceTriggerSecondPass *)self _logUptimeWithVTSwitchChanged:0 VTEnabled:1];
  v134 = +[NSNumber numberWithDouble:self->_cumulativeUptime];
  v131 = +[NSNumber numberWithDouble:self->_cumulativeDowntime];
  +[CSUtils systemUpTime];
  double v25 = v24;
  long long v26 = &v7[(void)v11];
  +[CSConfig inputRecordingSampleRate];
  double v28 = (float)((float)(unint64_t)(v26 - v15) / v27);
  +[CSConfig inputRecordingSampleRate];
  double v30 = v25 - v28;
  double v31 = v25 - (float)((float)(unint64_t)(v26 - v9) / v29);
  uint64_t v32 = [(CSVoiceTriggerSecondPassConfig *)self->_config configPathNDAPI];
  __int16 v33 = (void *)v32;
  if (v32) {
    id v34 = (__CFString *)v32;
  }
  else {
    id v34 = @"n/a";
  }
  id v35 = v34;

  uint64_t v36 = [(CSAsset *)self->_currentAsset hashFromResourcePath];
  float v37 = (void *)v36;
  if (v36) {
    float v38 = (__CFString *)v36;
  }
  else {
    float v38 = @"n/a";
  }
  float v39 = v38;

  uint64_t v40 = [(CSVoiceTriggerSecondPass *)self _fetchSiriLocale];
  CSMachAbsoluteTimeGetTimeInterval();
  double v42 = v41;
  float secondPassAnalyzerStartSampleCount = (float)self->_secondPassAnalyzerStartSampleCount;
  [v133 preTriggerSilenceOffset];
  float v45 = v44;
  +[CSConfig inputRecordingSampleRate];
  unint64_t v132 = (unint64_t)(float)(secondPassAnalyzerStartSampleCount + (float)(v45 * v46));
  uint64_t v47 = +[NSMutableDictionary dictionary];
  double v48 = [(CSAsset *)self->_currentAsset configVersion];
  [v47 setObject:v48 forKey:kVTEIconfigVersion];

  os_signpost_id_t v49 = +[CSUtils deviceBuildVersion];
  [v47 setObject:v49 forKey:kVTEIbuildVersion];

  v146 = v35;
  [v47 setObject:v35 forKey:kVTEIconfigPath];
  [v47 setObject:v39 forKey:kVTEIConfigDataHash];

  uint64_t v50 = +[NSNumber numberWithBool:v149];
  [v47 setObject:v50 forKey:kVTEIOnBatteryPower];

  float v51 = +[NSNumber numberWithBool:self->_didWakeAP];
  [v47 setObject:v51 forKey:kVTEIDidWakeAP];

  [v47 setObject:&__kCFBooleanFalse forKey:kVTEISatBeingTrained];
  float v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isSecondChance]);
  [v47 setObject:v52 forKey:kVTEIisSecondChance];

  v145 = (void *)v40;
  [v47 setObject:v40 forKey:kVTEILanguageCode];
  +[CSConfig inputRecordingSampleRate];
  unint64_t v53 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v47 setObject:v53 forKey:kVTEIhardwareSamplerate];

  id v54 = +[NSNumber numberWithUnsignedLongLong:v132];
  [v47 setObject:v54 forKey:kVTEIclientStartSampleCount];

  __int16 v55 = +[NSNumber numberWithUnsignedInteger:v135];
  [v47 setObject:v55 forKey:kVTEItriggerStartSampleCount];

  float v56 = +[NSNumber numberWithUnsignedInteger:v136];
  [v47 setObject:v56 forKey:kVTEItriggerEndSampleCount];

  __int16 v57 = +[NSNumber numberWithUnsignedInteger:v137];
  [v47 setObject:v57 forKey:kVTEItriggerFireSampleCount];

  double v58 = +[NSNumber numberWithUnsignedLongLong:self->_secondPassAnalyzerStartSampleCount];
  [v47 setObject:v58 forKey:kVTEIsecondPassAnalyzerStartSampleCount];

  float v59 = +[NSNumber numberWithUnsignedInteger:v138];
  [v47 setObject:v59 forKey:kVTEIsecondPassAnalyzerEndSampleCount];

  [v47 setObject:&off_10025E438 forKey:kVTEItriggerStartSeconds];
  float v60 = +[NSNumber numberWithDouble:v18];
  [v47 setObject:v60 forKey:kVTEItriggerEndSeconds];

  int v61 = +[NSNumber numberWithDouble:v20];
  [v47 setObject:v61 forKey:kVTEItriggerFireSeconds];

  uint64_t v62 = +[NSNumber numberWithDouble:v30];
  [v47 setObject:v62 forKey:kVTEItriggerStartTime];

  __int16 v63 = +[NSNumber numberWithDouble:v31];
  [v47 setObject:v63 forKey:kVTEItriggerEndTime];

  BOOL v64 = +[NSNumber numberWithDouble:v31 - v30];
  [v47 setObject:v64 forKey:kVTEItriggerDuration];

  __int16 v65 = +[NSNumber numberWithDouble:v25];
  [v47 setObject:v65 forKey:kVTEItriggerFiredTime];

  double v66 = +[NSNumber numberWithUnsignedInteger:v139];
  [v47 setObject:v66 forKey:kVTEItotalSamplesAtEndOfCapture];

  uint64_t v67 = +[NSNumber numberWithUnsignedInteger:v135];
  [v47 setObject:v67 forKey:kVTEItotalSamplesAtTriggerStart];

  float v68 = +[NSNumber numberWithUnsignedInteger:v136];
  [v47 setObject:v68 forKey:kVTEItotalSamplesAtTriggerEnd];

  [v134 doubleValue];
  float v69 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v47 setObject:v69 forKey:kVTEIVTuptime];

  [v131 doubleValue];
  __int16 v70 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v47 setObject:v70 forKey:kVTEIVTdowntime];

  id v71 = +[NSNumber numberWithDouble:v42];
  [v47 setObject:v71 forKey:kVTEIearlyDetectFiredTime];

  LODWORD(v72) = v141;
  id v73 = +[NSNumber numberWithFloat:v72];
  [v47 setObject:v73 forKey:kVTEItriggerScore];

  v74 = +[NSNumber numberWithUnsignedInteger:v140];
  [v47 setObject:v74 forKey:kVTEIextraSamplesAtStart];

  uint64_t v75 = +[NSNumber numberWithUnsignedInteger:self->_analyzerPrependingSamples];
  [v47 setObject:v75 forKey:kVTEIanalyzerPrependingSamples];

  float v76 = +[NSNumber numberWithUnsignedInteger:self->_analyzerTrailingSamples];
  uint64_t v77 = kVTEIanalyzerTrailingSamples;
  [v47 setObject:v76 forKey:kVTEIanalyzerTrailingSamples];

  [v148 effectiveKeywordThreshold];
  v78 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v47 setObject:v78 forKey:kVTEIeffectiveThreshold];

  [v148 effectiveKeywordThreshold];
  v79 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v47 setObject:v79 forKey:kVTEIthreshold];

  v80 = +[NSNumber numberWithUnsignedLongLong:self->_earlyDetectFiredMachTime];
  [v47 setObject:v80 forKey:kVTEIearlyDetectFiredMachTime];

  int v81 = +[NSNumber numberWithUnsignedLongLong:v142];
  [v47 setObject:v81 forKey:kVTEItriggerStartMachTime];

  int v82 = +[NSNumber numberWithUnsignedLongLong:v143];
  [v47 setObject:v82 forKey:kVTEItriggerEndMachTime];

  [v47 setObject:&__kCFBooleanFalse forKey:kVTEIisContinuous];
  double v83 = +[NSNumber numberWithUnsignedInteger:v144];
  [v47 setObject:v83 forKey:kVTEITriggeredPhId];

  v84 = [v133 name];

  if (v84)
  {
    uint64_t v85 = [v133 name];
    [v47 setObject:v85 forKey:kVTEITriggeredPh];
  }
  unsigned int v86 = [(CSVoiceTriggerSecondPass *)self _shouldRequestSingleChannelFromAudioProvider];
  uint64_t v87 = 224;
  if (v86) {
    uint64_t v87 = 232;
  }
  unsigned int v88 = +[NSNumber numberWithUnsignedInteger:*(Class *)((char *)&self->super.isa + v87)];
  [v47 setObject:v88 forKey:kVTEIactiveChannel];

  [v134 doubleValue];
  v89 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v47 setObject:v89 forKey:kVTEIuptime];

  [v131 doubleValue];
  v90 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v47 setObject:v90 forKey:kVTEIdowntime];

  if ([v4 isRunningQuasar])
  {
    [v4 recognizerScore];
    int v91 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v47 setObject:v91 forKey:kVTEIrecognizerScore];

    [v133 recognizerScoreOffset];
    int v92 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v47 setObject:v92 forKey:kVTEIrecognizerThresholdOffset];

    [v133 recognizerScoreScaleFactor];
    double v93 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v47 setObject:v93 forKey:kVTEIrecognizerScaleFactor];
  }
  if (CSIsHorseman())
  {
    if (self->_firstPassChannelSelectionScores)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v47 setObject:self->_firstPassChannelSelectionScores forKey:kVTEIfirstPassChannelSelectionScores];
      }
    }
    v94 = +[NSNumber numberWithUnsignedInteger:self->_firstPassTriggerStartSampleCount];
    [v47 setObject:v94 forKey:kVTEIfirstPassStartSampleCount];

    v95 = +[NSNumber numberWithUnsignedInteger:self->_firstPassTriggerFireSampleCount];
    [v47 setObject:v95 forKey:kVTEIfirstPassFireSampleCount];

    *(float *)&double v96 = self->_firstPassChannelSelectionDelaySeconds;
    v97 = +[NSNumber numberWithFloat:v96];
    [v47 setObject:v97 forKey:kVTEIfirstPassChannelSelectionDelaySeconds];

    *(float *)&double v98 = self->_firstPassMasterChannelScoreBoost;
    id v99 = +[NSNumber numberWithFloat:v98];
    [v47 setObject:v99 forKey:kVTEIfirstPassMasterChannelScoreBoost];

    v100 = +[NSNumber numberWithUnsignedInteger:self->_firstPassOnsetChannel];
    [v47 setObject:v100 forKey:kVTEIfirstPassOnsetChannel];

    *(float *)&double v101 = self->_firstPassOnsetScore;
    double v102 = +[NSNumber numberWithFloat:v101];
    [v47 setObject:v102 forKey:kVTEIfirstPassOnsetScore];
  }
  __int16 v103 = [(CSVoiceTriggerSecondPass *)self _getFirstPassTriggerSourceAsString:self->_firstPassSource];
  [v47 setObject:v103 forKey:kVTEIfirstPassTriggerSource];

  firstpassMetrics = self->_firstpassMetrics;
  if (firstpassMetrics)
  {
    __int16 v105 = [(CSVoiceTriggerFirstPassMetrics *)firstpassMetrics firstPassInfoGeneratedTime];
    [v47 setObject:v105 forKey:kVTEIFirstPassInfoGeneratedTime];

    unsigned int v106 = [(CSVoiceTriggerFirstPassMetrics *)self->_firstpassMetrics firstPassInfoProcessedTime];
    [v47 setObject:v106 forKey:kVTEIFirstPassInfoProcessedTime];
  }
  unsigned int v107 = +[CSUtils supportJarvisVoiceTrigger];
  unint64_t firstPassSource = self->_firstPassSource;
  if (v107 && firstPassSource == 4)
  {
    +[CSConfig inputRecordingSampleRate];
    double v110 = +[NSNumber numberWithUnsignedInteger:(unint64_t)(float)(v109 * 0.5)];
    [v47 setObject:v110 forKey:v77];

    unint64_t firstPassSource = self->_firstPassSource;
  }
  if ([(CSVoiceTriggerSecondPass *)self _shouldLogMediaplayState:firstPassSource])
  {
    int64_t mediaPlayingState = self->_mediaPlayingState;
    double v112 = +[NSNumber numberWithBool:mediaPlayingState == 1];
    [v47 setObject:v112 forKey:kVTEIisMediaPlaying];

    if (mediaPlayingState == 1)
    {
      *(float *)&double v113 = self->_mediaVolume;
      double v114 = +[NSNumber numberWithFloat:v113];
      [v47 setObject:v114 forKey:kVTEImediaVolume];
    }
  }
  __int16 v115 = [(CSVoiceTriggerSecondPass *)self audioProviderUUID];

  if (v115)
  {
    double v116 = [(CSVoiceTriggerSecondPass *)self audioProviderUUID];
    [v47 setObject:v116 forKey:kVTEIAudioProviderUUID];
  }
  v117 = +[NSUUID UUID];
  v118 = [v117 UUIDString];
  [v47 setObject:v118 forKey:kVTEISelfLoggingUUID];

  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (secondPassLatencyMetrics)
  {
    v120 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)secondPassLatencyMetrics secondPassAssetQueryStartTime]]);
    [v47 setObject:v120 forKey:kVTEISecondPassAssetQueryStartTime];

    v121 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassAssetQueryCompleteTime]]);
    [v47 setObject:v121 forKey:kVTEISecondPassAssetQueryCompleteTime];

    v122 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassAssetLoadStartTime]]);
    [v47 setObject:v122 forKey:kVTEISecondPassAssetLoadStartTime];

    v123 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassAssetLoadCompleteTime]]);
    [v47 setObject:v123 forKey:kVTEISecondPassAssetLoadCompleteTime];

    v124 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassAudioStreamStartTime]]);
    [v47 setObject:v124 forKey:kVTEISecondPassAudioStreamStartTime];

    v125 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassAudioStreamReadyTime]]);
    [v47 setObject:v125 forKey:kVTEISecondPassAudioStreamReadyTime];

    v126 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassFirstAudioPacketReceptionTime]]);
    [v47 setObject:v126 forKey:kVTEISecondPassFirstAudioPacketReceptionTime];

    v127 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassLastAudioPacketReceptionTime]]);
    [v47 setObject:v127 forKey:kVTEISecondPassLastAudioPacketReceptionTime];

    v128 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassCheckerModelKeywordDetectionStartTime]]);
    [v47 setObject:v128 forKey:kVTEISecondPassCheckerModelKeywordDetectionStartTime];

    v129 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", +[CSFTimeUtils hostTimeToNs:[(CSVTSecondPassLatencyMetrics *)self->_secondPassLatencyMetrics secondPassCheckerModelKeywordDetectionEndTime]]);
    [v47 setObject:v129 forKey:kVTEISecondPassCheckerModelKeywordDetectionEndTime];
  }
  return v47;
}

- (id)_runRecognizersWithChunk:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = mach_absolute_time();
  int v6 = [(CSPhraseDetector *)self->_phraseDetector getAnalyzedResultFromAudioChunk:v4];
  self->_secondPassCheckerExecutionTime += mach_absolute_time() - v5;
  [(CSPhraseNDEAPIScorer *)self->_phraseNDEAPIScorer processAudioChunk:v4 activeChannel:self->_activeChannel];
  if (self->_speakerRecognitionController)
  {
    unint64_t v7 = [v4 dataForChannel:self->_activeChannel];
    if (+[CSConfig inputRecordingIsFloat])
    {
      id v8 = [v4 dataForChannel:self->_activeChannel];
      uint64_t v9 = +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:v8];

      unint64_t v7 = (void *)v9;
    }
    -[SSRSpeakerRecognitionController processAudio:withNumberOfSamples:](self->_speakerRecognitionController, "processAudio:withNumberOfSamples:", v7, [v4 numSamples]);
  }
  return v6;
}

- (void)_handleAudioChunk:(id)a3 shouldPreprocessedByZeroFilter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentAsset)
  {
    if (self->_secondPassHasMadeDecision)
    {
      unint64_t v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        uint64_t v9 = [(CSVoiceTriggerSecondPass *)self UUID];
        int v38 = 136315394;
        float v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
        __int16 v40 = 2114;
        double v41 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:second pass has made decision, skip processing", (uint8_t *)&v38, 0x16u);
LABEL_5:

LABEL_13:
      }
    }
    else
    {
      if (v4)
      {
        unint64_t v11 = qword_1002A38A8;
        if (!(v11 % +[CSUtils loggingHeartbeatRate]))
        {
          uint64_t v12 = (void *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = v12;
            unint64_t v14 = [(CSVoiceTriggerSecondPass *)self UUID];
            int v38 = 136315394;
            float v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
            __int16 v40 = 2114;
            double v41 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Preprocessing through zero-filter for this trigger event", (uint8_t *)&v38, 0x16u);
          }
        }
        ++qword_1002A38A8;
        zeroFilter = self->_zeroFilter;
        id v8 = [v6 dataForChannel:0];
        -[CSVoiceTriggerAwareZeroFilter processBuffer:atTime:](zeroFilter, "processBuffer:atTime:", v8, [v6 hostTime]);
        goto LABEL_13;
      }
      if (!self->_numProcessedSamples)
      {
        float v16 = [(CSVoiceTriggerSecondPass *)self _voiceTriggerSecondPassLatencyMetrics];
        [v16 setSecondPassFirstAudioPacketReceptionTime:mach_absolute_time()];
      }
      -[CSVoiceTriggerSecondPass _setStartAnalyzeTime:](self, "_setStartAnalyzeTime:", [v6 startSampleCount]);
      unint64_t numProcessedSamples = self->_numProcessedSamples;
      double v18 = (char *)[v6 numSamples] + numProcessedSamples;
      uint64_t v19 = mach_absolute_time();
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      if ((unint64_t)v18 >= secondPassTimeout)
      {
        unint64_t v25 = self->_numProcessedSamples;
        unint64_t v26 = secondPassTimeout - v25;
        if ((uint64_t)(secondPassTimeout - v25) >= 1)
        {
          float v27 = [v6 subChunkFrom:0 numSamples:secondPassTimeout - v25];
          id v28 = [(CSVoiceTriggerSecondPass *)self _runRecognizersWithChunk:v27];
          self->_numAnalyzedSamples += v26;
          audioFileWriter = self->_audioFileWriter;
          id v30 = [v27 data];
          -[CSPlainAudioFileWriter addSamples:numSamples:](audioFileWriter, "addSamples:numSamples:", [v30 bytes], objc_msgSend(v27, "numSamples"));
        }
        self->_processedSampleCountsInPending += (unint64_t)[v6 numSamples] - v26;
        double v31 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = v31;
          __int16 v33 = [(CSVoiceTriggerSecondPass *)self UUID];
          unint64_t v34 = self->_secondPassTimeout;
          int v38 = 136315650;
          float v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
          __int16 v40 = 2114;
          double v41 = v33;
          __int16 v42 = 2050;
          unint64_t v43 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Stop feeding audio at sampleCount: %{public}tu", (uint8_t *)&v38, 0x20u);
        }
        speakerRecognitionController = self->_speakerRecognitionController;
        if (speakerRecognitionController)
        {
          [(SSRSpeakerRecognitionController *)speakerRecognitionController endAudio];
          self->_isPSRAudioFlushed = 1;
        }
        uint64_t v36 = mach_absolute_time();
        id v21 = [(CSPhraseDetector *)self->_phraseDetector getAnalyzedResultFromFlushedAudio];
        self->_secondPassCheckerExecutionTime += mach_absolute_time() - v36;
        float v37 = -[CSPhraseDetector getLosingPhraseResultsWithDetectedPhId:](self->_phraseDetector, "getLosingPhraseResultsWithDetectedPhId:", [v21 phId]);
        [(CSVoiceTriggerSecondPass *)self _setKeywordDetectorStartMachTime:v19 detectorEndMachTime:mach_absolute_time() lastAudioPacketAnalyzedMachTime:v19];
        [(CSVoiceTriggerSecondPass *)self _analyzeForChannel:self->_activeChannel keywordDetectorResult:v21 losingPhraseResults:v37];
      }
      else
      {
        id v21 = [(CSVoiceTriggerSecondPass *)self _runRecognizersWithChunk:v6];
        __int16 v22 = -[CSPhraseDetector getLosingPhraseResultsWithDetectedPhId:](self->_phraseDetector, "getLosingPhraseResultsWithDetectedPhId:", [v21 phId]);
        [(CSVoiceTriggerSecondPass *)self _setKeywordDetectorStartMachTime:v19 detectorEndMachTime:mach_absolute_time() lastAudioPacketAnalyzedMachTime:v19];
        [(CSVoiceTriggerSecondPass *)self _analyzeForChannel:self->_activeChannel keywordDetectorResult:v21 losingPhraseResults:v22];
        self->_numAnalyzedSamples += (unint64_t)[v6 numSamples];
        long long v23 = self->_audioFileWriter;
        id v24 = [v6 data];
        -[CSPlainAudioFileWriter addSamples:numSamples:](v23, "addSamples:numSamples:", [v24 bytes], objc_msgSend(v6, "numSamples"));

        self->_numProcessedSamples += (unint64_t)[v6 numSamples];
      }
    }
  }
  else
  {
    id v10 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      id v8 = v10;
      uint64_t v9 = [(CSVoiceTriggerSecondPass *)self UUID];
      int v38 = 136315394;
      float v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
      __int16 v40 = 2114;
      double v41 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Could not find Assets. Cannot process Audio", (uint8_t *)&v38, 0x16u);
      goto LABEL_5;
    }
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B3A04;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_processSecondPassInExclave:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_secondPassHasMadeDecision)
  {
    id v6 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(CSVoiceTriggerSecondPass *)self UUID];
      *(_DWORD *)buf = 136315394;
      BOOL v15 = "-[CSVoiceTriggerSecondPass _processSecondPassInExclave:]";
      __int16 v16 = 2114;
      float v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:second pass has made decision, skip processing", buf, 0x16u);
    }
  }
  else
  {
    BOOL v9 = self->_numAnalyzedSamples >= self->_secondPassTimeout;
    exclaveClient = self->_exclaveClient;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B3D58;
    v11[3] = &unk_100250850;
    v11[4] = self;
    id v12 = v4;
    BOOL v13 = v9;
    [(CSExclaveSecondPassVoiceTriggerAnalyzing *)exclaveClient processSecondPassVoiceTriggerWithShouldFlushAudio:v9 result:v11];
  }
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B4154;
  v15[3] = &unk_100250828;
  v15[4] = self;
  v15[5] = a7;
  BOOL v9 = objc_retainBlock(v15);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B4D18;
  block[3] = &unk_100251130;
  id v13 = v9;
  unint64_t v14 = a7;
  void block[4] = self;
  unint64_t v11 = v9;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    unint64_t v11 = "-[CSVoiceTriggerSecondPass audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B4E8C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_didStopAudioStream
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v6 = 136315394;
    id v7 = "-[CSVoiceTriggerSecondPass _didStopAudioStream]";
    __int16 v8 = 2114;
    BOOL v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v6, 0x16u);
  }
  kdebug_trace();
  [(CSPhraseDetector *)self->_phraseDetector reset];
  [(CSVoiceTriggerSecondPass *)self _clearTriggerCandidate];
  [(SSRSpeakerRecognitionController *)self->_speakerRecognitionController endAudio];
  [(CSPlainAudioFileWriter *)self->_audioFileWriter endAudio];
}

- (void)_didStartAudioStream:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    id v7 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v8 = 136315394;
    BOOL v9 = "-[CSVoiceTriggerSecondPass _didStartAudioStream:]";
    __int16 v10 = 2114;
    unint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v8, 0x16u);
  }
  kdebug_trace();
  if (!a3)
  {
    [(CSPhraseDetector *)self->_phraseDetector reset];
    [(CSVoiceTriggerSecondPass *)self _clearTriggerCandidate];
    [(CSPlainAudioFileWriter *)self->_audioFileWriter endAudio];
    [(SSRSpeakerRecognitionController *)self->_speakerRecognitionController endAudio];
  }
}

- (void)_prepareStartAudioStream
{
  double v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v14 = 136315394;
    BOOL v15 = "-[CSVoiceTriggerSecondPass _prepareStartAudioStream]";
    __int16 v16 = 2114;
    float v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v14, 0x16u);
  }
  int v6 = +[CSFPreferences sharedPreferences];
  unsigned int v7 = [v6 secondPassAudioLoggingEnabled];

  if (v7)
  {
    if (self->_firstPassSource == 7) {
      firstPassDeviceId = self->_firstPassDeviceId;
    }
    else {
      firstPassDeviceId = 0;
    }
    BOOL v9 = +[CSVoiceTriggerSecondPass secondPassAudioLoggingFilePathWithDeviceId:firstPassDeviceId];
    id v10 = objc_alloc((Class)CSPlainAudioFileWriter);
    unint64_t v11 = +[NSURL URLWithString:v9];
    __int16 v12 = (CSPlainAudioFileWriter *)[v10 initWithURL:v11];
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v12;
  }
  else
  {
    BOOL v9 = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }
}

- (void)_notifySecondPassReject:(id)a3 result:(unint64_t)a4 isSecondChanceCandidate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    unint64_t v11 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    float v29 = "-[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]";
    __int16 v30 = 2114;
    double v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", buf, 0x16u);
  }
  id v12 = [v8 mutableCopy];
  [(CSVoiceTriggerSecondPass *)self _addDeviceStatusInfoToDict:v12];
  id v13 = [(NSUUID *)self->_secondPassRejectionMHUUID UUIDString];
  [v12 setObject:v13 forKey:kVTEISecondPassRejectionMHUUID];

  id v14 = v12;
  [(CSVoiceTriggerSecondPass *)self _reportModelProcessingLatency];
  self->_secondPassHasMadeDecision = 1;
  BOOL v15 = [(CSVoiceTriggerSecondPass *)self audioStream];

  if (v15)
  {
    __int16 v16 = [(CSVoiceTriggerSecondPass *)self audioStream];
    double v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    __int16 v22 = sub_1000B5520;
    long long v23 = &unk_100250800;
    id v24 = self;
    unint64_t v26 = a4;
    id v25 = v14;
    BOOL v27 = v5;
    [v16 stopAudioStreamWithOption:0 completion:&v20];
  }
  else
  {
    float v17 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v29 = "-[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s audioStream not existing", buf, 0xCu);
    }
    [(CSVoiceTriggerSecondPass *)self _handleResultCompletion:a4 voiceTriggerInfo:v14 isSecondChanceCandidate:v5 error:0];
  }
  if (CSIsInternalBuild())
  {
    if (a4 == 9) {
      uint64_t v18 = 4705;
    }
    else {
      uint64_t v18 = 4704;
    }
    -[CSVoiceTriggerSecondPass _logRejectionEventToSELF:result:](self, "_logRejectionEventToSELF:result:", v14, a4, v20, v21, v22, v23, v24);
    uint64_t v19 = +[AFAnalytics sharedAnalytics];
    [v19 logEventWithType:v18 context:v14];
  }
}

- (void)_logRejectionEventToSELF:(id)a3 result:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v7 = v6;
  if (!self->_hasLoggedSecondPass)
  {
    id v13 = v6;
    int v8 = CSIsInternalBuild();
    unsigned int v7 = v13;
    if (v8)
    {
      storedFirstPassInfo = self->_storedFirstPassInfo;
      id v10 = [(CSVoiceTriggerSecondPass *)self _getFirstPassTriggerSourceAsString:self->_firstPassSource];
      [(NSMutableDictionary *)storedFirstPassInfo setObject:v10 forKey:kVTEIfirstPassTriggerSource];

      unint64_t v11 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
      [v11 logStartEventWithFirstPassStartedInfo:self->_storedFirstPassInfo withMHUUID:self->_secondPassRejectionMHUUID];

      id v12 = +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger];
      [v12 logRejectEventWithVTEI:v13 withMHUUID:self->_secondPassRejectionMHUUID withSecondPassResult:a4];

      unsigned int v7 = v13;
      self->_hasLoggedSecondPass = 1;
    }
  }
}

- (void)_voiceTriggerFirstPassDidDetectKeywordFrom:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (unint64_t)[v6 firstPassSource];
  BOOL v9 = [v6 deviceId];
  id v10 = [v6 audioProviderUUID];
  unint64_t v11 = [v6 firstPassTriggerInfo];
  unsigned __int8 v38 = [v6 isSecondChanceRun];
  self->_unint64_t firstPassFireHostTime = 0;
  uint64_t v12 = kVTEIFirstPassFireHostTime;
  id v13 = [(NSUUID *)v11 objectForKeyedSubscript:kVTEIFirstPassFireHostTime];

  if (v13)
  {
    id v14 = [(NSUUID *)v11 objectForKeyedSubscript:v12];
    self->_unint64_t firstPassFireHostTime = (unint64_t)[v14 unsignedLongValue];
  }
  BOOL v15 = CSLogCategoryVT;
  if ((!v11 || !v8) && os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v50 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
    __int16 v51 = 2050;
    unint64_t v52 = v8;
    __int16 v53 = 2114;
    id v54 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s There are nils in starting second pass with firstPassSource: %{public}lu firstPassInfo: %{public}@", buf, 0x20u);
    BOOL v15 = CSLogCategoryVT;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = v15;
    float v17 = [(CSVoiceTriggerSecondPass *)self UUID];
    secondPassRejectionMHUUID = self->_secondPassRejectionMHUUID;
    *(_DWORD *)buf = 136315650;
    uint64_t v50 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
    __int16 v51 = 2114;
    unint64_t v52 = (unint64_t)v17;
    __int16 v53 = 2112;
    id v54 = secondPassRejectionMHUUID;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass generated mhUUID for rejections: %@", buf, 0x20u);
  }
  if (v8 != 4)
  {
    uint64_t v19 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = v19;
      uint64_t v21 = [(CSVoiceTriggerSecondPass *)self UUID];
      *(_DWORD *)buf = 136315394;
      uint64_t v50 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
      __int16 v51 = 2114;
      unint64_t v52 = (unint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Sending early detect notification upon first pass trigger", buf, 0x16u);
    }
    self->_earlyDetectFiredMachTime = mach_absolute_time();
  }
  if ([(CSVoiceTriggerSecondPass *)self _isBuiltInFirstPassSource:v8]) {
    notify_post("com.apple.voicetrigger.builtin.EarlyDetect");
  }
  __int16 v22 = &off_1001AC000;
  if (v8 != 4)
  {
    kdebug_trace();
    if (v8 <= 0xC)
    {
      if (((1 << v8) & 0x1B06) != 0) {
        goto LABEL_23;
      }
      if (v8 == 5) {
        goto LABEL_36;
      }
    }
  }
  if (![(CSVoiceTriggerSecondPass *)self _isFirstPassSourceExclave:v8])
  {
    if (v8 != 3)
    {
      if (v8 == 7)
      {
        long long v23 = +[CSSiriLauncher sharedLauncher];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1000B5EA8;
        v47[3] = &unk_1002531E0;
        v47[4] = self;
        [v23 notifyRemoraVoiceTriggerPrewarm:v11 deviceId:v9 completion:v47];
        goto LABEL_35;
      }
      if (v8 != 6) {
        goto LABEL_36;
      }
    }
    long long v23 = +[CSSiriLauncher sharedLauncher];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000B5D1C;
    v48[3] = &unk_1002531E0;
    v48[4] = self;
    [v23 notifyBluetoothDeviceVoiceTriggerPrewarm:v11 deviceId:v9 completion:v48];
LABEL_35:

    goto LABEL_36;
  }
LABEL_23:
  id v24 = +[CSFPreferences sharedPreferences];
  if (([v24 useSiriActivationSPIForHomePod] & 1) == 0)
  {
    unsigned __int8 v25 = +[CSUtils isLocalVoiceTriggerAvailable];

    if (v25) {
      goto LABEL_26;
    }
    notify_post("com.apple.voicetrigger.EarlyDetect");
    float v29 = (void *)CSLogCategoryVT;
    __int16 v22 = &off_1001AC000;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    long long v23 = v29;
    __int16 v30 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    uint64_t v50 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
    __int16 v51 = 2114;
    unint64_t v52 = (unint64_t)v30;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Use legacy early detection notification", buf, 0x16u);

    __int16 v22 = &off_1001AC000;
    goto LABEL_35;
  }

LABEL_26:
  unsigned int v26 = [(CSVoiceTriggerSecondPass *)self _isFirstPassSourceExclave:v8];
  BOOL v27 = +[CSSiriLauncher sharedLauncher];
  id v28 = v27;
  if (v26) {
    [v27 notifyBuiltInVoiceTriggerPrewarmExclave:v11 completion:0];
  }
  else {
    [v27 notifyBuiltInVoiceTriggerPrewarm:v11 completion:0];
  }

  __int16 v22 = &off_1001AC000;
LABEL_36:
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v22 + 160);
  block[2] = sub_1000B5FE4;
  block[3] = &unk_1002507B0;
  void block[4] = self;
  __int16 v40 = v11;
  id v44 = v7;
  unint64_t v45 = v8;
  id v41 = v6;
  id v42 = v9;
  unsigned __int8 v46 = v38;
  id v43 = v10;
  id v32 = v10;
  id v33 = v9;
  id v34 = v7;
  id v35 = v6;
  uint64_t v36 = v11;
  dispatch_async(queue, block);
  float v37 = +[CSVoiceTriggerStatistics sharedInstance];
  [v37 incrementFirstPassTriggerCount];
}

- (BOOL)_isBuiltInFirstPassSource:(unint64_t)a3
{
  return a3 == 5 || a3 - 1 < 2 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 8 || a3 - 11 < 2;
}

- (void)cancelCurrentRequest
{
  double v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    BOOL v9 = "-[CSVoiceTriggerSecondPass cancelCurrentRequest]";
    __int16 v10 = 2114;
    unint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Cancel VoiceTrigger second pass request has received", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B68B8;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)forceCancelSecondPassTrigger
{
  p_secondpassTriggerCancellationLock = &self->_secondpassTriggerCancellationLock;
  os_unfair_lock_lock(&self->_secondpassTriggerCancellationLock);
  self->_BOOL cancelSecondPassTrigger = 1;
  os_unfair_lock_unlock(p_secondpassTriggerCancellationLock);
}

- (void)handleVoiceTriggerSecondPassFrom:(id)a3 completion:(id)a4
{
}

- (void)_handleVoiceTriggerFirstPassFromJarvis:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7
{
  id v59 = a4;
  id v58 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))a7;
  if (a3 != 4)
  {
    id v14 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      if (!v13) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    unint64_t v52 = v14;
    __int16 v53 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    __int16 v63 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    __int16 v64 = 2114;
    __int16 v65 = v53;
    _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Jarvis", buf, 0x16u);

    if (v13)
    {
LABEL_4:
      BOOL v15 = [[CSVoiceTriggerSecondPassResultHolder alloc] initWithResult:4 voiceTriggerEventInfo:0 isSecondChanceCandidate:0];
      __int16 v16 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
      v13[2](v13, v15, v16);
    }
  }
LABEL_5:
  float v17 = [v12 objectForKeyedSubscript:kVTEIfirstPassDetectedChannel];
  self->_unint64_t activeChannel = (unint64_t)[v17 unsignedIntegerValue];

  [(CSPhraseDetector *)self->_phraseDetector setActiveChannel:self->_activeChannel];
  uint64_t v18 = [v12 objectForKeyedSubscript:kVTEIearlyDetectFiredMachTime];
  self->_earlyDetectFiredMachTime = (unint64_t)[v18 unsignedLongLongValue];

  uint64_t v19 = [v12 objectForKeyedSubscript:kVTEIfirstPassStartSampleCount];
  self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v19 unsignedIntegerValue];

  double v20 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    __int16 v22 = [(CSVoiceTriggerSecondPass *)self UUID];
    unint64_t activeChannel = self->_activeChannel;
    unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    *(_DWORD *)buf = 136315906;
    __int16 v63 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    __int16 v64 = 2114;
    __int16 v65 = v22;
    __int16 v66 = 2050;
    double v67 = *(double *)&activeChannel;
    __int16 v68 = 2050;
    double v69 = *(double *)&firstPassTriggerStartSampleCount;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass Jarvis triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);
  }
  unint64_t v25 = self->_firstPassTriggerStartSampleCount;
  if (self->_analyzerPrependingSamples >= v25) {
    unint64_t analyzerPrependingSamples = self->_firstPassTriggerStartSampleCount;
  }
  else {
    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
  }
  unint64_t v27 = v25 - analyzerPrependingSamples;
  +[CSConfig inputRecordingSampleRate];
  unint64_t v29 = (unint64_t)(float)(v28 * 0.5);
  __int16 v30 = [v12 objectForKeyedSubscript:kVTEIfirstPassEndSampleCount];
  double v31 = (char *)[v30 unsignedIntegerValue] + v29;

  self->_float secondPassTimeout = (unint64_t)&v31[-v27];
  +[CSConfig inputRecordingDurationInSecs];
  float v33 = v32;
  +[CSConfig inputRecordingSampleRate];
  if ((float)(v33 * v34) < (float)(unint64_t)&v31[-v27])
  {
    id v35 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      log = v35;
      float v56 = [(CSVoiceTriggerSecondPass *)self UUID];
      float secondPassTimeout = (float)self->_secondPassTimeout;
      +[CSConfig inputRecordingSampleRate];
      *(_DWORD *)buf = 136315650;
      __int16 v63 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      __int16 v64 = 2114;
      __int16 v65 = v56;
      __int16 v66 = 2050;
      double v67 = (float)(secondPassTimeout / v55);
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);
    }
    +[CSConfig inputRecordingDurationInSecs];
    float v37 = v36;
    +[CSConfig inputRecordingSampleRate];
    self->_float secondPassTimeout = (unint64_t)(float)(v37 * v38);
  }
  float v39 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v40 = v39;
    id v41 = [(CSVoiceTriggerSecondPass *)self UUID];
    unint64_t v42 = v29;
    unint64_t v43 = analyzerPrependingSamples;
    id v44 = v12;
    unint64_t v45 = v13;
    unint64_t v46 = self->_secondPassTimeout;
    float v47 = (float)v46;
    +[CSConfig inputRecordingSampleRate];
    *(_DWORD *)buf = 136316930;
    __int16 v63 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    __int16 v64 = 2114;
    __int16 v65 = v41;
    __int16 v66 = 2050;
    double v67 = *(double *)&v46;
    id v13 = v45;
    id v12 = v44;
    __int16 v68 = 2050;
    double v69 = (float)(v47 / v48);
    __int16 v70 = 2050;
    unint64_t v71 = v27;
    __int16 v72 = 2050;
    id v73 = v31;
    __int16 v74 = 2050;
    unint64_t v75 = v43;
    __int16 v76 = 2050;
    unint64_t v77 = v42;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{public}tu to %{public}tu, with prepending samples %{public}tu, trailing samples %{public}tu", buf, 0x52u);
  }
  os_signpost_id_t v49 = +[CSAudioRecordContext contextForJarvisWithDeviceId:v59];
  uint64_t v50 = +[CSAudioStartStreamOption noAlertOption];
  [v50 setRequestHistoricalAudioDataSampleCount:1];
  [v50 setStartRecordingSampleCount:v27];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1000B7128;
  v60[3] = &unk_100253100;
  int v61 = v13;
  __int16 v51 = v13;
  [(CSVoiceTriggerSecondPass *)self _requestStartAudioStreamWitContext:v49 audioProviderUUID:v58 startStreamOption:v50 completion:v60];
  [(CSVoiceTriggerSecondPass *)self setResultCompletion:v51];
}

- (void)_handleVoiceTriggerFirstPassFromHearstAP:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (a3 == 6)
  {
    id v48 = v15;
    id v49 = v14;
    self->_unint64_t activeChannel = 0;
    [(CSPhraseDetector *)self->_phraseDetector setActiveChannel:0];
    +[CSConfig inputRecordingSampleRate];
    self->_unint64_t secondPassTimeout = (unint64_t)(float)(v19 + v19);
    double v20 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v20;
      __int16 v22 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      *(_DWORD *)buf = 136315650;
      __int16 v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo"
            ":rtModelRequestOptions:completion:]";
      __int16 v54 = 2114;
      float v55 = v22;
      __int16 v56 = 1026;
      LODWORD(v57) = secondPassTimeout;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Setting second pass timeout for hearst : %{public}d", buf, 0x1Cu);
    }
    id v24 = [CSPhraseNDEAPIScorer alloc];
    currentAsset = self->_currentAsset;
    config = self->_config;
    unint64_t firstPassSource = self->_firstPassSource;
    unint64_t activeChannel = self->_activeChannel;
    unint64_t v29 = [(CSVoiceTriggerSecondPass *)self _fetchSiriLocale];
    __int16 v30 = [(CSPhraseNDEAPIScorer *)v24 initWithAsset:currentAsset assetConfig:config firstPassSource:firstPassSource activeChannel:activeChannel siriLanguage:v29 shouldEnableShadowMicScore:0 rtmodelRequestOptions:v17];
    phraseNDEAPIScorer = self->_phraseNDEAPIScorer;
    self->_phraseNDEAPIScorer = v30;

    float v32 = [v16 objectForKeyedSubscript:kVTEIfirstPassStartSampleCount];
    self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v32 unsignedIntegerValue];

    float v33 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v34 = v33;
      id v35 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t v36 = self->_activeChannel;
      unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      __int16 v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo"
            ":rtModelRequestOptions:completion:]";
      __int16 v54 = 2114;
      float v55 = v35;
      __int16 v56 = 2050;
      unint64_t v57 = v36;
      __int16 v58 = 2050;
      unint64_t v59 = firstPassTriggerStartSampleCount;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);
    }
    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
    unint64_t v39 = self->_firstPassTriggerStartSampleCount;
    BOOL v40 = v39 >= analyzerPrependingSamples;
    unint64_t v41 = v39 - analyzerPrependingSamples;
    if (v40) {
      unint64_t v42 = v41;
    }
    else {
      unint64_t v42 = 0;
    }
    id v14 = v49;
    unint64_t v43 = +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:v49];
    id v44 = +[CSAudioStartStreamOption noAlertOption];
    [v44 setDisableBoostForDoAP:1];
    [v44 setRequestHistoricalAudioDataSampleCount:1];
    [v44 setStartRecordingSampleCount:v42];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000B763C;
    v50[3] = &unk_100253150;
    v50[4] = self;
    id v51 = v18;
    id v15 = v48;
    [(CSVoiceTriggerSecondPass *)self _requestStartAudioStreamWitContext:v43 audioProviderUUID:v48 startStreamOption:v44 completion:v50];

    goto LABEL_13;
  }
  unint64_t v45 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    unint64_t v46 = v45;
    float v47 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    __int16 v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo:r"
          "tModelRequestOptions:completion:]";
    __int16 v54 = 2114;
    float v55 = v47;
    _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Hearst", buf, 0x16u);

    if (!v18) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v18)
  {
LABEL_12:
    unint64_t v43 = [[CSVoiceTriggerSecondPassResultHolder alloc] initWithResult:4 voiceTriggerEventInfo:0 isSecondChanceCandidate:0];
    id v44 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v18 + 2))(v18, v43, v44);
LABEL_13:
  }
LABEL_14:
}

- (void)_handleVoiceTriggerFirstPassFromRemora:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a3 == 7)
  {
    self->_unint64_t activeChannel = 0;
    [(CSPhraseDetector *)self->_phraseDetector setActiveChannel:0];
    uint64_t v74 = kVTEIfirstPassStartSampleCount;
    id v16 = objc_msgSend(v14, "objectForKeyedSubscript:");
    self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v16 unsignedIntegerValue];

    id v17 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      float v19 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t activeChannel = self->_activeChannel;
      unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      __int16 v80 = 2114;
      uint64_t v81 = (uint64_t)v19;
      __int16 v82 = 2050;
      double v83 = *(double *)&activeChannel;
      __int16 v84 = 2050;
      double v85 = *(double *)&firstPassTriggerStartSampleCount;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);
    }
    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
    unint64_t v23 = self->_firstPassTriggerStartSampleCount;
    BOOL v24 = v23 >= analyzerPrependingSamples;
    unint64_t v25 = v23 - analyzerPrependingSamples;
    if (v24) {
      unint64_t v26 = v25;
    }
    else {
      unint64_t v26 = 0;
    }
    unint64_t v27 = [v14 objectForKeyedSubscript:kVTEIfirstPassEndSampleCount];
    float v28 = (char *)[v27 unsignedIntegerValue] + self->_analyzerTrailingSamples;

    self->_float secondPassTimeout = (unint64_t)&v28[-v26];
    +[CSConfig inputRecordingDurationInSecs];
    float v30 = v29;
    +[CSConfig inputRecordingSampleRate];
    if ((float)(v30 * v31) < (float)(unint64_t)&v28[-v26])
    {
      float v32 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        __int16 v70 = v32;
        unint64_t v71 = [(CSVoiceTriggerSecondPass *)self UUID];
        float secondPassTimeout = (float)self->_secondPassTimeout;
        +[CSConfig inputRecordingSampleRate];
        *(_DWORD *)buf = 136315650;
        v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
        __int16 v80 = 2114;
        uint64_t v81 = (uint64_t)v71;
        __int16 v82 = 2050;
        double v83 = (float)(secondPassTimeout / v73);
        _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);
      }
      +[CSConfig inputRecordingDurationInSecs];
      float v34 = v33;
      +[CSConfig inputRecordingSampleRate];
      self->_float secondPassTimeout = (unint64_t)(float)(v34 * v35);
    }
    unint64_t v36 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v37 = v36;
      float v38 = [(CSVoiceTriggerSecondPass *)self UUID];
      id v39 = v13;
      id v40 = v12;
      unint64_t v41 = self->_secondPassTimeout;
      float v42 = (float)v41;
      +[CSConfig inputRecordingSampleRate];
      *(_DWORD *)buf = 136316418;
      v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      __int16 v80 = 2114;
      uint64_t v81 = (uint64_t)v38;
      __int16 v82 = 2050;
      double v83 = *(double *)&v41;
      id v12 = v40;
      id v13 = v39;
      __int16 v84 = 2050;
      double v85 = (float)(v42 / v43);
      __int16 v86 = 2050;
      unint64_t v87 = v26;
      __int16 v88 = 2050;
      v89 = v28;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{public}tu to %{public}tu", buf, 0x3Eu);
    }
    id v75 = v12;
    id v44 = +[CSAudioRecordContext contextForRemoraVoiceTriggerWithDeviceId:v12];
    unint64_t v45 = +[CSAudioStartStreamOption noAlertOption];
    [v45 setRequestHistoricalAudioDataSampleCount:1];
    [v45 setStartRecordingSampleCount:0];
    if (!v14) {
      goto LABEL_18;
    }
    uint64_t v46 = kVTEIfirstPassSampleCountFromHistoricalBuffer;
    float v47 = [v14 objectForKeyedSubscript:kVTEIfirstPassSampleCountFromHistoricalBuffer];

    if (v47)
    {
      id v48 = [v14 objectForKeyedSubscript:v46];
      unsigned int v49 = [v48 unsignedIntValue];

      +[CSConfig inputRecordingSampleRate];
      float v51 = (float)v49 / v50;
      uint64_t v52 = mach_absolute_time();
      *(float *)&double v53 = v51;
      uint64_t v54 = v52 - (void)+[CSFTimeUtils secondsToHostTime:v53];
      float v55 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        *(_DWORD *)buf = 136315906;
        v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
        __int16 v80 = 2048;
        uint64_t v81 = v52;
        __int16 v82 = 2048;
        double v83 = v51;
        __int16 v84 = 2048;
        double v85 = *(double *)&v54;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s current host:%llu delta:%f estimatedStartHostTime : %llu", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v58 = kVTEItotalSampleCount;
      uint64_t v59 = [v14 objectForKeyedSubscript:kVTEItotalSampleCount];
      if (!v59) {
        goto LABEL_18;
      }
      float v60 = (void *)v59;
      int v61 = [v14 objectForKeyedSubscript:v74];

      if (!v61) {
        goto LABEL_18;
      }
      uint64_t v62 = [v14 objectForKeyedSubscript:v58];
      unsigned int v63 = [v62 unsignedIntValue];

      __int16 v64 = [v14 objectForKeyedSubscript:v74];
      unsigned int v65 = [v64 unsignedIntValue];

      +[CSConfig inputRecordingSampleRate];
      float v51 = (float)(v63 - v65 + 8000) / v66;
      uint64_t v52 = mach_absolute_time();
      *(float *)&double v67 = v51;
      uint64_t v54 = v52 - (void)+[CSFTimeUtils secondsToHostTime:v67];
      float v55 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
    }
    [v45 setEstimatedStartHostTime:v54];
LABEL_18:
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000B7E60;
    v76[3] = &unk_100253100;
    id v56 = v15;
    id v77 = v56;
    [(CSVoiceTriggerSecondPass *)self _requestStartAudioStreamWitContext:v44 audioProviderUUID:v13 startStreamOption:v45 completion:v76];
    [(CSVoiceTriggerSecondPass *)self setResultCompletion:v56];

    id v12 = v75;
LABEL_22:

    goto LABEL_23;
  }
  unint64_t v57 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    __int16 v68 = v57;
    double v69 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    __int16 v80 = 2114;
    uint64_t v81 = (uint64_t)v69;
    _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Remora", buf, 0x16u);

    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (v15)
  {
LABEL_21:
    id v44 = [[CSVoiceTriggerSecondPassResultHolder alloc] initWithResult:4 voiceTriggerEventInfo:0 isSecondChanceCandidate:0];
    unint64_t v45 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v15 + 2))(v15, v44, v45);
    goto LABEL_22;
  }
LABEL_23:
}

- (void)_handleVoiceTriggerFirstPassFromHearst:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (a3 == 3)
  {
    id v38 = v16;
    id v39 = v14;
    self->_unint64_t activeChannel = 0;
    [(CSPhraseDetector *)self->_phraseDetector setActiveChannel:0];
    +[CSConfig inputRecordingSampleRate];
    self->_unint64_t secondPassTimeout = (unint64_t)(float)(v19 + v19);
    double v20 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v20;
      __int16 v22 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      *(_DWORD *)buf = 136315650;
      float v43 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearst:deviceId:audioProviderUUID:firstPassInfo:r"
            "tModelRequestOptions:completion:]";
      __int16 v44 = 2114;
      unint64_t v45 = v22;
      __int16 v46 = 1026;
      int v47 = secondPassTimeout;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Setting second pass timeout for hearst : %{public}d", buf, 0x1Cu);
    }
    BOOL v24 = [CSPhraseNDEAPIScorer alloc];
    currentAsset = self->_currentAsset;
    config = self->_config;
    unint64_t firstPassSource = self->_firstPassSource;
    unint64_t activeChannel = self->_activeChannel;
    float v29 = [(CSVoiceTriggerSecondPass *)self _fetchSiriLocale];
    float v30 = [(CSPhraseNDEAPIScorer *)v24 initWithAsset:currentAsset assetConfig:config firstPassSource:firstPassSource activeChannel:activeChannel siriLanguage:v29 shouldEnableShadowMicScore:1 rtmodelRequestOptions:v17];
    phraseNDEAPIScorer = self->_phraseNDEAPIScorer;
    self->_phraseNDEAPIScorer = v30;

    [(CSPhraseNDEAPIScorer *)self->_phraseNDEAPIScorer setDelegate:self];
    id v14 = v39;
    float v32 = +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:v39];
    float v33 = +[CSAudioStartStreamOption noAlertOption];
    [v33 setDisableBoostForDoAP:1];
    [v33 setRequestHistoricalAudioDataSampleCount:1];
    [v33 setStartRecordingSampleCount:0];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000B82B4;
    v40[3] = &unk_100253100;
    id v34 = v18;
    id v41 = v34;
    [(CSVoiceTriggerSecondPass *)self _requestStartAudioStreamWitContext:v32 audioProviderUUID:v15 startStreamOption:v33 completion:v40];
    [(CSVoiceTriggerSecondPass *)self setResultCompletion:v34];

    id v16 = v38;
    goto LABEL_8;
  }
  float v35 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    unint64_t v36 = v35;
    float v37 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    float v43 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearst:deviceId:audioProviderUUID:firstPassInfo:rtM"
          "odelRequestOptions:completion:]";
    __int16 v44 = 2114;
    unint64_t v45 = v37;
    _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Hearst", buf, 0x16u);

    if (!v18) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v18)
  {
LABEL_7:
    float v32 = [[CSVoiceTriggerSecondPassResultHolder alloc] initWithResult:4 voiceTriggerEventInfo:0 isSecondChanceCandidate:0];
    float v33 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v18 + 2))(v18, v32, v33);
LABEL_8:
  }
LABEL_9:
}

- (void)_handleVoiceTriggerFirstPassFromAP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = kVTEIfirstPassDetectedChannel;
  id v11 = a4;
  id v12 = [v8 objectForKeyedSubscript:v10];
  self->_unint64_t selectedChannelFromFirstPass = (unint64_t)[v12 unsignedIntegerValue];

  if ([(CSVoiceTriggerSecondPass *)self _shouldRequestSingleChannelFromAudioProvider])
  {
    unint64_t selectedChannelFromFirstPass = 0;
  }
  else
  {
    unint64_t selectedChannelFromFirstPass = self->_selectedChannelFromFirstPass;
  }
  self->_unint64_t activeChannel = selectedChannelFromFirstPass;
  -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:");
  id v14 = [v8 objectForKeyedSubscript:kVTEIfirstPassChannelSelectionScores];
  firstPassChannelSelectionScores = self->_firstPassChannelSelectionScores;
  self->_firstPassChannelSelectionScores = v14;

  id v16 = [v8 objectForKeyedSubscript:kVTEIfirstPassChannelSelectionDelaySeconds];
  [v16 floatValue];
  self->_firstPassChannelSelectionDelaySeconds = v17;

  id v18 = [v8 objectForKeyedSubscript:kVTEIfirstPassMasterChannelScoreBoost];
  [v18 floatValue];
  self->_firstPassMasterChannelScoreBoost = v19;

  double v20 = [v8 objectForKeyedSubscript:kVTEIfirstPassOnsetScore];
  [v20 floatValue];
  self->_firstPassOnsetScore = v21;

  __int16 v22 = [v8 objectForKeyedSubscript:kVTEIfirstPassOnsetChannel];
  self->_firstPassOnsetChannel = (unint64_t)[v22 unsignedIntegerValue];

  unint64_t v23 = [v8 objectForKeyedSubscript:kVTEIfirstPassStartSampleCount];
  self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v23 unsignedIntegerValue];

  BOOL v24 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v25 = v24;
    unint64_t v26 = [(CSVoiceTriggerSecondPass *)self UUID];
    unint64_t activeChannel = self->_activeChannel;
    unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    *(_DWORD *)buf = 136315906;
    int v61 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
    __int16 v62 = 2114;
    unsigned int v63 = v26;
    __int16 v64 = 2050;
    double v65 = *(double *)&activeChannel;
    __int16 v66 = 2050;
    double v67 = *(double *)&firstPassTriggerStartSampleCount;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);
  }
  unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
  unint64_t v30 = self->_firstPassTriggerStartSampleCount;
  BOOL v31 = v30 >= analyzerPrependingSamples;
  unint64_t v32 = v30 - analyzerPrependingSamples;
  if (v31) {
    unint64_t v33 = v32;
  }
  else {
    unint64_t v33 = 0;
  }
  id v34 = [v8 objectForKeyedSubscript:kVTEIfirstPassFireSampleCount];
  self->_firstPassTriggerFireSampleCount = (unint64_t)[v34 unsignedIntegerValue];

  unint64_t v35 = self->_analyzerTrailingSamples + self->_firstPassTriggerFireSampleCount;
  unint64_t v57 = v33;
  self->_float secondPassTimeout = v35 - v33;
  +[CSConfig inputRecordingDurationInSecs];
  float v37 = v36;
  +[CSConfig inputRecordingSampleRate];
  if ((float)(v37 * v38) < (float)(v35 - v33))
  {
    id v39 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      double v53 = v39;
      uint64_t v54 = [(CSVoiceTriggerSecondPass *)self UUID];
      float secondPassTimeout = (float)self->_secondPassTimeout;
      +[CSConfig inputRecordingSampleRate];
      *(_DWORD *)buf = 136315650;
      int v61 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
      __int16 v62 = 2114;
      unsigned int v63 = v54;
      __int16 v64 = 2050;
      double v65 = (float)(secondPassTimeout / v56);
      _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);
    }
    +[CSConfig inputRecordingDurationInSecs];
    float v41 = v40;
    +[CSConfig inputRecordingSampleRate];
    self->_float secondPassTimeout = (unint64_t)(float)(v41 * v42);
  }
  float v43 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v44 = v43;
    [(CSVoiceTriggerSecondPass *)self UUID];
    id v45 = v9;
    int v47 = v46 = v11;
    unint64_t v48 = self->_secondPassTimeout;
    +[CSConfig inputRecordingSampleRate];
    *(_DWORD *)buf = 136316418;
    int v61 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
    __int16 v62 = 2114;
    unsigned int v63 = v47;
    __int16 v64 = 2050;
    double v65 = *(double *)&v48;
    __int16 v66 = 2050;
    double v67 = (float)((float)v48 / v49);
    __int16 v68 = 2050;
    unint64_t v69 = v57;
    __int16 v70 = 2050;
    unint64_t v71 = v35;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{public}tu to %{public}tu", buf, 0x3Eu);

    id v11 = v46;
    id v9 = v45;
  }
  float v50 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
  float v51 = +[CSAudioStartStreamOption noAlertOption];
  if ([(CSVoiceTriggerSecondPass *)self _shouldRequestSingleChannelFromAudioProvider])
  {
    [v51 setRequireSingleChannelLookup:1];
    [v51 setSelectedChannel:LODWORD(self->_selectedChannelFromFirstPass)];
  }
  [v51 setRequestHistoricalAudioDataSampleCount:1];
  [v51 setStartRecordingSampleCount:v57];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000B88B8;
  v58[3] = &unk_100253100;
  id v59 = v9;
  id v52 = v9;
  [(CSVoiceTriggerSecondPass *)self _requestStartAudioStreamWitContext:v50 audioProviderUUID:v11 startStreamOption:v51 completion:v58];

  [(CSVoiceTriggerSecondPass *)self setResultCompletion:v52];
}

- (void)_handleVoiceTriggerFirstPassFromExclave:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:kVTEIfirstPassDetectedChannel];
  self->_unint64_t activeChannel = (unint64_t)[v11 unsignedIntegerValue];

  id v12 = +[CSAudioStartStreamOption noAlertOption];
  unint64_t firstPassSource = self->_firstPassSource;
  if (firstPassSource - 13 < 2) {
    goto LABEL_4;
  }
  if (firstPassSource == 12)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    double v58 = 0.0;
    uint64_t v53 = 0;
    uint64_t v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000B8FDC;
    v52[3] = &unk_100250760;
    v52[4] = buf;
    v52[5] = &v53;
    [(CSVoiceTriggerSecondPass *)self _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:v8 completion:v52];
    self->_unint64_t secondPassTimeout = v54[3];
    [v12 setRequestHistoricalAudioDataWithHostTime:1];
    [v12 setStartRecordingHostTime:*(void *)(*(void *)&buf[8] + 24)];
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);
LABEL_11:
    unint64_t secondPassTimeout = self->_secondPassTimeout;
    +[CSConfig inputRecordingDurationInSecs];
    float v28 = v27;
    +[CSConfig inputRecordingSampleRate];
    if ((float)(v28 * v29) < (float)secondPassTimeout)
    {
      unint64_t v30 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        float v43 = v30;
        __int16 v44 = [(CSVoiceTriggerSecondPass *)self UUID];
        unint64_t v45 = self->_secondPassTimeout;
        +[CSConfig inputRecordingSampleRate];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2050;
        double v58 = (float)((float)v45 / v46);
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);
      }
      +[CSConfig inputRecordingDurationInSecs];
      float v32 = v31;
      +[CSConfig inputRecordingSampleRate];
      self->_unint64_t secondPassTimeout = (unint64_t)(float)(v32 * v33);
    }
    id v34 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v35 = v34;
      float v36 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t v37 = self->_secondPassTimeout;
      +[CSConfig inputRecordingSampleRate];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2050;
      double v58 = *(double *)&v37;
      __int16 v59 = 2050;
      double v60 = (float)((float)v37 / v38);
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs)", buf, 0x2Au);
    }
    [(CSExclaveSecondPassVoiceTriggerAnalyzing *)self->_exclaveClient startSecondPassVoiceTriggerWithFirstPassSource:self->_firstPassSource enablePHS:[(CSVoiceTriggerSecondPass *)self _usePHS] supportMultiPhrase:self->_supportsMph activeChannel:LODWORD(self->_activeChannel)];
    id v39 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000B8FF8;
    v50[3] = &unk_100253100;
    id v40 = v10;
    id v51 = v40;
    [(CSVoiceTriggerSecondPass *)self _requestStartAudioStreamWitContext:v39 audioProviderUUID:v9 startStreamOption:v12 completion:v50];
    [(CSVoiceTriggerSecondPass *)self setResultCompletion:v40];
    float v41 = v51;
    goto LABEL_18;
  }
  if (firstPassSource == 11)
  {
LABEL_4:
    id v14 = [v8 objectForKeyedSubscript:kVTEIfirstPassStartSampleCount];
    self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v14 unsignedIntegerValue];

    id v15 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      float v17 = [(CSVoiceTriggerSecondPass *)self UUID];
      unint64_t activeChannel = self->_activeChannel;
      double v19 = *(double *)&self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2050;
      double v58 = *(double *)&activeChannel;
      __int16 v59 = 2050;
      double v60 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);
    }
    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
    unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    BOOL v22 = firstPassTriggerStartSampleCount >= analyzerPrependingSamples;
    unint64_t v23 = firstPassTriggerStartSampleCount - analyzerPrependingSamples;
    if (v22) {
      unint64_t v24 = v23;
    }
    else {
      unint64_t v24 = 0;
    }
    unint64_t v25 = [v8 objectForKeyedSubscript:kVTEIfirstPassFireSampleCount];
    self->_firstPassTriggerFireSampleCount = (unint64_t)[v25 unsignedIntegerValue];

    self->_unint64_t secondPassTimeout = self->_firstPassTriggerFireSampleCount - v24 + self->_analyzerTrailingSamples;
    [v12 setRequestHistoricalAudioDataSampleCount:1];
    [v12 setStartRecordingSampleCount:v24];
    goto LABEL_11;
  }
  float v42 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    int v47 = v42;
    unint64_t v48 = [(CSVoiceTriggerSecondPass *)self UUID];
    unint64_t v49 = self->_firstPassSource;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2050;
    double v58 = *(double *)&v49;
    _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Not valid firstPass source for Exclave : %{public}lu", buf, 0x20u);
  }
  if (v10)
  {
    id v39 = [[CSVoiceTriggerSecondPassResultHolder alloc] initWithResult:4 voiceTriggerEventInfo:0 isSecondChanceCandidate:0];
    float v41 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v10 + 2))(v10, v39, v41);
LABEL_18:
  }
}

- (void)_requestStartAudioStreamWitContext:(id)a3 audioProviderUUID:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v47 = a3;
  id v46 = a4;
  id v44 = a5;
  id v10 = a6;
  objc_initWeak(&location, self);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000B97B4;
  v53[3] = &unk_100250738;
  objc_copyWeak(&v55, &location);
  id v41 = v10;
  id v54 = v41;
  id v11 = objc_retainBlock(v53);
  id v12 = [(CSVoiceTriggerSecondPass *)self _voiceTriggerSecondPassLatencyMetrics];
  [v12 setSecondPassAudioStreamStartTime:mach_absolute_time()];

  speechManager = self->_speechManager;
  if (speechManager)
  {
    id v14 = -[CSSpeechManager audioProviderWithUUID:](speechManager, "audioProviderWithUUID:", v46, v41, &v55);
    if (!v14)
    {
      id v15 = self->_speechManager;
      id v52 = 0;
      id v14 = [(CSSpeechManager *)v15 audioProviderWithContext:v47 error:&v52];
      id v45 = v52;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v16 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  id v14 = [v16 audioProviderWithUUID:v46];

  if (v14)
  {
LABEL_5:
    id v45 = 0;
    goto LABEL_6;
  }
  float v36 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  id v51 = 0;
  id v14 = [v36 audioProviderWithContext:v47 error:&v51];
  id v45 = v51;

LABEL_6:
  float v17 = CSLogCategoryVT;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [(CSVoiceTriggerSecondPass *)self UUID];
    id v19 = [v47 deviceId];
    double v20 = [v14 UUID];
    *(_DWORD *)buf = 136315906;
    double v58 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
    __int16 v59 = 2114;
    id v60 = v18;
    __int16 v61 = 2112;
    id v62 = v19;
    __int16 v63 = 2112;
    __int16 v64 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:DeviceID : %@, audioProviderUUID : %@", buf, 0x2Au);
  }
  float v21 = [v14 UUID];
  [(CSVoiceTriggerSecondPass *)self setAudioProviderUUID:v21];

  BOOL v22 = CSLogCategoryVT;
  unint64_t v23 = v22;
  if (v14)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = [(CSVoiceTriggerSecondPass *)self UUID];
      *(_DWORD *)buf = 136315394;
      double v58 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
      __int16 v59 = 2114;
      id v60 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Start audio stream with request", buf, 0x16u);
    }
    if ([v47 isBuiltInVoiceTriggered])
    {
      id v25 = objc_alloc_init((Class)CSAudioStreamRequest);
      [v25 setClientIdentity:2];
      if ([(CSVoiceTriggerSecondPass *)self _isFirstPassSourceExclave:self->_firstPassSource])
      {
        [v25 setRequestExclaveAudio:1];
      }
    }
    else
    {
      id v25 = 0;
    }
    unint64_t v26 = (objc_class *)objc_opt_class();
    float v27 = NSStringFromClass(v26);
    id v50 = 0;
    float v28 = [v14 audioStreamWithRequest:v25 streamName:v27 error:&v50];
    id v29 = v50;

    unint64_t v30 = CSLogCategoryVT;
    float v31 = v30;
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = [(CSVoiceTriggerSecondPass *)self UUID];
        float v33 = [v28 name];
        *(_DWORD *)buf = 136315650;
        double v58 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
        __int16 v59 = 2114;
        id v60 = v32;
        __int16 v61 = 2114;
        id v62 = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Has received audio stream : %{public}@", buf, 0x20u);
      }
      [(CSVoiceTriggerSecondPass *)self setAudioStream:v28];
      id v34 = [(CSVoiceTriggerSecondPass *)self audioStream];
      [v34 setDelegate:self];

      [(CSVoiceTriggerSecondPass *)self _prepareStartAudioStream];
      unint64_t v35 = [(CSVoiceTriggerSecondPass *)self audioStream];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000B9850;
      v48[3] = &unk_100253150;
      v48[4] = self;
      unint64_t v49 = v11;
      [v35 startAudioStreamWithOption:v44 completion:v48];
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v39 = [(CSVoiceTriggerSecondPass *)self UUID];
        id v40 = [v29 localizedDescription];
        *(_DWORD *)buf = 136315650;
        double v58 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
        __int16 v59 = 2114;
        id v60 = v39;
        __int16 v61 = 2114;
        id v62 = v40;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get audio stream : %{public}@", buf, 0x20u);
      }
      ((void (*)(void *, void, id))v11[2])(v11, 0, v29);
    }
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v37 = [(CSVoiceTriggerSecondPass *)self UUID];
      float v38 = [v45 localizedDescription];
      *(_DWORD *)buf = 136315650;
      double v58 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
      __int16 v59 = 2114;
      id v60 = v37;
      __int16 v61 = 2114;
      id v62 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Getting audio stream provider has failed : %{public}@", buf, 0x20u);
    }
    ((void (*)(void *, void, id))v11[2])(v11, 0, v45);
  }

  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
}

- (void)_clearTriggerCandidate
{
  double v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = [(CSVoiceTriggerSecondPass *)self UUID];
    int v6 = 136315394;
    id v7 = "-[CSVoiceTriggerSecondPass _clearTriggerCandidate]";
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Clearing VoiceTrigger candidate in the second pass", (uint8_t *)&v6, 0x16u);
  }
  self->_hasTriggerCandidate = 0;
}

- (void)_initializeMediaPlayingState
{
  double v3 = +[CSMediaPlayingMonitor sharedInstance];
  [v3 addObserver:self];
  [v3 initializeMediaPlayingState];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B9B64;
  v6[3] = &unk_100252F58;
  v6[4] = self;
  [v3 mediaPlayingStateWithCompletion:v6];
  id v4 = +[CSVolumeMonitor sharedInstance];
  [v4 addObserver:self];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B9BD8;
  v5[3] = &unk_100250710;
  v5[4] = self;
  [v4 musicVolumeWithCompletion:v5];
}

- (BOOL)_usePHS
{
  if (!self->_shouldUsePHS || !+[CSUtils supportSAT]) {
    return 0;
  }
  currentAsset = self->_currentAsset;
  return [(CSAsset *)currentAsset containsSpeakerRecognitionCategory];
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v5)
  {
    id v34 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    BOOL v22 = v34;
    unint64_t v35 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
    __int16 v92 = 2114;
    unint64_t v93 = (unint64_t)v35;
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:asset is nil, stop initialization", buf, 0x16u);

LABEL_35:
    goto LABEL_57;
  }
  objc_storeStrong((id *)&self->_currentAsset, a3);
  int v6 = +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:self->_currentAsset forFirstPassSource:self->_firstPassSource];
  config = self->_config;
  self->_config = v6;

  [(CSVoiceTriggerSecondPassConfig *)self->_config preTriggerAudioTime];
  float v9 = v8;
  +[CSConfig inputRecordingSampleRate];
  self->_unint64_t extraSamplesAtStart = (unint64_t)(float)(v9 * v10);
  [(CSVoiceTriggerSecondPassConfig *)self->_config prependingAudioTime];
  float v12 = v11;
  +[CSConfig inputRecordingSampleRate];
  self->_unint64_t analyzerPrependingSamples = (unint64_t)(float)(v12 * v13);
  [(CSVoiceTriggerSecondPassConfig *)self->_config trailingAudioTime];
  float v15 = v14;
  +[CSConfig inputRecordingSampleRate];
  self->_unint64_t analyzerTrailingSamples = (unint64_t)(float)(v15 * v16);
  [(CSVoiceTriggerSecondPassConfig *)self->_config prependingAudioTime];
  self->_float secondPassPrependingSec = v17;
  if (!self->_phraseDetector)
  {
    id v18 = (CSPhraseDetector *)objc_alloc_init((Class)CSPhraseDetector);
    phraseDetector = self->_phraseDetector;
    self->_phraseDetector = v18;
  }
  double v20 = [(CSVoiceTriggerSecondPass *)self _voiceTriggerSecondPassLatencyMetrics];
  [v20 setSecondPassAssetLoadStartTime:mach_absolute_time()];

  [(CSPhraseDetector *)self->_phraseDetector setConfig:self->_config];
  float v21 = [(CSVoiceTriggerSecondPass *)self _voiceTriggerSecondPassLatencyMetrics];
  [v21 setSecondPassAssetLoadCompleteTime:mach_absolute_time()];

  if (!self->_firstTimeAssetConfigured)
  {
    self->_firstTimeAssetConfigured = 1;
    id v39 = self->_config;
    if (v39)
    {
      unint64_t firstPassSource = self->_firstPassSource;
      if (firstPassSource == 12 || firstPassSource == 2)
      {
        unint64_t AOPVTTriggerLength = self->_AOPVTTriggerLength;
        if (AOPVTTriggerLength)
        {
          float v42 = (float)AOPVTTriggerLength;
          float secondPassPrependingSec = self->_secondPassPrependingSec;
          +[CSConfig inputRecordingSampleRate];
          unint64_t v45 = (unint64_t)(float)((float)(v42 + (float)(secondPassPrependingSec * v44))
                                        + (float)self->_analyzerTrailingSamples);
          self->_unint64_t secondPassTimeout = v45;
          id v46 = CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
            __int16 v92 = 2048;
            unint64_t v93 = v45;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s AOP trigger length to override secondpass timeout: %lu", buf, 0x16u);
          }
          id v39 = self->_config;
        }
        if ([(CSVoiceTriggerSecondPassConfig *)v39 useTimeBasedTriggerLength])
        {
          unint64_t timeBasedEstimatedTriggerLength = self->_timeBasedEstimatedTriggerLength;
          if (timeBasedEstimatedTriggerLength)
          {
            float v48 = (float)timeBasedEstimatedTriggerLength;
            float v49 = self->_secondPassPrependingSec;
            +[CSConfig inputRecordingSampleRate];
            unint64_t v51 = (unint64_t)(float)((float)(v48 + (float)(v49 * v50)) + (float)self->_analyzerTrailingSamples);
            self->_unint64_t secondPassTimeout = v51;
            id v52 = CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
              __int16 v92 = 2048;
              unint64_t v93 = v51;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s Timebased trigger length to override secondpass timeout: %lu", buf, 0x16u);
            }
          }
        }
      }
    }
  }
  if (![(CSVoiceTriggerSecondPass *)self _usePHS])
  {
    float v36 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = v36;
      float v38 = [(CSVoiceTriggerSecondPass *)self UUID];
      *(_DWORD *)buf = 136315650;
      int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
      __int16 v92 = 2114;
      unint64_t v93 = (unint64_t)v38;
      __int16 v94 = 1026;
      LODWORD(v95) = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Not creating SAT objects: usePHS %{public}d", buf, 0x1Cu);
    }
    goto LABEL_56;
  }
  BOOL v22 = self->_currentAsset;
  uint64_t v23 = [(CSVoiceTriggerSecondPass *)self _fetchSiriLocale];
  if (!v23)
  {
    uint64_t v53 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      v79 = v53;
      __int16 v80 = [(CSVoiceTriggerSecondPass *)self UUID];
      *(_DWORD *)buf = 136315394;
      int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
      __int16 v92 = 2114;
      unint64_t v93 = (unint64_t)v80;
      _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get language code!!!", buf, 0x16u);
    }
    [(CSVoiceTriggerSecondPass *)self _reset];
    goto LABEL_35;
  }
  unint64_t v24 = (void *)v23;
  id v25 = +[SSRVoiceProfileManager sharedInstance];
  uint64_t v26 = SSRSpeakerRecognitionSiriAppDomain;
  float v27 = [v25 provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriAppDomain withLocale:v24];

  if ([v27 count])
  {
    if ((unint64_t)[v27 count] >= 2)
    {
      float v28 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        double v83 = v28;
        __int16 v84 = [(CSVoiceTriggerSecondPass *)self UUID];
        *(_DWORD *)buf = 136315906;
        int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
        __int16 v92 = 2114;
        unint64_t v93 = (unint64_t)v84;
        __int16 v94 = 2114;
        v95 = v24;
        __int16 v96 = 2114;
        v97 = v27;
        _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: More than one Siri voice profile present for %{public}@ - %{public}@, trigger cleanup", buf, 0x2Au);
      }
      id v29 = +[SSRVoiceProfileManager sharedInstance];
      [v29 triggerInvalidSiriProfileCleanupFromPersonalDevicesForLanguage:v24 appDomain:v26];
    }
    if ([v5 useSpeakerRecognitionAsset])
    {
      float v31 = +[SSRAssetManager sharedManager];
      uint64_t v32 = [v31 installedSpeakerRecognitionAssetForLanguage:v24];

      if (v32)
      {
        float v33 = CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          __int16 v92 = 2112;
          unint64_t v93 = v32;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s Found speaker recognition asset:%@", buf, 0x16u);
        }
        BOOL v22 = v32;
      }
      else
      {
        BOOL v22 = self->_currentAsset;
        uint64_t v56 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v57 = v56;
          double v58 = [(CSVoiceTriggerSecondPass *)self UUID];
          *(_DWORD *)buf = 136315394;
          int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          __int16 v92 = 2114;
          unint64_t v93 = (unint64_t)v58;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Falling back to VT-assets", buf, 0x16u);
        }
      }
    }
    v88[0] = SSRSpeakerRecognitionStyleKey;
    v88[1] = SSRSpeakerRecognitionAssetKey;
    v89[0] = &off_10025DDB0;
    v89[1] = v22;
    v88[2] = SSRSpeakerRecognitionMaxAudioDurationSecs;
    LODWORD(v30) = 2.5;
    __int16 v59 = +[NSNumber numberWithFloat:v30];
    v89[2] = v59;
    v88[3] = SSRSpeakerRecognitionProfileArrayKey;
    id v60 = [v27 objectAtIndexedSubscript:0];
    unint64_t v87 = v60;
    __int16 v61 = +[NSArray arrayWithObjects:&v87 count:1];
    v88[4] = SSRSpeakerRecognitionLocaleKey;
    v89[3] = v61;
    v89[4] = v24;
    id v62 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:5];

    id v86 = 0;
    __int16 v63 = (SSRSpeakerRecognitionContext *)[objc_alloc((Class)SSRSpeakerRecognitionContext) initWithVoiceRecognitionContext:v62 error:&v86];
    id v64 = v86;
    ssrContext = self->_ssrContext;
    self->_ssrContext = v63;

    if (!self->_ssrContext || v64)
    {
      float v73 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v74 = v73;
        id v75 = [(CSVoiceTriggerSecondPass *)self UUID];
        __int16 v76 = [v64 localizedDescription];
        *(_DWORD *)buf = 136315650;
        int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
        __int16 v92 = 2114;
        unint64_t v93 = (unint64_t)v75;
        __int16 v94 = 2112;
        v95 = v76;
        id v77 = "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to create SSR context with error %@";
LABEL_52:
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, v77, buf, 0x20u);
      }
    }
    else
    {
      id v66 = objc_alloc((Class)SSRSpeakerRecognitionController);
      double v67 = self->_ssrContext;
      id v85 = 0;
      __int16 v68 = (SSRSpeakerRecognitionController *)[v66 initWithContext:v67 withDelegate:self error:&v85];
      id v64 = v85;
      speakerRecognitionController = self->_speakerRecognitionController;
      self->_speakerRecognitionController = v68;

      if (self->_speakerRecognitionController && !v64)
      {
        __int16 v70 = [(CSVoiceTriggerSecondPassConfig *)self->_config phraseConfigs];
        unint64_t v71 = [v70 firstObject];
        [v71 speakerRejectLoggingThreshold];
        self->_phsRejectLoggingThreshold = v72;

        if (+[CSUtils isExclaveHardware]) {
          [(CSVoiceTriggerSecondPass *)self _syncVoiceProfileEmbeddingsToExclave];
        }
        int v55 = 0;
        goto LABEL_54;
      }
      v78 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v74 = v78;
        id v75 = [(CSVoiceTriggerSecondPass *)self UUID];
        __int16 v76 = [v64 localizedDescription];
        *(_DWORD *)buf = 136315650;
        int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
        __int16 v92 = 2114;
        unint64_t v93 = (unint64_t)v75;
        __int16 v94 = 2112;
        v95 = v76;
        id v77 = "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to create SSR controller with error %@";
        goto LABEL_52;
      }
    }
    [(CSVoiceTriggerSecondPass *)self _reset];

    int v55 = 1;
LABEL_54:

    goto LABEL_55;
  }
  id v54 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    uint64_t v81 = v54;
    __int16 v82 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315650;
    int v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
    __int16 v92 = 2114;
    unint64_t v93 = (unint64_t)v82;
    __int16 v94 = 2114;
    v95 = v24;
    _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: Failed to retrieve voice profiles for %{public}@", buf, 0x20u);
  }
  [(CSVoiceTriggerSecondPass *)self _reset];
  int v55 = 1;
LABEL_55:

  if (!v55)
  {
LABEL_56:
    [(CSVoiceTriggerSecondPass *)self _reset];
    [(CSVoiceTriggerSecondPass *)self _unmapForPrewarmLoadedGraph];
    [(CSVoiceTriggerSecondPass *)self _mmapModelForPreWarm];
  }
LABEL_57:
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BA84C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_reset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isPSRAudioFlushed = 0;
  self->_unint64_t numProcessedSamples = 0;
  self->_numAnalyzedSamples = 0;
  [(CSPhraseDetector *)self->_phraseDetector reset];
  self->_processedSampleCountsInPending = 0;
  self->_unint64_t secondPassCheckerExecutionTime = 0;
  [(CSVoiceTriggerSecondPass *)self _resetStartAnalyzeTime];
  self->_secondPassHasMadeDecision = 0;
  id v3 = [(SSRSpeakerRecognitionController *)self->_speakerRecognitionController resetWithContext:self->_ssrContext];
  currentLocale = self->_currentLocale;
  self->_currentLocale = 0;

  self->_BOOL cancelSecondPassTrigger = 0;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BA938;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)_fetchSiriLocale
{
  if (self->_firstPassDeviceId && self->_secondPassClient == 5)
  {
    currentLocale = self->_currentLocale;
    if (!currentLocale)
    {
      +[CSUtils getSiriLanguageWithEndpointId:fallbackLanguage:](CSUtils, "getSiriLanguageWithEndpointId:fallbackLanguage:");
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v5 = self->_currentLocale;
      self->_currentLocale = v4;

      currentLocale = self->_currentLocale;
    }
    id v6 = currentLocale;
  }
  else
  {
    id v6 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  }
  return v6;
}

- (id)_getExclaveAudioTimeConverter
{
  exclaveAudioTimeConverter = self->_exclaveAudioTimeConverter;
  if (!exclaveAudioTimeConverter)
  {
    id v4 = +[CSAudioTimeConverterPool sharedInstance];
    id v5 = [v4 defaultExclaveConverter];
    id v6 = self->_exclaveAudioTimeConverter;
    self->_exclaveAudioTimeConverter = v5;

    exclaveAudioTimeConverter = self->_exclaveAudioTimeConverter;
  }
  return exclaveAudioTimeConverter;
}

- (id)_getAudioTimeConverter
{
  audioTimeConverter = self->_audioTimeConverter;
  if (!audioTimeConverter)
  {
    id v4 = [(CSVoiceTriggerSecondPass *)self audioStream];
    id v5 = [v4 streamProvider];
    id v6 = [v5 audioStreamId];

    id v7 = +[CSAudioTimeConverterPool sharedInstance];
    id v8 = [v7 converterForAudioStreamId:v6];
    float v9 = self->_audioTimeConverter;
    self->_audioTimeConverter = v8;

    audioTimeConverter = self->_audioTimeConverter;
  }
  return audioTimeConverter;
}

- (void)setSecondPassClient:(unint64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BAB94;
  block[3] = &unk_100251FD0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)setFirstPassDeviceId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  id v7[2] = sub_1000BAC70;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setFirstPassSource:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BACF0;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_mmapModelForPreWarm
{
  if (CSIsHorseman())
  {
    id v3 = [(CSVoiceTriggerSecondPassConfig *)self->_config configPathRecognizer];
    id v4 = +[CSMil2BnnsUtils readBnnsIrFromModelConfig:v3 modelType:1];

    id v10 = 0;
    id v5 = +[CSUtils mmapWithFile:v4 mappedSizeOut:&v10];
    id v6 = v10;
    id v7 = v6;
    self->_prewarmModelGraph = v5;
    if (v6) {
      self->_unint64_t prewarmMmapedSize = (unint64_t)[v6 unsignedLongValue];
    }
    id v8 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t prewarmMmapedSize = self->_prewarmMmapedSize;
      *(_DWORD *)buf = 136315394;
      float v12 = "-[CSVoiceTriggerSecondPass _mmapModelForPreWarm]";
      __int16 v13 = 2048;
      unint64_t v14 = prewarmMmapedSize;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s mmap with model size: %lu", buf, 0x16u);
    }
  }
}

- (void)prewarm
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BAEB4;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  id v3 = +[CSAudioServerCrashMonitor sharedInstance];
  [v3 addObserver:self];
}

- (void)setSupportsMultiPhraseDetection:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BB044;
  v4[3] = &unk_100253AB8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async_and_wait(queue, v4);
}

- (void)setSpeechManager:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  id v7[2] = sub_1000BB238;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(queue, v7);
}

- (void)dealloc
{
  [(CSVoiceTriggerSecondPass *)self _unmapForPrewarmLoadedGraph];
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = [(CSVoiceTriggerSecondPass *)self UUID];
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSVoiceTriggerSecondPass dealloc]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:deallocated", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerSecondPass;
  [(CSVoiceTriggerSecondPass *)&v6 dealloc];
}

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3
{
  return [(CSVoiceTriggerSecondPass *)self initWithPHSEnabled:a3 speechManager:0 supportsMphDetection:0 secondPassQueue:0];
}

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 targetQueue:(id)a4
{
  BOOL v4 = a3;
  dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("VoiceTrigger Second Pass Queue", 0, (dispatch_queue_t)a4);
  id v7 = [(CSVoiceTriggerSecondPass *)self initWithPHSEnabled:v4 speechManager:0 supportsMphDetection:0 secondPassQueue:v6];

  return v7;
}

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 speechManager:(id)a4 supportsMphDetection:(BOOL)a5 secondPassQueue:(id)a6
{
  BOOL v9 = a3;
  id v11 = a4;
  id v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CSVoiceTriggerSecondPass;
  __int16 v13 = [(CSVoiceTriggerSecondPass *)&v33 init];
  unint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_speechManager, a4);
    if (v12)
    {
      float v15 = (OS_dispatch_queue *)v12;
      queue = v14->_queue;
      v14->_queue = v15;
    }
    else
    {
      queue = dispatch_get_global_queue(33, 0);
      dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("VoiceTrigger Second Pass Queue", 0, queue);
      id v18 = v14->_queue;
      v14->_queue = (OS_dispatch_queue *)v17;
    }
    v14->_unint64_t firstPassSource = 0;
    v14->_shouldUsePHS = v9;
    v14->_unint64_t numProcessedSamples = 0;
    v14->_numAnalyzedSamples = 0;
    +[CSConfig inputRecordingSampleRate];
    v14->_unint64_t secondPassTimeout = (unint64_t)(float)(v19 * 3.0);
    v14->_double secondPassCompleteWatchDogTimeoutSec = 20.0;
    [(CSVoiceTriggerSecondPass *)v14 _clearTriggerCandidate];
    *(_OWORD *)&v14->_double lastAggTime = 0u;
    *(_OWORD *)&v14->_cumulativeDowntime = 0u;
    double v20 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
    [v20 addObserver:v14];

    [(CSVoiceTriggerSecondPass *)v14 _initializeMediaPlayingState];
    float v21 = +[NSUUID UUID];
    uint64_t v22 = [v21 UUIDString];
    UUID = v14->_UUID;
    v14->_UUID = (NSString *)v22;

    v14->_firstTimeAssetConfigured = 0;
    uint64_t v24 = +[NSMutableArray array];
    assetConfigWaitingBuffer = v14->_assetConfigWaitingBuffer;
    v14->_assetConfigWaitingBuffer = (NSMutableArray *)v24;

    v14->_unint64_t firstPassFireHostTime = 0;
    v14->_unint64_t prewarmMmapedSize = 0;
    v14->_prewarmModelGraph = 0;
    v14->_supportsMph = a5;
    *(_WORD *)&v14->_isPSRAudioFlushed = 0;
    v14->_unint64_t AOPVTTriggerLength = 0;
    v14->_unint64_t timeBasedEstimatedTriggerLength = 0;
    if (+[CSUtils isExclaveHardware])
    {
      uint64_t v26 = +[CSExclaveMessageHandlingFactory exclaveSecondPassVoiceTriggerAnalyzer];
      exclaveClient = v14->_exclaveClient;
      v14->_exclaveClient = (CSExclaveSecondPassVoiceTriggerAnalyzing *)v26;

      float v28 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v35 = "-[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s Initializing Secure VoiceTriggerSecondPass", buf, 0xCu);
      }
      [(CSExclaveSecondPassVoiceTriggerAnalyzing *)v14->_exclaveClient initializeSecondPass];
    }
    id v29 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      double v30 = v29;
      float v31 = [(CSVoiceTriggerSecondPass *)v14 UUID];
      *(_DWORD *)buf = 136315650;
      unint64_t v35 = "-[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]";
      __int16 v36 = 2114;
      id v37 = v31;
      __int16 v38 = 1024;
      BOOL v39 = v9;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:initialized with PHS : %d", buf, 0x1Cu);
    }
    v14->_BOOL cancelSecondPassTrigger = 0;
    v14->_secondpassTriggerCancellationLock._os_unfair_lock_opaque = 0;
  }

  return v14;
}

+ (id)stringForSecondPassResult:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"n/a";
  }
  else {
    return off_100250898[a3];
  }
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  id v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  BOOL v4 = +[NSDate date];
  BOOL v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (id)secondPassAudioLogDirectory
{
  id v2 = +[NSFileManager defaultManager];
  id v3 = +[CSFPreferences sharedPreferences];
  BOOL v4 = [v3 voiceTriggerAudioLogDirectory];

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0;
  }
  else
  {
    id v11 = 0;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      id v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        BOOL v9 = v7;
        id v10 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315650;
        __int16 v13 = "+[CSVoiceTriggerSecondPass secondPassAudioLogDirectory]";
        __int16 v14 = 2114;
        float v15 = v4;
        __int16 v16 = 2114;
        dispatch_queue_t v17 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      BOOL v4 = @"/tmp";
    }
  }

  return v4;
}

+ (id)secondPassAudioLoggingFilePathWithDeviceId:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CSVoiceTriggerSecondPass secondPassAudioLogDirectory];
  uint64_t v5 = +[CSVoiceTriggerSecondPass timeStampString];
  unsigned __int8 v6 = (void *)v5;
  if (v3) {
    +[NSString stringWithFormat:@"%@%@%@.wav", v5, v3, @"-activation"];
  }
  else {
  id v7 = +[NSString stringWithFormat:@"%@%@.wav", v5, @"-activation", v10];
  }

  id v8 = [v4 stringByAppendingPathComponent:v7];

  return v8;
}

@end