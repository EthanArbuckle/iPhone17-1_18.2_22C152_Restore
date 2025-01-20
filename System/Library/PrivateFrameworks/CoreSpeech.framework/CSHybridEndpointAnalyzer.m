@interface CSHybridEndpointAnalyzer
- (BOOL)_multimodalEndpointerEnabled;
- (BOOL)_shouldProvideTwoShotFeedbackWithRecordContext;
- (BOOL)canProcessCurrentRequest;
- (BOOL)didAddAudio;
- (BOOL)didCommunicateEndpoint;
- (BOOL)didDetectSpeech;
- (BOOL)didNotifyTwoShot;
- (BOOL)didReceiveASRFeatures;
- (BOOL)didTimestampFirstAudioPacket;
- (BOOL)epResult;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeout;
- (BOOL)recordingDidStop;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)speechEndpointDetected;
- (BOOL)useDefaultASRFeaturesOnClientLag;
- (CSASRFeatures)lastKnownASRFeatures;
- (CSAsset)currentAsset;
- (CSAudioRecordContext)recordContext;
- (CSEndpointAnalyzerDelegate)delegate;
- (CSEndpointAnalyzerImplDelegate)implDelegate;
- (CSHybridEndpointAnalyzer)init;
- (NSDate)firstAudioPacketTimestamp;
- (NSDate)lastASRFeatureTimestamp;
- (NSMutableArray)asrFeatureLatencies;
- (NSString)endpointerModelVersion;
- (NSString)mhId;
- (OSDAnalyzer)osdAnalyzer;
- (OSDFeatures)lastKnownOSDFeatures;
- (OSDFeatures)osdFeaturesAtEndpoint;
- (OS_dispatch_queue)apQueue;
- (OS_dispatch_queue)asrFeaturesQueue;
- (OS_dispatch_queue)hybridClassifierQueue;
- (OS_dispatch_queue)osdQueue;
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
- (int64_t)fetchCurrentEndpointerOperationMode;
- (unint64_t)activeChannel;
- (unint64_t)anchorMachAbsTime;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)numSamplesProcessed;
- (unint64_t)numSamplesProcessedBeforeAnchorTime;
- (unint64_t)vtEndInSampleCount;
- (void)CSAssetManagerDidDownloadNewAsset:(id)a3;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)_emitEndpointDetectedEventWithEndpointTimeMs:(double)a3 endpointBufferHostTime:(unint64_t)a4 endpointerFeatures:(id)a5 endpointerDecisionLagInNs:(double)a6 extraDelayMs:(unint64_t)a7 endpointScore:(double)a8 asrFeaturesLatencies:(id)a9;
- (void)_loadAndSetupEndpointerAssetIfNecessary;
- (void)_readParametersFromHEPAsset:(id)a3;
- (void)_updateAssetWithCurrentLanguage;
- (void)_updateAssetWithLanguage:(id)a3;
- (void)handleVoiceTriggerWithActivationInfo:(id)a3;
- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnchorMachAbsTime:(unint64_t)a3;
- (void)setApQueue:(id)a3;
- (void)setAsrFeatureLatencies:(id)a3;
- (void)setAsrFeaturesQueue:(id)a3;
- (void)setAsrFeaturesWarmupLatency:(double)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setCanProcessCurrentRequest:(BOOL)a3;
- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3;
- (void)setClientLagThresholdMs:(double)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAddAudio:(BOOL)a3;
- (void)setDidCommunicateEndpoint:(BOOL)a3;
- (void)setDidDetectSpeech:(BOOL)a3;
- (void)setDidNotifyTwoShot:(BOOL)a3;
- (void)setDidReceiveASRFeatures:(BOOL)a3;
- (void)setDidTimestampFirstAudioPacket:(BOOL)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointStyle:(int64_t)a3;
- (void)setEndpointerModelVersion:(id)a3;
- (void)setEpResult:(BOOL)a3;
- (void)setFirstAudioPacketTimestamp:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setHepAudioOriginInMs:(double)a3;
- (void)setHybridClassifier:(id)a3;
- (void)setHybridClassifierQueue:(id)a3;
- (void)setImplDelegate:(id)a3;
- (void)setInterspeechWaitTime:(double)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeout:(BOOL)a3;
- (void)setLastASRFeatureTimestamp:(id)a3;
- (void)setLastEndpointPosterior:(float)a3;
- (void)setLastKnownASRFeatureLatency:(double)a3;
- (void)setLastKnownASRFeatures:(id)a3;
- (void)setLastKnownOSDFeatures:(id)a3;
- (void)setLastReportedEndpointTimeMs:(double)a3;
- (void)setMhId:(id)a3;
- (void)setMinimumDurationForEndpointer:(double)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3;
- (void)setOsdAnalyzer:(id)a3;
- (void)setOsdFeaturesAtEndpoint:(id)a3;
- (void)setOsdQueue:(id)a3;
- (void)setPostVoiceTriggerSilence:(double)a3;
- (void)setProcessedAudioInSeconds:(double)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingDidStop:(BOOL)a3;
- (void)setSaveSamplesSeenInReset:(BOOL)a3;
- (void)setSpeechEndpointDetected:(BOOL)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setStateSerialQueue:(id)a3;
- (void)setTwoShotSilenceThresholdInMs:(double)a3;
- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)stopEndpointer;
- (void)terminateProcessing;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
@end

@implementation CSHybridEndpointAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osdQueue, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketTimestamp, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_hybridClassifierQueue, 0);
  objc_storeStrong((id *)&self->_lastASRFeatureTimestamp, 0);
  objc_storeStrong((id *)&self->_asrFeatureLatencies, 0);
  objc_storeStrong((id *)&self->_lastKnownOSDFeatures, 0);
  objc_storeStrong((id *)&self->_lastKnownASRFeatures, 0);
  objc_storeStrong((id *)&self->_asrFeaturesQueue, 0);
  objc_storeStrong((id *)&self->_endpointerModelVersion, 0);
  objc_storeStrong((id *)&self->_hybridClassifier, 0);
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_osdAnalyzer, 0);
  objc_storeStrong((id *)&self->_apQueue, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_implDelegate);
  objc_destroyWeak((id *)&self->_delegate);
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

- (void)setOsdQueue:(id)a3
{
}

- (OS_dispatch_queue)osdQueue
{
  return self->_osdQueue;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
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

- (void)setLastKnownASRFeatureLatency:(double)a3
{
  self->_lastKnownASRFeatureLatency = a3;
}

- (double)lastKnownASRFeatureLatency
{
  return self->_lastKnownASRFeatureLatency;
}

- (void)setAsrFeatureLatencies:(id)a3
{
}

- (NSMutableArray)asrFeatureLatencies
{
  return self->_asrFeatureLatencies;
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

- (void)setOsdAnalyzer:(id)a3
{
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setDidAddAudio:(BOOL)a3
{
  self->_didAddAudio = a3;
}

- (BOOL)didAddAudio
{
  return self->_didAddAudio;
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

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setApQueue:(id)a3
{
}

- (OS_dispatch_queue)apQueue
{
  return self->_apQueue;
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

  v6 = [(id)v5 stringByAppendingPathComponent:v4];

  v7 = +[NSFileManager defaultManager];
  LOBYTE(v5) = [v7 fileExistsAtPath:v6];

  if (v5)
  {
    v8 = +[NSData dataWithContentsOfFile:v6];
    if (v8)
    {
      id v16 = 0;
      v9 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v16];
      id v10 = v16;
      if (v10)
      {
        v11 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
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
      v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
        __int16 v19 = 2114;
        v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }
      id v12 = 0;
    }
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
      __int16 v19 = 2114;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

- (void)_updateAssetWithCurrentLanguage
{
  id v4 = +[CSAssetManager sharedManager];
  id v3 = [v4 currentLanguageCode];
  [(CSHybridEndpointAnalyzer *)self _updateAssetWithLanguage:v3];
}

- (void)_updateAssetWithLanguage:(id)a3
{
  id v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000996B8;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(stateSerialQueue, v7);
}

- (void)CSAssetManagerDidDownloadNewAsset:(id)a3
{
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSHybridEndpointAnalyzer CSAssetManagerDidDownloadNewAsset:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s New hybrid endpoint asset downloaded", (uint8_t *)&v5, 0xCu);
  }
  [(CSHybridEndpointAnalyzer *)self _updateAssetWithCurrentLanguage];
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSHybridEndpointAnalyzer CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Language changed to: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(CSHybridEndpointAnalyzer *)self _updateAssetWithLanguage:v5];
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
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100099A14;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(asrFeaturesQueue, v7);
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  int v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  self->_recordingDidStop = 0;
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2114;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s sampleRate=%{public}lu, recordContext=%{public}@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v32 = sub_10009A060;
  v33 = sub_10009A070;
  id v34 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A078;
  block[3] = &unk_1002523B8;
  block[4] = self;
  id v10 = v7;
  v25 = v10;
  v26 = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v27 = 136315394;
    *(void *)&v27[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s CSEndpointAsset exists: %{public}@", v27, 0x16u);
  }
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = +[CSAssetManager sharedManager];
      v15 = [v14 currentLanguageCode];
      *(_DWORD *)v27 = 136315394;
      *(void *)&v27[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s No asset for CSHybridEndpointer for currentLanguage: %{public}@. Fallback to VAD2", v27, 0x16u);
    }
  }
  apQueue = self->_apQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10009A0D4;
  v23[3] = &unk_100253A90;
  v23[4] = self;
  v23[5] = buf;
  dispatch_async(apQueue, v23);
  *(void *)v27 = 0;
  *(void *)&v27[8] = v27;
  *(void *)&v27[16] = 0x3032000000;
  v28 = sub_10009A060;
  v29 = sub_10009A070;
  id v30 = 0;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10009A2C4;
  v22[3] = &unk_100250420;
  v22[4] = self;
  v22[5] = buf;
  v22[6] = v27;
  v22[7] = a3;
  dispatch_async_and_wait(hybridClassifierQueue, v22);
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10009A618;
  v21[3] = &unk_100253A90;
  v21[4] = self;
  v21[5] = v27;
  dispatch_async_and_wait(asrFeaturesQueue, v21);
  __int16 v19 = self->_stateSerialQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009A7B0;
  v20[3] = &unk_100253B58;
  v20[4] = self;
  v20[5] = a3;
  dispatch_async_and_wait(v19, v20);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(buf, 8);
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  return 0;
}

- (void)stopEndpointer
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSHybridEndpointAnalyzer stopEndpointer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSHybridEndpointAnalyzer *)self terminateProcessing];
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSHybridEndpointAnalyzer recordingStoppedForReason:]";
    __int16 v8 = 2050;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointAnalyzer recordingStoppedForReason: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  [(CSHybridEndpointAnalyzer *)self terminateProcessing];
}

- (void)terminateProcessing
{
  self->_recordingDidStop = 1;
  apQueue = self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009AA38;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(apQueue, block);
}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009AAE4;
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
  block[2] = sub_10009ADC8;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(stateSerialQueue, block);
}

- (void)_emitEndpointDetectedEventWithEndpointTimeMs:(double)a3 endpointBufferHostTime:(unint64_t)a4 endpointerFeatures:(id)a5 endpointerDecisionLagInNs:(double)a6 extraDelayMs:(unint64_t)a7 endpointScore:(double)a8 asrFeaturesLatencies:(id)a9
{
  id v16 = a5;
  id v43 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  if (self->_mhId)
  {
    id v17 = objc_alloc_init((Class)MHSchemaMHEndpointFeaturesAtEndpoint);
    objc_msgSend(v17, "setWordCount:", objc_msgSend(v16, "wordCount"));
    *(float *)&double v18 = (float)(uint64_t)[v16 trailingSilenceDuration];
    objc_msgSend(v17, "setTrailingSilenceDurationInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v18));
    [v16 clientSilenceFramesCountMs];
    *(float *)&double v19 = v19;
    objc_msgSend(v17, "setClientSilenceFramesCountInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v19));
    [v16 endOfSentenceLikelihood];
    *(float *)&double v20 = v20;
    [v17 setEndOfSentenceLikelihood:v20];
    [v16 serverFeaturesLatency];
    objc_msgSend(v17, "setServerFeaturesLatencyInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:"));
    [v16 clientSilenceProbability];
    *(float *)&double v21 = v21;
    [v17 setClientSilenceProbability:v21];
    *(void *)&long long v66 = 0;
    *((void *)&v66 + 1) = &v66;
    uint64_t v67 = 0x3032000000;
    v68 = sub_10009A060;
    v69 = sub_10009A070;
    id v70 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = 0;
    uint64_t v54 = 0;
    v55 = (double *)&v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    uint64_t v50 = 0;
    v51 = (double *)&v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    stateSerialQueue = self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009BA64;
    block[3] = &unk_1002514D0;
    block[4] = self;
    void block[5] = &v66;
    block[6] = &v58;
    block[7] = &v54;
    block[8] = &v50;
    dispatch_async_and_wait(stateSerialQueue, block);
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    apQueue = self->_apQueue;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10009BAD8;
    v44[3] = &unk_100253A90;
    v44[4] = self;
    v44[5] = &v45;
    dispatch_async_and_wait(apQueue, v44);
    id v42 = objc_alloc_init((Class)SISchemaVersion);
    v24 = [*(id *)(*((void *)&v66 + 1) + 40) configVersion];
    v25 = [v24 componentsSeparatedByString:@"."];

    if ([v25 count] == (id)2)
    {
      v26 = [v25 objectAtIndexedSubscript:0];
      objc_msgSend(v42, "setMajor:", objc_msgSend(v26, "intValue"));

      v27 = [v25 objectAtIndexedSubscript:1];
      objc_msgSend(v42, "setMinor:", objc_msgSend(v27, "intValue"));
    }
    v28 = +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:v43];
    id v29 = objc_alloc_init((Class)MHSchemaMHEndpointerTimeoutMetadata);
    [v29 setIsTimeout:self->_isRequestTimeout];
    id v30 = objc_alloc_init((Class)MHSchemaMHEndpointDetected);
    [v30 setEndpointerType:3];
    *(float *)&double v31 = a3;
    objc_msgSend(v30, "setEndpointAudioDurationInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v31));
    objc_msgSend(v30, "setFirstBufferTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v59[3]));
    objc_msgSend(v30, "setEndpointedBufferTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", a4));
    [v30 setEndpointFeaturesAtEndpoint:v17];
    *(float *)&double v32 = a6;
    objc_msgSend(v30, "setEndpointerDecisionLagInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v32));
    *(float *)&double v33 = (float)a7;
    objc_msgSend(v30, "setExtraDelayInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v33));
    [v30 setEndpointModelConfigVersion:v42];
    [v30 setDerivedBufferTimeFromHistoricalAudio:*((unsigned __int8 *)v46 + 24)];
    double v34 = v51[3];
    *(float *)&double v34 = v34;
    objc_msgSend(v30, "setAudioSkippedDurationInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v34));
    double v35 = v55[3];
    *(float *)&double v35 = v35;
    objc_msgSend(v30, "setEndpointResetPositionInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v35));
    *(float *)&double v36 = a8;
    [v30 setEndpointerScore:v36];
    [v30 setAsrFeatureLatencyDistribution:v28];
    [v30 setTimeoutMetadata:v29];
    v37 = +[CSEndpointLoggingHelper getMHClientEventByMhUUID:self->_mhId];
    [v37 setEndpointDetected:v30];
    v38 = +[AssistantSiriAnalytics sharedStream];
    [v38 emitMessage:v37];

    v39 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      *(_DWORD *)buf = 136315394;
      v63 = "-[CSHybridEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTimeMs:endpointBufferHostTime:endpointerFea"
            "tures:endpointerDecisionLagInNs:extraDelayMs:endpointScore:asrFeaturesLatencies:]";
      __int16 v64 = 2112;
      v65 = mhId;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@", buf, 0x16u);
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v66, 8);
  }
  else
  {
    v41 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v66) = 136315138;
      *(void *)((char *)&v66 + 4) = "-[CSHybridEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTimeMs:endpointBu"
                                      "fferHostTime:endpointerFeatures:endpointerDecisionLagInNs:extraDelayMs:endpointSco"
                                      "re:asrFeaturesLatencies:]";
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v66, 0xCu);
    }
  }
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009BB84;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
}

- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_recordingDidStop)
  {
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s HEP::RecordingDidStop: Ignoring silenceScoreEstimateAvailable, Not queuing", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    [v7 processedAudioMs];
    float v11 = v10;
    [v8 silenceDurationMs];
    double v13 = v12;
    uint64_t v14 = qword_1002A3848;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A3848, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      uint64_t v14 = qword_1002A3848;
    }
    qword_1002A3848 = v14 + 1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0;
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    stateSerialQueue = self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009C038;
    block[3] = &unk_1002514F8;
    block[4] = self;
    void block[5] = &v42;
    block[6] = v40;
    block[7] = &buf;
    float v39 = v11;
    dispatch_async_and_wait(stateSerialQueue, block);
    uint64_t v34 = 0;
    double v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    if (CSIsHorseman()) {
      *((unsigned char *)v35 + 24) = 1;
    }
    float v16 = v13;
    id v17 = self->_stateSerialQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10009C080;
    v33[3] = &unk_100253A90;
    v33[4] = self;
    v33[5] = &v34;
    dispatch_async_and_wait(v17, v33);
    if (*((unsigned char *)v35 + 24) && !self->_didDetectSpeech)
    {
      double v18 = self->_stateSerialQueue;
      if (v11 <= 300.0 || v16 >= 0.001)
      {
        double v19 = v30;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10009C194;
        v30[3] = &unk_1002533A8;
        v30[4] = self;
        float v31 = v11;
      }
      else
      {
        double v19 = v32;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10009C0BC;
        v32[3] = &unk_100253A90;
        v32[4] = self;
        v32[5] = &buf;
      }
      dispatch_async_and_wait(v18, v19);
    }
    if (*((unsigned char *)v43 + 24))
    {
      double v20 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 136315394;
        uint64_t v47 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]";
        __int16 v48 = 2050;
        double v49 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Already communicated end-pt: Not scheduling work for hybridClassifierQueue for silposnf=%{public}f", v46, 0x16u);
      }
    }
    else
    {
      unsigned __int8 v21 = [(CSHybridEndpointAnalyzer *)self _multimodalEndpointerEnabled];
      hybridClassifierQueue = self->_hybridClassifierQueue;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10009C2CC;
      v23[3] = &unk_1002503F8;
      v23[4] = self;
      v25 = &v42;
      float v28 = v16;
      id v24 = v8;
      p_long long buf = &buf;
      v27 = v40;
      unsigned __int8 v29 = v21;
      dispatch_async(hybridClassifierQueue, v23);
    }
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6 = a4;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D8B4;
  block[3] = &unk_100251130;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(hybridClassifierQueue, block);
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v5 = a3;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSHybridEndpointAnalyzer processASRFeatures:fromServer:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s EARSPG: CSASRFeatures: %{public}@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v14 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DFD0;
  block[3] = &unk_100253A90;
  block[4] = self;
  void block[5] = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  id v8 = [v5 processedAudioDurationInMilliseconds];
  if (*(double *)(*(void *)&buf[8] + 24) <= (double)(uint64_t)v8)
  {
    asrFeaturesQueue = self->_asrFeaturesQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009DFE4;
    v10[3] = &unk_100253B08;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(asrFeaturesQueue, v10);
  }
  _Block_object_dispose(buf, 8);
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  BOOL v3 = a3;
  -[_EAREndpointer updateEndpointerDelayedTriggerSwitch:](self->_hybridClassifier, "updateEndpointerDelayedTriggerSwitch:");
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[CSHybridEndpointAnalyzer updateEndpointerDelayedTrigger:]";
    __int16 v7 = 1026;
    BOOL v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Updated endpointer delayed trigger: %{public}d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)updateEndpointerThreshold:(float)a3
{
  -[_EAREndpointer updateEndpointerThresholdWithValue:](self->_hybridClassifier, "updateEndpointerThresholdWithValue:");
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[CSHybridEndpointAnalyzer updateEndpointerThreshold:]";
    __int16 v7 = 2050;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Updated endpointer threshold: %{public}f", (uint8_t *)&v5, 0x16u);
  }
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_recordingDidStop)
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSHybridEndpointAnalyzer processAudioSamplesAsynchronously:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s HEP::RecordingDidStop: Ignoring processAudioSamplesAsynchronously: Not queueing", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    stateSerialQueue = self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009E44C;
    block[3] = &unk_100253B08;
    block[4] = self;
    id v8 = v4;
    id v16 = v8;
    dispatch_async_and_wait(stateSerialQueue, block);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    id v9 = self->_stateSerialQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009E564;
    v14[3] = &unk_100253A90;
    v14[4] = self;
    v14[5] = &buf;
    dispatch_async_and_wait(v9, v14);
    apQueue = self->_apQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009E578;
    v11[3] = &unk_1002523B8;
    v11[4] = self;
    id v12 = v8;
    p_long long buf = &buf;
    dispatch_async(apQueue, v11);

    _Block_object_dispose(&buf, 8);
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
    block[2] = sub_10009E938;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async_and_wait(stateSerialQueue, block);
    endpointerModelVersion = self->_endpointerModelVersion;
  }
  return endpointerModelVersion;
}

- (void)_loadAndSetupEndpointerAssetIfNecessary
{
  currentAsset = self->_currentAsset;
  if (currentAsset)
  {
LABEL_2:
    [(CSHybridEndpointAnalyzer *)self _readParametersFromHEPAsset:currentAsset];
    id v4 = objc_alloc((Class)_EAREndpointer);
    int v5 = [(CSAsset *)self->_currentAsset path];
    id v18 = 0;
    id v6 = [v4 initWithConfiguration:v5 modelVersion:&v18];
    __int16 v7 = (NSString *)v18;

    if (!v7)
    {
      id v8 = +[CSDiagnosticReporter sharedInstance];
      [v8 submitEndpointerIssueReport:kCSDiagnosticReporterEndpointerModelVersionIsNil];

      id v9 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        double v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
        _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s endpointerModelVersion is still nil after fetching it from EAREndpointer", buf, 0xCu);
      }
    }
    endpointerModelVersion = self->_endpointerModelVersion;
    self->_endpointerModelVersion = v7;

    return;
  }
  id v11 = +[CSAssetManager sharedManager];
  id v12 = [v11 assetForCurrentLanguageOfType:1];
  double v13 = self->_currentAsset;
  self->_currentAsset = v12;

  currentAsset = self->_currentAsset;
  uint64_t v14 = CSLogContextFacilityCoreSpeech;
  BOOL v15 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (currentAsset)
  {
    if (v15)
    {
      id v16 = v14;
      id v17 = [(CSAsset *)currentAsset path];
      *(_DWORD *)long long buf = 136315650;
      double v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
      __int16 v21 = 2114;
      id v22 = currentAsset;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s HEP Asset: %{public}@, path: %{public}@", buf, 0x20u);

      currentAsset = self->_currentAsset;
    }
    goto LABEL_2;
  }
  if (v15)
  {
    *(_DWORD *)long long buf = 136315138;
    double v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to get HEP asset", buf, 0xCu);
  }
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  int v5 = a4;
  if (v5)
  {
    uint64_t v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[a3 UTF8String], 0, v5);
  }
  else
  {
    uint64_t v6 = +[CSUtils getSerialQueueWithQOS:33 name:a3 fixedPriority:kCSDefaultSerialQueueFixedPriority];
  }
  __int16 v7 = (void *)v6;

  return v7;
}

- (CSHybridEndpointAnalyzer)init
{
  v47.receiver = self;
  v47.super_class = (Class)CSHybridEndpointAnalyzer;
  v2 = [(CSHybridEndpointAnalyzer *)&v47 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_didCommunicateEndpoint = 0;
    v2->_speechEndpointDetected = 0;
    v2->_didAddAudio = 0;
    v2->_vtEndInSampleCount = 0;
    v2->_numSamplesProcessed = 0;
    v2->_lastEndpointPosterior = 0.0;
    id v4 = 0;
    if ((+[CSUtils supportsDispatchWorkloop] & 1) == 0)
    {
      id v4 = +[CSUtils rootQueueWithFixedPriority:kCSDefaultSerialQueueFixedPriority];
    }
    int v5 = [(id)objc_opt_class() description];
    uint64_t v6 = [v5 lowercaseString];
    __int16 v7 = +[NSString stringWithFormat:@"com.apple.cs.%@.stateserialqueue", v6];

    uint64_t v8 = [(CSHybridEndpointAnalyzer *)v3 _getSerialQueueWithName:v7 targetQueue:v4];
    stateSerialQueue = v3->_stateSerialQueue;
    v3->_stateSerialQueue = (OS_dispatch_queue *)v8;

    id v10 = [(id)objc_opt_class() description];
    id v11 = [v10 lowercaseString];
    id v12 = +[NSString stringWithFormat:@"com.apple.cs.%@.asrFeaturesQueue", v11];

    uint64_t v13 = [(CSHybridEndpointAnalyzer *)v3 _getSerialQueueWithName:v12 targetQueue:v4];
    asrFeaturesQueue = v3->_asrFeaturesQueue;
    v3->_asrFeaturesQueue = (OS_dispatch_queue *)v13;

    BOOL v15 = +[CSLanguageCodeUpdateMonitor sharedInstance];
    [v15 addObserver:v3];

    id v16 = objc_alloc_init(CSAssetDownloadingOption);
    [(CSAssetDownloadingOption *)v16 setAllowEndpointAssetDownloading:1];
    id v17 = +[CSAssetManager sharedManager];
    [v17 setAssetDownloadingOption:v16];

    id v18 = +[CSAssetManager sharedManager];
    [v18 addObserver:v3 forAssetType:1];

    uint64_t v19 = v3->_stateSerialQueue;
    block = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    uint64_t v44 = sub_10009F09C;
    char v45 = &unk_100253AE0;
    double v20 = v3;
    v46 = v20;
    dispatch_async(v19, &block);
    __int16 v21 = [(id)objc_opt_class() description];
    id v22 = [v21 lowercaseString];
    __int16 v23 = +[NSString stringWithFormat:@"com.apple.cs.%@.apQueue", v22, block, v43, v44, v45];

    uint64_t v24 = [(CSHybridEndpointAnalyzer *)v20 _getSerialQueueWithName:v23 targetQueue:v4];
    apQueue = v20->_apQueue;
    v20->_apQueue = (OS_dispatch_queue *)v24;

    v26 = [(id)objc_opt_class() description];
    v27 = [v26 lowercaseString];
    float v28 = +[NSString stringWithFormat:@"com.apple.cs.%@.hybridClassifierfQueue", v27];

    uint64_t v29 = [(CSHybridEndpointAnalyzer *)v20 _getSerialQueueWithName:v28 targetQueue:v4];
    hybridClassifierQueue = v20->_hybridClassifierQueue;
    v20->_hybridClassifierQueue = (OS_dispatch_queue *)v29;

    float v31 = [(id)objc_opt_class() description];
    double v32 = [v31 lowercaseString];
    double v33 = +[NSString stringWithFormat:@"com.apple.cs.%@.osdQueue", v32];

    uint64_t v34 = [(CSHybridEndpointAnalyzer *)v20 _getSerialQueueWithName:v33 targetQueue:v4];
    osdQueue = v20->_osdQueue;
    v20->_osdQueue = (OS_dispatch_queue *)v34;

    +[CSConfig inputRecordingSampleRate];
    v20->_currentRequestSampleRate = (unint64_t)v36;
    char v37 = [[CSASRFeatures alloc] initWithWordCount:0 trailingSilenceDuration:0 eosLikelihood:&__NSArray0__struct pauseCounts:@"SearchOrMessaging" silencePosterior:0 taskName:8.98999977 processedAudioDurationInMilliseconds:0.997685015 acousticEndpointerScore:0.0];
    lastKnownASRFeatures = v20->_lastKnownASRFeatures;
    v20->_lastKnownASRFeatures = v37;

    v20->_lastKnownASRFeatureLatency = -0.01;
    v20->_epResult = 0;
    float v39 = (OSDFeatures *)[objc_alloc((Class)OSDFeatures) initWithSilenceFramesCountMs:0.0 silenceProbability:0.0 silenceDurationMs:0.0 processedAudioMs:0.0];
    lastKnownOSDFeatures = v20->_lastKnownOSDFeatures;
    v20->_lastKnownOSDFeatures = v39;

    *(_OWORD *)&v20->_clientLagThresholdMs = xmmword_1001AC6C0;
    v20->_useDefaultASRFeaturesOnClientLag = 1;
  }
  return v3;
}

@end