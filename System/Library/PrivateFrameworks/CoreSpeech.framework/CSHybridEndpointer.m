@interface CSHybridEndpointer
- (BOOL)_multimodalEndpointerEnabled;
- (BOOL)_shouldProvideTwoShotFeedbackWithRecordContext;
- (BOOL)_useEnhancedEndpointer;
- (BOOL)canProcessCurrentRequest;
- (BOOL)didCommunicateEndpoint;
- (BOOL)didDetectSpeech;
- (BOOL)didNotifyTwoShot;
- (BOOL)didReceiveASRFeatures;
- (BOOL)didReceiveRCFeatures;
- (BOOL)didTimestampFirstAudioPacket;
- (BOOL)disableRCSelection;
- (BOOL)enhancedEndpointerDefaultResult;
- (BOOL)epResult;
- (BOOL)hasAcceptedEagerResult;
- (BOOL)isASRFeatureFromServer;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeout;
- (BOOL)recordingDidStop;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4;
- (BOOL)speechEndpointDetected;
- (BOOL)useDefaultASRFeaturesOnClientLag;
- (CSASRFeatures)lastKnownASRFeatures;
- (CSASRFeatures)lastKnownRCFeatures;
- (CSAsset)currentAsset;
- (CSAudioRecordContext)recordContext;
- (CSEndpointAnalyzerDelegate)delegate;
- (CSEndpointAnalyzerImplDelegate)implDelegate;
- (CSEnhancedEndpointer)enhancedEndpointer;
- (CSHybridEndpointer)init;
- (NSDate)firstAudioPacketTimestamp;
- (NSDate)lastASRFeatureTimestamp;
- (NSDictionary)enhancedEndpointerTaskThresholdMap;
- (NSDictionary)taskEnhancedEndpointerMap;
- (NSDictionary)taskThresholdMap;
- (NSMutableArray)asrFeaturesLatencies;
- (NSString)endpointerModelVersion;
- (NSString)mhId;
- (OSDFeatures)lastKnownOSDFeatures;
- (OSDFeatures)osdFeaturesAtEndpoint;
- (OS_dispatch_queue)asrFeaturesQueue;
- (OS_dispatch_queue)hybridClassifierQueue;
- (OS_dispatch_queue)stateSerialQueue;
- (_EAREndpointer)hybridClassifier;
- (double)asrFeaturesWarmupLatency;
- (double)automaticEndpointingSuspensionEndTime;
- (double)clampedASRFeatureLatencyMsForClientLag;
- (double)clientLagThresholdMs;
- (double)delay;
- (double)endWaitTime;
- (double)firstAudioSampleSensorTimestamp;
- (double)hepAudioOriginInMs;
- (double)interspeechWaitTime;
- (double)lastEndOfVoiceActivityTime;
- (double)lastKnownASRFeatureLatency;
- (double)lastKnownRCFeatureLatency;
- (double)lastReportedEndpointTimeMs;
- (double)lastStartOfVoiceActivityTime;
- (double)minimumDurationForEndpointer;
- (double)postVoiceTriggerSilence;
- (double)processedAudioInSeconds;
- (double)startWaitTime;
- (double)twoShotSilenceThresholdInMs;
- (double)vtExtraAudioAtStartInMs;
- (float)lastEndpointPosterior;
- (id)_getCSHybridEndpointerConfigForAsset:(id)a3;
- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4;
- (int64_t)endpointStyle;
- (int64_t)endpointerOperationMode;
- (int64_t)fetchCurrentEndpointerOperationMode;
- (unint64_t)activeChannel;
- (unint64_t)anchorMachAbsTime;
- (unint64_t)audioDeliveryHostTimeDelta;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)extraDelayFrequency;
- (unint64_t)numSamplesProcessedBeforeAnchorTime;
- (unint64_t)vtEndInSampleCount;
- (void)_generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:(double)a3 osdFeatures:(id)a4 completion:(id)a5;
- (void)_processEnhancedEndpointerTaskString:(id)a3;
- (void)_readParametersFromHEPAsset:(id)a3;
- (void)_shouldAcceptEagerResultForDuration:(double)a3 asrFeatures:(id)a4 lastReportedEndpointTimeMs:(double)a5 osdFeatures:(id)a6 resultsCompletionHandler:(id)a7;
- (void)_swapEnhancedEndpointerModelForTaskString:(id)a3;
- (void)_updateCurrentAsset:(id)a3;
- (void)_updateEndpointerDelayedTriggerByMhId:(id)a3;
- (void)endpointerAssetManagerDidUpdateAsset:(id)a3;
- (void)handleVoiceTriggerWithActivationInfo:(id)a3;
- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6;
- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4;
- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5;
- (void)processRCFeatures:(id)a3;
- (void)processTaskString:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnchorMachAbsTime:(unint64_t)a3;
- (void)setAsrFeaturesLatencies:(id)a3;
- (void)setAsrFeaturesQueue:(id)a3;
- (void)setAsrFeaturesWarmupLatency:(double)a3;
- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setCanProcessCurrentRequest:(BOOL)a3;
- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3;
- (void)setClientLagThresholdMs:(double)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCommunicateEndpoint:(BOOL)a3;
- (void)setDidDetectSpeech:(BOOL)a3;
- (void)setDidNotifyTwoShot:(BOOL)a3;
- (void)setDidReceiveASRFeatures:(BOOL)a3;
- (void)setDidReceiveRCFeatures:(BOOL)a3;
- (void)setDidTimestampFirstAudioPacket:(BOOL)a3;
- (void)setDisableRCSelection:(BOOL)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointStyle:(int64_t)a3;
- (void)setEndpointerModelVersion:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setEnhancedEndpointer:(id)a3;
- (void)setEnhancedEndpointerDefaultResult:(BOOL)a3;
- (void)setEnhancedEndpointerTaskThresholdMap:(id)a3;
- (void)setEpResult:(BOOL)a3;
- (void)setExtraDelayFrequency:(unint64_t)a3;
- (void)setFirstAudioPacketTimestamp:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setHasAcceptedEagerResult:(BOOL)a3;
- (void)setHepAudioOriginInMs:(double)a3;
- (void)setHybridClassifier:(id)a3;
- (void)setHybridClassifierQueue:(id)a3;
- (void)setImplDelegate:(id)a3;
- (void)setInterspeechWaitTime:(double)a3;
- (void)setIsASRFeatureFromServer:(BOOL)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeout:(BOOL)a3;
- (void)setLastASRFeatureTimestamp:(id)a3;
- (void)setLastEndpointPosterior:(float)a3;
- (void)setLastKnownASRFeatureLatency:(double)a3;
- (void)setLastKnownASRFeatures:(id)a3;
- (void)setLastKnownOSDFeatures:(id)a3;
- (void)setLastKnownRCFeatureLatency:(double)a3;
- (void)setLastKnownRCFeatures:(id)a3;
- (void)setLastReportedEndpointTimeMs:(double)a3;
- (void)setMhId:(id)a3;
- (void)setMinimumDurationForEndpointer:(double)a3;
- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3;
- (void)setOsdFeaturesAtEndpoint:(id)a3;
- (void)setPostVoiceTriggerSilence:(double)a3;
- (void)setProcessedAudioInSeconds:(double)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingDidStop:(BOOL)a3;
- (void)setSaveSamplesSeenInReset:(BOOL)a3;
- (void)setSpeechEndpointDetected:(BOOL)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setStateSerialQueue:(id)a3;
- (void)setTaskEnhancedEndpointerMap:(id)a3;
- (void)setTaskThresholdMap:(id)a3;
- (void)setTwoShotSilenceThresholdInMs:(double)a3;
- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5;
- (void)stopEndpointer;
- (void)terminateProcessing;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
- (void)updateEnhancedEndpointerDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6;
@end

@implementation CSHybridEndpointer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedEndpointerTaskThresholdMap, 0);
  objc_storeStrong((id *)&self->_taskEnhancedEndpointerMap, 0);
  objc_storeStrong((id *)&self->_enhancedEndpointer, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketTimestamp, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_hybridClassifierQueue, 0);
  objc_storeStrong((id *)&self->_taskThresholdMap, 0);
  objc_storeStrong((id *)&self->_lastASRFeatureTimestamp, 0);
  objc_storeStrong((id *)&self->_asrFeaturesLatencies, 0);
  objc_storeStrong((id *)&self->_lastKnownRCFeatures, 0);
  objc_storeStrong((id *)&self->_lastKnownOSDFeatures, 0);
  objc_storeStrong((id *)&self->_lastKnownASRFeatures, 0);
  objc_storeStrong((id *)&self->_asrFeaturesQueue, 0);
  objc_storeStrong((id *)&self->_endpointerModelVersion, 0);
  objc_storeStrong((id *)&self->_hybridClassifier, 0);
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_implDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDisableRCSelection:(BOOL)a3
{
  self->_disableRCSelection = a3;
}

- (BOOL)disableRCSelection
{
  return self->_disableRCSelection;
}

- (void)setHasAcceptedEagerResult:(BOOL)a3
{
  self->_hasAcceptedEagerResult = a3;
}

- (BOOL)hasAcceptedEagerResult
{
  return self->_hasAcceptedEagerResult;
}

- (void)setEnhancedEndpointerTaskThresholdMap:(id)a3
{
}

- (NSDictionary)enhancedEndpointerTaskThresholdMap
{
  return self->_enhancedEndpointerTaskThresholdMap;
}

- (void)setDidReceiveRCFeatures:(BOOL)a3
{
  self->_didReceiveRCFeatures = a3;
}

- (BOOL)didReceiveRCFeatures
{
  return self->_didReceiveRCFeatures;
}

- (void)setEnhancedEndpointerDefaultResult:(BOOL)a3
{
  self->_enhancedEndpointerDefaultResult = a3;
}

- (BOOL)enhancedEndpointerDefaultResult
{
  return self->_enhancedEndpointerDefaultResult;
}

- (void)setTaskEnhancedEndpointerMap:(id)a3
{
}

- (NSDictionary)taskEnhancedEndpointerMap
{
  return self->_taskEnhancedEndpointerMap;
}

- (void)setEnhancedEndpointer:(id)a3
{
}

- (CSEnhancedEndpointer)enhancedEndpointer
{
  return self->_enhancedEndpointer;
}

- (int64_t)endpointerOperationMode
{
  return self->_endpointerOperationMode;
}

- (void)setPostVoiceTriggerSilence:(double)a3
{
  self->_postVoiceTriggerSilence = a3;
}

- (double)postVoiceTriggerSilence
{
  return self->_postVoiceTriggerSilence;
}

- (void)setDidDetectSpeech:(BOOL)a3
{
  self->_didDetectSpeech = a3;
}

- (BOOL)didDetectSpeech
{
  return self->_didDetectSpeech;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setIsASRFeatureFromServer:(BOOL)a3
{
  self->_isASRFeatureFromServer = a3;
}

- (BOOL)isASRFeatureFromServer
{
  return self->_isASRFeatureFromServer;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setIsRequestTimeout:(BOOL)a3
{
  self->_isRequestTimeout = a3;
}

- (BOOL)isRequestTimeout
{
  return self->_isRequestTimeout;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setAnchorMachAbsTime:(unint64_t)a3
{
  self->_anchorMachAbsTime = a3;
}

- (unint64_t)anchorMachAbsTime
{
  return self->_anchorMachAbsTime;
}

- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3
{
  self->_numSamplesProcessedBeforeAnchorTime = a3;
}

- (unint64_t)numSamplesProcessedBeforeAnchorTime
{
  return self->_numSamplesProcessedBeforeAnchorTime;
}

- (void)setDidTimestampFirstAudioPacket:(BOOL)a3
{
  self->_didTimestampFirstAudioPacket = a3;
}

- (BOOL)didTimestampFirstAudioPacket
{
  return self->_didTimestampFirstAudioPacket;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioPacketTimestamp:(id)a3
{
}

- (NSDate)firstAudioPacketTimestamp
{
  return self->_firstAudioPacketTimestamp;
}

- (void)setSpeechEndpointDetected:(BOOL)a3
{
  self->_speechEndpointDetected = a3;
}

- (BOOL)speechEndpointDetected
{
  return self->_speechEndpointDetected;
}

- (void)setRecordContext:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setDidNotifyTwoShot:(BOOL)a3
{
  self->_didNotifyTwoShot = a3;
}

- (BOOL)didNotifyTwoShot
{
  return self->_didNotifyTwoShot;
}

- (void)setTwoShotSilenceThresholdInMs:(double)a3
{
  self->_twoShotSilenceThresholdInMs = a3;
}

- (double)twoShotSilenceThresholdInMs
{
  return self->_twoShotSilenceThresholdInMs;
}

- (void)setHepAudioOriginInMs:(double)a3
{
  self->_hepAudioOriginInMs = a3;
}

- (double)hepAudioOriginInMs
{
  return self->_hepAudioOriginInMs;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setDidCommunicateEndpoint:(BOOL)a3
{
  self->_didCommunicateEndpoint = a3;
}

- (BOOL)didCommunicateEndpoint
{
  return self->_didCommunicateEndpoint;
}

- (void)setStateSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)stateSerialQueue
{
  return self->_stateSerialQueue;
}

- (void)setLastEndpointPosterior:(float)a3
{
  self->_lastEndpointPosterior = a3;
}

- (float)lastEndpointPosterior
{
  return self->_lastEndpointPosterior;
}

- (void)setProcessedAudioInSeconds:(double)a3
{
  self->_processedAudioInSeconds = a3;
}

- (double)processedAudioInSeconds
{
  return self->_processedAudioInSeconds;
}

- (void)setLastReportedEndpointTimeMs:(double)a3
{
  self->_lastReportedEndpointTimeMs = a3;
}

- (double)lastReportedEndpointTimeMs
{
  return self->_lastReportedEndpointTimeMs;
}

- (void)setHybridClassifierQueue:(id)a3
{
}

- (OS_dispatch_queue)hybridClassifierQueue
{
  return self->_hybridClassifierQueue;
}

- (void)setTaskThresholdMap:(id)a3
{
}

- (NSDictionary)taskThresholdMap
{
  return self->_taskThresholdMap;
}

- (void)setExtraDelayFrequency:(unint64_t)a3
{
  self->_extraDelayFrequency = a3;
}

- (unint64_t)extraDelayFrequency
{
  return self->_extraDelayFrequency;
}

- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3
{
  self->_useDefaultASRFeaturesOnClientLag = a3;
}

- (BOOL)useDefaultASRFeaturesOnClientLag
{
  return self->_useDefaultASRFeaturesOnClientLag;
}

- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3
{
  self->_clampedASRFeatureLatencyMsForClientLag = a3;
}

- (double)clampedASRFeatureLatencyMsForClientLag
{
  return self->_clampedASRFeatureLatencyMsForClientLag;
}

- (void)setClientLagThresholdMs:(double)a3
{
  self->_clientLagThresholdMs = a3;
}

- (double)clientLagThresholdMs
{
  return self->_clientLagThresholdMs;
}

- (void)setDidReceiveASRFeatures:(BOOL)a3
{
  self->_didReceiveASRFeatures = a3;
}

- (BOOL)didReceiveASRFeatures
{
  return self->_didReceiveASRFeatures;
}

- (void)setLastASRFeatureTimestamp:(id)a3
{
}

- (NSDate)lastASRFeatureTimestamp
{
  return self->_lastASRFeatureTimestamp;
}

- (void)setAsrFeaturesWarmupLatency:(double)a3
{
  self->_asrFeaturesWarmupLatency = a3;
}

- (double)asrFeaturesWarmupLatency
{
  return self->_asrFeaturesWarmupLatency;
}

- (void)setEpResult:(BOOL)a3
{
  self->_epResult = a3;
}

- (BOOL)epResult
{
  return self->_epResult;
}

- (void)setLastKnownRCFeatureLatency:(double)a3
{
  self->_lastKnownRCFeatureLatency = a3;
}

- (double)lastKnownRCFeatureLatency
{
  return self->_lastKnownRCFeatureLatency;
}

- (void)setLastKnownASRFeatureLatency:(double)a3
{
  self->_lastKnownASRFeatureLatency = a3;
}

- (double)lastKnownASRFeatureLatency
{
  return self->_lastKnownASRFeatureLatency;
}

- (void)setAsrFeaturesLatencies:(id)a3
{
}

- (NSMutableArray)asrFeaturesLatencies
{
  return self->_asrFeaturesLatencies;
}

- (void)setLastKnownRCFeatures:(id)a3
{
}

- (CSASRFeatures)lastKnownRCFeatures
{
  return self->_lastKnownRCFeatures;
}

- (void)setLastKnownOSDFeatures:(id)a3
{
}

- (OSDFeatures)lastKnownOSDFeatures
{
  return self->_lastKnownOSDFeatures;
}

- (void)setLastKnownASRFeatures:(id)a3
{
}

- (CSASRFeatures)lastKnownASRFeatures
{
  return self->_lastKnownASRFeatures;
}

- (void)setAsrFeaturesQueue:(id)a3
{
}

- (OS_dispatch_queue)asrFeaturesQueue
{
  return self->_asrFeaturesQueue;
}

- (void)setEndpointerModelVersion:(id)a3
{
}

- (void)setHybridClassifier:(id)a3
{
}

- (_EAREndpointer)hybridClassifier
{
  return self->_hybridClassifier;
}

- (void)setOsdFeaturesAtEndpoint:(id)a3
{
}

- (OSDFeatures)osdFeaturesAtEndpoint
{
  return self->_osdFeaturesAtEndpoint;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCanProcessCurrentRequest:(BOOL)a3
{
  self->_canProcessCurrentRequest = a3;
}

- (BOOL)canProcessCurrentRequest
{
  return self->_canProcessCurrentRequest;
}

- (void)setSaveSamplesSeenInReset:(BOOL)a3
{
  self->_saveSamplesSeenInReset = a3;
}

- (BOOL)saveSamplesSeenInReset
{
  return self->_saveSamplesSeenInReset;
}

- (void)setMinimumDurationForEndpointer:(double)a3
{
  self->_minimumDurationForEndpointer = a3;
}

- (double)minimumDurationForEndpointer
{
  return self->_minimumDurationForEndpointer;
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  self->_automaticEndpointingSuspensionEndTime = a3;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return self->_automaticEndpointingSuspensionEndTime;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setInterspeechWaitTime:(double)a3
{
  self->_interspeechWaitTime = a3;
}

- (double)interspeechWaitTime
{
  return self->_interspeechWaitTime;
}

- (void)setEndWaitTime:(double)a3
{
  self->_endWaitTime = a3;
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (void)setStartWaitTime:(double)a3
{
  self->_startWaitTime = a3;
}

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (void)setEndpointStyle:(int64_t)a3
{
  self->_endpointStyle = a3;
}

- (int64_t)endpointStyle
{
  return self->_endpointStyle;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setImplDelegate:(id)a3
{
}

- (CSEndpointAnalyzerImplDelegate)implDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_implDelegate);
  return (CSEndpointAnalyzerImplDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSEndpointAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSEndpointAnalyzerDelegate *)WeakRetained;
}

- (BOOL)_multimodalEndpointerEnabled
{
  return 0;
}

- (void)processRCFeatures:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E1F58;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
}

- (BOOL)_useEnhancedEndpointer
{
  return self->_enhancedEndpointer != 0;
}

- (BOOL)_shouldProvideTwoShotFeedbackWithRecordContext
{
  unsigned __int8 v3 = [(CSAudioRecordContext *)self->_recordContext isRequestFromTriggerless];
  unsigned __int8 v4 = [(CSAudioRecordContext *)self->_recordContext isGibraltarVoiceTriggered];
  return [(CSAudioRecordContext *)self->_recordContext isVoiceTriggered] & ((v4 | v3) ^ 1);
}

- (id)_getCSHybridEndpointerConfigForAsset:(id)a3
{
  id v3 = a3;
  if (CSIsHorseman()) {
    CFStringRef v4 = @"cs_hep_marsh.json";
  }
  else {
    CFStringRef v4 = @"cs_hep.json";
  }
  uint64_t v5 = [v3 resourcePath];

  id v6 = [(id)v5 stringByAppendingPathComponent:v4];

  v7 = +[NSFileManager defaultManager];
  LOBYTE(v5) = [v7 fileExistsAtPath:v6];

  if (v5)
  {
    id v8 = +[NSData dataWithContentsOfFile:v6];
    if (v8)
    {
      id v16 = 0;
      v9 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v16];
      id v10 = v16;
      if (v10)
      {
        v11 = CSLogCategoryEP;
        if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
          __int16 v19 = 2114;
          v20 = v6;
          __int16 v21 = 2114;
          id v22 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Could not decode contents of: %{public}@: err: %{public}@", buf, 0x20u);
        }
        id v12 = 0;
      }
      else
      {
        id v12 = v9;
      }
    }
    else
    {
      v14 = CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
        __int16 v19 = 2114;
        v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }
      id v12 = 0;
    }
  }
  else
  {
    v13 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
      __int16 v19 = 2114;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

- (void)endpointerAssetManagerDidUpdateAsset:(id)a3
{
  id v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E2430;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateSerialQueue, v7);
}

- (double)lastStartOfVoiceActivityTime
{
  return 0.0;
}

- (double)lastEndOfVoiceActivityTime
{
  return 0.0;
}

- (void)_readParametersFromHEPAsset:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E24FC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(asrFeaturesQueue, v7);
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a4;
  self->_recordingDidStop = 0;
  v9 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2114;
    v32 = v8;
    LOWORD(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 2) = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s sampleRate=%{public}lu, recordContext=%{public}@, disableRCSelection=%d", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v32 = sub_1000E2C34;
  v33 = sub_1000E2C44;
  id v34 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2C4C;
  block[3] = &unk_1002523B8;
  block[4] = self;
  v11 = v8;
  v25 = v11;
  v26 = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  id v12 = CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v27 = 136315394;
    *(void *)&v27[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "KeyLog - %s CSEndpointAsset exists: %{public}@", v27, 0x16u);
  }
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    v14 = CSLogCategoryEP;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = +[CSAssetManager sharedManager];
      id v16 = [v15 currentLanguageCode];
      *(_DWORD *)v27 = 136315394;
      *(void *)&v27[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "KeyLog - %s No asset for CSHybridEndpointer for currentLanguage: %{public}@. Fallback to NNVAD", v27, 0x16u);
    }
  }
  *(void *)v27 = 0;
  *(void *)&v27[8] = v27;
  *(void *)&v27[16] = 0x3032000000;
  v28 = sub_1000E2C34;
  v29 = sub_1000E2C44;
  id v30 = 0;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000E2CA8;
  v22[3] = &unk_100251688;
  BOOL v23 = v5;
  v22[4] = self;
  v22[5] = buf;
  v22[6] = v27;
  v22[7] = a3;
  dispatch_async_and_wait(hybridClassifierQueue, v22);
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E3450;
  v21[3] = &unk_100253A90;
  v21[4] = self;
  v21[5] = v27;
  dispatch_async_and_wait(asrFeaturesQueue, v21);
  __int16 v19 = self->_stateSerialQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E360C;
  v20[3] = &unk_100253B58;
  v20[4] = self;
  v20[5] = a3;
  dispatch_async_and_wait(v19, v20);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(buf, 8);
}

- (void)stopEndpointer
{
  id v3 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[CSHybridEndpointer stopEndpointer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSHybridEndpointer *)self terminateProcessing];
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  BOOL v5 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSHybridEndpointer recordingStoppedForReason:]";
    __int16 v8 = 2050;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointer recordingStoppedForReason: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  [(CSHybridEndpointer *)self terminateProcessing];
}

- (void)terminateProcessing
{
  id v3 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSHybridEndpointer terminateProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_recordingDidStop = 1;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3C20;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(hybridClassifierQueue, block);
}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E3D08;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  int64_t v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(stateSerialQueue, v7);
}

- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3FEC;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(stateSerialQueue, block);
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E46A8;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
}

- (void)_generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:(double)a3 osdFeatures:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v112 = _NSConcreteStackBlock;
  uint64_t v113 = 3221225472;
  v114 = sub_1000E4E2C;
  v115 = &unk_100251610;
  id v9 = a5;
  id v116 = v9;
  id v10 = objc_retainBlock(&v112);
  double v11 = (double)[(CSASRFeatures *)self->_lastKnownASRFeatures processedAudioDurationInMilliseconds];
  if (v11 <= a3)
  {
    objc_msgSend(v8, "processedAudioMs", v11);
    if (self->_didReceiveASRFeatures) {
      double v42 = a3
    }
          - (double)[(CSASRFeatures *)self->_lastKnownASRFeatures processedAudioDurationInMilliseconds];
    else {
      double v42 = v41;
    }
    if ([(CSHybridEndpointer *)self _useEnhancedEndpointer])
    {
      uint64_t v49 = [(CSASRFeatures *)self->_lastKnownRCFeatures processedAudioDurationInMilliseconds];
      if (self->_didReceiveRCFeatures) {
        double lastKnownRCFeatureLatency = self->_lastKnownRCFeatureLatency;
      }
      else {
        double lastKnownRCFeatureLatency = (double)v49;
      }
      id v93 = objc_alloc((Class)CSEnhancedEndpointerFeatures);
      int64_t v94 = [(CSASRFeatures *)self->_lastKnownASRFeatures trailingSilenceDuration];
      [v8 silenceFramesCountMs];
      double v96 = v95;
      [(CSASRFeatures *)self->_lastKnownASRFeatures eosLikelihood];
      double v98 = exp(-v97);
      int64_t v99 = [(CSASRFeatures *)self->_lastKnownASRFeatures wordCount];
      [v8 silenceProbability];
      double v101 = v100;
      int64_t v102 = [(CSASRFeatures *)self->_lastKnownRCFeatures trailingSilenceDuration];
      [(CSASRFeatures *)self->_lastKnownRCFeatures eosLikelihood];
      double v104 = exp(-v103);
      int64_t v105 = [(CSASRFeatures *)self->_lastKnownRCFeatures wordCount];
      [(CSASRFeatures *)self->_lastKnownASRFeatures silencePosterior];
      double v107 = v106;
      [(CSASRFeatures *)self->_lastKnownASRFeatures acousticEndpointerScore];
      double v109 = v108;
      [v8 silenceDurationMs];
      *(float *)&double v110 = v110;
      LODWORD(v111) = LODWORD(v110);
      id v92 = objc_msgSend(v93, "initWithTrailingSilenceDuration:clientSilenceFramesCount:endOfSentenceLikelihood:wordCount:serverFeaturesLatency:clientSilenceProbability:rcTrailingSilenceDuration:rcEndOfSentenceLikelihood:rcWordCount:rcServerFeaturesLatency:silencePosterior:acousticEndpointerScore:silencePosteriorNF:", v94, v99, v102, v105, v96, v98, v42, v101, v104, lastKnownRCFeatureLatency, v107, v109, v111, v112, v113,
              v114,
              v115);
      id v40 = 0;
      goto LABEL_26;
    }
    id v51 = objc_alloc((Class)_EAREndpointFeatures);
    int64_t v52 = [(CSASRFeatures *)self->_lastKnownASRFeatures wordCount];
    int64_t v53 = [(CSASRFeatures *)self->_lastKnownASRFeatures trailingSilenceDuration];
    [(CSASRFeatures *)self->_lastKnownASRFeatures eosLikelihood];
    double v55 = v54;
    [(CSASRFeatures *)self->_lastKnownASRFeatures acousticEndpointerScore];
    double v57 = v56;
    v58 = [(CSASRFeatures *)self->_lastKnownASRFeatures pauseCounts];
    [(CSASRFeatures *)self->_lastKnownASRFeatures silencePosterior];
    double v60 = v59;
    [v8 silenceFramesCountMs];
    double v62 = v61;
    [v8 silenceProbability];
    double v64 = v63;
    [v8 silenceDurationMs];
    *(float *)&double v66 = v65;
    *(float *)&double v67 = v42;
    v68 = v51;
    int64_t v69 = v52;
    int64_t v70 = v53;
    double v71 = v55;
    double v72 = v57;
    v73 = v58;
    double v74 = v60;
    double v75 = v62;
    double v76 = v64;
    goto LABEL_22;
  }
  id v12 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    lastKnownASRFeatures = self->_lastKnownASRFeatures;
    v14 = v12;
    double v15 = COERCE_DOUBLE((id)[(CSASRFeatures *)lastKnownASRFeatures processedAudioDurationInMilliseconds]);
    *(_DWORD *)buf = 136315650;
    v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
    __int16 v121 = 2050;
    double v122 = v15;
    __int16 v123 = 2050;
    double v124 = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s ClientLag: asrProcessedAudioMs(%{public}ld) > effectiveClientProcessedAudioMs(%{public}f)", buf, 0x20u);
  }
  double v16 = a3
      - (double)[(CSASRFeatures *)self->_lastKnownASRFeatures processedAudioDurationInMilliseconds];
  double clientLagThresholdMs = self->_clientLagThresholdMs;
  if (v16 <= clientLagThresholdMs)
  {
    BOOL useDefaultASRFeaturesOnClientLag = self->_useDefaultASRFeaturesOnClientLag;
    __int16 v19 = CSLogCategoryEP;
    BOOL v20 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
    if (useDefaultASRFeaturesOnClientLag)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315394;
        v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
        __int16 v121 = 2050;
        double v122 = a3;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Using DefaultServerFeatures with disconnected-state sfLatency: %{public}f", buf, 0x16u);
      }
      __int16 v21 = [(_EAREndpointer *)self->_hybridClassifier defaultServerEndpointFeatures];
      id v22 = objc_alloc((Class)_EAREndpointFeatures);
      id v23 = [v21 wordCount];
      id v24 = [v21 trailingSilenceDuration];
      [v21 endOfSentenceLikelihood];
      double v26 = v25;
      [v21 acousticEndpointerScore];
      double v28 = v27;
      [v21 silencePosterior];
      double v30 = v29;
      [v8 silenceFramesCountMs];
      double v32 = v31;
      [v8 silenceProbability];
      double v34 = v33;
      [v8 silenceDurationMs];
      float v36 = v35;
      [v8 processedAudioMs];
      *(float *)&double v38 = v37;
      *(float *)&double v39 = v36;
      id v40 = [v22 initWithWordCount:v23 trailingSilenceDuration:v24 endOfSentenceLikelihood:&__NSArray0__struct acousticEndpointerScore:0 pauseCounts:v26 silencePosterior:v28 clientSilenceFramesCountMs:v30 clientSilenceProbability:v32 silencePosteriorNF:v34 serverFeaturesLatency:v39 eagerResultEndTime:v38];

      goto LABEL_23;
    }
    if (v20)
    {
      double clampedASRFeatureLatencyMsForClientLag = self->_clampedASRFeatureLatencyMsForClientLag;
      *(_DWORD *)buf = 136315394;
      v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
      __int16 v121 = 2050;
      double v122 = clampedASRFeatureLatencyMsForClientLag;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Using ServerFeatures with ClampedSFLatency: %{public}f", buf, 0x16u);
    }
    id v78 = objc_alloc((Class)_EAREndpointFeatures);
    int64_t v79 = [(CSASRFeatures *)self->_lastKnownASRFeatures wordCount];
    int64_t v80 = [(CSASRFeatures *)self->_lastKnownASRFeatures trailingSilenceDuration];
    [(CSASRFeatures *)self->_lastKnownASRFeatures eosLikelihood];
    double v82 = v81;
    [(CSASRFeatures *)self->_lastKnownASRFeatures acousticEndpointerScore];
    double v84 = v83;
    v58 = [(CSASRFeatures *)self->_lastKnownASRFeatures pauseCounts];
    [(CSASRFeatures *)self->_lastKnownASRFeatures silencePosterior];
    double v86 = v85;
    [v8 silenceFramesCountMs];
    double v88 = v87;
    [v8 silenceProbability];
    double v90 = v89;
    [v8 silenceDurationMs];
    *(float *)&double v66 = v91;
    *(float *)&double v67 = self->_clampedASRFeatureLatencyMsForClientLag;
    v68 = v78;
    int64_t v69 = v79;
    int64_t v70 = v80;
    double v71 = v82;
    double v72 = v84;
    v73 = v58;
    double v74 = v86;
    double v75 = v88;
    double v76 = v90;
LABEL_22:
    id v40 = [v68 initWithWordCount:v69 trailingSilenceDuration:v70 endOfSentenceLikelihood:v73 acousticEndpointerScore:0 pauseCounts:v71 silencePosterior:v72 clientSilenceFramesCountMs:v74 clientSilenceProbability:v75 silencePosteriorNF:v76 serverFeaturesLatency:v66 eagerResultEndTime:v67];

LABEL_23:
    id v92 = 0;
LABEL_26:
    ((void (*)(void ***, void, id, id))v10[2])(v10, 0, v40, v92);

    goto LABEL_27;
  }
  v43 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
    __int16 v121 = 2050;
    double v122 = v16;
    __int16 v123 = 2050;
    double v124 = clientLagThresholdMs;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Not invoking HybridClassifier: sfLatency > clientLagThreshold: %{public}f > %{public}f", buf, 0x20u);
  }
  id v44 = objc_alloc((Class)NSError);
  uint64_t v45 = CSErrorDomain;
  v117[0] = @"sfLatency";
  v46 = +[NSNumber numberWithDouble:v16];
  v117[1] = @"clientLagThreshold";
  v118[0] = v46;
  v47 = +[NSNumber numberWithDouble:self->_clientLagThresholdMs];
  v118[1] = v47;
  v48 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:2];
  id v40 = [v44 initWithDomain:v45 code:2302 userInfo:v48];

  ((void (*)(void ***, id, void, void))v10[2])(v10, v40, 0, 0);
LABEL_27:
}

- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_recordingDidStop)
  {
    id v10 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Don't process OSD features";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    double v71 = sub_1000E2C34;
    double v72 = sub_1000E2C44;
    id v73 = 0;
    hybridClassifierQueue = self->_hybridClassifierQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E556C;
    block[3] = &unk_100253A90;
    void block[5] = buf;
    block[4] = self;
    dispatch_async_and_wait(hybridClassifierQueue, block);
    if ([v9 length]
      && ([v9 isEqualToString:*(void *)(*(void *)&buf[8] + 40)] & 1) == 0)
    {
      id v24 = CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v68 = 136315650;
        *(void *)&v68[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
        *(_WORD *)&v68[12] = 2112;
        *(void *)&v68[14] = v25;
        *(_WORD *)&v68[22] = 2112;
        id v69 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s MHID mismatch: Endpointer = %@, OSD = %@, don't process OSD features", v68, 0x20u);
      }
    }
    else
    {
      [v8 processedAudioMs];
      double v13 = v12;
      [v8 silenceDurationMs];
      double v15 = v14;
      uint64_t v16 = qword_1002A39A0;
      if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A39A0, 1) <= 0x888888888888888uLL)
      {
        kdebug_trace();
        uint64_t v16 = qword_1002A39A0;
      }
      qword_1002A39A0 = v16 + 1;
      float v17 = v13;
      float v18 = v15;
      *(void *)v68 = 0;
      *(void *)&v68[8] = v68;
      *(void *)&v68[16] = 0x2020000000;
      id v69 = 0;
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x2020000000;
      v62[3] = 0;
      v61[0] = 0;
      v61[1] = v61;
      v61[2] = 0x2020000000;
      v61[3] = 0;
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x2020000000;
      char v60 = 0;
      __int16 v19 = self->_hybridClassifierQueue;
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1000E5580;
      v58[3] = &unk_1002514D0;
      v58[4] = self;
      v58[5] = v68;
      v58[6] = v62;
      v58[7] = v59;
      v58[8] = v61;
      dispatch_async(v19, v58);
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x2020000000;
      v57[3] = 0;
      uint64_t v53 = 0;
      double v54 = &v53;
      uint64_t v55 = 0x2020000000;
      char v56 = 0;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      char v52 = 0;
      stateSerialQueue = self->_stateSerialQueue;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1000E55D0;
      v49[3] = &unk_1002514F8;
      v49[4] = self;
      v49[5] = &v53;
      v49[6] = v51;
      v49[7] = v57;
      float v50 = v17;
      dispatch_async_and_wait(stateSerialQueue, v49);
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2020000000;
      char v48 = 0;
      __int16 v21 = self->_stateSerialQueue;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000E5618;
      v44[3] = &unk_100253A90;
      v44[4] = self;
      v44[5] = &v45;
      dispatch_async_and_wait(v21, v44);
      if (*((unsigned char *)v46 + 24) && !self->_didDetectSpeech)
      {
        id v22 = self->_stateSerialQueue;
        if (v17 <= 300.0 || v18 >= 0.001)
        {
          id v23 = v41;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1000E572C;
          v41[3] = &unk_1002533A8;
          v41[4] = self;
          float v42 = v17;
        }
        else
        {
          id v23 = v43;
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_1000E5654;
          v43[3] = &unk_100253A90;
          v43[4] = self;
          v43[5] = v57;
        }
        dispatch_async_and_wait(v22, v23);
      }
      if (*((unsigned char *)v54 + 24))
      {
        double v26 = CSLogCategoryEP;
        if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)double v64 = 136315394;
          double v65 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
          __int16 v66 = 2050;
          double v67 = v18;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s Already communicated end-pt: Not scheduling work for hybridClassifierQueue for silposnf=%{public}f", v64, 0x16u);
        }
      }
      else
      {
        unsigned __int8 v27 = [(CSHybridEndpointer *)self _multimodalEndpointerEnabled];
        double v28 = self->_hybridClassifierQueue;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000E5864;
        v29[3] = &unk_1002515E8;
        v29[4] = self;
        double v31 = &v53;
        float v39 = v15;
        id v30 = v8;
        double v32 = v57;
        unsigned __int8 v40 = v27;
        double v33 = v51;
        double v34 = v68;
        double v35 = v62;
        float v36 = v59;
        double v38 = a4;
        double v37 = v61;
        dispatch_async(v28, v29);
      }
      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(v51, 8);
      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(v57, 8);
      _Block_object_dispose(v59, 8);
      _Block_object_dispose(v61, 8);
      _Block_object_dispose(v62, 8);
      _Block_object_dispose(v68, 8);
    }
    _Block_object_dispose(buf, 8);
  }
}

- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4
{
  id v6 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7628;
  block[3] = &unk_1002532A8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async_and_wait(stateSerialQueue, block);
}

- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6
{
  hybridClassifierQueue = self->_hybridClassifierQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E778C;
  block[3] = &unk_1002514A8;
  block[4] = self;
  void block[5] = a3;
  BOOL v8 = a5;
  void block[6] = a4;
  block[7] = a6;
  dispatch_async(hybridClassifierQueue, block);
}

- (void)_shouldAcceptEagerResultForDuration:(double)a3 asrFeatures:(id)a4 lastReportedEndpointTimeMs:(double)a5 osdFeatures:(id)a6 resultsCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  double v14 = (void (**)(id, void, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  if (self->_hasAcceptedEagerResult)
  {
    double v15 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Rejecting RC: Already accepted an earlier RC for this request", buf, 0xCu);
    }
    double v16 = +[NSNumber numberWithDouble:a3];
    *(double *)double v59 = v16;
    id v17 = +[NSNumber numberWithDouble:a5];
    v59[1] = v17;
    float v18 = v59;
LABEL_9:
    BOOL v20 = +[NSArray arrayWithObjects:v18 count:2];
    v14[2](v14, 0, v20);
LABEL_10:

    goto LABEL_11;
  }
  if (self->_disableRCSelection)
  {
    __int16 v19 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Rejecting RC: ASR is running on-device (full UoD)", buf, 0xCu);
    }
    double v16 = +[NSNumber numberWithDouble:a3];
    *(double *)v58 = v16;
    id v17 = +[NSNumber numberWithDouble:a5];
    v58[1] = v17;
    float v18 = v58;
    goto LABEL_9;
  }
  double v21 = a5 - (double)(uint64_t)[v12 processedAudioDurationInMilliseconds];
  double v22 = a5 - a3;
  if (a5 - a3 < 0.0)
  {
    id v23 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      __int16 v50 = 2050;
      double v51 = a3;
      __int16 v52 = 2050;
      double v53 = a5;
      __int16 v54 = 2050;
      double v55 = v21;
      __int16 v56 = 2050;
      double v57 = a5 - a3;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Accepting RC: RCTime < 0: ASR's processedAudioDuration(%{public}f) > lastReportedEndpointTimeMs(%{public}f): asrFeatureLatency: %{public}f, rcTimeMs: %{public}f", buf, 0x34u);
    }
    double v16 = +[NSNumber numberWithDouble:a3];
    *(double *)uint64_t v47 = v16;
    id v17 = +[NSNumber numberWithDouble:a5];
    v47[1] = v17;
    BOOL v20 = +[NSArray arrayWithObjects:v47 count:2];
    v14[2](v14, 1, v20);
    goto LABEL_10;
  }
  if (v21 < 0.0)
  {
    id v24 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      __int16 v50 = 2050;
      double v51 = a3;
      __int16 v52 = 2050;
      double v53 = a5;
      __int16 v54 = 2050;
      double v55 = v21;
      __int16 v56 = 2050;
      double v57 = a5 - a3;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Rejecting RC: SFLatency < 0: ASR's processedAudioDuration(%{public}f): lastReportedEndpointTimeMs(%{public}f): asrFeatureLatency: %{public}f, rcTimeMs: %{public}f", buf, 0x34u);
    }
    double v16 = +[NSNumber numberWithDouble:a3];
    *(double *)v46 = v16;
    id v17 = +[NSNumber numberWithDouble:a5];
    v46[1] = v17;
    float v18 = v46;
    goto LABEL_9;
  }
  id v25 = objc_alloc((Class)_EAREndpointFeatures);
  id v26 = [v12 wordCount];
  id v27 = [v12 trailingSilenceDuration];
  [v12 eosLikelihood];
  double v29 = v28;
  [v12 acousticEndpointerScore];
  double v31 = v30;
  double v32 = [v12 pauseCounts];
  [v12 silencePosterior];
  double v34 = v33;
  [v13 silenceFramesCountMs];
  double v36 = v35;
  [v13 silenceProbability];
  double v38 = v37;
  [v13 silenceDurationMs];
  *(float *)&double v40 = v39;
  *(float *)&double v41 = v21;
  double v16 = COERCE_DOUBLE([v25 initWithWordCount:v26 trailingSilenceDuration:v27 endOfSentenceLikelihood:v32 acousticEndpointerScore:(uint64_t)v22 pauseCounts:v29 silencePosterior:v31 clientSilenceFramesCountMs:v34 clientSilenceProbability:v36 silencePosteriorNF:v38 serverFeaturesLatency:v40 eagerResultEndTime:v41]);

  hybridClassifier = self->_hybridClassifier;
  id v45 = 0;
  id v43 = [(_EAREndpointer *)hybridClassifier acceptEagerResultWithFeatures:*(void *)&v16 featuresToLog:&v45];
  id v17 = v45;
  id v44 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:re"
          "sultsCompletionHandler:]";
    __int16 v50 = 2114;
    double v51 = v16;
    __int16 v52 = 1026;
    LODWORD(v53) = v43;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s rcEpFeatures: %{public}@ shouldAccept: %{public}d", buf, 0x1Cu);
  }
  ((void (**)(id, id, void *))v14)[2](v14, v43, v17);
  self->_hasAcceptedEagerResult = (char)v43;
LABEL_11:
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_1000E2C34;
  v15[4] = sub_1000E2C44;
  id v16 = 0;
  asrFeaturesQueue = self->_asrFeaturesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7E84;
  block[3] = &unk_100253A90;
  block[4] = self;
  void block[5] = v15;
  dispatch_async_and_wait(asrFeaturesQueue, block);
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E7E98;
  v10[3] = &unk_100251480;
  double v13 = a3;
  id v11 = v6;
  id v12 = v15;
  v10[4] = self;
  id v9 = v6;
  dispatch_async(hybridClassifierQueue, v10);

  _Block_object_dispose(v15, 8);
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v9 totalAudioRecorded];
  uint64_t v11 = v10;
  id v12 = [v9 asrFeaturesAtEndpoint];
  double v13 = [v9 osdFeaturesAtEndpoint];

  hybridClassifierQueue = self->_hybridClassifierQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E7FDC;
  v18[3] = &unk_100251458;
  v18[4] = self;
  id v19 = v12;
  double v22 = a3;
  uint64_t v23 = v11;
  id v20 = v13;
  id v21 = v8;
  id v15 = v8;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(hybridClassifierQueue, v18);
}

- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  [v6 totalAudioRecorded];
  uint64_t v8 = v7;
  id v9 = [v6 asrFeaturesAtEndpoint];
  uint64_t v10 = [v6 osdFeaturesAtEndpoint];
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E8138;
  v15[3] = &unk_100251430;
  v15[4] = self;
  id v16 = v9;
  double v19 = a3;
  uint64_t v20 = v8;
  id v17 = v10;
  float v18 = &v21;
  id v12 = v10;
  id v13 = v9;
  dispatch_async_and_wait(hybridClassifierQueue, v15);
  LOBYTE(hybridClassifierQueue) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)hybridClassifierQueue;
}

- (void)_swapEnhancedEndpointerModelForTaskString:(id)a3
{
  id v4 = (char *)a3;
  if (self->_recordingDidStop)
  {
    BOOL v5 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      __int16 v17 = 2080;
      float v18 = "Don't switch enhanced endpointer models";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_13;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  taskEnhancedEndpointerMap = self->_taskEnhancedEndpointerMap;
  if (!taskEnhancedEndpointerMap)
  {
    uint64_t v10 = CSLogCategoryEP;
    if (!os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    int v15 = 136315138;
    id v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
    id v12 = "%s Expected _taskEnhancedEndpointerMap to be non-nil.";
    id v13 = v10;
    uint32_t v14 = 12;
LABEL_17:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v15, v14);
    goto LABEL_13;
  }
  uint64_t v7 = [(NSDictionary *)taskEnhancedEndpointerMap objectForKey:v4];
  if (!v7)
  {
    uint64_t v7 = [(NSDictionary *)self->_taskEnhancedEndpointerMap objectForKey:@"SearchOrMessaging"];
    uint64_t v8 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      id v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      __int16 v17 = 2114;
      float v18 = v4;
      __int16 v19 = 2114;
      CFStringRef v20 = @"SearchOrMessaging";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s No enhanced endpointer model for task %{public}@, falling back to default task %{public}@", (uint8_t *)&v15, 0x20u);
    }
    if (!v7)
    {
      uint64_t v11 = CSLogCategoryEP;
      if (!os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_FAULT)) {
        goto LABEL_13;
      }
      int v15 = 136315650;
      id v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      __int16 v17 = 2114;
      float v18 = v4;
      __int16 v19 = 2114;
      CFStringRef v20 = @"SearchOrMessaging";
      id v12 = "%s Unable to find enhanced endpointer model for task %{public}@ or default task %{public}@";
      id v13 = v11;
      uint32_t v14 = 32;
      goto LABEL_17;
    }
  }
  objc_storeStrong((id *)&self->_enhancedEndpointer, v7);
  id v9 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    id v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
    __int16 v17 = 2114;
    float v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Swapping enhanced endpointer model to model for %{public}@ (or default)", (uint8_t *)&v15, 0x16u);
  }

LABEL_13:
}

- (void)_processEnhancedEndpointerTaskString:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  asrFeaturesQueue = self->_asrFeaturesQueue;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  float v18 = sub_1000E875C;
  __int16 v19 = &unk_1002513E0;
  CFStringRef v20 = self;
  id v6 = v4;
  id v21 = v6;
  double v22 = &v38;
  uint64_t v23 = &v34;
  char v24 = &v30;
  id v25 = &v26;
  dispatch_async_and_wait(asrFeaturesQueue, &v16);
  if (*((float *)v39 + 6) > 0.0 && *((float *)v35 + 6) > 0.0)
  {
    -[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:](self, "_swapEnhancedEndpointerModelForTaskString:", v6, v16, v17, v18, v19, v20);
    LODWORD(v7) = *((_DWORD *)v39 + 6);
    LODWORD(v8) = *((_DWORD *)v35 + 6);
    LODWORD(v9) = *((_DWORD *)v31 + 6);
    LODWORD(v10) = *((_DWORD *)v27 + 6);
    [(CSHybridEndpointer *)self updateEnhancedEndpointerDefaultThresholdPartial:v7 defaultThresholdRC:v8 relaxedThresholdPartial:v9 relaxedThresholdRC:v10];
    uint64_t v11 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = *((float *)v39 + 6);
      double v13 = *((float *)v35 + 6);
      double v14 = *((float *)v31 + 6);
      double v15 = *((float *)v27 + 6);
      *(_DWORD *)buf = 136316418;
      id v43 = "-[CSHybridEndpointer _processEnhancedEndpointerTaskString:]";
      __int16 v44 = 2114;
      id v45 = v6;
      __int16 v46 = 2050;
      double v47 = v12;
      __int16 v48 = 2050;
      double v49 = v13;
      __int16 v50 = 2050;
      double v51 = v14;
      __int16 v52 = 2050;
      double v53 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Updated enhanced endpointer thresholds for task %{public}@ - defaultThresholdPartial: %{public}f, defaultThresholdRC: %{public}f, relaxedThresholdPartial: %{public}f, relaxedThresholdRC: %{public}f", buf, 0x3Eu);
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)processTaskString:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E8A04;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v6 = a3;
  double v7 = CSLogCategoryEP;
  if (self->_recordingDidStop)
  {
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer processASRFeatures:fromServer:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Don't process ASR features";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer processASRFeatures:fromServer:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s EARSPG: CSASRFeatures: %{public}@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v16 = 0;
    stateSerialQueue = self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E8F6C;
    block[3] = &unk_100253A90;
    block[4] = self;
    void block[5] = buf;
    dispatch_async_and_wait(stateSerialQueue, block);
    id v9 = [v6 processedAudioDurationInMilliseconds];
    if (*(double *)(*(void *)&buf[8] + 24) <= (double)(uint64_t)v9)
    {
      asrFeaturesQueue = self->_asrFeaturesQueue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000E8F80;
      v11[3] = &unk_1002537C0;
      v11[4] = self;
      BOOL v13 = a4;
      id v12 = v6;
      dispatch_async(asrFeaturesQueue, v11);
    }
    _Block_object_dispose(buf, 8);
  }
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E9190;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(stateSerialQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  BOOL v5 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[CSHybridEndpointer setEndpointerOperationMode:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  stateSerialQueue = self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E9394;
  v7[3] = &unk_100253B58;
  void v7[4] = self;
  void v7[5] = a3;
  dispatch_async(stateSerialQueue, v7);
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  if (self->_recordingDidStop)
  {
    int64_t v3 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v8 = "-[CSHybridEndpointer updateEndpointerDelayedTrigger:]";
      __int16 v9 = 2080;
      double v10 = "Don't update trigger switch";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    hybridClassifierQueue = self->_hybridClassifierQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000E9604;
    v5[3] = &unk_100253AB8;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async(hybridClassifierQueue, v5);
  }
}

- (void)_updateEndpointerDelayedTriggerByMhId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 1000;
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E97E8;
  v7[3] = &unk_100253A90;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_async_and_wait(asrFeaturesQueue, v7);
  unint64_t v6 = (unint64_t)[v4 hash];
  if (v6 % v9[3] == 1) {
    [(CSHybridEndpointer *)self updateEndpointerDelayedTrigger:1];
  }
  _Block_object_dispose(&v8, 8);
}

- (void)updateEnhancedEndpointerDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6
{
  if (self->_recordingDidStop)
  {
    unint64_t v6 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v14 = "-[CSHybridEndpointer updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPart"
            "ial:relaxedThresholdRC:]";
      __int16 v15 = 2080;
      uint64_t v16 = "Don't update thresholds";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    hybridClassifierQueue = self->_hybridClassifierQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E9924;
    block[3] = &unk_1002513B8;
    block[4] = self;
    float v9 = a3;
    float v10 = a4;
    float v11 = a5;
    float v12 = a6;
    dispatch_async(hybridClassifierQueue, block);
  }
}

- (void)updateEndpointerThreshold:(float)a3
{
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E9A98;
  v4[3] = &unk_1002533A8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(hybridClassifierQueue, v4);
}

- (void)_updateCurrentAsset:(id)a3
{
  float v5 = (CSAsset *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  currentAsset = self->_currentAsset;
  double v7 = CSLogCategoryEP;
  BOOL v8 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
  if (currentAsset == v5)
  {
    if (v8)
    {
      int v9 = 136315138;
      float v10 = "-[CSHybridEndpointer _updateCurrentAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s New asset is the same as current asset - no update needed.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      int v9 = 136315138;
      float v10 = "-[CSHybridEndpointer _updateCurrentAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Updating current asset.", (uint8_t *)&v9, 0xCu);
    }
    objc_storeStrong((id *)&self->_currentAsset, a3);
    [(CSHybridEndpointer *)self _readParametersFromHEPAsset:self->_currentAsset];
  }
}

- (NSString)endpointerModelVersion
{
  endpointerModelVersion = self->_endpointerModelVersion;
  if (!endpointerModelVersion)
  {
    stateSerialQueue = self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E9D44;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async_and_wait(stateSerialQueue, block);
    endpointerModelVersion = self->_endpointerModelVersion;
  }
  return endpointerModelVersion;
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  float v5 = a4;
  if (v5)
  {
    uint64_t v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[a3 UTF8String], 0, v5);
  }
  else
  {
    uint64_t v6 = +[CSUtils getSerialQueueWithQOS:33 name:a3 fixedPriority:kCSDefaultSerialQueueFixedPriority];
  }
  double v7 = (void *)v6;

  return v7;
}

- (CSHybridEndpointer)init
{
  v37.receiver = self;
  v37.super_class = (Class)CSHybridEndpointer;
  v2 = [(CSHybridEndpointer *)&v37 init];
  int64_t v3 = v2;
  if (v2)
  {
    v2->_didCommunicateEndpoint = 0;
    v2->_speechEndpointDetected = 0;
    v2->_recordingDidStop = 0;
    v2->_lastEndpointPosterior = 0.0;
    v2->_endpointerOperationMode = 0;
    id v4 = 0;
    if ((+[CSUtils supportsDispatchWorkloop] & 1) == 0)
    {
      id v4 = +[CSUtils rootQueueWithFixedPriority:kCSDefaultSerialQueueFixedPriority];
    }
    float v5 = [(id)objc_opt_class() description];
    uint64_t v6 = [v5 lowercaseString];
    double v7 = +[NSString stringWithFormat:@"com.apple.cs.%@.stateserialqueue", v6];

    uint64_t v8 = [(CSHybridEndpointer *)v3 _getSerialQueueWithName:v7 targetQueue:v4];
    stateSerialQueue = v3->_stateSerialQueue;
    v3->_stateSerialQueue = (OS_dispatch_queue *)v8;

    float v10 = [(id)objc_opt_class() description];
    float v11 = [v10 lowercaseString];
    float v12 = +[NSString stringWithFormat:@"com.apple.cs.%@.asrFeaturesQueue", v11];

    uint64_t v13 = [(CSHybridEndpointer *)v3 _getSerialQueueWithName:v12 targetQueue:v4];
    asrFeaturesQueue = v3->_asrFeaturesQueue;
    v3->_asrFeaturesQueue = (OS_dispatch_queue *)v13;

    __int16 v15 = v3->_stateSerialQueue;
    block = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    uint64_t v34 = sub_1000EA27C;
    double v35 = &unk_100253AE0;
    uint64_t v16 = v3;
    uint64_t v36 = v16;
    dispatch_async(v15, &block);
    uint64_t v17 = [(id)objc_opt_class() description];
    float v18 = [v17 lowercaseString];
    __int16 v19 = +[NSString stringWithFormat:@"com.apple.cs.%@.hybridClassifierfQueue", v18, block, v33, v34, v35];

    uint64_t v20 = [(CSHybridEndpointer *)v16 _getSerialQueueWithName:v19 targetQueue:v4];
    hybridClassifierQueue = v16->_hybridClassifierQueue;
    v16->_hybridClassifierQueue = (OS_dispatch_queue *)v20;

    +[CSConfig inputRecordingSampleRate];
    v16->_currentRequestSampleRate = (unint64_t)v22;
    uint64_t v23 = +[CSASRFeatures initialASRFeatures];
    lastKnownASRFeatures = v16->_lastKnownASRFeatures;
    v16->_lastKnownASRFeatures = (CSASRFeatures *)v23;

    *(int64x2_t *)&v16->_lastKnownASRFeatureLatency = vdupq_n_s64(0xBF847AE147AE147BLL);
    v16->_epResult = 0;
    id v25 = (OSDFeatures *)[objc_alloc((Class)OSDFeatures) initWithSilenceFramesCountMs:0.0 silenceProbability:0.0 silenceDurationMs:0.0 processedAudioMs:0.0];
    lastKnownOSDFeatures = v16->_lastKnownOSDFeatures;
    v16->_lastKnownOSDFeatures = v25;

    *(_OWORD *)&v16->_double clientLagThresholdMs = xmmword_1001AC6C0;
    v16->_BOOL useDefaultASRFeaturesOnClientLag = 1;
    taskThresholdMap = v16->_taskThresholdMap;
    v16->_extraDelayFrequency = 1000;
    v16->_taskThresholdMap = 0;

    enhancedEndpointerTaskThresholdMap = v16->_enhancedEndpointerTaskThresholdMap;
    v16->_enhancedEndpointerTaskThresholdMap = 0;

    uint64_t v29 = +[CSASRFeatures initialResultCandidateFeatures];
    lastKnownRCFeatures = v16->_lastKnownRCFeatures;
    v16->_lastKnownRCFeatures = (CSASRFeatures *)v29;

    *(_WORD *)&v16->_hasAcceptedEagerResult = 0;
  }
  return v3;
}

@end